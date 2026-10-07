
namespace FVM_WorldEventMinimapIcon
{
    const int ModelId = 0;

}
struct FVM_WorldEventMinimapIcon : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_Spot;
    UPROPERTY()
    TEUIModelRef<FVM_CommonRewardList> m_RewardList;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CommonRewardItem>> m_RewardItemList;
    UPROPERTY()
    bool m_bHaveReward;
    UPROPERTY()
    bool m_bUseBuffReward;
    UPROPERTY()
    FText m_BuffRewardText;
    UPROPERTY()
    FMW_CounterDown m_StatusCountdown;
    UPROPERTY()
    FMW_TimeAccumulator m_InProgressElapsed;
    UPROPERTY()
    FMW_TimeProgress m_StatusProgress;

    FVM_WorldEventMinimapIcon()
    {
        this.m_bHaveReward = false;
        this.m_bUseBuffReward = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_WorldEventMinimapIcon' by default constructor.");
        return;
    }
    FVM_WorldEventMinimapIcon(const FVM_WorldEventMinimapIcon &inout Other)
    {
        this.m_bHaveReward = false;
        this.m_bUseBuffReward = false;
        this.m_Spot = Other.m_Spot;
        this.m_RewardList = Other.m_RewardList;
        this.m_RewardItemList = Other.m_RewardItemList;
        this.m_bHaveReward = Other.m_bHaveReward;
        this.m_bUseBuffReward = Other.m_bUseBuffReward;
        this.m_BuffRewardText = Other.m_BuffRewardText;
        this.m_StatusCountdown = Other.m_StatusCountdown;
        this.m_InProgressElapsed = Other.m_InProgressElapsed;
        this.m_StatusProgress = Other.m_StatusProgress;
        return;
    }
    FVM_WorldEventMinimapIcon(const TEUIModelRef<FM_Spot> &inout InSpot)
    {
        this.m_bHaveReward = false;
        this.m_bUseBuffReward = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSpot(InSpot);
        return;
    }
    FVM_WorldEventMinimapIcon& opAssign(const FVM_WorldEventMinimapIcon &inout Other)
    {
        this.m_Spot = Other.m_Spot;
        this.m_RewardList = Other.m_RewardList;
        this.m_RewardItemList = Other.m_RewardItemList;
        this.m_bHaveReward = Other.m_bHaveReward;
        this.m_bUseBuffReward = Other.m_bUseBuffReward;
        this.m_BuffRewardText = Other.m_BuffRewardText;
        this.m_StatusCountdown = Other.m_StatusCountdown;
        this.m_InProgressElapsed = Other.m_InProgressElapsed;
        return Other.m_StatusProgress;
    }
    void PostConstruct()
    {
        this.SetbHaveReward(false);
        FECSEntity local_6 = FECSEntity(this.GetEntityID());
        Get local_16;
        if (local_16.opCall())
        {
            CastTo local_46;
            TDataObjectPtr<FLevelPublicEventInfoConfig> local_70 = local_46.opCall();
            if (local_70.IsSet())
            {
                this.SetbHaveReward(true);
                this.SetbUseBuffReward(false);
                this.SetRewardList(TEUIModelRef<FVM_CommonRewardList>(::FVM_CommonRewardList::Create(this.GetContext().Manager, ::FCommonRewardListBuilder::BuildFromDropConfig(local_70.opArrow().GetDropRewardView()))));
            }
            else
            {
                if (!(local_70.opArrow().EventRewardBuffDesc.IsEmpty()))
                {
                    this.SetbUseBuffReward(true);
                    this.SetbHaveReward(true);
                    this.SetBuffRewardText(local_70.opArrow().EventRewardBuffDesc);
                }
            }
        }
        return;
    }
    void RefreshEventTimeWatchers()
    {
        FECSEntity local_4 = FECSEntity(this.GetEntityID());
        Get local_14;
        const FC_LevelPublicEventInfo& local_16 = local_14.opCall();
        if (local_16)
        {
            EPublicEventStatus local_18;
            local_18 = local_16.GetStatus();
            FFPTime local_22 = FFPTime(local_16.GetChangeStatusTime());
            FFPTime local_24 = FFPTime(local_16.GetInStatusTime());
            this.GetModify_StatusCountdown().SetRemainedTimeWithPrecision(FFPTime(FMath::Max((local_22 - this.GetContext().Time).ToSeconds(), 0.0)), EMWCounterDownPrecision(0));
            FFPTime local_26_2 = (local_22 - local_24);
            if (local_26_2.ToSeconds() > 0.0)
            {
                this.GetModify_StatusProgress().EndAtSmooth(local_22, local_26_2);
            }
            else
            {
            }
            if ((int(local_18)) == 2)
            {
                this.GetModify_InProgressElapsed().StartAccumulate(FFPTime(FMath::Max((FFPTime(this.GetContext().Time) - local_24).ToSeconds(), 0.0)));
            }
            else
            {
            }
            return;
        }
        return;
    }
    TSoftClassPtr<UEUIUserWidget> GetTooltipWidgetClass() const
    {
        UMarkSettings local_2 = ::MarkUtil::GetMarkConfigSetting();
        return local_2.WorldEventMinimapMarkTips;
    }
    TArray<TEUIModelRef<FVM_CommonRewardItem>> GetMissionRewardItems() const
    {
        if (this.GetRewardList())
        {
            TEUIModelRef<FVM_CommonRewardList> local_2 = this.GetRewardList();
            return GetRewards();
        }
        return TArray<TEUIModelRef<FVM_CommonRewardItem>>();
    }
    FFPTime GetCountdown() const
    {
        return this.GetStatusCountdown().GetRemainedTime();
    }
    float32 GetCountdownPercent() const
    {
        return this.GetStatusProgress().GetRemainingRatio();
    }
    FText GetCountdownText() const
    {
        if (int(this.GetEventStateEnum()) == 2)
        {
            FText local_22;
            FText local_14;
            FTimespan::FromSeconds(this.GetInProgressElapsed().GetAccumulatedTime().ToSeconds());
            FText::AsTimespan(local_14);
            NSLOCTEXT("Minimap", "Icon_WorldEvent_InProgressElapsed", "дє‹д»¶е·Іиї›иЎЊ {0}");
            FText::Format(local_22);
            return local_22;
        }
        if (int(this.GetEventStateEnum()) == 0)
        {
            FText local_22;
            FText local_14;
            FTimespan::FromSeconds(this.GetStatusCountdown().GetRemainedTime().ToSeconds());
            FText::AsTimespan(local_22);
            NSLOCTEXT("Minimap", "Icon_WorldEvent_PrepareCountdown", "<Gray16>и·ќй›†з»“д№‹еЌ°еЅўж€ђ {0}</>");
            FText::Format(local_14);
            return local_14;
        }
        if ((int(this.GetEventStateEnum())) == 1)
        {
            FText local_14;
            NSLOCTEXT(local_14, "Minimap", "Icon_WorldEvent_Countdown_Interactable");
            return local_14;
        }
        return NSLOCTEXT("Minimap", "Icon_WorldEvent_Countdown_Complete", "е·Іе®Њж€ђ");
    }
    bool bMapIconShowCountdownText() const
    {
        if ((int(this.GetEventStateEnum())) == 0)
        {
            return true;
        }
        return false;
    }
    FText GetEventTargetTitle() const
    {
        FECSEntity local_4 = FECSEntity(this.GetEntityID());
        Get local_14;
        if (local_14.opCall())
        {
            CastTo local_46;
            TDataObjectPtr<FLevelEventInfoConfigBase> local_70 = local_46.opCall();
            if (local_70.IsSet())
            {
                if (!(local_70.opArrow().EventTargetTitle.IsEmpty()))
                {
                    return local_70.opArrow().EventTargetTitle;
                }
                const TDataObjectPtr<FPresentationConfig>& local_72 = local_70.opArrow().GetPresentationConfig();
                if (local_72)
                {
                    return local_72.opArrow().Name;
                }
            }
        }
        return FText();
    }
    FText GetDescription() const
    {
        FECSEntity local_4 = FECSEntity(this.GetEntityID());
        Get local_14;
        if (local_14.opCall())
        {
            CastTo local_46;
            TDataObjectPtr<FLevelEventInfoConfigBase> local_70 = local_46.opCall();
            if (local_70.IsSet())
            {
                if (!(local_70.opArrow().EventDescription.IsEmpty()))
                {
                    return local_70.opArrow().EventDescription;
                }
                const TDataObjectPtr<FPresentationConfig>& local_72 = local_70.opArrow().GetPresentationConfig();
                if (local_72)
                {
                    return local_72.opArrow().Description;
                }
            }
        }
        return FText();
    }
    int GetEventState() const
    {
        FECSEntity local_4 = FECSEntity(this.GetEntityID());
        Get local_14;
        const FC_LevelPublicEventInfo& local_16 = local_14.opCall();
        if (local_16)
        {
            return int(local_16.GetStatus());
        }
        return 0;
    }
    EPublicEventStatus GetEventStateEnum() const
    {
        FECSEntity local_4 = FECSEntity(this.GetEntityID());
        Get local_14;
        const FC_LevelPublicEventInfo& local_16 = local_14.opCall();
        if (local_16)
        {
            return local_16.GetStatus();
        }
        return EPublicEventStatus(0);
    }
    FText GetTimerAndStateText() const
    {
        return FText::FromString(this.GetStatusCountdown().GetRemainedTime().ToString());
    }
    bool bLocked() const
    {
        FECSEntity local_4 = FECSEntity(this.GetEntityID());
        Get local_14;
        const FC_LevelPublicEventInfo& local_16 = local_14.opCall();
        if (local_16)
        {
            return (int(local_16.GetStatus()) == 0);
        }
        return false;
    }
    float WaitActiveProgress() const
    {
        if ((int(this.GetEventStateEnum())) == 1)
        {
            return this.GetStatusProgress().GetRemainingRatio();
        }
        return 0.0;
    }
    bool bActive() const
    {
        FECSEntity local_4 = FECSEntity(this.GetEntityID());
        Get local_14;
        const FC_LevelPublicEventInfo& local_16 = local_14.opCall();
        if (local_16)
        {
            return (int(local_16.GetStatus()) == 2);
        }
        return false;
    }
    float ActiveProgress() const
    {
        if ((int(this.GetEventStateEnum())) == 2)
        {
            return this.GetStatusProgress().GetRemainingRatio();
        }
        return 0.0;
    }
    ESlateVisibility GetVisibility() const
    {
        FECSEntity local_4 = FECSEntity(this.GetEntityID());
        Get local_14;
        if (local_14.opCall())
        {
            return ESlateVisibility(4);
        }
        return ESlateVisibility(1);
    }
    bool HasStarted() const
    {
        return (this.GetCountdown().opCmp(0.0) <= 0);
    }
    FSoftBrush GetDisplayIcon() const
    {
        FECSEntity local_4 = FECSEntity(this.GetEntityID());
        Get local_14;
        const FC_PrefabConfig& local_16 = local_14.opCall();
        if (local_16)
        {
            if (local_16.ConfigPtr.IsSet())
            {
                CastTo local_22;
                TDataObjectPtr<FLevelPublicEventInfoConfig> local_46 = local_22.opCall();
                if (local_46)
                {
                    if (local_46.opArrow().GetPresentationConfig())
                    {
                        return ::PresentationSpotDisplayUtils::GetSpotIcon(this.GetSpot(), EPresentationSpotUsage(0));
                    }
                }
                return local_16.ConfigPtr.opArrow().DisplayIcon;
            }
        }
        return FSoftBrush();
    }
    bool CanGuide() const
    {
        return !(this.CanTeleport());
    }
    bool CanTeleport() const
    {
        return FECSEntity(this.GetEntityID()).IsActive();
    }
    bool GetWorldEventData(FWorldEventMinimapIconData &out Data) const
    {
        FWorldEventMinimapIconData local_40;
        Data = local_40;
        Get local_44;
        const FCS_WorldEventMinimapIconManager& local_46 = local_44.opCall();
        if (local_46)
        {
            if (local_46.GetAllWorldEvents().Find(this.GetEntityID(), Data))
            {
                return true;
            }
        }
        return false;
    }
    FECSEntityId GetEntityID() const property
    {
        return ::GetOwnerEntityId(this.GetSpot().opArrow());
    }
    TEUIModelRef<FM_Spot> GetSpot() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Spot;
    }
    void SetSpot(const TEUIModelRef<FM_Spot> &inout __Value) property
    {
        TEUIModelRef<FM_Spot> local_2;
        local_2 = this.m_Spot;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Spot = __Value;
        return;
    }
    TEUIModelRef<FVM_CommonRewardList> GetRewardList() const property
    {
        this.TrackPropertyRead(1);
        return this.m_RewardList;
    }
    void SetRewardList(const TEUIModelRef<FVM_CommonRewardList> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonRewardList> local_2;
        local_2 = this.m_RewardList;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_RewardList = __Value;
        return;
    }
    TArray<TEUIModelRef<FVM_CommonRewardItem>> GetRewardItemList() const property
    {
        TArray<TEUIModelRef<FVM_CommonRewardItem>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<TEUIModelRef<FVM_CommonRewardItem>> GetModify_RewardItemList() property
    {
        TArray<TEUIModelRef<FVM_CommonRewardItem>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetRewardItemList(const TArray<TEUIModelRef<FVM_CommonRewardItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_RewardItemList = __Value;
        return;
    }
    bool GetbHaveReward() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bHaveReward;
    }
    void SetbHaveReward(const bool __Value) property
    {
        if (!(this.m_bHaveReward) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bHaveReward = __Value;
        return;
    }
    bool GetbUseBuffReward() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bUseBuffReward;
    }
    void SetbUseBuffReward(const bool __Value) property
    {
        if (!(this.m_bUseBuffReward) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bUseBuffReward = __Value;
        return;
    }
    const FText GetBuffRewardText() const property
    {
        const FText __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FText GetModify_BuffRewardText() property
    {
        FText __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetBuffRewardText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_BuffRewardText = __Value;
        return;
    }
    const FMW_CounterDown GetStatusCountdown() const property
    {
        const FMW_CounterDown __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FMW_CounterDown GetModify_StatusCountdown() property
    {
        FMW_CounterDown __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetStatusCountdown(const FMW_CounterDown &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_StatusCountdown = __Value;
        return;
    }
    const FMW_TimeAccumulator GetInProgressElapsed() const property
    {
        const FMW_TimeAccumulator __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FMW_TimeAccumulator GetModify_InProgressElapsed() property
    {
        FMW_TimeAccumulator __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetInProgressElapsed(const FMW_TimeAccumulator &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_InProgressElapsed = __Value;
        return;
    }
    const FMW_TimeProgress GetStatusProgress() const property
    {
        const FMW_TimeProgress __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    FMW_TimeProgress GetModify_StatusProgress() property
    {
        FMW_TimeProgress __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetStatusProgress(const FMW_TimeProgress &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_StatusProgress = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_WorldEventMinimapIcon
{
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> TooltipWidgetClass;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CommonRewardItem>> MissionRewardItems;
    UPROPERTY()
    FFPTime Countdown;
    UPROPERTY()
    float32 CountdownPercent;
    UPROPERTY()
    FText CountdownText;
    UPROPERTY()
    bool bMapIconShowCountdownText;
    UPROPERTY()
    FText EventTargetTitle;
    UPROPERTY()
    FText Description;
    UPROPERTY()
    int EventState;
    UPROPERTY()
    EPublicEventStatus EventStateEnum;
    UPROPERTY()
    FText TimerAndStateText;
    UPROPERTY()
    bool bLocked;
    UPROPERTY()
    float WaitActiveProgress;
    UPROPERTY()
    bool bActive;
    UPROPERTY()
    float ActiveProgress;
    UPROPERTY()
    ESlateVisibility Visibility;
    UPROPERTY()
    bool HasStarted;
    UPROPERTY()
    FSoftBrush DisplayIcon;
    UPROPERTY()
    bool CanGuide;
    UPROPERTY()
    bool CanTeleport;
    UPROPERTY()
    TEUIModelRef<FVM_WorldEventMinimapIcon> Self;


}

namespace FVM_WorldEventMinimapIcon
{
FVM_WorldEventMinimapIcon& Create(const UObject ContextObject, const TEUIModelRef<FM_Spot> &inout Spot)
{
    return FVM_WorldEventMinimapIcon::CreateByManager(EUIInternal::GetContextManager(ContextObject), Spot);
}
FVM_WorldEventMinimapIcon CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Spot> &inout Spot)
{
    FVM_WorldEventMinimapIcon __r;
    TEUIModelRef<FVM_WorldEventMinimapIcon> local_6 = TEUIModelRef<FVM_WorldEventMinimapIcon>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_WorldEventMinimapIcon::ModelId, 0, Spot));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "RewardList";
    local_14.TypeName = "TEUIModelRef<FVM_CommonRewardList>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RewardItemList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_CommonRewardItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bHaveReward";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bUseBuffReward";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BuffRewardText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TooltipWidgetClass";
    local_14.TypeName = "TSoftClassPtr<UEUIUserWidget>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MissionRewardItems";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_CommonRewardItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Countdown";
    local_14.TypeName = "FFPTime";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CountdownPercent";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CountdownText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bMapIconShowCountdownText";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EventTargetTitle";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Description";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EventState";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EventStateEnum";
    local_14.TypeName = "EPublicEventStatus";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TimerAndStateText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bLocked";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "WaitActiveProgress";
    local_14.TypeName = "float64";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bActive";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ActiveProgress";
    local_14.TypeName = "float64";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Visibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasStarted";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CanGuide";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CanTeleport";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_WorldEventMinimapIcon>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_WorldEventMinimapIcon;
    FEUIModelWatcherProperty local_19;
    local_19.PropertyName = FName("StatusCountdown");
    int local_2_2 = FVM_WorldEventMinimapIcon::__IndexOf_StatusCountdown();
    Result.WatcherProperties.Add(local_19);
    local_19.PropertyName = FName("InProgressElapsed");
    int local_2_3 = FVM_WorldEventMinimapIcon::__IndexOf_InProgressElapsed();
    Result.WatcherProperties.Add(local_19);
    local_19.PropertyName = FName("StatusProgress");
    int local_2_4 = FVM_WorldEventMinimapIcon::__IndexOf_StatusProgress();
    Result.WatcherProperties.Add(local_19);
    FEUIModelEffectDefine local_26;
    local_26.FunctionName = "RefreshEventTimeWatchers";
    Result.EffectFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_WorldEventMinimapIcon;
}
TEUIModelRef<FVM_CommonRewardList> __UIGetter_RewardList(const FVM_WorldEventMinimapIcon &inout Model)
{
    return Model.GetRewardList();
}
TArray<TEUIModelRef<FVM_CommonRewardItem>> __UIGetter_RewardItemList(const FVM_WorldEventMinimapIcon &inout Model)
{
    return Model.GetRewardItemList();
}
bool __UIGetter_bHaveReward(const FVM_WorldEventMinimapIcon &inout Model)
{
    return Model.GetbHaveReward();
}
bool __UIGetter_bUseBuffReward(const FVM_WorldEventMinimapIcon &inout Model)
{
    return Model.GetbUseBuffReward();
}
FText __UIGetter_BuffRewardText(const FVM_WorldEventMinimapIcon &inout Model)
{
    return Model.GetBuffRewardText();
}
TSoftClassPtr<UEUIUserWidget> __UIGetter_TooltipWidgetClass(const FVM_WorldEventMinimapIcon &inout Model)
{
    return Model.GetTooltipWidgetClass();
}
TArray<TEUIModelRef<FVM_CommonRewardItem>> __UIGetter_MissionRewardItems(const FVM_WorldEventMinimapIcon &inout Model)
{
    return Model.GetMissionRewardItems();
}
FFPTime __UIGetter_Countdown(const FVM_WorldEventMinimapIcon &inout Model)
{
    return Model.GetCountdown();
}
float32 __UIGetter_CountdownPercent(const FVM_WorldEventMinimapIcon &inout Model)
{
    return Model.GetCountdownPercent();
}
FText __UIGetter_CountdownText(const FVM_WorldEventMinimapIcon &inout Model)
{
    return Model.GetCountdownText();
}
bool __UIGetter_bMapIconShowCountdownText(const FVM_WorldEventMinimapIcon &inout Model)
{
    return Model.bMapIconShowCountdownText();
}
FText __UIGetter_EventTargetTitle(const FVM_WorldEventMinimapIcon &inout Model)
{
    return Model.GetEventTargetTitle();
}
FText __UIGetter_Description(const FVM_WorldEventMinimapIcon &inout Model)
{
    return Model.GetDescription();
}
int __UIGetter_EventState(const FVM_WorldEventMinimapIcon &inout Model)
{
    return Model.GetEventState();
}
EPublicEventStatus __UIGetter_EventStateEnum(const FVM_WorldEventMinimapIcon &inout Model)
{
    return Model.GetEventStateEnum();
}
FText __UIGetter_TimerAndStateText(const FVM_WorldEventMinimapIcon &inout Model)
{
    return Model.GetTimerAndStateText();
}
bool __UIGetter_bLocked(const FVM_WorldEventMinimapIcon &inout Model)
{
    return Model.bLocked();
}
float __UIGetter_WaitActiveProgress(const FVM_WorldEventMinimapIcon &inout Model)
{
    return Model.WaitActiveProgress();
}
bool __UIGetter_bActive(const FVM_WorldEventMinimapIcon &inout Model)
{
    return Model.bActive();
}
float __UIGetter_ActiveProgress(const FVM_WorldEventMinimapIcon &inout Model)
{
    return Model.ActiveProgress();
}
ESlateVisibility __UIGetter_Visibility(const FVM_WorldEventMinimapIcon &inout Model)
{
    return Model.GetVisibility();
}
bool __UIGetter_HasStarted(const FVM_WorldEventMinimapIcon &inout Model)
{
    return Model.HasStarted();
}
FSoftBrush __UIGetter_DisplayIcon(const FVM_WorldEventMinimapIcon &inout Model)
{
    return Model.GetDisplayIcon();
}
bool __UIGetter_CanGuide(const FVM_WorldEventMinimapIcon &inout Model)
{
    return Model.CanGuide();
}
bool __UIGetter_CanTeleport(const FVM_WorldEventMinimapIcon &inout Model)
{
    return Model.CanTeleport();
}
TEUIModelRef<FVM_WorldEventMinimapIcon> __UIGetter_Self(const FVM_WorldEventMinimapIcon &inout Model)
{
    return TEUIModelRef<FVM_WorldEventMinimapIcon>(Model);
}
int __IndexOf_Spot()
{
    return 0;
}
int __IndexOf_RewardList()
{
    return 1;
}
int __IndexOf_RewardItemList()
{
    return 2;
}
int __IndexOf_bHaveReward()
{
    return 3;
}
int __IndexOf_bUseBuffReward()
{
    return 4;
}
int __IndexOf_BuffRewardText()
{
    return 5;
}
int __IndexOf_StatusCountdown()
{
    return 6;
}
int __IndexOf_InProgressElapsed()
{
    return 7;
}
int __IndexOf_StatusProgress()
{
    return 8;
}
}
namespace __GeneratedProperties_FVM_WorldEventMinimapIcon
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

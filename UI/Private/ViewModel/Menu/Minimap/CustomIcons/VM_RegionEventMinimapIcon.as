
namespace FVM_RegionEventMinimapIcon
{
    const int ModelId = 0;

}
struct FVM_RegionEventMinimapIcon : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_Spot;
    UPROPERTY()
    TEUIModelRef<FVM_CommonRewardList> m_RewardList;
    UPROPERTY()
    FText m_RewardBuffDesc;
    UPROPERTY()
    FText m_ToolTipTitle;
    UPROPERTY()
    FText m_ToolTipDesc;
    UPROPERTY()
    FSoftBrush m_DungeonIcon;
    UPROPERTY()
    bool m_bHasInit;

    FVM_RegionEventMinimapIcon()
    {
        this.m_bHasInit = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_RegionEventMinimapIcon' by default constructor.");
        return;
    }
    FVM_RegionEventMinimapIcon(const FVM_RegionEventMinimapIcon &inout Other)
    {
        this.m_bHasInit = false;
        this.m_Spot = Other.m_Spot;
        this.m_RewardList = Other.m_RewardList;
        this.m_RewardBuffDesc = Other.m_RewardBuffDesc;
        this.m_ToolTipTitle = Other.m_ToolTipTitle;
        this.m_ToolTipDesc = Other.m_ToolTipDesc;
        this.m_DungeonIcon = Other.m_DungeonIcon;
        this.m_bHasInit = Other.m_bHasInit;
        return;
    }
    FVM_RegionEventMinimapIcon(const TEUIModelRef<FM_Spot> &inout InSpot)
    {
        this.m_bHasInit = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSpot(InSpot);
        return;
    }
    FVM_RegionEventMinimapIcon opAssign(const FVM_RegionEventMinimapIcon &inout Other)
    {
        FVM_RegionEventMinimapIcon __r;
        this.m_Spot = Other.m_Spot;
        this.m_RewardList = Other.m_RewardList;
        this.m_RewardBuffDesc = Other.m_RewardBuffDesc;
        this.m_ToolTipTitle = Other.m_ToolTipTitle;
        this.m_ToolTipDesc = Other.m_ToolTipDesc;
        this.m_DungeonIcon = Other.m_DungeonIcon;
        this.m_bHasInit = Other.m_bHasInit;
        return __r;
    }
    void PostConstruct()
    {
        int local_12 = 0;
        FECSEntity local_4 = FECSEntity(this.GetEntityID());
        TDataObjectPtr<FLevelEventInfoConfigBase> local_36 = local_12.GetEventInfo();
        if (local_36)
        {
            CastTo local_90;
            TDataObjectPtr<FLevelRandomEventInfoConfig> local_114 = local_90.opCall();
            if (local_114)
            {
                this.SetRewardBuffDesc(local_114.opArrow().EventRewardBuffDesc);
            }
            this.SetRewardList(TEUIModelRef<FVM_CommonRewardList>(::FVM_CommonRewardList::Create(this.GetContext().Manager, ::FCommonRewardListBuilder::BuildFromDropConfig(GetDropRewardView()))));
            if (GetPresentationConfig())
            {
                if (local_36.opArrow().EventTargetTitle.IsEmpty())
                {
                }
                else
                {
                }
                this.SetToolTipTitle();
                if (local_36.opArrow().EventDescription.IsEmpty())
                {
                }
                else
                {
                }
                this.SetToolTipDesc();
                this.SetDungeonIcon(::PresentationSpotDisplayUtils::GetSpotIcon(this.GetSpot(), EPresentationSpotUsage(0)));
            }
            else
            {
                this.SetToolTipTitle(local_36.opArrow().EventTargetTitle);
                this.SetToolTipDesc(local_36.opArrow().EventDescription);
                this.SetDungeonIcon(local_36.opArrow().DisplayIcon);
            }
            this.SetbHasInit(true);
        }
        return;
    }
    TSoftClassPtr<UEUIUserWidget> GetTooltipWidgetClass() const
    {
        return ::UICommonUtil::EUIWidgetPathFromString("/Game/MoleRes/Dev/UI/UMG/System/Minimap/CustomIcons/UI_RegionEventMinimapIconTooltip.UI_RegionEventMinimapIconTooltip");
    }
    int GetRewardTypeSwitchIndex() const
    {
        if (this.IsEventFinish())
        {
            return 2;
        }
        else
        {
            if (this.GetRewardBuffDesc().IsEmpty())
            {
                return 0;
            }
            else
            {
                return 1;
            }
        }
    }
    bool IsEventFinish() const
    {
        if (this.GetbHasInit())
        {
            FECSEntity local_6 = FECSEntity(this.GetEntityID());
            Has local_10;
            bool local_1 = local_10.opCall();
            if (local_1)
            {
                FECSEntity local_6_2 = FECSEntity(this.GetEntityID());
                Get local_14;
                return local_14.opCall().GetbIsSuccess();
            }
        }
        return false;
    }
    bool IsEventOnGoing() const
    {
        return !(this.IsEventFinish());
    }
    bool HasAnyReward() const
    {
        bool local_1 = false;
        if (this.GetRewardBuffDesc().IsEmpty())
        {
            TEUIModelRef<FVM_CommonRewardList> local_4 = this.GetRewardList();
            if (local_1)
            {
                TEUIModelRef<FVM_CommonRewardList> local_4_2 = this.GetRewardList();
                if (GetRewards().Num() <= 0)
                {
                    return false;
                }
            }
        }
        return true;
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
    const FText GetRewardBuffDesc() const property
    {
        const FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_RewardBuffDesc() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetRewardBuffDesc(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_RewardBuffDesc = __Value;
        return;
    }
    const FText GetToolTipTitle() const property
    {
        const FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_ToolTipTitle() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetToolTipTitle(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_ToolTipTitle = __Value;
        return;
    }
    const FText GetToolTipDesc() const property
    {
        const FText __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FText GetModify_ToolTipDesc() property
    {
        FText __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetToolTipDesc(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_ToolTipDesc = __Value;
        return;
    }
    FSoftBrush GetDungeonIcon() const property
    {
        FSoftBrush __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FSoftBrush GetModify_DungeonIcon() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetDungeonIcon(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_DungeonIcon = __Value;
        return;
    }
    bool GetbHasInit() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bHasInit;
    }
    void SetbHasInit(const bool __Value) property
    {
        if (!(this.m_bHasInit) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bHasInit = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_RegionEventMinimapIcon
{
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> TooltipWidgetClass;
    UPROPERTY()
    int RewardTypeSwitchIndex;
    UPROPERTY()
    bool IsEventFinish;
    UPROPERTY()
    bool IsEventOnGoing;
    UPROPERTY()
    bool HasAnyReward;
    UPROPERTY()
    TEUIModelRef<FVM_RegionEventMinimapIcon> Self;


}

namespace FVM_RegionEventMinimapIcon
{
FVM_RegionEventMinimapIcon& Create(const UObject ContextObject, const TEUIModelRef<FM_Spot> &inout Spot)
{
    return FVM_RegionEventMinimapIcon::CreateByManager(EUIInternal::GetContextManager(ContextObject), Spot);
}
FVM_RegionEventMinimapIcon CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Spot> &inout Spot)
{
    FVM_RegionEventMinimapIcon __r;
    TEUIModelRef<FVM_RegionEventMinimapIcon> local_6 = TEUIModelRef<FVM_RegionEventMinimapIcon>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_RegionEventMinimapIcon::ModelId, 0, Spot));
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
    local_14.PropertyName = "RewardBuffDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ToolTipTitle";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ToolTipDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DungeonIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TooltipWidgetClass";
    local_14.TypeName = "TSoftClassPtr<UEUIUserWidget>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RewardTypeSwitchIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsEventFinish";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsEventOnGoing";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasAnyReward";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_RegionEventMinimapIcon>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_RegionEventMinimapIcon;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_RegionEventMinimapIcon;
}
TEUIModelRef<FVM_CommonRewardList> __UIGetter_RewardList(const FVM_RegionEventMinimapIcon &inout Model)
{
    return Model.GetRewardList();
}
FText __UIGetter_RewardBuffDesc(const FVM_RegionEventMinimapIcon &inout Model)
{
    return Model.GetRewardBuffDesc();
}
FText __UIGetter_ToolTipTitle(const FVM_RegionEventMinimapIcon &inout Model)
{
    return Model.GetToolTipTitle();
}
FText __UIGetter_ToolTipDesc(const FVM_RegionEventMinimapIcon &inout Model)
{
    return Model.GetToolTipDesc();
}
FSoftBrush __UIGetter_DungeonIcon(const FVM_RegionEventMinimapIcon &inout Model)
{
    return Model.GetDungeonIcon();
}
TSoftClassPtr<UEUIUserWidget> __UIGetter_TooltipWidgetClass(const FVM_RegionEventMinimapIcon &inout Model)
{
    return Model.GetTooltipWidgetClass();
}
int __UIGetter_RewardTypeSwitchIndex(const FVM_RegionEventMinimapIcon &inout Model)
{
    return Model.GetRewardTypeSwitchIndex();
}
bool __UIGetter_IsEventFinish(const FVM_RegionEventMinimapIcon &inout Model)
{
    return Model.IsEventFinish();
}
bool __UIGetter_IsEventOnGoing(const FVM_RegionEventMinimapIcon &inout Model)
{
    return Model.IsEventOnGoing();
}
bool __UIGetter_HasAnyReward(const FVM_RegionEventMinimapIcon &inout Model)
{
    return Model.HasAnyReward();
}
TEUIModelRef<FVM_RegionEventMinimapIcon> __UIGetter_Self(const FVM_RegionEventMinimapIcon &inout Model)
{
    return TEUIModelRef<FVM_RegionEventMinimapIcon>(Model);
}
int __IndexOf_Spot()
{
    return 0;
}
int __IndexOf_RewardList()
{
    return 1;
}
int __IndexOf_RewardBuffDesc()
{
    return 2;
}
int __IndexOf_ToolTipTitle()
{
    return 3;
}
int __IndexOf_ToolTipDesc()
{
    return 4;
}
int __IndexOf_DungeonIcon()
{
    return 5;
}
int __IndexOf_bHasInit()
{
    return 6;
}
}
namespace __GeneratedProperties_FVM_RegionEventMinimapIcon
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

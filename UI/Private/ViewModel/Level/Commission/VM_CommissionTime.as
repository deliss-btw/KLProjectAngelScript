
namespace FVMS_CommissionTime
{
    const int ModelId = 0;
}
namespace FVM_CommissionTimeHover
{
    const int ModelId = 0;

}
struct FVMS_CommissionTime : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    FFPTime m_CommissionEndTime;
    UPROPERTY()
    FFPTime m_CommissionDuration;
    UPROPERTY()
    bool m_bHasTimeLimit;
    UPROPERTY()
    FMW_CounterDown m_RemainCounterDown;
    UPROPERTY()
    FMW_TimeProgress m_TimeProgress;
    UPROPERTY()
    TEUIModelRef<FVM_CommonAnnularProgressBar> m_IconProgressBar;

    FVMS_CommissionTime()
    {
        this.m_bHasTimeLimit = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_CommissionTime(const FVMS_CommissionTime &inout Other)
    {
        this.m_bHasTimeLimit = false;
        this.m_CommissionEndTime = Other.m_CommissionEndTime;
        this.m_CommissionDuration = Other.m_CommissionDuration;
        this.m_bHasTimeLimit = Other.m_bHasTimeLimit;
        this.m_RemainCounterDown = Other.m_RemainCounterDown;
        this.m_TimeProgress = Other.m_TimeProgress;
        this.m_IconProgressBar = Other.m_IconProgressBar;
        return;
    }
    FVMS_CommissionTime& opAssign(const FVMS_CommissionTime &inout Other)
    {
        this.m_CommissionEndTime = Other.m_CommissionEndTime;
        this.m_CommissionDuration = Other.m_CommissionDuration;
        this.m_bHasTimeLimit = Other.m_bHasTimeLimit;
        this.m_RemainCounterDown = Other.m_RemainCounterDown;
        this.m_TimeProgress = Other.m_TimeProgress;
        return Other.m_IconProgressBar;
    }
    void MonitorCommissionInfo(const FCS_CommissionInfo &inout C_CommissionInfo)
    {
        float32 local_51 = 0.0f;
        if (!(C_CommissionInfo))
        {
            return;
        }
        if (this.IsPVXLevel())
        {
            this.UpdatePVXTimeSource();
            return;
        }
        this.SetbHasTimeLimit(C_CommissionInfo.CommissionConfig.IsSet() && (local_51 > 0.0f));
        if (this.GetbHasTimeLimit())
        {
            this.SetCommissionEndTime(C_CommissionInfo.CommissionTimeoutTime);
            this.SetCommissionDuration(FFPTime(local_51));
        }
        else
        {
            this.SetCommissionEndTime(FFPTime());
            this.SetCommissionDuration(FFPTime());
        }
        this.SetIconProgressBar(TEUIModelRef<FVM_CommonAnnularProgressBar>(::FVM_CommonAnnularProgressBar::Create(this.GetContext().Manager, this.GetCommissionEndTime(), this.GetCommissionDuration())));
        return;
    }
    void MonitorPVXScoreData(const FCS_GameMode_ScoreData &inout ScoreData)
    {
        if (!(this.IsPVXLevel()))
        {
            return;
        }
        this.UpdatePVXTimeSource();
        return;
    }
    void UpdatePVXTimeSource()
    {
        bool local_1 = false;
        FFPTime local_4;
        FFPTime local_6;
        Get local_10;
        const FCS_GameMode_ScoreData& local_12 = local_10.opCall();
        if (local_12)
        {
            if (local_12.GetMatchEndTime().ToSeconds() > 0.0)
            {
                local_1 = true;
                local_4 = local_12.GetMatchEndTime();
                local_6 = (FFPTime(local_12.GetMatchEndTime()) - local_12.GetMatchStartTime());
            }
        }
        bool local_2 = !(this.GetbHasTimeLimit());
        bool local_22 = !(local_1);
        local_2 = (local_2 != local_22);
        local_2 = local_2 || !((FFPTime(this.GetCommissionEndTime()) == local_4));
        local_2 = local_2 || !((FFPTime(this.GetCommissionDuration()) == local_6));
        this.SetbHasTimeLimit(local_1);
        this.SetCommissionEndTime(local_4);
        this.SetCommissionDuration(local_6);
        if (local_2)
        {
            this.SetIconProgressBar(TEUIModelRef<FVM_CommonAnnularProgressBar>(::FVM_CommonAnnularProgressBar::Create(this.GetContext().Manager, this.GetCommissionEndTime(), this.GetCommissionDuration())));
        }
        return;
    }
    bool IsPVXLevel() const
    {
        TDataObjectPtr<FLevelInfoConfig> local_24 = ::FLevelUtils::GetCurrentLevelInfoConfig(nullptr);
        return local_24 && (int(local_24.opArrow().LevelType) == 5);
    }
    void RefreshRemainCounterDown()
    {
        if (!(this.GetbHasTimeLimit()))
        {
            return;
        }
        this.GetModify_RemainCounterDown().SetRemainedTimeWithPrecision(FFPTime(FMath::Max((FFPTime(this.GetCommissionEndTime()) - this.GetContext().Time).ToSeconds(), 0.0)), EMWCounterDownPrecision(0));
        return;
    }
    void RefreshTimeProgress()
    {
        if (!(this.GetbHasTimeLimit()) || (this.GetCommissionDuration().ToSeconds() <= 0.0))
        {
            return;
        }
        this.GetModify_TimeProgress().EndAtSmooth(this.GetCommissionEndTime(), this.GetCommissionDuration());
        return;
    }
    FText GetCommissionProgressingText() const
    {
        this.GetCommissionName();
        FText local_8;
        return FText::Format(NSLOCTEXT("CommissionTime", "CommissionProgressingText", "<Yellow20>{0}</>иї›иЎЊдё­"), local_8);
    }
    TDataObjectPtr<FCommissionConfig> GetCommissionConfig() const
    {
        Get local_4;
        const FCS_CommissionInfo& local_6 = local_4.opCall();
        if (local_6)
        {
            return local_6.CommissionConfig;
        }
        return TDataObjectPtr<FCommissionConfig>();
    }
    bool HasCommissionAndHasTimeLimit() const
    {
        return this.HasCommission() && this.HasTimeLimit();
    }
    bool HasCommission() const
    {
        Has local_4;
        return local_4.opCall() && this.GetCommissionConfig().IsSet();
    }
    bool HasTimeLimit() const
    {
        if (this.IsPVXLevel())
        {
            return this.GetbHasTimeLimit();
        }
        TDataObjectPtr<FCommissionConfig> local_26 = this.GetCommissionConfig();
        if (local_26)
        {
            return (local_26.opArrow().CommissionTimeLimit > 0.0f);
        }
        return false;
    }
    FText GetCommissionName() const
    {
        TDataObjectPtr<FCommissionConfig> local_24 = this.GetCommissionConfig();
        if (local_24)
        {
            return local_24.opArrow().CommissionName;
        }
        return FText();
    }
    FSlateBrush GetCommissionTypeIcon() const
    {
        TDataObjectPtr<FCommissionConfig> local_24 = this.GetCommissionConfig();
        if (local_24)
        {
            TDataObjectPtr<FCommissionTypeConfig> local_74 = ::CommissionUtils::GetCommissionTypeConfig(local_24.opArrow().CommissionType);
            return local_74.opArrow().CommissionTypeIcon.LoadBrush();
        }
        return FSlateBrush();
    }
    FText GetRemainingTimeText() const
    {
        return ::CommissionTimeUtils::FormatRemainingTime(this.GetRemainCounterDown().GetRemainedTime());
    }
    float32 GetTimeRemainingRatio() const
    {
        return this.GetTimeProgress().GetRemainingRatio();
    }
    bool IsRemainingTimeBelowThreshold() const
    {
        if (!(this.GetbHasTimeLimit()))
        {
            return false;
        }
        return ::CommissionTimeUtils::IsRemainingTimeBelowWarning(this.GetRemainCounterDown().GetRemainedTime());
    }
    float GetProgressAngle() const
    {
        float local_10 = -90.0;
        float local_6 = 1.0 - this.GetTimeRemainingRatio();
        return local_10 + (local_6 * 360.0);
    }
    FWidgetTransform GetPercentageToTransform() const
    {
        float local_16 = this.GetProgressAngle();
        return FWidgetTransform();
    }
    FEUIModelContainer MakeHoverModels()
    {
        FEUIModelContainer local_14;
        local_14.AddModel(FEUIModelRef(), false);
        return local_14;
    }
    const FFPTime GetCommissionEndTime() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FFPTime GetModify_CommissionEndTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetCommissionEndTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CommissionEndTime = __Value;
        return;
    }
    const FFPTime GetCommissionDuration() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FFPTime GetModify_CommissionDuration() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetCommissionDuration(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CommissionDuration = __Value;
        return;
    }
    bool GetbHasTimeLimit() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bHasTimeLimit;
    }
    void SetbHasTimeLimit(const bool __Value) property
    {
        if (!(this.m_bHasTimeLimit) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bHasTimeLimit = __Value;
        return;
    }
    const FMW_CounterDown GetRemainCounterDown() const property
    {
        const FMW_CounterDown __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FMW_CounterDown GetModify_RemainCounterDown() property
    {
        FMW_CounterDown __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetRemainCounterDown(const FMW_CounterDown &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_RemainCounterDown = __Value;
        return;
    }
    const FMW_TimeProgress GetTimeProgress() const property
    {
        const FMW_TimeProgress __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FMW_TimeProgress GetModify_TimeProgress() property
    {
        FMW_TimeProgress __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetTimeProgress(const FMW_TimeProgress &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_TimeProgress = __Value;
        return;
    }
    TEUIModelRef<FVM_CommonAnnularProgressBar> GetIconProgressBar() const property
    {
        this.TrackPropertyRead(5);
        return this.m_IconProgressBar;
    }
    void SetIconProgressBar(const TEUIModelRef<FVM_CommonAnnularProgressBar> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonAnnularProgressBar> local_2;
        local_2 = this.m_IconProgressBar;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_IconProgressBar = __Value;
        return;
    }
}

struct FVM_CommissionTimeHover : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<FEUIModelContainer> m_ObjectiveModels;
    UPROPERTY()
    FText m_ObjectivesProgressText;
    UPROPERTY()
    FMW_CounterDown m_RemainCounterDown;
    UPROPERTY()
    FFPTime m_CommissionEndTime;
    UPROPERTY()
    bool m_bHasTimeLimit;

    FVM_CommissionTimeHover()
    {
        this.m_bHasTimeLimit = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_CommissionTimeHover(const FVM_CommissionTimeHover &inout Other)
    {
        this.m_bHasTimeLimit = false;
        this.m_ObjectiveModels = Other.m_ObjectiveModels;
        this.m_ObjectivesProgressText = Other.m_ObjectivesProgressText;
        this.m_RemainCounterDown = Other.m_RemainCounterDown;
        this.m_CommissionEndTime = Other.m_CommissionEndTime;
        this.m_bHasTimeLimit = Other.m_bHasTimeLimit;
        return;
    }
    FVM_CommissionTimeHover opAssign(const FVM_CommissionTimeHover &inout Other)
    {
        FVM_CommissionTimeHover __r;
        this.m_ObjectiveModels = Other.m_ObjectiveModels;
        this.m_ObjectivesProgressText = Other.m_ObjectivesProgressText;
        this.m_RemainCounterDown = Other.m_RemainCounterDown;
        this.m_CommissionEndTime = Other.m_CommissionEndTime;
        this.m_bHasTimeLimit = Other.m_bHasTimeLimit;
        return __r;
    }
    void PostConstruct()
    {
        int local_7;
        this.BuildObjectiveModels();
        Get local_4;
        const FCS_CommissionInfo& local_6 = local_4.opCall();
        if (local_6)
        {
            TDataObjectPtr<FCommissionConfig> local_32 = local_6.CommissionConfig;
            if (!(local_32.IsSet()))
            {
                local_7 = 0;
            }
            else
            {
                bool local_59 = (0.0f > 0.0f);
                local_7 = local_59;
            }
            this.SetbHasTimeLimit((local_7 != 0));
            this.SetCommissionEndTime(local_6.CommissionTimeoutTime);
        }
        return;
    }
    void RefreshRemainCounterDown()
    {
        if (!(this.GetbHasTimeLimit()))
        {
            return;
        }
        this.GetModify_RemainCounterDown().SetRemainedTimeWithPrecision(FFPTime(FMath::Max((FFPTime(this.GetCommissionEndTime()) - this.GetContext().Time).ToSeconds(), 0.0)), EMWCounterDownPrecision(0));
        return;
    }
    FText GetCommissionName() const
    {
        Get local_4;
        const FCS_CommissionInfo& local_6 = local_4.opCall();
        if (local_6)
        {
            TDataObjectPtr<FCommissionConfig> local_32 = local_6.CommissionConfig;
            if (local_32)
            {
                return local_32.opArrow().CommissionName;
            }
        }
        return FText();
    }
    FText GetRemainingTimeText() const
    {
        return ::CommissionTimeUtils::FormatRemainingTime(this.GetRemainCounterDown().GetRemainedTime());
    }
    FText GetTitleText() const
    {
        FText local_6;
        if (!(this.GetbHasTimeLimit()))
        {
            this.GetCommissionName();
            return local_6;
        }
        this.GetRemainingTimeText();
        if (::CommissionTimeUtils::IsRemainingTimeBelowWarning(this.GetRemainCounterDown().GetRemainedTime()))
        {
            local_6 = FText::Format(INVTEXT("<Red26F>{0}</>"), local_6);
        }
        return FText::Format(NSLOCTEXT("CommissionTime", "HoverTitle", "{0} {1}"), this.GetCommissionName(), local_6);
    }
    void BuildObjectiveModels()
    {
        int local_28 = 0;
        this.GetModify_ObjectiveModels().Empty(0);
        this.BuildMainObjectiveModels();
        this.BuildSubObjectiveModels();
        TArray<FText> local_6;
        for (auto& local_22 : this.GetModify_ObjectiveModels())
        {
            FEUIModelContainer::RequireModel(local_22);
            FText local_36 = local_28.GetObjectProgressDesc();
            FText local_32 = local_28.GetObjectProgressNumber();
            FText local_52;
            if (local_32.IsEmpty())
            {
                local_52 = local_36;
            }
            else
            {
                local_52 = FText::Format(INVTEXT("{0} <Yellow18F>{1}</>"), local_36, local_32);
            }
            if (local_52.IsEmpty())
            {
                continue;
            }
            local_6.Add(local_52);
        }
        this.SetObjectivesProgressText(FText::Join(INVTEXT("\n"), local_6));
        return;
    }
    void BuildMainObjectiveModels()
    {
        int local_6 = 0;
        bool local_114 = false;
        int local_115;
        int local_116;
        if (!(local_6))
        {
            return;
        }
        TDataObjectPtr<FObjectiveConfig> local_32 = local_6.CommissionTargetObjective;
        if (!(local_32.IsSet()))
        {
            return;
        }
        if (0 == 0)
        {
            CastTo local_64;
            TDataObjectPtr<FObjectiveSingleConfig> local_88 = local_64.opCall();
            if (GetFinishCondition().IsSet() && (local_6.Progress.GetSuccessProgressValue() >= ::ConditionUtils::GetTargetValue(GetFinishCondition())))
            {
                local_115 = 1;
            }
            else
            {
                local_115 = 0;
            }
            local_114 = false;
            this.AppendObjective(local_88, local_6.Progress, local_114, EObjectiveItemUIState(local_115));
            return;
        }
        CastTo local_120;
        TDataObjectPtr<FObjectiveGroupConfig> local_144 = local_120.opCall();
        for (auto& local_182 : GetChildObjectives())
        {
            local_182;
            CastTo local_186;
            TDataObjectPtr<FObjectiveSingleConfig> local_112 = local_186.opCall();
            if (!(local_112.IsSet()) || local_114)
            {
                continue;
            }
            FCommissionTargetProgress local_188;
            bool local_7 = false;
            if (local_6.ChildProgress.Contains(unresolved.DataId))
            {
                local_7 = GetFinishCondition().IsSet() && (local_188.GetSuccessProgressValue() >= ::ConditionUtils::GetTargetValue(GetFinishCondition()));
            }
            if (local_7)
            {
                local_116 = 1;
            }
            else
            {
                local_116 = 0;
            }
            this.AppendObjective(local_112, local_188, false, EObjectiveItemUIState(local_116));
        }
        return;
    }
    void BuildSubObjectiveModels()
    {
        int local_6 = 0;
        int local_60 = 0;
        int local_62 = 0;
        bool local_115 = false;
        if (!(local_6))
        {
            return;
        }
        TDataObjectPtr<FObjectiveConfig> local_32 = local_6.GetSubTargetConfig();
        bool local_7 = !(local_32);
        if (local_7)
        {
            return;
        }
        int local_59 = int(this.ConvertSubTargetStatusToUIState(local_6.GetStatus()));
        int local_61 = local_60;
        if (local_61 == 0)
        {
            CastTo local_66;
            TDataObjectPtr<FObjectiveSingleConfig> local_90 = local_66.opCall();
            if (!(local_90.IsSet()))
            {
                local_7 = false;
            }
            else
            {
                local_115 = !local_115;
                local_7 = local_115;
            }
            if (local_7)
            {
                FCommissionTargetProgress local_118;
                local_62 = local_6.GetProgress().GetSuccessProgressValue();
                local_118.SetSuccessProgressValue(local_62);
                local_61 = local_6.GetProgress().GetFailedProgressValue();
                local_118.SetFailedProgressValue(local_61);
                local_7 = true;
                this.AppendObjective(local_90, local_118, local_7, EObjectiveItemUIState(local_59));
            }
            return;
        }
        CastTo local_122;
        TDataObjectPtr<FObjectiveGroupConfig> local_146 = local_122.opCall();
        for (auto& local_184 : GetChildObjectives())
        {
            local_184;
            CastTo local_188;
            TDataObjectPtr<FObjectiveSingleConfig> local_114 = local_188.opCall();
            if (!(local_114.IsSet()) || local_7)
            {
                continue;
            }
            local_7 = !local_7;
            if (local_7)
            {
                continue;
            }
            FCommissionTargetProgress local_118;
            local_118.SetSuccessProgressValue(local_61);
            local_118.SetFailedProgressValue(local_62);
            this.AppendObjective(local_114, local_118, true, EObjectiveItemUIState(local_59));
        }
        return;
    }
    void AppendObjective(const TDataObjectPtr<FObjectiveSingleConfig> &inout SingleConfig, const FCommissionTargetProgress &inout InProgress, const bool bSubObj, const EObjectiveItemUIState UIState)
    {
        int local_96 = 0;
        if (!(SingleConfig.IsSet()))
        {
            return;
        }
        FCommissionObjItemModelData local_36;
        local_36.SubObj = bSubObj;
        local_36.UIState = UIState;
        local_36.SingleObjectiveConfig = SingleConfig;
        FEUIModelContainer::MakeCached local_74;
        this.GetModify_ObjectiveModels().Add(local_74.opImplConv());
        FEUIModelContainer::RequireModel(this.GetModify_ObjectiveModels().Last(0));
        local_96.SetProgress(InProgress);
        return;
    }
    EObjectiveItemUIState ConvertSubTargetStatusToUIState(const ECommissionSubTargetStatus InStatus)
    {
        if (int(InStatus) == 1)
        {
            return EObjectiveItemUIState(1);
        }
        if (int(InStatus) == 2)
        {
            return EObjectiveItemUIState(2);
        }
        return EObjectiveItemUIState(0);
    }
    const TArray<FEUIModelContainer> GetObjectiveModels() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_ObjectiveModels() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetObjectiveModels(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ObjectiveModels = __Value;
        return;
    }
    const FText GetObjectivesProgressText() const property
    {
        const FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_ObjectivesProgressText() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetObjectivesProgressText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ObjectivesProgressText = __Value;
        return;
    }
    const FMW_CounterDown GetRemainCounterDown() const property
    {
        const FMW_CounterDown __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FMW_CounterDown GetModify_RemainCounterDown() property
    {
        FMW_CounterDown __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetRemainCounterDown(const FMW_CounterDown &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_RemainCounterDown = __Value;
        return;
    }
    const FFPTime GetCommissionEndTime() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FFPTime GetModify_CommissionEndTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetCommissionEndTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CommissionEndTime = __Value;
        return;
    }
    bool GetbHasTimeLimit() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bHasTimeLimit;
    }
    void SetbHasTimeLimit(const bool __Value) property
    {
        if (!(this.m_bHasTimeLimit) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bHasTimeLimit = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_CommissionTime
{
    UPROPERTY()
    FText CommissionProgressingText;
    UPROPERTY()
    TDataObjectPtr<FCommissionConfig> CommissionConfig;
    UPROPERTY()
    bool HasCommissionAndHasTimeLimit;
    UPROPERTY()
    bool HasCommission;
    UPROPERTY()
    bool HasTimeLimit;
    UPROPERTY()
    FText CommissionName;
    UPROPERTY()
    FSlateBrush CommissionTypeIcon;
    UPROPERTY()
    FText RemainingTimeText;
    UPROPERTY()
    float32 TimeRemainingRatio;
    UPROPERTY()
    bool IsRemainingTimeBelowThreshold;
    UPROPERTY()
    float ProgressAngle;
    UPROPERTY()
    FWidgetTransform PercentageToTransform;
    UPROPERTY()
    TEUIModelRef<FVMS_CommissionTime> Self;


}

struct __GeneratedProperties_FVM_CommissionTimeHover
{
    UPROPERTY()
    FText CommissionName;
    UPROPERTY()
    FText RemainingTimeText;
    UPROPERTY()
    FText TitleText;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionTimeHover> Self;

    __GeneratedProperties_FVM_CommissionTimeHover()
    {
        return;
    }
}

namespace CommissionTimeUtils
{
FText FormatRemainingTime(const FFPTime &inout RemainedTime)
{
    int local_7 = FMath::Max(0, FMath::FloorToInt(RemainedTime.ToSeconds()));
    int local_1 = FMath::IntegerDivisionTrunc(local_7, 60);
    int local_6_2 = local_7 - (local_1 * 60);
    FNumberFormattingOptions local_15;
    local_15 = FNumberFormattingOptions::DefaultNoGrouping();
    local_15.SetMinimumIntegralDigits(2);
    FText::AsNumber(local_6_2, local_15);
    FText local_30;
    FText::AsNumber(local_1, local_30);
    return FText::Format(INVTEXT("{0}:{1}"), local_30, local_15);
}
bool IsRemainingTimeBelowWarning(const FFPTime &inout RemainedTime)
{
    float32 local_5 = CommissionUtils::GetCommissionSettings().CommissionLowTimeWarningMinutes;
    return (RemainedTime.ToSeconds() < ((FMath::Max(0.0f, local_5)) * 60.0));
}
}
namespace FVMS_CommissionTime
{
FVMS_CommissionTime& Get(const UObject ContextObject)
{
    return FVMS_CommissionTime::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_CommissionTime GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_CommissionTime __r;
    TEUIModelRef<FVMS_CommissionTime> local_6 = TEUIModelRef<FVMS_CommissionTime>(EUIInternal::MakeModelWithManager(Manager, FVMS_CommissionTime::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "IconProgressBar";
    local_14.TypeName = "TEUIModelRef<FVM_CommonAnnularProgressBar>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionProgressingText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionConfig";
    local_14.TypeName = "TDataObjectPtr<FCommissionConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasCommissionAndHasTimeLimit";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasCommission";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasTimeLimit";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionTypeIcon";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RemainingTimeText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TimeRemainingRatio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsRemainingTimeBelowThreshold";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ProgressAngle";
    local_14.TypeName = "float64";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PercentageToTransform";
    local_14.TypeName = "FWidgetTransform";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_CommissionTime>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_CommissionTime;
    FEUIModelWatcherProperty local_19;
    local_19.PropertyName = FName("RemainCounterDown");
    int local_2_2 = FVMS_CommissionTime::__IndexOf_RemainCounterDown();
    Result.WatcherProperties.Add(local_19);
    local_19.PropertyName = FName("TimeProgress");
    int local_2_3 = FVMS_CommissionTime::__IndexOf_TimeProgress();
    Result.WatcherProperties.Add(local_19);
    FEUIModelMonitorDefine local_32;
    local_32.FunctionName = "__MonitorCommissionInfo";
    local_32.ComponentType = FCS_CommissionInfo;
    Result.MonitorFunctions.Add(local_32);
    local_32.FunctionName = "__MonitorPVXScoreData";
    local_32.ComponentType = FCS_GameMode_ScoreData;
    Result.MonitorFunctions.Add(local_32);
    FEUIModelEffectDefine local_38;
    local_38.FunctionName = "RefreshRemainCounterDown";
    Result.EffectFunctions.Add(local_38);
    local_38.FunctionName = "RefreshTimeProgress";
    Result.EffectFunctions.Add(local_38);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_CommissionTime;
}
void __MonitorCommissionInfo(FVMS_CommissionTime &inout Model, const FECSEntity &inout Entity, const FCS_CommissionInfo &inout Component)
{
    Get local_4;
    Model.MonitorCommissionInfo(local_4.opCall());
    return;
}
void __MonitorPVXScoreData(FVMS_CommissionTime &inout Model, const FECSEntity &inout Entity, const FCS_GameMode_ScoreData &inout Component)
{
    Get local_4;
    Model.MonitorPVXScoreData(local_4.opCall());
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
TEUIModelRef<FVM_CommonAnnularProgressBar> __UIGetter_IconProgressBar(const FVMS_CommissionTime &inout Model)
{
    return Model.GetIconProgressBar();
}
FText __UIGetter_CommissionProgressingText(const FVMS_CommissionTime &inout Model)
{
    return Model.GetCommissionProgressingText();
}
TDataObjectPtr<FCommissionConfig> __UIGetter_CommissionConfig(const FVMS_CommissionTime &inout Model)
{
    return Model.GetCommissionConfig();
}
bool __UIGetter_HasCommissionAndHasTimeLimit(const FVMS_CommissionTime &inout Model)
{
    return Model.HasCommissionAndHasTimeLimit();
}
bool __UIGetter_HasCommission(const FVMS_CommissionTime &inout Model)
{
    return Model.HasCommission();
}
bool __UIGetter_HasTimeLimit(const FVMS_CommissionTime &inout Model)
{
    return Model.HasTimeLimit();
}
FText __UIGetter_CommissionName(const FVMS_CommissionTime &inout Model)
{
    return Model.GetCommissionName();
}
FSlateBrush __UIGetter_CommissionTypeIcon(const FVMS_CommissionTime &inout Model)
{
    return Model.GetCommissionTypeIcon();
}
FText __UIGetter_RemainingTimeText(const FVMS_CommissionTime &inout Model)
{
    return Model.GetRemainingTimeText();
}
float32 __UIGetter_TimeRemainingRatio(const FVMS_CommissionTime &inout Model)
{
    return Model.GetTimeRemainingRatio();
}
bool __UIGetter_IsRemainingTimeBelowThreshold(const FVMS_CommissionTime &inout Model)
{
    return Model.IsRemainingTimeBelowThreshold();
}
float __UIGetter_ProgressAngle(const FVMS_CommissionTime &inout Model)
{
    return Model.GetProgressAngle();
}
FWidgetTransform __UIGetter_PercentageToTransform(const FVMS_CommissionTime &inout Model)
{
    return Model.GetPercentageToTransform();
}
TEUIModelRef<FVMS_CommissionTime> __UIGetter_Self(const FVMS_CommissionTime &inout Model)
{
    return TEUIModelRef<FVMS_CommissionTime>(Model);
}
int __IndexOf_CommissionEndTime()
{
    return 0;
}
int __IndexOf_CommissionDuration()
{
    return 1;
}
int __IndexOf_bHasTimeLimit()
{
    return 2;
}
int __IndexOf_RemainCounterDown()
{
    return 3;
}
int __IndexOf_TimeProgress()
{
    return 4;
}
int __IndexOf_IconProgressBar()
{
    return 5;
}
}
namespace __GeneratedProperties_FVMS_CommissionTime
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_CommissionTimeHover
{
FVM_CommissionTimeHover& Create(const UObject ContextObject)
{
    return FVM_CommissionTimeHover::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_CommissionTimeHover CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_CommissionTimeHover __r;
    TEUIModelRef<FVM_CommissionTimeHover> local_6 = TEUIModelRef<FVM_CommissionTimeHover>(EUIInternal::MakeModelWithManager(Manager, FVM_CommissionTimeHover::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ObjectiveModels";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ObjectivesProgressText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RemainingTimeText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TitleText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionTimeHover>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommissionTimeHover;
    FEUIModelWatcherProperty local_19;
    local_19.PropertyName = FName("RemainCounterDown");
    int local_2_2 = FVM_CommissionTimeHover::__IndexOf_RemainCounterDown();
    Result.WatcherProperties.Add(local_19);
    FEUIModelEffectDefine local_26;
    local_26.FunctionName = "RefreshRemainCounterDown";
    Result.EffectFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommissionTimeHover;
}
TArray<FEUIModelContainer> __UIGetter_ObjectiveModels(const FVM_CommissionTimeHover &inout Model)
{
    return Model.GetObjectiveModels();
}
FText __UIGetter_ObjectivesProgressText(const FVM_CommissionTimeHover &inout Model)
{
    return Model.GetObjectivesProgressText();
}
FText __UIGetter_CommissionName(const FVM_CommissionTimeHover &inout Model)
{
    return Model.GetCommissionName();
}
FText __UIGetter_RemainingTimeText(const FVM_CommissionTimeHover &inout Model)
{
    return Model.GetRemainingTimeText();
}
FText __UIGetter_TitleText(const FVM_CommissionTimeHover &inout Model)
{
    return Model.GetTitleText();
}
TEUIModelRef<FVM_CommissionTimeHover> __UIGetter_Self(const FVM_CommissionTimeHover &inout Model)
{
    return TEUIModelRef<FVM_CommissionTimeHover>(Model);
}
int __IndexOf_ObjectiveModels()
{
    return 0;
}
int __IndexOf_ObjectivesProgressText()
{
    return 1;
}
int __IndexOf_RemainCounterDown()
{
    return 2;
}
int __IndexOf_CommissionEndTime()
{
    return 3;
}
int __IndexOf_bHasTimeLimit()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_CommissionTimeHover
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

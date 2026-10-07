
namespace FM_CommissionInstanceData
{
    const int ModelId = 0;
}
namespace FM_Commission
{
    const int ModelId = 0;

}
struct FM_CommissionInstanceData : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    TDataObjectPtr<FIntrusionPolicyConfig> m_IntrusionPolicy;
    UPROPERTY()
    TDataObjectPtr<FObjectiveConfig> m_SubTarget;
    UPROPERTY()
    TDataObjectPtr<FWeatherConfig> m_Weather;
    UPROPERTY()
    TDataObjectPtr<FWorldAreaConfig> m_Area;
    UPROPERTY()
    float32 m_StartTime;
    UPROPERTY()
    TDataObjectPtr<FCommissionEntryRuleConfig> m_EntryRule;
    UPROPERTY()
    bool m_bIsOnDashboard;

    FM_CommissionInstanceData()
    {
        this.m_StartTime = 0.0f;
        this.m_bIsOnDashboard = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FM_CommissionInstanceData(const FM_CommissionInstanceData &inout Other)
    {
        this.m_StartTime = 0.0f;
        this.m_bIsOnDashboard = false;
        this.m_IntrusionPolicy = Other.m_IntrusionPolicy;
        this.m_SubTarget = Other.m_SubTarget;
        this.m_Weather = Other.m_Weather;
        this.m_Area = Other.m_Area;
        this.m_StartTime = Other.m_StartTime;
        this.m_EntryRule = Other.m_EntryRule;
        this.m_bIsOnDashboard = Other.m_bIsOnDashboard;
        return;
    }
    FM_CommissionInstanceData opAssign(const FM_CommissionInstanceData &inout Other)
    {
        FM_CommissionInstanceData __r;
        this.m_IntrusionPolicy = Other.m_IntrusionPolicy;
        this.m_SubTarget = Other.m_SubTarget;
        this.m_Weather = Other.m_Weather;
        this.m_Area = Other.m_Area;
        this.m_StartTime = Other.m_StartTime;
        this.m_EntryRule = Other.m_EntryRule;
        this.m_bIsOnDashboard = Other.m_bIsOnDashboard;
        return __r;
    }
    const TDataObjectPtr<FIntrusionPolicyConfig> GetIntrusionPolicy() const property
    {
        const TDataObjectPtr<FIntrusionPolicyConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FIntrusionPolicyConfig> GetModify_IntrusionPolicy() property
    {
        TDataObjectPtr<FIntrusionPolicyConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetIntrusionPolicy(const TDataObjectPtr<FIntrusionPolicyConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_IntrusionPolicy = __Value;
        return;
    }
    const TDataObjectPtr<FObjectiveConfig> GetSubTarget() const property
    {
        const TDataObjectPtr<FObjectiveConfig> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TDataObjectPtr<FObjectiveConfig> GetModify_SubTarget() property
    {
        TDataObjectPtr<FObjectiveConfig> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetSubTarget(const TDataObjectPtr<FObjectiveConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SubTarget = __Value;
        return;
    }
    const TDataObjectPtr<FWeatherConfig> GetWeather() const property
    {
        const TDataObjectPtr<FWeatherConfig> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TDataObjectPtr<FWeatherConfig> GetModify_Weather() property
    {
        TDataObjectPtr<FWeatherConfig> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetWeather(const TDataObjectPtr<FWeatherConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_Weather = __Value;
        return;
    }
    const TDataObjectPtr<FWorldAreaConfig> GetArea() const property
    {
        const TDataObjectPtr<FWorldAreaConfig> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TDataObjectPtr<FWorldAreaConfig> GetModify_Area() property
    {
        TDataObjectPtr<FWorldAreaConfig> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetArea(const TDataObjectPtr<FWorldAreaConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_Area = __Value;
        return;
    }
    float32 GetStartTime() const property
    {
        float32 __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    float32 GetModify_StartTime() property
    {
        float32 __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetStartTime(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_StartTime = __Value;
        return;
    }
    const TDataObjectPtr<FCommissionEntryRuleConfig> GetEntryRule() const property
    {
        const TDataObjectPtr<FCommissionEntryRuleConfig> __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    TDataObjectPtr<FCommissionEntryRuleConfig> GetModify_EntryRule() property
    {
        TDataObjectPtr<FCommissionEntryRuleConfig> __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetEntryRule(const TDataObjectPtr<FCommissionEntryRuleConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_EntryRule = __Value;
        return;
    }
    bool GetbIsOnDashboard() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bIsOnDashboard;
    }
    void SetbIsOnDashboard(const bool __Value) property
    {
        if (!(this.m_bIsOnDashboard) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bIsOnDashboard = __Value;
        return;
    }
}

struct FM_Commission : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    TDataObjectPtr<FCommissionConfig> m_CommissionConfig;
    UPROPERTY()
    int m_FinishCount;
    UPROPERTY()
    int m_BestCostTimeSec;
    UPROPERTY()
    ECommissionTier m_BestAchievedTier;
    UPROPERTY()
    TEUIModelRef<FM_CommissionInstanceData> m_InstanceData;

    FM_Commission()
    {
        this.m_FinishCount = 0;
        this.m_BestCostTimeSec = 0;
        this.m_BestAchievedTier = ECommissionTier(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FM_Commission(const FM_Commission &inout Other)
    {
        this.m_FinishCount = 0;
        this.m_BestCostTimeSec = 0;
        this.m_BestAchievedTier = ECommissionTier(0);
        this.m_CommissionConfig = Other.m_CommissionConfig;
        this.m_FinishCount = int(Other.m_FinishCount);
        this.m_BestCostTimeSec = int(Other.m_BestCostTimeSec);
        this.m_BestAchievedTier = Other.m_BestAchievedTier;
        this.m_InstanceData = Other.m_InstanceData;
        return;
    }
    FM_Commission& opAssign(const FM_Commission &inout Other)
    {
        this.m_CommissionConfig = Other.m_CommissionConfig;
        this.m_FinishCount = int(Other.m_FinishCount);
        this.m_BestCostTimeSec = int(Other.m_BestCostTimeSec);
        this.m_BestAchievedTier = Other.m_BestAchievedTier;
        return Other.m_InstanceData;
    }
    bool HasInstanceData() const
    {
        return this.GetInstanceData().IsValid();
    }
    FText GetLocationName() const
    {
        if (this.GetInstanceData())
        {
            TDataObjectPtr<FWorldAreaConfig> local_28 = this.GetInstanceData().opArrow().GetArea();
            if (local_28)
            {
                return local_28.opArrow().AreaName;
            }
        }
        if (!(this.GetCommissionConfig().opArrow().DisplayLocationName.IsEmpty()))
        {
            return this.GetCommissionConfig().opArrow().DisplayLocationName;
        }
        if (this.GetCommissionConfig().opArrow().GetLevelInfoConfig())
        {
            return this.GetCommissionConfig().opArrow().GetLevelInfoConfig().opArrow().LevelDisplayName;
        }
        return FText();
    }
    TDataObjectPtr<FWeatherConfig> GetWeatherConfig() const
    {
        if (this.GetInstanceData())
        {
            return this.GetInstanceData().opArrow().GetWeather();
        }
        return TDataObjectPtr<FWeatherConfig>(nullptr);
    }
    TDataObjectPtr<FObjectiveConfig> GetSubTargetConfig() const
    {
        if (this.GetInstanceData())
        {
            return this.GetInstanceData().opArrow().GetSubTarget();
        }
        return this.GetCommissionConfig().opArrow().GetCommissionSubTargetObjective();
    }
    float32 GetStartTimeInHours() const
    {
        if (this.GetInstanceData() && (this.GetInstanceData().opArrow().GetStartTime() >= 0.0f))
        {
            return this.GetInstanceData().opArrow().GetStartTime();
        }
        return this.GetCommissionConfig().opArrow().CommissionDayTime;
    }
    TDataObjectPtr<FIntrusionPolicyConfig> GetIntrusionPolicyConfig() const
    {
        if (this.GetInstanceData())
        {
            return this.GetInstanceData().opArrow().GetIntrusionPolicy();
        }
        return TDataObjectPtr<FIntrusionPolicyConfig>(nullptr);
    }
    TDataObjectPtr<FCommissionEntryRuleConfig> GetEntryRuleConfig() const
    {
        if (this.GetInstanceData())
        {
            return this.GetInstanceData().opArrow().GetEntryRule();
        }
        return TDataObjectPtr<FCommissionEntryRuleConfig>(nullptr);
    }
    bool HasEntryRule() const
    {
        TDataObjectPtr<FCommissionEntryRuleConfig> local_24 = this.GetEntryRuleConfig();
        if (local_24)
        {
            return int(local_24.opArrow().RuleType) != 0 && (int(local_24.opArrow().RuleType) != 1);
        }
        return false;
    }
    bool ShouldHideLocation() const
    {
        TDataObjectPtr<FCommissionEntryRuleConfig> local_24 = this.GetEntryRuleConfig();
        if (local_24)
        {
            if (int(local_24.opArrow().RuleType) == 2)
            {
                return true;
            }
        }
        return false;
    }
    FText GetCommissionTargetObjectiveOrAimDesc() const
    {
        if (!(this.GetCommissionConfig().opArrow().CommissionAimDesc.IsEmpty()))
        {
            return this.GetCommissionConfig().opArrow().CommissionAimDesc;
        }
        TDataObjectPtr<FObjectiveConfig> local_26 = this.GetCommissionConfig().opArrow().GetCommissionTargetObjective();
        if (local_26)
        {
            return ::ObjectiveUtils::GetObjectiveDesc(local_26, 0, 0);
        }
        return FText();
    }
    bool ShouldHideOnDashboard() const
    {
        if (this.GetInstanceData())
        {
            return !(this.GetInstanceData().opArrow().GetbIsOnDashboard());
        }
        return false;
    }
    bool IsTierAchieved(const ECommissionTier InTier) const
    {
        return int(this.GetBestAchievedTier()) != 0 && (int(this.GetBestAchievedTier()) <= int(InTier));
    }
    ECommissionTier GetTierFromTimeSec(const int TimeSec) const
    {
        ECommissionTier local_1 = ECommissionTier(0);
        CastTo local_6;
        TDataObjectPtr<FRaceCommissionConfig> local_30 = local_6.opCall();
        if (local_30)
        {
            for (auto& local_70 : local_30.opArrow().RaceTierRewards)
            {
                if (TimeSec <= int(local_70.TimeSec) && (int(local_1) == 0 || ((int(local_70.Tier) < int(local_1)))))
                {
                    local_1 = local_70.Tier;
                }
            }
        }
        return local_1;
    }
    TArray<TEUIModelRef<FM_CommissionTier>> GetCommissionTiers() const
    {
        TArray<TEUIModelRef<FM_CommissionTier>> local_4;
        CastTo local_8;
        TDataObjectPtr<FRaceCommissionConfig> local_32 = local_8.opCall();
        if (local_32)
        {
            for (auto& local_72 : local_32.opArrow().RaceTierRewards)
            {
                if (int(local_72.Tier) != 0)
                {
                    local_4.Add(TEUIModelRef<FM_CommissionTier>(::FM_CommissionTier::Create(this.GetContext().Manager, (TEUIModelRef<FM_Commission>(this)), ECommissionTier(local_72.Tier))));
                }
            }
        }
        if (!(local_4.IsEmpty()))
        {
        }
        return local_4;
    }
    bool SetFromServerData(const FPbCommissionInfo &inout ServerInfo, const bool bIsInstancedCommission)
    {
        int local_25 = ServerInfo.GetId();
        GetDataObjectByGSDataId<FCommissionConfig> local_24;
        this.SetCommissionConfig(local_24.opImplConv());
        if (!(this.GetCommissionConfig()))
        {
            return false;
        }
        this.SetFinishCount(::NumericUtils::AsInt32(ServerInfo.GetFinishCount()));
        this.SetBestCostTimeSec(::NumericUtils::AsInt32(ServerInfo.GetBestCostTimeSec()));
        int local_53 = ServerInfo.GetBestAchievedTier();
        this.SetBestAchievedTier(ECommissionTier(local_53));
        if (bIsInstancedCommission || (int(this.GetCommissionConfig().opArrow().CommissionType) == 2) || (int(this.GetCommissionConfig().opArrow().CommissionType) == 4) || (int(this.GetCommissionConfig().opArrow().CommissionType) == 5))
        {
            this.SetInstanceData(TEUIModelRef<FM_CommissionInstanceData>(::FM_CommissionInstanceData::Create(this.GetContext().Manager)));
            FPbCommissionInstanceInfo local_68 = FPbCommissionInstanceInfo(ServerInfo.GetCommissionInstanceInfo());
            int local_25_2 = local_68.GetIntrusionPolicyId();
            GetDataObjectByGSDataId<FIntrusionPolicyConfig> local_102;
            this.GetInstanceData().opArrow().SetIntrusionPolicy(local_102.opImplConv());
            int local_25_3 = local_68.GetSubTargetId();
            GetDataObjectByGSDataId<FObjectiveConfig> local_150;
            this.GetInstanceData().opArrow().SetSubTarget(local_150.opImplConv());
            int local_25_4 = local_68.GetWeatherId();
            GetDataObjectByGSDataId<FWeatherConfig> local_198;
            this.GetInstanceData().opArrow().SetWeather(local_198.opImplConv());
            int local_25_5 = local_68.GetSpawnAreaId();
            GetDataObjectByGSDataId<FWorldAreaConfig> local_246;
            this.GetInstanceData().opArrow().SetArea(local_246.opImplConv());
            this.GetInstanceData().opArrow().SetStartTime(local_68.GetCommissionTime());
            int local_25_6 = local_68.GetEntryRuleId();
            GetDataObjectByGSDataId<FCommissionEntryRuleConfig> local_296;
            this.GetInstanceData().opArrow().SetEntryRule(local_296.opImplConv());
            this.GetInstanceData().opArrow().SetbIsOnDashboard(local_68.GetIsOnDashboard());
        }
        else
        {
            this.SetInstanceData(TEUIModelRef<FM_CommissionInstanceData>());
        }
        return true;
    }
    void SetFromGameplayData(const FCS_CommissionInfo &inout C_CommissionInfo, const FCS_CommissionDSGlobalInfoView &inout C_CommissionDSGlobalInfoView)
    {
        this.SetCommissionConfig(C_CommissionInfo.CommissionConfig);
        this.SetFinishCount(0);
        this.SetBestCostTimeSec(0);
        this.SetBestAchievedTier(ECommissionTier(0));
        if (this.GetCommissionConfig())
        {
            TEUIModelRef<FM_Commission> local_6 = ::FMS_CommissionData::Get(this.GetContext().Manager).FindFirstCommissionsByConfig(this.GetCommissionConfig());
            if (local_6.IsValid())
            {
                this.SetFinishCount(local_6.opArrow().GetFinishCount());
                this.SetBestCostTimeSec(local_6.opArrow().GetBestCostTimeSec());
                this.SetBestAchievedTier(local_6.opArrow().GetBestAchievedTier());
            }
        }
        if (C_CommissionDSGlobalInfoView)
        {
            if (!(this.GetInstanceData()))
            {
                this.SetInstanceData(TEUIModelRef<FM_CommissionInstanceData>(::FM_CommissionInstanceData::Create(this.GetContext().Manager)));
            }
            this.GetInstanceData().opArrow().SetIntrusionPolicy(C_CommissionDSGlobalInfoView.GetIntrusionPolicyConfig());
            this.GetInstanceData().opArrow().SetSubTarget(C_CommissionDSGlobalInfoView.GetSubTargetConfig());
            this.GetInstanceData().opArrow().SetWeather(C_CommissionDSGlobalInfoView.GetStartWeatherConfig());
            this.GetInstanceData().opArrow().SetArea(C_CommissionDSGlobalInfoView.GetSpawnAreaConfig());
            this.GetInstanceData().opArrow().SetStartTime(C_CommissionDSGlobalInfoView.GetStartTimeInHoursOverride());
            this.GetInstanceData().opArrow().SetEntryRule(C_CommissionDSGlobalInfoView.GetEntryRuleConfig());
            return;
        }
        this.SetInstanceData(TEUIModelRef<FM_CommissionInstanceData>());
        return;
    }
    TDataObjectPtr<FCommissionConfig> GetCommissionConfig() const property
    {
        TDataObjectPtr<FCommissionConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FCommissionConfig> GetModify_CommissionConfig() property
    {
        TDataObjectPtr<FCommissionConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetCommissionConfig(const TDataObjectPtr<FCommissionConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CommissionConfig = __Value;
        return;
    }
    int GetFinishCount() const property
    {
        this.TrackPropertyRead(1);
        return this.m_FinishCount;
    }
    void SetFinishCount(const int __Value) property
    {
        if (this.m_FinishCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_FinishCount = __Value;
        return;
    }
    int GetBestCostTimeSec() const property
    {
        this.TrackPropertyRead(2);
        return this.m_BestCostTimeSec;
    }
    void SetBestCostTimeSec(const int __Value) property
    {
        if (this.m_BestCostTimeSec == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_BestCostTimeSec = __Value;
        return;
    }
    ECommissionTier GetBestAchievedTier() const property
    {
        this.TrackPropertyRead(3);
        return this.m_BestAchievedTier;
    }
    void SetBestAchievedTier(const ECommissionTier __Value) property
    {
        if (int(this.m_BestAchievedTier) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_BestAchievedTier = __Value;
        return;
    }
    TEUIModelRef<FM_CommissionInstanceData> GetInstanceData() const property
    {
        this.TrackPropertyRead(4);
        return this.m_InstanceData;
    }
    void SetInstanceData(const TEUIModelRef<FM_CommissionInstanceData> &inout __Value) property
    {
        TEUIModelRef<FM_CommissionInstanceData> local_2;
        local_2 = this.m_InstanceData;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_InstanceData = __Value;
        return;
    }
}

struct __Lambda_UI_Private_Model_Level_Commission_M_Commission_201
{
    __Lambda_UI_Private_Model_Level_Commission_M_Commission_201()
    {
        return;
    }
    bool opCall(const TEUIModelRef<FM_CommissionTier> &inout A, const TEUIModelRef<FM_CommissionTier> &inout B)
    {
        if (!(A.opArrow().GetCommissionTierConfig()))
        {
            return false;
        }
        if (!(B.opArrow().GetCommissionTierConfig()))
        {
            return true;
        }
        int local_4 = int(A.opArrow().GetCommissionTierConfig().opArrow().Tier);
        int local_5 = int(B.opArrow().GetCommissionTierConfig().opArrow().Tier);
        return (local_4 < local_5);
    }
}

namespace FM_CommissionInstanceData
{
FM_CommissionInstanceData& Create(const UObject ContextObject)
{
    return FM_CommissionInstanceData::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FM_CommissionInstanceData CreateByManager(const UEUIManagerSubsystem Manager)
{
    FM_CommissionInstanceData __r;
    TEUIModelRef<FM_CommissionInstanceData> local_6 = TEUIModelRef<FM_CommissionInstanceData>(EUIInternal::MakeModelWithManager(Manager, FM_CommissionInstanceData::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_CommissionInstanceData;
}
int __IndexOf_IntrusionPolicy()
{
    return 0;
}
int __IndexOf_SubTarget()
{
    return 1;
}
int __IndexOf_Weather()
{
    return 2;
}
int __IndexOf_Area()
{
    return 3;
}
int __IndexOf_StartTime()
{
    return 4;
}
int __IndexOf_EntryRule()
{
    return 5;
}
int __IndexOf_bIsOnDashboard()
{
    return 6;
}
}
namespace FM_Commission
{
FM_Commission& Create(const UObject ContextObject)
{
    return FM_Commission::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FM_Commission CreateByManager(const UEUIManagerSubsystem Manager)
{
    FM_Commission __r;
    TEUIModelRef<FM_Commission> local_6 = TEUIModelRef<FM_Commission>(EUIInternal::MakeModelWithManager(Manager, FM_Commission::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_Commission;
}
int __IndexOf_CommissionConfig()
{
    return 0;
}
int __IndexOf_FinishCount()
{
    return 1;
}
int __IndexOf_BestCostTimeSec()
{
    return 2;
}
int __IndexOf_BestAchievedTier()
{
    return 3;
}
int __IndexOf_InstanceData()
{
    return 4;
}
}

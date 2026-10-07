
namespace FM_CommissionTier
{
    const int ModelId = 0;

}
struct FM_CommissionTier : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    TEUIModelRef<FM_Commission> m_Commission;
    UPROPERTY()
    ECommissionTier m_Tier;
    UPROPERTY()
    TDataObjectPtr<FCommissionTierConfig> m_CommissionTierConfig;
    UPROPERTY()
    int m_TimeLimitSec;
    UPROPERTY()
    bool m_bAchieved;
    UPROPERTY()
    bool m_bIsHighestAchieved;
    UPROPERTY()
    TArray<TEUIModelRef<FM_ItemData>> m_RewardItems;

    FM_CommissionTier()
    {
        this.m_Tier = ECommissionTier(0);
        this.m_TimeLimitSec = 0;
        this.m_bAchieved = false;
        this.m_bIsHighestAchieved = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FM_CommissionTier' by default constructor.");
        return;
    }
    FM_CommissionTier(const FM_CommissionTier &inout Other)
    {
        this.m_Tier = ECommissionTier(0);
        this.m_TimeLimitSec = 0;
        this.m_bAchieved = false;
        this.m_bIsHighestAchieved = false;
        this.m_Commission = Other.m_Commission;
        this.m_Tier = Other.m_Tier;
        this.m_CommissionTierConfig = Other.m_CommissionTierConfig;
        this.m_TimeLimitSec = int(Other.m_TimeLimitSec);
        this.m_bAchieved = Other.m_bAchieved;
        this.m_bIsHighestAchieved = Other.m_bIsHighestAchieved;
        this.m_RewardItems = Other.m_RewardItems;
        return;
    }
    FM_CommissionTier(const TEUIModelRef<FM_Commission> &inout InCommission, const ECommissionTier InTier)
    {
        this.m_Tier = ECommissionTier(0);
        this.m_TimeLimitSec = 0;
        this.m_bAchieved = false;
        this.m_bIsHighestAchieved = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetCommission(InCommission);
        this.SetTier(ECommissionTier(InTier));
        return;
    }
    FM_CommissionTier& opAssign(const FM_CommissionTier &inout Other)
    {
        this.m_Commission = Other.m_Commission;
        this.m_Tier = Other.m_Tier;
        this.m_CommissionTierConfig = Other.m_CommissionTierConfig;
        this.m_TimeLimitSec = int(Other.m_TimeLimitSec);
        this.m_bAchieved = Other.m_bAchieved;
        this.m_bIsHighestAchieved = Other.m_bIsHighestAchieved;
        return Other.m_RewardItems;
    }
    void PostConstruct()
    {
        this.SetCommissionTierConfig(TDataObjectPtr<FCommissionTierConfig>(::FCommissionTierConfig::FindByKey(this.GetTier())));
        TDataObjectPtr<FCommissionConfig> local_76 = this.GetCommission().opArrow().GetCommissionConfig();
        CastTo local_128;
        TDataObjectPtr<FRaceCommissionConfig> local_152 = local_128.opCall();
        if (!(local_152))
        {
            return;
        }
        for (auto& local_168 : local_152.opArrow().RaceTierRewards)
        {
            if (int(local_168.Tier) != int(this.GetTier()))
            {
                continue;
            }
            this.SetTimeLimitSec(int(local_168.TimeSec));
            if (local_168.Reward.IsSet())
            {
                TArrayConstIterator<FRewardEntry> local_178;
                for (; local_178.CanProceed;)
                {
                    const FRewardEntry& local_186 = local_178.Proceed();
                    if (!(local_186.Item.IsSet()))
                    {
                        continue;
                    }
                    FM_ItemData& local_188 = ::FM_ItemData::Create(this.GetContext().Manager);
                    local_188.SetConfig(local_186.Item);
                    local_188.SetNum(int(local_186.Count));
                    this.GetModify_RewardItems().Add(TEUIModelRef<FM_ItemData>(local_188));
                }
            }
            break;
        }
        return;
    }
    void RefreshAchievedState()
    {
        int local_2;
        int local_133;
        this.SetbAchieved(false);
        this.SetbIsHighestAchieved(false);
        if (this.GetTimeLimitSec() <= 0)
        {
            return;
        }
        TDataObjectPtr<FCommissionConfig> local_30 = this.GetCommission().opArrow().GetCommissionConfig();
        FMS_CommissionLeaderboardManager& local_56 = ::FMS_CommissionLeaderboardManager::Get(this.GetContext().Manager);
        if (!(local_56.GetOrCreateLeaderboard(local_30).IsValid()))
        {
            return;
        }
        TEUIModelRef<FM_CommissionLeaderboardEntry> local_64;
        local_64.GetMyEntry();
        if (local_64.IsValid())
        {
            local_64.GetMyEntry();
            local_2 = GetCostTimeSec();
        }
        else
        {
            local_2 = 0;
        }
        if (local_2 <= 0)
        {
            return;
        }
        this.SetbAchieved((local_2 <= this.GetTimeLimitSec()));
        if (this.GetbAchieved())
        {
            CastTo local_92;
            TDataObjectPtr<FRaceCommissionConfig> local_116 = local_92.opCall();
            this.SetbIsHighestAchieved(true);
            for (auto& local_130 : local_116.opArrow().RaceTierRewards)
            {
                if (int(local_130.Tier) == int(this.GetTier()))
                {
                    continue;
                }
                local_133 = int(local_130.TimeSec);
                if (local_133 > 0 && (local_133 < this.GetTimeLimitSec()) && (local_2 <= local_133))
                {
                    this.SetbIsHighestAchieved(false);
                    break;
                }
            }
        }
        return;
    }
    FText GetTimeLimitText() const
    {
        if (this.GetTimeLimitSec() <= 0)
        {
            return FText();
        }
        return ::CommissionUtils::GetRaceCommissionTimeText(this.GetTimeLimitSec());
    }
    TEUIModelRef<FM_Commission> GetCommission() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Commission;
    }
    void SetCommission(const TEUIModelRef<FM_Commission> &inout __Value) property
    {
        TEUIModelRef<FM_Commission> local_2;
        local_2 = this.m_Commission;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Commission = __Value;
        return;
    }
    ECommissionTier GetTier() const property
    {
        this.TrackPropertyRead(1);
        return this.m_Tier;
    }
    void SetTier(const ECommissionTier __Value) property
    {
        if (int(this.m_Tier) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Tier = __Value;
        return;
    }
    const TDataObjectPtr<FCommissionTierConfig> GetCommissionTierConfig() const property
    {
        const TDataObjectPtr<FCommissionTierConfig> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TDataObjectPtr<FCommissionTierConfig> GetModify_CommissionTierConfig() property
    {
        TDataObjectPtr<FCommissionTierConfig> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetCommissionTierConfig(const TDataObjectPtr<FCommissionTierConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CommissionTierConfig = __Value;
        return;
    }
    int GetTimeLimitSec() const property
    {
        this.TrackPropertyRead(3);
        return this.m_TimeLimitSec;
    }
    void SetTimeLimitSec(const int __Value) property
    {
        if (this.m_TimeLimitSec == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_TimeLimitSec = __Value;
        return;
    }
    bool GetbAchieved() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bAchieved;
    }
    void SetbAchieved(const bool __Value) property
    {
        if (!(this.m_bAchieved) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bAchieved = __Value;
        return;
    }
    bool GetbIsHighestAchieved() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bIsHighestAchieved;
    }
    void SetbIsHighestAchieved(const bool __Value) property
    {
        if (!(this.m_bIsHighestAchieved) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bIsHighestAchieved = __Value;
        return;
    }
    TArray<TEUIModelRef<FM_ItemData>> GetRewardItems() const property
    {
        TArray<TEUIModelRef<FM_ItemData>> __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    TArray<TEUIModelRef<FM_ItemData>> GetModify_RewardItems() property
    {
        TArray<TEUIModelRef<FM_ItemData>> __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetRewardItems(const TArray<TEUIModelRef<FM_ItemData>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_RewardItems = __Value;
        return;
    }
}

namespace FM_CommissionTier
{
FM_CommissionTier& Create(const UObject ContextObject, const TEUIModelRef<FM_Commission> &inout Commission, const ECommissionTier Tier)
{
    return FM_CommissionTier::CreateByManager(EUIInternal::GetContextManager(ContextObject), Commission);
}
FM_CommissionTier CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Commission> &inout Commission, const ECommissionTier Tier)
{
    FM_CommissionTier __r;
    TEUIModelRef<FM_CommissionTier> local_6 = TEUIModelRef<FM_CommissionTier>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_CommissionTier::ModelId, 0, Commission, Tier));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    FEUIModelEffectDefine local_8;
    local_8.FunctionName = "RefreshAchievedState";
    Result.EffectFunctions.Add(local_8);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_CommissionTier;
}
int __IndexOf_Commission()
{
    return 0;
}
int __IndexOf_Tier()
{
    return 1;
}
int __IndexOf_CommissionTierConfig()
{
    return 2;
}
int __IndexOf_TimeLimitSec()
{
    return 3;
}
int __IndexOf_bAchieved()
{
    return 4;
}
int __IndexOf_bIsHighestAchieved()
{
    return 5;
}
int __IndexOf_RewardItems()
{
    return 6;
}
}

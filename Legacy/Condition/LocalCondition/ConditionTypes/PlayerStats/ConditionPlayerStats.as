enum EPlayerStatsCountType
{
    Self,
    Team,
    AllPlayers,
}

class UConditionPlayerStats : ULocalConditionTypeDefineBase
{
    int EventNameParamIndex = 1;

    void OnConditionRegistered(const FLocalConditionInstance &inout ConditionInstance) const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        0.MonitoredStats.FindOrAdd(this.GetPlayerStatsType(ConditionInstance.GetInstanceData().GetConditionConfig())).ConditionInstances.Add(ConditionInstance.GetHandle());
        return;
    }
    void OnConditionUnregistered(const FLocalConditionInstance &inout ConditionInstance) const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Modify local_6;
        FCS_PlayerStatsConditionManager& local_8 = local_6.opCall();
        if (local_8)
        {
            int local_10 = int(this.GetPlayerStatsType(ConditionInstance.GetInstanceData().GetConditionConfig()));
            TMap<ECommissionPlayerStatsType, FPlayerStatsMonitorConditions> local_14 = local_8.MonitoredStats;
            if (local_14.Contains(ECommissionPlayerStatsType(local_10)))
            {
                TArray<FConditionInstanceHandle> local_16;
                local_16.Remove(ConditionInstance.GetHandle());
                if (local_16.IsEmpty())
                {
                    local_14.Remove(ECommissionPlayerStatsType(local_10));
                    if (local_14.IsEmpty())
                    {
                        FECSWorldPtr local_46 = ECS::GetECSWorld();
                        Remove local_50;
                        local_50.opCall();
                    }
                }
            }
        }
        return;
    }
    void ValidateConditionConfig(const TDataObjectPtr<FLocalConditionConfig> &inout ConditionConfig, TArray<FString> &inout OutErrorMessages) const
    {
        if (!(FInstancedStruct::GetPtr(ConditionConfig.opArrow().ConditionTypeDefineConfig).opCall()))
        {
            OutErrorMessages.Add("Condition type define config is empty");
            return;
        }
        switch (int(ConditionConfig.Get().CompareType))
        {
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        {
            return;
        }
        default:
        {
            OutErrorMessages.Add("unsupported compare type!");
        }
        }
    }
    ECommissionPlayerStatsType GetPlayerStatsType(const TDataObjectPtr<FLocalConditionConfig> &inout ConditionConfig) const
    {
        return FInstancedStruct::GetPtr(ConditionConfig.opArrow().ConditionTypeDefineConfig).opCall().opArrow().PlayerStatsType;
    }
}

struct FConditionPlayerStatsConfig : FLocalConditionTypeDefineConfigBase
{
    FLocalConditionTypeDefineConfigBase _base_FLocalConditionTypeDefineConfigBase;
    UPROPERTY()
    EPlayerStatsCountType PlayerStatsCountType;
    UPROPERTY()
    ECommissionPlayerStatsType PlayerStatsType;

    default _base_FLocalConditionTypeDefineConfigBase = UConditionPlayerStats;

    FConditionPlayerStatsConfig()
    {
        this.PlayerStatsType = ECommissionPlayerStatsType(0);
        this.PlayerStatsCountType = EPlayerStatsCountType(2);
        this.__InitDefaults();
        return;
    }
}


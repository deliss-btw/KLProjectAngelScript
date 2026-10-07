
enum EPlayerStatsCountType
{
    Self,
    Team,
    AllPlayers,
}


// NOTE: class defaults are not authored in this module: FConditionPlayerStatsConfig (body was stubbed).
// They are carried over byte-exact when this module is recompiled.

class UConditionPlayerStats : ULocalConditionTypeDefineBase
{
    int EventNameParamIndex = 1;


    void OnConditionRegistered(const FLocalConditionInstance &inout ConditionInstance) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void OnConditionUnregistered(const FLocalConditionInstance &inout ConditionInstance) const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Modify local_6;
        FCS_PlayerStatsConditionManager& local_8 = local_6.opCall();
        if (local_8)
        {
            TMap<ECommissionPlayerStatsType, FPlayerStatsMonitorConditions> local_14 = local_8.MonitoredStats;
            if (local_14.Contains(this.GetPlayerStatsType(GetConditionConfig())))
            {
                TArray<FConditionInstanceHandle> local_16;
                FConditionInstanceHandle local_42 = ConditionInstance.GetHandle();
                if (local_16.IsEmpty())
                {
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
        int local_11 = 0;
        if (!(FInstancedStruct::GetPtr(ConditionConfig.opArrow().ConditionTypeDefineConfig).opCall()))
        {
            OutErrorMessages.Add("Condition type define config is empty");
            return;
        }
        switch (local_11)
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

    FConditionPlayerStatsConfig()
    {
        super();
        this.PlayerStatsType = ECommissionPlayerStatsType(0);
        this.PlayerStatsCountType = EPlayerStatsCountType(2);
        this.__InitDefaults();
        return;
    }
}




// NOTE: class defaults are not authored in this module: FConditionMonsterDeathConfig (body was stubbed).
// They are carried over byte-exact when this module is recompiled.

class UConditionMonsterDeath : ULocalConditionTypeDefineBase
{
    UConditionMonsterDeath()
    {
        super();
        return;
    }
    void OnConditionRegistered(const FLocalConditionInstance &inout ConditionInstance) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void OnConditionUnregistered(const FLocalConditionInstance &inout ConditionInstance) const
    {
        TDataObjectPtr<FMonsterMainConfig> local_30;
        TConstRawPtr<FConditionMonsterDeathConfig> local_26 = this.GetConditionMonsterDeathConfig(ConditionInstance.GetConditionConfig());
        if (local_30)
        {
            FECSWorldPtr local_34 = ECS::GetECSWorld();
            Modify local_38;
            FCS_ConditionMonsterDeathManager& local_40 = local_38.opCall();
            if (local_40)
            {
                if (local_40.MonitoredMonsters.Contains(local_30))
                {
                    TArray<FConditionInstanceHandle> local_42;
                    FConditionInstanceHandle local_68 = ConditionInstance.GetHandle();
                    if (local_42.IsEmpty())
                    {
                        if (local_40.MonitoredMonsters.IsEmpty())
                        {
                            FECSWorldPtr local_72 = ECS::GetECSWorld();
                            Remove local_76;
                            local_76.opCall();
                        }
                    }
                }
            }
        }
        return;
    }
    void ValidateConditionConfig(const TDataObjectPtr<FLocalConditionConfig> &inout ConditionConfig, TArray<FString> &inout OutErrorMessages) const
    {
        TConstRawPtr<FConditionMonsterDeathConfig> local_2 = this.GetConditionMonsterDeathConfig(ConditionConfig);
        if (local_2)
        {
            if (!(local_2.opArrow().MonsterConfig))
            {
                OutErrorMessages.Add("Monster config is empty");
            }
            return;
        }
        OutErrorMessages.Add("Failed to get condition monster death config");
        return;
    }
    TConstRawPtr<FConditionMonsterDeathConfig> GetConditionMonsterDeathConfig(const TDataObjectPtr<FLocalConditionConfig> &inout ConditionConfig) const
    {
        if (FInstancedStruct::GetPtr(ConditionConfig.opArrow().ConditionTypeDefineConfig).opCall())
        {
            return TConstRawPtr<FConditionMonsterDeathConfig>();
        }
        return TConstRawPtr<FConditionMonsterDeathConfig>(nullptr);
    }
}

struct FConditionMonsterDeathConfig : FLocalConditionTypeDefineConfigBase
{
    FLocalConditionTypeDefineConfigBase _base_FLocalConditionTypeDefineConfigBase;
    UPROPERTY()
    ELocalConditionPlayerFilter PlayerFilter;
    UPROPERTY()
    TDataObjectPtr<FMonsterMainConfig> MonsterConfig;
    UPROPERTY()
    TSoftClassPtr<AKLLevelScriptBaseActor> DataLayerLevelClass;

    FConditionMonsterDeathConfig()
    {
        super();
        this.PlayerFilter = ELocalConditionPlayerFilter(0);
        this.__InitDefaults();
        return;
    }
}


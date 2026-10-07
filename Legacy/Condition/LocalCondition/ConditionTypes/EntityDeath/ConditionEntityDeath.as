

// NOTE: class defaults are not authored in this module: FConditionEntityDeathConfig (body was stubbed).
// They are carried over byte-exact when this module is recompiled.

class UConditionEntityDeath : ULocalConditionTypeDefineBase
{
    UPROPERTY()
    UDataTable PrefabConfigTable;

    UConditionEntityDeath()
    {
        super();
        return;
    }
    void OnConditionRegistered(const FLocalConditionInstance &inout ConditionInstance) const
    {
        TDataObjectPtr<FBasePrefabConfig> local_24 = this.GetPrefabConfig(GetConditionConfig());
        FConditionInstanceHandle local_80 = ConditionInstance.GetHandle();
        FECSWorldPtr local_50 = ECS::GetECSWorld();
        ModifyOrAdd local_54;
        local_54.opCall().MonitoredPrefabs.FindOrAdd(local_24).ConditionInstances.Add(local_80);
        return;
    }
    void OnConditionUnregistered(const FLocalConditionInstance &inout ConditionInstance) const
    {
        TDataObjectPtr<FBasePrefabConfig> local_24 = this.GetPrefabConfig(GetConditionConfig());
        FECSWorldPtr local_50 = ECS::GetECSWorld();
        Modify local_54;
        FCS_EntityDeathConditionManager& local_56 = local_54.opCall();
        if (local_56)
        {
            TMap<TDataObjectPtr<FBasePrefabConfig>, FEntityDeathMonitorConditions> local_60 = local_56.MonitoredPrefabs;
            if (local_60.Contains(local_24))
            {
                TArray<FConditionInstanceHandle> local_62;
                FConditionInstanceHandle local_88 = ConditionInstance.GetHandle();
                if (local_62.IsEmpty())
                {
                    if (local_60.IsEmpty())
                    {
                        FECSWorldPtr local_92 = ECS::GetECSWorld();
                        Remove local_96;
                        local_96.opCall();
                    }
                }
            }
        }
        return;
    }
    void ValidateConditionConfig(const TDataObjectPtr<FLocalConditionConfig> &inout ConditionConfig, TArray<FString> &inout OutErrorMessages) const
    {
        if (!(this.GetPrefabConfig(ConditionConfig)))
        {
            OutErrorMessages.Add("Prefab config is empty");
        }
        return;
    }
    TDataObjectPtr<FBasePrefabConfig> GetPrefabConfig(const TDataObjectPtr<FLocalConditionConfig> &inout ConditionConfig) const
    {
        TConstRawPtr<FConditionEntityDeathConfig> local_6 = FInstancedStruct::GetPtr(ConditionConfig.opArrow().ConditionTypeDefineConfig).opCall();
        if (local_6)
        {
            return local_6.opArrow().PrefabConfig;
        }
        return TDataObjectPtr<FBasePrefabConfig>(nullptr);
    }
}

struct FConditionEntityDeathConfig : FLocalConditionTypeDefineConfigBase
{
    FLocalConditionTypeDefineConfigBase _base_FLocalConditionTypeDefineConfigBase;
    UPROPERTY()
    ELocalConditionPlayerFilter PlayerFilter;
    UPROPERTY()
    TDataObjectPtr<FBasePrefabConfig> PrefabConfig;
    UPROPERTY()
    TSoftClassPtr<AKLLevelScriptBaseActor> DataLayerLevelClass;

    FConditionEntityDeathConfig()
    {
        super();
        this.PlayerFilter = ELocalConditionPlayerFilter(0);
        this.__InitDefaults();
        return;
    }
}


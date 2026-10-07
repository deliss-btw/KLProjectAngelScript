
enum EGameplayTagChangedMonitorType
{
    OnTagAdded,
    OnTagRemoved,
    OnTagChanged,
}


// NOTE: class defaults are not authored in this module: FConditionGameplayTagChangedConfig (body was stubbed).
// They are carried over byte-exact when this module is recompiled.

class UConditionGameplayTagChanged : ULocalConditionTypeDefineBase
{
    UConditionGameplayTagChanged()
    {
        super();
        return;
    }
    void OnConditionRegistered(const FLocalConditionInstance &inout ConditionInstance) const
    {
        FGameplayTag local_2 = this.GetGameplayTag(GetConditionConfig());
        FConditionInstanceHandle local_36 = ConditionInstance.GetHandle();
        FECSWorldPtr local_6 = ECS::GetECSWorld();
        ModifyOrAdd local_10;
        local_10.opCall().MonitoredTags.FindOrAdd(local_2).ConditionInstances.Add(local_36);
        return;
    }
    void OnConditionUnregistered(const FLocalConditionInstance &inout ConditionInstance) const
    {
        FGameplayTag local_2 = this.GetGameplayTag(GetConditionConfig());
        FECSWorldPtr local_6 = ECS::GetECSWorld();
        Modify local_10;
        FCS_GameplayTagChangedConditionManager& local_12 = local_10.opCall();
        if (local_12)
        {
            TMap<FGameplayTag, FGameplayTagChangedMonitorConditions> local_16 = local_12.MonitoredTags;
            if (local_16.Contains(local_2))
            {
                TArray<FConditionInstanceHandle> local_18;
                FConditionInstanceHandle local_44 = ConditionInstance.GetHandle();
                if (local_18.IsEmpty())
                {
                    if (local_16.IsEmpty())
                    {
                        FECSWorldPtr local_48 = ECS::GetECSWorld();
                        Remove local_52;
                        local_52.opCall();
                    }
                }
            }
        }
        return;
    }
    void ValidateConditionConfig(const TDataObjectPtr<FLocalConditionConfig> &inout ConditionConfig, TArray<FString> &inout OutErrorMessages) const
    {
        if (!(this.GetGameplayTag(ConditionConfig).IsValid()))
        {
            OutErrorMessages.Add("Gameplay tag is empty");
        }
        return;
    }
    FGameplayTag GetGameplayTag(const TDataObjectPtr<FLocalConditionConfig> &inout ConditionConfig) const
    {
        TConstRawPtr<FConditionGameplayTagChangedConfig> local_6 = FInstancedStruct::GetPtr(ConditionConfig.opArrow().ConditionTypeDefineConfig).opCall();
        if (local_6)
        {
            return local_6.opArrow().GameplayTag;
        }
        return FGameplayTag();
    }
}

struct FConditionGameplayTagChangedConfig : FLocalConditionTypeDefineConfigBase
{
    FLocalConditionTypeDefineConfigBase _base_FLocalConditionTypeDefineConfigBase;
    UPROPERTY()
    TDataObjectPtr<FBasePrefabConfig> PrefabConfig;
    UPROPERTY()
    FGameplayTag GameplayTag;
    UPROPERTY()
    EGameplayTagChangedMonitorType MonitorType;
    UPROPERTY()
    ELocalConditionPlayerFilter PlayerFilter;

    FConditionGameplayTagChangedConfig()
    {
        super();
        this.MonitorType = EGameplayTagChangedMonitorType(0);
        this.PlayerFilter = ELocalConditionPlayerFilter(0);
        this.__InitDefaults();
        return;
    }
}


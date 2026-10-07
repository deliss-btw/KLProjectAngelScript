

// NOTE: class defaults are not authored in this module: FConditionBodyPartDestroyConfig (body was stubbed).
// They are carried over byte-exact when this module is recompiled.

class UConditionBodyPartDestroy : ULocalConditionTypeDefineBase
{
    UConditionBodyPartDestroy()
    {
        super();
        return;
    }
    void OnConditionRegistered(const FLocalConditionInstance &inout ConditionInstance) const
    {
        FName local_2 = this.GetBodyPartName(GetConditionConfig());
        FConditionInstanceHandle local_36 = ConditionInstance.GetHandle();
        FECSWorldPtr local_6 = ECS::GetECSWorld();
        ModifyOrAdd local_10;
        local_10.opCall().MonitoredBodyParts.FindOrAdd(local_2).ConditionInstances.Add(local_36);
        return;
    }
    void OnConditionUnregistered(const FLocalConditionInstance &inout ConditionInstance) const
    {
        FName local_2 = this.GetBodyPartName(GetConditionConfig());
        FECSWorldPtr local_6 = ECS::GetECSWorld();
        Modify local_10;
        FCS_BodyPartDestroyConditionManager& local_12 = local_10.opCall();
        if (local_12)
        {
            TMap<FName, FBodyPartDestroyMonitorConditions> local_16 = local_12.MonitoredBodyParts;
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
        if ((this.GetBodyPartName(ConditionConfig) == NAME_None))
        {
            OutErrorMessages.Add("Body part name is empty");
        }
        return;
    }
    FName GetBodyPartName(const TDataObjectPtr<FLocalConditionConfig> &inout ConditionConfig) const
    {
        TConstRawPtr<FConditionBodyPartDestroyConfig> local_6 = FInstancedStruct::GetPtr(ConditionConfig.opArrow().ConditionTypeDefineConfig).opCall();
        if (local_6)
        {
            return local_6.opArrow().BodyPart;
        }
        return NAME_None;
    }
}

struct FConditionBodyPartDestroyConfig : FLocalConditionTypeDefineConfigBase
{
    FLocalConditionTypeDefineConfigBase _base_FLocalConditionTypeDefineConfigBase;
    UPROPERTY()
    FName BodyPart;
    UPROPERTY()
    TDataObjectPtr<FBasePrefabConfig> PrefabConfig;

    FConditionBodyPartDestroyConfig()
    {
        super();
        this.__InitDefaults();
        return;
    }
}


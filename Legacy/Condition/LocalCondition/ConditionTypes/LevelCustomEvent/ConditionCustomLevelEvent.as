

// NOTE: class defaults are not authored in this module: FConditionCustomLevelEventConfig (body was stubbed).
// They are carried over byte-exact when this module is recompiled.

class UConditionCustomLevelEvent : ULocalConditionTypeDefineBase
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
        if (local_6.opCall())
        {
            FName local_13;
            TMap<FName, FLevelCustomEventMonitorConditions> local_16 = local_13 = this.GetEventName(GetConditionConfig());
            if (local_16.Contains(local_13))
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
    FName GetEventName(const TDataObjectPtr<FLocalConditionConfig> &inout ConditionConfig) const
    {
        return FInstancedStruct::GetPtr(ConditionConfig.opArrow().ConditionTypeDefineConfig).opCall().opArrow().EventName;
    }
}

struct FConditionCustomLevelEventConfig : FLocalConditionTypeDefineConfigBase
{
    FLocalConditionTypeDefineConfigBase _base_FLocalConditionTypeDefineConfigBase;
    UPROPERTY()
    FName EventName;

    FConditionCustomLevelEventConfig()
    {
        super();
        this.__InitDefaults();
        return;
    }
}


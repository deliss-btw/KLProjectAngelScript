

// NOTE: class defaults are not authored in this module: FConditionTimeDurationConfig (body was stubbed).
// They are carried over byte-exact when this module is recompiled.

class UConditionTimeDuration : ULocalConditionTypeDefineBase
{
    int EventNameParamIndex = 1;


    void OnConditionRegistered(const FLocalConditionInstance &inout ConditionInstance) const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        0.ConditionInstances.Add(ConditionInstance.GetHandle());
        return;
    }
    void OnConditionUnregistered(const FLocalConditionInstance &inout ConditionInstance) const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Modify local_6;
        FCS_TimeDurationConditionManager& local_8 = local_6.opCall();
        if (local_8)
        {
            int local_13 = local_8.ConditionInstances.Num() - 1;
            for (; local_13 >= 0; --local_13)
            {
                FConditionInstanceHandle local_40;
                if (local_40.opCmp(ConditionInstance.GetHandle()) == 0)
                {
                    local_8.ConditionInstances.RemoveAt(local_13);
                    if (local_8.ConditionInstances.IsEmpty())
                    {
                        FECSWorldPtr local_68 = ECS::GetECSWorld();
                        Remove local_72;
                        local_72.opCall();
                    }
                }
            }
        }
        return;
    }
    void ValidateConditionConfig(const TDataObjectPtr<FLocalConditionConfig> &inout ConditionConfig, TArray<FString> &inout OutErrorMessages) const
    {
        if (ConditionConfig.opArrow().TargetValue <= 0)
        {
            OutErrorMessages.Add("TargetValue must be greater than 0");
            return;
        }
        return;
    }
}

struct FConditionTimeDurationConfig : FLocalConditionTypeDefineConfigBase
{
    FLocalConditionTypeDefineConfigBase _base_FLocalConditionTypeDefineConfigBase;

    FConditionTimeDurationConfig()
    {
        super();
        this.__InitDefaults();
        return;
    }
}


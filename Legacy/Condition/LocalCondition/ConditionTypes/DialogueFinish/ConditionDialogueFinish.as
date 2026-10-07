

// NOTE: class defaults are not authored in this module: FConditionDialogueFinishConfig (body was stubbed).
// They are carried over byte-exact when this module is recompiled.

class UConditionDialogueFinish : ULocalConditionTypeDefineBase
{
    UConditionDialogueFinish()
    {
        super();
        return;
    }
    void GetSubscriptionKeys(const TDataObjectPtr<FLocalConditionConfig> &inout ConditionConfig, TArray<FName> &inout OutKeys) const
    {
        if ((ConditionConfig == nullptr))
        {
            return;
        }
        if (FInstancedStruct::GetPtr(ConditionConfig.opArrow().ConditionTypeDefineConfig).opCall())
        {
            TDataObjectPtr<FDialogueConfig> local_12;
            if (local_12.IsSet())
            {
                FName local_14;
                local_14.GetDataName();
                OutKeys.Add(local_14);
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

struct FConditionDialogueFinishConfig : FLocalConditionTypeDefineConfigBase
{
    FLocalConditionTypeDefineConfigBase _base_FLocalConditionTypeDefineConfigBase;
    UPROPERTY()
    TDataObjectPtr<FDialogueConfig> Dialogue;
    UPROPERTY()
    TDataObjectPtr<FDialogueLineConfig> CheckOption;

    FConditionDialogueFinishConfig()
    {
        super();
        this.__InitDefaults();
        return;
    }
}


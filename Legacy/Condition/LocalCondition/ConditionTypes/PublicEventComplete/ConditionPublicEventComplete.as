

// NOTE: class defaults are not authored in this module: FConditionPublicEventCompleteConfig (body was stubbed).
// They are carried over byte-exact when this module is recompiled.

class UConditionPublicEventComplete : ULocalConditionTypeDefineBase
{
    UConditionPublicEventComplete()
    {
        super();
        return;
    }
    void ValidateConditionConfig(const TDataObjectPtr<FLocalConditionConfig> &inout ConditionConfig, TArray<FString> &inout OutErrorMessages) const
    {
        if (!(this.GetConditionPublicEventCompleteConfig(ConditionConfig)))
        {
            OutErrorMessages.Add("Failed to get condition public event complete config");
        }
        return;
    }
    TConstRawPtr<FConditionPublicEventCompleteConfig> GetConditionPublicEventCompleteConfig(const TDataObjectPtr<FLocalConditionConfig> &inout ConditionConfig) const
    {
        if (FInstancedStruct::GetPtr(ConditionConfig.opArrow().ConditionTypeDefineConfig).opCall())
        {
            return TConstRawPtr<FConditionPublicEventCompleteConfig>();
        }
        return TConstRawPtr<FConditionPublicEventCompleteConfig>(nullptr);
    }
}

struct FConditionPublicEventCompleteConfig : FLocalConditionTypeDefineConfigBase
{
    FLocalConditionTypeDefineConfigBase _base_FLocalConditionTypeDefineConfigBase;
    UPROPERTY()
    TDataObjectPtr<FLevelPublicEventInfoConfig> EventInfoFilter;

    FConditionPublicEventCompleteConfig()
    {
        super();
        this.__InitDefaults();
        return;
    }
}


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
        TConstRawPtr<FConditionPublicEventCompleteConfig> local_6 = FInstancedStruct::GetPtr(ConditionConfig.opArrow().ConditionTypeDefineConfig).opCall();
        if (local_6)
        {
            return TConstRawPtr<FConditionPublicEventCompleteConfig>(local_6.Get());
        }
        return TConstRawPtr<FConditionPublicEventCompleteConfig>(nullptr);
    }
}

struct FConditionPublicEventCompleteConfig : FLocalConditionTypeDefineConfigBase
{
    FLocalConditionTypeDefineConfigBase _base_FLocalConditionTypeDefineConfigBase;
    UPROPERTY()
    TDataObjectPtr<FLevelPublicEventInfoConfig> EventInfoFilter;

    default _base_FLocalConditionTypeDefineConfigBase = UConditionPublicEventComplete;

    FConditionPublicEventCompleteConfig()
    {
        this.__InitDefaults();
        return;
    }
}


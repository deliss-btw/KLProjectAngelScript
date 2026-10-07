

// NOTE: class defaults are not authored in this module: FConditionCombatItemUseConfig (body was stubbed).
// They are carried over byte-exact when this module is recompiled.

class UConditionCombatItemUse : ULocalConditionTypeDefineBase
{
    UConditionCombatItemUse()
    {
        super();
        return;
    }
    void GetSubscriptionKeys(const TDataObjectPtr<FLocalConditionConfig> &inout ConditionConfig, TArray<FName> &inout OutKeys) const
    {
        TDataObjectPtr<FCombatItemConfig> local_8;
        if ((this.GetConditionCombatItemUseConfig(ConditionConfig) == nullptr))
        {
            return;
        }
        if (local_8)
        {
            OutKeys.Add(local_8.GetDataName());
        }
        return;
    }
    void ValidateConditionConfig(const TDataObjectPtr<FLocalConditionConfig> &inout ConditionConfig, TArray<FString> &inout OutErrorMessages) const
    {
        TConstRawPtr<FConditionCombatItemUseConfig> local_2 = this.GetConditionCombatItemUseConfig(ConditionConfig);
        if (local_2)
        {
            if (!(local_2.opArrow().CombatItemConfig))
            {
                OutErrorMessages.Add("Combat item config is empty");
            }
            return;
        }
        OutErrorMessages.Add("Failed to get condition combat item use config");
        return;
    }
    TConstRawPtr<FConditionCombatItemUseConfig> GetConditionCombatItemUseConfig(const TDataObjectPtr<FLocalConditionConfig> &inout ConditionConfig) const
    {
        if ((ConditionConfig == nullptr))
        {
            return TConstRawPtr<FConditionCombatItemUseConfig>(nullptr);
        }
        if (FInstancedStruct::GetPtr(ConditionConfig.opArrow().ConditionTypeDefineConfig).opCall())
        {
            return TConstRawPtr<FConditionCombatItemUseConfig>();
        }
        return TConstRawPtr<FConditionCombatItemUseConfig>(nullptr);
    }
}

struct FConditionCombatItemUseConfig : FLocalConditionTypeDefineConfigBase
{
    FLocalConditionTypeDefineConfigBase _base_FLocalConditionTypeDefineConfigBase;
    UPROPERTY()
    TDataObjectPtr<FCombatItemConfig> CombatItemConfig;

    FConditionCombatItemUseConfig()
    {
        super();
        this.__InitDefaults();
        return;
    }
}


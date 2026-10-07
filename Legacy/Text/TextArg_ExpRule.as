

struct FTextArgConfig_ExpRule : FTextArgConfig
{
    FTextArgConfig _base_FTextArgConfig;
    UPROPERTY()
    TMap<int, FText> RuleDescriptions;

    FTextArgConfig_ExpRule()
    {
        return;
    }
}

class UTextArgParser_ExpRule : UBlueprintTextArgParser
{
    UTextArgParser_ExpRule()
    {
        return;
    }
    UFUNCTION()
    UScriptStruct GetConfigType_Implementation() const
    {
        return FTextArgConfig_ExpRule;
    }
    UFUNCTION()
    bool ParseArgValue_Implementation(const FDataObjectPtr &inout Config, const FTextArgument &inout Arg, FText &inout OutResult) const
    {
        int local_26 = 0;
        TDataObjectPtr<FTextArgConfig_ExpRule> local_24 = TDataObjectPtr<FTextArgConfig_ExpRule>(Config);
        GetValue local_32;
        int local_35 = local_32.opCall();
        FText local_40;
        if (local_26.RuleDescriptions.Find(local_35, local_40))
        {
            OutResult = local_40;
            return true;
        }
        OutResult = local_40;
        return true;
    }
}


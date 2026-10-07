
enum EOpenTimeRuleType
{
    Daily,
    Weekly,
    Monthly,
    Yearly,
}


struct FOpenTimeRange : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    EOpenTimeRuleType RuleType = EOpenTimeRuleType(0);
    UPROPERTY()
    FString Time;
    UPROPERTY()
    FString DateParam;
    UPROPERTY()
    int DurationSeconds;
    UPROPERTY()
    bool bUseUtc0 = false;


}


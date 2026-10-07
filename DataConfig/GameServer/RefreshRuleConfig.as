
enum ERefreshRuleType
{
    None,
    Refresh_FixedTime_Year,
    Refresh_FixedTime_Month,
    Refresh_FixedTime_Week,
    Refresh_FixedTime_Day,
    Refresh_Interval,
    Refresh_Forever,
    Refresh_Once,
}


struct FRefreshRuleConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    ERefreshRuleType RuleType;
    UPROPERTY()
    FText Description;
    UPROPERTY()
    FString DateParam;
    UPROPERTY()
    FString Time;
    UPROPERTY()
    FString IntervalTime;


}


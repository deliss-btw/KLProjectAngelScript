

struct FEventToESMTriggerFilterConfigItemBase
{
    UPROPERTY()
    bool bNotCondition = false;
    UPROPERTY()
    bool bActivateESMTriggerIfConditionMet = true;
    UPROPERTY()
    FNameHandle_ESMBBTrigger SuccessTriggerName;
    UPROPERTY()
    float32 ValidTime = 0.1f;
    UPROPERTY()
    bool bSuccessClearAllTriggers = false;
    UPROPERTY()
    TArray<FNameHandle_ESMBBTrigger> SuccessClearTriggerNames;


}


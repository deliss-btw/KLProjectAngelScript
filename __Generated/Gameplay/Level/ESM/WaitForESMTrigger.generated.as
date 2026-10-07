

class UASWaitForESMTriggerWrapper : UECSAsyncActionBase
{
    UPROPERTY()
    FASWaitForESMTrigger Action;
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    FName TriggerName;
    UPROPERTY()
    FString MatchESMState;
    UPROPERTY()
    FESMTriggerRespondedEvent OnTriggerResponded;

    UASWaitForESMTriggerWrapper()
    {
        return;
    }
    UFUNCTION()
    UScriptStruct GetAsyncActionClass_Implementation() const
    {
        return FASWaitForESMTrigger;
    }
}

namespace FECSAsyncActionFactory_ASWaitForESMTrigger
{
UASWaitForESMTriggerWrapper MakeWrapper(const FASWaitForESMTrigger &inout ActionData)
{
    return UASWaitForESMTriggerWrapper.GetDefaultObject();
}
UFUNCTION()
UASWaitForESMTriggerWrapper Init_FECSEntity_FName_FString(const FECSEntity &inout InEntity, const FName &inout InTriggerName, const FString &inout InMatchESMState)
{
    FASWaitForESMTrigger local_20;
    local_20.Init(InEntity, InTriggerName, InMatchESMState);
    return FECSAsyncActionFactory_ASWaitForESMTrigger::MakeWrapper(local_20);
}
}



class UASWaitForESMActionEventWrapper : UECSAsyncActionBase
{
    UPROPERTY()
    FASWaitForESMActionEvent Action;
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    FName EventName;
    UPROPERTY()
    FECSAsyncActionDelegate OnActionEvent;

    UASWaitForESMActionEventWrapper()
    {
        return;
    }
    UFUNCTION()
    UScriptStruct GetAsyncActionClass_Implementation() const
    {
        return FASWaitForESMActionEvent;
    }
}

namespace FECSAsyncActionFactory_ASWaitForESMActionEvent
{
UASWaitForESMActionEventWrapper MakeWrapper(const FASWaitForESMActionEvent &inout ActionData)
{
    return UASWaitForESMActionEventWrapper.GetDefaultObject();
}
UFUNCTION()
UASWaitForESMActionEventWrapper Init_FECSEntity_FName(const FECSEntity &inout InEntity, const FName &inout InEventName)
{
    FASWaitForESMActionEvent local_16;
    local_16.Init(InEntity, InEventName);
    return FECSAsyncActionFactory_ASWaitForESMActionEvent::MakeWrapper(local_16);
}
}

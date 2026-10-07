

class UASWaitForEventWrapper : UECSAsyncEventActionBase
{
    UPROPERTY()
    FASWaitForEvent Action;

    UASWaitForEventWrapper()
    {
        return;
    }
    UFUNCTION()
    UScriptStruct GetAsyncActionClass_Implementation() const
    {
        return FASWaitForEvent;
    }
}

namespace FECSAsyncEventActionFactory_ASWaitForEvent
{
UASWaitForEventWrapper MakeWrapper(const FASWaitForEvent &inout ActionData)
{
    return UASWaitForEventWrapper.GetDefaultObject();
}
UFUNCTION()
UASWaitForEventWrapper Init()
{
    FASWaitForEvent local_16;
    local_16.Init();
    return FECSAsyncEventActionFactory_ASWaitForEvent::MakeWrapper(local_16);
}
}

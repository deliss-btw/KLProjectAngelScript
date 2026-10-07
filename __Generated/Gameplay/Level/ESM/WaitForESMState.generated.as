

class UASWaitForESMStateWrapper : UECSAsyncActionBase
{
    UPROPERTY()
    FASWaitForESMState Action;
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    FString MatchESMState;
    UPROPERTY()
    FESMStateEnteredEvent OnStateEntered;

    UASWaitForESMStateWrapper()
    {
        return;
    }
    UFUNCTION()
    UScriptStruct GetAsyncActionClass_Implementation() const
    {
        return FASWaitForESMState;
    }
}

namespace FECSAsyncActionFactory_ASWaitForESMState
{
UASWaitForESMStateWrapper MakeWrapper(const FASWaitForESMState &inout ActionData)
{
    return UASWaitForESMStateWrapper.GetDefaultObject();
}
UFUNCTION()
UASWaitForESMStateWrapper Init_FECSEntity_FString(const FECSEntity &inout InEntity, const FString &inout InMatchESMState)
{
    FASWaitForESMState local_18;
    local_18.Init(InEntity, InMatchESMState);
    return FECSAsyncActionFactory_ASWaitForESMState::MakeWrapper(local_18);
}
}

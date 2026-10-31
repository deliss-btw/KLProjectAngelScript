struct FASWaitForESMState : FECSAsyncAction
{
    FECSAsyncAction _base_FECSAsyncAction;
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    FString MatchESMState;
    UPROPERTY()
    FESMStateEnteredEvent OnStateEntered;

    FASWaitForESMState()
    {
        this.__InitDefaults();
        return;
    }
    void Activate_Implementation()
    {
        ::ULevelEventManager::Get().RegisterESMStateEntryAction(this.TargetEntity, this.GetActionHandle());
        return;
    }
    void Deactivate_Implementation()
    {
        ::ULevelEventManager::Get().UnRegisterESMStateEntryAction(this.TargetEntity, this.GetActionHandle());
        return;
    }
    void Init(const FECSEntity &inout InEntity, const FString &inout InMatchESMState)
    {
        this.TargetEntity = InEntity;
        this.MatchESMState = InMatchESMState;
        return;
    }
}

event void FESMStateEnteredEvent(const FString &inout RespondedStateName);




// NOTE: class defaults are not authored in this module: FASWaitForESMState (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

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
        int local_3 = this.GetActionHandle();
        ::ULevelEventManager::Get().RegisterESMStateEntryAction(this.TargetEntity);
        return;
    }
    void Deactivate_Implementation()
    {
        int local_3 = this.GetActionHandle();
        ::ULevelEventManager::Get().UnRegisterESMStateEntryAction(this.TargetEntity);
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


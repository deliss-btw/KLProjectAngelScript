

// NOTE: class defaults are not authored in this module: FASWaitForESMTrigger (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

struct FASWaitForESMTrigger : FECSAsyncAction
{
    FECSAsyncAction _base_FECSAsyncAction;
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    FName TriggerName;
    UPROPERTY()
    FString MatchESMState;
    UPROPERTY()
    FESMTriggerRespondedEvent OnTriggerResponded;

    FASWaitForESMTrigger()
    {
        this.__InitDefaults();
        return;
    }
    void Activate_Implementation()
    {
        ULevelEventManager local_2 = ::ULevelEventManager::Get();
        local_2.RegisterESMTriggerAsyncAction(this.TargetEntity, this.TriggerName, this.GetActionHandle());
        return;
    }
    void Deactivate_Implementation()
    {
        ULevelEventManager local_2 = ::ULevelEventManager::Get();
        local_2.UnRegisterESMTriggerAsyncAction(this.TargetEntity, this.TriggerName, this.GetActionHandle());
        return;
    }
    void Init(const FECSEntity &inout InEntity, const FName &inout InTriggerName, const FString &inout InMatchESMState = "")
    {
        this.TargetEntity = InEntity;
        this.TriggerName = InTriggerName;
        this.MatchESMState = InMatchESMState;
        return;
    }
}

event void FESMTriggerRespondedEvent(const FString &inout RespondedStateName);


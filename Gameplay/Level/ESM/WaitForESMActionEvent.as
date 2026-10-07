

// NOTE: class defaults are not authored in this module: FASWaitForESMActionEvent (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

struct FASWaitForESMActionEvent : FECSAsyncAction
{
    FECSAsyncAction _base_FECSAsyncAction;
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    FName EventName;
    UPROPERTY()
    FECSAsyncActionDelegate OnActionEvent;

    FASWaitForESMActionEvent()
    {
        this.__InitDefaults();
        return;
    }
    void Activate_Implementation()
    {
        ULevelEventManager local_2 = ::ULevelEventManager::Get();
        local_2.RegisterESMActionAsyncAction(this.TargetEntity, this.EventName, this.GetActionHandle());
        return;
    }
    void Deactivate_Implementation()
    {
        ULevelEventManager local_2 = ::ULevelEventManager::Get();
        local_2.UnRegisterESMActionAsyncAction(this.TargetEntity, this.EventName, this.GetActionHandle());
        return;
    }
    void Init(const FECSEntity &inout InEntity, const FName &inout InEventName)
    {
        this.TargetEntity = InEntity;
        this.EventName = InEventName;
        return;
    }
}


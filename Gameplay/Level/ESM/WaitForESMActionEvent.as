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


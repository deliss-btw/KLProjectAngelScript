struct FASWaitForEvent : FECSAsyncEventAction
{
    FECSAsyncEventAction _base_FECSAsyncEventAction;

    FASWaitForEvent()
    {
        this.__InitDefaults();
        return;
    }
    void Activate_Implementation()
    {
        XLog(ELog(22), "WaitForHitEvent: started listening");
        return;
    }
    void Init()
    {
        return;
    }
}


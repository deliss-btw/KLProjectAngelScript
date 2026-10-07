

// NOTE: class defaults are not authored in this module: FASWaitForEvent (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

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


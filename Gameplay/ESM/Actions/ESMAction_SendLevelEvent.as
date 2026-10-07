

// NOTE: class defaults are not authored in this module: UESMAction_SendLevelEvent (default scalar field UESMAction.NetTriggerMode has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class UESMAction_SendLevelEvent : UESMBPBaseInstantAction
{
    UPROPERTY()
    FName EventName;

    UESMAction_SendLevelEvent()
    {
        return;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_20 = 0;
        FECSWorldPtr local_2 = Context.GetECSWorld();
        Get local_6;
        if (local_6.opCall())
        {
            FFPTime local_16 = FFPTime(-1);
            if (local_20)
            {
                local_20.CustomName = this.EventName;
            }
        }
        return;
    }
}


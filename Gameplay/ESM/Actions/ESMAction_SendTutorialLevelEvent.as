

// NOTE: class defaults are not authored in this module: UESMAction_SendTutorialLevelEvent (default scalar field UESMAction.NetTriggerMode has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class UESMAction_SendTutorialLevelEvent : UESMBPBaseInstantAction
{
    UPROPERTY()
    FName EventName;

    UESMAction_SendTutorialLevelEvent()
    {
        return;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        FCE_CustomLevelEvent local_10;
        FFPTime local_6 = FFPTime(-1);
        if (local_10)
        {
            local_10.CustomName = this.EventName;
            local_10.bIsTutorialEvent = true;
        }
        return;
    }
}


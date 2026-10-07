

// NOTE: class defaults are not authored in this module: UESMAction_SendLevelValueEvent (default scalar field UESMAction.NetTriggerMode has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class UESMAction_SendLevelValueEvent : UESMBPBaseInstantAction
{
    UPROPERTY()
    FName EventName;
    UPROPERTY()
    int Count;

    UESMAction_SendLevelValueEvent()
    {
        return;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ::FLevelUtils::SendCustomLevelValueEvent(this.EventName, this.Count);
        return;
    }
}


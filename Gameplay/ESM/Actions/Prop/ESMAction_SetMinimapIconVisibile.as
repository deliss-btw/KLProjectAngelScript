

// NOTE: class defaults are not authored in this module: UESMAction_SetMinimapIconVisibile (default scalar field UESMAction.NetTriggerMode has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class UESMAction_SetMinimapIconVisibile : UESMBPBaseInstantAction
{
    UPROPERTY()
    bool bIsVisible = true;


    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        XError(ELog(0), "SetMinimapIconVisible is not deprecated, use level spot instead");
        return;
    }
}


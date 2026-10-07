

// NOTE: class defaults are not authored in this module: UESMAction_SpawnInteractDropItem (default scalar field UESMAction.NetTriggerMode has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class UESMAction_SpawnInteractDropItem : UESMBPBaseInstantAction
{
    UESMAction_SpawnInteractDropItem()
    {
        return;
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(1);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (::DropItemsUtils::CanTriggerDrop(EDropTriggerType(1), Context.GetEntity()))
        {
            SendEvent local_8;
            local_8.opCall(Time.WorldTime);
        }
        return;
    }
}


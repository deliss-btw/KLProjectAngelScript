

// NOTE: class defaults are not authored in this module: UESMAction_AddMovementEndEventToESMTriggerFilter (default scalar field UESMAction.NetTriggerMode has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class UESMAction_AddMovementEndEventToESMTriggerFilter : UESMBPBaseInstantAction
{
    UPROPERTY()
    bool bNotifySelf = true;
    UPROPERTY()
    FNameHandle_EntityBBVarEntity NotifyEntity_EntityBBVar;
    UPROPERTY()
    FName EventName;


    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        if (local_6)
        {
            FECSEntity local_20;
            if (this.bNotifySelf)
            {
                local_20 = Context.GetEntity();
            }
            else
            {
                FNameHandle_EntityBBVarEntity local_12;
                local_12;
                local_20 = Context.GetEntity().GetBB_Entity(local_12);
            }
            local_6.SetNotifyEntity(local_20);
            local_6.SetEventName(this.EventName);
        }
        return;
    }
}


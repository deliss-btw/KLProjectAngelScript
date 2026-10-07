

// NOTE: class defaults are not authored in this module: UESMAction_AutoTrackTurret (default scalar field UESMAction.NetTriggerMode has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class UESMAction_AutoTrackTurret : UESMBPBaseSpanTickAction
{
    UESMAction_AutoTrackTurret()
    {
        return;
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(3);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_38 = 0;
        Has local_4;
        if (!(local_4.opCall()))
        {
            return;
        }
        FECSEntity local_14 = ::AutoTrackTurret::SeekTarget(Context.GetEntity());
        FC_AutoTrackTurretActiveTag local_20;
        Assign local_18;
        local_18.opCall(local_20);
        Modify local_24;
        FC_AutoTrackTurretClientRuntime& local_26 = local_24.opCall();
        if (local_26)
        {
            local_26.SetTargetEntity(local_14);
            local_26.SetbHasTarget(local_14.IsValid());
        }
        Modify local_30;
        FC_AutoTrackTurretServerCache& local_32 = local_30.opCall();
        if (local_32)
        {
            if (local_38)
            {
                local_32.InitialEntityRotation = local_38.GetRotation();
            }
            local_32.CurrentEntityYaw = 0.0f;
            local_32.CurrentEntityPitch = 0.0f;
        }
        if (local_14.IsValid())
        {
            ::AutoTrackTurret::TryActivateFoundTargetTrigger(Context.GetEntity());
        }
        ::AutoTrackTurretDebug::Log(FString().Append("[AutoTrackTurret] Enter Entity[").Append(Context.GetEntity().GetIdValue()).Append("] Target[").Append(local_14.GetIdValue()).Append("]"));
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Has local_4;
        if (!(local_4.opCall()))
        {
            return;
        }
        ::AutoTrackTurretDebug::Log(FString().Append("[AutoTrackTurret] Exit Entity[").Append(Context.GetEntity().GetIdValue()).Append("]"));
        Remove local_16;
        local_16.opCall();
        Modify local_20;
        FC_AutoTrackTurretClientRuntime& local_22 = local_20.opCall();
        if (local_22)
        {
            local_22.SetTargetEntity(ENTITY_NULL);
            local_22.SetbHasTarget(false);
        }
        return;
    }
}


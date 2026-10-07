

// NOTE: class defaults are not authored in this module: UESMAction_EnableGravityFalling (default scalar field UESMAction.NetTriggerMode has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class UESMAction_EnableGravityFalling : UESMBPBaseInstantAction
{
    UPROPERTY()
    float32 GravityScale = 1.0f;
    UPROPERTY()
    FPropMovementExtraConfig ExtraCheckConfig;


    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_26 = 0;
        int local_62 = 0;
        const FECSEntity& local_2 = Context.GetEntity();
        Has local_6;
        if (!(local_6.opCall()))
        {
            XWarning(ELog(0), FString().Append(local_2.GetEntityName().ToString()).Append(" EnableGravityFalling must has FC_Collision"));
            return;
        }
        local_26.SetGravityScale(this.GravityScale);
        if (this.ExtraCheckConfig.GetbHitSceneEvent() || this.ExtraCheckConfig.GetbEndMovementWhenHitScene())
        {
            ModifyOrAdd local_32;
            FC_EntityHitCollider& local_34 = local_32.opCall();
            if (local_34)
            {
                local_34.SetEntity(local_2);
                Get local_38;
                const FC_Transform& local_40 = local_38.opCall();
                if (local_40)
                {
                    local_34.SetLastPosition(local_40.GetPosition());
                }
                local_34.SetExtraConfig(this.ExtraCheckConfig);
            }
        }
        if (this.ExtraCheckConfig.GetbEndMovementWhenHitScene() && this.ExtraCheckConfig.GetbMovementEndEvent())
        {
            if ((int(this.ExtraCheckConfig.GetMovementEndProcessMode())) == 0)
            {
                ModifyOrAdd local_48;
                FC_MovementEndAbilitySignal& local_50 = local_48.opCall();
                if (local_50)
                {
                    local_50.SetAbilityClass(this.ExtraCheckConfig.GetMovementEndAbilityClass());
                    local_50.SetNotifyEntity(local_2);
                    local_50.SetSignalName(this.ExtraCheckConfig.GetMovementEndSignalName());
                }
            }
            else
            {
                if ((int(this.ExtraCheckConfig.GetMovementEndProcessMode())) == 1)
                {
                    ModifyOrAdd local_54;
                    FC_MovementEndEventToESMTriggerFilterSignal& local_56 = local_54.opCall();
                    if (local_56)
                    {
                        local_56.SetNotifyEntity(local_2);
                        local_56.SetEventName(this.ExtraCheckConfig.GetMovementEndEventName());
                    }
                }
            }
        }
        FECSWorldPtr local_64 = local_2.GetWorld();
        Get local_68;
        local_62.SetMoveBeginTime(local_68.opCall().Time);
        local_62.SetMoveTime(FFPTime(0));
        local_62.SetLastMoveTime(FFPTime(0));
        local_62.SetMoveTotalTime(FFPTime(-1));
        GetDefaulted local_74;
        local_62.SetInitRotation(local_74.opCall().ToFTransform().GetRotation());
        return;
    }
}

class UESMAction_DisableGravityFalling : UESMBPBaseInstantAction
{
    UESMAction_DisableGravityFalling()
    {
        return;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_12 = 0;
        Remove local_4;
        local_4.opCall();
        if (local_12)
        {
            local_12.SetMoveTotalTime(FFPTime(0));
        }
        Remove local_20;
        local_20.opCall();
        return;
    }
}


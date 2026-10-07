

// NOTE: class defaults are not authored in this module: UESMAction_DropItemManualTrigger (default scalar field UESMAction.NetTriggerMode has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class UESMAction_DropItemManualTrigger : UESMBPBaseInstantAction
{
    UPROPERTY()
    bool bGetDropTriggerByFromDeathKiller = true;
    UPROPERTY()
    FAttachRefName OverridePositionSocket;


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
        if (!(ECS::GetRuntimeInfo().IsServer))
        {
            return;
        }
        FECSEntity local_6 = FECSEntity(ENTITY_NULL);
        if (this.bGetDropTriggerByFromDeathKiller)
        {
            Get local_10;
            const FC_DeathKiller& local_12 = local_10.opCall();
            if (local_12)
            {
                local_6 = FECSEntity(local_12.GetKillerEntityId());
            }
        }
        FCE_DropManualTrigger local_22;
        local_22.DropTriggerBy = local_6;
        if (!((FName(this.OverridePositionSocket.Name) == NAME_None)))
        {
            bool local_25;
            local_25 = false;
            FTransform local_80 = FTransformUtils::GetSocketTransformInGameMesh(Context.GetEntity(), this.OverridePositionSocket.Name, Time.WorldTime, local_25, FDownsampleConfig());
            if (local_25)
            {
                local_22.bHasOverridePosition = true;
                local_22.OverridePosition = local_80.GetLocation();
            }
        }
        return;
    }
}


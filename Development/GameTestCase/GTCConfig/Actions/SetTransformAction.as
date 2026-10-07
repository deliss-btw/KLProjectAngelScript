

// NOTE: class defaults are not authored in this module: FGTCSetTransformAction (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

struct FGTCSetTransformAction : FGTCAction
{
    FGTCAction _base_FGTCAction;
    UPROPERTY()
    FVector Position;
    UPROPERTY()
    FQuat Rotation;

    FGTCSetTransformAction()
    {
        this.__InitDefaults();
        return;
    }
    void Execute_Implementation(const FECSEntity &inout TargetEntity, const FGTCActionContext &inout Context)
    {
        if (!(ECS::GetRuntimeInfo().IsServer))
        {
            return;
        }
        if (!(TargetEntity.IsValid()))
        {
            return;
        }
        TargetEntity.TeleportTo(this.Position, this.Rotation, FFPTime(-1));
        return;
    }
}


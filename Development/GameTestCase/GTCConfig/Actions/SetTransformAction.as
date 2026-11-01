struct FGTCSetTransformAction : FGTCAction
{
    FGTCAction _base_FGTCAction;
    UPROPERTY()
    FVector Position;
    UPROPERTY()
    FQuat Rotation;

    default m_ScriptOverrideMeta = Cast<UASStruct>(FGTCSetTransformAction.Get());

    FGTCSetTransformAction()
    {
        this.ActionType = EGTCActionType(1);
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


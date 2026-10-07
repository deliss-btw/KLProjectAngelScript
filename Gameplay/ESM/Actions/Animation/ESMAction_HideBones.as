

class UESMAction_HideBones : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FName MeshComponentName = NAME_None;
    UPROPERTY()
    TArray<FName> HideBoneNames;

    UESMAction_HideBones()
    {
        return;
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        FECSActorComponentProxy local_4 = Context.GetEntity().ModifyActorComponent(this.MeshComponentName);
        FECSSkeletalMeshComponentProxy local_12 = local_4.CastToSkeletalMeshComponent();
        if (!(local_12))
        {
            return;
        }
        for (auto& local_32 : this.HideBoneNames)
        {
            local_12.HideBoneByName(local_32, EPhysBodyOp(0));
        }
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        FECSActorComponentProxy local_4 = Context.GetEntity().ModifyActorComponent(this.MeshComponentName);
        FECSSkeletalMeshComponentProxy local_12 = local_4.CastToSkeletalMeshComponent();
        if (!(local_12))
        {
            return;
        }
        for (auto& local_32 : this.HideBoneNames)
        {
            local_12.UnHideBoneByName(local_32);
        }
        return;
    }
}


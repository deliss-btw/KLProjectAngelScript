

class UESMAction_AttachInteractToOtherMount : UESMBPBaseSpanAction
{
    UPROPERTY()
    FName SocketName;
    UPROPERTY()
    FVector AttachLocationOffset;
    UPROPERTY()
    FRotator AttachRotationOffset;
    UPROPERTY()
    FName LogicSocketName;
    UPROPERTY()
    FVector LogicAttachLocationOffset;
    UPROPERTY()
    FRotator LogicAttachRotationOffset;
    UPROPERTY()
    FVector DetachLocationOffset;
    UPROPERTY()
    FRotator DetachRotationOffset;

    UESMAction_AttachInteractToOtherMount()
    {
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        UInteractionBehavior_RideAsPassenger local_18;
        if (Context.GetECSRuntime().IsClient)
        {
            return;
        }
        else
        {
            const FECSEntity& local_4 = Context.GetEntity();
            Get local_8;
            const FC_InteractionInfoForESM& local_10 = local_8.opCall();
            if (local_10)
            {
                if (local_10.GetTargetEntity().IsValid())
                {
                    UInteractionBehaviorBase local_14 = ::FInteractUtils::GetInteractionBehaviorFromEntity(local_10.GetTargetEntity(), local_10.GetTargetPointAndBehaviorIndex());
                    if (local_14 != nullptr)
                    {
                        local_18 = (Cast<UInteractionBehavior_RideAsPassenger>(local_14));
                        if (local_18 != nullptr)
                        {
                            ::FMountUtils::BeginMountAsPassenger(local_4, local_10.GetTargetEntity(), int(local_18.SeatIndex));
                        }
                    }
                }
                return;
            }
        }
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (Context.GetECSRuntime().IsClient)
        {
            return;
        }
        ::FMountUtils::EndMountAsPassenger(Context.GetEntity(), Time.WorldTime);
        return;
    }
}


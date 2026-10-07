

class UESMAction_HardSnapToFloor : UESMBPBaseSpanAction
{
    UESMAction_HardSnapToFloor()
    {
        return;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Movement;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FECSEntity& local_2 = Context.GetEntity();
        Modify local_6;
        FC_CharacterMovementNew& local_8 = local_6.opCall();
        if (local_8)
        {
            local_8.SetHardSnapToFloorCount((local_8.GetHardSnapToFloorCount() + 1));
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FECSEntity& local_2 = Context.GetEntity();
        Modify local_6;
        FC_CharacterMovementNew& local_8 = local_6.opCall();
        if (local_8)
        {
            local_8.SetHardSnapToFloorCount((local_8.GetHardSnapToFloorCount() - 1));
        }
        return;
    }
}


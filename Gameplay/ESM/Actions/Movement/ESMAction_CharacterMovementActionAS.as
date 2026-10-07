

class UESMAction_CharacterMovementActionAS : UESMCharacterMovementAction
{
    UESMAction_CharacterMovementActionAS()
    {
        return;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Movement;
    }
    UFUNCTION()
    void SetMovementConfig_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ModifyOrAdd local_6;
        FC_CharacterMovementActionState& local_2 = local_6.opCall();
        if (local_2)
        {
            local_2.SetbFlyingMovement((int(this.bFlyingMovement) != 0));
            local_2.SetMovementType(this.MovementType);
        }
        return;
    }
}


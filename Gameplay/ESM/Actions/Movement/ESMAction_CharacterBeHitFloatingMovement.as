

class UESMAction_CharacterBeHitFloatingMovement : UESMCharacterBeHitFloatingMovementAction
{
    UESMAction_CharacterBeHitFloatingMovement()
    {
        return;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Movement;
    }
}


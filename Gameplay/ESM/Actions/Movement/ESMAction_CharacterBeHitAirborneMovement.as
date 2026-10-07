

class UESMAction_CharacterBeHitAirborneMovement : UESMCharacterBeHitAirborneMovementAction
{
    UESMAction_CharacterBeHitAirborneMovement()
    {
        return;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Movement;
    }
}


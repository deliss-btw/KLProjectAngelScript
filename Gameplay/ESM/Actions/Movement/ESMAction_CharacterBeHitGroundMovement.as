

class UESMAction_CharacterBeHitGroundMovement : UESMCharacterBeHitGroundMovementAction
{
    UESMAction_CharacterBeHitGroundMovement()
    {
        return;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Movement;
    }
}


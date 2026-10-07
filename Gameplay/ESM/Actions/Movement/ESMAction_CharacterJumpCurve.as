

class UESMAction_CharacterJumpCurve : UESMCharacterJumpCurveAction
{
    UESMAction_CharacterJumpCurve()
    {
        return;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Movement;
    }
}


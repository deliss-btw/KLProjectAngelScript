

class UESMAction_CharacterKeepStrafe : UESMCharacterKeepStrafeAction
{
    UESMAction_CharacterKeepStrafe()
    {
        return;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Movement;
    }
}


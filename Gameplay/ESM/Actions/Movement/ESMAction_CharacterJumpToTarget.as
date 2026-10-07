

class UESMAction_CharacterJumpToTarget : UESMCharacterJumpToTargetAction
{
    UESMAction_CharacterJumpToTarget()
    {
        return;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Movement;
    }
}


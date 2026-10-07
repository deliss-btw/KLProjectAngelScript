

class UESMAction_CharacterVaulting : UESMBPBaseSpanAction
{
    UESMAction_CharacterVaulting()
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
        0.SetbIsVaultingOver(true);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        local_6.SetbIsVaultingOver(false);
        if (int(local_6.GetProbPath().VaultActionType) == 2)
        {
            local_6.ClearVaultAction();
        }
        return;
    }
}


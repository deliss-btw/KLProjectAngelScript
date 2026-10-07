

class UESMAction_CharacterEnableVault : UESMBPBaseSpanAction
{
    UPROPERTY()
    FString ReferencedNotify;

    UESMAction_CharacterEnableVault()
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
        0.SetEnableReachUp(true);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        0.SetEnableReachUp(false);
        return;
    }
}


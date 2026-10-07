

class UESMAction_CharacterWallRun : UESMBPBaseSpanAction
{
    UESMAction_CharacterWallRun()
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
        0.SetbWallRunning(true);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        0.SetbWallRunning(false);
        return;
    }
}


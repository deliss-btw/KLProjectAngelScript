

class UESMAction_CharacterEnableDualUpstairs : UESMBPBaseSpanAction
{
    UESMAction_CharacterEnableDualUpstairs()
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
        int local_6 = 0;
        local_6.SetbEnableDualUpstairs(true);
        local_6.SetEnableReachUp(true);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        local_6.SetbEnableDualUpstairs(false);
        local_6.SetEnableReachUp(false);
        return;
    }
}


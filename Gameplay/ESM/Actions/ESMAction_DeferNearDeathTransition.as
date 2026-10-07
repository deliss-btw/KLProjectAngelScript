

class UESMAction_DeferNearDeathTransition : UESMBPBaseSpanAction
{
    UESMAction_DeferNearDeathTransition()
    {
        return;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        0.SetbDeferByAction(true);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Modify local_4;
        FC_NearDeathDeferTransition& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetbDeferByAction(false);
        }
        return;
    }
}


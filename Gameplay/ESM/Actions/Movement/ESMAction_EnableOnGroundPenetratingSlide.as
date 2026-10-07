

class UESMAction_EnableOnGroundPenetratingSlide : UESMBPBaseSpanAction
{
    UESMAction_EnableOnGroundPenetratingSlide()
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
        const FECSEntity& local_2 = Context.GetEntity();
        Modify local_6;
        FC_CharacterMovementNew& local_8 = local_6.opCall();
        if (local_8)
        {
            local_8.SetEnableOnGroundPenetratingSlideCount((local_8.GetEnableOnGroundPenetratingSlideCount() + 1));
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FECSEntity& local_2 = Context.GetEntity();
        Modify local_6;
        FC_CharacterMovementNew& local_8 = local_6.opCall();
        if (local_8)
        {
            int local_10 = local_8.GetEnableOnGroundPenetratingSlideCount();
            local_8.SetEnableOnGroundPenetratingSlideCount((local_8.GetEnableOnGroundPenetratingSlideCount() - 1));
        }
        return;
    }
}


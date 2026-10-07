

class UESMAction_IgnoreHitShake : UESMBPBaseSpanAction
{
    UESMAction_IgnoreHitShake()
    {
        return;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Effect;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_8 = 0;
        const FECSEntity& local_2 = Context.GetEntity();
        int local_10 = local_8.GetCounter();
        local_8.SetCounter(uint8((local_10 + 1)));
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_8 = 0;
        const FECSEntity& local_2 = Context.GetEntity();
        if (local_8)
        {
            int local_11 = local_8.GetCounter();
            local_8.SetCounter(uint8((local_11 - 1)));
            local_11 = local_8.GetCounter();
            if (local_11 == 0)
            {
                Remove local_16;
                local_16.opCall();
            }
        }
        return;
    }
}


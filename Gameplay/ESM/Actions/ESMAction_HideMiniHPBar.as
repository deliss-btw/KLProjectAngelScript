

class UESMAction_HideMiniHPBar : UESMBPBaseSpanAction
{
    UESMAction_HideMiniHPBar()
    {
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ModifyOrAdd local_4;
        FC_MiniHPBarHiddenCounter& local_6 = local_4.opCall();
        if (local_6)
        {
            int local_9 = local_6.GetCounter();
            local_6.SetCounter(uint8((local_9 + 1)));
            local_9 = local_6.GetCounter();
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        if (local_6)
        {
            int local_9 = local_6.GetCounter();
            local_6.SetCounter(uint8((local_9 - 1)));
            local_9 = local_6.GetCounter();
        }
        return;
    }
}




class UESMAction_HumanSlopeAdaptation : UESMBPBaseSpanTickAction
{
    UESMAction_HumanSlopeAdaptation()
    {
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        local_6.SetRefCount((local_6.GetRefCount() + 1));
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Modify local_4;
        FC_SlopeAdaptControl& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetRefCount((local_6.GetRefCount() - 1));
            if (local_6.GetRefCount() <= 0)
            {
                Remove local_14;
                local_14.opCall();
            }
        }
        return;
    }
}


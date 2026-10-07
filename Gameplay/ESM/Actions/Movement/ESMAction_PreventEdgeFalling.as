

class UESMAction_PreventEdgeFalling : UESMBPBaseSpanAction
{
    UESMAction_PreventEdgeFalling()
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
        int local_14 = 0;
        const FECSEntity& local_2 = Context.GetEntity();
        Has local_6;
        if (local_6.opCall() == false)
        {
            return;
        }
        local_14.SetPreventEdgeFalling((local_14.GetPreventEdgeFalling() + 1));
        int local_16 = local_14.GetPreventEdgeFalling();
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_14 = 0;
        const FECSEntity& local_2 = Context.GetEntity();
        Has local_6;
        if (local_6.opCall() == false)
        {
            return;
        }
        local_14.SetPreventEdgeFalling((local_14.GetPreventEdgeFalling() - 1));
        int local_16 = local_14.GetPreventEdgeFalling();
        return;
    }
}


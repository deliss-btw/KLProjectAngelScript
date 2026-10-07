

class UESMAction_CharacterHookMove : UESMBPBaseSpanAction
{
    UESMAction_CharacterHookMove()
    {
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FECSEntity& local_2 = Context.GetEntity();
        Modify local_6;
        FC_RuntimeHookMoveTarget& local_8 = local_6.opCall();
        if (local_8)
        {
            local_8.SetTotalMoveTime(FFPTime(0));
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FECSEntity& local_2 = Context.GetEntity();
        Remove local_6;
        local_6.opCall();
        Remove local_12;
        local_12.opCall();
        return;
    }
}


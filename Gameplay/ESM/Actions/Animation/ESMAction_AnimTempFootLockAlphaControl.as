

class UESMAction_AnimTempFootLockAlphaControl : UESMBPBaseSpanAction
{
    UESMAction_AnimTempFootLockAlphaControl()
    {
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Modify local_4;
        FC_CharacterFootLockInfo& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetFootLockAlphaTemp(1.0f);
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Modify local_4;
        FC_CharacterFootLockInfo& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetFootLockAlphaTemp(0.0f);
        }
        return;
    }
}




class UESMAction_BanSpawnFakeCharcter : UESMBPBaseSpanAction
{
    UESMAction_BanSpawnFakeCharcter()
    {
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_2 = 0;
        local_2.SetRefCount((local_2.GetRefCount() + 1));
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_2 = 0;
        local_2.SetRefCount((local_2.GetRefCount() - 1));
        if (local_2.GetRefCount() <= 0)
        {
            Remove local_14;
            local_14.opCall();
        }
        return;
    }
}


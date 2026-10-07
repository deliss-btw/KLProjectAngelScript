

class UESMAction_OverrideMovementDestructibleDamageLevel : UESMBPBaseSpanAction
{
    UPROPERTY()
    EDestructibleClassLevel DamageLevel = EDestructibleClassLevel(0);


    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ModifyOrAdd local_4;
        FC_OverrideMovementDestructibleDamageLevel& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetMovementDestructibleDamageLevel(this.DamageLevel);
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
}


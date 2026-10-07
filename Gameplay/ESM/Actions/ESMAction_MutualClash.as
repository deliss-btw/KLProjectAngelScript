

class UESMAction_MutualClash : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bIsPlayer = true;
    UPROPERTY()
    bool bCheckDirection = true;
    UPROPERTY()
    float32 OneTimeConsumeMutualClash = 100.0f;
    UPROPERTY()
    EMutualClashDamageType MutualClashDamageType;
    UPROPERTY()
    FString HitState = "HitMutualClash";


    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        int local_10 = 0;
        int local_34 = 0;
        if (!(local_6))
        {
            return;
        }
        local_10.SetbIsPlayer(this.bIsPlayer);
        local_10.SetbCheckDirection(this.bCheckDirection);
        local_10.SetConsumeMutualClashValue(this.OneTimeConsumeMutualClash);
        local_10.SetMutualClashDamageType(this.MutualClashDamageType);
        local_10.SetHitState(FName(this.HitState));
        local_34.SetbIsPlayer(this.bIsPlayer);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (!(0))
        {
            return;
        }
        Remove local_12;
        local_12.opCall();
        return;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
}




class UESMAction_SetIgnoreHitAttackTag : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bInverseIgnore = false;
    UPROPERTY()
    TArray<FName> AttackTagNames;


    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        local_6.SetbInverseIgnore(this.bInverseIgnore);
        for (auto& local_22 : this.AttackTagNames)
        {
            int local_23 = 1;
            local_6.GetModify_CountByTagName().Add(local_22, local_23);
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

class UESMAction_AddIgnoreHitAttackTag : UESMBPBaseSpanAction
{
    UPROPERTY()
    TArray<FName> AttackTagNames;

    UESMAction_AddIgnoreHitAttackTag()
    {
        return;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        for (auto& local_22 : this.AttackTagNames)
        {
            int local_23 = 0;
            local_6.GetModify_CountByTagName().FindOrAdd(local_22, local_23) += 1;
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Modify local_4;
        FC_IgnoreSpecificAttackTagHit& local_6 = local_4.opCall();
        if (local_6)
        {
            for (auto& local_22 : this.AttackTagNames)
            {
                int local_23 = 0;
                if (local_6.GetCountByTagName().Find(local_22, local_23))
                {
                    if (local_23 == 1)
                    {
                        continue;
                    }
                    int local_24 = local_6.GetModify_CountByTagName()[local_22] - 1;
                }
            }
        }
        return;
    }
}


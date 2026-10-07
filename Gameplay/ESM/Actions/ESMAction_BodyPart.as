
enum EMuteBodyPartDestroyType
{
    LockOne,
    Full,
}


class UESMAction_MuteBodyPartDestroy : UESMBPBaseSpanAction
{
    UPROPERTY()
    TArray<FName> BodyPartKeys;
    UPROPERTY()
    EMuteBodyPartDestroyType MuteBodyPartDestroyType;

    UESMAction_MuteBodyPartDestroy()
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
        Modify local_4;
        FC_BodyParts& local_6 = local_4.opCall();
        if (local_6)
        {
            for (auto& local_22 : this.BodyPartKeys)
            {
                if (int(this.MuteBodyPartDestroyType) == 0)
                {
                    local_6.GetModify_LockOneMutedBodyParts().Add(local_22);
                    continue;
                }
                if (int(this.MuteBodyPartDestroyType) == 1)
                {
                    local_6.GetModify_FullMutedBodyParts().Add(local_22);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Modify local_4;
        if (local_4.opCall())
        {
            for (auto& local_22 : this.BodyPartKeys)
            {
                local_22;
                if (int(this.MuteBodyPartDestroyType) == 0)
                {
                    continue;
                }
                if (int(this.MuteBodyPartDestroyType) == 1)
                {
                }
            }
        }
        return;
    }
}


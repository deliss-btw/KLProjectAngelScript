

class UESMAction_RestrictCharacterMovementInNavmesh : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bEnable = true;


    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Movement;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FECSEntity& local_2 = Context.GetEntity();
        Modify local_6;
        FC_CharacterMovementNew& local_8 = local_6.opCall();
        if (local_8)
        {
            int local_10 = this.bEnable ? 1 : -1;
            local_8.SetRestrictInNavmeshCount(local_8.GetRestrictInNavmeshCount() + local_10);
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FECSEntity& local_2 = Context.GetEntity();
        Modify local_6;
        FC_CharacterMovementNew& local_8 = local_6.opCall();
        if (local_8)
        {
            int local_10 = this.bEnable ? -1 : 1;
            local_8.SetRestrictInNavmeshCount(local_8.GetRestrictInNavmeshCount() + local_10);
        }
        return;
    }
}


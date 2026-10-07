

class UESMAction_ExtraFloorDetection : UESMBPBaseSpanAction
{
    UPROPERTY()
    float32 ExtraRange = 200.0f;


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
            local_8.SetExtraFloorDetectRange(this.ExtraRange);
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
            local_8.SetExtraFloorDetectRange(0.0f);
        }
        return;
    }
}


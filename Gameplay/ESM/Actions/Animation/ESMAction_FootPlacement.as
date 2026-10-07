

class UESMAction_FootPlacement : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    float32 Weight = 1.0f;


    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        return FString().Append("Foot Placement (Weight=").Append(this.Weight).Append(")");
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ModifyOrAdd local_4;
        FC_FootPlacement& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetEnableCount((local_6.GetEnableCount() + 1));
        }
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        float local_16;
        Modify local_4;
        FC_FootPlacement& local_6 = local_4.opCall();
        if (local_6)
        {
            bool local_8;
            local_8 = false;
            Get local_12;
            const FC_CharacterMovement& local_14 = local_12.opCall();
            if (local_14)
            {
                local_8 = local_14.GetbAirborne();
            }
            if (local_8)
            {
                local_16 = 0.0;
            }
            else
            {
                local_16 = this.Weight;
            }
            local_6.SetWeight(float32(local_16));
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Modify local_4;
        FC_FootPlacement& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetEnableCount((local_6.GetEnableCount() - 1));
            if (local_6.GetEnableCount() <= 0)
            {
                local_6.SetEnableCount(0);
                local_6.SetWeight(0.0f);
            }
        }
        return;
    }
}


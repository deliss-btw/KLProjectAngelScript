

class UESMAction_HeadControl : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    float32 Weight;

    UESMAction_HeadControl()
    {
        this.Weight = 1.0f;
        this.bAllowTickInLowCost = false;
        return;
    }
    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    bool AllowTickInLowCost_Implementation() const
    {
        return false;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ModifyOrAdd local_4;
        FC_AnimHeadControlData& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.PushWeight(this.Weight);
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Modify local_4;
        FC_AnimHeadControlData& local_6 = local_4.opCall();
        if (local_6)
        {
            float32 local_8 = local_6.GetEnableWeight();
            local_6.PopWeight();
        }
        return;
    }
}


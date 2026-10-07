

class UESMAction_LevelEventInstant : UESMBPBaseInstantAction
{
    UPROPERTY()
    FName EventName;

    UESMAction_LevelEventInstant()
    {
        return;
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(1);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return FLinearColor(0.2f, 0.6f, 0.3f, 1.0f);
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if ((this.EventName == NAME_None))
        {
            return;
        }
        FECSEntity local_8 = Context.GetEntity();
        if (!(local_8.IsValid()))
        {
            return;
        }
        FFPTime local_14 = FFPTime(-1);
        FCE_ESMLevelActionEvent local_18;
        local_18.Entity = local_8;
        local_18.EventName = this.EventName;
        local_18.bIsEnter = true;
        return;
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        if ((this.EventName == NAME_None))
        {
            return "е…іеЌЎдє‹д»¶(жњЄй…ЌзЅ®)";
        }
        return (FString("е…іеЌЎдє‹д»¶: ") + this.EventName.ToString());
    }
}

class UESMAction_LevelEventSpan : UESMBPBaseSpanAction
{
    UPROPERTY()
    FName EventName;

    UESMAction_LevelEventSpan()
    {
        return;
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(1);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return FLinearColor(0.2f, 0.6f, 0.3f, 1.0f);
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if ((this.EventName == NAME_None))
        {
            return;
        }
        FECSEntity local_8 = Context.GetEntity();
        if (!(local_8.IsValid()))
        {
            return;
        }
        FFPTime local_14 = FFPTime(-1);
        FCE_ESMLevelActionEvent local_18;
        local_18.Entity = local_8;
        local_18.EventName = this.EventName;
        local_18.bIsEnter = true;
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if ((this.EventName == NAME_None))
        {
            return;
        }
        FECSEntity local_8 = Context.GetEntity();
        if (!(local_8.IsValid()))
        {
            return;
        }
        FFPTime local_14 = FFPTime(-1);
        FCE_ESMLevelActionEvent local_18;
        local_18.Entity = local_8;
        local_18.EventName = this.EventName;
        local_18.bIsEnter = false;
        return;
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        if ((this.EventName == NAME_None))
        {
            return "е…іеЌЎдє‹д»¶ж®µ(жњЄй…ЌзЅ®)";
        }
        return (FString("е…іеЌЎдє‹д»¶ж®µ: ") + this.EventName.ToString());
    }
}


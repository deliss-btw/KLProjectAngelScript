

class UESMAction_ApplyEvnEffect : UESMBPBaseInstantAction
{
    UPROPERTY()
    FVector DetectOffset = FVector(0.0, 0.0, -100.0);

    UESMAction_ApplyEvnEffect()
    {
        return;
    }
    UFUNCTION()
    void ViewDo_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
}


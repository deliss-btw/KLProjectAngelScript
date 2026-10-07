

class UESMAction_AttachSourceToTarget : UESMBPBaseSpanAction
{
    UPROPERTY()
    FVector AttachLocationOffset;
    UPROPERTY()
    FRotator AttachRotationOffset;
    UPROPERTY()
    bool bUseDetachOffset = false;
    UPROPERTY()
    bool bUseRootRotationOffset = false;
    UPROPERTY()
    FVector DetachLocationOffset;
    UPROPERTY()
    FRotator DetachRotationOffset;
    UPROPERTY()
    uint8 ZeroOutRotationAxisWhenDetach = false;


    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
}


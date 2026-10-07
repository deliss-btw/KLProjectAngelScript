

class UESMAction_BrokenDestructible : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    EImpactType ImpactType = EImpactType(0);
    UPROPERTY()
    EImpactStrength ImpactStrength = EImpactStrength(0);
    UPROPERTY()
    EDestructibleClassLevel DestructibleDamageLevel = EDestructibleClassLevel(1);
    UPROPERTY()
    bool bUseOverrideShape = false;
    UPROPERTY()
    FCollisionShapeInfo OverrideShapeInfo;
    UPROPERTY()
    FRotator ShapeRotation = FRotator::ZeroRotator;
    UPROPERTY()
    FVector OffsetToCenter = FVector::ZeroVector;


    UFUNCTION()
    bool CanPreview_Implementation() const
    {
        return false;
    }
    UFUNCTION()
    void Preview_Implementation(const FESMPreviewContext &inout Context, const FESMActionTime &inout Time)
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void OverrideShapeSweep(const FECSEntity &inout Entity, const float32 Scale, const FTransform &inout Transform, const FVector &inout Velocity, const FESMActionTime &inout Time, TArray<FHitResult> &inout HitResults) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
}


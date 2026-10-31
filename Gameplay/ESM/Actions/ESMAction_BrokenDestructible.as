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
        int local_6 = 0;
        int local_16 = 0;
        int local_22 = 0;
        if (local_6.GetVelocity().IsNearlyZero(9.999999747378752e-5))
        {
            return;
        }
        float32 local_23 = 1.0f;
        Get local_28;
        const FC_Scale& local_30 = local_28.opCall();
        if (local_30)
        {
            local_23 = local_30.GetUniformScale();
        }
        TArray<FHitResult> local_34;
        if (this.bUseOverrideShape)
        {
            this.OverrideShapeSweep(Context.GetEntity(), local_23, local_22.ToFTransform(), local_6.GetVelocity(), Time, local_34);
        }
        else
        {
            FCollisionQueryParams local_98;
            local_98.bTraceComplex = (false != 0);
            FCollisionObjectQueryParams local_100;
            local_100.AddObjectTypesToQuery(ECollisionChannel(7));
            FCollisionShape local_106 = FCollisionShape::MakeCapsule(local_16.GetScaledRadius(), local_16.GetScaledHalfHeight());
            FVector local_124 = local_22.GetPosition();
            FPhysicsUtils::SweepMulti(Context.GetEntity(), false, EPhysicsTraceTag(37), local_34, local_22.GetPosition(), (local_124 + (FVector(local_6.GetVelocity()) * Time.WorldDeltaTime.ToSeconds())), FQuat::Identity, local_100, local_106, local_98);
        }
        for (auto& local_140 : local_34)
        {
            FECSEntity local_144 = FECSEntity(int(local_140.ECSEntityId));
            if (local_144.IsValid())
            {
                Has local_150;
                bool local_9 = local_150.opCall();
                if (local_9)
                {
                    Get local_154;
                    ::DestructibleUtils::BrokenDestructiale(Context.GetEntity(), local_144, local_154.opCall(), this.DestructibleDamageLevel, this.ImpactType, this.ImpactStrength, local_6.GetVelocity().GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector));
                }
                else
                {
                    Get local_162;
                    const FC_PropEnvBreakableConfig& local_164 = local_162.opCall();
                    if (local_164)
                    {
                        ::FDamageUtils::DirectDamagePropEnvBreakable(local_144, Context.GetEntity(), local_164, Time.WorldTime, 0.0f, this.DestructibleDamageLevel);
                    }
                }
            }
            else
            {
                if (int(ECS::GetRuntimeInfo().IsServer) != 0)
                {
                    FSimpleDestructibleBreakResult local_200;
                    UPrimitiveComponent local_204;
                    bool local_9_2 = ::SimpleDestructibleUtils::ServerTryBreakFromHitResult(Context.GetEntity(), local_204, int(local_140.Item), this.DestructibleDamageLevel, false, this.ImpactType, this.ImpactStrength, local_6.GetVelocity().GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector), local_200);
                    if (local_9_2)
                    {
                        if local_200.bWasAlreadyDestroyed
                        {
                            continue;
                        }
                    }
                }
            }
        }
        return;
    }
    void OverrideShapeSweep(const FECSEntity &inout Entity, const float32 Scale, const FTransform &inout Transform, const FVector &inout Velocity, const FESMActionTime &inout Time, TArray<FHitResult> &inout HitResults) const
    {
        FCollisionObjectQueryParams local_2;
        local_2.AddObjectTypesToQuery(ECollisionChannel(7));
        FCollisionQueryParams local_42;
        local_42.bTraceComplex = false;
        FCollisionShape local_51 = this.OverrideShapeInfo.GetAsShape(Scale);
        FVector local_84 = (Transform.GetLocation() + Transform.GetRotation().RotateVector(this.OffsetToCenter));
        FVector local_58 = (local_84 + (Velocity * Time.WorldDeltaTime.ToSeconds()));
        FQuat local_116 = (Transform.GetRotation() * this.ShapeRotation.Quaternion());
        FPhysicsUtils::SweepMulti(Entity, false, EPhysicsTraceTag(37), HitResults, local_84, local_58, local_116, local_2, local_51, local_42);
        return;
    }
}


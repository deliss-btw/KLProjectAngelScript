struct FLandingPointTestActionInstanceData
{
    UPROPERTY()
    float32 ExitActionZ = 0.0f;
    UPROPERTY()
    bool bHasLandingPoint = false;

}

class UESMAction_LandingPointTest : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FVector TraceDir;
    UPROPERTY()
    float32 TraceDistance = 20000.0f;
    UPROPERTY()
    float32 StartActionDistance = 400.0f;
    UPROPERTY()
    FVector TargetOffset;
    UPROPERTY()
    float32 TraceOffsetMinDistance = 200.0f;
    UPROPERTY()
    float32 TraceOffsetExtendDistance = 400.0f;
    UPROPERTY()
    FVector LandPlaneNormal;
    UPROPERTY()
    float32 LandPlaneNormalDegree = 30.0f;
    UPROPERTY()
    FNameHandle_EntityBBVarVector LandingPointName;
    UPROPERTY()
    FNameHandle_ESMBBTrigger FailedTrigger;
    UPROPERTY()
    FNameHandle_ESMBBTrigger ExitActionTrigger;
    UPROPERTY()
    ECollisionChannel TraceChannel = ECollisionChannel(18);
    UPROPERTY()
    float32 Tolerance = 2.0f;

    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FLandingPointTestActionInstanceData);
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        int local_12 = 0;
        bool local_13;
        if (!(local_12))
        {
            local_13 = false;
        }
        else
        {
            local_13 = local_6;
        }
        local_13 = !local_13;
        if (local_13)
        {
            return;
        }
        FCollisionQueryParams local_52;
        local_52.AddIgnoredEntityId(Context.GetEntity().GetIdValue());
        FLandingPointTestActionInstanceData& local_56 = this.ModifyInstanceData(Context);
        FHitResult local_122;
        FHitResult local_252;
        FCollisionResponseParams local_156;
        FCollisionShape local_126 = local_12.GetScaledShape();
        local_13 = FPhysicsUtils::SweepSingle(Context.GetEntity(), true, EPhysicsTraceTag(24), local_122, local_6.GetPosition(), (FVector(local_6.GetPosition()) + (this.TraceDir * this.TraceDistance)), local_6.GetRotation(), this.TraceChannel, local_126, local_52, local_156);
        if (local_13)
        {
            FVector local_172(local_122.Location);
            FVector local_142_2 = (FVector(local_6.GetPosition()) - local_122.Location).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
            FVector local_148_2 = (local_172 + (local_142_2 * (FMath::Min(this.StartActionDistance, local_122.Distance))));
            FVector local_132_2 = (FVector(local_122.Location) + local_6.GetRotation().RotateVector(this.TargetOffset));
            FVector local_172_2 = (local_132_2 - local_148_2);
            FVector local_132_3 = (local_148_2 + (local_172_2.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector) * (local_172_2.Size() + this.TraceOffsetExtendDistance)));
            bool local_14 = FPhysicsUtils::SweepSingle(Context.GetEntity(), true, EPhysicsTraceTag(24), local_252, local_148_2, local_132_3, local_6.GetRotation(), this.TraceChannel, local_12.GetScaledShape(), local_52, local_156);
            if (local_14)
            {
                if (local_252.Location.Distance(local_148_2) > this.TraceOffsetMinDistance && (local_252.ImpactNormal.DotProduct(this.LandPlaneNormal.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector)) > FMath::Cos(this.LandPlaneNormalDegree)))
                {
                    local_14 = true;
                    local_56.bHasLandingPoint = local_14;
                    local_56.ExitActionZ = float32((local_148_2.Z + this.Tolerance));
                    if ((!((FName(this.LandingPointName.Name) == NAME_None))))
                    {
                        Context.GetEntity().SetBB_Vector(this.LandingPointName, local_252.Location);
                    }
                    FECSDebugDraw::DrawDebugPoint(n"LandingPointTest", local_252.Location, 4.0f, FColor::Green, FColor::Green, 5.0f, uint8(0));
                    return;
                }
            }
            if (local_122.ImpactNormal.DotProduct(this.LandPlaneNormal.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector)) > FMath::Cos(this.LandPlaneNormalDegree))
            {
                local_56.bHasLandingPoint = true;
                local_56.ExitActionZ = float32((local_148_2.Z + this.Tolerance));
                if ((!((FName(this.LandingPointName.Name) == NAME_None))))
                {
                    Context.GetEntity().SetBB_Vector(this.LandingPointName, local_122.Location);
                }
                FECSDebugDraw::DrawDebugPoint(n"LandingPointTest", local_122.Location, 4.0f, FColor::Red, FColor::Red, 5.0f, uint8(0));
                return;
            }
        }
        FESMTriggerUtils::ActivateTrigger(Context.GetEntity(), Context.GetBlackboard().GetTriggerStorage(), this.FailedTrigger.Name, Context.Time.WorldTime, FFPTime(0.1), 0);
        local_56.bHasLandingPoint = false;
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FLandingPointTestActionInstanceData& local_2;
        int local_10 = 0;
        if (local_2.bHasLandingPoint == false)
        {
            return;
        }
        if (!(local_10))
        {
            return;
        }
        if (local_10.GetPosition().Z < local_2.ExitActionZ)
        {
            FESMTriggerUtils::ActivateTrigger(Context.GetEntity(), Context.GetBlackboard().GetTriggerStorage(), this.ExitActionTrigger.Name, Context.Time.WorldTime, FFPTime(0.1), 0);
        }
        return;
    }
    FLandingPointTestActionInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FLandingPointTestActionInstanceData __r;
        return __r;
    }
    FLandingPointTestActionInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FLandingPointTestActionInstanceData __r;
        return __r;
    }
}


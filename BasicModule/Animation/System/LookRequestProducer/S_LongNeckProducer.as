

class US_LookRequestLongNeckSystemAS : UECSScriptSystem
{
    EAnimLookSource LongNeckLookSource = EAnimLookSource(55);


    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    UFUNCTION()
    void Job_PushLongNeckIKControlLookRequest(const FECSEntity &inout Entity, const FC_AimPoseConfig &inout AimPoseConfig, const FC_AnimAimPoseOutput &inout AnimAimPoseOutput, const FC_LockTarget &inout LockTarget, const FC_Collision &inout Collision, const FC_Transform &inout Transform, FC_LookRequestLocal &inout LookRequestLocal, const FC_LongNeckIKConfig &inout LongNeckIKConfig) const
    {
        if (FMath::IsNearlyZero(AnimAimPoseOutput.GetTargetWeight(), 1e-8f))
        {
            return;
        }
        bool local_3 = !(LockTarget.GetbCachedValidLockTargetPosition());
        if (local_3)
        {
            local_3 = true;
        }
        else
        {
            TDataObjectPtr<FAnimAimPoseConfig> local_28;
            local_28 = AimPoseConfig.GetConfigPtr();
            local_3 = (local_28 == nullptr);
        }
        if (local_3)
        {
            return;
        }
        FVector local_60 = LockTarget.GetLogicLockTargetPosition();
        ::LookRequestLongNeck::ApplyLongNeckLimit(Transform, Collision, AimPoseConfig, local_60, (LockTarget.GetTargetEntity().GetCollisionHeight() / 2.0f), 1000.0f);
        ::FC_LookRequest::PushOrUpdateBySource(Entity, EAnimLookSource(55), 51, uint8(::FAnimSnapshot::MakeSnapshotTypeMask(EAnimSnapshotType(0))), nullptr, local_60, 0.2f, FRotator::ZeroRotator);
        return;
    }
    UFUNCTION()
    void Run_Job_PushLongNeckIKControlLookRequest() const
    {
        int local_156 = 0;
        int local_158 = 0;
        int local_164 = 0;
        int local_170 = 0;
        int local_176 = 0;
        int local_182 = 0;
        int local_188 = 0;
        int local_194 = 0;
        ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        FECSRuntimeView local_44 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_48;
        local_48.opCall();
        Include local_52;
        local_52.opCall();
        Include local_56;
        local_56.opCall();
        Include local_60;
        local_60.opCall();
        Include local_64;
        local_64.opCall();
        Include local_68;
        local_68.opCall();
        Include local_72;
        local_72.opCall();
        Include local_76;
        local_76.opCall();
        Exclude(local_44).opCall();
        FECSRuntimeViewIterator local_114 = local_44.Iterator();
        for (; local_114.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_153 = FECSEntityScopeCycleCounter(local_114.Proceed());
            this.Job_PushLongNeckIKControlLookRequest(local_156, local_158, local_164, local_170, local_176, local_182, local_188, local_194);
            MarkModifiedIfDirty local_202;
            local_202.opCall(local_188);
        }
        return;
    }
}

namespace LookRequestLongNeck
{
void ApplyLongNeckLimit(const FC_Transform &inout Transform, const FC_Collision &inout Collision, const FC_AimPoseConfig &inout AimPoseConfig, FVector &inout LookAtTarget, const float32 ZOffsetHeight = 0, const float32 LimitSize = -1)
{
    FAdditiveHermiteCurveConfig local_512 = LookRequestLongNeck::GetHermitCurveConfig(AimPoseConfig);
    float32 local_513 = local_512.TargetLimitOuterRadius;
    float32 local_515 = local_512.TargetLimitX;
    float32 local_514 = float32(local_512.ClampNeckLocation.X);
    LookAtTarget.Z -= ZOffsetHeight;
    FTransform local_568 = LookRequestLongNeck::ComputeNeckOffsetTransform(Transform, Collision, local_514);
    FVector local_580 = LookRequestLongNeck::ApplyLimitRadiusRestriction(local_513, local_515, local_568.InverseTransformPosition(LookAtTarget));
    if (LimitSize > 0.0f)
    {
        local_580 = local_580.GetClampedToSize(0.0, LimitSize);
    }
    LookAtTarget = local_568.TransformPosition(local_580);
    LookRequestLongNeck::DrawDebugVisualization(local_568, LookAtTarget, local_513, local_515);
    return;
}
FTransform ComputeNeckOffsetTransform(const FC_Transform &inout Transform, const FC_Collision &inout Collision, const float32 NeckLocationX)
{
    FTransform local_48 = Transform.ToFTransform();
    float32 local_49 = -Collision.GetScaledHalfHeight();
    local_48.AddToTranslation(FVector(0.0, 0.0, local_49));
    FVector local_82 = (local_48.GetRotation().GetForwardVector() * NeckLocationX);
    FTransform local_108 = local_48;
    local_108.AddToTranslation(local_82);
    return local_108;
}
FVector ApplyLimitRadiusRestriction(const float32 TargetLimitOuterRadius, const float32 TargetLimitX, const FVector &inout C_LookAtTarget)
{
    FVector local_6 = C_LookAtTarget;
    float32 local_7 = TargetLimitX;
    if (FMath::Abs(C_LookAtTarget.Y) <= TargetLimitOuterRadius)
    {
        local_6.X = FMath::Sqrt((TargetLimitOuterRadius * TargetLimitOuterRadius) - (local_6.Y * local_6.Y));
        local_6.X = FMath::Abs(local_6.X);
        local_6.X = FMath::Max(local_6.X, local_7);
        local_6.X = FMath::Max(local_6.X, C_LookAtTarget.X);
    }
    local_6.X = FMath::Max(local_6.X, local_7);
    return local_6;
}
FAdditiveHermiteCurveConfig GetHermitCurveConfig(const FC_AimPoseConfig &inout AimPoseConfig)
{
    TDataObjectPtr<FAnimAimPoseConfig> local_24;
    FAdditiveHermiteCurveConfig __r;
    local_24 = AimPoseConfig.GetConfigPtr();
    if ((local_24 == nullptr))
    {
    }
    else
    {
        FAnimAimPoseConfig local_326;
        for (auto& local_360 : local_326.Segments)
        {
            if (local_360.SegmentName.ToString().ToLower().Contains("neck", ESearchCase(1), ESearchDir(0)))
            {
                return __r;
            }
        }
    }
    return __r;
}
void DrawDebugVisualization(const FTransform &inout OffsetTransform, const FVector &inout LookAtTarget, const float32 TargetLimitOuterRadius, const float32 TargetLimitX)
{
    FECSDebugDraw::DrawDebugSphere(n"LongNeck", OffsetTransform.GetLocation(), TargetLimitOuterRadius, 12, FColor::Yellow, FColor::Yellow, 0.2f, uint8(0), 5.0f);
    FECSDebugDraw::DrawDebugSphere(n"LongNeck", LookAtTarget, 30.0f, 12, FColor::Yellow, FColor::Yellow, 0.2f, uint8(0), 5.0f);
    float32 local_14 = TargetLimitX;
    float32 local_15 = TargetLimitOuterRadius;
    float32 local_13 = local_15 * 3.0f;
    if (local_14 < local_15)
    {
        float32 local_2 = local_15 * local_15;
        float32 local_4 = FMath::Sqrt(local_2 - (local_14 * local_14));
        FVector local_36 = OffsetTransform.TransformPosition(FVector(local_14, local_4, 0.0));
        FVector local_24 = OffsetTransform.TransformPosition(FVector(local_14, local_13, 0.0));
        float32 local_18 = -local_4;
        FVector local_12 = OffsetTransform.TransformPosition(FVector(local_14, local_18, 0.0));
        local_2 = local_13;
        local_2 = -local_2;
        FVector local_42 = OffsetTransform.TransformPosition(FVector(local_14, local_2, 0.0));
        FECSDebugDraw::DrawDebugLine(n"LongNeck", local_36, local_24, FColor::Yellow, FColor::Yellow, 0.2f, uint8(0), 5.0f);
        FECSDebugDraw::DrawDebugLine(n"LongNeck", local_12, local_42, FColor::Yellow, FColor::Yellow, 0.2f, uint8(0), 5.0f);
        return;
    }
    float32 local_2_2 = -local_13;
    FVector local_54 = FVector(local_14, local_2_2, 0.0);
    FVector local_48 = OffsetTransform.TransformPosition(local_54);
    FVector local_54_2 = OffsetTransform.TransformPosition(FVector(local_14, local_13, 0.0));
    FECSDebugDraw::DrawDebugLine(n"LongNeck", local_48, local_54_2, FColor::Red, FColor::Red, 0.2f, uint8(0), 5.0f);
    return;
}
}

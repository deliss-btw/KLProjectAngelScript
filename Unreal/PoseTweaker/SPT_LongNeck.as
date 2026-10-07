

struct FHeadLocalRotationLimit
{
    UPROPERTY()
    FVector2f YawLimit;
    UPROPERTY()
    FVector2f PitchLimit;

    FHeadLocalRotationLimit()
    {
        FVector2f local_2 = FVector2f(-85.0f, 85.0f);
        this.PitchLimit = FVector2f(-30.0f, 40.0f);
        return;
    }
}

struct FNeckIKFailureSetting
{
    UPROPERTY()
    FVector DeadZoneCenterCS;
    UPROPERTY()
    float32 DeadZoneRadius;
    UPROPERTY()
    float32 LookAtYawFailureMin;
    UPROPERTY()
    float32 LookAtYawFailureMax;
    UPROPERTY()
    float32 LookAtYawClampMin;
    UPROPERTY()
    float32 LookAtYawClampMax;
    UPROPERTY()
    float32 LookAtPitchFailureMin;
    UPROPERTY()
    float32 LookAtPitchFailureMax;
    UPROPERTY()
    float32 LookAtPitchClampMin;
    UPROPERTY()
    float32 LookAtPitchClampMax;
    UPROPERTY()
    FHeadLocalRotationLimit HeadLocalRotationLimit;
    UPROPERTY()
    float32 RestoreSpeed;

    FNeckIKFailureSetting()
    {
        FVector local_6 = FVector(240.0, 0.0, 0.0);
        this.DeadZoneRadius = 0.1f;
        this.LookAtYawFailureMin = -179.9f;
        this.LookAtYawFailureMax = 179.9f;
        this.LookAtYawClampMin = -85.0f;
        this.LookAtYawClampMax = 85.0f;
        this.LookAtPitchFailureMin = -90.0f;
        this.LookAtPitchFailureMax = 90.0f;
        this.LookAtPitchClampMin = -30.0f;
        this.LookAtPitchClampMax = 40.0f;
        this.RestoreSpeed = 20.0f;
        return;
    }
}

struct FDebugDrawSetting
{
    UPROPERTY()
    bool bDrawBoneXforms = false;
    UPROPERTY()
    bool bDrawLookAtTarget = false;
    UPROPERTY()
    bool bDrawCurve = false;
    UPROPERTY()
    bool bDrawDeadZone = false;
    UPROPERTY()
    bool bDrawPBDSolver = false;


}

struct FNeckTailTwistSetting
{
    UPROPERTY()
    float32 Scale = 2.0f;
    UPROPERTY()
    float32 MaxOffset = 20.0f;
    UPROPERTY()
    float32 FastLerpAlpha = 0.15f;
    UPROPERTY()
    float32 SlowLerpAlpha = 0.05f;


}

struct FNeckWaveSettings
{
    UPROPERTY()
    float32 TangentScaleMin = 1.0f;
    UPROPERTY()
    float32 TangentScaleMax = 2.5f;
    UPROPERTY()
    float32 LerpSpeedWhenMoving = 5.0f;
    UPROPERTY()
    float32 ConstantRatioDuringTransition = 0.01f;
    UPROPERTY()
    float32 LerpSpeedWhenStop = 0.5f;
    UPROPERTY()
    bool bHitHigh = false;
    UPROPERTY()
    float32 MinFrameTime = 0.016666668f;


    float32 GetNeckTailTangent(const bool bIsTargetMoving, const float32 CurrentTangent, const float32 TangentBaseline, const float32 DeltaSeconds)
    {
        float32 local_1 = 0.0f;
        float32 local_3 = 0.0f;
        if (bIsTargetMoving)
        {
            local_1 = TangentBaseline * this.TangentScaleMin;
            local_3 = this.LerpSpeedWhenMoving;
            this.bHitHigh = false;
        }
        else
        {
            float32 local_2 = TangentBaseline * this.TangentScaleMax;
            float32 local_5 = TangentBaseline * 0.02f;
            if (!(this.bHitHigh))
            {
                this.bHitHigh = FMath::IsNearlyEqual(CurrentTangent, local_2, local_5);
            }
            if (!(this.bHitHigh))
            {
                local_1 = local_2;
                return FMath::FInterpConstantTo(CurrentTangent, local_1, DeltaSeconds, (local_1 * this.ConstantRatioDuringTransition) / FMath::Max(DeltaSeconds, this.MinFrameTime));
            }
            local_1 = TangentBaseline;
            local_3 = this.LerpSpeedWhenStop;
        }
        return FMath::FInterpTo(CurrentTangent, local_1, DeltaSeconds, local_3);
    }
}

class USPT_LongNeckIKBase : USPT_HeadControlTemplate
{
    UPROPERTY()
    FPT_BoneChainRef NeckBoneChain;
    UPROPERTY()
    FPT_BoneRef HeadBone;
    UPROPERTY()
    float32 NeckRootTangentIntensity = 300.0f;
    UPROPERTY()
    float32 NeckTailTangentIntensity = 300.0f;
    float32 CurrNeckTailTangentIntensity;
    UPROPERTY()
    FVector LookAtTargetWS;
    UPROPERTY()
    FTransform DebugInput;
    FVector LookAtTargetCS;
    FVector PrevLookAtTargetCS;
    UPROPERTY()
    float32 NeckFollowSpeed = 7.0f;
    UPROPERTY()
    FNeckTailTwistSetting NeckTailTwistSetting;
    UPROPERTY()
    float32 InputHeadTwistDecoWeight = 1.0f;
    UPROPERTY()
    FNeckWaveSettings NeckWaveSettings;
    UPROPERTY()
    FNeckIKFailureSetting FailureSetting;
    UPROPERTY()
    bool bEnableCollision = false;
    UPROPERTY()
    float32 CollisionStiffness = 1.0f;
    UPROPERTY()
    float32 AnimTargetStiffness = 0.003f;
    UPROPERTY()
    float32 AnimCurvatureStiffness = 0.5f;
    UPROPERTY()
    float32 BoneChainRadius = 50.0f;
    UPROPERTY()
    float32 GlobalDamping = 0.9f;
    UPROPERTY()
    bool bLandscapeCollisionOnly = true;
    UPROPERTY()
    bool bEnablePersonaWidget = false;
    UPROPERTY()
    FDebugDrawSetting DebugDrawSetting;
    TArray<float> BoneLengthRatios;
    float TotalLength;
    FTransform HeadBoneRefTM;
    float HeadRefPoseRoll;
    FQuat CurrentHeadRotation;
    FVector CurrentHeadLocation;
    TArray<FTransform> CurrNeckBoneTMs;
    FQuat SmoothedHeadAimRot;
    float32 SmoothedDeltaTime;
    FPT_BoneChainPBDSolver Solver;
    bool bSolverInited = false;
    FBoneChainTranformArrayView CombinedChainTMs;
    FBox ChainCompSpaceBounds;


    UFUNCTION()
    void OnInitialization_Implementation()
    {
        int local_126 = 0;
        Super::OnInitialization_Implementation();
        this.LookAtTargetCS = this.InvAnimComponentTransform.TransformPosition(this.LookAtTargetWS);
        this.PrevLookAtTargetCS = this.LookAtTargetCS;
        this.CurrentHeadRotation = FQuat::Identity;
        this.CurrNeckTailTangentIntensity = this.NeckTailTangentIntensity;
        this.BoneLengthRatios.Empty(0);
        this.TotalLength = 0.0;
        if (this.NeckBoneChain.IsValid())
        {
            this.CurrNeckBoneTMs.Reset(this.NeckBoneChain.GetBoneNum());
            this.CurrNeckBoneTMs.SetNum(this.NeckBoneChain.GetBoneNum());
            int local_12 = 0;
            for (; local_12 < this.NeckBoneChain.GetBoneNum(); ++local_12)
            {
                this.CurrNeckBoneTMs[local_12] = this.NeckBoneChain.GetTransform(local_12);
                if (local_12 == 0)
                {
                    this.BoneLengthRatios.Add(0.0);
                    continue;
                }
                float local_10_2 = (this.NeckBoneChain.GetTransform(local_12).GetLocation() - this.NeckBoneChain.GetTransform((local_12 - 1)).GetLocation()).Size();
                this.TotalLength += local_10_2;
                this.BoneLengthRatios.Add(this.TotalLength);
            }
            auto local_86 = this.BoneLengthRatios.Iterator();
            for (; local_86.CanProceed;)
            {
                float local_94 = (local_86.Proceed() / this.TotalLength);
            }
            this.BoneLengthRatios[(this.BoneLengthRatios.Num() - 1)] = 1.0;
            if (this.HeadBone.HasValidSetup())
            {
                this.HeadBoneRefTM = this.HeadBone.GetRefPoseTransform();
                this.HeadRefPoseRoll = this.HeadBoneRefTM.GetRotation().Rotator().Roll;
                this.CurrentHeadRotation = this.HeadBone.GetRotation();
                this.CurrentHeadLocation = this.HeadBone.GetLocation();
            }
        }
        this.bSolverInited = false;
        this.SmoothedDeltaTime = 0.0167f;
        FBox local_124;
        this.ChainCompSpaceBounds = local_124;
        if (this.bEnableCollision)
        {
            if (this.bLandscapeCollisionOnly)
            {
                int local_127;
                local_127 = 2;
                local_126 = local_127;
            }
            else
            {
                int local_127;
                local_127 = 1;
                local_126 = local_127;
            }
        }
        else
        {
            int local_127;
            local_127 = 0;
        }
        return;
    }
    UFUNCTION()
    TArray<UPrimitiveComponent> CollectExternalComponentsForCollision_Implementation()
    {
        AActor local_138;
        TArray<AActor> local_4;
        TArray<UPrimitiveComponent> local_8;
        if (this.Solver.IsInitialized())
        {
            this.ChainCompSpaceBounds = this.Solver.ComponentSpaceBounds();
            FBoxSphereBounds local_52 = FBoxSphereBounds(this.ChainCompSpaceBounds.TransformBy(this.AnimComponentTransform));
            TArray<FOverlapResult> local_56;
            FCollisionQueryParams local_94;
            bool local_9 = false;
            local_94.bTraceComplex = local_9;
            local_94.AddIgnoredComponent(this.OwnerComponent);
            float local_104 = local_52.GetSphere().W;
            TArray<FOverlapResult> local_109;
            FCollisionShape::MakeSphere(local_109);
            FSphere local_102 = local_52.GetSphere();
            UWorld local_112 = this.OwnerComponent.GetWorld();
            for (auto& local_136 : local_56)
            {
                local_138 = local_136.GetActor();
                if ((local_138 != nullptr && local_9))
                {
                    local_4.Add(local_136.GetActor());
                }
            }
            auto local_150 = local_4.Iterator();
            for (; local_150.CanProceed;)
            {
                local_138 = local_150.Proceed();
                TArray<ULandscapeHeightfieldCollisionComponent> local_160 = local_138.GetComponentsByClass(ULandscapeHeightfieldCollisionComponent);
                for (auto local_178 : local_160)
                {
                    if (!(FBoxSphereBounds::BoxesIntersect(local_52, local_178.GetBounds())))
                    {
                        continue;
                    }
                    local_8.Add(local_178);
                }
            }
        }
        return local_8;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        if (!(this.NeckBoneChain.IsValid()))
        {
            return;
        }
        this.LookAtTargetCS = this.InvAnimComponentTransform.TransformPosition(this.LookAtTargetWS);
        this.AbsolutePose();
        this.PrevLookAtTargetCS = this.LookAtTargetCS;
        return;
    }
    bool IsTargetMoving(const float32 DeltaSeconds) const
    {
        float32 local_3 = FMath::Max(DeltaSeconds, 0.01f);
        return (((float32(((this.LookAtTargetCS - this.PrevLookAtTargetCS).Size()))) / local_3) > 300.0f);
    }
    void DecomposeAlignRotation(const FVector &inout FromAxis, const FVector &inout ToAxis, FQuat &inout YawOnly, FQuat &inout PitchOnly, const float32 YawLimit = -1)
    {
        float32 local_37;
        YawOnly = FQuat::Identity;
        PitchOnly = FQuat::Identity;
        if (FromAxis.IsNearlyZero(9.999999747378752e-5) || ToAxis.IsNearlyZero(9.999999747378752e-5) || FromAxis.CrossProduct(ToAxis).IsNearlyZero(9.999999747378752e-5))
        {
            return;
        }
        FVector local_10 = FVector(FromAxis.X, FromAxis.Y, 0.0);
        FVector local_16 = FVector(ToAxis.X, ToAxis.Y, 0.0);
        if (local_10.IsNearlyZero(9.999999747378752e-5) || local_16.IsNearlyZero(9.999999747378752e-5))
        {
            PitchOnly = FQuat::FindBetween(FromAxis, ToAxis);
            return;
        }
        if (YawLimit < 0.0f)
        {
            YawOnly = FQuat::FindBetween(local_10, local_16);
            PitchOnly = FQuat::FindBetween(local_16, ToAxis);
            return;
        }
        float32 local_40 = FMath::Clamp(YawLimit, 0.0f, 179.0f);
        YawOnly = FQuat::FindBetween(local_10, local_16);
        FVector local_46 = local_16;
        FRotator local_58 = YawOnly.Rotator();
        if (FMath::Abs(local_58.Yaw) > local_40)
        {
            if (local_58.Yaw > 0.0)
            {
                local_37 = local_40;
            }
            else
            {
                float32 local_38 = -local_40;
                local_37 = local_38;
            }
            local_58.Yaw = local_37;
            YawOnly = local_58.Quaternion();
            local_46 = YawOnly.RotateVector(local_10);
        }
        PitchOnly = FQuat::FindBetween(local_46, ToAxis);
        return;
    }
    void XformInterpTo_Additive(FTransform &inout Current, const FTransform &inout Target, const FTransform &inout Anim, const float32 DeltaSeconds, const float32 Speed)
    {
        FVector local_18 = (Target.GetLocation() - Anim.GetLocation());
        FVector local_6 = FMath::VInterpTo((Current.GetLocation() - Anim.GetLocation()), local_18, DeltaSeconds, Speed);
        Current.SetLocation((local_6 + Anim.GetLocation()));
        FQuat local_32 = (Current.GetRotation() * Anim.GetRotation().Inverse());
        FQuat local_48 = (Target.GetRotation() * Anim.GetRotation().Inverse());
        Current.SetRotation((FQuat::Slerp(local_32, local_48, 0.5) * Anim.GetRotation()));
        Current.SetScale3D(Target.GetScale3D());
        return;
    }
    bool ValueIsInRange(const float Value, const float Min, const float Max)
    {
        return Value <= Max && (Value >= Min);
    }
    float32 GetDeltaTimeForStableSimulation()
    {
        this.SmoothedDeltaTime = FMath::Lerp(this.CurrentDeltaSeconds, this.SmoothedDeltaTime, 0.95f);
        return this.SmoothedDeltaTime;
    }
    void AbsolutePose()
    {
        float local_390;
        float32 local_2 = this.GetDeltaTimeForStableSimulation();
        FTransform local_28 = FTransform(this.HeadBone.GetTransform());
        FTransform local_52 = this.NeckBoneChain.GetRootTM();
        FTransform local_76 = this.NeckBoneChain.GetTailTM();
        FTransform local_100 = local_76.GetRelativeTransform(local_28);
        FTransform local_124 = local_28.GetRelativeTransform(local_76);
        bool local_150 = this.IsTargetMoving(local_2);
        FVector local_178 = (this.LookAtTargetCS - local_28.GetLocation());
        FQuat local_204 = (FQuat::FindBetween(Super::GetLookAtBoneForwardAxis(local_28.GetRotation().GetAxisX()), local_178) * local_28.GetRotation());
        FRotator local_218 = local_204.Rotator();
        bool local_149 = (!(this.ValueIsInRange(local_218.Yaw, this.FailureSetting.LookAtYawFailureMin, this.FailureSetting.LookAtYawFailureMax))) || !(this.ValueIsInRange(local_218.Pitch, this.FailureSetting.LookAtPitchFailureMin, this.FailureSetting.LookAtPitchFailureMax));
        bool local_205 = local_149;
        if (!(local_205))
        {
            FNeckIKFailureSetting local_228;
            local_218.Pitch = FMath::Clamp(local_218.Pitch, local_228.LookAtPitchClampMin, local_228.LookAtPitchClampMax);
            local_218.Yaw = FMath::Clamp(local_218.Yaw, local_228.LookAtYawClampMin, local_228.LookAtYawClampMax);
            local_204 = local_218.Quaternion();
        }
        else
        {
            local_204 = FQuat::Identity;
        }
        this.SmoothedHeadAimRot = FMath::RInterpTo(this.SmoothedHeadAimRot.Rotator(), local_204.Rotator(), local_2, this.NeckFollowSpeed).Quaternion();
        FTransform local_276 = (local_100 * FTransform(this.SmoothedHeadAimRot, local_28.GetLocation(), local_28.GetScale3D()));
        this.CurrNeckTailTangentIntensity = this.NeckWaveSettings.GetNeckTailTangent(local_150, this.CurrNeckTailTangentIntensity, this.NeckTailTangentIntensity, local_2);
        FHermiteCurveSpline local_312 = FHermiteCurveSpline(local_52, local_276, this.NeckRootTangentIntensity, this.CurrNeckTailTangentIntensity, 0.02, this.TotalLength);
        if (this.DebugDrawSetting.bDrawCurve)
        {
            local_312.DebugDraw(this, FVector::ZeroVector, FColor::Yellow);
            this.TestCurveValidity(local_312);
        }
        bool local_225 = this.IsFailureCase(this.LookAtTargetCS, local_312.Eval(1.0).Location, local_204.GetAxisX(), local_52, local_76);
        if (local_225 || local_205)
        {
            int local_335 = 0;
            for (; local_335 < this.NeckBoneChain.GetBoneNum(); )
            {
                this.XformInterpTo_Additive(this.CurrNeckBoneTMs[local_335], this.NeckBoneChain.GetTransform(local_335), this.NeckBoneChain.GetTransform(local_335), local_2, this.FailureSetting.RestoreSpeed);
                this.NeckBoneChain.SetTransform(local_335, this.CurrNeckBoneTMs[local_335]);
                ++local_335;
            }
            FTransform local_300 = (local_124 * this.NeckBoneChain.GetTailTM());
            local_300.SetRotation(FMath::RInterpTo(this.CurrentHeadRotation.Rotator(), local_300.Rotator(), local_2, this.NeckFollowSpeed).Quaternion());
            this.HeadBone.SetTransform(local_300);
        }
        else
        {
            FNeckIKFailureSetting local_228;
            float32 local_458;
            float32 local_457;
            int local_335_2 = 0;
            for (; local_335_2 < this.NeckBoneChain.GetBoneNum(); )
            {
                FTransform local_388 = this.NeckBoneChain.GetTransform(local_335_2);
                local_390 = this.BoneLengthRatios[local_335_2];
                this.XformInterpTo_Additive(this.CurrNeckBoneTMs[local_335_2], local_312.EvalByLengthRatio(local_390).MakeTransform(), local_388, local_2, this.FailureSetting.RestoreSpeed);
                this.NeckBoneChain.SetTransform(local_335_2, this.CurrNeckBoneTMs[local_335_2]);
                ++local_335_2;
            }
            FTransform local_300_2 = (local_124 * this.NeckBoneChain.GetTailTM());
            FTransform local_436 = local_300_2;
            FRotator local_212 = ((FQuat::FindBetween(local_300_2.GetRotation().GetAxisX(), (this.LookAtTargetCS - local_300_2.GetLocation()))) * local_436.GetRotation()).Rotator();
            float local_220_4 = ((local_436.GetLocation() - this.CurrentHeadLocation) * (1.0f / FMath::Max(local_2, 0.1f))).DotProduct(this.RootBoneRef.GetRotation().GetAxisY());
            float local_454 = -this.NeckTailTwistSetting.MaxOffset;
            local_390 = this.NeckTailTwistSetting.Scale;
            local_390 = (local_220_4 * local_390) * this.InputHeadTwistDecoWeight;
            float local_230_2 = FMath::Clamp(local_390, local_454, this.NeckTailTwistSetting.MaxOffset);
            local_212.Roll = (local_230_2 + this.HeadRefPoseRoll);
            local_457 = this.NeckTailTwistSetting.FastLerpAlpha;
            local_458 = this.NeckTailTwistSetting.SlowLerpAlpha;
            if (local_150)
            {
                local_230_2 = local_457;
                local_390 = FMath::Lerp(this.CurrentHeadRotation.Rotator(), local_212.Roll, local_230_2);
                local_212.Roll = local_390;
            }
            else
            {
                local_454 = local_458;
                local_390 = FMath::Lerp(this.CurrentHeadRotation.Rotator(), this.HeadRefPoseRoll, local_454);
                local_212.Roll = local_390;
            }
            local_390 = local_457;
            local_212.Yaw = FMath::Lerp(this.CurrentHeadRotation.Rotator(), local_212.Yaw, local_390);
            local_230_2 = local_457;
            local_212.Pitch = FMath::Lerp(this.CurrentHeadRotation.Rotator(), local_212.Pitch, local_230_2);
            FQuat local_196 = this.ClampRotationInLocalSpace(local_212.Quaternion(), this.NeckBoneChain.GetTailTM().GetRotation(), local_228.HeadLocalRotationLimit.YawLimit.X, local_228.HeadLocalRotationLimit.YawLimit.Y, local_228.HeadLocalRotationLimit.PitchLimit.X, local_228.HeadLocalRotationLimit.PitchLimit.Y);
            local_436.SetRotation(local_196);
            int local_337 = this.CurrNeckBoneTMs.Num() - 1;
            FTransform& local_460 = this.CurrNeckBoneTMs[local_337];
            FQuat local_468 = FQuat::FindBetweenNormals((FQuat::FindBetweenNormals(local_460.GetRotation().GetAxisX(), local_436.GetRotation().GetAxisX())).RotateVector(local_460.GetRotation().GetAxisZ()), local_436.GetRotation().GetAxisZ());
            local_390 = FMath::RadiansToDegrees(local_468.GetAngle());
            FVector local_178_2 = local_436.InverseTransformVector(local_468.GetRotationAxis());
            local_335_2 = 3;
            int local_485 = 3;
            for (; local_485 > 0; --local_485)
            {
                local_337 = this.CurrNeckBoneTMs.Num();
                local_337 = local_337 - local_485;
                FTransform& local_488 = this.CurrNeckBoneTMs[local_337];
                FQuat local_160 = local_488.GetRotation();
                local_454 = FMath::Pow(local_485, 1.5);
                local_454 = FMath::DegreesToRadians(local_390 / local_454);
                int local_486 = local_178_2.X > 0.0 ? 1 : -1;
                float local_456 = local_486;
                FQuat local_476;
                local_488.SetRotation((local_160 * local_476));
                this.NeckBoneChain.SetTransform(local_337, local_488);
                local_486 = local_337 + 1;
                if (local_486 < this.CurrNeckBoneTMs.Num())
                {
                    this.NeckBoneChain.SetTransform(local_486, this.CurrNeckBoneTMs[local_486]);
                }
            }
            this.HeadBone.SetTransform(local_436);
        }
        this.CurrentHeadRotation = this.HeadBone.GetRotation();
        this.CurrentHeadLocation = this.HeadBone.GetLocation();
        if (this.bEnableCollision)
        {
            FTransform local_364 = FTransform(this.CurrentHeadRotation, this.CurrentHeadLocation, FVector::OneVector);
            this.ProcessCollision(this.CurrNeckBoneTMs, local_364);
            int local_486_2 = 0;
            for (; local_486_2 < this.NeckBoneChain.GetBoneNum(); )
            {
                this.NeckBoneChain.SetTransform(local_486_2, this.CurrNeckBoneTMs[local_486_2]);
                ++local_486_2;
            }
            this.HeadBone.SetTransform(local_364);
        }
        if (this.DebugDrawSetting.bDrawBoneXforms)
        {
            int local_337_2 = 0;
            for (; local_337_2 < this.NeckBoneChain.GetBoneNum(); )
            {
                this.DrawAnimDebugTransform(this.CurrNeckBoneTMs[local_337_2], 50.0f, true);
                ++local_337_2;
            }
            this.DrawAnimDebugTransform(this.HeadBone.GetTransform(), 50.0f, true);
        }
        if (this.DebugDrawSetting.bDrawLookAtTarget)
        {
            this.DrawAnimDebugTransform(FTransform(this.LookAtTargetCS), 50.0f, true);
            FTransform local_436_2 = FTransform(this.HeadBone.GetTransform());
            this.DrawAnimDebugLine(local_436_2.GetLocation(), (local_436_2.GetLocation() + (local_436_2.GetRotation().GetAxisX() * 500.0)), FColor::Blue, EPTDebugDrawSpace(0), 0.0f, true);
        }
        return;
    }
    FQuat ClampRotationInLocalSpace(const FQuat &inout BoneRotation, const FQuat &inout HeadParentRotation, const float32 MinYaw, const float32 MaxYaw, const float32 MinPitch, const float32 MaxPitch)
    {
        FRotator local_30 = (HeadParentRotation.Inverse() * BoneRotation).Rotator();
        local_30.Yaw = FMath::Clamp(local_30.Yaw, MinYaw, MaxYaw);
        local_30.Pitch = FMath::Clamp(local_30.Pitch, MinPitch, MaxPitch);
        return (HeadParentRotation * local_30.Quaternion());
    }
    void ProcessCollision(TArray<FTransform> &inout NeckBoneTMs, FTransform &inout HeadBoneTM)
    {
        this.CombinedChainTMs.Reset(this.CombinedChainTMs.Num());
        this.CombinedChainTMs.AddArray(NeckBoneTMs);
        this.CombinedChainTMs.AddSingle(HeadBoneTM);
        if (!(this.bSolverInited))
        {
            this.bSolverInited = this.Solver.InitializeCombined(this.CombinedChainTMs, this.BoneChainRadius, 120);
        }
        if (this.bSolverInited)
        {
            this.Solver.CollisionStiffness = this.CollisionStiffness;
            this.Solver.AnimCurvatureStiffness = this.AnimCurvatureStiffness;
            this.Solver.AnimPositionStiffness = this.AnimTargetStiffness;
            this.Solver.GlobalDamping = this.GlobalDamping;
            this.Solver.bLandscapeCollisionOnly = this.bLandscapeCollisionOnly;
            this.Solver.ClearColliders();
            this.Solver.UpdateTargetLocationCombined(this.CombinedChainTMs);
            this.Solver.Solve();
            this.Solver.WriteBackCombined(this.CombinedChainTMs);
        }
        return;
    }
    void TestCurveValidity(const FHermiteCurveSpline &inout Curve)
    {
        FCurveParamValue local_22 = Curve.Eval(0.0);
        FCurveParamValue local_42 = Curve.Eval(1.0);
        FVector local_68 = FVector(100.0, 0.0, 0.0);
        FVector local_94 = (local_42.Location + local_68);
        FHermiteCurveSpline local_82 = FHermiteCurveSpline((local_22.Location + local_68), local_94, local_22.Tangent, local_42.Tangent, local_22.UnitNormal, 0.01, -1.0);
        local_82.DebugDraw(this, FVector::ZeroVector, FColor::Green);
        float local_72 = local_82.GetLength_DiscreteSum();
        float local_2 = local_82.GetLength();
        return;
    }
    bool IsFailureCase(const FVector &inout Target, const FVector &inout NeckTailLocation, const FVector &inout NeckTailToLookAtTarget, const FTransform &inout AnimNeckRoot, const FTransform &inout AnimNeckTail)
    {
        FVector local_2;
        float32 local_3 = this.FailureSetting.DeadZoneRadius;
        if (this.DebugDrawSetting.bDrawDeadZone)
        {
            this.DrawAnimDebugSphere(local_2, local_3, 16, FColor::Black, EPTDebugDrawSpace(0), ESceneDepthPriorityGroup(1));
        }
        FVector local_14 = (Target - local_2);
        if (local_14.Size() < local_3)
        {
            return true;
        }
        FVector local_14_2 = FVector(1.0, 0.0, 0.0);
        FQuat local_44 = FQuat::FindBetween(local_14_2, NeckTailToLookAtTarget);
        FRotator local_56 = local_44.Rotator();
        if (((!(this.ValueIsInRange(local_56.Yaw, this.FailureSetting.LookAtYawFailureMin, this.FailureSetting.LookAtYawFailureMax))) || !(this.ValueIsInRange(local_56.Pitch, this.FailureSetting.LookAtPitchFailureMin, this.FailureSetting.LookAtPitchFailureMax))))
        {
            return true;
        }
        return false;
    }
}

class USPT_LongNeckIK_Wyvern001_HarbingerOfDoom : USPT_LongNeckIKBase
{
    USPT_LongNeckIK_Wyvern001_HarbingerOfDoom()
    {
        super();
        this.HeadBone.SetBoneName(n"Head");
        this.NeckBoneChain.BoneNames = UPoseTweakerUtil::ParseRangeIntoNames("neck_", 1, 6, 2, "");
        this.bEnableCollision = false;
        this.bLandscapeCollisionOnly = true;
        return;
    }
}




namespace FootIKUtils
{
struct FKLGroundPlaneTraceResultInSPT : FKLGroundPlaneTraceResult
{
    FKLGroundPlaneTraceResult _base_FKLGroundPlaneTraceResult;
    UPROPERTY()
    FTransform PlaneTransformInPT;
    UPROPERTY()
    FVector HeightAdjust;
    UPROPERTY()
    FVector GroundProbePt_L;
    UPROPERTY()
    FVector GroundProbePt_R;

    FKLGroundPlaneTraceResultInSPT()
    {
        return;
    }
}

}
struct FFootEffectorDebugDrawFlags
{
    UPROPERTY()
    bool bDrawAnimLocation = false;
    UPROPERTY()
    bool bDrawVirtualGroundHit = false;
    UPROPERTY()
    bool bDrawReprojectedLocation = false;
    UPROPERTY()
    bool bDrawFinalLocation = false;
    UPROPERTY()
    bool bDrawRealGroundTrace = false;
    UPROPERTY()
    bool bDrawRealGroundHit = false;


}

struct FKLFootIKInstance : FPT_TwoBoneIK
{
    FPT_TwoBoneIK _base_FPT_TwoBoneIK;
    UPROPERTY()
    bool bWantsDebugDraw;
    UPROPERTY()
    bool bHasPrevEffectorLoc;
    UPROPERTY()
    FVector prevEffectorLoc_ws;
    UPROPERTY()
    FTransform PinTM_ws;
    UPROPERTY()
    float PinInnnerRadius;
    UPROPERTY()
    float PinOutterRadius;
    UPROPERTY()
    bool IsPrevPin;
    UPROPERTY()
    FPT_TransformDamping FootOffsetDamper;
    UPROPERTY()
    float MaxPinDistance;
    UPROPERTY()
    FPT_DistanceDamping HeightRefineDamper;
    UPROPERTY()
    float32 FootFastMovingSpeed;

    FKLFootIKInstance()
    {
        this.PinInnnerRadius = 0.0;
        this.PinOutterRadius = 0.0;
        this.bWantsDebugDraw = false;
        this.bHasPrevEffectorLoc = false;
        this.IsPrevPin = false;
        this.MaxPinDistance = 150.0;
        this.FootFastMovingSpeed = 50.0f;
        this.PinTM_ws = FTransform::Identity;
        this.FootOffsetDamper.LinearSpeedDampingStart = 1.0f;
        this.FootOffsetDamper.LinearOverSpeedDamping = 0.1f;
        return;
    }
    void UpdatePinState(const USkeletalPoseTweaker poseTweaker, const float32 footStepSnapDistance = 30.0)
    {
        FTransform local_24;
        FTransform local_48;
        float32 local_49 = 0.0f;
        if (this.GetFootstepInfo(local_24, local_48, local_49))
        {
            bool local_52;
            local_52 = false;
            FTransform local_76 = FTransform(FTransform::Identity);
            if (local_49 > 0.5f)
            {
                local_52 = true;
                local_76 = local_24;
            }
            if (local_49 < -0.5f)
            {
                local_52 = true;
                local_76 = local_48;
            }
            if (!(this.IsPrevPin) && local_52)
            {
                this.PinTM_ws = (local_76 * poseTweaker.AnimComponentTransform);
            }
            FTransform local_100 = this.PinTM_ws.GetRelativeTransform(poseTweaker.AnimComponentTransform);
            FTransform local_148 = FTransform(FTransform::Identity);
            if (local_52)
            {
                FVector local_172 = (local_100.GetLocation() - local_76.GetLocation());
                local_172.Z = 0.0;
                if (local_172.Size() < footStepSnapDistance)
                {
                    local_52 = false;
                    local_148.SetLocation(local_172);
                }
            }
            local_148 = this.FootOffsetDamper.Update(local_148);
            this.Solve((this.GetEffectorTM() * local_148));
            this.IsPrevPin = local_52;
        }
        return;
    }
    float UpdateEffectorSpeed(const FTransform &inout CompTM, const float TimeElapsed)
    {
        float local_2 = 0.0;
        FVector local_48 = CompTM.TransformPosition(this.GetEffectorTM().GetLocation());
        if (this.bHasPrevEffectorLoc)
        {
            local_2 = (local_48 - this.prevEffectorLoc_ws).Size() / FMath::Max(TimeElapsed, 0.001);
        }
        this.bHasPrevEffectorLoc = true;
        this.prevEffectorLoc_ws = local_48;
        return local_2;
    }
    void AdjustEffectorHeight(USkeletalPoseTweaker &inout PT, const FTransform &inout OldEffectorTM, const FPlane &inout GroundPlaneCS, const FAnimGroundRefInfo &inout AnimGroundRef, const FTransform &inout ComponentTM, const float32 TimeDelta, const FVector &inout AnimFootHeightOffsetCS, const FKLGroundPlaneTraceParams &inout GroundTraceParams, const float32 TraceOffsetScale, FTransform &inout OutNewEffectorTM, const FFootEffectorDebugDrawFlags &inout DebugFlags = FFootEffectorDebugDrawFlags())
    {
        float32 local_27;
        USPT_GroundTraceBase local_84;
        USPT_GroundTraceBase local_88;
        UESMAnimInstance local_164;
        FVector local_12 = ((FVector(GroundTraceParams.TraceDirection) * 5000.0) * TraceOffsetScale);
        float local_24 = this.UpdateEffectorSpeed(ComponentTM, TimeDelta);
        float local_14 = FMath::Clamp(local_24 / this.FootFastMovingSpeed, 0.0, 1.0);
        bool local_33 = this.bWantsDebugDraw;
        if (local_33 && DebugFlags.bDrawAnimLocation)
        {
            PT.DrawAnimDebugSphere(OldEffectorTM.GetLocation(), 5.0f, 12, FColor::White, EPTDebugDrawSpace(0), ESceneDepthPriorityGroup(1));
        }
        OutNewEffectorTM = OldEffectorTM;
        FVector local_6;
        FVector local_44 = (OldEffectorTM.GetLocation() + local_12);
        bool local_34 = FMath::SegmentPlaneIntersection((OldEffectorTM.GetLocation() - local_12), local_44, GroundPlaneCS, local_6);
        if (local_34)
        {
            float32 local_241;
            if (local_33 && DebugFlags.bDrawVirtualGroundHit)
            {
                PT.DrawAnimDebugSphere(local_6, 8.0f, 12, FColor::Red, EPTDebugDrawSpace(0), ESceneDepthPriorityGroup(1));
            }
            FTransform local_76 = OldEffectorTM;
            FVector local_82 = local_6;
            local_82 += AnimFootHeightOffsetCS;
            if (local_33 && DebugFlags.bDrawReprojectedLocation)
            {
                PT.DrawAnimDebugSphere(local_6, 5.0f, 12, FColor::Green, EPTDebugDrawSpace(0), ESceneDepthPriorityGroup(1));
                PT.DrawAnimDebugLine(local_6, local_82, FColor::Red, EPTDebugDrawSpace(0), 0.0f, true);
                PT.DrawAnimDebugSphere(local_82, 5.0f, 12, FColor::Green, EPTDebugDrawSpace(0), ESceneDepthPriorityGroup(1));
            }
            if (PT != nullptr)
            {
                USkeletalPoseTweaker local_86;
                local_88 = Cast<USPT_GroundTraceBase>(local_86);
            }
            else
            {
                local_88 = nullptr;
            }
            local_84 = local_88;
            if (local_84 != nullptr)
            {
                local_27 = local_84.RealGroundTraceHalfRange;
            }
            else
            {
                local_27 = 0.0f;
            }
            FVector local_50 = (AnimGroundRef.Up * local_27);
            if (local_33 && DebugFlags.bDrawRealGroundTrace)
            {
                PT.DrawAnimDebugArrow(local_82, (local_82 + local_50), 5.0f, FColor::Cyan, 0.0f, true);
                PT.DrawAnimDebugArrow(local_82, (local_82 - local_50), 5.0f, FColor::Cyan, 0.0f, true);
            }
            FHitResult local_162;
            local_164 = (Cast<UESMAnimInstance>(PT.GetAnimInstance()));
            if (local_164 != nullptr && local_164.GetbLogicUpdate())
            {
                local_162 = local_164.Entity.TraceLineByEntity(false, ComponentTM.TransformPosition((local_82 + local_50)), ComponentTM.TransformPosition((local_82 - local_50)), true, ECollisionChannel(3));
            }
            else
            {
                UWorld local_238 = PT.GetComponentWorld();
                local_162 = local_238.TraceLine(ComponentTM.TransformPosition((local_82 + local_50)), ComponentTM.TransformPosition((local_82 - local_50)), true, ECollisionChannel(3));
            }
            local_241 = 0.0f;
            if (local_162.GetbBlockingHit())
            {
                FVector local_96 = ComponentTM.InverseTransformPosition(local_162.ImpactPoint);
                if (local_33 && DebugFlags.bDrawRealGroundHit)
                {
                    PT.DrawAnimDebugSphere(local_96, 3.0f, 12, FColor::Black, EPTDebugDrawSpace(0), ESceneDepthPriorityGroup(0));
                }
                float32 local_89 = AnimGroundRef.GetHeightAlongUpDir((local_96 + AnimFootHeightOffsetCS));
                float32 local_90 = AnimGroundRef.GetHeightAlongUpDir(local_82);
                float local_22 = local_89;
                local_22 = FMath::Lerp(local_22, local_90, local_14) - local_90;
                local_241 = float32(local_22);
            }
            local_82.Z = (local_82.Z + this.HeightRefineDamper.Update(local_241));
            if (local_33 && DebugFlags.bDrawFinalLocation)
            {
                PT.DrawAnimDebugSphere(local_82, 15.0f, 12, FColor::Yellow, EPTDebugDrawSpace(0), ESceneDepthPriorityGroup(1));
            }
            local_76.SetLocation(local_82);
            OutNewEffectorTM = local_76;
            this.Solve(local_76);
            return;
        }
        return;
    }
}

UCLASS(Abstract)
class USPT_GroundTraceBase : USkeletalPoseTweaker
{
    UPROPERTY()
    FKLGroundPlaneTraceParams GroundTraceParams;
    UPROPERTY()
    float32 RealGroundTraceHalfRange;
    UPROPERTY()
    FPT_TransformDamping PelvisAdjustDamper;
    FootIKUtils::FKLGroundPlaneTraceResultInSPT GroundPlaneTraceResult;
    UPROPERTY()
    int GroundTracePointNum;
    UPROPERTY()
    float32 GroundTraceRadiusX;
    UPROPERTY()
    float32 GroundTraceRadiusY;
    UPROPERTY()
    bool bDebugDrawGroundPlane;
    UPROPERTY()
    FRuntimeFloatCurve HeightProbeRadiusCurve;

    USPT_GroundTraceBase()
    {
        this.RealGroundTraceHalfRange = 20.0f;
        this.GroundTracePointNum = 0;
        this.GroundTraceRadiusX = 15.0f;
        this.GroundTraceRadiusY = 15.0f;
        this.bDebugDrawGroundPlane = false;
        this.PelvisAdjustDamper.LinearSpeedDampingStart = 20.0f;
        this.PelvisAdjustDamper.LinearOverSpeedDamping = 0.05f;
        this.PelvisAdjustDamper.AngleSpeedDampingStart = 30.0f;
        return;
    }
    bool TraceVirtualGround(const FVector &inout startPt, const FVector &inout endPt, FVector &inout hitPt, FVector &inout hitNorm)
    {
        hitPt = endPt;
        if (startPt.Equals(endPt, 9.999999747378752e-5))
        {
            return false;
        }
        FPlane local_12 = FPlane(this.GroundPlaneTraceResult.PlaneTransformInPT.GetLocation(), this.GroundPlaneTraceResult.PlaneTransformInPT.GetRotation().GetAxisZ());
        if (FMath::SegmentPlaneIntersection(startPt, endPt, local_12, hitPt))
        {
            hitNorm = local_12.GetNormal();
            return true;
        }
        return false;
    }
    bool TraceRealGround(const FVector &inout startPt, const FVector &inout endPt, const float32 MaxDistToVPlane, FVector &inout hitPt, FVector &inout hitNorm)
    {
        UESMAnimInstance local_28;
        hitPt = endPt;
        hitNorm = FVector(0.0, 0.0, 1.0);
        if (startPt.Equals(endPt, 9.999999747378752e-5))
        {
            return false;
        }
        else
        {
            FVector local_6 = this.AnimComponentTransform.TransformPosition(startPt);
            FVector local_20 = this.AnimComponentTransform.TransformPosition(endPt);
            local_28 = (Cast<UESMAnimInstance>(this.GetAnimInstance()));
            FHitResult local_98;
            if (local_28 != nullptr && local_28.GetbLogicUpdate())
            {
                local_98 = local_28.Entity.TraceLineByEntity(true, local_6, local_20, true, ECollisionChannel(3));
            }
            else
            {
                UWorld local_168 = this.GetComponentWorld();
                local_98 = local_168.TraceLine(local_6, local_20, true, ECollisionChannel(3));
            }
            if (local_98.GetbBlockingHit())
            {
                FPlane local_180 = FPlane(this.GroundPlaneTraceResult.PlaneTransformInPT.GetLocation(), this.GroundPlaneTraceResult.PlaneTransformInPT.GetRotation().GetAxisZ());
                FVector local_26 = this.InvAnimComponentTransform.TransformPosition(local_98.ImpactPoint);
                float32 local_202 = float32(local_180.PlaneDot(local_26));
                float32 local_201 = local_202 - FMath::Clamp(local_202, -MaxDistToVPlane, MaxDistToVPlane);
                hitPt = (local_26 - local_180.GetNormal().opMul_r(local_201));
                hitNorm = local_180.GetNormal();
                return true;
            }
            else
            {
                return false;
            }
        }
    }
    bool FootTraceAndAdjust_GetNewFootPositionCommon(const FVector &inout FootPosition, const FVector &inout traceDir, const float footHeight, const float32 traceOffset, FDetailedFootIKData &inout DetailedIK, FVector &inout OutNewFootIKGoal)
    {
        FVector local_6;
        OutNewFootIKGoal = local_6;
        FVector local_12;
        local_6 = (traceDir * traceOffset);
        FVector local_26 = (FootPosition - local_6);
        local_6 = (FootPosition + (traceDir * traceOffset));
        bool local_33 = false;
        FVector local_40 = FootPosition;
        bool local_34 = !(FMath::IsNearlyZero(traceOffset, 1e-8f)) && DetailedIK.IsEnabled(this);
        if (!(local_34))
        {
            local_33 = this.TraceVirtualGround(local_26, local_6, local_40, local_12);
        }
        else
        {
            local_33 = this.TraceRealGround(local_26, local_6, (DetailedIK.MaxDistanceOffPlane * DetailedIK.GetDetailIKWeight(this)), local_40, local_12);
            local_40 = DetailedIK.Damper.Update(local_40, FootPosition, int(this.CurrentDeltaSeconds));
        }
        if (local_33)
        {
            OutNewFootIKGoal = (local_40 - (traceDir * footHeight));
        }
        return local_33;
    }
    void FootTraceAndAdjust(FPT_TwoBoneIK &inout footIK, const FVector &inout traceDir, const float footHeight, const float32 traceOffset, FDetailedFootIKData &inout DetailedIK)
    {
        FTransform local_24 = FTransform(footIK.GetEffectorTM());
        FVector local_54(local_24.GetLocation());
        FVector local_66;
        if (this.FootTraceAndAdjust_GetNewFootPositionCommon(local_54, traceDir, footHeight, traceOffset, DetailedIK, local_66))
        {
            FTransform local_92 = local_24;
            local_92.SetLocation(local_66);
            footIK.Solve(local_92);
        }
        return;
    }
    void FootTraceAndAdjust(FPT_3BoneLegIK &inout footIK, const FVector &inout traceDir, const float footHeight, const float32 traceOffset, const FVector &inout BodyForwardDir, FDetailedFootIKData &inout DetailedIK)
    {
        FTransform local_24 = FTransform(footIK.GetEffectorXformCS());
        FVector local_54(local_24.GetLocation());
        FVector local_66;
        if (this.FootTraceAndAdjust_GetNewFootPositionCommon(local_54, traceDir, footHeight, traceOffset, DetailedIK, local_66))
        {
            FTransform local_92 = local_24;
            local_92.SetLocation(local_66);
            footIK.Solve(local_92, this.RootBoneRef.GetTransform(), BodyForwardDir);
        }
        return;
    }
    void EffectorTraceAndAdjust(FKLFootIKInstance &inout footIK, const FVector &inout traceDir, const float footHeight, const float32 traceOffset)
    {
        FTransform local_24 = FTransform(footIK.GetEffectorTM());
        FVector local_54(local_24.GetLocation());
        FVector local_66;
        FVector local_60 = (traceDir * traceOffset);
        FVector local_80 = (local_54 - local_60);
        FVector local_60_2 = (local_54 + (traceDir * traceOffset));
        if (this.TraceVirtualGround(local_80, local_60_2, local_54, local_66))
        {
            FVector local_72_2 = (traceDir * footHeight);
            FVector local_86 = (local_54 - local_72_2);
            FTransform local_120 = local_24;
            local_120.SetLocation(local_86);
            footIK.Solve(local_120);
        }
        return;
    }
    void GroundPlaneTraceAndHeightAdjust(FootIKUtils::FKLGroundPlaneTraceResultInSPT &inout outResult, const FVector &inout groundPlaneProbePt, const FVector &inout leftHeightProbePt, const FVector &inout rightHeightProbePt, FPT_TransformDamping &inout pelvisDamper, const FRuntimeFloatCurve &inout heightProbleRadiusCurve, const FKLGroundPlaneTraceParams &inout groundPlaneTraceParam)
    {
        UESMAnimInstance local_2 = (Cast<UESMAnimInstance>(this.GetAnimInstance()));
        if (local_2 != nullptr && local_2.GetbLogicUpdate())
        {
            int local_8 = local_2.Entity.GroundPlaneTraceByEntity(false, (FTransform(groundPlaneProbePt) * this.AnimComponentTransform), groundPlaneTraceParam);
        }
        else
        {
            UWorld local_102 = this.GetComponentWorld();
            int local_8_2 = local_102.GroundPlaneTrace((FTransform(groundPlaneProbePt) * this.AnimComponentTransform), groundPlaneTraceParam);
        }
        FTransform local_128 = FTransform(this.AnimComponentTransform);
        if (outResult._base_FKLGroundPlaneTraceResult)
        {
            local_128 = outResult.PlaneTransform;
        }
        local_128 = local_128.GetRelativeTransform(this.AnimComponentTransform);
        local_128 = pelvisDamper.Update(local_128);
        if (this.bDebugDrawGroundPlane)
        {
            this.DrawAnimDebugPlaneRuntime((local_128.GetLocation() + FVector(0.0, 0.0, 0.5)), local_128.GetRotation().GetAxisZ(), 120.0f, FColor(uint8(0), uint8(255), uint8(0), uint8(128)), EPTDebugDrawSpace(0), ESceneDepthPriorityGroup(0));
        }
        outResult.PlaneTransform = (local_128 * this.AnimComponentTransform);
        FVector local_178 = (FVector(groundPlaneTraceParam.TraceDirection) * 5000.0);
        FPlane local_192 = FPlane(local_128.GetLocation(), local_128.GetRotation().GetAxisZ());
        FVector local_150 = FVector(groundPlaneTraceParam.TraceDirection).opNeg();
        FPlane local_216 = FPlane(this.RootBoneRef.GetLocation(), local_150);
        FVector local_222;
        FVector local_228;
        this.GetHeightAdjustmentForFoot(local_216, local_192, leftHeightProbePt, local_178, heightProbleRadiusCurve, outResult.GroundProbePt_L, local_222);
        this.GetHeightAdjustmentForFoot(local_216, local_192, rightHeightProbePt, local_178, heightProbleRadiusCurve, outResult.GroundProbePt_R, local_228);
        outResult.PlaneTransformInPT = local_128;
        if (local_222.DotProduct(local_150) < local_228.DotProduct(local_150))
        {
        }
        else
        {
        }
        return;
    }
    void GroundPlaneHeightAdjust(const FVector &inout InputPlaneLocation, const FQuat &inout InputPlaneRotation, const FVector &inout leftHeightProbePt, const FVector &inout rightHeightProbePt, FPT_TransformDamping &inout PelvisDamper, const FRuntimeFloatCurve &inout HeightProbleRadiusCurve, FTransform &inout OutPlaneTransform, FTransform &inout OutPlaneTransformInPT, FVector &inout OutAdjustHeight)
    {
        OutPlaneTransform = FTransform(InputPlaneRotation, InputPlaneLocation, FVector::OneVector);
        FTransform local_48 = PelvisDamper.Update(OutPlaneTransform.GetRelativeTransform(this.AnimComponentTransform));
        if (this.bDebugDrawGroundPlane)
        {
            this.DrawAnimDebugPlaneRuntime((local_48.GetLocation() + FVector(0.0, 0.0, 0.5)), local_48.GetRotation().GetAxisZ(), 120.0f, FColor::Green, EPTDebugDrawSpace(0), ESceneDepthPriorityGroup(0));
        }
        OutPlaneTransform = (local_48 * this.AnimComponentTransform);
        FVector local_66 = this.InvAnimComponentTransform.TransformVector(InputPlaneRotation.GetAxisZ().GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector)).opNeg();
        FVector local_100 = (local_66 * 5000.0);
        FPlane local_116 = FPlane(local_48.GetLocation(), local_48.GetRotation().GetAxisZ());
        FVector local_106 = local_66.opNeg();
        FPlane local_140 = FPlane(this.RootBoneRef.GetLocation(), local_106);
        FVector local_146;
        FVector local_152;
        FVector local_158;
        FVector local_164;
        this.GetHeightAdjustmentForFoot(local_140, local_116, leftHeightProbePt, local_100, HeightProbleRadiusCurve, local_146, local_158);
        this.GetHeightAdjustmentForFoot(local_140, local_116, rightHeightProbePt, local_100, HeightProbleRadiusCurve, local_152, local_164);
        OutPlaneTransformInPT = local_48;
        if (local_158.DotProduct(local_106) < local_164.DotProduct(local_106))
        {
        }
        else
        {
        }
        return;
    }
    void GetHeightAdjustmentForFoot(const FPlane &inout AnimGround, const FPlane &inout RuntimeGround, const FVector &inout FootLocation, const FVector &inout TraceRadiusVector, const FRuntimeFloatCurve &inout heightProbleRadiusCurve, FVector &inout OutHitOnRuntimeGround, FVector &inout OutPelvisAdjustment)
    {
        FVector local_6 = FootLocation;
        FVector local_12;
        FMath::SegmentPlaneIntersection((local_6 - TraceRadiusVector), (local_6 + TraceRadiusVector), AnimGround, local_12);
        FVector local_24 = ((local_12.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector)) * (heightProbleRadiusCurve.GetFloatValue(float32(local_12.Size()), 0.0f)));
        FVector local_46;
        FMath::SegmentPlaneIntersection((local_24 - TraceRadiusVector), (local_24 + TraceRadiusVector), RuntimeGround, local_46);
        OutHitOnRuntimeGround = local_46;
        OutPelvisAdjustment = (local_46 - local_24);
        return;
    }
}

namespace FootIKUtils
{
FVector SnapToPointWithFalloff(const FVector &inout targetPt, const FVector &inout orgPt, const float32 innerDis, const float32 outterDis)
{
    return FMath::Lerp(targetPt, orgPt, FMath::Clamp((((targetPt - orgPt).Size() - innerDis) / (outterDis - innerDis)), 0.0, 1.0));
}
FTransform RotateAroundPoint(const FTransform &inout inTM, const FVector &inout rotationCenter, const FQuat &inout rotQ)
{
    FTransform local_24 = inTM;
    FVector local_36 = inTM.InverseTransformPosition(rotationCenter);
    local_24.SetRotation((rotQ * inTM.GetRotation()));
    FVector local_64 = (local_24.GetLocation() + rotationCenter);
    local_24.SetLocation((local_64 - local_24.TransformPosition(local_36)));
    return local_24;
}
void CreateGroundPlaneTraceParams(FKLGroundPlaneTraceParams &inout groundPlaneTraceParams, const int problePtNum, const float32 scaleX, const float32 scaleY)
{
    groundPlaneTraceParams.SetNum(problePtNum);
    int local_1 = 0;
    for (; local_1 < problePtNum; )
    {
        float32 local_4 = 0.0f;
        float32 local_6 = 1.0f;
        FMath::SinCos(local_4, local_6, FMath::DegreesToRadians((local_1 * 360.0f) / problePtNum));
        groundPlaneTraceParams[local_1] = FVector3f(local_6 * scaleX, local_4 * scaleY, 0.0f);
        ++local_1;
    }
    return;
}
}

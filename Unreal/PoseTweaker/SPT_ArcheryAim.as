

class USPT_ArcheryAim : USkeletalPoseTweaker
{
    UPROPERTY()
    FPT_BoneRef BoneHead;
    UPROPERTY()
    FVector HeadForwardAxis;
    UPROPERTY()
    FPT_BoneRef BoneLHand;
    UPROPERTY()
    FPT_BoneRef BoneLUpperArm;
    UPROPERTY()
    FPT_BoneRef BoneRHand;
    UPROPERTY()
    FPT_BoneRef BoneRUpperArm;
    UPROPERTY()
    UCurveFloat SpineRotationWeightCurve;
    UPROPERTY()
    FTransform AimTarget;
    UPROPERTY()
    float32 MaxSpineBendAngleDeg;
    UPROPERTY()
    FPT_TwoBoneIK LArmSolver;
    UPROPERTY()
    FPT_TwoBoneIK RArmSolver;
    UPROPERTY()
    FPT_SpineIK SpineSolver;

    USPT_ArcheryAim()
    {
        this.HeadForwardAxis = FVector(0.0, -1.0, 0.0);
        this.MaxSpineBendAngleDeg = 30.0f;
        this.BoneHead.SetBoneName(n"Bone_M_Head_A_01");
        this.BoneLHand.SetBoneName(n"Bone_L_Hand_A_01");
        this.BoneLUpperArm.SetBoneName(n"Bone_L_UpperArm_A_01");
        this.BoneRHand.SetBoneName(n"Bone_R_Hand_A_01");
        this.BoneRUpperArm.SetBoneName(n"Bone_R_UpperArm_A_01");
        this.LArmSolver.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("Bone_L_UpperArm_A_01|Bone_L_Forearm_A_01|Bone_L_Hand_A_01");
        this.RArmSolver.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("Bone_R_UpperArm_A_01|Bone_R_Forearm_A_01|Bone_R_Hand_A_01");
        this.SpineSolver.SetBoneList("Bone_M_Spine_A_01|Bone_M_Spine_A_02|Bone_M_Spine_A_03");
        return;
    }
    UFUNCTION()
    void OnInitialization_Implementation()
    {
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        if (!((this.BoneHead.HasValidSetup() && this.BoneLHand.HasValidSetup() && this.BoneLUpperArm.HasValidSetup() && this.BoneRHand.HasValidSetup() && this.BoneRUpperArm.HasValidSetup())))
        {
            return;
        }
        FTransform local_28 = FTransform(this.BoneLHand.GetTransform());
        FTransform local_76 = FTransform(this.BoneRHand.GetTransform());
        FVector local_94 = this.InvAnimComponentTransform.TransformPosition(this.AimTarget.GetLocation());
        FVector local_82 = (local_94 - local_76.GetLocation());
        if (FMath::IsNearlyZero(local_82.Size(), 9.99999993922529e-9))
        {
            return;
        }
        FVector local_100 = local_28.GetLocation();
        FVector local_88 = (local_100 - local_76.GetLocation()).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        FVector local_100_2 = local_82.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        float local_102 = this.GetAngleBetweenLineAndPlaneRad(local_100_2, FVector(0.0, 0.0, 1.0));
        FQuat local_156 = this.ApplySpineBendAngleConstraint(FQuat::FindBetween(local_88, local_100_2), this.MaxSpineBendAngleDeg);
        this.SpineSolver.SolveR(local_156, this.SpineRotationWeightCurve);
        this.TweakArms(local_94, local_102);
        this.TweakHead(local_94);
        return;
    }
    void TweakArms(const FVector &inout AimTargetCS, const float AngleFromHorizontalRad)
    {
        int local_74 = 0;
        int local_76 = 0;
        FTransform local_24 = FTransform(this.BoneLHand.GetTransform());
        FTransform local_72 = FTransform(this.BoneRHand.GetTransform());
        FVector local_94 = (AimTargetCS - local_72.GetLocation());
        if (FMath::IsNearlyZero(local_94.Size(), 9.99999993922529e-9))
        {
            return;
        }
        FVector local_82 = (local_24.GetLocation() - local_72.GetLocation()).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        float local_96 = (local_24.GetLocation() - local_72.GetLocation()).Size();
        FVector local_106 = local_94.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        FQuat local_136 = FQuat::FindBetween(local_82, local_106);
        float local_114 = -AngleFromHorizontalRad;
        FQuat local_128 = FQuat(local_106, local_114);
        FTransform local_168 = FTransform(this.BoneLUpperArm.GetTransform());
        local_168.SetRotation((local_128 * local_168.GetRotation()));
        this.BoneLUpperArm.SetTransform(local_168);
        FTransform local_200;
        local_200.SetLocation((local_72.GetLocation() + (local_106 * local_96)));
        local_200.SetRotation(((local_128 * local_136) * local_24.GetRotation()));
        local_74.Solve(FTransform());
        local_200.SetLocation(this.BoneRHand.GetTransform().GetLocation());
        FTransform local_168_2 = FTransform(this.BoneRUpperArm.GetTransform());
        local_168_2.SetRotation((local_136 * local_168_2.GetRotation()));
        this.BoneRUpperArm.SetTransform(local_168_2);
        local_200.SetRotation(this.BoneRHand.GetTransform().GetRotation());
        local_76.Solve(local_200);
        return;
    }
    void TweakHead(const FVector &inout AimTargetCS)
    {
        FTransform local_24 = FTransform(this.BoneHead.GetTransform());
        FVector local_54 = (AimTargetCS - local_24.GetLocation()).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        local_24.SetRotation((FQuat::FindBetweenNormals(local_24.TransformVector(this.HeadForwardAxis), local_54) * local_24.GetRotation()));
        this.BoneHead.SetTransform(local_24);
        return;
    }
    float GetAngleBetweenLineAndPlaneRad(const FVector &inout LineTangent, const FVector &inout PlaneNormal)
    {
        return FMath::Asin(((FMath::Abs(LineTangent.DotProduct(PlaneNormal)) / LineTangent.Size()) / PlaneNormal.Size()));
    }
    FQuat ApplySpineBendAngleConstraint(const FQuat &inout RawSpineRotation, const float32 MaxBendAngle)
    {
        FRotator local_12 = RawSpineRotation.Rotator();
        float32 local_14 = FMath::Abs(MaxBendAngle);
        float32 local_13 = -local_14;
        local_12.Roll = FMath::Clamp(local_12.Roll, local_13, local_14);
        return FQuat(local_12);
    }
}

UCLASS(Abstract)
class USPT_UpperBodyFaceAtBase : USkeletalPoseTweaker
{
    UPROPERTY()
    FPT_BoneRef BoneHead;
    UPROPERTY()
    EAxis HeadForwardAxis = EAxis(0);
    UPROPERTY()
    FPT_BoneRef LowerSpine;
    UPROPERTY()
    FPT_BoneRef UpperSpine;
    UPROPERTY()
    FPT_BoneRef UpperArmR;
    UPROPERTY()
    FPT_BoneRef UpperArmL;
    UPROPERTY()
    FPT_BoneRef BoneNeck;
    UPROPERTY()
    FTransform LookAtTarget;
    UPROPERTY()
    float SpineRotDeadZoneRad = 0.5235988057732222;
    UPROPERTY()
    float MaxSpineRotRad = 1.5707963705062866;
    UPROPERTY()
    bool bWantDebugDraw = false;


    UFUNCTION()
    void OnInitialization_Implementation()
    {
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        if (!(this.HasValidSetup()))
        {
            return;
        }
        this.AdjustUpperBody();
        this.AdjustHead();
        return;
    }
    bool HasValidSetup() const
    {
        return this.BoneHead.HasValidSetup() && this.LowerSpine.HasValidSetup() && this.UpperSpine.HasValidSetup() && this.UpperArmL.HasValidSetup() && this.UpperArmR.HasValidSetup() && this.BoneNeck.HasValidSetup();
    }
    FVector GetBodyForward2D()
    {
        FVector local_74 = (this.BoneNeck.GetTransform().GetLocation() - this.UpperArmR.GetTransform().GetLocation());
        FVector local_6 = local_74.CrossProduct((this.UpperArmL.GetTransform().GetLocation() - this.BoneNeck.GetTransform().GetLocation()));
        return local_6.GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector);
    }
    FVector GetAxisVector(const FTransform &inout TM, const EAxis Axis)
    {
        switch (int(Axis))
        {
        case 1:
        {
            return TM.GetRotation().GetAxisX();
        }
        case 2:
        {
            return TM.GetRotation().GetAxisY();
        }
        case 3:
        {
            return TM.GetRotation().GetAxisZ();
        }
        }
        return TM.GetRotation().GetAxisY();
    }
    void DebugDrawForwardAndDeadZone(const FVector &inout NeckLocation, const FVector &inout NeckToTargetDir2D, const FVector &inout BodyForward2D)
    {
        if (!(this.bWantDebugDraw))
        {
            return;
        }
        FQuat local_20 = FQuat(FVector::UpVector, this.SpineRotDeadZoneRad);
        FVector local_40 = local_20.RotateVector(BodyForward2D).GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector);
        FVector local_34 = local_20.Inverse().RotateVector(BodyForward2D).GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector);
        this.DrawAnimDebugLine(NeckLocation, (NeckLocation + (NeckToTargetDir2D * 100.0)), FColor::Green, EPTDebugDrawSpace(0), 0.0f, true);
        FVector local_28_2 = (local_40 * 100.0);
        this.DrawAnimDebugLine(NeckLocation, (NeckLocation + local_28_2), FColor::Red, EPTDebugDrawSpace(0), 0.0f, true);
        FVector local_28_3 = (local_34 * 100.0);
        this.DrawAnimDebugLine(NeckLocation, (NeckLocation + local_28_3), FColor::Red, EPTDebugDrawSpace(0), 0.0f, true);
        return;
    }
    void AdjustUpperBody()
    {
        FTransform local_24 = FTransform(this.BoneNeck.GetTransform());
        FVector local_72 = (this.LookAtTarget.GetLocation() - local_24.GetLocation());
        if (FMath::IsNearlyZero(local_72.Size2D(), 9.99999993922529e-9))
        {
            return;
        }
        FVector local_60 = local_72.GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector);
        FVector local_66 = this.GetBodyForward2D();
        this.DebugDrawForwardAndDeadZone(local_24.GetLocation(), local_60, local_66);
        FQuat local_108 = FQuat::FindBetweenNormals(local_66, local_60);
        float local_76 = FMath::Abs(local_108.GetAngle());
        if (local_76 < this.SpineRotDeadZoneRad)
        {
            return;
        }
        int local_113 = local_108.GetAngle() >= 0.0 ? 1 : -1;
        float local_112 = local_113;
        FQuat local_100 = FQuat(local_108.GetRotationAxis(), local_112 * (FMath::Clamp(local_76, this.SpineRotDeadZoneRad, this.MaxSpineRotRad) - this.SpineRotDeadZoneRad));
        FQuat local_132 = FQuat::Slerp(FQuat::Identity, local_100, 0.5);
        FQuat local_140 = FQuat::Slerp(FQuat::Identity, local_100, 0.5);
        FTransform local_172 = FTransform(this.LowerSpine.GetTransform());
        local_172.SetRotation((local_132 * local_172.GetRotation()));
        this.LowerSpine.SetTransform(local_172);
        FTransform local_204 = FTransform(this.UpperSpine.GetTransform());
        local_204.SetRotation((local_140 * local_204.GetRotation()));
        this.UpperSpine.SetTransform(local_204);
        return;
    }
    void AdjustHead()
    {
        FTransform local_24 = FTransform(this.BoneHead.GetTransform());
        FVector local_72 = (this.LookAtTarget.GetLocation() - local_24.GetLocation());
        if (local_72.Size2D() < 10.0)
        {
            return;
        }
        local_24.SetRotation((FQuat::FindBetweenNormals(this.GetAxisVector(local_24, this.HeadForwardAxis).GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector), local_72.GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector)) * local_24.GetRotation()));
        this.BoneHead.SetTransform(local_24);
        local_24.SetRotation((FQuat::FindBetweenNormals(this.GetAxisVector(local_24, this.HeadForwardAxis), (this.LookAtTarget.GetLocation() - local_24.GetLocation()).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector)) * local_24.GetRotation()));
        this.BoneHead.SetTransform(local_24);
        return;
    }
}

class USPT_UpperBodyFaceAt_StdF_Common : USPT_UpperBodyFaceAtBase
{
    USPT_UpperBodyFaceAt_StdF_Common()
    {
        super();
        this.BoneHead.SetBoneName(n"Bn_M_head");
        this.HeadForwardAxis = EAxis(2);
        this.LowerSpine.SetBoneName(n"Bn_M_spine_03");
        this.UpperSpine.SetBoneName(n"Bn_M_spine_04");
        this.UpperArmL.SetBoneName(n"Bn_L_upperarm");
        this.UpperArmR.SetBoneName(n"Bn_R_upperarm");
        this.BoneNeck.SetBoneName(n"Bn_M_neck_01");
        return;
    }
}


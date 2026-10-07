

class USPT_ArcheryAim_StdF_Common : USPT_ArcheryAim
{
    UPROPERTY()
    FPT_BoneRef BoneSpine05;

    USPT_ArcheryAim_StdF_Common()
    {
        super();
        this.HeadForwardAxis = FVector(0.0, 1.0, 0.0);
        this.BoneHead.SetBoneName(n"Bn_M_head");
        this.BoneLHand.SetBoneName(n"Bn_L_hand");
        this.BoneLUpperArm.SetBoneName(n"Bn_L_upperarm");
        this.BoneRHand.SetBoneName(n"Bn_R_hand");
        this.BoneRUpperArm.SetBoneName(n"Bn_R_upperarm");
        this.BoneSpine05.SetBoneName(n"Bn_M_spine_05");
        this.LArmSolver.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("Bn_L_upperarm|Bn_L_lowerarm|Bn_L_hand");
        this.RArmSolver.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("Bn_R_upperarm|Bn_R_lowerarm|Bn_R_hand");
        this.SpineSolver.SetBoneList("Bn_M_spine_01|Bn_M_spine_02|Bn_M_spine_03");
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
        FTransform local_24 = FTransform(this.BoneSpine05.GetTransform());
        FVector local_66 = this.InvAnimComponentTransform.TransformPosition(this.AimTarget.GetLocation());
        FVector local_54 = (local_66 - local_24.GetLocation());
        if (FMath::IsNearlyZero(local_54.Size(), 9.99999993922529e-9))
        {
            return;
        }
        FVector local_60 = local_24.GetRotation().GetAxisZ().opNeg().GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        FVector local_84 = local_54.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        float local_76 = Super::GetAngleBetweenLineAndPlaneRad(local_84, FVector(0.0, 0.0, 1.0));
        FQuat local_124 = Super::ApplySpineBendAngleConstraint(FQuat::FindBetween(local_60, local_84), this.MaxSpineBendAngleDeg);
        this.SpineSolver.SolveR(local_124, this.SpineRotationWeightCurve);
        Super::TweakArms(local_66, local_76);
        Super::TweakHead(local_66);
        return;
    }
}


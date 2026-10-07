

struct FFootIKInfo
{
    UPROPERTY()
    USkeletalPoseTweaker Owner;
    UPROPERTY()
    FTransform TargetOffset;
    UPROPERTY()
    FTransform InterpOffsetForThisFrame;
    UPROPERTY()
    FTransform FKFootBoneCS;
    UPROPERTY()
    FTransform IKFootBoneCS;
    UPROPERTY()
    float StrideAlpha = 0.0;


    void UpdateFootIKGoal(const int PinBoneIndex, const int FootBoneIndex, const FTransform &inout RootTM, const FTransform &inout RootAttrTM, const FVector &inout LastPin, const FVector &inout NextPin, const bool DrawDebug = false)
    {
        FTransform local_48 = this.Owner.GetBoneTransformCS(PinBoneIndex);
        this.FKFootBoneCS = this.Owner.GetBoneTransformCS(FootBoneIndex);
        FVector local_66 = RootTM.TransformPosition(RootAttrTM.InverseTransformPosition(LastPin));
        FVector local_54 = RootTM.TransformPosition(RootAttrTM.InverseTransformPosition(NextPin));
        float local_74 = 1.0;
        if ((local_54 - local_66).Size() > 1.0)
        {
            float local_78 = (local_48.GetLocation() - local_66).Size();
            local_74 = local_78 / (((local_48.GetLocation() - local_54).Size()) + local_78);
        }
        this.StrideAlpha = local_74;
        FVector local_90;
        FVector local_96;
        FVector local_72 = FVector(0.0, 0.0, 200.0);
        FVector local_110;
        FVector local_116;
        FQuat local_124;
        FQuat local_132;
        FVector local_138 = local_66;
        FVector local_144 = local_54;
        local_90 = (local_66 + local_72);
        local_96 = (local_66 - local_72);
        this.Owner.LineTraceScene(local_90, local_96, local_110, local_116, false);
        local_138 = (local_110 + (local_116 * local_66.Z));
        local_124 = FQuat::FindBetween(FVector(0.0, 0.0, 1.0), local_116);
        local_90 = (local_54 + local_72);
        local_96 = (local_54 - local_72);
        this.Owner.LineTraceScene(local_90, local_96, local_110, local_116, DrawDebug);
        FVector local_102_2 = (local_116 * local_54.Z);
        local_144 = (local_110 + local_102_2);
        local_132 = FQuat::FindBetween(FVector(0.0, 0.0, 1.0), local_116);
        if (DrawDebug)
        {
            this.Owner.DrawAnimDebugPointEx(local_66, FColor::Blue, 10.0f);
            this.Owner.DrawAnimDebugPointEx(local_138, FColor::Blue, 5.0f);
            this.Owner.DrawAnimDebugPointEx(local_54, FColor::Green, 10.0f);
            this.Owner.DrawAnimDebugPointEx(local_144, FColor::Green, 5.0f);
            this.Owner.DrawAnimDebugLine(local_66, local_54, FColor::Purple, EPTDebugDrawSpace(0), 0.0f, true);
            this.Owner.DrawAnimDebugLine(local_138, local_144, FColor::Purple, EPTDebugDrawSpace(0), 0.0f, true);
        }
        FQuat local_156 = FQuat::Slerp(local_124, local_132, local_74);
        FVector local_180 = FMath::Lerp((local_138 - local_66), (local_144 - local_54), local_74);
        FTransform local_204;
        local_204.SetLocation((local_48.GetLocation() + local_180));
        local_204.SetRotation((local_156 * local_48.GetRotation()));
        this.IKFootBoneCS = (this.FKFootBoneCS.GetRelativeTransform(local_48) * local_204);
        this.TargetOffset.SetLocation((this.IKFootBoneCS.GetLocation() - this.FKFootBoneCS.GetLocation()));
        this.TargetOffset.SetRotation(FQuat::Identity);
        ::InterpTo(this.InterpOffsetForThisFrame, this.TargetOffset, int(this.Owner.CurrentDeltaSeconds), 1);
        return;
    }
}

struct FLegPairIKInfo
{
    UPROPERTY()
    USkeletalPoseTweaker Owner;
    UPROPERTY()
    FTransform BodyOffset;
    UPROPERTY()
    FTransform InterpOffsetForThisFrame;

    FLegPairIKInfo()
    {
        return;
    }
    void UpdateLegRootIKGoal(const FFootIKInfo &inout Left, const FFootIKInfo &inout Right)
    {
        this.BodyOffset.SetLocation(((FVector(Left.TargetOffset.GetLocation()) + FVector(Right.TargetOffset.GetLocation())) * 0.5));
        this.BodyOffset.SetRotation(FQuat::Identity);
        ::InterpTo(this.InterpOffsetForThisFrame, this.BodyOffset, int(this.Owner.CurrentDeltaSeconds), 1);
        return;
    }
}

class USPT_QuadrupedIK : USkeletalPoseTweaker
{
    UPROPERTY()
    int backToesEnd_L;
    UPROPERTY()
    int backToesEnd_R;
    UPROPERTY()
    int frontToesEnd_L;
    UPROPERTY()
    int frontToesEnd_R;
    UPROPERTY()
    int backAnkle_L;
    UPROPERTY()
    int backAnkle_R;
    UPROPERTY()
    int frontAnkle_L;
    UPROPERTY()
    int frontAnkle_R;
    UPROPERTY()
    int Chest_M;
    UPROPERTY()
    int Pelvis_M;
    UPROPERTY()
    int Root;
    UPROPERTY()
    FPT_TwoBoneIK LFrontLeg;
    UPROPERTY()
    FPT_TwoBoneIK RFrontLeg;
    UPROPERTY()
    FPT_TwoBoneIK LBackLeg;
    UPROPERTY()
    FPT_TwoBoneIK RBackLeg;
    UPROPERTY()
    FPT_SpineIK SpineSolver;
    UPROPERTY()
    FTransform AttrRootTM;
    UPROPERTY()
    FVector ToeLF_NextPin;
    UPROPERTY()
    FVector ToeLF_LastPin;
    UPROPERTY()
    FVector ToeRF_NextPin;
    UPROPERTY()
    FVector ToeRF_LastPin;
    UPROPERTY()
    FVector ToeLB_NextPin;
    UPROPERTY()
    FVector ToeLB_LastPin;
    UPROPERTY()
    FVector ToeRB_NextPin;
    UPROPERTY()
    FVector ToeRB_LastPin;
    FFootIKInfo LFLegInfo;
    FFootIKInfo RFLegInfo;
    FFootIKInfo LBLegInfo;
    FFootIKInfo RBLegInfo;
    FLegPairIKInfo FrontLegPair;
    FLegPairIKInfo BackLegPair;

    USPT_QuadrupedIK()
    {
        return;
    }
    UFUNCTION()
    void OnInitialization_Implementation()
    {
        this.FrontLegPair.Owner = this;
        this.LFLegInfo.Owner = this;
        this.RFLegInfo.Owner = this;
        this.BackLegPair.Owner = this;
        this.LBLegInfo.Owner = this;
        this.RBLegInfo.Owner = this;
        this.LBackLeg.PoleOffset = FVector(0.0, -30.0, 0.0);
        this.RBackLeg.PoleOffset = FVector(0.0, 30.0, 0.0);
        this.LFrontLeg.PoleOffset = FVector(0.0, 30.0, 0.0);
        this.RFrontLeg.PoleOffset = FVector(0.0, -30.0, 0.0);
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        this.FootPlanting();
        return;
    }
    void FootPlanting()
    {
        FTransform local_52 = this.GetBoneTransformCS(this.Root);
        this.LFLegInfo.UpdateFootIKGoal(this.frontToesEnd_L, this.frontAnkle_L, local_52, this.AttrRootTM, this.ToeLF_LastPin, this.ToeLF_NextPin, false);
        this.RFLegInfo.UpdateFootIKGoal(this.frontToesEnd_R, this.frontAnkle_R, local_52, this.AttrRootTM, this.ToeRF_LastPin, this.ToeRF_NextPin, false);
        this.LBLegInfo.UpdateFootIKGoal(this.backToesEnd_L, this.backAnkle_L, local_52, this.AttrRootTM, this.ToeLB_LastPin, this.ToeLB_NextPin, false);
        this.RBLegInfo.UpdateFootIKGoal(this.backToesEnd_R, this.backAnkle_R, local_52, this.AttrRootTM, this.ToeRB_LastPin, this.ToeRB_NextPin, false);
        this.FrontLegPair.UpdateLegRootIKGoal(this.LFLegInfo, this.RFLegInfo);
        this.BackLegPair.UpdateLegRootIKGoal(this.LBLegInfo, this.RBLegInfo);
        this.PerformSpineIK(this.FrontLegPair, this.BackLegPair, this.Chest_M, this.Pelvis_M, this.SpineSolver);
        this.PerformLegIKCS(this.LFLegInfo, this.LFrontLeg, false);
        this.PerformLegIKCS(this.RFLegInfo, this.RFrontLeg, false);
        this.PerformLegIKCS(this.LBLegInfo, this.LBackLeg, false);
        this.PerformLegIKCS(this.RBLegInfo, this.RBackLeg, false);
        return;
    }
    void PerformSpineIK(const FLegPairIKInfo &inout Front, const FLegPairIKInfo &inout Back, const int SpineStartBone, const int SpineEndBone, FPT_SpineIK &inout SpineIKSolver)
    {
        FVector local_56 = (FVector(this.GetBoneTransformCS(SpineStartBone).GetLocation()) + Front.InterpOffsetForThisFrame.GetLocation());
        SpineIKSolver.Solve2P(local_56, (FVector(this.GetBoneTransformCS(SpineEndBone).GetLocation()) + Back.InterpOffsetForThisFrame.GetLocation()));
        return;
    }
    void PerformLegIKCS(const FFootIKInfo &inout FootIKInfo, FPT_TwoBoneIK &inout Solver, const bool DrawDebug = false)
    {
        Solver.Solve(FootIKInfo.IKFootBoneCS);
        if (DrawDebug)
        {
            this.DrawAnimDebugPoint(FootIKInfo.IKFootBoneCS.GetLocation());
        }
        return;
    }
}

void InterpTo(FTransform &inout Current, const FTransform &inout Target, const float32 DeltaTime, const int NumFrames)
{
    float32 local_1_2 = (1.0f / NumFrames) / FMath::Max(0.01f, DeltaTime);
    Current.SetLocation(FMath::VInterpTo(Current.GetLocation(), Target.GetLocation(), DeltaTime, local_1_2));
    Current.SetRotation(FMath::QInterpTo(Current.GetRotation(), Target.GetRotation(), DeltaTime, local_1_2));
    return;
}

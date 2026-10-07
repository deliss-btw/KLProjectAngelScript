

class USPT_BasicBipedFootIK : USkeletalPoseTweaker
{
    UPROPERTY()
    int Bone_L_Thigh_A_01;
    UPROPERTY()
    int Bone_L_Calf_A_01;
    UPROPERTY()
    int Bone_L_Foot_A_01;
    UPROPERTY()
    int Bone_L_Toe0_A_01;
    UPROPERTY()
    int Bone_R_Thigh_A_01;
    UPROPERTY()
    int Bone_R_Calf_A_01;
    UPROPERTY()
    int Bone_R_Foot_A_01;
    UPROPERTY()
    int Bone_R_Toe0_A_01;
    UPROPERTY()
    int Bone_M_Body_Root_01;
    UPROPERTY()
    FPT_TwoBoneIK LeftLegSolver;
    UPROPERTY()
    FPT_TwoBoneIK RightLegSolver;
    FVector LFootToBottomBS = FVector(12.757698, -3.01745, 0.0);
    FVector RFootToBottomBS = FVector(12.757698, -3.01745, 0.0);
    FTransform LOffsetWSLastFrame = FTransform::Identity;
    FTransform ROffsetWSLastFrame = FTransform::Identity;
    FVector BodyOffsetLastFrame = FVector(0.0, 0.0, 0.0);

    USPT_BasicBipedFootIK()
    {
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
        this.EvaluatePoseCS();
        return;
    }
    void InterpTo(FTransform &inout Current, const FTransform &inout Target, const float32 DeltaTime, const float32 InterpSpeed)
    {
        Current.SetLocation(FMath::VInterpTo(Current.GetLocation(), Target.GetLocation(), DeltaTime, InterpSpeed));
        Current.SetRotation(FMath::QInterpTo(Current.GetRotation(), Target.GetRotation(), DeltaTime, InterpSpeed));
        return;
    }
    void EvaluatePoseCS()
    {
        FVector local_6 = this.AnimComponentTransform.TransformVector(FVector(0.0, 0.0, 1.0));
        FTransform local_48;
        FTransform local_72;
        FTransform local_124 = this.GetBoneTransformCS(this.Bone_L_Foot_A_01);
        FTransform local_96 = this.GetBoneTransformCS(this.Bone_R_Foot_A_01);
        bool local_150 = this.GetFootOffsetCS(local_124, local_124.TransformPosition(this.LFootToBottomBS), local_6, local_48);
        bool local_149 = this.GetFootOffsetCS(local_96, local_96.TransformPosition(this.RFootToBottomBS), local_6, local_72);
        bool local_150_2 = true;
        bool local_149_2 = true;
        if (local_150_2 || local_149_2)
        {
            FTransform local_148 = this.GetBoneTransformCS(this.Bone_L_Foot_A_01);
            FTransform local_176 = this.GetBoneTransformCS(this.Bone_R_Foot_A_01);
            int local_201 = 1077936128;
            float32 local_202 = 0.33333334f / FMath::Max(0.01f, this.CurrentDeltaSeconds);
            FVector local_24 = local_72.GetLocation();
            if (local_48.GetLocation().DotProduct(local_6) < local_24.DotProduct(local_6))
            {
            }
            else
            {
            }
            GetLocation();
            this.BodyOffsetLastFrame = FMath::VInterpTo(this.BodyOffsetLastFrame, local_24, this.CurrentDeltaSeconds, local_202);
            FTransform local_200 = this.GetBoneTransformCS(this.Bone_M_Body_Root_01);
            local_200.SetLocation((local_200.GetLocation() + this.BodyOffsetLastFrame));
            this.SetBoneTransformCS(this.Bone_M_Body_Root_01, local_200);
            if (local_150_2)
            {
                this.InterpTo(this.LOffsetWSLastFrame, local_48, int(this.CurrentDeltaSeconds), local_202);
                this.PerformLegIKCS(local_148, this.LOffsetWSLastFrame, this.LeftLegSolver);
            }
            if (local_149_2)
            {
                this.InterpTo(this.ROffsetWSLastFrame, local_72, int(this.CurrentDeltaSeconds), local_202);
                this.PerformLegIKCS(local_176, this.ROffsetWSLastFrame, this.RightLegSolver);
            }
        }
        return;
    }
    bool GetFootOffsetCS(const FTransform &inout FootCS, const FVector &inout FootBottomPosCS, const FVector &inout UpCS, FTransform &inout OffsetCS)
    {
        OffsetCS = FTransform::Identity;
        FVector local_6(FootCS.GetLocation());
        FVector local_12 = (local_6 - FootBottomPosCS);
        if (FootBottomPosCS.Z > 2.0)
        {
            return false;
        }
        FVector local_30;
        FVector local_36;
        FVector local_44 = (FootBottomPosCS - FVector(0.0, 0.0, 100.0));
        FVector local_50 = (FootBottomPosCS + FVector(0.0, 0.0, 100.0));
        if (!(this.LineTraceScene(local_50, local_44, local_30, local_36, true)))
        {
            return false;
        }
        FQuat local_68 = FQuat::FindBetweenNormals(UpCS, local_36);
        FVector local_44_2 = (local_30 + local_68.RotateVector(local_12));
        OffsetCS.SetLocation((local_44_2 - local_6));
        OffsetCS.SetRotation(local_68);
        return true;
    }
    void PerformLegIKCS(const FTransform &inout OriginalFootCS, const FTransform &inout Offset, FPT_TwoBoneIK &inout Solver)
    {
        FTransform local_24;
        local_24.SetLocation((OriginalFootCS.GetLocation() + Offset.GetLocation()));
        local_24.SetRotation((Offset.GetRotation() * OriginalFootCS.GetRotation()));
        Solver.Solve(local_24);
        this.DrawAnimDebugPoint(local_24.GetLocation());
        return;
    }
}


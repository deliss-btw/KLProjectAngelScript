
enum ELandingState
{
    None,
    Landed,
    InTheAir,
}


struct FTrajectoryDiscreteSample
{
    UPROPERTY()
    FVector Loc;
    UPROPERTY()
    FVector AxisX;
    UPROPERTY()
    FVector AxisY;
    UPROPERTY()
    float Curvature;

    FTrajectoryDiscreteSample()
    {
        this.Curvature = 0.0;
        return;
    }
    FTrajectoryDiscreteSample(const float LocX, const float LocY, const float LocZ)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FTrajectoryDiscreteSample(const FVector &inout _Loc)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FTrajectoryDiscreteSample(const FVector &inout _Loc, const FVector &inout _AxisX, const FVector &inout _AxisY)
    {
        this.Curvature = 0.0;
        this.AxisX = _AxisX;
        this.AxisY = _AxisY;
        return;
    }
}

struct FSimpleCircleTrajectory
{
    UPROPERTY()
    FVector Center;
    UPROPERTY()
    float Radius;
    UPROPERTY()
    TArray<FTrajectoryDiscreteSample> mGeneratedFuturePoints;
    UPROPERTY()
    TArray<FTrajectoryDiscreteSample> mGeneratedHistoryPoints;

    FSimpleCircleTrajectory()
    {
        this.Radius = 0.0;
        return;
    }
    FSimpleCircleTrajectory(const FVector &inout C, const float R)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    void Update(const FVector &inout C, const float R)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    void DebugDraw(const USkeletalPoseTweaker PT, const FTransform &inout RootXform, const float HalfArcLen, const bool bDrawFrontHalf, const FColor &inout Color, const bool bEnable)
    {
        if (!(bEnable))
        {
            return;
        }
        FVector local_8(RootXform.GetLocation());
        FVector local_20(RootXform.GetRotation().GetAxisX());
        float local_32 = HalfArcLen / this.Radius;
        FVector local_38(FVector::UpVector);
        int local_39 = 10;
        FVector local_14 = (local_8 - this);
        FQuat local_28 = FQuat(FVector::UpVector, local_32 / 10.0);
        FVector local_62 = local_14;
        FVector local_68 = local_8;
        FVector local_80(this);
        FVector local_86 = (local_80 + local_28.RotateVector(local_62));
        FVector local_80_2 = (local_86 - local_68);
        bool local_1 = !(FMath::IsNearlyZero(local_80_2.DotProduct(local_20), 9.99999993922529e-9));
        if (((bDrawFrontHalf && ((((local_86 - local_68)).DotProduct(local_20) < 0.0)))) || (!(bDrawFrontHalf) && ((local_86 - local_68).DotProduct(local_20) > 0.0)))
        {
            float local_30 = -local_32 / 10.0;
            local_28 = FQuat(FVector::UpVector, local_30);
        }
        int local_91 = 0;
        for (; local_91 < 10; )
        {
            local_62 = local_28.RotateVector(local_62);
            FVector local_80_3 = (FVector(this) + local_62);
            PT.DrawAnimDebugLine(local_68, local_80_3, Color, EPTDebugDrawSpace(0), 0.0f, true);
            local_68 = local_80_3;
            ++local_91;
        }
        return;
    }
    FVector ProjectToTrajectory(const FVector &inout Pt)
    {
        return (((Pt - this).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector) * this.Radius) + this);
    }
    FVector ProjectToTrajectory_Complex(const FTransform &inout RootTM, const FVector &inout Pt, const TArray<FTrajectoryDiscreteSample> &inout RearTraj, const TArray<FTrajectoryDiscreteSample> &inout FrontTraj, const USkeletalPoseTweaker PoseTweaker)
    {
        FVector local_12 = RootTM.InverseTransformPosition(Pt);
        if (local_12.X == 0.0)
        {
            return Pt;
        }
        else
        {
            if (local_12.X > 0.0)
            {
                return this.ProjectToTrajectory_Complex_Worker(Pt, local_12, FrontTraj, "FrontTraj", PoseTweaker);
            }
            else
            {
                return this.ProjectToTrajectory_Complex_Worker(Pt, local_12, RearTraj, "RearTraj", PoseTweaker);
            }
        }
    }
    FVector ProjectToTrajectory_Complex_Worker(const FVector &inout Pt, const FVector &inout Pt_RootSpace, const TArray<FTrajectoryDiscreteSample> &inout Traj, const FString &inout TrajDebugName, const USkeletalPoseTweaker PoseTweaker)
    {
        float local_34;
        if (Traj.Num() < 2)
        {
            return Pt;
        }
        float local_10_2 = FMath::Abs((Pt_RootSpace.X - Traj[0].Loc.X));
        float local_12 = 0.0;
        int local_13 = 1;
        for (; local_13 < Traj.Num(); ++local_13)
        {
            int local_1 = local_13 - 1;
            float local_6 = local_12 + (FVector(Traj[local_13].Loc) - Traj[local_1].Loc).Size();
            if (local_6 < local_10_2)
            {
                local_12 = local_6;
                continue;
            }
            float local_16 = local_6 - local_12;
            if (local_16 > 9.99999993922529e-9)
            {
                local_34 = (local_10_2 - local_12) / local_16;
            }
            else
            {
                local_34 = 0.0;
            }
            FVector local_28 = FMath::Lerp(Traj[(local_13 - 1)].Loc, Traj[local_13].Loc, local_34);
            FQuat local_56 = FQuat::FindBetween(Traj[(local_13 - 1)].AxisY, Traj[local_13].AxisY);
            local_1 = local_13 - 1;
            FVector local_62 = (local_28 + (FQuat::Slerp(FQuat::Identity, local_56, local_34).RotateVector(Traj[local_1].AxisY) * Pt_RootSpace.Y));
            local_62.Z = Pt.Z;
            return local_62;
        }
        FName local_72 = PoseTweaker.GetFName();
        FString local_76 = FString().Append("[").Append(local_72).Append("] ").Append(TrajDebugName).Append(" trajectory is not long enough, expected is ").Append(local_10_2).Append(", but actual is ").Append(local_12);
        PoseTweaker.LogMessageToDisplay(local_76);
        return Pt;
    }
    const TArray<FTrajectoryDiscreteSample>& GetDiscretizedPositions_Circle(const FTransform &inout RootTM, const bool bForward, const float Length, const int SampleCnt)
    {
        int local_2 = 0;
        float local_22;
        if (bForward)
        {
        }
        else
        {
        }
        local_2.Empty(local_2.Num());
        FVector local_10(RootTM.GetLocation());
        if (bForward)
        {
            float local_20;
            local_20 = 1.0;
        }
        else
        {
            float local_20;
            local_20 = -1.0;
        }
        bool local_51 = (RootTM.GetRotation().GetAxisY().DotProduct((FVector(this) - RootTM.GetLocation())) >= 0.0);
        if (local_51)
        {
            float local_20;
            local_22 = local_20;
        }
        else
        {
            float local_20;
            local_22 = -local_20;
        }
        float local_18_2 = (Length / this.Radius) / SampleCnt;
        int local_59 = 0;
        for (; local_59 <= SampleCnt; )
        {
            FQuat local_68 = FQuat(FVector::UpVector, (local_18_2 * local_22) * local_59);
            FTrajectoryDiscreteSample local_88;
            local_88.Loc = (FVector(this) + (local_68.RotateVector((local_10 - this))));
            local_88.AxisX = local_68.RotateVector(RootTM.GetRotation().GetAxisX());
            local_88.AxisY = local_68.RotateVector(RootTM.GetRotation().GetAxisY());
            int local_60 = local_51 ? 1 : -1;
            local_88.Curvature = (local_60 / this.Radius);
            local_2.Add(local_88);
            ++local_59;
        }
        return local_51;
    }
    float SampleCurvature(const FTransform &inout RootTM, const FVector &inout Pt, const TArray<FTrajectoryDiscreteSample> &inout RearTraj, const TArray<FTrajectoryDiscreteSample> &inout FrontTraj, const float SampleLength = 0)
    {
        FVector local_12 = RootTM.InverseTransformPosition(Pt);
        if (local_12.X == 0.0)
        {
            return 0.0;
        }
        if (local_12.X > 0.0)
        {
            return this.SampleCurvature_Worker(local_12, FrontTraj, SampleLength);
        }
        return this.SampleCurvature_Worker(local_12, RearTraj, SampleLength);
    }
    float SampleCurvature_Worker(const FVector &inout Pt_RootSpace, const TArray<FTrajectoryDiscreteSample> &inout Traj, const float SampleLength)
    {
        float local_34;
        float local_44;
        float local_48;
        if (Traj.Num() < 2)
        {
            return 0.0;
        }
        float local_10_2 = FMath::Abs((Pt_RootSpace.X - Traj[0].Loc.X));
        if (SampleLength <= 9.99999993922529e-9)
        {
            float local_12 = 0.0;
            int local_13 = 1;
            for (; local_13 < Traj.Num(); ++local_13)
            {
                float local_6_2 = (FVector(Traj[local_13].Loc) - Traj[(local_13 - 1)].Loc).Size();
                float local_8 = local_12 + local_6_2;
                if (local_8 < local_10_2)
                {
                    local_12 = local_8;
                    continue;
                }
                local_6_2 = local_8 - local_12;
                if (local_6_2 > 9.99999993922529e-9)
                {
                    float local_16 = local_10_2 - local_12;
                    local_34 = local_16 / local_6_2;
                }
                else
                {
                    local_34 = 0.0;
                }
                float local_30 = Traj[local_13].Curvature;
                float local_32 = Traj[(local_13 - 1)].Curvature;
                return FMath::Lerp(local_32, local_30, local_34);
            }
            return 0.0;
        }
        float local_32_2 = local_10_2 + SampleLength;
        float local_12_2 = 0.0;
        float local_6_3 = 0.0;
        float local_8_2 = 0.0;
        int local_13_2 = 1;
        for (; local_13_2 < Traj.Num(); )
        {
            FVector local_28_2 = (FVector(Traj[local_13_2].Loc) - Traj[(local_13_2 - 1)].Loc);
            float local_16_2 = local_28_2.Size();
            local_34 = local_8_2 + local_16_2;
            float local_36 = FMath::Max(local_8_2, local_10_2);
            float local_38 = FMath::Min(local_34, local_32_2);
            if (local_36 < local_38)
            {
                float local_40 = local_38 - local_36;
                if (local_16_2 > 9.99999993922529e-9)
                {
                    float local_30_2 = (local_36 + local_38) * 0.5;
                    local_44 = local_30_2 - local_8_2;
                    local_48 = local_44 / local_16_2;
                }
                else
                {
                    local_48 = 0.0;
                }
                float local_30_3 = FMath::Lerp(Traj[(local_13_2 - 1)].Curvature, Traj[local_13_2].Curvature, local_48) * local_40;
                local_12_2 = local_12_2 + local_30_3;
                local_6_3 = local_6_3 + local_40;
            }
            if (local_34 >= local_32_2)
            {
                break;
            }
            local_8_2 = local_34;
            ++local_13_2;
        }
        if (local_6_3 > 9.99999993922529e-9)
        {
            local_44 = local_12_2 / local_6_3;
        }
        else
        {
            local_44 = 0.0;
        }
        return local_44;
    }
}

struct FTrajectoryFootIKLeg
{
    UPROPERTY()
    FPT_TwoBoneIK IKSolver;
    UPROPERTY()
    bool bFootPlanting = false;
    UPROPERTY()
    FName LandedCurveName;
    UPROPERTY()
    FName AlphaCurveName;
    UPROPERTY()
    bool bStrideWarp = false;
    UPROPERTY()
    bool bPendingSolve = false;
    UPROPERTY()
    FTransform RuntimeTarget;
    UPROPERTY()
    ELandingState LastLandingState = ELandingState(0);
    UPROPERTY()
    FTransform InitialDiff;
    UPROPERTY()
    FTransform LandingTM_RootSpace;


    void Reset(const FTransform &inout RootTM)
    {
        this.LastLandingState = ELandingState(0);
        this.RuntimeTarget = this.GetEffectorTM();
        this.InitialDiff = FTransform::Identity;
        this.LandingTM_RootSpace = this.GetEffectorTM().GetRelativeTransform(RootTM);
        return;
    }
}

struct FSpineLeanAnchor
{
    UPROPERTY()
    int ChainIndex = -1;
    UPROPERTY()
    int BoneIndex = -1;
    UPROPERTY()
    float FootOffsetLeft = 0.0;
    UPROPERTY()
    float FootOffsetRight = 0.0;


}

struct FHistoryTrajectoryHelper
{
    UPROPERTY()
    float mExpectedLength;
    UPROPERTY()
    float mExtrapolateStartLen;
    UPROPERTY()
    int mExtrapolateStartIndex;
    UPROPERTY()
    TArray<FTrajectoryDiscreteSample> mGeneratedTrajectory;

    FHistoryTrajectoryHelper(const float ExpectedLength, const float MinLengthToCoverPelvis)
    {
        this.mExpectedLength = ExpectedLength;
        this.mExtrapolateStartLen = (MinLengthToCoverPelvis * 1.2);
        this.mExtrapolateStartIndex = -1;
        return;
    }
    void UpdateMinLength(const float MinExpectedLength)
    {
        this.mExpectedLength = MinExpectedLength;
        return;
    }
    const TArray<FTrajectoryDiscreteSample>& Generate(const FTransform &inout RootTM, const TArray<FVector> &inout LogicHistoryPts, const int IterCnt, const USkeletalPoseTweaker PT)
    {
        FVector local_56;
        FVector local_100;
        int local_118 = 0;
        this.mExtrapolateStartIndex = -1;
        this.mGeneratedTrajectory.Empty(LogicHistoryPts.Num());
        for (auto& local_18 : LogicHistoryPts)
        {
            FTrajectoryDiscreteSample local_38;
            local_38.Loc = local_18;
            local_38.Loc.Z = 0.0;
            this.mGeneratedTrajectory.Add(local_38);
        }
        float local_42 = 0.0;
        int local_43 = 0;
        for (; local_43 < this.mGeneratedTrajectory.Num(); )
        {
            if (local_43 == 0)
            {
                local_56 = FVector::ZeroVector;
            }
            else
            {
                local_56 = this.mGeneratedTrajectory[(local_43 - 1)].Loc;
            }
            float local_40_2 = (FVector(this.mGeneratedTrajectory[local_43].Loc) - local_56).Size();
            local_42 = local_42 + local_40_2;
            ++local_43;
        }
        int local_44 = this.mGeneratedTrajectory.Num();
        bool local_15 = local_44 < 2 || ((local_42 < this.mExtrapolateStartLen));
        if (local_15)
        {
            this.mGeneratedTrajectory.Empty(0);
            float local_40_3 = -this.mExpectedLength;
            this.mGeneratedTrajectory.Add(FTrajectoryDiscreteSample(local_40_3, 0.0, 0.0));
            this.mExtrapolateStartIndex = 0;
        }
        else
        {
            if (local_42 < this.mExpectedLength)
            {
                local_56 = FVector(this.mGeneratedTrajectory[(local_44 - 2)].Loc);
                FVector local_50 = (FVector(this.mGeneratedTrajectory[(local_44 - 1)].Loc) - local_56);
                float local_40_4 = local_50.Size();
                FVector local_114;
                if (FMath::IsNearlyZero(local_40_4, 9.99999993922529e-9))
                {
                    local_114 = FVector(-1.0, 0.0, 0.0);
                }
                else
                {
                    float local_88 = 1.0 / local_40_4;
                    local_114 = (local_50 * local_88);
                }
                FVector local_62(this.mGeneratedTrajectory.Last(0).Loc);
                float local_86_2 = this.mExpectedLength - local_42;
                this.mGeneratedTrajectory.Add(FTrajectoryDiscreteSample((local_62 + (local_114 * local_86_2))));
                this.mExtrapolateStartIndex = (this.mGeneratedTrajectory.Num() - 1);
            }
            else
            {
                this.mExtrapolateStartIndex = this.mGeneratedTrajectory.Num();
            }
        }
        if (IterCnt > 0)
        {
            int local_43_3 = this.mGeneratedTrajectory.Num();
            if (local_43_3 > 2)
            {
                int local_119 = 0;
                for (; local_119 < IterCnt; ++local_119)
                {
                    int local_120 = 1;
                    for (; local_120 < (local_43_3 - 1); )
                    {
                        local_100 = ((FVector(local_118[(local_120 - 1)].Loc)) + local_118[(local_120 + 1)].Loc);
                        local_118[local_120].Loc = (local_100 * 0.5);
                        ++local_120;
                    }
                }
            }
        }
        int local_120_2 = 0;
        for (; local_120_2 < this.mGeneratedTrajectory.Num(); )
        {
            if (local_120_2 == 0)
            {
                local_100 = RootTM.GetLocation();
            }
            else
            {
                local_100 = this.mGeneratedTrajectory[(local_120_2 - 1)].Loc;
            }
            FTrajectoryDiscreteSample& local_124 = this.mGeneratedTrajectory[local_120_2];
            local_124.AxisX = (local_100 - local_124.Loc).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
            local_124.AxisY = FVector::UpVector.CrossProduct(local_124.AxisX).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
            ++local_120_2;
        }
        return local_15;
    }
    const TArray<FTrajectoryDiscreteSample>& GenerateFromMoves(const FTransform &inout RootTM, const TArray<FVector> &inout LogicHistoryMoves)
    {
        FVector local_6(RootTM.GetRotation().GetForwardVector());
        int local_24 = LogicHistoryMoves.Num();
        float local_26 = 0.0;
        if (local_24 > 0)
        {
            this.mGeneratedTrajectory.SetNum(local_24 + 1);
            this.mGeneratedTrajectory[0].Loc = RootTM.GetLocation();
            this.mGeneratedTrajectory[0].AxisX = RootTM.GetRotation().GetAxisX();
            this.mGeneratedTrajectory[0].AxisY = RootTM.GetRotation().GetAxisY();
            float local_28 = 0.0;
            this.mGeneratedTrajectory[0].Curvature = 0.0;
            int local_30 = 0;
            for (; local_30 < local_24; local_26 = local_26 + local_28, ++local_30)
            {
                FTrajectoryDiscreteSample& local_34 = this.mGeneratedTrajectory[local_30 + 1];
                local_34.Loc = (FVector(this.mGeneratedTrajectory[local_30].Loc) - LogicHistoryMoves[local_30]);
                local_34.AxisX = LogicHistoryMoves[local_30].GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
                local_34.AxisY = FVector::UpVector.CrossProduct(local_34.AxisX).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
                local_28 = LogicHistoryMoves[local_30].Size();
                if (local_30 == (local_24 - 1))
                {
                    local_34.Curvature = 0.0;
                    continue;
                }
                local_34.Curvature = (FMathUtils::EvalMengerCurvature(LogicHistoryMoves[local_30 + 1], LogicHistoryMoves[local_30]));
            }
            this.mExtrapolateStartIndex = this.mGeneratedTrajectory.Num();
        }
        FVector local_40;
        if (local_24 == 0)
        {
            local_40 = FVector::ZeroVector;
        }
        else
        {
            local_40 = LogicHistoryMoves.Last(0).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        }
        bool local_29 = local_26 < this.mExtrapolateStartLen && (local_40.DotProduct(local_6) <= 0.0);
        if (local_29)
        {
            this.mGeneratedTrajectory.Empty(0);
            this.mGeneratedTrajectory.Add(FTrajectoryDiscreteSample((RootTM.GetLocation() - (local_6 * this.mExpectedLength))));
            this.mExtrapolateStartIndex = 0;
        }
        else
        {
            if (local_26 < this.mExpectedLength)
            {
                FTrajectoryDiscreteSample local_100;
                FVector local_22_2 = FVector(this.mGeneratedTrajectory.Last(0).Loc);
                float local_52 = this.mExpectedLength - local_26;
                local_100.Loc = (local_22_2 - (local_40 * local_52));
                local_100.AxisX = local_40;
                local_100.AxisY = FVector::UpVector.CrossProduct(local_100.AxisX).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
                local_52 = 0.0;
                local_100.Curvature = 0.0;
                this.mGeneratedTrajectory.Add(local_100);
            }
        }
        return local_29;
    }
    void DebugDraw(const USkeletalPoseTweaker PT, const bool bEnable)
    {
        if (!(bEnable))
        {
            return;
        }
        int local_2 = 0;
        FColor local_19;
        for (; local_2 < this.mGeneratedTrajectory.Num(); )
        {
            FTrajectoryDiscreteSample& local_6 = this.mGeneratedTrajectory[local_2];
            FVector local_18;
            if (local_2 == 0)
            {
                local_18 = FVector::ZeroVector;
            }
            else
            {
                local_18 = this.mGeneratedTrajectory[(local_2 - 1)].Loc;
            }
            if (local_2 < this.mExtrapolateStartIndex)
            {
            }
            else
            {
            }
            int64 local_22 = 0;
            FVector local_12 = FVector(0.0, 0.0, 0.0);
            FVector local_30 = local_6.Loc;
            PT.DrawAnimDebugLine((local_18 + local_12), (local_30 + local_12), local_19, EPTDebugDrawSpace(0), 0.0f, true);
            FVector local_48 = local_6.Loc;
            FVector local_40 = local_6.AxisY;
            local_30 = (local_40 * 100.0);
            local_40 = (local_48 + local_30);
            local_30 = local_6.Loc;
            PT.DrawAnimDebugLine((local_30 + local_12), (local_40 + local_12), FColor::Black, EPTDebugDrawSpace(0), 0.0f, true);
            PT.DrawAnimDebugPointEx(local_6.Loc, local_19, 5.0f);
            ++local_2;
        }
        return;
    }
}

struct FBoneStatePrivate
{
    UPROPERTY()
    int BoneIndex;
    UPROPERTY()
    FTransform Transform;

    FBoneStatePrivate()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
}

struct FTrajectoryBlendConfig
{
    UPROPERTY()
    FName SpineEndBoneName;
    UPROPERTY()
    FName TailEndBoneName = n"pelvis";

    FTrajectoryBlendConfig()
    {
        return;
    }
}

class USPT_TrajectoryBlend_Template : USkeletalPoseTweaker
{
    UPROPERTY()
    FTrajectoryBlendConfig Config;
    UPROPERTY()
    FPT_BoneRef PelvisBone;
    FPT_BoneRef SpineEndBone;
    FPT_BoneRef TailEndBone;
    UPROPERTY()
    FPT_BoneRef HeadBone;
    UPROPERTY()
    float32 MinFutureTrajectoryRadius;
    UPROPERTY()
    float32 LeanStrength = 0.0f;
    UPROPERTY()
    float32 OuterLeanFalloff = 0.7f;
    UPROPERTY()
    float32 LeanSmoothDuration = 0.5f;
    UPROPERTY()
    float32 MaxLeanAngle = 30.0f;
    TArray<FSpineLeanAnchor> SpineLeanAnchors;
    TArray<FSpineLeanAnchor> TailLeanAnchors;
    UPROPERTY()
    TArray<FTrajectoryFootIKLeg> LegIKs;
    UPROPERTY()
    float SimpleTrajectoryRadius = 1500.0;
    UPROPERTY()
    int HistoryTrajectorySmoothIteration;
    UPROPERTY()
    FSampleTrajectoryData TrajectoryData;
    UPROPERTY()
    FC_AnimSampleTrajectoryDeltaMoveRecorder TrajectoryRecorder;
    UPROPERTY()
    float32 MoveDesiredYaw = 0.0f;
    UPROPERTY()
    float32 MoveDesiredYawSmoothAlpha = 0.05f;
    UPROPERTY()
    float32 MinHeadYaw = -90.0f;
    UPROPERTY()
    float32 MaxHeadYaw = 90.0f;
    float32 SmoothedMoveDesiredYaw = 0.0f;
    UPROPERTY()
    float32 SpineChainSmoothAlpha = 0.3f;
    UPROPERTY()
    bool bEnableDebugDraw = false;
    FName ProgressCurveName = n"Progress";
    FTransform LastAnimRootTM;
    FTransform RuntimeRootTM;
    float32 LastProgress = -1.0f;
    FSimpleCircleTrajectory FrontTrajectory;
    FSimpleCircleTrajectory RearTrajectory;
    TArray<FBoneStatePrivate> WholeSpineStates;
    TArray<FBoneStatePrivate> WholeTailStates;
    TArray<FBoneStatePrivate> WholeNeckStates;
    FHistoryTrajectoryHelper HistoryTrajectoryHelper;
    bool bNeedsReInitBoneChainState = false;
    float32 ElapsedSeconds = 0.0f;
    FVector TrajectoryCenterOffset = FVector(0.0, 0.0, 0.0);


    UFUNCTION()
    void OnInitialization_Implementation()
    {
        if (!(this.RootBoneRef.HasValidSetup()))
        {
            return;
        }
        if (!(this.PelvisBone.HasValidSetup()))
        {
            return;
        }
        this.RuntimeRootTM = FTransform::Identity;
        this.LastAnimRootTM = FTransform::Identity;
        this.LastProgress = 0.0f;
        int local_3 = 0;
        for (; local_3 < this.LegIKs.Num(); ++local_3)
        {
            FTrajectoryFootIKLeg& local_8 = this.LegIKs[local_3];
            if (local_8.IKSolver.IsValid() && local_8.IKSolver.IsReadyToSolve())
            {
                local_8.Reset(this.RuntimeRootTM);
            }
        }
        float local_14 = FMath::Abs(this.SimpleTrajectoryRadius);
        FVector local_30 = (this.RuntimeRootTM.GetLocation() + (this.RuntimeRootTM.GetRotation().GetAxisY() * this.SimpleTrajectoryRadius));
        float local_14_2 = FMath::Abs(this.SimpleTrajectoryRadius);
        FVector local_36_2 = this.RuntimeRootTM.GetLocation();
        FVector local_30_2 = (this.RuntimeRootTM.GetRotation().GetAxisY() * this.SimpleTrajectoryRadius);
        FVector local_42_2 = (local_36_2 + local_30_2);
        this.TrajectoryCenterOffset = FVector(0.0, 0.0, 0.0);
        this.ElapsedSeconds = 0.0f;
        this.bNeedsReInitBoneChainState = true;
        this.SpineEndBone.SetBoneName(this.Config.SpineEndBoneName);
        this.TailEndBone.SetBoneName(this.Config.TailEndBoneName);
        float local_60 = FMath::Abs(this.TailEndBone.GetRefPoseTransform().GetLocation().X);
        FHistoryTrajectoryHelper local_100 = FHistoryTrajectoryHelper(local_60, FMath::Abs(this.PelvisBone.GetRefPoseTransform().GetLocation().X));
        this.SmoothedMoveDesiredYaw = this.MoveDesiredYaw;
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        int local_82 = 0;
        FTransform local_108;
        if (!(this.RootBoneRef.HasValidSetup()))
        {
            return;
        }
        if (!(this.PelvisBone.HasValidSetup()))
        {
            return;
        }
        if (!(this.SpineEndBone.HasValidSetup()) && !(this.InitializeBoneRef(this.SpineEndBone)))
        {
            return;
        }
        if (!(this.TailEndBone.HasValidSetup()) && !(this.InitializeBoneRef(this.TailEndBone)))
        {
            return;
        }
        if (this.bNeedsReInitBoneChainState)
        {
            this.InitBoneChainState(this.PelvisBone, this.SpineEndBone, this.WholeSpineStates, true);
            this.InitBoneChainState(this.PelvisBone, this.TailEndBone, this.WholeTailStates, false);
            this.InitBoneChainState(this.SpineEndBone, this.HeadBone, this.WholeNeckStates, true);
            this.ComputeLeanAnchors();
            this.bNeedsReInitBoneChainState = false;
        }
        this.UpdateTrajectory(this.FrontTrajectory, this.RuntimeRootTM, this.TrajectoryData.GetFrontCurvature(), this.MinFutureTrajectoryRadius);
        this.UpdateTrajectory(this.RearTrajectory, this.RuntimeRootTM, this.TrajectoryData.GetRearCurvature(), this.MinFutureTrajectoryRadius);
        FTransform local_28 = FTransform(this.RootBoneRef.GetTransform());
        FTransform local_76 = FTransform(FTransform::Identity);
        if (this.IsInPreviewScene())
        {
            float32 local_77 = -1.0f;
            if (!(this.GetCurveValue(this.ProgressCurveName, local_77)))
            {
                return;
            }
            if (local_77 >= this.LastProgress)
            {
                local_76 = local_28.GetRelativeTransform(this.LastAnimRootTM);
            }
            else
            {
                float32 local_3 = this.LastProgress;
                float32 local_79 = local_77;
                local_3 = (1.0f - local_3) + local_79;
                local_108.Blend(FTransform::Identity, local_82, local_3 / local_79);
                local_76 = FTransform();
            }
            this.LastProgress = local_77;
            this.LastAnimRootTM = local_28;
        }
        else
        {
            FVector local_122 = (FVector(this.TrajectoryData.GetAnimRootMotionDelta()) * 0.5);
            local_76 = FTransform(local_122);
        }
        local_108 = this.RuntimeRootTM;
        FTransform local_148;
        FTransform local_52 = (local_76 * local_108);
        FVector local_122_2 = this.FrontTrajectory.ProjectToTrajectory(local_52.GetLocation());
        FVector local_194(local_52.GetRotation().GetAxisX());
        FVector local_114 = (local_122_2 - this.FrontTrajectory.Center).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        FVector local_200 = (local_194 - (local_114 * local_194.DotProduct(local_114)));
        local_148.SetRotation((FQuat::FindBetween(local_194, local_200) * local_108.GetRotation()));
        local_148.SetLocation(local_122_2);
        FTransform local_172 = local_148.GetRelativeTransform(local_108);
        if (this.bEnableDebugDraw)
        {
            this.DrawAnimDebugTransform(this.RuntimeRootTM, 60.0f, true);
            this.DrawAnimTrajectory(this.RuntimeRootTM);
        }
        int64 local_226 = 4626322717216342016;
        int64 local_228 = 4652007308841189376;
        float local_230 = 1000.0;
        this.GetMinTrajectoryLength(this.HeadBone.GetLocation(), this.TailEndBone.GetLocation(), this.LegIKs, 20.0, local_228, local_230);
        this.FrontTrajectory.DebugDraw(this, this.RuntimeRootTM, 1000.0, true, FColor::Yellow, this.bEnableDebugDraw);
        this.RearTrajectory.DebugDraw(this, this.RuntimeRootTM, local_230, false, FColor::Cyan, this.bEnableDebugDraw);
        const TArray<FTrajectoryDiscreteSample>& local_232 = this.FrontTrajectory.GetDiscretizedPositions_Circle(this.RuntimeRootTM, true, 1000.0, 20);
        const TArray<FTrajectoryDiscreteSample>& local_236 = this.GetHistoryTrajectoryPoints(local_230);
        if (this.bEnableDebugDraw)
        {
            this.DrawAnimDebugPointEx(local_232.Last(0).Loc, FColor::Red, 5.0f);
            this.DrawAnimDebugPointEx(local_236.Last(0).Loc, FColor::Red, 5.0f);
        }
        TMap<int, FTransform> local_256;
        this.AdjustBoneChainWithTrajectory(this.WholeSpineStates, this.RuntimeRootTM, local_236, local_232, 20.0f, local_256);
        this.AdjustBoneChainWithTrajectory(this.WholeTailStates, this.RuntimeRootTM, local_236, local_232, -20.0f, local_256);
        if (this.LeanStrength > 0.0f && !(this.SpineLeanAnchors.IsEmpty()))
        {
            this.ApplyLeanToChain(this.WholeSpineStates, this.RuntimeRootTM, local_236, local_232, this.SpineLeanAnchors, local_256);
            this.ApplyLeanToChain(this.WholeTailStates, this.RuntimeRootTM, local_236, local_232, this.TailLeanAnchors, local_256);
        }
        for (auto& local_270 : this.LegIKs)
        {
            local_270.bPendingSolve = false;
            if (local_270.bFootPlanting)
            {
                FTransform local_320 = this.ProjectBoneToTrajectory(local_270.IKSolver.GetEffectorTM(), this.RuntimeRootTM, local_236, local_232, true, 20.0);
                this.CalcFootPlantingTarget(local_270, this.RuntimeRootTM, local_320, local_172);
            }
            if (local_270.bStrideWarp)
            {
                this.CalcStrideWarpTarget(local_270, this.RuntimeRootTM, this.RearTrajectory);
            }
        }
        for (auto& local_338 : local_256)
        {
            this.SetBoneTransformCS(local_338.GetKey());
        }
        for (auto& local_270 : this.LegIKs)
        {
            if (local_270.bPendingSolve)
            {
                local_270.IKSolver.Solve(local_270.RuntimeTarget);
            }
        }
        return;
    }
    void InitBoneChainState(const FPT_BoneRef &inout StartBone, const FPT_BoneRef &inout EndBone, TArray<FBoneStatePrivate> &inout ChainState, const bool bIncludeStartBone = true)
    {
        FBoneStatePrivate local_28;
        ChainState.Reset(ChainState.Num());
        int local_30 = EndBone.GetBoneIndex();
        while (local_30 != StartBone.GetBoneIndex())
        {
            local_28.BoneIndex = local_30;
            local_28.Transform = this.GetBoneTransformCS(local_30);
            ChainState.Add(local_28);
            local_30 = this.GetParentBoneIndex(local_30);
        }
        if (bIncludeStartBone)
        {
            local_28.BoneIndex = StartBone.GetBoneIndex();
            local_28.Transform = StartBone.GetTransform();
            ChainState.Add(local_28);
        }
        int local_57 = 0;
        int local_61 = ChainState.Num() - 1;
        for (; local_57 < local_61; )
        {
            FBoneStatePrivate local_92;
            local_92 = ChainState[local_57];
            ChainState[local_57] = ChainState[local_61];
            ChainState[local_61] = local_92;
            ++local_57;
            --local_61;
        }
        return;
    }
    void ComputeLeanAnchors()
    {
        int local_46;
        int local_48;
        this.SpineLeanAnchors.Empty(0);
        this.TailLeanAnchors.Empty(0);
        TMap<int, int> local_22;
        int local_23 = 0;
        for (; local_23 < this.WholeSpineStates.Num(); )
        {
            local_22.Add(this.WholeSpineStates[local_23].BoneIndex, local_23);
            ++local_23;
        }
        for (auto& local_40 : this.LegIKs)
        {
            FPT_BoneRef local_45;
            if (local_40.IKSolver.ChainBoneNames.IsEmpty())
            {
            }
            else
            {
            }
            local_45.SetBoneName();
            if (!(this.InitializeBoneRef(local_45)))
            {
                continue;
            }
            int local_1 = local_45.GetParentBoneIndex();
            local_46 = -1;
            while (local_1 >= 0)
            {
                if (local_22.Contains(local_1))
                {
                    local_46 = local_22[local_1];
                    break;
                }
                local_1 = this.GetParentBoneIndex(local_1);
            }
            if (local_46 < 0)
            {
                continue;
            }
            float local_80 = local_40.IKSolver.GetEffectorTM().GetLocation().Y;
            local_48 = int(local_80);
            int local_24 = this.SpineLeanAnchors.IndexOfByPredicate(__Lambda_Unreal_PoseTweaker_SPT_TrajectoryBlend_666(local_46));
            if (local_24 >= 0)
            {
                local_80 = 0.0;
                if (local_48 > local_80)
                {
                    local_80 = this.SpineLeanAnchors[local_24].FootOffsetRight;
                    this.SpineLeanAnchors[local_24].FootOffsetRight = FMath::Max(local_80, local_48);
                }
                else
                {
                    local_80 = this.SpineLeanAnchors[local_24].FootOffsetLeft;
                    this.SpineLeanAnchors[local_24].FootOffsetLeft = FMath::Min(local_80, local_48);
                }
            }
            else
            {
                FSpineLeanAnchor local_92;
                local_92.ChainIndex = local_46;
                local_92.BoneIndex = this.WholeSpineStates[local_46].BoneIndex;
                if (local_48 > 0.0)
                {
                    local_92.FootOffsetRight = local_48;
                }
                else
                {
                    local_92.FootOffsetLeft = local_48;
                }
                this.SpineLeanAnchors.Add(local_92);
            }
        }
        if (!(this.SpineLeanAnchors.IsEmpty()))
        {
            FSpineLeanAnchor local_92;
            local_92.ChainIndex = -1;
            local_92.BoneIndex = this.PelvisBone.GetBoneIndex();
            local_92.FootOffsetLeft = this.SpineLeanAnchors[0].FootOffsetLeft;
            local_92.FootOffsetRight = this.SpineLeanAnchors[0].FootOffsetRight;
            this.TailLeanAnchors.Add(local_92);
        }
        return;
    }
    void DebugDrawBoneChain(const FName &inout Start, const FName &inout End)
    {
        if (!(this.bEnableDebugDraw))
        {
            return;
        }
        TArray<int> local_10 = this.GetBoneIndicesOnChain(Start, End);
        if (!(local_10.IsEmpty()))
        {
            FTransform local_36 = this.GetBoneTransformCS(local_10[0]);
            this.DrawAnimDebugTransform(local_36, 20.0f, true);
            int local_38 = 1;
            for (; local_38 < local_10.Num(); )
            {
                FTransform local_36_2 = this.GetBoneTransformCS(local_10[local_38]);
                this.DrawAnimDebugTransform(local_36_2, 20.0f, true);
                this.DrawAnimDebugLine(this.GetBoneTransformCS(local_10[(local_38 - 1)]).GetLocation(), local_36_2.GetLocation(), FColor::Green, EPTDebugDrawSpace(0), 0.0f, true);
                ++local_38;
            }
        }
        return;
    }
    void SimulateTrajectoryMotion(const FTransform &inout RootTM)
    {
        this.ElapsedSeconds += this.CurrentDeltaSeconds;
        int local_4 = 0;
        int local_3 = local_4;
        float local_6 = this.SimpleTrajectoryRadius;
        return;
    }
    const TArray<FTrajectoryDiscreteSample>& GetHistoryTrajectoryPoints(const float RearTrajMinLength)
    {
        bool local_1 = false;
        if (this.IsInPreviewScene())
        {
            const TArray<FTrajectoryDiscreteSample>& local_4 = this.FrontTrajectory.GetDiscretizedPositions_Circle(this.RuntimeRootTM, false, 400.0, 50);
            local_1 = this.bEnableDebugDraw;
            if (local_1)
            {
                this.DrawAnimDebugPointEx(local_4.Last(0).Loc, FColor::Red, 5.0f);
            }
        }
        else
        {
            TArray<FVector> local_18 = this.TrajectoryData.BuildHistoryMovesFromBuffer(this.TrajectoryRecorder);
            if (local_18.Num() > 0)
            {
                this.HistoryTrajectoryHelper.UpdateMinLength(RearTrajMinLength);
                FRotator local_66 = this.OwnerComponent.GetWorldTransform().GetRotation().Rotator();
                local_66.Roll = 0.0;
                local_66.Pitch = local_66.Roll;
                TArray<FVector> local_70;
                local_70.SetNum(local_18.Num());
                int local_71 = 0;
                for (; local_71 < local_18.Num(); )
                {
                    local_70[local_71] = local_66.UnrotateVector(local_18[local_71]);
                    ++local_71;
                }
                this.ClampMovesCurvature(this.MinFutureTrajectoryRadius, local_70);
                const TArray<FTrajectoryDiscreteSample>& local_4_2 = this.HistoryTrajectoryHelper.GenerateFromMoves(this.RuntimeRootTM, local_70);
                this.HistoryTrajectoryHelper.DebugDraw(this, this.bEnableDebugDraw);
            }
            else
            {
                local_1 = false;
                return this.RearTrajectory.GetDiscretizedPositions_Circle(this.RuntimeRootTM, local_1, RearTrajMinLength, 20);
            }
        }
        return local_1;
    }
    void UpdateTrajectory(FSimpleCircleTrajectory &inout OutTrajectory, const FTransform &inout RootXform, const float32 InputCurvature, const float32 MinRadius)
    {
        float32 local_7;
        float32 local_9;
        int local_1 = 925353388;
        if (InputCurvature > 0.0f)
        {
            local_7 = FMath::Max(InputCurvature, 1e-5f);
        }
        else
        {
            local_7 = FMath::Min(InputCurvature, -1e-5f);
        }
        float32 local_3 = 1.0f / local_7;
        if (local_3 > 0.0f)
        {
            local_9 = FMath::Max(local_3, MinRadius);
        }
        else
        {
            float32 local_6 = -MinRadius;
            local_9 = FMath::Min(local_3, local_6);
        }
        float32 local_3_2 = local_9;
        FVector local_40 = RootXform.GetLocation();
        OutTrajectory.Update((local_40 + (RootXform.GetRotation().GetAxisY() * local_3_2)), FMath::Abs(local_3_2));
        return;
    }
    void GetMinTrajectoryLength(const FVector &inout Head, const FVector &inout Pelvis, const TArray<FTrajectoryFootIKLeg> &inout Legs, const float DummyEndBoneLength, float &inout OutFrontMin, float &inout OutRearMin)
    {
        float local_2 = 0.0;
        for (auto& local_20 : Legs)
        {
            local_2 = FMath::Max(local_2, FMath::Abs(local_20.IKSolver.GetEffectorTM().GetLocation().X));
        }
        float local_4_2 = FMath::Max(FMath::Abs(Head.X), local_2) + DummyEndBoneLength;
        OutFrontMin = (local_4_2 * 1.2);
        local_4_2 = (FMath::Max(FMath::Abs(Pelvis.X), local_2) + DummyEndBoneLength) * 1.2;
        OutRearMin = local_4_2;
        return;
    }
    void AdjustBoneChainWithTrajectory(const TArray<FBoneStatePrivate> &inout BoneChainStates, const FTransform &inout RootTM, const TArray<FTrajectoryDiscreteSample> &inout RearTraj, const TArray<FTrajectoryDiscreteSample> &inout FrontTraj, const float32 DummyEndBoneLength, TMap<int, FTransform> &inout BonesToModify)
    {
        TArray<FTransform> local_4;
        int local_5 = 0;
        for (; local_5 < BoneChainStates.Num(); )
        {
            local_4.Add(this.GetBoneTransformCS(BoneChainStates[local_5].BoneIndex));
            ++local_5;
        }
        TArray<FTransform> local_44 = this.ProjectBoneChainToTrajectory(local_4, true, RootTM, RearTraj, FrontTraj, true, DummyEndBoneLength);
        int local_6 = local_44.Num();
        int local_7_2 = BoneChainStates.Num();
        int local_5_2 = 0;
        for (; local_5_2 < BoneChainStates.Num(); ++local_5_2)
        {
            FTransform& local_46 = local_44[local_5_2];
            BonesToModify.Add(BoneChainStates[local_5_2].BoneIndex, local_46);
            if (this.bEnableDebugDraw)
            {
                this.DrawAnimDebugTransform(local_46, 20.0f, true);
                this.DrawAnimDebugPointEx(FVector(local_46.GetLocation().X, local_46.GetLocation().Y, 0.0), FColor::Green, 3.0f);
            }
        }
        return;
    }
    void ApplyLeanToChain(const TArray<FBoneStatePrivate> &inout BoneChainStates, const FTransform &inout RootTM, const TArray<FTrajectoryDiscreteSample> &inout RearTraj, const TArray<FTrajectoryDiscreteSample> &inout FrontTraj, const TArray<FSpineLeanAnchor> &inout LeanAnchors, TMap<int, FTransform> &inout BonesToModify)
    {
        int local_31;
        float local_96;
        float local_100;
        float local_130;
        float local_132;
        int local_2 = BoneChainStates.Num();
        int64 local_4 = 4651831386980745216;
        TArray<float> local_10;
        TArray<float> local_14;
        for (auto& local_30 : LeanAnchors)
        {
            local_31 = int(local_30.BoneIndex);
            FTransform local_80 = this.GetBoneTransformCS(local_31);
            float local_92 = this.FrontTrajectory.SampleCurvature(RootTM, local_80.GetLocation(), RearTraj, FrontTraj, (this.TrajectoryData.GetMoveSpeed() * this.LeanSmoothDuration));
            float32 local_83 = this.TrajectoryData.GetMoveSpeed();
            local_83 = local_83 * this.TrajectoryData.GetMoveSpeed();
            float local_6 = local_83 * local_92;
            float local_82 = local_6 / 980.0;
            local_100 = this.LeanStrength;
            local_96 = local_82 * local_100;
            local_100 = FMath::Atan(local_96);
            local_82 = FMath::DegreesToRadians(float(this.MaxLeanAngle));
            local_96 = local_82;
            local_96 = -local_96;
            local_100 = FMath::Clamp(local_100, local_96, local_82);
            FTransform local_56;
            if (BonesToModify.Contains(local_31))
            {
                local_56 = BonesToModify[local_31];
            }
            else
            {
                local_56 = local_80;
            }
            float local_102 = 0.0;
            if (local_100 >= local_102)
            {
                local_96 = local_30.FootOffsetLeft;
            }
            else
            {
                local_96 = local_30.FootOffsetRight;
            }
            local_6 = local_56.GetLocation().Z;
            local_130 = FMath::Cos(local_100);
            float local_94 = 1.0;
            local_102 = local_130 - local_94;
            local_94 = local_6 * local_102;
            local_130 = FMath::Sin(local_100);
            local_102 = local_96 * local_130;
            local_130 = local_94 + local_102;
            local_10.Add(local_100);
            local_14.Add(local_130);
        }
        local_31 = 0;
        int local_133 = 0;
        int local_1 = LeanAnchors.Num() - 1;
        int local_136 = 0;
        for (; local_136 < local_2; )
        {
            local_130 = 0.0;
            local_96 = 0.0;
            if (local_31 < local_1 && (LeanAnchors[local_31].ChainIndex <= local_136))
            {
                local_31 = local_133;
                local_133 = FMath::Min(local_133 + 1, local_1);
            }
            if (local_31 == local_133)
            {
                int local_138 = FMath::Abs(local_136 - LeanAnchors[local_31].ChainIndex);
                if (local_138 == 0)
                {
                    local_132 = 1.0;
                }
                else
                {
                    local_132 = FMath::Pow(this.OuterLeanFalloff, local_138);
                }
                local_130 = local_10[local_31] * local_132;
                local_96 = local_14[local_31] * local_132;
            }
            else
            {
                int local_139 = LeanAnchors[local_133].ChainIndex - LeanAnchors[local_31].ChainIndex;
                local_139 = LeanAnchors[local_31].ChainIndex;
                local_100 = (local_136 - local_139);
                float local_102_3 = local_100 / local_139;
                local_100 = FMath::Lerp(local_10[local_31], local_10[local_133], local_102_3);
                local_130 = local_100;
                local_132 = FMath::Lerp(local_14[local_31], local_14[local_133], local_102_3);
                local_96 = local_132;
            }
            FTransform& local_142 = BonesToModify.FindOrAdd(BoneChainStates[local_136].BoneIndex);
            FRotator local_154 = local_142.Rotator();
            local_100 = FMath::RadiansToDegrees(local_130);
            local_154.Roll += local_100;
            local_142.SetRotation(local_154.Quaternion());
            FVector local_170(local_142.GetLocation());
            local_132 = local_170.Z + local_96;
            local_170.Z = local_132;
            local_142.SetLocation(local_170);
            ++local_136;
        }
        return;
    }
    void AdjustNeckBoneChain(const FTransform &inout RootTM, const FTransform &inout HeadTM, const float32 InputYawDegree, TMap<int, FTransform> &inout BonesToModify)
    {
        this.SmoothedMoveDesiredYaw = FMath::Lerp(this.SmoothedMoveDesiredYaw, FMath::Clamp(InputYawDegree, this.MinHeadYaw, this.MaxHeadYaw), this.MoveDesiredYawSmoothAlpha);
        FVector local_10(RootTM.GetRotation().GetAxisX());
        if (!(FMath::IsNearlyZero(this.TrajectoryData.GetMoveDesiredYawWeight(), 1e-8f)))
        {
            FVector local_34(HeadTM.GetRotation().GetAxisX());
            local_34.Z = 0.0;
            FQuat local_68 = (FQuat(FVector::UpVector, FMath::DegreesToRadians(this.SmoothedMoveDesiredYaw)) * FQuat::FindBetween(local_10, local_34).Inverse());
            int local_70 = this.WholeNeckStates.Num();
            if (local_70 > 1)
            {
                float32 local_71 = (local_70 - 1);
                int local_72 = 1;
                for (; local_72 < local_70; )
                {
                    float32 local_1 = local_72 / local_71;
                    FTransform local_124 = this.GetBoneTransformCS(this.WholeNeckStates[local_72].BoneIndex);
                    local_124.SetRotation((FQuat::Slerp(FQuat::Identity, local_68, (local_1 * FMath::Clamp(this.TrajectoryData.GetMoveDesiredYawWeight(), 0.0f, 1.0f))) * local_124.GetRotation()));
                    BonesToModify.Add(this.WholeNeckStates[local_72].BoneIndex, local_124);
                    ++local_72;
                }
            }
        }
        if (this.bEnableDebugDraw)
        {
            FQuat local_60 = FQuat(FVector::UpVector, FMath::DegreesToRadians(InputYawDegree));
            FQuat local_52 = FQuat(FVector::UpVector, FMath::DegreesToRadians(this.SmoothedMoveDesiredYaw));
            this.DrawAnimDebugLine(HeadTM.GetLocation(), (HeadTM.GetLocation() + (local_60.RotateVector(local_10) * 500.0)), FColor::Red, EPTDebugDrawSpace(0), 0.0f, true);
            this.DrawAnimDebugLine(HeadTM.GetLocation(), (HeadTM.GetLocation() + (local_52.RotateVector(local_10) * 500.0)), FColor::Emerald, EPTDebugDrawSpace(0), 0.0f, true);
        }
        return;
    }
    void ClampMovesCurvature(const float32 MinRadius, TArray<FVector> &inout Moves)
    {
        float local_32;
        float local_34;
        if (MinRadius <= 0.0f || Moves.IsEmpty())
        {
            return;
        }
        FVector local_10(FVector::ForwardVector);
        float local_12 = 0.0;
        float local_16 = (MinRadius * 2.0f);
        int local_17 = 0;
        for (; local_17 < Moves.Num(); )
        {
            FVector local_26(Moves[local_17]);
            local_26.Z = 0.0;
            float local_14 = local_26.Size();
            if (local_12 < local_16)
            {
                float local_28 = local_12 / local_16;
                local_34 = FMath::Acos(local_28);
            }
            else
            {
                local_34 = 0.0;
            }
            if (local_14 < local_16)
            {
                local_32 = FMath::Acos(local_14 / local_16);
            }
            else
            {
                local_32 = 0.0;
            }
            float local_36 = 3.1415927410125732 - local_34;
            float local_28_3 = local_36 - local_32;
            local_36 = local_10.DotProduct(local_26);
            FVector local_46 = local_10.CrossProduct(local_26);
            float local_30 = FMath::Atan2(local_46.Z, local_36);
            local_36 = FMath::Abs(local_30);
            if (local_36 > local_28_3)
            {
                local_36 = FMath::Sign(local_30);
                float local_40 = local_28_3 * local_36;
                local_36 = FMath::Sin(local_40);
                float local_48 = FMath::Cos(local_40);
                float local_52 = local_10.X * local_48;
                local_26.X = (local_52 - (local_10.Y * local_36));
                local_52 = local_10.Y * local_48;
                local_26.Y = ((local_10.X * local_36) + local_52);
                local_26 *= local_14;
                Moves[local_17].X = local_26.X;
                Moves[local_17].Y = local_26.Y;
            }
            local_10 = (local_26 / local_14);
            local_12 = local_14;
            ++local_17;
        }
        return;
    }
    TArray<FTransform> ProjectBoneChainToTrajectory(const TArray<FTransform> &inout BoneChainTMs, const bool bLimitYawOnlyOnChainRoot, const FTransform &inout RootTM, const TArray<FTrajectoryDiscreteSample> &inout RearTraj, const TArray<FTrajectoryDiscreteSample> &inout FrontTraj, const bool bUseDummyEnd, const float DummyLength)
    {
        if (BoneChainTMs.IsEmpty())
        {
            return TArray<FTransform>();
        }
        TArray<FVector> local_10;
        for (auto& local_24 : BoneChainTMs)
        {
            local_10.Add(local_24.GetLocation());
        }
        if (bUseDummyEnd)
        {
            local_10.Add((FVector(local_10.Last(0)) + (RootTM.GetRotation().GetAxisX() * DummyLength)));
        }
        TArray<FVector> local_56;
        for (auto& local_70 : local_10)
        {
            local_56.Add(this.FrontTrajectory.ProjectToTrajectory_Complex(RootTM, local_70, RearTraj, FrontTraj, this));
        }
        TArray<FTransform> local_74;
        int local_75 = 0;
        for (; local_75 < BoneChainTMs.Num(); )
        {
            FTransform local_100 = FTransform(BoneChainTMs[local_75]);
            int local_76 = BoneChainTMs.Num() - 1;
            if (local_75 < local_76 || bUseDummyEnd)
            {
                FVector local_30 = (FVector(local_56[(local_75 + 1)]) - local_56[local_75]);
                local_76 = local_75 + 1;
                FVector local_46_2 = (FVector(local_10[local_76]) - local_10[local_75]);
                FQuat local_40 = FQuat::FindBetween(local_46_2, local_30);
                if ((bLimitYawOnlyOnChainRoot && (local_75 == 0)))
                {
                    FRotator local_126 = local_40.Rotator();
                    local_126.Roll = 0.0;
                    local_126.Pitch = 0.0;
                    local_40 = local_126.Quaternion();
                }
                local_100.SetRotation((local_40 * local_100.GetRotation()));
            }
            local_100.SetLocation(local_56[local_75]);
            local_74.Add(local_100);
            ++local_75;
        }
        return local_74;
    }
    FTransform ProjectBoneToTrajectory(const FTransform &inout BoneTM, const FTransform &inout RootTM, const TArray<FTrajectoryDiscreteSample> &inout RearTraj, const TArray<FTrajectoryDiscreteSample> &inout FrontTraj, const bool bUseDummyEnd, const float DummyLength)
    {
        TArray<FTransform> local_4;
        local_4.Add(BoneTM);
        TArray<FTransform> local_16 = this.ProjectBoneChainToTrajectory(local_4, false, RootTM, RearTraj, FrontTraj, bUseDummyEnd, DummyLength);
        return local_16[0];
    }
    void CalcFootPlantingTarget(FTrajectoryFootIKLeg &inout Leg, const FTransform &inout RootTM, const FTransform &inout TrajectoryFittedTarget, const FTransform &inout ActualRMDelta)
    {
        int local_1 = 0;
        float32 local_3 = 1.0f;
        bool local_5 = this.GetCurveValue(Leg.AlphaCurveName, local_1);
        bool local_4 = this.GetCurveValue(Leg.LandedCurveName, local_3);
        if ((!(local_5) || !(local_4)))
        {
            return;
        }
        int local_9 = 0;
        int local_8 = local_9;
        if (local_3 > 0.5f)
        {
            int local_9_2 = 1;
            local_8 = local_9_2;
            if ((int(Leg.LastLandingState) == 2))
            {
                Leg.LandingTM_RootSpace = TrajectoryFittedTarget.GetRelativeTransform(RootTM);
            }
            else
            {
                Leg.LandingTM_RootSpace *= ActualRMDelta.Inverse();
            }
            Leg.RuntimeTarget = (Leg.LandingTM_RootSpace * RootTM);
        }
        else
        {
            local_8 = 2;
            if ((int(Leg.LastLandingState) == 1))
            {
                Leg.InitialDiff = (Leg.RuntimeTarget * Leg.IKSolver.GetEffectorTM().Inverse());
            }
            Leg.RuntimeTarget.Blend(Leg.IKSolver.GetEffectorTM(), TrajectoryFittedTarget);
            FTransform local_108;
            local_108.Blend(Leg.InitialDiff, FTransform::Identity, local_1);
            Leg.RuntimeTarget = (local_108 * Leg.RuntimeTarget);
        }
        Leg.LastLandingState = ELandingState(local_8);
        Leg.bPendingSolve = true;
        if (this.bEnableDebugDraw)
        {
            this.DrawAnimDebugTransformEx(Leg.IKSolver.GetEffectorTM(), 20.0f, true, true, FColor::White);
            this.DrawAnimDebugTransformEx(TrajectoryFittedTarget, 40.0f, true, true, FColor::Orange);
            this.DrawAnimDebugTransformEx(Leg.RuntimeTarget, 30.0f, true, true, FColor::Green);
        }
        return;
    }
    void CalcStrideWarpTarget(FTrajectoryFootIKLeg &inout Leg, const FTransform &inout RootTM, const FSimpleCircleTrajectory &inout Traj)
    {
        if (!(Leg.IKSolver.IsValid()) || !(Leg.IKSolver.IsReadyToSolve()))
        {
            return;
        }
        FVector local_26 = (Traj.Center - RootTM.GetLocation());
        float local_38 = local_26.DotProduct(RootTM.GetRotation().GetAxisY());
        if (FMath::Abs(local_38) < 1.0)
        {
            return;
        }
        FTransform local_64 = FTransform(Leg.IKSolver.GetEffectorTM());
        FVector local_94(local_64.GetLocation());
        FVector local_20 = RootTM.InverseTransformPosition(local_94);
        float local_40 = FMath::Abs((local_38 - local_20.Y));
        float local_102 = Traj.Radius * 0.5;
        local_40 = FMath::Clamp(local_40, local_102, (Traj.Radius * 2.0));
        float local_28_3 = local_20.X;
        local_102 = local_28_3 / Traj.Radius;
        local_102 = FMath::Clamp(local_102, -1.5707963705062866, 1.5707963705062866);
        if (local_38 > 0.0)
        {
            local_28_3 = 1.0;
        }
        else
        {
            local_28_3 = -1.0;
        }
        FVector local_8 = (RootTM.GetLocation() - Traj.Center);
        FVector local_100 = (FQuat(FVector::UpVector, local_102 * local_28_3)).RotateVector(local_8).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        FVector local_114 = (Traj.Center + (local_100 * local_40));
        local_114.Z = local_94.Z;
        Leg.RuntimeTarget = local_64;
        Leg.RuntimeTarget.SetLocation(local_114);
        Leg.bPendingSolve = true;
        if (this.bEnableDebugDraw)
        {
            this.DrawAnimDebugTransformEx(local_64, 15.0f, true, true, FColor::Red);
            this.DrawAnimDebugTransformEx(Leg.RuntimeTarget, 15.0f, true, true, FColor::Cyan);
        }
        return;
    }
    void DrawAnimTrajectory(const FTransform &inout RootTM)
    {
        FVector local_6(RootTM.GetLocation());
        FVector local_26(RootTM.GetRotation().GetAxisX());
        FVector local_34 = (local_6 + (local_26 * 500.0));
        FVector local_12_2 = (local_26 * 300.0);
        this.DrawAnimDebugLine((local_6 - local_12_2), local_34, FColor::Orange, EPTDebugDrawSpace(0), 0.0f, true);
        return;
    }
}

class USPT_TrajectoryBlend_GlimmeringWolf : USPT_TrajectoryBlend_Template
{
    USPT_TrajectoryBlend_GlimmeringWolf()
    {
        super();
        this.PelvisBone.SetBoneName(n"Bn_M_Pelvis");
        this.HeadBone.SetBoneName(n"Bn_M_head");
        FTrajectoryFootIKLeg local_132;
        local_132.IKSolver.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("Bn_L_UpArm|Bn_L_LowArm|Bn_L_Hand");
        local_132.IKSolver.EffectorBoneName = n"Bn_L_MiddleFinger1";
        this.LegIKs.Add(local_132);
        local_132.IKSolver.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("Bn_R_UpArm|Bn_R_LowArm|Bn_R_Hand");
        local_132.IKSolver.EffectorBoneName = n"Bn_R_MiddleFinger1";
        this.LegIKs.Add(local_132);
        local_132.IKSolver.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("Bn_L_UpLeg|Bn_L_MidLeg|Bn_L_LowLeg");
        local_132.IKSolver.EffectorBoneName = n"Bn_L_Foot";
        this.LegIKs.Add(local_132);
        local_132.IKSolver.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("Bn_R_UpLeg|Bn_R_MidLeg|Bn_R_LowLeg");
        local_132.IKSolver.EffectorBoneName = n"Bn_R_Foot";
        this.LegIKs.Add(local_132);
        this.MinFutureTrajectoryRadius = 400.0f;
        this.HistoryTrajectorySmoothIteration = 0;
        return;
    }
}

class USPT_TrajectoryBlend_Gazelle : USPT_TrajectoryBlend_Template
{
    USPT_TrajectoryBlend_Gazelle()
    {
        super();
        this.PelvisBone.SetBoneName(n"pelvis");
        this.HeadBone.SetBoneName(n"Head");
        FTrajectoryFootIKLeg local_132;
        local_132.IKSolver.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("upperarm_l|lowerarm_l|hand_l");
        local_132.IKSolver.EffectorBoneName = n"finger_01_l";
        this.LegIKs.Add(local_132);
        local_132.IKSolver.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("upperarm_r|lowerarm_r|hand_r");
        local_132.IKSolver.EffectorBoneName = n"finger_01_r";
        this.LegIKs.Add(local_132);
        local_132.IKSolver.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_l|calf_l|lowcalf_l");
        local_132.IKSolver.EffectorBoneName = n"foot_l";
        this.LegIKs.Add(local_132);
        local_132.IKSolver.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_r|calf_r|lowcalf_r");
        local_132.IKSolver.EffectorBoneName = n"foot_r";
        this.LegIKs.Add(local_132);
        this.MinFutureTrajectoryRadius = 200.0f;
        this.HistoryTrajectorySmoothIteration = 0;
        return;
    }
}

class USPT_TrajectoryBlend_Qiongqi : USPT_TrajectoryBlend_Template
{
    USPT_TrajectoryBlend_Qiongqi()
    {
        super();
        this.PelvisBone.SetBoneName(n"pelvis");
        this.HeadBone.SetBoneName(n"Head");
        this.LeanStrength = 0.0f;
        FTrajectoryFootIKLeg local_132;
        local_132.IKSolver.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("upperarm_l|lowerarm_l|hand_l");
        local_132.IKSolver.EffectorBoneName = n"middle_01_l";
        this.LegIKs.Add(local_132);
        local_132.IKSolver.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("upperarm_r|lowerarm_r|hand_r");
        local_132.IKSolver.EffectorBoneName = n"middle_01_r";
        this.LegIKs.Add(local_132);
        local_132.IKSolver.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_l|calf_l|lowcalf_l");
        local_132.IKSolver.EffectorBoneName = n"foot_l";
        this.LegIKs.Add(local_132);
        local_132.IKSolver.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_r|calf_r|lowcalf_r");
        local_132.IKSolver.EffectorBoneName = n"foot_r";
        this.LegIKs.Add(local_132);
        this.MinFutureTrajectoryRadius = 300.0f;
        this.HistoryTrajectorySmoothIteration = 0;
        return;
    }
}

class USPT_TrajectoryBlend_Wyvern001_HarbingerOfDoom : USPT_TrajectoryBlend_Template
{
    USPT_TrajectoryBlend_Wyvern001_HarbingerOfDoom()
    {
        super();
        this.PelvisBone.SetBoneName(n"pelvis");
        this.HeadBone.SetBoneName(n"Head");
        FTrajectoryFootIKLeg local_132;
        local_132.IKSolver.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("upperarm_l|lowerarm_l|hand_l");
        local_132.IKSolver.EffectorBoneName = n"hand_l";
        local_132.bFootPlanting = true;
        local_132.LandedCurveName = n"FootLanded_FL";
        local_132.AlphaCurveName = n"FootAdjAlpha_FL";
        local_132.bStrideWarp = true;
        this.LegIKs.Add(local_132);
        local_132.IKSolver.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("upperarm_r|lowerarm_r|hand_r");
        local_132.IKSolver.EffectorBoneName = n"hand_r";
        local_132.bFootPlanting = true;
        local_132.LandedCurveName = n"FootLanded_FR";
        local_132.AlphaCurveName = n"FootAdjAlpha_FR";
        local_132.bStrideWarp = true;
        this.LegIKs.Add(local_132);
        local_132.IKSolver.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_l|calf_l|lowcalf_l");
        local_132.IKSolver.EffectorBoneName = n"foot_l";
        local_132.bStrideWarp = true;
        this.LegIKs.Add(local_132);
        local_132.IKSolver.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames("thigh_r|calf_r|lowcalf_r");
        local_132.IKSolver.EffectorBoneName = n"foot_r";
        local_132.bStrideWarp = true;
        this.LegIKs.Add(local_132);
        this.MinFutureTrajectoryRadius = 250.0f;
        this.HistoryTrajectorySmoothIteration = 0;
        return;
    }
}

struct __Lambda_Unreal_PoseTweaker_SPT_TrajectoryBlend_666
{
    UPROPERTY()
    int __SpineIdx;

    __Lambda_Unreal_PoseTweaker_SPT_TrajectoryBlend_666(const int _InSpineIdx)
    {
        this.__SpineIdx = _InSpineIdx;
        return;
    }
    int GetSpineIdx() property
    {
        int __r;
        return __r;
    }
    bool opCall(const FSpineLeanAnchor &inout Anchor)
    {
        return (Anchor.ChainIndex == this.GetSpineIdx());
    }
}

struct __Lambda_Unreal_PoseTweaker_SPT_TrajectoryBlend_687
{
    __Lambda_Unreal_PoseTweaker_SPT_TrajectoryBlend_687()
    {
        return;
    }
    bool opCall(const FSpineLeanAnchor &inout A, const FSpineLeanAnchor &inout B)
    {
        return (A.ChainIndex < B.ChainIndex);
    }
}


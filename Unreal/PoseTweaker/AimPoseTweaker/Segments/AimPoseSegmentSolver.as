

struct FAimPoseSegmentContext
{
    UPROPERTY()
    FQuat AccumulatedDeltaQ;
    UPROPERTY()
    FVector PivotLocation = FVector::ZeroVector;
    UPROPERTY()
    bool bValid = false;


}

UCLASS(Abstract)
class UAimPoseSegmentSolver : UAimPoseBoneProcessor
{
    FName ParentSegmentName;
    FName ChannelKey;
    FPT_BoneRef SingleBone;
    FPT_BoneChainRef BoneChain;
    FPT_BoneRef RootBoneRef;
    float32 SegmentPitchMin = -15.0f;
    float32 SegmentPitchMax = 15.0f;
    float32 SegmentYawMin = -90.0f;
    float32 SegmentYawMax = 90.0f;
    bool bEnableDamp = true;
    float32 CurSpringStrength = 60.0f;
    float32 CurSpringDamping = 0.05f;
    FPT_FloatSpring PitchSpring;
    FPT_FloatSpring YawSpring;
    FVector AnimLocalTarget = FVector(70.0, 0.0, 100.0);
    FRuntimeFloatCurve RotationRatioCurve = FRuntimeCurveUtils::CreateConst(1.0f);
    TArray<float> BoneLengthRatios;
    bool bLengthsCached = false;
    TArray<float32> ConfigBoneWeights;
    bool bUseExplicitWeights = false;
    FVector CfgAnimLocalTarget = FVector(70.0, 0.0, 100.0);
    float32 CfgPitchMin = -15.0f;
    float32 CfgPitchMax = 15.0f;
    float32 CfgYawMin = -90.0f;
    float32 CfgYawMax = 90.0f;
    bool CfgEnableDamp = true;
    float32 CfgSpringStrength = 200.0f;
    float32 CfgSpringDamping = 0.2f;
    uint8 PrevSnapshotTypeMask = false;


    void ResetToConfigDefaults()
    {
        Super::ResetToConfigDefaults();
        this.SegmentPitchMin = this.CfgPitchMin;
        this.SegmentPitchMax = this.CfgPitchMax;
        this.SegmentYawMin = this.CfgYawMin;
        this.SegmentYawMax = this.CfgYawMax;
        this.bEnableDamp = this.CfgEnableDamp;
        this.CurSpringStrength = this.CfgSpringStrength;
        this.CurSpringDamping = this.CfgSpringDamping;
        this.AnimLocalTarget = this.CfgAnimLocalTarget;
        return;
    }
    void OnInitializeBoneRefs(const USkeletalPoseTweaker Tweaker)
    {
        return;
    }
    void InitFromConfig(const FAimPoseSegmentConfig &inout Cfg, const bool ResetAttr)
    {
        this.Order = int(Cfg.SolveOrder);
        this.ParentSegmentName = Cfg.ParentSegmentName;
        FName local_6;
        if (Cfg.AllowSourcePreset.IsSet())
        {
            local_6 = Cfg.AllowSourcePreset.GetDataName();
        }
        else
        {
            local_6 = n"All";
        }
        this.ChannelKey = local_6;
        if (Cfg.BoneChains.Num() > 0)
        {
            this.bUseExplicitWeights = true;
            this.ConfigBoneWeights.Reset(0);
            for (auto& local_22 : Cfg.BoneChains)
            {
                this.ConfigBoneWeights.Add(local_22.RatioWeight);
            }
        }
        else
        {
            this.bUseExplicitWeights = false;
            this.RotationRatioCurve = Cfg.RotationRatioCurve;
        }
        this.CfgEnabled = Cfg.bEnabled;
        this.CfgPitchMin = Cfg.SegmentPitchMin;
        this.CfgPitchMax = Cfg.SegmentPitchMax;
        this.CfgYawMin = Cfg.SegmentYawMin;
        this.CfgYawMax = Cfg.SegmentYawMax;
        this.CfgEnableDamp = Cfg.bEnableDamp;
        this.CfgSpringStrength = Cfg.SpringStrength;
        this.CfgSpringDamping = Cfg.SpringDamping;
        this.CfgAnimLocalTarget = Cfg.AnimLocalTarget;
        this.ResetToConfigDefaults();
        this.PitchSpring.Stiffness = this.CfgSpringStrength;
        this.PitchSpring.Damping = this.CfgSpringDamping;
        this.YawSpring.Stiffness = this.CfgSpringStrength;
        this.YawSpring.Damping = this.CfgSpringDamping;
        if (ResetAttr)
        {
            this.PitchSpring.Init(0.0, 0.0);
            this.YawSpring.Init(0.0, 0.0);
            this.bLengthsCached = false;
        }
        this.bEnableDebugDraw = Cfg.bEnableDebugDraw;
        return;
    }
    void ApplyOverride(const FAimPoseSegmentOverride &inout Ovr)
    {
        if (Ovr.GetbOverrideEnabled())
        {
            this.bEnabled = Ovr.GetbEnabled();
        }
        if (Ovr.GetbOverrideWeight())
        {
            this.Weight = Ovr.GetWeight();
        }
        if (Ovr.GetbOverrideClamp())
        {
            this.SegmentPitchMin = Ovr.GetSegmentPitchMin();
            this.SegmentPitchMax = Ovr.GetSegmentPitchMax();
            this.SegmentYawMin = Ovr.GetSegmentYawMin();
            this.SegmentYawMax = Ovr.GetSegmentYawMax();
        }
        if (Ovr.GetbOverrideAnimLocalTarget())
        {
            this.AnimLocalTarget = Ovr.GetAnimLocalTarget();
        }
        if (Ovr.GetbOverrideDamp())
        {
            this.bEnableDamp = Ovr.GetbEnableDamp();
            this.CurSpringStrength = Ovr.GetSpringStrength();
            this.CurSpringDamping = Ovr.GetSpringDamping();
            this.PitchSpring.Stiffness = this.CurSpringStrength;
            this.PitchSpring.Damping = this.CurSpringDamping;
            this.YawSpring.Stiffness = this.CurSpringStrength;
            this.YawSpring.Damping = this.CurSpringDamping;
        }
        return;
    }
    void Solve(const FVector &inout TargetCS, const float32 DeltaTime, FAimPoseSegmentContext &inout Ctx)
    {
        return;
    }
    bool ResolveTargetToAngles(const FVector &inout TargetCS, const float32 DeltaTime, FAimPoseSegmentContext &inout Ctx, float32 &inout OutPitch, float32 &inout OutYaw)
    {
        return false;
    }
    void ApplyResolvedAngles(const float32 RawPitch, const float32 RawYaw, const float32 DeltaTime, FAimPoseSegmentContext &inout Ctx)
    {
        return;
    }
    void Setup(const FName &inout InName, const FString &inout BoneNames, const int InOrder = 0)
    {
        Super::SetIdentity(InName, InOrder);
        if (BoneNames.IsEmpty())
        {
            return;
        }
        this.ApplyBoneNames(UPoseTweakerUtil::ParseIntoNames(BoneNames));
        return;
    }
    void Setup(const FName &inout InName, const TArray<FAimPoseBoneWeight> &inout Chain, const int InOrder = 0)
    {
        Super::SetIdentity(InName, InOrder);
        if (Chain.Num() == 0)
        {
            return;
        }
        TArray<FName> local_8;
        local_8.Reserve(Chain.Num());
        for (auto& local_22 : Chain)
        {
            local_8.Add(local_22.BoneName);
        }
        this.ApplyBoneNames(local_8);
        return;
    }
    void ApplyBoneNames(const TArray<FName> &inout Names)
    {
        if (Names.Num() == 0)
        {
            return;
        }
        if (Names.Num() == 1)
        {
            this.SingleBone.SetBoneName(Names[0]);
            return;
        }
        this.BoneChain.BoneNames = Names;
        return;
    }
    void SetRootBone(const FName &inout BoneName)
    {
        this.RootBoneRef.SetBoneName(BoneName);
        return;
    }
    bool HasRootBone() const
    {
        return this.RootBoneRef.HasValidSetup();
    }
    FVector GetRootBoneLocation() const
    {
        return this.RootBoneRef.GetTransform().GetLocation();
    }
    float32 GetRootYawOffset() const
    {
        if (!(this.HasRootBone()))
        {
            return 0.0f;
        }
        return float32(this.RootBoneRef.GetTransform().GetRotation().Rotator().Yaw);
    }
    FVector CorrectTargetForRootYaw(const FVector &inout TargetCS) const
    {
        float32 local_2 = this.GetRootYawOffset();
        if (FMath::IsNearlyZero(local_2, 0.1f))
        {
            return TargetCS;
        }
        float32 local_1 = -local_2;
        FQuat local_32 = FRotator(0.0, local_1, 0.0).Quaternion();
        return local_32.RotateVector(TargetCS);
    }
    bool HasSingleBoneConfig() const
    {
        return !(this.SingleBone.GetBoneName().IsNone());
    }
    bool HasBoneChainConfig() const
    {
        return (this.BoneChain.BoneNames.Num() > 0);
    }
    bool HasRootBoneConfig() const
    {
        return !(this.RootBoneRef.GetBoneName().IsNone());
    }
    void InitializeBoneRefs(const USkeletalPoseTweaker Tweaker)
    {
        if (this.HasSingleBoneConfig())
        {
            if (!(Tweaker.InitializeBoneRef(this.SingleBone)))
            {
                this.SingleBone.GetBoneName();
                FString local_6 = FString();
            }
        }
        if (!(this.HasRootBoneConfig()))
        {
            this.SetRootBone(n"Root");
        }
        if (this.HasRootBoneConfig())
        {
            if (!(Tweaker.InitializeBoneRef(this.RootBoneRef)))
            {
                this.RootBoneRef.GetBoneName();
                FString local_6_2 = FString();
            }
        }
        if (this.HasBoneChainConfig())
        {
            TSet<FString> local_30;
            FString local_34 = "";
            this.BoneChain.Initialize(local_30, local_34);
            if (local_30.Num() > 0)
            {
                FString local_6_3 = ::AimPoseUtils::Join(local_30, ", ");
                Tweaker.AddOnScreenDebugMessage(FString().Append("AimPose ERROR: [").Append(this.ProcessorName).Append("] BoneChain bones not found: ").Append(local_6_3), -1, false, 2.0f);
            }
        }
        this.OnInitializeBoneRefs(Tweaker);
        return;
    }
    bool IsSingleBoneValid() const
    {
        return this.SingleBone.HasValidSetup();
    }
    bool IsBoneChainValid()
    {
        return this.BoneChain.IsValid();
    }
    bool IsValid()
    {
        return this.IsSingleBoneValid() || this.IsBoneChainValid();
    }
    FVector GetFirstBoneLocation() const
    {
        if (this.IsSingleBoneValid())
        {
            return this.SingleBone.GetTransform().GetLocation();
        }
        if (this.BoneChain.GetBoneNum() > 0)
        {
            return this.BoneChain.GetTransform(0).GetLocation();
        }
        return FVector::ZeroVector;
    }
    FVector GetLastBoneLocation() const
    {
        int local_35;
        if (this.IsSingleBoneValid())
        {
            return this.SingleBone.GetTransform().GetLocation();
        }
        local_35 = this.BoneChain.GetBoneNum();
        if (local_35 > 0)
        {
            return this.BoneChain.GetTransform((local_35 - 1)).GetLocation();
        }
        return FVector::ZeroVector;
    }
    FQuat GetLastBoneRotation() const
    {
        int local_37;
        if (this.IsSingleBoneValid())
        {
            return this.SingleBone.GetTransform().GetRotation();
        }
        local_37 = this.BoneChain.GetBoneNum();
        if (local_37 > 0)
        {
            return this.BoneChain.GetTransform((local_37 - 1)).GetRotation();
        }
        return FQuat::Identity;
    }
    void SolveTarget(const uint8 SnapshotTypeMask, const FVector &inout TargetCS, const FRotator &inout TargetRotCS, const float32 DeltaTime, FAimPoseSegmentContext &inout Ctx)
    {
        if (!(this.bEnabled) || !(this.IsValid()))
        {
            return;
        }
        if (SnapshotTypeMask != this.PrevSnapshotTypeMask)
        {
            this.PrevSnapshotTypeMask = (SnapshotTypeMask != 0);
        }
        bool local_1 = ::FAnimSnapshot::HasType(uint8(SnapshotTypeMask), EAnimSnapshotType(0));
        bool local_2 = ::FAnimSnapshot::HasType(uint8(SnapshotTypeMask), EAnimSnapshotType(1));
        if ((local_2 && !(local_1)))
        {
            this.ApplyResolvedAngles(float32(TargetRotCS.Pitch), float32(TargetRotCS.Yaw), DeltaTime, Ctx);
            return;
        }
        if (local_1)
        {
            float32 local_13 = 0.0f;
            float32 local_14 = 0.0f;
            if (this.ResolveTargetToAngles(TargetCS, DeltaTime, Ctx, local_13, local_14))
            {
                this.ApplyResolvedAngles(local_13, local_14, DeltaTime, Ctx);
                return;
            }
            this.Solve(TargetCS, DeltaTime, Ctx);
        }
        return;
    }
    void ApplyDamp(const float32 DeltaTime, float32 &inout FinalPitch, float32 &inout FinalYaw)
    {
        if (!(this.bEnableDamp))
        {
            return;
        }
        this.PitchSpring.Update(DeltaTime, FinalPitch);
        FinalPitch = float32(this.PitchSpring.GetPosition());
        this.YawSpring.Update(DeltaTime, FinalYaw);
        FinalYaw = float32(this.YawSpring.GetPosition());
        return;
    }
    float32 ProcessFreeRotateYaw(const float32 RawYaw, float32 &inout InOutPrevWrappedYaw, float32 &inout InOutAccumYaw, bool &inout InOutInitialized)
    {
        ::AimPoseUtils::ProcessYawUnwrapStateless(RawYaw, InOutPrevWrappedYaw, InOutAccumYaw, InOutInitialized);
        if ((InOutAccumYaw > 720.0f || ((InOutAccumYaw < -360.0f))))
        {
            float32 local_5 = 0.0f;
            while (InOutAccumYaw >= 360.0f)
            {
                InOutAccumYaw = (InOutAccumYaw - 360.0f);
                local_5 = local_5 + 360.0f;
            }
            while (InOutAccumYaw < 0.0f)
            {
                InOutAccumYaw = (InOutAccumYaw + 360.0f);
                local_5 = local_5 - 360.0f;
            }
            if (this.bEnableDamp)
            {
                this.YawSpring.Init((this.YawSpring.GetPosition() - local_5), this.YawSpring.GetVelocity());
            }
        }
        return InOutAccumYaw;
    }
    void CacheBoneLengths()
    {
        int local_3;
        if (this.bLengthsCached || this.IsSingleBoneValid() || !(this.IsBoneChainValid()))
        {
            return;
        }
        local_3 = this.BoneChain.GetBoneNum();
        this.BoneLengthRatios.Reset(local_3);
        this.BoneLengthRatios.SetNum(local_3);
        float local_6 = 0.0;
        int local_9 = 0;
        for (; local_9 < local_3; ++local_9)
        {
            if (local_9 == 0)
            {
                this.BoneLengthRatios[local_9] = 0.0;
                continue;
            }
            local_6 = local_6 + (this.BoneChain.GetTransform(local_9).GetLocation() - (this.BoneChain.GetTransform(local_9 - 1)).GetLocation()).Size();
            this.BoneLengthRatios[local_9] = local_6;
        }
        if (local_6 > 9.999999747378752e-5)
        {
            int local_9_2 = 0;
            for (; local_9_2 < local_3; )
            {
                float local_12 = this.BoneLengthRatios[local_9_2];
                local_12 = local_12 / local_6;
                ++local_9_2;
            }
        }
        if (local_3 > 0)
        {
            this.BoneLengthRatios[(local_3 - 1)] = 1.0;
        }
        this.bLengthsCached = true;
        return;
    }
    void DistributeWeightCurve(const float32 FinalPitch, const float32 FinalYaw, const FAimPoseSegmentContext &inout Ctx)
    {
        FQuat local_96;
        int local_113;
        float32 local_120;
        float32 local_126;
        FQuat local_104;
        if (this.IsSingleBoneValid())
        {
            FQuat local_32 = FRotator(FinalPitch, 0.0, 0.0).Quaternion();
            FQuat local_12 = FRotator(0.0, FinalYaw, 0.0).Quaternion();
            FTransform local_64 = FTransform(this.SingleBone.GetTransform());
            if (Ctx.bValid)
            {
                FQuat local_40 = Ctx.AccumulatedDeltaQ.Inverse();
                local_104 = (Ctx.AccumulatedDeltaQ * local_32);
                local_96 = (local_104 * local_40);
                local_64.SetRotation((local_96 * local_64.GetRotation()));
                local_104 = ((Ctx.AccumulatedDeltaQ * local_12) * local_40);
                local_64.SetRotation((local_104 * local_64.GetRotation()));
            }
            else
            {
                local_64.SetRotation((local_32 * local_64.GetRotation()));
                local_64.SetRotation((local_12 * local_64.GetRotation()));
            }
            this.SingleBone.SetTransform(local_64);
            return;
        }
        local_113 = this.BoneChain.GetBoneNum();
        TArray<float32> local_118;
        local_118.SetNum(local_113);
        float32 local_119 = 0.0f;
        int local_121 = 0;
        for (; local_121 < local_113; )
        {
            if (this.bUseExplicitWeights)
            {
                if (local_121 < this.ConfigBoneWeights.Num())
                {
                    local_120 = this.ConfigBoneWeights[local_121];
                }
                else
                {
                    local_120 = 0.0f;
                }
                local_118[local_121] = local_120;
            }
            else
            {
                if (local_121 < this.BoneLengthRatios.Num())
                {
                    local_126 = float32(this.BoneLengthRatios[local_121]);
                }
                else
                {
                    local_120 = (local_121 + 1);
                    local_126 = local_120 / local_113;
                }
                local_118[local_121] = this.RotationRatioCurve.GetFloatValue(local_126, 0.0f);
            }
            if (local_118[local_121] < 0.0f)
            {
                local_118[local_121] = 0.0f;
            }
            local_119 = local_119 + local_118[local_121];
            ++local_121;
        }
        if (FMath::IsNearlyZero(local_119, 1e-8f))
        {
            int local_121_2 = 0;
            for (; local_121_2 < local_113; )
            {
                local_118[local_121_2] = 1.0f;
                ++local_121_2;
            }
            local_119 = local_113;
        }
        if (Ctx.bValid)
        {
            local_104 = Ctx.AccumulatedDeltaQ;
        }
        else
        {
            local_104 = FQuat::Identity;
        }
        if (Ctx.bValid)
        {
            local_96 = Ctx.AccumulatedDeltaQ.Inverse();
        }
        else
        {
            local_96 = FQuat::Identity;
        }
        int local_121_3 = 0;
        for (; local_121_3 < local_113; )
        {
            float32 local_123_2 = local_118[local_121_3];
            local_123_2 = FinalPitch * (local_123_2 / local_119);
            FQuat local_40_2 = FRotator(local_123_2, 0.0, 0.0).Quaternion();
            FTransform local_88 = this.BoneChain.GetTransform(local_121_3);
            if ((Ctx.bValid && (local_121_3 == 0)))
            {
                local_88.SetLocation((Ctx.PivotLocation + (Ctx.AccumulatedDeltaQ.RotateVector((local_88.GetLocation() - Ctx.PivotLocation)))));
            }
            FQuat local_12_2 = (local_104 * local_40_2);
            FQuat local_112_2 = (local_12_2 * local_96);
            local_88.SetRotation((local_112_2 * local_88.GetRotation()));
            this.BoneChain.SetTransform(local_121_3, local_88);
            ++local_121_3;
        }
        int local_121_4 = 0;
        for (; local_121_4 < local_113; )
        {
            local_126 = local_118[local_121_4];
            FQuat local_32_2 = FRotator(0.0, (FinalYaw * (local_126 / local_119)), 0.0).Quaternion();
            FTransform local_64_2 = this.BoneChain.GetTransform(local_121_4);
            FQuat local_40_3 = (local_104 * local_32_2);
            FQuat local_112_3 = (local_40_3 * local_96);
            local_64_2.SetRotation((local_112_3 * local_64_2.GetRotation()));
            this.BoneChain.SetTransform(local_121_4, local_64_2);
            ++local_121_4;
        }
        return;
    }
    void OutputContext(const FQuat &inout PreSolveLastRot, const FVector &inout PreSolvePivot, FAimPoseSegmentContext &inout Ctx)
    {
        FQuat local_32 = (this.GetLastBoneRotation() * PreSolveLastRot.Inverse());
        if (Ctx.bValid)
        {
            Ctx.AccumulatedDeltaQ = (local_32 * Ctx.AccumulatedDeltaQ);
        }
        else
        {
            Ctx.AccumulatedDeltaQ = local_32;
        }
        Ctx.PivotLocation = PreSolvePivot;
        Ctx.bValid = true;
        return;
    }
}


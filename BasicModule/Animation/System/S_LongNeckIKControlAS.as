

class US_LongNeckIKControlAS : UECSScriptSystem
{
    US_LongNeckIKControlAS()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    void CalculateYawAndPitch(const FVector &inout C_LookAtTarget, const float32 DefaultHeight, float32 &inout Yaw, float32 &inout Pitch) const
    {
        FVector local_12 = FVector(C_LookAtTarget.X, C_LookAtTarget.Y, 0.0);
        Yaw = float32((FMath::RadiansToDegrees(FMath::Atan2((C_LookAtTarget.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector).Y), (C_LookAtTarget.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector).X)))));
        Pitch = float32((FMath::RadiansToDegrees(FMath::Atan2(((C_LookAtTarget - FVector(0.0, 0.0, DefaultHeight)).Z), local_12.Size()))));
        return;
    }
    FTransform ComputeOffsetTransform(const FC_Transform &inout Transform, const FC_Collision &inout Collision, const FC_LongNeckIKConfig &inout Config) const
    {
        FTransform local_48 = Transform.ToFTransform();
        float32 local_49 = -Collision.GetScaledHalfHeight();
        local_48.AddToTranslation(FVector(0.0, 0.0, local_49));
        FVector local_82 = (local_48.GetRotation().GetForwardVector() * Config.OffsetDistance);
        FTransform local_108 = local_48;
        local_108.AddToTranslation(local_82);
        return local_108;
    }
    bool ClampYawPitch(const FC_LongNeckIKConfig &inout Config, float32 &inout Yaw, float32 &inout Pitch) const
    {
        bool local_1 = false;
        if (FMath::Abs(Yaw) < Config.YawFailureMax)
        {
            Yaw = FMath::Clamp(Yaw, -Config.YawClampMax, Config.YawClampMax);
        }
        else
        {
            local_1 = true;
        }
        if (Pitch > Config.PitchFailureDown || (Pitch < Config.PitchFailureUp))
        {
            Pitch = FMath::Clamp(Pitch, Config.PitchClampDown, Config.PitchClampUp);
        }
        else
        {
            local_1 = true;
        }
        return local_1;
    }
    FVector ApplyLimitRadiusRestriction(const FC_LongNeckIKConfig &inout Config, const FTransform &inout OffsetTransform, FVector &inout C_LookAtTarget, float32 &inout Yaw) const
    {
        FVector local_6 = C_LookAtTarget;
        float32 local_8 = Config.LimitRadius - 300.0f;
        float32 local_10 = 300.0f;
        float local_12 = local_6.Size();
        if (local_12 <= Config.LimitRadius)
        {
            float32 local_9 = Config.LimitRadius * Config.LimitRadius;
            float local_18 = local_9;
            float local_14 = local_6.Y * local_6.Y;
            float local_12_2 = local_18 - local_14;
            local_14 = FMath::Sqrt(local_12_2);
            float local_12_3 = FMath::Sign(local_6.X);
            local_6.X = (local_14 * local_12_3);
            if (FMath::Abs(Yaw) >= Config.YawClampMax)
            {
                FVector local_26 = local_6;
                FVector local_32(OffsetTransform.GetRotation().GetRightVector());
                local_26.Normalize(9.99999993922529e-9);
                float local_12_4 = FMath::Abs(local_26.DotProduct(local_32));
                Yaw = (Yaw * float32(local_12_4));
            }
            float local_12_5 = local_6.X;
            local_6.X = FMath::Abs(local_12_5);
            local_14 = local_10;
            local_6.X = FMath::Max(local_6.X, local_14);
            if (local_6.Size() > 1.0)
            {
                local_14 = local_6.Size();
                local_6 = ((local_6 * Config.LimitRadius) / local_14);
            }
            else
            {
                float local_12_7 = local_6.Z;
                local_6 = FVector(Config.LimitRadius, 0.0, local_12_7);
            }
            float local_12_8 = C_LookAtTarget.Size();
            if (local_12_8 >= local_8)
            {
                float local_12_9 = C_LookAtTarget.Size() - local_8;
                local_14 = local_12_9 / (Config.LimitRadius - local_8);
                local_9 = float32(local_14);
                C_LookAtTarget.X = FMath::Max(C_LookAtTarget.X, local_10);
                local_18 = local_9;
                C_LookAtTarget = FMath::Lerp(local_6, C_LookAtTarget, local_18);
            }
            else
            {
                C_LookAtTarget = local_6;
            }
        }
        float local_12_11 = C_LookAtTarget.X;
        C_LookAtTarget.X = FMath::Max(local_12_11, local_10);
        return C_LookAtTarget;
    }
    UFUNCTION()
    void Job_LongNeckIKControl(const FECSEntity &inout Entity, FC_LongNeckIKControl &inout LongNeckIKControl, const FC_LongNeckIKConfig &inout LongNeckIKConfig, const FC_Transform &inout Transform, const FC_Collision &inout Collision) const
    {
        int local_18 = 0;
        float32 local_1 = LongNeckIKControl.GetTargetWeight();
        if (local_1 == 0.0f && ((LongNeckIKControl.GetWeight() == 0.0f)))
        {
            return;
        }
        bool local_5 = false;
        FVector local_12(FVector::ZeroVector);
        if (local_18 && local_18.GetbCachedValidLockTargetPosition())
        {
            local_12 = local_18.GetLogicLockTargetPosition();
            local_12.Z -= (local_18.GetTargetEntity().GetCollisionHeight() / 2.0f);
        }
        else
        {
            Get local_26;
            const FC_AniParamSampleTrajectory& local_28 = local_26.opCall();
            if (local_28)
            {
                local_12 = local_28.GetData().GetLookAtPoint();
            }
            else
            {
                local_5 = true;
            }
        }
        if (local_5)
        {
            float32 local_2_2 = 0.0f;
            float32 local_1_3 = LongNeckIKControl.GetWeight();
            LongNeckIKControl.SetWeight(FMath::Lerp(local_1_3, local_2_2, LongNeckIKConfig.WeightLerpSpeed));
            return;
        }
        FTransform local_80 = this.ComputeOffsetTransform(Transform, Collision, LongNeckIKConfig);
        FVector local_92 = local_80.InverseTransformPosition(local_12);
        float32 local_93 = 0.0f;
        float32 local_94 = 0.0f;
        this.CalculateYawAndPitch(local_92, LongNeckIKConfig.DefaultHeight, local_93, local_94);
        bool local_5_2 = this.ClampYawPitch(LongNeckIKConfig, local_93, local_94);
        local_92 = this.ApplyLimitRadiusRestriction(LongNeckIKConfig, local_80, local_92, local_93);
        float32 local_95 = 0.0f;
        float32 local_96 = 0.0f;
        this.CalculateYawAndPitch(local_92, LongNeckIKConfig.DefaultHeight, local_95, local_96);
        this.LerpControlParameters(LongNeckIKControl, LongNeckIKConfig, local_80.TransformPosition(local_92), local_95, local_96, local_5_2);
        return;
    }
    void LerpControlParameters(FC_LongNeckIKControl &inout Control, const FC_LongNeckIKConfig &inout Config, const FVector &inout LookAtTarget, const float32 Yaw, const float32 Pitch, const bool LookAtTargetFailure) const
    {
        if (LookAtTargetFailure)
        {
            float32 local_2 = Control.GetWeight();
            Control.SetWeight(FMath::Lerp(local_2, 0.0f, Config.WeightLerpSpeed));
        }
        else
        {
            float32 local_2_2 = FMath::Lerp(Control.GetWeight(), Control.GetTargetWeight(), Config.WeightLerpSpeed);
            Control.SetWeight(local_2_2);
        }
        if ((!((FVector(Control.GetLookAtTarget()) == LookAtTarget))))
        {
            Control.SetLookAtTarget(FMath::Lerp(Control.GetLookAtTarget(), LookAtTarget, Control.GetLookAtTargetLerpSpeed()));
        }
        if (Control.GetYaw() != Yaw)
        {
            float32 local_3 = Control.GetLookAtTargetLerpSpeed();
            float32 local_2_3 = Control.GetYaw();
            Control.SetYaw(FMath::Lerp(local_2_3, Yaw, local_3));
        }
        if (Control.GetPitch() != Pitch)
        {
            float32 local_2_4 = FMath::Lerp(Control.GetPitch(), Pitch, Control.GetLookAtTargetLerpSpeed());
            Control.SetPitch(local_2_4);
        }
        float32 local_3_2 = Control.GetHeadTwistDecoWeight();
        float32 local_2_5 = Control.GetTargetHeadTwistDecoWeight();
        if (local_3_2 != local_2_5)
        {
            local_2_5 = Control.GetLookAtTargetLerpSpeed();
            Control.SetHeadTwistDecoWeight(FMath::Lerp(Control.GetHeadTwistDecoWeight(), Control.GetTargetHeadTwistDecoWeight(), local_2_5));
        }
        float32 local_1 = Control.GetTargetNeckRootTangentIntensity();
        local_2_5 = Control.GetYaw();
        local_2_5 = FMath::Abs(local_2_5) / Config.YawClampMax;
        local_2_5 = local_1 * (local_2_5 + 1.0f);
        if (Control.GetNeckRootTangentIntensity() != local_2_5)
        {
            Control.SetNeckRootTangentIntensity(FMath::Lerp(Control.GetNeckRootTangentIntensity(), local_2_5, Control.GetTangentIntensityLerpSpeed()));
        }
        float32 local_17 = Control.GetTargetNeckTailTangentIntensity() * ((FMath::Abs(Control.GetYaw()) / Config.YawClampMax) + 1.0f);
        if (Control.GetNeckTailTangentIntensity() != local_17)
        {
            Control.SetNeckTailTangentIntensity(FMath::Lerp(Control.GetNeckTailTangentIntensity(), local_17, Control.GetTangentIntensityLerpSpeed()));
        }
        return;
    }
    void DrawDebugVisualization(const FTransform &inout OffsetTransform, const FVector &inout LookAtTarget, const float32 LimitRadius) const
    {
        float32 local_2 = LimitRadius - 300.0f;
        FECSDebugDraw::DrawDebugSphere(n"LongNeck", OffsetTransform.GetLocation(), LimitRadius, 12, FColor::Yellow, FColor::Yellow, 0.2f, uint8(0), 5.0f);
        FECSDebugDraw::DrawDebugSphere(n"LongNeck", OffsetTransform.GetLocation(), local_2, 12, FColor::Green, FColor::Green, 0.2f, uint8(0), 5.0f);
        FECSDebugDraw::DrawDebugSphere(n"LongNeck", LookAtTarget, 30.0f, 12, FColor::Yellow, FColor::Yellow, 0.2f, uint8(0), 5.0f);
        return;
    }
    UFUNCTION()
    void Run_Job_LongNeckIKControl() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_50 = 0;
        int local_56 = 0;
        MarkModifiedIfDirty local_64;
        int local_200 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_LongNeckIKControl(local_36, local_38, local_44, local_50, local_56);
                local_64.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_102 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Exclude(local_102).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_128 = 0;
        FECSRuntimeViewIterator local_162 = local_102.Iterator();
        for (; local_162.CanProceed;)
        {
            local_36 = local_162.Proceed();
            ++local_128;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_LongNeckIKControl(local_200, local_38, local_44, local_50, local_56);
            local_64.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_128);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}




class US_HeadControlSystemAS : UECSScriptSystem
{
    US_HeadControlSystemAS()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    float32 CalculateBodyCurvingRad(const float32 v, const float32 AngularVelocityYaw) const
    {
        float32 local_4;
        float32 local_2 = FMath::DegreesToRadians(AngularVelocityYaw);
        if (v > 0.0f)
        {
            local_4 = local_2 / v;
        }
        else
        {
            local_4 = 0.0f;
        }
        return local_4;
    }
    UFUNCTION()
    void Job_BendingCalculation(const FECSEntity &inout Entity, FC_BodyCurve &inout BodyCurve, const FC_Rigidbody &inout Rigidbody, const FC_RigidbodyHistory &inout RigidbodyHistory, const FCS_FixedTime &inout FixedTime) const
    {
        BodyCurve.SetBodyCurving0(this.CalculateBodyCurvingRad(float32(Rigidbody.GetVelocity().Size2D()), float32(Rigidbody.GetAngularVelocity().Yaw)));
        FRigidbodyHistoryData local_20;
        RigidbodyHistory.GetInterpoValue((FFPTime(FixedTime.Time) - 0.2), local_20);
        BodyCurve.SetBodyCurving1(this.CalculateBodyCurvingRad(float32(local_20.Velocity.Size2D()), float32(local_20.AngularVelocity.Yaw)));
        return;
    }
    UFUNCTION()
    void Job_HeadControl(const FECSEntity &inout Entity, const FC_HeadControl &inout HeadControlConfig, FC_AnimHeadControlData &inout HeadControlData) const
    {
        float32 local_1 = 0.0f;
        Get local_6;
        const FC_LockTarget& local_8 = local_6.opCall();
        if (local_8)
        {
            if (local_8.GetbCachedValidLockTargetPosition())
            {
                Get local_20;
                HeadControlData.SetFocusPosition((FVector(local_20.opCall().GetLogicLockTargetPosition()) + FVector(0.0, 0.0, 60.0)));
                local_1 = HeadControlData.GetTargetControlWeight();
            }
            else
            {
                local_1 = 0.0f;
            }
        }
        else
        {
            Get local_48;
            const FC_AniParamSampleTrajectory& local_50 = local_48.opCall();
            if (local_50)
            {
                HeadControlData.SetFocusPosition(local_50.GetData().GetLookAtPoint());
                local_1 = HeadControlData.GetTargetControlWeight();
            }
        }
        HeadControlData.SetHeadControlWeight(FMath::Lerp(HeadControlData.GetHeadControlWeight(), local_1, HeadControlConfig.LerpSpeed));
        if (FMath::Abs((HeadControlData.GetHeadControlWeight() - local_1)) < 0.01f)
        {
            HeadControlData.SetHeadControlWeight(local_1);
        }
        return;
    }
    UFUNCTION()
    void Job_AssignIdleHeadControl(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime) const
    {
        if (ECS::GetRuntimeInfo().IsClient && !(FixedTime.bClientSingularTick))
        {
            return;
        }
        FC_AnimIdleHeadControl local_14;
        Assign local_6;
        local_6.opCall(local_14);
        return;
    }
    UFUNCTION()
    void Job_RemoveIdleHeadControl(const FECSEntity &inout Entity, FC_AnimIdleHeadControl &inout HeadControl, const FCS_FixedTime &inout FixedTime) const
    {
        if (ECS::GetRuntimeInfo().IsClient && !(FixedTime.bClientSingularTick))
        {
            return;
        }
        if (HeadControl.Weight > 0.0f)
        {
            return;
        }
        Get local_8;
        const FC_AnimIdleHeadControlHistory& local_10 = local_8.opCall();
        if (local_10)
        {
            TInterpoHistory<FC_AnimIdleHeadControl, auto> local_12 = local_10.History;
            if (local_12.Num() > 0 && (local_12.PeekBack(0).GetData().Weight <= 0.0f))
            {
                Remove local_18;
                local_18.opCall();
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateIdleHeadControl(const FECSEntity &inout Entity, FC_AnimIdleHeadControl &inout HeadControl, const FC_Transform &inout Transform, const FC_AnimUseIdleHeadControlConfig &inout HeadControlConfig, const FC_AnimAimTargetControl &inout AimTargetControl) const
    {
        if (!(AimTargetControl.GetbDataValid()) || !(Entity.MatchGameplayTag(GameplayTags::ESM_Enable_HeadControl)))
        {
            return;
        }
        FVector local_8 = Transform.GetRotation().RotateVector(AimTargetControl.GetAimTarget().GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector));
        float32 local_24 = FMath::RadiansToDegrees(FMath::Asin(FMath::Clamp(float32(local_8.Z), -1.0f, 1.0f)));
        if (FMath::Abs(local_24) > HeadControlConfig.GetEnableMaxVerticalAngle())
        {
            return;
        }
        float32 local_28 = local_24;
        FVector local_22 = Transform.GetRotation().GetForwardVector();
        FVector local_52 = FVector(local_22.X, local_22.Y, 0.0).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        FVector local_40 = FVector(local_8.X, local_8.Y, 0.0).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        float32 local_59 = FMath::RadiansToDegrees(FMath::Acos(FMath::Clamp(float32(local_52.DotProduct(local_40)), -1.0f, 1.0f)));
        float32 local_25 = FMath::Abs(local_59);
        if (local_25 > HeadControlConfig.GetEnableMaxHorizontalAngle())
        {
            return;
        }
        if (local_52.CrossProduct(local_40).Z > 0.0)
        {
            local_25 = local_59;
        }
        else
        {
            local_25 = -local_59;
        }
        HeadControl.Weight = 1.0f;
        HeadControl.HorizontalAngleSigned = (local_25 * HeadControlConfig.GetHorizontalAngleSignedScale());
        HeadControl.VerticalAngleSigned = (local_28 * HeadControlConfig.GetVerticalAngleSignedScale());
        float32 local_67_3 = -HeadControlConfig.GetClampMaxHorizontalAngle();
        float32 local_60_2 = FMath::Clamp(local_25, local_67_3, HeadControlConfig.GetClampMaxHorizontalAngle());
        float32 local_26 = HeadControlConfig.GetHorizontalAngleSignedScale();
        HeadControl.ClampHorizontalAngleSigned = (local_60_2 * local_26);
        float32 local_26_2 = -HeadControlConfig.GetClampMaxVerticalAngle();
        local_60_2 = FMath::Clamp(local_28, local_26_2, HeadControlConfig.GetClampMaxVerticalAngle());
        HeadControl.ClampVerticalAngleSigned = (local_60_2 * HeadControlConfig.GetVerticalAngleSignedScale());
        HeadControl.BlendInTime = HeadControlConfig.GetBlendInTime();
        HeadControl.BlendOutTime = HeadControlConfig.GetBlendOutTime();
        return;
    }
    UFUNCTION()
    void Run_Job_BendingCalculation() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        MarkModifiedIfDirty local_62;
        int local_194 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_BendingCalculation(local_40, local_42, local_48, local_54, local_6);
                local_62.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_100 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Include local_116;
        local_116.opCall();
        Exclude(local_100).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_122 = 0;
        FECSRuntimeViewIterator local_156 = local_100.Iterator();
        for (; local_156.CanProceed;)
        {
            local_40 = local_156.Proceed();
            ++local_122;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_BendingCalculation(local_194, local_42, local_48, local_54, local_6);
            local_62.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_122);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HeadControl() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        MarkModifiedIfDirty local_52;
        int local_180 = 0;
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
                this.Job_HeadControl(local_36, local_38, local_44);
                local_52.opCall(local_44);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Exclude(local_90).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_90.Iterator();
        for (; local_142.CanProceed;)
        {
            local_36 = local_142.Proceed();
            ++local_108;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_HeadControl(local_180, local_38, local_44);
            local_52.opCall(local_44);
        }
        local_2.UpdateCachedEntityCount(local_108);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_AssignIdleHeadControl() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_164 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_AssignIdleHeadControl(local_40, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_78 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_82;
        local_82.opCall();
        Exclude(local_78).opCall();
        Exclude(local_78).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_92 = 0;
        FECSRuntimeViewIterator local_126 = local_78.Iterator();
        for (; local_126.CanProceed;)
        {
            local_40 = local_126.Proceed();
            ++local_92;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_AssignIdleHeadControl(local_164, local_6);
        }
        local_4.UpdateCachedEntityCount(local_92);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_RemoveIdleHeadControl() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_174 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_RemoveIdleHeadControl(local_40, local_42, local_6);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Exclude(local_88).opCall();
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_88.Iterator();
        for (; local_136.CanProceed;)
        {
            local_40 = local_136.Proceed();
            ++local_102;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_RemoveIdleHeadControl(local_174, local_42, local_6);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateIdleHeadControl() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_50 = 0;
        int local_56 = 0;
        MarkModifiedIfDirty local_64;
        int local_196 = 0;
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
                this.Job_UpdateIdleHeadControl(local_36, local_38, local_44, local_50, local_56);
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
        Exclude(local_102).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_124 = 0;
        FECSRuntimeViewIterator local_158 = local_102.Iterator();
        for (; local_158.CanProceed;)
        {
            local_36 = local_158.Proceed();
            ++local_124;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_UpdateIdleHeadControl(local_196, local_38, local_44, local_50, local_56);
            local_64.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_124);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}


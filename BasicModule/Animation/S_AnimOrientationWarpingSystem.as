

class US_AnimOrientationWarpingSystem : UECSScriptSystem
{
    US_AnimOrientationWarpingSystem()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    UFUNCTION()
    void Job_UpdateOrientationWarpingAlpha(const FECSEntity &inout Entity, FC_CharacterGroundMovementInfo &inout CharacterGroundMovementInfo, const FC_AnimPostProcessEnable &inout AnimPostProcessEnable, const FCS_FixedTime &inout FixedTime) const
    {
        float32 local_1;
        float32 local_2;
        float32 local_3;
        local_2 = CharacterGroundMovementInfo.GetOrientationWarpingAlpha();
        local_1 = local_2;
        if (!(AnimPostProcessEnable.GetbEnableOrientationWarping()))
        {
            local_3 = 0.0f;
        }
        else
        {
            FVector local_16(CharacterGroundMovementInfo.GetAcceleration());
            if (local_16.IsNearlyZero(9.999999747378752e-5) || FVector(CharacterGroundMovementInfo.GetVelocity()).IsNearlyZero(9.999999747378752e-5))
            {
                local_3 = 0.0f;
            }
            else
            {
                float32 local_23;
                float32 local_22;
                float32 local_21 = FMath::Abs(CharacterGroundMovementInfo.GetMoveDeltaRotationYaw());
                local_22 = CharacterGroundMovementInfo.GetOrientationWarpingFullAngle();
                local_23 = CharacterGroundMovementInfo.GetOrientationWarpingZeroAngle();
                float32 local_26 = 1.0f;
                local_2 = local_21 - local_22;
                float32 local_20 = local_23 - local_22;
                local_2 = local_2 / local_20;
                local_3 = local_26 - FMath::Clamp(local_2, 0.0f, 1.0f);
            }
        }
        if (local_3 > local_1)
        {
            local_2 = CharacterGroundMovementInfo.GetOrientationWarpingIncreaseSpeed();
        }
        else
        {
            local_2 = CharacterGroundMovementInfo.GetOrientationWarpingDecreaseSpeed();
        }
        CharacterGroundMovementInfo.SetOrientationWarpingAlpha(FMath::FInterpTo(local_1, local_3, float32(FixedTime.DeltaTime.ToSeconds()), local_2));
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateOrientationWarpingAlpha() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_184 = 0;
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
                this.Job_UpdateOrientationWarpingAlpha(local_40, local_42, local_48, local_6);
                FECSEntity::MarkModifiedIfDirty<FC_CharacterGroundMovementInfo> local_56;
                local_56.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Exclude(local_94).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_112 = 0;
        FECSRuntimeViewIterator local_146 = local_94.Iterator();
        for (; local_146.CanProceed;)
        {
            local_40 = local_146.Proceed();
            ++local_112;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_UpdateOrientationWarpingAlpha(local_184, local_42, local_48, local_6);
            FECSEntity::MarkModifiedIfDirty<FC_CharacterGroundMovementInfo>(local_40).opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_112);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
}


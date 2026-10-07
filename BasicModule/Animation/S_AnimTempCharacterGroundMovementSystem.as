

class US_CharacterGroundMovementSystemAS : UECSScriptSystem
{
    US_CharacterGroundMovementSystemAS()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    UFUNCTION()
    void Job_UpdateCharacterGroundMovement(const FECSEntity &inout Entity, FC_CharacterGroundMovementInfo &inout CharacterGroundMovementInfo, const FC_CharacterMovementControl &inout CharacterMovementControl, const FC_CharacterPoseState &inout CharacterPoseState, const FC_Transform &inout Transform, const FCS_FixedTime &inout FixedTime) const
    {
        int local_48;
        float32 local_50;
        float32 local_51;
        FVector local_6 = CharacterMovementControl.GetInternalVelocity();
        FVector local_12 = CharacterMovementControl.GetMovementInput();
        float32 local_17 = float32(local_6.Size2D());
        float32 local_13 = float32(((local_12.ToOrientationRotator() - local_6.ToOrientationRotator()).GetNormalized().Yaw));
        CharacterGroundMovementInfo.SetVelocity(local_6);
        CharacterGroundMovementInfo.SetMoveSpeed(local_17);
        CharacterGroundMovementInfo.SetAcceleration(local_12);
        CharacterGroundMovementInfo.SetMoveDeltaRotationYaw(local_13);
        CharacterGroundMovementInfo.SetTransformForwardVector(Transform.GetRotation().GetForwardVector());
        if (!(local_6.IsNearlyZero(9.999999747378752e-5)))
        {
            CharacterGroundMovementInfo.SetLastNonZeroVelocity(local_6);
        }
        int local_45 = 0;
        int local_44 = local_45;
        if (!(local_12.IsNearlyZero(9.999999747378752e-5)))
        {
            if (Entity.MatchGameplayTag(GameplayTags::ESM_MotionFlag_MoveDirection_B))
            {
                int local_45_2 = 1;
                local_44 = local_45_2;
            }
            else
            {
                if (Entity.MatchGameplayTag(GameplayTags::ESM_MotionFlag_MoveDirection_LL))
                {
                    int local_45_3 = 2;
                    local_44 = local_45_3;
                }
                else
                {
                    if (Entity.MatchGameplayTag(GameplayTags::ESM_MotionFlag_MoveDirection_LR))
                    {
                        int local_45_4 = 3;
                        local_44 = local_45_4;
                    }
                    else
                    {
                        if (Entity.MatchGameplayTag(GameplayTags::ESM_MotionFlag_MoveDirection_RL))
                        {
                            int local_45_5 = 4;
                            local_44 = local_45_5;
                        }
                        else
                        {
                            if (Entity.MatchGameplayTag(GameplayTags::ESM_MotionFlag_MoveDirection_RR))
                            {
                                int local_45_6 = 5;
                                local_44 = local_45_6;
                            }
                        }
                    }
                }
            }
        }
        CharacterGroundMovementInfo.SetMoveDirection(EMoveDirection(local_44));
        if (CharacterPoseState.GetKeepStrafeCounter() >= 1)
        {
            int local_49;
            local_49 = 1;
            local_48 = local_49;
        }
        else
        {
            int local_49;
            local_49 = 0;
            local_48 = local_49;
        }
        CharacterGroundMovementInfo.SetRotationMode(ERotationMode(local_48));
        CharacterGroundMovementInfo.SetbIsMoving(!(local_12.IsNearlyZero(9.999999747378752e-5)));
        local_50 = CharacterGroundMovementInfo.GetPivotSpeedMin();
        local_51 = CharacterGroundMovementInfo.GetPivotSpeedMax();
        bool local_43 = (local_17 >= local_50) && (local_17 <= local_51);
        float32 local_18_3 = FMath::Lerp(CharacterGroundMovementInfo.GetPivotAngleAtMinSpeed(), CharacterGroundMovementInfo.GetPivotAngleAtMaxSpeed(), FMath::Clamp(((local_17 - local_50) / (local_51 - local_50)), 0.0f, 1.0f));
        CharacterGroundMovementInfo.SetbIsPivoting(local_43 && (FMath::Abs(local_13) >= local_18_3));
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateCharacterGroundMovement() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        MarkModifiedIfDirty local_68;
        int local_204 = 0;
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
                this.Job_UpdateCharacterGroundMovement(local_40, local_42, local_48, local_54, local_60, local_6);
                local_68.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_106 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Include local_126;
        local_126.opCall();
        Exclude(local_106).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_132 = 0;
        FECSRuntimeViewIterator local_166 = local_106.Iterator();
        for (; local_166.CanProceed;)
        {
            local_40 = local_166.Proceed();
            ++local_132;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_UpdateCharacterGroundMovement(local_204, local_42, local_48, local_54, local_60, local_6);
            local_68.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_132);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
}


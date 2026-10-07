

class US_FootLockSystemAS : UECSScriptSystem
{
    US_FootLockSystemAS()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    UFUNCTION()
    void Job_UpdateFootLock(const FECSEntity &inout Entity, const FC_CharacterGroundMovementInfo &inout CharacterGroundMovementInfo, FC_CharacterFootLockInfo &inout FootLockInfo, const FCS_FixedTime &inout FixedTime) const
    {
        float local_4 = FixedTime.DeltaTime.ToSeconds();
        float32 local_5 = float32(local_4);
        FVector local_12(CharacterGroundMovementInfo.GetAcceleration());
        FVector local_24 = local_12.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        FVector local_30(FootLockInfo.GetPrevAccelerationDir());
        bool local_31 = false;
        if (!(local_24.IsNearlyZero(9.999999747378752e-5)))
        {
            float32 local_54;
            if (!(local_30.IsNearlyZero(9.999999747378752e-5)))
            {
                float local_4_2 = (local_24.ToOrientationRotator() - local_30.ToOrientationRotator()).GetNormalized().Yaw;
                if (FMath::Abs(float32(local_4_2)) > FootLockInfo.GetFootLockInputChangeAngle())
                {
                    local_31 = true;
                    local_54 = FootLockInfo.GetFootLockDirStableTime();
                    if (local_54 > 0.0f && (local_54 < FootLockInfo.GetFootLockQuickChangeThreshold()))
                    {
                        FootLockInfo.SetFootLockInputChangeCooldown(FootLockInfo.GetFootLockInputChangeDuration());
                    }
                    FootLockInfo.SetFootLockDirStableTime(0.0f);
                }
            }
            FootLockInfo.SetPrevAccelerationDir(local_24);
        }
        else
        {
            if (FootLockInfo.GetFootLockInputChangeCooldown() <= 0.0f && local_24.IsNearlyZero(9.999999747378752e-5))
            {
                FootLockInfo.SetPrevAccelerationDir(FVector::ZeroVector);
            }
        }
        if (!(local_31))
        {
            FootLockInfo.SetFootLockDirStableTime(FootLockInfo.GetFootLockDirStableTime() + local_5);
        }
        FootLockInfo.SetFootLockInputChangeCooldown(FMath::Max((FootLockInfo.GetFootLockInputChangeCooldown() - local_5), 0.0f));
        if (FootLockInfo.GetbOverrideFootLockAlpha())
        {
            FootLockInfo.SetFootLockAlpha(FootLockInfo.GetOverrideFootLockAlpha());
        }
        else
        {
            if (FootLockInfo.GetFootLockInputChangeCooldown() > 0.0f)
            {
                FootLockInfo.SetFootLockAlpha(FMath::FInterpTo(FootLockInfo.GetFootLockAlpha(), 0.0f, local_5, FootLockInfo.GetFootLockDecreaseSpeed()));
            }
            else
            {
                if (FootLockInfo.GetFootLockAlpha() < 1.0f)
                {
                    FootLockInfo.SetFootLockAlpha(FMath::FInterpTo(FootLockInfo.GetFootLockAlpha(), 1.0f, local_5, FootLockInfo.GetFootLockRecoverSpeed()));
                }
            }
        }
        if ((((!(local_24.IsNearlyZero(9.999999747378752e-5)) && local_30.IsNearlyZero(9.999999747378752e-5)) || local_31) && (FootLockInfo.GetStopStartTransitionCooldown() <= 0.0f)) && (FootLockInfo.GetStopStartCheckTimer() <= 0.0f))
        {
            FootLockInfo.SetStopStartCheckTimer((local_5 * 2.0f) + 0.3f);
        }
        if (CharacterGroundMovementInfo.GetbIsMoving() && (FootLockInfo.GetStopStartCheckTimer() <= 0.0f))
        {
            FootLockInfo.SetLastMovingMoveDirection(CharacterGroundMovementInfo.GetMoveDirection());
        }
        if (FootLockInfo.GetStopStartCheckTimer() > 0.0f)
        {
            FootLockInfo.SetStopStartCheckTimer((FootLockInfo.GetStopStartCheckTimer() - local_5));
            if (FootLockInfo.GetStopStartCheckTimer() <= 0.3f)
            {
                bool local_66;
                bool local_62;
                EMoveDirection local_61;
                EMoveDirection local_60;
                int local_59_2 = int(FootLockInfo.GetLastMovingMoveDirection());
                local_60 = EMoveDirection(local_59_2);
                local_59_2 = int(CharacterGroundMovementInfo.GetMoveDirection());
                local_61 = EMoveDirection(local_59_2);
                bool local_58 = (int(local_60) == 2) || (int(local_60) == 3);
                local_62 = (int(local_60) == 4) || (int(local_60) == 5);
                local_66 = false;
                if ((local_58 && (int(local_61) == 0)))
                {
                    local_66 = true;
                }
                if ((local_58 && (int(local_61) == 1)))
                {
                    local_66 = true;
                }
                if ((local_62 && (int(local_61) == 0)))
                {
                    local_66 = true;
                }
                if ((local_62 && (int(local_61) == 1)))
                {
                    local_66 = true;
                }
                if (local_66)
                {
                    FootLockInfo.SetStopStartTransitionCooldown(FootLockInfo.GetStopStartTransitionDuration());
                    FootLockInfo.SetStopStartCheckTimer(0.0f);
                }
            }
        }
        FootLockInfo.SetStopStartTransitionCooldown(FMath::Max((FootLockInfo.GetStopStartTransitionCooldown() - local_5), 0.0f));
        if (FootLockInfo.GetStopStartTransitionCooldown() > 0.0f)
        {
            FootLockInfo.SetStopStartTransitionAlpha(FMath::FInterpTo(FootLockInfo.GetStopStartTransitionAlpha(), 0.0f, local_5, FootLockInfo.GetStopStartTransitionDecreaseSpeed()));
        }
        else
        {
            if (FootLockInfo.GetStopStartTransitionAlpha() < 1.0f)
            {
                FootLockInfo.SetStopStartTransitionAlpha(FMath::FInterpTo(FootLockInfo.GetStopStartTransitionAlpha(), 1.0f, local_5, FootLockInfo.GetStopStartTransitionRecoverSpeed()));
            }
        }
        FVector local_18 = FCharacterInputUtils::GetLocalMoveInput(Entity, FixedTime.Time, FixedTime.DeltaTime);
        float32 local_53 = FootLockInfo.GetLastLocalMovementInputAngle();
        if (!(local_18.IsNearlyZero(9.999999747378752e-5)))
        {
            float local_4_3 = local_18.ToOrientationRotator().Yaw;
            local_53 = float32(local_4_3);
        }
        FNameHandle_EntityBBVarFloat local_76;
        local_76;
        float32 local_56_2 = Entity.GetBB_Float(local_76);
        if (!(FootLockInfo.GetbLocalMovementInputAngleInitialized()))
        {
            FootLockInfo.SetPrevLocalMovementInputAngle(local_53);
            FootLockInfo.SetLastLocalMovementInputAngle(local_53);
            FootLockInfo.SetPendingLocalMovementInputAngle(local_53);
            FootLockInfo.SetPendingLocalMovementInputAngleDuration(0.0f);
            FootLockInfo.SetLocalMovementInputAngleDelta(0.0f);
            FootLockInfo.SetFramePrevLocalMovementInputAngle(local_56_2);
            FootLockInfo.SetLocalMovementInputAngleFrameDelta(0.0f);
            FootLockInfo.SetbLocalMovementInputAngleInitialized(true);
        }
        else
        {
            float32 local_54;
            float32 local_77;
            local_77 = FootLockInfo.GetLastLocalMovementInputAngle();
            if (!(FMath::IsNearlyEqual(FootLockInfo.GetPendingLocalMovementInputAngle(), local_53, 0.01f)))
            {
                FootLockInfo.SetPendingLocalMovementInputAngle(local_53);
                FootLockInfo.SetPendingLocalMovementInputAngleDuration(0.0f);
            }
            else
            {
                if (FootLockInfo.GetPendingLocalMovementInputAngleDuration() < FootLockInfo.GetLocalMovementInputAngleChangeWindow())
                {
                    local_54 = FootLockInfo.GetPendingLocalMovementInputAngleDuration() + local_5;
                    FootLockInfo.SetPendingLocalMovementInputAngleDuration(local_54);
                }
            }
            if (FootLockInfo.GetPendingLocalMovementInputAngleDuration() >= FootLockInfo.GetLocalMovementInputAngleChangeWindow())
            {
                FootLockInfo.SetPrevLocalMovementInputAngle(local_77);
            }
            FootLockInfo.SetLastLocalMovementInputAngle(local_53);
            float32 local_1_3 = local_53 - FootLockInfo.GetPrevLocalMovementInputAngle();
            if (local_1_3 > 180.0f)
            {
                local_1_3 = local_1_3 - 360.0f;
            }
            if (local_1_3 < -180.0f)
            {
                local_1_3 = local_1_3 + 360.0f;
            }
            FootLockInfo.SetLocalMovementInputAngleDelta(FMath::Abs(local_1_3));
        }
        float32 local_33_2 = local_56_2 - FootLockInfo.GetFramePrevLocalMovementInputAngle();
        if (local_33_2 > 180.0f)
        {
            local_33_2 = local_33_2 - 360.0f;
        }
        if (local_33_2 < -180.0f)
        {
            local_33_2 = local_33_2 + 360.0f;
        }
        FootLockInfo.SetLocalMovementInputAngleFrameDelta(FMath::Abs(local_33_2));
        FootLockInfo.SetFramePrevLocalMovementInputAngle(local_56_2);
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateFootLock() const
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
                this.Job_UpdateFootLock(local_40, local_42, local_48, local_6);
                FECSEntity::MarkModifiedIfDirty<FC_CharacterFootLockInfo> local_56;
                local_56.opCall(local_48);
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
            this.Job_UpdateFootLock(local_184, local_42, local_48, local_6);
            FECSEntity::MarkModifiedIfDirty<FC_CharacterFootLockInfo>(local_40).opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_112);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
}


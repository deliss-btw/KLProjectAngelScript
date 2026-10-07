
const FConsoleVariable CVar_AnimData_DesiredMoveDirRelativeToBodySmoothedMax = FConsoleVariable();

class US_AnimDataSystemAS : UECSScriptSystem
{
    US_AnimDataSystemAS()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    float32 CalculateElapsedTime(const FFPTime &inout ElapsedTime, const float32 MaxElapsedTime) const
    {
        if (ElapsedTime.opCmp(MaxElapsedTime) > 0 || (ElapsedTime.opCmp(0.0) < 0))
        {
            return -1.0f;
        }
        return float32(ElapsedTime.ToSeconds());
    }
    void SyncEntityWeaponTypeToAnimStateVariant(const FECSEntity &inout Entity, const FC_CharacterWeapon &inout CharacterWeapon) const
    {
        if (int(CharacterWeapon.GetCurrentWeaponType()) == 0)
        {
            return;
        }
        Get local_8;
        const FC_AnimState& local_10 = local_8.opCall();
        if (local_10)
        {
            EAvatarAnimVariantType local_11 = ::AvatarAnimVariant::GetVariantType(EWeaponType(CharacterWeapon.GetCurrentWeaponType()));
            if (local_10.GetVariantType() != int(local_11))
            {
                Modify local_16;
                local_16.opCall().SetVariantType(int(local_11));
                Has local_20;
                if (local_20.opCall())
                {
                    FComponentAssetPoolHelper::RequestESMAssetReload(Entity);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_AssignAnimData(const FCE_SwitchWeapon &inout Event) const
    {
        Has local_4;
        if (local_4.opCall() == false)
        {
            return;
        }
        Get local_10;
        const FC_CharacterWeapon& local_12 = local_10.opCall();
        if (local_12)
        {
            this.SyncEntityWeaponTypeToAnimStateVariant(Event.Sender, local_12);
        }
        return;
    }
    UFUNCTION()
    void Job_TuneESMBBFloat(const FECSEntity &inout Entity, FC_TuneESMBBFloat &inout TuneESMBBFloat, const FCS_FixedTime &inout FixedTime) const
    {
        FTuneFloatData& local_24;
        float32 local_27;
        float32 local_28;
        float32 local_32;
        float32 local_33;
        FNameHandle_EntityBBVarFloat local_40;
        float32 local_2 = FixedTime.DeltaTime;
        for (auto& local_22 : TuneESMBBFloat.GetModify_DataMap())
        {
            const FTuneFloatConfig& local_26 = local_24.GetCurrentConfig();
            float32 local_1 = local_24.GetSpanElapsed() + local_2;
            local_24.SetSpanElapsed(local_1);
            local_27 = 1.0f;
            if (local_26.GetbUseBlendInDuration() && (local_26.GetBlendInDuration() > 0.0f))
            {
                local_28 = local_24.GetSpanElapsed();
                local_28 = local_28 / local_26.GetBlendInDuration();
                local_27 = FMath::Clamp(local_28, 0.0f, 1.0f);
            }
            local_32 = 1.0f;
            if (local_26.GetbUseBlendOutDuration() && (local_26.GetBlendOutDuration() > 0.0f) && (local_24.GetSpanDuration() > 0.0f))
            {
                local_1 = local_24.GetSpanDuration();
                float32 local_31 = FMath::Max(local_1 - local_26.GetBlendOutDuration(), 0.0f);
                if (local_24.GetSpanElapsed() > local_31)
                {
                    local_1 = local_24.GetSpanDuration();
                    local_33 = local_24.GetSpanElapsed();
                    local_28 = local_1 - local_33;
                    local_33 = local_26.GetBlendOutDuration();
                    local_1 = local_28 / local_33;
                    local_32 = FMath::Clamp(local_1, 0.0f, 1.0f);
                }
            }
            local_24.SetBlendAlpha(local_27 * local_32);
            if (local_26.HasOption(ETuneFloatOptions(0)))
            {
                continue;
            }
            local_40;
            local_28 = Entity.GetBB_Float(local_40);
            local_28 = local_26.GetClampedValue(local_28);
            float32 local_31_2 = local_26.GetSmoothTime();
            if (local_31_2 <= 0.0f)
            {
                local_24.SetTunedValue(local_28);
                continue;
            }
            if (::TuneESMBBFloatNames::IsDegreeSourceParam(local_22.GetKey()))
            {
                float32 local_42;
                float32 local_34 = local_28 - local_24.GetTunedValue();
                float32 local_30 = FRotator3f::NormalizeAxis(local_34);
                local_31_2 = local_24.GetSmoothVelocity();
                local_42 = local_31_2;
                local_31_2 = local_26.GetSmoothTime();
                local_33 = FMathUtils::SmoothDamp(0.0f, local_30, local_42, local_31_2, local_2, 1e20f);
                local_24.SetSmoothVelocity(local_42);
                float32 local_43 = local_24.GetTunedValue() + local_33;
                local_24.SetTunedValue(FRotator3f::NormalizeAxis(local_43));
                continue;
            }
            local_33 = local_24.GetSmoothVelocity();
            float32 local_34_2 = local_26.GetSmoothTime();
            local_31_2 = local_24.GetTunedValue();
            local_24.SetTunedValue(FMathUtils::SmoothDamp(local_31_2, local_28, local_33, local_34_2, local_2, 1e20f));
            local_24.SetSmoothVelocity(local_33);
        }
        for (auto& local_22_2 : TuneESMBBFloat.GetModify_DataMap())
        {
            ModifyOrAdd local_48;
            FC_TuneESMBBFloatValue& local_50 = local_48.opCall();
            if (local_50)
            {
                local_50.SetTunedValueBySourceName(local_22_2.GetKey(), (local_24.GetTunedValue() * local_24.GetBlendAlpha()));
            }
        }
        return;
    }
    UFUNCTION()
    void Job_EstimateSpeed(const FECSEntity &inout Entity, FC_EstimatedSpeed &inout EstimatedSpeed, const FC_Transform &inout Transform, const FCS_FixedTime &inout FixedTime) const
    {
        if (EstimatedSpeed.GetbUseInternalSpeed())
        {
            Get local_6;
            const FC_CharacterMovementControl& local_8 = local_6.opCall();
            if (local_8)
            {
                EstimatedSpeed.SetEstimatedSpeed(float32(local_8.GetInternalVelocity().Size()));
            }
            return;
        }
        FFPTime local_18 = (FFPTime(FixedTime.Time) - EstimatedSpeed.GetSampleTimeOffset());
        EstimatedSpeed.SetEstimatedSpeed(float32((((FVector(Transform.GetPosition()) - FTransformUtils::SampleLocation(Entity, local_18)).Size()) / EstimatedSpeed.GetSampleTimeOffset().ToSeconds())));
        return;
    }
    UFUNCTION()
    void Job_UpdateAnimLeanParams(const FECSEntity &inout Entity, FC_AnimLeanParams &inout AnimLeanParams, const FC_Rigidbody &inout Rigidbody) const
    {
        float32 local_1;
        float32 local_5 = float32(Rigidbody.GetAngularVelocity().Yaw);
        if (Entity.MatchGameplayTag(GameplayTags::ESM_MotionFlag_Sprint))
        {
            local_1 = -1.0f;
        }
        else
        {
            local_1 = -2.0f;
        }
        AnimLeanParams.SetLeanAngle(FMath::Lerp(AnimLeanParams.GetLeanAngle(), local_5, 0.2f) / local_1);
        AnimLeanParams.SetLeanPitch(Rigidbody.GetVelocityPitch());
        return;
    }
    UFUNCTION()
    void Job_UpdateAnimFloorInfo(const FECSEntity &inout Entity, FC_AnimFloorInfo &inout AnimFloorInfo, const FC_CharacterMovement &inout CharacterMovement, const FCS_FixedTime &inout FixedTime) const
    {
        float32 local_2 = FixedTime.DeltaTime;
        AnimFloorInfo.SetFloorNormal(CharacterMovement.GetFloorInfo().FloorNormal);
        AnimFloorInfo.SetMoveDirSlope(FMathUtils::LerpToInDuration(AnimFloorInfo.GetMoveDirSlope(), CharacterMovement.GetMoveDirSlope(), 0.1f, local_2));
        AnimFloorInfo.SetForwardSlope(FMathUtils::LerpToInDuration(AnimFloorInfo.GetForwardSlope(), CharacterMovement.GetForwardSlope(), 0.1f, local_2));
        return;
    }
    UFUNCTION()
    void Job_UpdateAnimAimTargetControl(const FECSEntity &inout Entity, FC_AnimAimTargetControl &inout AnimAimTargetControl, const FC_Transform &inout Transform, const FCS_FixedTime &inout FixedTime) const
    {
        int local_38 = 0;
        int local_44 = 0;
        if (AnimAimTargetControl.GetUsedCounter() <= 0)
        {
            Remove local_8;
            local_8.opCall();
            return;
        }
        FRotator local_20 = FCharacterInputUtils::GetViewInputDir(Entity, FixedTime.LastTime);
        FVector local_32 = FCharacterInputUtils::GetViewOffset(Entity, FixedTime.LastTime);
        FVector local_50;
        if (local_38 && local_38.GetbCachedValidLockTargetPosition() && !(local_44.GetbIsAiming()))
        {
            local_50 = local_38.GetPresentationLockTargetPosition();
        }
        else
        {
            local_50 = ((FVector(Transform.GetPosition()) + local_32) + (local_20.GetForwardVector() * 1000.0));
        }
        AnimAimTargetControl.SetAimTarget((Transform.ToFTransform().InverseTransformPosition(local_50) - FVector(0.0, 0.0, 30.0)));
        AnimAimTargetControl.SetbDataValid(true);
        return;
    }
    UFUNCTION()
    void Job_UpdateAnimMoveParams(const FECSEntity &inout Entity, FC_AnimMoveParams &inout AnimMoveParams, const FC_CharacterMovementControl &inout CharacterMovementControl, const FCS_FixedTime &inout FixedTime) const
    {
        AnimMoveParams.SetDesiredMoveAngleRelativeToBody(CharacterMovementControl.GetRelativeDesiredRotationYaw());
        float32 local_1 = (FFPTime(FixedTime.Time) - CharacterMovementControl.GetTurningBackwardStartTime());
        FFPTime local_6 = FFPTime(CharacterMovementControl.GetTurningBackwardStartTime());
        if (local_6.opCmp(0.0) > 0 && (local_1 < 3.0f))
        {
            AnimMoveParams.SetSwingTimeElapsed(local_1);
            return;
        }
        AnimMoveParams.SetSwingTimeElapsed(-1.0f);
        return;
    }
    UFUNCTION()
    void Job_UpdateAnimLeanSmoothParan(const FECSEntity &inout Entity, FC_AnimLeanRelatedParamSmoothConfig &inout LeanParam, const FC_CharacterMovementControl &inout CharacterMovementControl, const FCS_FixedTime &inout FixedTime) const
    {
        ModifyOrAdd local_4;
        FC_AnimMoveParamsTemp& local_6 = local_4.opCall();
        if (local_6)
        {
            float32 local_13;
            float32 local_12;
            float32 local_11;
            float32 local_10;
            float32 local_9 = FixedTime.DeltaTime;
            local_10 = LeanParam.GetSmoothTime();
            local_11 = LeanParam.GetMaxDegree();
            local_12 = LeanParam.GetTargetAlpha();
            local_13 = CharacterMovementControl.GetRelativeDesiredRotationYaw();
            if (CharacterMovementControl.GetMovementInput().IsNearlyZero(9.999999747378752e-5))
            {
                local_13 = 0.0f;
            }
            float32 local_8 = -local_11;
            float32 local_18 = FMath::Clamp(local_13, local_8, local_11);
            local_8 = local_18 / local_11;
            float32 local_17 = FMath::EaseOut(0.0f, 1.0f, FMath::Abs(local_8), 2.0f);
            float32 local_21 = FMath::Sign(local_18) * local_17;
            local_8 = local_21 * local_11;
            float32 local_18_2 = local_8 * local_12;
            local_6.SetDesiredMoveAngleRelativeToBodySmoothed(FMathUtils::LerpToInDuration(local_6.GetDesiredMoveAngleRelativeToBodySmoothed(), local_18_2, local_10, local_9));
            if (local_12 == LeanParam.GetFadeToTarget() && (local_12 == 0.0f))
            {
                Remove local_26;
                local_26.opCall();
                local_6.SetDesiredMoveAngleRelativeToBodySmoothed(0.0f);
                return;
            }
            if (local_12 != LeanParam.GetFadeToTarget())
            {
                local_12 = FMathUtils::MoveTowards(local_12, LeanParam.GetFadeToTarget(), local_9, LeanParam.GetFadeToSpeed());
                Modify local_30;
                local_30.opCall().SetTargetAlpha(local_12);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateAnimData(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, FC_CharacterAnimData &inout AnimData, const FC_Transform &inout Transform, const FC_Rigidbody &inout Rigidbody, const FC_AnimState &inout AnimState, const FC_CharacterPoseState &inout CharacterPoseState, const FC_CharacterMovement &inout CharacterMovement, const FC_CharacterMovementControl &inout CharacterMovementControl) const
    {
        float32 local_2 = FixedTime.DeltaTime;
        FECSDebugDraw::DrawDebugLine(n"Transform", Transform.GetPosition(), (FVector(Transform.GetPosition()) + (Transform.GetRotation().GetForwardVector() * 50.0)), FColor::Orange, FColor::Blue, 0.1f, uint8(0), 0.0f);
        return;
    }
    UFUNCTION()
    void Job_HandleAnimBeHitShake(const FECSEntity &inout Entity, const FC_AnimBeHitShake &inout AnimBeHitShake) const
    {
        UESMAnimInstance_Base local_34;
        AActor local_4 = Entity.GetMutableActor();
        if (local_4 != nullptr)
        {
            TArray<USkeletalMeshComponent> local_10 = local_4.GetComponentsByClass(USkeletalMeshComponent);
            for (auto local_28 : local_10)
            {
                local_34 = Cast<UESMAnimInstance_Base>(local_28.GetAnimInstance());
                if (local_34 != nullptr)
                {
                    local_34.HandleHitShake(AnimBeHitShake);
                }
            }
        }
        Remove local_38;
        local_38.opCall();
        return;
    }
    UFUNCTION()
    void Run_Monitor_AssignAnimData() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_SwitchWeapon> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_SwitchWeapon& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Monitor_AssignAnimData(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TuneESMBBFloat() const
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
                this.Job_TuneESMBBFloat(local_40, local_42, local_6);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
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
            this.Job_TuneESMBBFloat(local_174, local_42, local_6);
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
    void Run_Job_EstimateSpeed() const
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
                this.Job_EstimateSpeed(local_40, local_42, local_48, local_6);
                FECSEntity::MarkModifiedIfDirty<FC_EstimatedSpeed> local_56;
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
            this.Job_EstimateSpeed(local_184, local_42, local_48, local_6);
            FECSEntity::MarkModifiedIfDirty<FC_EstimatedSpeed>(local_40).opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_112);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateAnimLeanParams() const
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
                this.Job_UpdateAnimLeanParams(local_36, local_38, local_44);
                local_52.opCall(local_38);
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
            this.Job_UpdateAnimLeanParams(local_180, local_38, local_44);
            local_52.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_108);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateAnimFloorInfo() const
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
                this.Job_UpdateAnimFloorInfo(local_40, local_42, local_48, local_6);
                FECSEntity::MarkModifiedIfDirty<FC_AnimFloorInfo> local_56;
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
            this.Job_UpdateAnimFloorInfo(local_184, local_42, local_48, local_6);
            FECSEntity::MarkModifiedIfDirty<FC_AnimFloorInfo>(local_40).opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_112);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateAnimAimTargetControl() const
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
                this.Job_UpdateAnimAimTargetControl(local_40, local_42, local_48, local_6);
                FECSEntity::MarkModifiedIfDirty<FC_AnimAimTargetControl> local_56;
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
            this.Job_UpdateAnimAimTargetControl(local_184, local_42, local_48, local_6);
            FECSEntity::MarkModifiedIfDirty<FC_AnimAimTargetControl>(local_40).opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_112);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateAnimMoveParams() const
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
                this.Job_UpdateAnimMoveParams(local_40, local_42, local_48, local_6);
                FECSEntity::MarkModifiedIfDirty<FC_AnimMoveParams> local_56;
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
            this.Job_UpdateAnimMoveParams(local_184, local_42, local_48, local_6);
            FECSEntity::MarkModifiedIfDirty<FC_AnimMoveParams>(local_40).opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_112);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateAnimLeanSmoothParan() const
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
                this.Job_UpdateAnimLeanSmoothParan(local_40, local_42, local_48, local_6);
                FECSEntity::MarkModifiedIfDirty<FC_AnimLeanRelatedParamSmoothConfig> local_56;
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
            this.Job_UpdateAnimLeanSmoothParan(local_184, local_42, local_48, local_6);
            FECSEntity::MarkModifiedIfDirty<FC_AnimLeanRelatedParamSmoothConfig>(local_40).opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_112);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateAnimData() const
    {
        int local_6 = 0;
        int local_160 = 0;
        int local_162 = 0;
        int local_168 = 0;
        int local_174 = 0;
        int local_180 = 0;
        int local_186 = 0;
        int local_192 = 0;
        int local_198 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        FECSRuntimeView local_48 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_52;
        local_52.opCall();
        FECSRuntimeView::Include<FC_Transform>(local_48).opCall();
        Include local_60;
        local_60.opCall();
        Include local_64;
        local_64.opCall();
        Include local_68;
        local_68.opCall();
        Include local_72;
        local_72.opCall();
        Include local_76;
        local_76.opCall();
        Include local_80;
        local_80.opCall();
        Exclude(local_48).opCall();
        FECSRuntimeViewIterator local_118 = local_48.Iterator();
        for (; local_118.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_157 = FECSEntityScopeCycleCounter(local_118.Proceed());
            this.Job_UpdateAnimData(local_160, local_6, local_162, local_168, local_174, local_180, local_186, local_192, local_198);
            MarkModifiedIfDirty local_206;
            local_206.opCall(local_162);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleAnimBeHitShake() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_166 = 0;
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
                this.Job_HandleAnimBeHitShake(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_80.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_HandleAnimBeHitShake(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}


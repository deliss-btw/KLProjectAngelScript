

class US_SpringArmCameraSystem : UECSScriptSystem
{
    float32 DamperMagicNumber = 26.0f;


    void CalculateSpringArmPosition(const FVector &inout FollowTargetLocation, const FQuat &inout CameraRotation, const FVector &inout TargetOffset, const FVector &inout SocketOffset, FVector3f &inout OutPosition) const
    {
        FVector local_12 = (CameraRotation * FVector::ForwardVector);
        FVector local_6 = (CameraRotation * FVector::RightVector);
        FVector local_24(FVector::UpVector);
        FVector local_18 = (local_12 * TargetOffset.X);
        FVector local_44 = (local_18 + (local_6 * TargetOffset.Y));
        FVector local_38_2 = (local_24 * TargetOffset.Z);
        FVector local_18_2 = (local_44 + local_38_2);
        FVector local_30 = (local_12 * SocketOffset.X);
        FVector local_38_3 = (local_6 * SocketOffset.Y);
        FVector local_44_2 = (local_30 + local_38_3);
        FVector local_38_4 = (local_24 * SocketOffset.Z);
        FVector local_30_2 = (local_44_2 + local_38_4);
        FVector local_44_3 = (FollowTargetLocation + local_18_2);
        OutPosition = FVector3f((local_44_3 + local_30_2));
        return;
    }
    bool SweepCamera(const UWorld UEWorld, const FVector &inout Start, const FVector &inout End, const float32 ProbeSize, const FVector &inout OriginFollowPos, const float32 MuteCollisionDistance, FHitResult &inout OutHit) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        bool __r; return __r;
    }
    void CollisionSpringIteration(const UWorld UEWorld, const FVector &inout FollowTargetPosition, const FTransform &inout TransformToSpring, const FVector &inout CamTargetPos, const float32 TargetOffsetRatio, const float32 SocketOffsetRatio, const float32 MuteCollisionDistance, float32 &inout OutTargetOffsetRatio, float32 &inout OutSocketOffsetRatio, FVector &inout OutFinalPosition) const
    {
        int local_1 = 1123024896;
        float32 local_4 = FMath::Tan(FMath::DegreesToRadians(60.0f));
        float32 local_5 = FCameraUtils::GetNearClipPlane() * local_4;
        float32 local_3 = local_5 + 8.0f;
        float32 local_6 = local_5 + 1.0f;
        OutTargetOffsetRatio = TargetOffsetRatio;
        OutSocketOffsetRatio = SocketOffsetRatio;
        FVector local_20 = TransformToSpring.GetTranslation();
        FVector local_26 = FollowTargetPosition;
        FVector local_14 = (CamTargetPos - local_26);
        FVector local_46 = (local_26 + (local_14 * TargetOffsetRatio));
        FVector local_32_2 = (local_20 - CamTargetPos);
        FHitResult local_118;
        if (this.SweepCamera(UEWorld, local_26, local_46, local_3, FollowTargetPosition, MuteCollisionDistance, local_118))
        {
            float32 local_121;
            local_46 = local_118.Location;
            float local_40 = local_14.Size();
            local_4 = float32(local_40);
            if (local_4 > 0.0f)
            {
                local_121 = FMath::Min(local_118.Distance / local_4, TargetOffsetRatio);
            }
            else
            {
                local_121 = 0.0f;
            }
            OutTargetOffsetRatio = local_121;
        }
        FVector local_38 = (local_46 + (local_32_2 * SocketOffsetRatio));
        FHitResult local_194;
        if (this.SweepCamera(UEWorld, local_46, local_38, local_6, FollowTargetPosition, MuteCollisionDistance, local_194))
        {
            float32 local_121;
            float local_40_2 = local_32_2.Size();
            local_121 = float32(local_40_2);
            if (local_121 > 0.0f)
            {
                local_4 = FMath::Min(local_194.Distance / local_121, SocketOffsetRatio);
            }
            else
            {
                local_4 = 0.0f;
            }
            OutSocketOffsetRatio = local_4;
            OutFinalPosition = local_194.Location;
        }
        else
        {
            OutFinalPosition = local_38;
        }
        return;
    }
    void UpdateSpringArmCameraResult(FSpringArmCameraPresentationData &inout RuntimeData, const UWorld UEWorld, const FQuat &inout CameraRotation, const bool bEnableCollision, const float32 MuteCollisionDistance, const FFPTime &inout CurrentTime) const
    {
        float32 local_1 = RuntimeData.TPCameraParam.CamOffsetHorizontalFlipRatio;
        FVector local_14 = FVector(RuntimeData.TPCameraParam.StateParams.GetTargetOffset());
        FVector local_8 = FVector(RuntimeData.TPCameraParam.StateParams.GetCombinedSocketOffset());
        local_14.Y *= local_1;
        local_8.Y *= local_1;
        FVector local_34(RuntimeData.TPCameraParam.FollowTargetPosition);
        float32 local_35 = RuntimeData.TPCameraParam.TargetOffsetScale;
        float32 local_36 = RuntimeData.TPCameraParam.SocketOffsetScale;
        FVector3f local_39;
        this.CalculateSpringArmPosition(local_34, CameraRotation, local_14, local_8, local_39);
        FVector local_20 = (CameraRotation * FVector::ForwardVector);
        FVector local_46 = (CameraRotation * FVector::RightVector);
        FVector local_58(FVector::UpVector);
        FVector local_76 = ((local_20 * local_14.X) + (local_46 * local_14.Y));
        FVector local_70_2 = (local_58 * local_14.Z);
        FVector local_52_2 = (local_76 + local_70_2);
        FVector local_76_2 = (local_34 + local_52_2);
        FVector3f local_85 = local_39;
        if ((bEnableCollision && (UEWorld != nullptr)))
        {
            float32 local_88 = 1.0f;
            float32 local_89 = 1.0f;
            FVector local_96;
            this.CollisionSpringIteration(UEWorld, local_34, FTransform(CameraRotation, FVector(local_39), FVector::OneVector), local_76_2, local_35, local_36, MuteCollisionDistance, local_88, local_89, local_96);
            RuntimeData.TPCameraParam.TargetOffsetScale = local_88;
            RuntimeData.TPCameraParam.SocketOffsetScale = local_89;
            local_85 = FVector3f(local_96);
            float32 local_2 = local_35 - local_88;
            if (((local_2 > 0.01f) || ((local_36 - local_89) > 0.01f)))
            {
                RuntimeData.TPCameraParam.OffsetScaleConstrainTime = CurrentTime;
            }
        }
        RuntimeData._base_FSpringArmCameraData.Position = local_85;
        RuntimeData._base_FSpringArmCameraData.Rotation = FRotator3f(CameraRotation.Rotator());
        float32 local_2_2 = 0.0f;
        RuntimeData._base_FSpringArmCameraData.Rotation.Roll = local_2_2;
        RuntimeData._base_FSpringArmCameraData.FOV = RuntimeData.TPCameraParam.StateParams.GetFOV();
        return;
    }
    void TickReleaseConstrain(FSpringArmCameraPresentationData &inout RuntimeData, const FFPTime &inout CurrentTime) const
    {
        int local_1 = 1056964608;
        int local_3 = 1077936128;
        if (!(((RuntimeData.TPCameraParam.SocketOffsetScale != 1.0f) || ((RuntimeData.TPCameraParam.TargetOffsetScale != 1.0f)))) || (FFPTime(RuntimeData.TPCameraParam.OffsetScaleConstrainTime).opCmp(0.0) <= 0))
        {
            return;
        }
        FFPTime local_18 = FFPTime(ECS::GetRuntimeInfo().LastTime);
        float32 local_2_2 = (CurrentTime - RuntimeData.TPCameraParam.OffsetScaleConstrainTime);
        if (local_2_2 <= 0.5f)
        {
            return;
        }
        FFPTime local_24 = ((local_18 - RuntimeData.TPCameraParam.OffsetScaleConstrainTime) - FFPTime(0.5));
        FFPTime local_10_2 = (CurrentTime - RuntimeData.TPCameraParam.OffsetScaleConstrainTime);
        float32 local_2_3 = FMath::Clamp((local_24 / 3.0f), 0.0f, 1.0f);
        float32 local_27 = FMath::Clamp((local_10_2 - FFPTime(0.5)) / 3.0f, 0.0f, 1.0f);
        float32 local_31 = 1.0f;
        local_2_3 = local_31 - FMath::Pow(1.0f - local_2_3, 4.0f);
        float32 local_29 = 1.0f;
        local_27 = local_29 - FMath::Pow(1.0f - local_27, 4.0f);
        if (local_2_3 >= 1.0f)
        {
            local_31 = 1.0f;
        }
        else
        {
            float32 local_30 = 1.0f;
            float32 local_29_2 = 1.0f - local_27;
            local_31 = local_30 - (local_29_2 / (1.0f - local_2_3));
        }
        RuntimeData.TPCameraParam.SocketOffsetScale = FMath::Lerp(RuntimeData.TPCameraParam.SocketOffsetScale, 1.0f, local_31);
        RuntimeData.TPCameraParam.TargetOffsetScale = FMath::Lerp(RuntimeData.TPCameraParam.TargetOffsetScale, 1.0f, local_31);
        if (local_31 >= 1.0f)
        {
            RuntimeData.TPCameraParam.OffsetScaleConstrainTime = 0;
        }
        return;
    }
    void LerpAsSpringArmCamera(const FSpringArmCameraData &inout SpringArmA, const FSpringArmCameraData &inout SpringArmB, FCameraResult &inout FinalData, const float32 WeightToB) const
    {
        FinalData.Position = FMath::Lerp(SpringArmA._base_FCameraRuntimeDataBasic.Position, SpringArmB._base_FCameraRuntimeDataBasic.Position, WeightToB);
        FQuat4f local_20 = FQuat4f::Slerp(SpringArmA._base_FCameraRuntimeDataBasic.Rotation.Quaternion(), SpringArmB._base_FCameraRuntimeDataBasic.Rotation.Quaternion(), WeightToB);
        FinalData.Rotation = local_20.Rotator();
        FinalData.Rotation.Roll = 0.0f;
        float32 local_24 = FMath::Lerp(SpringArmA._base_FCameraRuntimeDataBasic.FOV, SpringArmB._base_FCameraRuntimeDataBasic.FOV, WeightToB);
        return;
    }
    void LerpAsSpringArmCamera(const FSpringArmCameraPresentationData &inout SpringArmA, const FSpringArmCameraPresentationData &inout SpringArmB, FCameraResult &inout FinalData, const float32 WeightToB) const
    {
        FinalData.Position = FMath::Lerp(SpringArmA._base_FSpringArmCameraData.Position, SpringArmB._base_FSpringArmCameraData.Position, WeightToB);
        FQuat4f local_20 = FQuat4f::Slerp(SpringArmA._base_FSpringArmCameraData.Rotation.Quaternion(), SpringArmB._base_FSpringArmCameraData.Rotation.Quaternion(), WeightToB);
        FinalData.Rotation = local_20.Rotator();
        FinalData.Rotation.Roll = 0.0f;
        float32 local_24 = FMath::Lerp(SpringArmA._base_FSpringArmCameraData.FOV, SpringArmB._base_FSpringArmCameraData.FOV, WeightToB);
        return;
    }
    void BlendToSpringArmCamera(const FSpringArmCameraData &inout SpringArmCamera, FCameraInstancedData &inout LastCameraData, FCameraInstancedData &inout CurrentCameraData, const float32 CameraWeight) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void BlendToSpringArmCamera(const FSpringArmCameraPresentationData &inout SpringArmCamera, FCameraInstancedData &inout LastCameraData, FCameraInstancedData &inout CurrentCameraData, const float32 CameraWeight) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void TryPreBlendCameraParams(FTPCameraStateParams &inout OutStateParams, const FTPCameraStateConfig &inout Config, FCameraInstancedData &inout LastCameraData, const float32 BlendWeightTowardCurrent) const
    {
        if (int(LastCameraData.RunningCameraType) != 3)
        {
            return;
        }
        OutStateParams.LerpToInPlace(LastCameraData.GetSpringArmCamera().CameraRuntimeData.TPCameraParam.StateParams, 1.0f - BlendWeightTowardCurrent);
        return;
    }
    void CopyLogicSpringArmCameraData(FCS_TPCameraParam &inout OutTPCameraParam, const FCS_TPCameraParam &inout CameraParam) const
    {
        OutTPCameraParam.InputDir = CameraParam.InputDir;
        OutTPCameraParam.FollowTargetPosition = CameraParam.FollowTargetPosition;
        OutTPCameraParam.RawFollowTargetPosition = CameraParam.RawFollowTargetPosition;
        OutTPCameraParam.bBanPlayerCameraMode = (int(CameraParam.bBanPlayerCameraMode) != 0);
        return;
    }
    UFUNCTION()
    void ClientJob_ApplySpringArmCameraModification_LookAt(const FECSEntity &inout Entity, const FCS_LocalPlayer &inout LocalPlayer, const FCS_FixedTime &inout FixedTime, FCS_InputLocal &inout InputLocal) const
    {
        int local_22 = 0;
        int local_36 = 0;
        float32 local_52 = 0.0f;
        int local_60 = 0;
        int local_78 = 0;
        if (!(LocalPlayer.PlayerEntity.IsValid()) || !((Entity == LocalPlayer.PlayerEntity)))
        {
            return;
        }
        float32 local_7 = float32(ECS::GetRuntimeInfo().DeltaTime.ToSeconds());
        FECSEntity local_16 = LocalPlayer.GetCameraViewTargetEntity();
        FC_PresentationCameraModificationContext local_28;
        FPresentationCameraLookAtRuntimeData local_30 = local_28.LookAtRuntime;
        FInstancedStruct::GetMutable(local_22.CurrentCameraInstanceData.PresentationCamera);
        if (!(local_36.Params.CameraConfig))
        {
            return;
        }
        FFPTime local_44 = FFPTime(ECS::GetRuntimeInfo().Time);
        FECSEntity::GetDefaulted<FC_TPCameraConfig> local_56;
        UCameraSettings local_58 = local_56.opCall().CameraSettings;
        const FCameraLookAtConfig& local_62 = FCameraUtils::GetLookAtConfig(local_60, local_58);
        Has local_68;
        if (!(local_68.opCall()))
        {
            local_30.bHasBaseDir = false;
            local_30.LookAtTargetBlend = MathUtils::FMoveTowardsByDuration(local_30.LookAtTargetBlend, 0.0f, local_7, local_62.LookAtBlendInDuration);
            local_30.BaseDir = FRotator3f::ZeroRotator;
            return;
        }
        FTPCameraStateConfig local_64;
        FCameraUtils::FillCameraStateParam(local_36.CameraRuntimeData.TPCameraParam.StateParams, local_36.CameraRuntimeData.TPCameraParam, local_64, local_60, (local_44 - local_36.CameraRuntimeData.StartTime), local_16, LocalPlayer.PlayerEntity, nullptr);
        if (!(local_78.LookAtParams.GetLookAtTargetConfigRef().IsValid()))
        {
            return;
        }
        const FCameraLookAtTargetConfig& local_80 = FCameraLookAtTargetConfig::GetConfig(local_78.LookAtParams.GetLookAtTargetConfigRef());
        FCS_TPCameraParam local_46;
        this.CopyLogicSpringArmCameraData(local_46, FCameraUtils::GetCameraParam(local_16));
        FVector local_86;
        Has local_90;
        bool local_1 = local_90.opCall();
        if (local_1)
        {
            local_86 = local_46.RawFollowTargetPosition;
        }
        else
        {
            Has local_94;
            bool local_2 = local_94.opCall();
            if (local_2)
            {
                Get local_98;
                local_86 = local_98.opCall().GetPosition();
            }
            else
            {
                Get local_102;
                local_86 = local_102.opCall().GetPosition();
            }
        }
        if (local_52.GetbSnapToLookAtTarget())
        {
            float32 local_70 = local_36.CameraRuntimeData.UpdateBlend(ECS::GetRuntimeInfo().Time);
            FVector local_128;
            if (local_70 <= 0.0001f)
            {
                local_128 = FVector(local_22.CurrentCameraInstanceData.CameraResult.Position);
            }
            else
            {
                local_128 = FVector(local_36.CameraRuntimeData._base_FSpringArmCameraData.Position);
            }
            local_86 += FVector(FVector3f((local_128 - local_46.RawFollowTargetPosition)));
        }
        else
        {
            if (local_62.bLookStartWithFollowOffset)
            {
                local_86 += FVector(FVector3f(0.0f, 0.0f, local_36.CameraRuntimeData.TPCameraParam.StateParams.GetEyePosVerticalOffset() + local_36.CameraRuntimeData.TPCameraParam.StateParams.GetFollowVerticalOffset()));
            }
        }
        float32 local_70_2 = 1.0f;
        float32 local_135 = 1.0f;
        ::FPresentationCameraModificationUtils::ApplyPresentationSpringArmLookAtSmooth(local_86, local_78, local_30, local_36.CameraRuntimeData.TPCameraParam.StateParams, local_46, local_7, local_52, local_62, local_80, local_16, local_70_2, local_135);
        Modify local_140;
        FC_FreezeCameraFollowTarget& local_142 = local_140.opCall();
        if (local_142)
        {
            if (local_142.bFreezeYawInLookAt)
            {
                if (local_142.bPendingRecordFreeze)
                {
                    float32 local_3_2 = local_46.InputDir.Yaw;
                    local_142.bPendingRecordFreeze = false;
                }
                local_30.BaseDir.Yaw = local_142.FreezeYaw;
            }
        }
        local_30.ArmLengthRatioFromLookAtTarget = local_70_2;
        local_30.FollowTargetOffsetFromLookAt = FVector3f(0.0f, 0.0f, local_135 * local_30.LookAtTargetBlend);
        local_30.LookAtTargetBlend = MathUtils::FMoveTowardsByDuration(local_30.LookAtTargetBlend, 1.0f, local_7, local_62.LookAtBlendInDuration);
        if (local_30.bHasBaseDir && local_78.LookAtParams.GetbContributeInput())
        {
            InputLocal.WriteBackGeneratedInput(local_30.BaseDir, n"PresentationCameraLookAt");
        }
        return;
    }
    void ApplyCameraModifier(FSpringArmCameraPresentationData &inout SpringArmCamera, FPresentationCameraModifierRuntimeData &inout CameraModifierCollection, const FECSEntity &inout PlayerControllerEntity, const FECSEntity &inout PlayerPawnEntity, const FCS_TPCameraParam &inout LogicCameraParam) const
    {
        FFPTime local_2 = FFPTime(ECS::GetRuntimeInfo().Time);
        FFPTime local_4 = FFPTime(ECS::GetRuntimeInfo().LastTime);
        FCameraUtils::BuildPresentationCameraModifierCollection(PlayerControllerEntity, PlayerPawnEntity, local_2, local_4, CameraModifierCollection.ActiveModifiers, CameraModifierCollection.ModifierTickOrder, SpringArmCamera.TPCameraParam);
        if (CameraModifierCollection.ActiveModifiers.Num() == 0 || (CameraModifierCollection.ModifierTickOrder.Num() == 0))
        {
            return;
        }
        FCameraUtils::TickPresentationCameraModifiers(SpringArmCamera.TPCameraParam, CameraModifierCollection.ActiveModifiers, CameraModifierCollection.ModifierTickOrder, local_2, PlayerPawnEntity);
        return;
    }
    UFUNCTION()
    void ClientJob_UpdateSpringArmCamera(const FECSEntity &inout Entity, const FCS_LocalPlayer &inout LocalPlayer) const
    {
        int local_16 = 0;
        int local_22 = 0;
        int local_34 = 0;
        int local_56 = 0;
        if (!(LocalPlayer.PlayerEntity.IsValid()) || !((Entity == LocalPlayer.PlayerEntity)))
        {
            return;
        }
        FECSEntity local_10 = LocalPlayer.GetCameraViewTargetEntity();
        FInstancedStruct::GetMutable(local_16.CurrentCameraInstanceData.PresentationCamera);
        if (!(local_22.Params.CameraConfig))
        {
            return;
        }
        FFPTime local_28 = FFPTime(ECS::GetRuntimeInfo().Time);
        FTPCameraStateConfig local_26;
        FCameraUtils::FillCameraStateParam(local_22.CameraRuntimeData.TPCameraParam.StateParams, local_22.CameraRuntimeData.TPCameraParam, local_26, local_34, (local_28 - local_22.CameraRuntimeData.StartTime), local_10, LocalPlayer.PlayerEntity, nullptr);
        FCS_TPCameraParam local_24;
        this.CopyLogicSpringArmCameraData(local_24, FCameraUtils::GetCameraParam(local_10));
        FRotator local_50 = FRotator(local_24.InputDir);
        Has local_60;
        bool local_1 = local_60.opCall();
        if (local_1)
        {
            local_50 = FRotator(local_56.LookAtRuntime.BaseDir);
        }
        local_24.StateParamsBeforeModify = local_24.StateParams;
        this.ApplyCameraModifier(local_22.CameraRuntimeData, local_56.CameraModifierCollection, LocalPlayer.PlayerEntity, local_10, FCameraUtils::GetCameraParam(local_10));
        this.TryPreBlendCameraParams(local_24.StateParams, local_26, local_16.LastCameraInstanceData, local_22.CameraRuntimeData.UpdateBlend(local_28));
        FVector local_82(local_24.FollowTargetPosition);
        FVector3f local_66 = local_56.LookAtRuntime.FollowTargetOffsetFromLookAt;
        FVector3f local_69 = (local_66 * local_56.LookAtRuntime.LookAtTargetBlend);
        local_24.FollowTargetPosition = (local_82 + FVector(local_69));
        this.TickReleaseConstrain(local_22.CameraRuntimeData, local_28);
        UWorld local_90 = ECS::GetUEWorld();
        this.UpdateSpringArmCameraResult(local_22.CameraRuntimeData, local_90, FQuat(local_50), true, local_24.MuteCollisionDistance, local_28);
        return;
    }
    UFUNCTION()
    void ClientJob_BlendSpringArmCamera(const FECSEntity &inout Entity, const FCS_LocalPlayer &inout LocalPlayer) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Run_ClientJob_ApplySpringArmCameraModification_LookAt() const
    {
        int local_18 = 0;
        int local_24 = 0;
        int local_26 = 0;
        int local_180 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_6 = this.GetECSWorld();
        Has local_10;
        if (!(local_10.opCall()))
        {
            return;
        }
        FECSWorldPtr local_6_2 = this.GetECSWorld();
        Has local_16;
        if (!(local_16.opCall()))
        {
            return;
        }
        FECSWorldPtr local_6_3 = this.GetECSWorld();
        FECSWorldPtr local_6_4 = this.GetECSWorld();
        int local_32 = 0;
        int local_31 = local_32;
        if (local_4.IsViewCacheUsable())
        {
            const FECSEntity& local_60;
            FECSWorldPtr local_6_5 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_36 = local_4.GetViewCacheEntities();
            int local_37 = 0;
            for (auto& local_52 : local_36)
            {
                local_52;
                FECSEntity local_56;
                if (!(local_56.IsValid()))
                {
                    continue;
                }
                ++local_37;
                FECSEntityScopeCycleCounter local_57 = FECSEntityScopeCycleCounter(local_56);
                this.ClientJob_ApplySpringArmCameraModification_LookAt(local_60, local_18, local_24, local_26);
            }
            local_4.UpdateCachedEntityCount(local_37);
        }
        else
        {
            const FECSEntity& local_60;
            FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
            Include local_102;
            local_102.opCall();
            Exclude(local_98).opCall();
            bool local_11 = local_4.BeginViewCacheBuild();
            int local_38 = local_4.GetViewCacheEpoch();
            int local_108 = 0;
            FECSRuntimeViewIterator local_142 = local_98.Iterator();
            for (; local_142.CanProceed;)
            {
                local_60 = local_142.Proceed();
                ++local_108;
                if (local_11)
                {
                    local_4.AddViewCacheEntity(local_60.GetId());
                }
                FECSEntityScopeCycleCounter local_57_2 = FECSEntityScopeCycleCounter(local_60);
                this.ClientJob_ApplySpringArmCameraModification_LookAt(local_180, local_18, local_24, local_26);
            }
            local_4.UpdateCachedEntityCount(local_108);
            if (local_11)
            {
                local_4.CommitViewCacheBuild(local_38);
            }
        }
        FECSWorldPtr local_34 = this.GetECSWorld();
        MarkModifiedIfDirty local_184;
        local_184.opCall(local_26);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_UpdateSpringArmCamera() const
    {
        int local_12 = 0;
        const FECSEntity& local_46;
        int local_170 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        int local_18 = 0;
        int local_17 = local_18;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_4_3 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_22 = local_2.GetViewCacheEntities();
            int local_23 = 0;
            for (auto& local_38 : local_22)
            {
                local_38;
                FECSEntity local_42;
                if (!(local_42.IsValid()))
                {
                    continue;
                }
                ++local_23;
                FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42);
                this.ClientJob_UpdateSpringArmCamera(local_46, local_12);
            }
            local_2.UpdateCachedEntityCount(local_23);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        bool local_9 = local_2.BeginViewCacheBuild();
        int local_24 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_46 = local_132.Proceed();
            ++local_98;
            if (local_9)
            {
                local_2.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.ClientJob_UpdateSpringArmCamera(local_170, local_12);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_9)
        {
            local_2.CommitViewCacheBuild(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_BlendSpringArmCamera() const
    {
        int local_12 = 0;
        const FECSEntity& local_46;
        int local_170 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        int local_18 = 0;
        int local_17 = local_18;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_4_3 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_22 = local_2.GetViewCacheEntities();
            int local_23 = 0;
            for (auto& local_38 : local_22)
            {
                local_38;
                FECSEntity local_42;
                if (!(local_42.IsValid()))
                {
                    continue;
                }
                ++local_23;
                FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42);
                this.ClientJob_BlendSpringArmCamera(local_46, local_12);
            }
            local_2.UpdateCachedEntityCount(local_23);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        bool local_9 = local_2.BeginViewCacheBuild();
        int local_24 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_46 = local_132.Proceed();
            ++local_98;
            if (local_9)
            {
                local_2.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.ClientJob_BlendSpringArmCamera(local_170, local_12);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_9)
        {
            local_2.CommitViewCacheBuild(local_24);
        }
        return;
    }
}


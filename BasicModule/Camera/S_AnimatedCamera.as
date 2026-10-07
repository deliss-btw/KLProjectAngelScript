

class US_AnimatedCameraSystem : UECSScriptSystem
{
    US_AnimatedCameraSystem()
    {
        return;
    }
    void AnimPoseToCameraResult(const FAnimCameraPose &inout Pose, FCameraResult &inout OutResult) const
    {
        OutResult.Position = FVector3f(Pose.Position);
        OutResult.Rotation = Pose.Rotation;
        OutResult.Rotation.Roll = 0;
        int local_4 = int(Pose.FOV);
        return;
    }
    bool SweepCamera(const UWorld UEWorld, const FVector &inout Start, const FVector &inout End, const float32 ProbeSize, const FVector &inout OriginFollowPos, const float32 MuteCollisionDistance, FHitResult &inout OutHit) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        bool __r; return __r;
    }
    FVector ApplyAnimatedCameraCollisionCorrection(const UWorld UEWorld, const FVector &inout FollowTargetPosition, const FVector &inout AnimatedCameraPosition, const float32 MuteCollisionDistance, const float32 CorrectionStrength) const
    {
        if (CorrectionStrength <= 0.0f)
        {
            return AnimatedCameraPosition;
        }
        int local_3 = 1123024896;
        float32 local_4 = (FCameraUtils::GetNearClipPlane() * FMath::Tan(FMath::DegreesToRadians(60.0f))) + 8.0f;
        FHitResult local_74;
        if (!(this.SweepCamera(UEWorld, FollowTargetPosition, AnimatedCameraPosition, local_4, FollowTargetPosition, MuteCollisionDistance, local_74)))
        {
            return AnimatedCameraPosition;
        }
        FVector local_80(local_74.ImpactPoint);
        FVector local_106 = (local_80 + (FVector(local_74.ImpactNormal) * local_4));
        FVector local_100_2 = (AnimatedCameraPosition - FollowTargetPosition);
        if ((local_106 - FollowTargetPosition).SizeSquared() > local_100_2.SizeSquared())
        {
            local_106 = AnimatedCameraPosition;
        }
        if (CorrectionStrength < 1.0f)
        {
            local_106 = FMath::Lerp(AnimatedCameraPosition, local_106, CorrectionStrength);
        }
        return local_106;
    }
    void GetCameraOrigin(const FECSEntity &inout Entity, const FECSEntity &inout LockTargetEntity, const FAnimatedCameraParams &inout CameraParams, FVector &inout OutPosition, FQuat4f &inout OutRotation) const
    {
        int local_2 = 0;
        if (int(CameraParams.OriginTransformType) == 1)
        {
            OutPosition = FTransformUtils::GetOffsetRefLocation(Entity, local_2.ToFTransform(), CameraParams.OriginalPositionType);
            Get local_6;
            FVector local_54 = (FVector(local_6.opCall().GetPosition()) - local_2.GetPosition());
            FVector3f local_57 = FVector3f(local_54);
            OutRotation = FQuat4f::MakeFromXZ(local_57, FVector3f::UpVector);
            return;
        }
        if (int(CameraParams.OriginTransformType) == 5)
        {
            OutPosition = FVector::ZeroVector;
            OutRotation = FQuat4f::Identity;
            return;
        }
        if (local_2)
        {
            OutPosition = FTransformUtils::GetOffsetRefLocation(Entity, local_2.ToFTransform(), CameraParams.OriginalPositionType);
            OutRotation = FQuat4f(local_2.GetRotation());
        }
        return;
    }
    float32 CalculateBlendParam(const FECSEntity &inout Entity, const FVector &inout Position, const ECameraAnimBlendParamType BlendParamType) const
    {
        int local_10 = 0;
        if (int(BlendParamType) == 1)
        {
            return float32(((FVector(local_10.GetPresentationLockTargetPosition()) - Position).Size()));
        }
        if (int(BlendParamType) == 2)
        {
            return FVector3f((FVector(local_10.GetPresentationLockTargetPosition()) - Position)).ToOrientationRotator().Pitch;
        }
        return 0.0f;
    }
    FVector3f GetFocusTargetPositionOffset(const FECSEntity &inout Entity, const FVector &inout OriginPosition, const FQuat4f &inout OriginRotation) const
    {
        int local_6 = 0;
        if (local_6 && local_6.GetbCachedValidLockTargetPosition())
        {
            FVector local_14 = local_6.GetPresentationLockTargetPosition();
            return FVector3f(FTransform(FQuat(OriginRotation), OriginPosition, FVector::OneVector).InverseTransformPosition(local_14));
        }
        else
        {
            return FVector3f::ZeroVector;
        }
    }
    void LerpAsAnimatedCamera(const FAnimatedCameraData &inout AnimA, const FAnimatedCameraData &inout AnimB, FCameraResult &inout FinalData, const float32 WeightToB) const
    {
        FinalData.Position = FMath::Lerp(AnimA._base_FCameraRuntimeDataBasic.Position, AnimB._base_FCameraRuntimeDataBasic.Position, WeightToB);
        FQuat4f local_20 = FQuat4f::Slerp(AnimA._base_FCameraRuntimeDataBasic.Rotation.Quaternion(), AnimB._base_FCameraRuntimeDataBasic.Rotation.Quaternion(), WeightToB);
        FinalData.Rotation = local_20.Rotator();
        FinalData.Rotation.Roll = 0.0f;
        float32 local_24 = FMath::Lerp(AnimA._base_FCameraRuntimeDataBasic.FOV, AnimB._base_FCameraRuntimeDataBasic.FOV, WeightToB);
        return;
    }
    void LerpAsAnimatedCamera(const FAnimatedCameraPresentationData &inout AnimA, const FAnimatedCameraPresentationData &inout AnimB, FCameraResult &inout FinalData, const float32 WeightToB) const
    {
        FinalData.Position = FMath::Lerp(AnimA._base_FAnimatedCameraData.Position, AnimB._base_FAnimatedCameraData.Position, WeightToB);
        FQuat4f local_20 = FQuat4f::Slerp(AnimA._base_FAnimatedCameraData.Rotation.Quaternion(), AnimB._base_FAnimatedCameraData.Rotation.Quaternion(), WeightToB);
        FinalData.Rotation = local_20.Rotator();
        FinalData.Rotation.Roll = 0.0f;
        float32 local_24 = FMath::Lerp(AnimA._base_FAnimatedCameraData.FOV, AnimB._base_FAnimatedCameraData.FOV, WeightToB);
        return;
    }
    void BlendToAnimatedCamera(const FAnimatedCameraData &inout AnimatedCamera, FCameraInstancedData &inout LastCameraData, FCameraInstancedData &inout CurrentCameraData, const float32 CameraWeight) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void BlendToAnimatedCamera(const FAnimatedCameraPresentationData &inout AnimatedCamera, FCameraInstancedData &inout LastCameraData, FCameraInstancedData &inout CurrentCameraData, const float32 CameraWeight) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void ClientJob_UpdateAnimatedCamera(const FECSEntity &inout Entity, const FCS_LocalPlayer &inout LocalPlayer) const
    {
        int local_8 = 0;
        GetDefaulted local_88;
        if (!(LocalPlayer.PlayerEntity.IsValid()) || !((Entity == LocalPlayer.PlayerEntity)))
        {
            return;
        }
        FInstancedStruct::GetMutable(local_8.CurrentCameraInstanceData.PresentationCamera);
        FAnimatedCameraPresentation local_10;
        FAnimatedCameraParams local_16 = local_10.Params;
        FAnimatedCameraPresentationData local_18 = local_10.CameraRuntimeData;
        FDataObjectPtr local_66;
        local_66;
        TDataObjectPtr<FAnimCameraData> local_42;
        if (!(local_42))
        {
            return;
        }
        FECSEntity local_76 = LocalPlayer.GetCameraViewTargetEntity();
        bool local_77 = false;
        if (!(local_18.bRuntimeOriginInited))
        {
            if (int(local_16.OriginTransformType) == 2)
            {
                GetDefaulted local_84;
                local_18.OriginEntity = local_84.opCall().GetParent();
            }
            else
            {
                if (int(local_16.OriginTransformType) == 3)
                {
                    local_18.OriginEntity = local_88.opCall().GetTargetEntity();
                }
                else
                {
                    if (int(local_16.OriginTransformType) == 4)
                    {
                        GetDefaulted local_92;
                        local_18.OriginEntity = local_92.opCall().GetTargetEntity();
                    }
                    else
                    {
                        local_18.OriginEntity = local_76;
                    }
                }
            }
            this.GetCameraOrigin(local_18.OriginEntity, local_88.opCall().GetTargetEntity(), local_16, local_18.OriginPosition, local_18.OriginRotation);
            local_18.FocusPointPositionOffset = this.GetFocusTargetPositionOffset(local_76, local_18.OriginPosition, local_18.OriginRotation);
            local_18.BlendParam = this.CalculateBlendParam(local_76, local_18.OriginPosition, ECameraAnimBlendParamType(local_16.BlendParamType));
            local_18.bRuntimeOriginInited = true;
            local_18.StartTime = ECS::GetRuntimeInfo().Time;
            local_77 = true;
        }
        FECSEntity local_102 = local_88.opCall().GetTargetEntity();
        if (local_16.bUpdateOriginTransform && !(local_77) && local_18.OriginEntity.IsValid())
        {
            this.GetCameraOrigin(local_18.OriginEntity, local_102, local_16, local_18.OriginPosition, local_18.OriginRotation);
        }
        if (local_16.bUpdateBlendParam)
        {
            local_18.BlendParam = this.CalculateBlendParam(local_76, local_18.OriginPosition, ECameraAnimBlendParamType(local_16.BlendParamType));
        }
        float32 local_97 = float32(((FFPTime(ECS::GetRuntimeInfo().Time) - local_18.StartTime).ToSeconds()));
        FAnimCameraData local_68;
        local_97 = local_97 / local_68.Duration;
        float32 local_114 = FMath::Lerp(local_16.NormalizedStartTime, local_16.NormalizedEndTime, FMath::Clamp(local_97, 0.0f, 1.0f)) * local_68.Duration;
        FTransform local_172 = FTransform(FQuat(local_18.OriginRotation), local_18.OriginPosition, FVector::OneVector);
        FAnimCameraPose local_192 = local_68.EvaluateCameraPose(local_18.BlendParam, local_114, local_18.FocusPointPositionOffset);
        FAnimCameraPose local_182 = FAnimCameraPose::ByTransform(local_192, local_172);
        if (local_16.bEnableCollisionCorrection && (local_16.CollisionCorrectionStrength > 0.0f))
        {
            FCS_TPCameraParam& local_204 = FCameraUtils::GetCameraParam(local_76);
            if (local_204)
            {
                FVector local_210(local_204.FollowTargetPosition);
                local_18._base_FAnimatedCameraData.Position = FVector3f(this.ApplyAnimatedCameraCollisionCorrection(ECS::GetUEWorld(), local_210, local_182.Position, local_204.MuteCollisionDistance, local_16.CollisionCorrectionStrength));
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_BlendAnimatedCamera(const FECSEntity &inout Entity, const FCS_LocalPlayer &inout LocalPlayer) const
    {
        int local_8 = 0;
        if (!(LocalPlayer.PlayerEntity.IsValid()) || !((Entity == LocalPlayer.PlayerEntity)))
        {
            return;
        }
        FAnimatedCameraPresentation local_228 = local_8.CurrentCameraInstanceData.GetAnimatedCamera();
        this.BlendToAnimatedCamera(local_228.CameraRuntimeData, local_8.LastCameraInstanceData, local_8.CurrentCameraInstanceData, local_228.CameraRuntimeData.UpdateBlend(FFPTime(ECS::GetRuntimeInfo().Time)));
        return;
    }
    UFUNCTION()
    void Run_ClientJob_UpdateAnimatedCamera() const
    {
        int local_12 = 0;
        const FECSEntity& local_46;
        int local_166 = 0;
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
                this.ClientJob_UpdateAnimatedCamera(local_46, local_12);
            }
            local_2.UpdateCachedEntityCount(local_23);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Exclude(local_84).opCall();
        bool local_9 = local_2.BeginViewCacheBuild();
        int local_24 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_84.Iterator();
        for (; local_128.CanProceed;)
        {
            local_46 = local_128.Proceed();
            ++local_94;
            if (local_9)
            {
                local_2.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.ClientJob_UpdateAnimatedCamera(local_166, local_12);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_9)
        {
            local_2.CommitViewCacheBuild(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_BlendAnimatedCamera() const
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
                this.ClientJob_BlendAnimatedCamera(local_46, local_12);
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
            this.ClientJob_BlendAnimatedCamera(local_170, local_12);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_9)
        {
            local_2.CommitViewCacheBuild(local_24);
        }
        return;
    }
}


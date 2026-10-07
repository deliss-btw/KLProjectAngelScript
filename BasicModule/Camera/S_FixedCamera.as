

class US_FixedCameraSystem : UECSScriptSystem
{
    US_FixedCameraSystem()
    {
        return;
    }
    void LerpAsFixedCamera(const FFixedCameraData &inout FixedA, const FFixedCameraData &inout FixedB, FCameraResult &inout FinalData, const float32 WeightToB) const
    {
        FinalData.Position = FMath::Lerp(FixedA._base_FCameraRuntimeDataBasic.Position, FixedB._base_FCameraRuntimeDataBasic.Position, WeightToB);
        FQuat4f local_20 = FQuat4f::Slerp(FixedA._base_FCameraRuntimeDataBasic.Rotation.Quaternion(), FixedB._base_FCameraRuntimeDataBasic.Rotation.Quaternion(), WeightToB);
        FinalData.Rotation = local_20.Rotator();
        FinalData.Rotation.Roll = 0.0f;
        float32 local_24 = FMath::Lerp(FixedA._base_FCameraRuntimeDataBasic.FOV, FixedB._base_FCameraRuntimeDataBasic.FOV, WeightToB);
        return;
    }
    void LerpAsFixedCamera(const FFixedCameraPresentationData &inout FixedA, const FFixedCameraPresentationData &inout FixedB, FCameraResult &inout FinalData, const float32 WeightToB) const
    {
        FinalData.Position = FMath::Lerp(FixedA._base_FFixedCameraData.Position, FixedB._base_FFixedCameraData.Position, WeightToB);
        FQuat4f local_20 = FQuat4f::Slerp(FixedA._base_FFixedCameraData.Rotation.Quaternion(), FixedB._base_FFixedCameraData.Rotation.Quaternion(), WeightToB);
        FinalData.Rotation = local_20.Rotator();
        FinalData.Rotation.Roll = 0.0f;
        float32 local_24 = FMath::Lerp(FixedA._base_FFixedCameraData.FOV, FixedB._base_FFixedCameraData.FOV, WeightToB);
        return;
    }
    void BlendToFixedCamera(const FFixedCameraData &inout FixedCamera, FCameraInstancedData &inout LastCameraData, FCameraInstancedData &inout CurrentCameraData, const float32 CameraWeight) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void BlendToFixedCamera(const FFixedCameraPresentationData &inout FixedCamera, FCameraInstancedData &inout LastCameraData, FCameraInstancedData &inout CurrentCameraData, const float32 CameraWeight) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void ClientJob_UpdateFixedCamera(const FECSEntity &inout Entity, const FCS_LocalPlayer &inout LocalPlayer) const
    {
        int local_8 = 0;
        int local_14 = 0;
        if (!(LocalPlayer.PlayerEntity.IsValid()) || !((Entity == LocalPlayer.PlayerEntity)))
        {
            return;
        }
        FInstancedStruct::GetMutable<FFixedCameraPresentation> local_12 = FInstancedStruct::GetMutable<FFixedCameraPresentation>(local_8.CurrentCameraInstanceData.PresentationCamera);
        if (!(local_14.Params.CameraConfig))
        {
            return;
        }
        FTransform local_40 = FTransform(FTransform::Identity);
        if (local_14.Params.FollowTarget.IsValid())
        {
            Get local_44;
            local_40 = local_44.opCall().ToFTransform();
        }
        FFixedCameraConfig local_16;
        local_14.CameraRuntimeData._base_FFixedCameraData.Position = FVector3f((local_40.GetLocation() + local_40.GetRotation().RotateVector(local_16.OffsetPosition)));
        if (local_16.bAbsoluteRotation)
        {
            local_14.CameraRuntimeData._base_FFixedCameraData.Rotation = FRotator3f(local_16.Rotation);
        }
        else
        {
            FQuat4f local_112 = FQuat4f(local_40.GetRotation());
            FQuat4f local_108 = FQuat4f(local_16.Rotation.Quaternion());
            local_14.CameraRuntimeData._base_FFixedCameraData.Rotation = (local_112 * local_108).Rotator();
        }
        local_14.CameraRuntimeData._base_FFixedCameraData.FOV = local_16.FOV;
        return;
    }
    UFUNCTION()
    void ClientJob_BlendFixedCamera(const FECSEntity &inout Entity, const FCS_LocalPlayer &inout LocalPlayer) const
    {
        int local_8 = 0;
        if (!(LocalPlayer.PlayerEntity.IsValid()) || !((Entity == LocalPlayer.PlayerEntity)))
        {
            return;
        }
        FFixedCameraPresentation local_178 = local_8.CurrentCameraInstanceData.GetFixedCamera();
        this.BlendToFixedCamera(local_178.CameraRuntimeData, local_8.LastCameraInstanceData, local_8.CurrentCameraInstanceData, local_178.CameraRuntimeData.UpdateBlend(FFPTime(ECS::GetRuntimeInfo().Time)));
        return;
    }
    UFUNCTION()
    void Run_ClientJob_UpdateFixedCamera() const
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
                this.ClientJob_UpdateFixedCamera(local_46, local_12);
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
            this.ClientJob_UpdateFixedCamera(local_170, local_12);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_9)
        {
            local_2.CommitViewCacheBuild(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_BlendFixedCamera() const
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
                this.ClientJob_BlendFixedCamera(local_46, local_12);
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
            this.ClientJob_BlendFixedCamera(local_170, local_12);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_9)
        {
            local_2.CommitViewCacheBuild(local_24);
        }
        return;
    }
}


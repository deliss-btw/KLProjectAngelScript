

class US_FrontendSystemCameraOverrideSystem : UECSScriptSystem
{
    US_FrontendSystemCameraOverrideSystem()
    {
        return;
    }
    UFUNCTION()
    void ClientJob_UpdateCameraOverride(const FECSEntity &inout Entity, const FCS_LocalPlayer &inout LocalPlayer, const FC_FrontendSystemCameraOverride &inout FrontendSystemCameraOverride) const
    {
        FECSEntity local_8 = LocalPlayer.GetCameraViewTargetEntity();
        if (FrontendSystemCameraOverride.OverrideParams.IsEmpty())
        {
            ::FCameraOverrideUtils::RemoveLocalCameraOverrideLayer(local_8, ECameraOverrideLayer(4));
        }
        else
        {
            ::FCameraOverrideUtils::AddLocalCameraOverrideLayer(local_8, FrontendSystemCameraOverride.OverrideParams.Last(0).OverrideParam);
        }
        Remove local_16;
        local_16.opCall();
        return;
    }
    UFUNCTION()
    void Run_ClientJob_UpdateCameraOverride() const
    {
        int local_12 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_176 = 0;
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
                this.ClientJob_UpdateCameraOverride(local_46, local_12, local_48);
            }
            local_2.UpdateCachedEntityCount(local_23);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Exclude(local_90).opCall();
        bool local_9 = local_2.BeginViewCacheBuild();
        int local_24 = local_2.GetViewCacheEpoch();
        int local_104 = 0;
        FECSRuntimeViewIterator local_138 = local_90.Iterator();
        for (; local_138.CanProceed;)
        {
            local_46 = local_138.Proceed();
            ++local_104;
            if (local_9)
            {
                local_2.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.ClientJob_UpdateCameraOverride(local_176, local_12, local_48);
        }
        local_2.UpdateCachedEntityCount(local_104);
        if (local_9)
        {
            local_2.CommitViewCacheBuild(local_24);
        }
        return;
    }
}


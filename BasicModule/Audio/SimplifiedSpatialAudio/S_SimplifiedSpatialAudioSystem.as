

class US_SimplifiedSpatialAudioSystem : UECSScriptSystem
{
    UPROPERTY()
    TArray<TWeakObjectPtr<AActor>> CachedSimplifiedSpatialAudioVolumes;
    UPROPERTY()
    bool bSpatialAudioInitialized = false;
    UPROPERTY()
    float32 LastPerformanceCheckTime = 0.0f;


    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    UFUNCTION()
    void Job_CreateSimplifiedSpatialAudioVolume(const FECSEntity &inout Entity, const FC_Transform &inout Transform) const
    {
        FString local_4 = "SimplifiedSpatialAudioSystem: Should create simplified spatial audio volume at ";
        return;
    }
    UFUNCTION()
    void Job_UpdateSimplifiedSpatialAudioVolume(const FECSEntity &inout Entity, FC_SimplifiedSpatialAudio &inout SpatialAudio, const FC_Transform &inout Transform) const
    {
        FVector local_6 = Transform.GetPosition();
        FVector local_18 = ::FSimplifiedSpatialAudioUtils::GetListenerPosition();
        if ((local_18 == FVector::ZeroVector))
        {
            return;
        }
        float32 local_23 = float32(((local_18 - local_6).Size()));
        SpatialAudio.VolumeCenter = local_6;
        ESpatialAudioLODLevel local_25 = ::FSimplifiedSpatialAudioUtils::GetLODLevel(local_6, local_18, local_23);
        SpatialAudio.CurrentLODLevel = ESpatialAudioLODLevel(local_25);
        switch (int(local_25))
        {
        case 0:
        {
            SpatialAudio.bIsActive = false;
            break;
        }
        case 1:
        {
            ::FSimplifiedSpatialAudioUtils::UpdateBasic3DPosition(Entity, Transform, SpatialAudio);
            break;
        }
        case 2:
        {
            ::FSimplifiedSpatialAudioUtils::UpdateSimpleReflections(Entity, Transform, SpatialAudio);
            break;
        }
        case 3:
        {
            ::FSimplifiedSpatialAudioUtils::UpdateFullReflections(Entity, Transform, SpatialAudio);
            break;
        }
        }
        if ((SpatialAudio.bEnableReverb && (int(local_25) != 0)))
        {
            ::FSimplifiedSpatialAudioUtils::UpdateSimpleReverb(Entity, Transform, SpatialAudio);
        }
        SpatialAudio.LastUpdateTime = 0.0f;
        ++SpatialAudio.UpdateCount;
        SpatialAudio.bIsActive = (int(local_25) != 0);
        return;
    }
    UFUNCTION()
    void Job_PrecomputeSpatialAudio(const FECSEntity &inout Entity, FC_SimplifiedSpatialAudio &inout SpatialAudio) const
    {
        if (!(SpatialAudio.bReflectionDataPrecomputed))
        {
            ::FSimplifiedSpatialAudioUtils::PrecomputeReflectionPoints(SpatialAudio);
        }
        return;
    }
    UFUNCTION()
    void Job_MonitorSpatialAudioPerformance(const FECSEntity &inout Entity, FC_SimplifiedSpatialAudio &inout SpatialAudio) const
    {
        float32 local_1 = 0.0f;
        float32 local_3 = 0.0f;
        int local_4 = 0;
        ::FSimplifiedSpatialAudioUtils::GetPerformanceStats(local_1, local_3, local_4);
        if (local_4 > 0)
        {
            ELog local_14;
            (FString("SimplifiedSpatialAudio Performance: Avg=") + local_14);
            FString local_10 = (local_14 + "ms, Max=");
            (local_10 + local_14);
            FString local_10_2 = (local_14 + "ms, Count=");
            (local_10_2 + int(local_14));
        }
        return;
    }
    UFUNCTION()
    void Job_DebugDrawSimplifiedSpatialAudio(const FECSEntity &inout Entity, const FC_SimplifiedSpatialAudio &inout SpatialAudio, const FC_Transform &inout Transform) const
    {
        return;
    }
    UFUNCTION()
    void Run_Job_CreateSimplifiedSpatialAudioVolume() const
    {
        ECS::GetContextJob();
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateSimplifiedSpatialAudioVolume() const
    {
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        MarkModifiedIfDirty local_56;
        int local_180 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        if (false)
        {
        }
        else
        {
        }
        if (!(this.GetECSRuntime().IsOnInterval(FFPTime(0.1))))
        {
            return;
        }
        int local_9 = 0;
        int local_8 = local_9;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_2.GetViewCacheEntities();
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
                this.Job_UpdateSimplifiedSpatialAudioVolume(local_40, local_42, local_48);
                local_56.opCall(local_42);
            }
            local_2.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        local_98.opCall();
        local_102.opCall();
        Exclude(local_94).opCall();
        bool local_7 = local_2.BeginViewCacheBuild();
        int local_18 = local_2.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_94.Iterator();
        for (; local_142.CanProceed;)
        {
            local_40 = local_142.Proceed();
            ++local_108;
            if (local_7)
            {
                local_2.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_UpdateSimplifiedSpatialAudioVolume(local_180, local_42, local_48);
            local_56.opCall(local_42);
        }
        local_2.UpdateCachedEntityCount(local_108);
        if (local_7)
        {
            local_2.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_PrecomputeSpatialAudio() const
    {
        ECS::GetContextJob();
        return;
    }
    UFUNCTION()
    void Run_Job_MonitorSpatialAudioPerformance() const
    {
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_170 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        if (false)
        {
        }
        else
        {
        }
        if (!(this.GetECSRuntime().IsOnInterval(FFPTime(10.0))))
        {
            return;
        }
        int local_9 = 0;
        int local_8 = local_9;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_2.GetViewCacheEntities();
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
                this.Job_MonitorSpatialAudioPerformance(local_40, local_42);
                local_50.opCall(local_42);
            }
            local_2.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        local_92.opCall();
        Exclude(local_88).opCall();
        bool local_7 = local_2.BeginViewCacheBuild();
        int local_18 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_88.Iterator();
        for (; local_132.CanProceed;)
        {
            local_40 = local_132.Proceed();
            ++local_98;
            if (local_7)
            {
                local_2.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_MonitorSpatialAudioPerformance(local_170, local_42);
            local_50.opCall(local_42);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_7)
        {
            local_2.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DebugDrawSimplifiedSpatialAudio() const
    {
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_176 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        if (false)
        {
        }
        else
        {
        }
        if (!(this.GetECSRuntime().IsOnInterval(FFPTime(0.2))))
        {
            return;
        }
        int local_9 = 0;
        int local_8 = local_9;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_2.GetViewCacheEntities();
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
                this.Job_DebugDrawSimplifiedSpatialAudio(local_40, local_42, local_48);
            }
            local_2.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        local_94.opCall();
        local_98.opCall();
        Exclude(local_90).opCall();
        bool local_7 = local_2.BeginViewCacheBuild();
        int local_18 = local_2.GetViewCacheEpoch();
        int local_104 = 0;
        FECSRuntimeViewIterator local_138 = local_90.Iterator();
        for (; local_138.CanProceed;)
        {
            local_40 = local_138.Proceed();
            ++local_104;
            if (local_7)
            {
                local_2.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_DebugDrawSimplifiedSpatialAudio(local_176, local_42, local_48);
        }
        local_2.UpdateCachedEntityCount(local_104);
        if (local_7)
        {
            local_2.CommitViewCacheBuild(local_18);
        }
        return;
    }
}



const FConsoleVariable CVar_WaterAudioSystem_EnableDebugDraw = FConsoleVariable();
const FConsoleVariable CVar_WaterAudioSystem_EnableDebugHUD = FConsoleVariable();

class US_WaterAudioSystem : UECSScriptSystem
{
    UPROPERTY()
    TArray<TWeakObjectPtr<AWaterBodyLake>> CachedWaterBodies;

    US_WaterAudioSystem()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    UFUNCTION()
    void Job_AutoAssignWaterAudioWhenNearWater(const FECSEntity &inout Entity, const FC_Transform &inout Transform) const
    {
        FVector local_6 = Transform.GetPosition();
        float32 local_11 = ::FGameAudioSettings::Get().WaterAudioSearchRadius;
        TArray<TWeakObjectPtr<AWaterBodyLake>> local_16;
        ::FWaterAudioUtils::FindWaterBodiesInRadius(ECS::GetUEWorld(), local_6, local_11, local_16);
        if (local_16.Num() > 0)
        {
            FC_WaterAudio local_54;
            Assign local_26;
            local_26.opCall(local_54);
            XLogIf(::FWaterAudioUtils::EnableLog(), ELog(1), FString().Append("WaterAudioSystem: Auto assigned FC_WaterAudio to player entity ").Append(Entity.GetEntityName()).Append(" due to nearby water body"));
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateWaterAudio(const FECSEntity &inout Entity, FC_WaterAudio &inout WaterAudio, const FC_Transform &inout Transform) const
    {
        Has local_4;
        AWaterBodyLake local_32;
        if (!(local_4.opCall()))
        {
            return;
        }
        FVector local_12 = Transform.GetPosition();
        TArray<TWeakObjectPtr<AWaterBodyLake>> local_16;
        float32 local_17 = ::FGameAudioSettings::Get().WaterAudioSearchRadius;
        ::FWaterAudioUtils::FindWaterBodiesInRadius(ECS::GetUEWorld(), local_12, local_17, local_16);
        XLogIf(::FWaterAudioUtils::EnableVerboseLog(), ELog(1), FString().Append("Job_UpdateWaterAudio: Found ").Append(local_16.Num()).Append(" water bodies in radius ").Append(local_17));
        float32 local_33 = 0.0f;
        FVector local_40(FVector::ZeroVector);
        if (!(::FWaterAudioUtils::FindNearestWaterBody(local_12, local_16, local_32, local_40, local_33)))
        {
            WaterAudio.AudioState = EWaterAudioState(0);
            WaterAudio.DistanceToWater = 1000000.0f;
            if (WaterAudio.bIsAudioPlaying)
            {
                ::FWaterAudioUtils::StopWaterAudioForEntity(Entity, WaterAudio);
            }
            XLogIf(::FWaterAudioUtils::EnableLog(), ELog(1), FString().Append("Job_UpdateWaterAudio: No water body found, setting state to Outside"));
            return;
        }
        ::FWaterAudioUtils::UpdateWaterBodyData(Entity, WaterAudio, local_32);
        ::FWaterAudioUtils::CalculateAudioPosition(Entity, WaterAudio, local_12, local_32, local_40, local_33);
        FString local_28 = FString();
        bool local_5 = ::FWaterAudioUtils::EnableVerboseLog();
        XLogIf(local_5, ELog(1), local_28.Append("Job_UpdateWaterAudio: After CalculateAudioPosition, AudioState = ").Append(WaterAudio.AudioState));
        if (int(WaterAudio.AudioState) == 1)
        {
            XLogIf(::FWaterAudioUtils::EnableVerboseLog(), ELog(1), FString().Append("Job_UpdateWaterAudio: Player is inside water, skipping distance check"));
            ::FWaterAudioUtils::UpdateAudioPlayback(Entity, WaterAudio);
            return;
        }
        float32 local_43 = WaterAudio.AttenuationRadius;
        if (local_43 <= 0.0f)
        {
            local_43 = ::FGameAudioSettings::Get().DefaultWaterAudioAttenuationRadius;
        }
        FString local_28_2 = FString();
        XLogIf(::FWaterAudioUtils::EnableVerboseLog(), ELog(1), local_28_2.Append("Job_UpdateWaterAudio: Distance to water = ").Append(FString::ApplyFormat(local_33, ".2f")).Append(", AttenuationRadius = ").Append(local_43));
        if (local_33 > local_43)
        {
            WaterAudio.AudioState = EWaterAudioState(0);
            WaterAudio.DistanceToWater = local_33;
            if (WaterAudio.bIsAudioPlaying)
            {
                ::FWaterAudioUtils::StopWaterAudioForEntity(Entity, WaterAudio);
            }
            XLogIf(::FWaterAudioUtils::EnableLog(), ELog(1), FString().Append("Job_UpdateWaterAudio: Distance too far (").Append(FString::ApplyFormat(local_33, ".2f")).Append("), setting state to Outside"));
            return;
        }
        ::FWaterAudioUtils::UpdateAudioPlayback(Entity, WaterAudio);
        return;
    }
    UFUNCTION()
    void Job_DebugDrawWaterAudio(const FECSEntity &inout Entity, const FC_WaterAudio &inout WaterAudio, const FC_Transform &inout Transform) const
    {
        Has local_4;
        if (!(local_4.opCall()))
        {
            return;
        }
        else
        {
            if (!(CVar_WaterAudioSystem_EnableDebugDraw.GetBool()))
            {
                return;
            }
        }
    }
    UFUNCTION()
    void Job_DebugHUDWaterAudio(const FECSEntity &inout Entity, const FC_WaterAudio &inout WaterAudio, const FC_Transform &inout Transform) const
    {
        Has local_4;
        if (!(local_4.opCall()))
        {
            return;
        }
        else
        {
            if (!(CVar_WaterAudioSystem_EnableDebugHUD.GetBool()))
            {
                return;
            }
        }
    }
    UFUNCTION()
    void Monitor_CleanupWaterAudio(const FECSEntity &inout Entity, const FC_WaterAudio &inout WaterAudio) const
    {
        if (WaterAudio.bIsAudioPlaying)
        {
            ::FWaterAudioUtils::StopWaterAudio(int(WaterAudio.CurrentAudioID));
            if (Entity.IsValid())
            {
                XLogIf(::FWaterAudioUtils::EnableLog(), ELog(1), FString().Append("WaterAudioSystem: Cleaned up water audio for entity ").Append(Entity.GetEntityName()));
            }
        }
        return;
    }
    UFUNCTION()
    void Run_Job_AutoAssignWaterAudioWhenNearWater() const
    {
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_178 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        if (false)
        {
        }
        else
        {
        }
        if (!(this.GetECSRuntime().IsOnInterval(FFPTime(1.0))))
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
                this.Job_AutoAssignWaterAudioWhenNearWater(local_40, local_42);
            }
            local_2.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        local_88.opCall();
        Exclude(local_84).opCall();
        Exclude(local_84).opCall();
        bool local_7 = local_2.BeginViewCacheBuild();
        int local_18 = local_2.GetViewCacheEpoch();
        int local_106 = 0;
        FECSRuntimeViewIterator local_140 = local_84.Iterator();
        for (; local_140.CanProceed;)
        {
            local_40 = local_140.Proceed();
            ++local_106;
            if (local_7)
            {
                local_2.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_AutoAssignWaterAudioWhenNearWater(local_178, local_42);
        }
        local_2.UpdateCachedEntityCount(local_106);
        if (local_7)
        {
            local_2.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateWaterAudio() const
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
        if (!(this.GetECSRuntime().IsOnInterval(FFPTime(2.0))))
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
                this.Job_UpdateWaterAudio(local_40, local_42, local_48);
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
            this.Job_UpdateWaterAudio(local_180, local_42, local_48);
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
    void Run_Job_DebugDrawWaterAudio() const
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
        if (!(this.GetECSRuntime().IsOnInterval(FFPTime(0.05))))
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
                this.Job_DebugDrawWaterAudio(local_40, local_42, local_48);
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
            this.Job_DebugDrawWaterAudio(local_176, local_42, local_48);
        }
        local_2.UpdateCachedEntityCount(local_104);
        if (local_7)
        {
            local_2.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DebugHUDWaterAudio() const
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
        if (!(this.GetECSRuntime().IsOnInterval(FFPTime(0.05))))
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
                this.Job_DebugHUDWaterAudio(local_40, local_42, local_48);
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
            this.Job_DebugHUDWaterAudio(local_176, local_42, local_48);
        }
        local_2.UpdateCachedEntityCount(local_104);
        if (local_7)
        {
            local_2.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_CleanupWaterAudio() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorWaterAudioOnInactiveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_CleanupWaterAudio(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorWaterAudioOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_CleanupWaterAudio(local_46, local_52);
        }
        return;
    }
}


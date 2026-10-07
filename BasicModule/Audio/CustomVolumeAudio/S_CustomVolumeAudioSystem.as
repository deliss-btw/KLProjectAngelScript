
const FConsoleVariable CVar_CustomVolumeAudioSystem_EnableDebugDraw = FConsoleVariable();
const FConsoleVariable CVar_CustomVolumeAudioSystem_EnableDebugHUD = FConsoleVariable();

class US_CustomVolumeAudioSystem : UECSScriptSystem
{
    UPROPERTY()
    TArray<TWeakObjectPtr<ACustomConvexVolume>> CachedCustomVolumes;

    US_CustomVolumeAudioSystem()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    UFUNCTION()
    void Job_AutoAssignCustomVolumeAudioWhenNearVolume(const FECSEntity &inout Entity, const FC_Transform &inout Transform) const
    {
        FVector local_6 = Transform.GetPosition();
        float32 local_11 = ::FGameAudioSettings::Get().CustomVolumeAudioSearchRadius;
        TArray<TWeakObjectPtr<ACustomConvexVolume>> local_16;
        ::FCustomVolumeAudioUtils::FindCustomVolumesInRadius(ECS::GetUEWorld(), local_6, local_11, local_16);
        if (local_16.Num() > 0 && Entity.IsValid())
        {
            FC_CustomVolumeAudio local_56;
            FC_CustomVolumeAudio local_54;
            Assign local_26;
            local_26.opCall(local_54);
            local_56.AudioState = ECustomVolumeAudioState(0);
            local_56.DistanceToVolume = 0.0f;
            local_56.bIsAudioPlaying = false;
            local_56.CurrentAudioID = -1;
            local_56.NearestVolumePoint = FVector::ZeroVector;
            local_56.TargetVolume = nullptr;
            local_56.LastAudioPosition = FVector::ZeroVector;
            local_56.AttenuationRadius = 0.0f;
            local_56.VolumeAreaType = ECustomAreaType(0);
            XLogIf(::FCustomVolumeAudioUtils::EnableLog(), ELog(1), FString().Append("CustomVolumeAudioSystem: Auto assigned FC_CustomVolumeAudio to player entity ").Append(Entity.GetEntityName()).Append(" due to nearby CustomConvexVolume"));
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateCustomVolumeAudio(const FECSEntity &inout Entity, FC_CustomVolumeAudio &inout VolumeAudio, const FC_Transform &inout Transform) const
    {
        ACustomConvexVolume local_28;
        Has local_6;
        if (!(Entity.IsValid()) || !(local_6.opCall()))
        {
            return;
        }
        FVector local_14 = Transform.GetPosition();
        TArray<TWeakObjectPtr<ACustomConvexVolume>> local_18;
        float32 local_23 = ::FGameAudioSettings::Get().CustomVolumeAudioSearchRadius;
        ::FCustomVolumeAudioUtils::FindCustomVolumesInRadius(ECS::GetUEWorld(), local_14, local_23, local_18);
        float32 local_29 = 0.0f;
        if (!(::FCustomVolumeAudioUtils::FindNearestCustomVolume(local_14, local_18, local_28, local_29)))
        {
            VolumeAudio.AudioState = ECustomVolumeAudioState(0);
            VolumeAudio.DistanceToVolume = 1000000.0f;
            if (VolumeAudio.bIsAudioPlaying)
            {
                ::FCustomVolumeAudioUtils::StopCustomVolumeAudioForEntity(Entity, VolumeAudio);
            }
            XLogIf(::FCustomVolumeAudioUtils::EnableLog(), ELog(1), FString().Append("Job_UpdateCustomVolumeAudio: No CustomConvexVolume found, setting state to Outside"));
            return;
        }
        if (local_28 != nullptr)
        {
            if (CVar_CustomVolumeAudioSystem_EnableDebugDraw.GetBool())
            {
                ::FCustomVolumeAudioUtils::ShowCustomVolume(local_28);
            }
            else
            {
                ::FCustomVolumeAudioUtils::HideCustomVolume(local_28);
            }
        }
        ::FCustomVolumeAudioUtils::UpdateCustomVolumeData(Entity, VolumeAudio, local_28);
        ::FCustomVolumeAudioUtils::CalculateAudioPosition(Entity, VolumeAudio, local_14);
        FString local_34 = FString();
        bool local_7 = ::FCustomVolumeAudioUtils::EnableVerboseLog();
        XLogIf(local_7, ELog(1), local_34.Append("Job_UpdateCustomVolumeAudio: After CalculateAudioPosition, AudioState = ").Append(VolumeAudio.AudioState));
        if (int(VolumeAudio.AudioState) == 1)
        {
            XLogIf(::FCustomVolumeAudioUtils::EnableVerboseLog(), ELog(1), FString().Append("Job_UpdateCustomVolumeAudio: Player is inside volume, skipping distance check"));
            ::FCustomVolumeAudioUtils::UpdateAudioPlayback(Entity, VolumeAudio);
            return;
        }
        float32 local_38 = VolumeAudio.AttenuationRadius;
        if (local_38 <= 0.0f)
        {
            local_38 = ::FCustomVolumeAudioUtils::GetAttenuationRadiusByAreaType(int(VolumeAudio.VolumeAreaType));
            if (local_38 <= 0.0f)
            {
                local_38 = ::FGameAudioSettings::Get().DefaultCustomVolumeAudioAttenuationRadius;
            }
        }
        FString local_34_2 = FString();
        bool local_7_2 = ::FCustomVolumeAudioUtils::EnableVerboseLog();
        XLogIf(local_7_2, ELog(1), local_34_2.Append("Job_UpdateCustomVolumeAudio: Distance to volume = ").Append(FString::ApplyFormat(local_29, ".2f")).Append(", AttenuationRadius = ").Append(local_38));
        if (local_29 > local_38)
        {
            VolumeAudio.AudioState = ECustomVolumeAudioState(0);
            VolumeAudio.DistanceToVolume = local_29;
            if (VolumeAudio.bIsAudioPlaying)
            {
                ::FCustomVolumeAudioUtils::StopCustomVolumeAudioForEntity(Entity, VolumeAudio);
            }
            XLogIf(::FCustomVolumeAudioUtils::EnableLog(), ELog(1), FString().Append("Job_UpdateCustomVolumeAudio: Distance too far (").Append(FString::ApplyFormat(local_29, ".2f")).Append("), setting state to Outside"));
            return;
        }
        ::FCustomVolumeAudioUtils::UpdateAudioPlayback(Entity, VolumeAudio);
        return;
    }
    UFUNCTION()
    void Job_CleanupCustomVolumeAudio(const FECSEntity &inout Entity, FC_CustomVolumeAudio &inout VolumeAudio, const FC_Transform &inout Transform) const
    {
        Has local_6;
        if (!(Entity.IsValid()) || !(local_6.opCall()))
        {
            return;
        }
        FVector local_14 = Transform.GetPosition();
        if (!((VolumeAudio.TargetVolume == nullptr)))
        {
            FVector local_28;
            ACustomConvexVolume local_32;
            float32 local_15 = ::FCustomVolumeAudioUtils::CalculateDistanceToCustomVolume(local_14, local_32, local_28);
            if (local_15 > (::FGameAudioSettings::Get().CustomVolumeAudioSearchRadius * 1.5f))
            {
                XLogIf(::FCustomVolumeAudioUtils::EnableLog(), ELog(1), FString().Append("Job_CleanupCustomVolumeAudio: Entity ").Append(Entity.GetEntityName()).Append(" too far from volume (distance: ").Append(FString::ApplyFormat(local_15, ".2f")).Append("), removing component"));
                ::FCustomVolumeAudioUtils::RemoveCustomVolumeAudio(Entity);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_DebugDrawCustomVolumeAudio(const FECSEntity &inout Entity, const FC_CustomVolumeAudio &inout VolumeAudio, const FC_Transform &inout Transform) const
    {
        Has local_6;
        if (!(Entity.IsValid()) || !(local_6.opCall()))
        {
            return;
        }
        else
        {
            if (!(CVar_CustomVolumeAudioSystem_EnableDebugDraw.GetBool()))
            {
                return;
            }
        }
    }
    UFUNCTION()
    void Job_DebugHUDCustomVolumeAudio(const FECSEntity &inout Entity, const FC_CustomVolumeAudio &inout VolumeAudio, const FC_Transform &inout Transform) const
    {
        Has local_6;
        if (!(Entity.IsValid()) || !(local_6.opCall()))
        {
            return;
        }
        else
        {
            if (!(CVar_CustomVolumeAudioSystem_EnableDebugHUD.GetBool()))
            {
                return;
            }
        }
    }
    UFUNCTION()
    void Monitor_CleanupCustomVolumeAudio(const FECSEntity &inout Entity, const FC_CustomVolumeAudio &inout VolumeAudio) const
    {
        if (VolumeAudio.bIsAudioPlaying)
        {
            ::FCustomVolumeAudioUtils::StopCustomVolumeAudio(int(VolumeAudio.CurrentAudioID));
            if (Entity.IsValid())
            {
                XLogIf(::FCustomVolumeAudioUtils::EnableLog(), ELog(1), FString().Append("CustomVolumeAudioSystem: Cleaned up custom volume audio for entity ").Append(Entity.GetEntityName()));
            }
        }
        return;
    }
    UFUNCTION()
    void Run_Job_AutoAssignCustomVolumeAudioWhenNearVolume() const
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
                this.Job_AutoAssignCustomVolumeAudioWhenNearVolume(local_40, local_42);
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
            this.Job_AutoAssignCustomVolumeAudioWhenNearVolume(local_178, local_42);
        }
        local_2.UpdateCachedEntityCount(local_106);
        if (local_7)
        {
            local_2.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateCustomVolumeAudio() const
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
                this.Job_UpdateCustomVolumeAudio(local_40, local_42, local_48);
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
            this.Job_UpdateCustomVolumeAudio(local_180, local_42, local_48);
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
    void Run_Job_CleanupCustomVolumeAudio() const
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
                this.Job_CleanupCustomVolumeAudio(local_40, local_42, local_48);
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
            this.Job_CleanupCustomVolumeAudio(local_180, local_42, local_48);
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
    void Run_Job_DebugDrawCustomVolumeAudio() const
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
                this.Job_DebugDrawCustomVolumeAudio(local_40, local_42, local_48);
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
            this.Job_DebugDrawCustomVolumeAudio(local_176, local_42, local_48);
        }
        local_2.UpdateCachedEntityCount(local_104);
        if (local_7)
        {
            local_2.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DebugHUDCustomVolumeAudio() const
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
                this.Job_DebugHUDCustomVolumeAudio(local_40, local_42, local_48);
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
            this.Job_DebugHUDCustomVolumeAudio(local_176, local_42, local_48);
        }
        local_2.UpdateCachedEntityCount(local_104);
        if (local_7)
        {
            local_2.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_CleanupCustomVolumeAudio() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorCustomVolumeAudioOnInactiveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_CleanupCustomVolumeAudio(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorCustomVolumeAudioOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_CleanupCustomVolumeAudio(local_46, local_52);
        }
        return;
    }
}


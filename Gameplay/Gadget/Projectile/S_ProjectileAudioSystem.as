
const FConsoleVariable CVar_Projectile_DebugAudio = FConsoleVariable();

class US_ProjectileAudioSystem : UECSScriptSystem
{
    US_ProjectileAudioSystem()
    {
        return;
    }
    UFUNCTION()
    void ClientJob_HandleProjectileInstantSFX(const FCE_ProjectileInstantSFX &inout SFXEvent) const
    {
        bool local_11;
        if (SFXEvent.Event.IsNull())
        {
            return;
        }
        FECSEntity local_6 = FECSEntity(SFXEvent.Sender);
        if (!(local_6.IsValid()))
        {
            return;
        }
        if (!(SFXEvent.bSelfOnly))
        {
            local_11 = false;
        }
        else
        {
            Has local_10;
            bool local_1 = (!(local_10.opCall()) == !(false));
            local_11 = local_1;
        }
        if (local_11)
        {
            return;
        }
        FGameAudioUtils::PlayEventOnEmitter(SFXEvent.Event, local_6, FLoadEventCallback(), EGameAudioEmitterPartType(0), SFXEvent.bFollow, false, false, FGameAudioUtils::GetCachedAudioWorld(), true);
        if (CVar_Projectile_DebugAudio.GetBool())
        {
            Print(FString().Append("ProjectileInstantSFX ").Append(SFXEvent.Event.GetAssetName()), 5.0f, FLinearColor::LucBlue);
        }
        return;
    }
    UFUNCTION()
    void ClientJob_TickProjectileDurationalSFX(const FECSEntity &inout Entity, const FC_ProjectileDurationalSFXList &inout SFXList) const
    {
        int local_6 = 0;
        bool local_11;
        bool local_15;
        Has local_36;
        int local_10 = local_6.PlayingEntries.Num() - 1;
        for (; local_10 >= 0; --local_10)
        {
            FProjectileDurationalSFXPlayingEntry& local_14 = local_6.PlayingEntries[local_10];
            local_15 = false;
            for (auto& local_30 : SFXList.GetActiveEntries())
            {
                if (local_30.GetTimelineIndex() == int(local_14.TimelineIndex) && (local_30.GetActionIndex() == int(local_14.ActionIndex)))
                {
                    local_15 = true;
                    break;
                }
            }
            if (!(local_15))
            {
                if (!(local_14.ExitEvent.IsNull()) && Entity.IsValid())
                {
                    local_11 = !(local_14.bSelfOnly);
                    if (local_11)
                    {
                        local_11 = true;
                    }
                    else
                    {
                        local_11 = local_36.opCall();
                    }
                    if (local_11)
                    {
                        FGameAudioUtils::PlayEventOnEmitter(local_14.ExitEvent, Entity, FLoadEventCallback(), EGameAudioEmitterPartType(0), local_14.bFollow, true, true, FGameAudioUtils::GetCachedAudioWorld(), true);
                        if (CVar_Projectile_DebugAudio.GetBool())
                        {
                            Print(FString().Append("TickProjectileDurationalSFX Exit ").Append(local_14.ExitEvent.GetAssetName()), 5.0f, FLinearColor::LucBlue);
                        }
                    }
                }
                local_6.PlayingEntries.RemoveAt(local_10);
            }
        }
        for (auto& local_30 : SFXList.GetActiveEntries())
        {
            local_11 = false;
            local_15 = local_11;
            auto local_62 = local_6.PlayingEntries.Iterator();
            for (; local_62.CanProceed;)
            {
                FProjectileDurationalSFXPlayingEntry& local_14_2 = local_62.Proceed();
                if (local_30.GetTimelineIndex() == int(local_14_2.TimelineIndex) && (local_30.GetActionIndex() == int(local_14_2.ActionIndex)))
                {
                    local_11 = true;
                    local_15 = local_11;
                    break;
                }
            }
            if (!(local_15))
            {
                if (!(local_30.GetEnterEvent().IsNull()))
                {
                    if (!(local_30.GetbSelfOnly()))
                    {
                        local_11 = true;
                    }
                    else
                    {
                        local_11 = local_36.opCall();
                    }
                    if (local_11)
                    {
                        FGameAudioUtils::PlayEventOnEmitter(local_30.GetEnterEvent(), Entity, FLoadEventCallback(), EGameAudioEmitterPartType(0), local_30.GetbFollow(), true, false, FGameAudioUtils::GetCachedAudioWorld(), true);
                        if (CVar_Projectile_DebugAudio.GetBool())
                        {
                            Print(FString().Append("TickProjectileDurationalSFX Enter ").Append(local_30.GetEnterEvent().GetAssetName()), 5.0f, FLinearColor::LucBlue);
                        }
                    }
                }
                FProjectileDurationalSFXPlayingEntry local_82;
                local_82.TimelineIndex = local_30.GetTimelineIndex();
                local_82.ActionIndex = local_30.GetActionIndex();
                local_82.ExitEvent = local_30.GetExitEvent();
                local_82.bFollow = local_30.GetbFollow();
                local_82.bSelfOnly = local_30.GetbSelfOnly();
                local_6.PlayingEntries.Add(local_82);
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_TickProjectileDurationalSFXRemove(const FECSEntity &inout Entity) const
    {
        Has local_6;
        if (!(Entity.IsActive()) || !(local_6.opCall()))
        {
            Remove local_12;
            local_12.opCall();
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnProjectileDurationalSFXViewRemove(const FECSEntity &inout Entity, const FC_ProjectileDurationalSFXView &inout SFXView) const
    {
        for (auto& local_16 : SFXView.PlayingEntries)
        {
            if (!(local_16.ExitEvent.IsNull()) && Entity.IsValid())
            {
                bool local_17;
                local_17 = !(local_16.bSelfOnly);
                if (local_17)
                {
                    local_17 = true;
                }
                else
                {
                    Has local_22;
                    local_17 = local_22.opCall();
                }
                if (local_17)
                {
                    FGameAudioUtils::PlayEventOnEmitter(local_16.ExitEvent, Entity, FLoadEventCallback(), EGameAudioEmitterPartType(0), local_16.bFollow, true, true, FGameAudioUtils::GetCachedAudioWorld(), true);
                    if (CVar_Projectile_DebugAudio.GetBool())
                    {
                        Print(FString().Append("ProjectileDurationalSFXViewRemove Exit ").Append(local_16.ExitEvent.GetAssetName()), 5.0f, FLinearColor::LucBlue);
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_TickProjectileAudioKeepSwitch(const FECSEntity &inout Entity, const FC_ProjectileAudioKeepSwitchList &inout SwitchList) const
    {
        int local_6 = 0;
        bool local_15;
        int local_10 = local_6.PlayingEntries.Num() - 1;
        for (; local_10 >= 0; --local_10)
        {
            FProjectileAudioKeepSwitchPlayingEntry& local_14 = local_6.PlayingEntries[local_10];
            local_15 = false;
            for (auto& local_30 : SwitchList.GetActiveEntries())
            {
                if (local_30.GetTimelineIndex() == int(local_14.TimelineIndex) && (local_30.GetActionIndex() == int(local_14.ActionIndex)))
                {
                    local_15 = true;
                    break;
                }
            }
            if (!(local_15))
            {
                if (!(local_14.ResetSwitchValue.IsNull()) && Entity.IsValid())
                {
                    FGameAudioUtils::SetAudioSwitch(local_14.ResetSwitchValue, Entity, FOnLoadEventCallbackWithEntity(), true, FGameAudioUtils::GetCachedAudioWorld());
                    if (CVar_Projectile_DebugAudio.GetBool())
                    {
                        Print(FString().Append("TickProjectileAudioKeepSwitch ResetSwitch ").Append(local_14.ResetSwitchValue.GetAssetName()), 5.0f, FLinearColor::LucBlue);
                    }
                }
                local_6.PlayingEntries.RemoveAt(local_10);
            }
        }
        for (auto& local_30 : SwitchList.GetActiveEntries())
        {
            local_15 = false;
            auto local_54 = local_6.PlayingEntries.Iterator();
            for (; local_54.CanProceed;)
            {
                FProjectileAudioKeepSwitchPlayingEntry& local_14_2 = local_54.Proceed();
                if (local_30.GetTimelineIndex() == int(local_14_2.TimelineIndex) && (local_30.GetActionIndex() == int(local_14_2.ActionIndex)))
                {
                    local_15 = true;
                    break;
                }
            }
            if (!(local_15))
            {
                if (!(local_30.GetKeepSwitchValue().IsNull()))
                {
                    FGameAudioUtils::SetAudioSwitch(local_30.GetKeepSwitchValue(), Entity, FOnLoadEventCallbackWithEntity(), true, FGameAudioUtils::GetCachedAudioWorld());
                    if (CVar_Projectile_DebugAudio.GetBool())
                    {
                        Print(FString().Append("TickProjectileAudioKeepSwitch KeepSwitch ").Append(local_30.GetKeepSwitchValue().GetAssetName()), 5.0f, FLinearColor::LucBlue);
                    }
                }
                FProjectileAudioKeepSwitchPlayingEntry local_72;
                local_72.TimelineIndex = local_30.GetTimelineIndex();
                local_72.ActionIndex = local_30.GetActionIndex();
                local_72.ResetSwitchValue = local_30.GetResetSwitchValue();
                local_6.PlayingEntries.Add(local_72);
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_TickProjectileAudioKeepSwitchRemove(const FECSEntity &inout Entity) const
    {
        Has local_6;
        if (!(Entity.IsActive()) || !(local_6.opCall()))
        {
            Remove local_12;
            local_12.opCall();
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnProjectileAudioKeepSwitchViewRemove(const FECSEntity &inout Entity, const FC_ProjectileAudioKeepSwitchView &inout SwitchView) const
    {
        for (auto& local_16 : SwitchView.PlayingEntries)
        {
            if (!(local_16.ResetSwitchValue.IsNull()) && Entity.IsValid())
            {
                FGameAudioUtils::SetAudioSwitch(local_16.ResetSwitchValue, Entity, FOnLoadEventCallbackWithEntity(), true, FGameAudioUtils::GetCachedAudioWorld());
                if (CVar_Projectile_DebugAudio.GetBool())
                {
                    Print(FString().Append("ProjectileAudioKeepSwitchViewRemove ResetSwitch ").Append(local_16.ResetSwitchValue.GetAssetName()), 5.0f, FLinearColor::LucBlue);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_TickProjectileAudioKeepRtpc(const FECSEntity &inout Entity, const FC_ProjectileAudioKeepRtpcList &inout RtpcList) const
    {
        int local_6 = 0;
        bool local_15;
        float32 local_40 = 0.0f;
        int local_10 = local_6.PlayingEntries.Num() - 1;
        for (; local_10 >= 0; --local_10)
        {
            FProjectileAudioKeepRtpcPlayingEntry& local_14 = local_6.PlayingEntries[local_10];
            local_15 = false;
            for (auto& local_30 : RtpcList.GetActiveEntries())
            {
                if (local_30.GetTimelineIndex() == local_14.TimelineIndex && (local_30.GetActionIndex() == int(local_14.ActionIndex)))
                {
                    local_15 = true;
                    break;
                }
            }
            if (!(local_15))
            {
                if (!(local_14.Rtpc.IsNull()) && Entity.IsValid())
                {
                    local_40 = local_14.ResetValue;
                    FGameAudioUtils::SetAudioRtpc(local_14.Rtpc, Entity, local_40, FMath::RoundToInt((local_14.InterpolateTime * 1000.0f)), FOnLoadEventCallbackWithEntity(), true, FGameAudioUtils::GetCachedAudioWorld());
                    if (CVar_Projectile_DebugAudio.GetBool())
                    {
                        Print(FString().Append("TickProjectileAudioKeepRtpc ResetRtpc ").Append(local_14.Rtpc.GetAssetName()).Append(" to ").Append(local_14.ResetValue), 5.0f, FLinearColor::LucBlue);
                    }
                }
                local_6.PlayingEntries.RemoveAt(local_10);
            }
        }
        for (auto& local_30 : RtpcList.GetActiveEntries())
        {
            local_15 = false;
            auto local_54 = local_6.PlayingEntries.Iterator();
            for (; local_54.CanProceed;)
            {
                FProjectileAudioKeepRtpcPlayingEntry& local_14_2 = local_54.Proceed();
                if (local_30.GetTimelineIndex() == int(local_14_2.TimelineIndex) && (local_30.GetActionIndex() == int(local_14_2.ActionIndex)))
                {
                    local_15 = true;
                    break;
                }
            }
            if (!(local_15))
            {
                if (!(local_30.GetRtpc().IsNull()))
                {
                    float32 local_39_2 = local_30.GetInterpolateTime() * 1000.0f;
                    FGameAudioUtils::SetAudioRtpc(local_30.GetRtpc(), Entity, local_40, FMath::RoundToInt(local_39_2), FOnLoadEventCallbackWithEntity(), true, FGameAudioUtils::GetCachedAudioWorld());
                    if (CVar_Projectile_DebugAudio.GetBool())
                    {
                        Print(FString().Append("TickProjectileAudioKeepRtpc SetRtpc ").Append(local_30.GetRtpc().GetAssetName()).Append(" to ").Append(local_39_2), 5.0f, FLinearColor::LucBlue);
                    }
                }
                FProjectileAudioKeepRtpcPlayingEntry local_74;
                local_74.TimelineIndex = local_30.GetTimelineIndex();
                local_74.ActionIndex = local_30.GetActionIndex();
                local_74.Rtpc = local_30.GetRtpc();
                local_74.ResetValue = local_30.GetResetValue();
                local_74.InterpolateTime = local_30.GetInterpolateTime();
                local_6.PlayingEntries.Add(local_74);
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_TickProjectileAudioKeepRtpcRemove(const FECSEntity &inout Entity) const
    {
        Has local_6;
        if (!(Entity.IsActive()) || !(local_6.opCall()))
        {
            Remove local_12;
            local_12.opCall();
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnProjectileAudioKeepRtpcViewRemove(const FECSEntity &inout Entity, const FC_ProjectileAudioKeepRtpcView &inout RtpcView) const
    {
        for (auto& local_16 : RtpcView.PlayingEntries)
        {
            if (!(local_16.Rtpc.IsNull()) && Entity.IsValid())
            {
                float32 local_25 = local_16.InterpolateTime * 1000.0f;
                local_25 = local_16.ResetValue;
                FGameAudioUtils::SetAudioRtpc(local_16.Rtpc, Entity, local_25, FMath::RoundToInt(local_25), FOnLoadEventCallbackWithEntity(), true, FGameAudioUtils::GetCachedAudioWorld());
                if (CVar_Projectile_DebugAudio.GetBool())
                {
                    Print(FString().Append("ProjectileAudioKeepRtpcViewRemove ResetRtpc ").Append(local_16.Rtpc.GetAssetName()).Append(" to ").Append(local_16.ResetValue), 5.0f, FLinearColor::LucBlue);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleProjectileInstantSFX() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ProjectileInstantSFX> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ProjectileInstantSFX& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleProjectileInstantSFX(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TickProjectileDurationalSFX() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_162 = 0;
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
                this.ClientJob_TickProjectileDurationalSFX(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_90 = 0;
        FECSRuntimeViewIterator local_124 = local_80.Iterator();
        for (; local_124.CanProceed;)
        {
            local_36 = local_124.Proceed();
            ++local_90;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_TickProjectileDurationalSFX(local_162, local_38);
        }
        local_2.UpdateCachedEntityCount(local_90);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TickProjectileDurationalSFXRemove() const
    {
        const FECSEntity& local_36;
        int local_152 = 0;
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
                this.ClientJob_TickProjectileDurationalSFXRemove(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_80 = 0;
        FECSRuntimeViewIterator local_114 = local_74.Iterator();
        for (; local_114.CanProceed;)
        {
            local_36 = local_114.Proceed();
            ++local_80;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_TickProjectileDurationalSFXRemove(local_152);
        }
        local_2.UpdateCachedEntityCount(local_80);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnProjectileDurationalSFXViewRemove() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorProjectileDurationalSFXViewOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnProjectileDurationalSFXViewRemove(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TickProjectileAudioKeepSwitch() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_162 = 0;
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
                this.ClientJob_TickProjectileAudioKeepSwitch(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_90 = 0;
        FECSRuntimeViewIterator local_124 = local_80.Iterator();
        for (; local_124.CanProceed;)
        {
            local_36 = local_124.Proceed();
            ++local_90;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_TickProjectileAudioKeepSwitch(local_162, local_38);
        }
        local_2.UpdateCachedEntityCount(local_90);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TickProjectileAudioKeepSwitchRemove() const
    {
        const FECSEntity& local_36;
        int local_152 = 0;
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
                this.ClientJob_TickProjectileAudioKeepSwitchRemove(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_80 = 0;
        FECSRuntimeViewIterator local_114 = local_74.Iterator();
        for (; local_114.CanProceed;)
        {
            local_36 = local_114.Proceed();
            ++local_80;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_TickProjectileAudioKeepSwitchRemove(local_152);
        }
        local_2.UpdateCachedEntityCount(local_80);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnProjectileAudioKeepSwitchViewRemove() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorProjectileAudioKeepSwitchViewOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnProjectileAudioKeepSwitchViewRemove(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TickProjectileAudioKeepRtpc() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_162 = 0;
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
                this.ClientJob_TickProjectileAudioKeepRtpc(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_90 = 0;
        FECSRuntimeViewIterator local_124 = local_80.Iterator();
        for (; local_124.CanProceed;)
        {
            local_36 = local_124.Proceed();
            ++local_90;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_TickProjectileAudioKeepRtpc(local_162, local_38);
        }
        local_2.UpdateCachedEntityCount(local_90);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TickProjectileAudioKeepRtpcRemove() const
    {
        const FECSEntity& local_36;
        int local_152 = 0;
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
                this.ClientJob_TickProjectileAudioKeepRtpcRemove(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_80 = 0;
        FECSRuntimeViewIterator local_114 = local_74.Iterator();
        for (; local_114.CanProceed;)
        {
            local_36 = local_114.Proceed();
            ++local_80;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_TickProjectileAudioKeepRtpcRemove(local_152);
        }
        local_2.UpdateCachedEntityCount(local_80);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnProjectileAudioKeepRtpcViewRemove() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorProjectileAudioKeepRtpcViewOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnProjectileAudioKeepRtpcViewRemove(local_46, local_52);
        }
        return;
    }
}


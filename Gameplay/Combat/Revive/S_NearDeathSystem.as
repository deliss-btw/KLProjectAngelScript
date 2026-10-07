

class US_NearDeathSystem : UECSScriptSystem
{
    US_NearDeathSystem()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_InitNearDeathRule() const
    {
        int local_8 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        if (::FLevelUtils::GetCurrentLevelInfoConfig(nullptr))
        {
            FGameModeFlowSettings local_106 = ::UniversalGameModeUtils::GetGameModeFlowSettings();
            if (local_106.IsValid())
            {
                local_8.SetReviveData(local_106.ReviveRule);
            }
            else
            {
                local_8.SetReviveData(GetReviveRule());
            }
            if (local_8.GetReviveData().IsSet())
            {
                return;
            }
        }
        local_8.SetReviveData(::NearDeathSettings::Get().DefaultReviveRule);
        return;
    }
    UFUNCTION()
    void Job_UpdateDeferNearDeathTransition(const FECSEntity &inout Entity, FC_NearDeathDeferTransition &inout DeferTransition) const
    {
        if (DeferTransition.GetbWaitLand())
        {
            Get local_6;
            const FC_CharacterMovement& local_8 = local_6.opCall();
            if (local_8)
            {
                DeferTransition.SetbWaitLand(local_8.GetbAirborne());
            }
            else
            {
                DeferTransition.SetbWaitLand(false);
            }
        }
        if (!(DeferTransition.NeedDefer()))
        {
            ::FLifeCycleUtils::ESMTransitToNearDeath(Entity);
            Remove local_12;
            local_12.opCall();
        }
        return;
    }
    UFUNCTION()
    void ServerJob_ReduceNearDeathHP(const FECSEntity &inout Entity, FC_NearDeathInfo &inout NearDeathInfo, const FCS_FixedTime &inout FixedTime, const FCS_NearDeathRule &inout Rule) const
    {
        if (!(Rule.GetReviveData()))
        {
            return;
        }
        float32 local_6 = NearDeathInfo.GetNearDeathHP() - (float32(float32(FixedTime.DeltaTime.ToSeconds()) * (0 / 100.0f)) * NearDeathInfo.GetMaxNearDeathHP());
        NearDeathInfo.SetNearDeathHP(FMath::Max(0.0f, local_6));
        if (NearDeathInfo.GetNearDeathHP() <= 0.0f)
        {
            Has local_14;
            bool local_1 = local_14.opCall();
            ::FLifeCycleUtils::EntityDeath(Entity, NearDeathInfo.GetKilledByEntity(), FixedTime.Time, true, true, false, true, EDeathReason(0));
            if (!(local_1))
            {
                if (NearDeathInfo.GetbNearDeathHPZeroByDamage())
                {
                    ::FLifeCycleUtils::ServerDataTrackPlayerDeath(Entity, EServerDataTrackDeathReason(1), NearDeathInfo.GetKilledByEntity());
                    return;
                }
                ::FLifeCycleUtils::ServerDataTrackPlayerDeath(Entity, EServerDataTrackDeathReason(2), NearDeathInfo.GetKilledByEntity());
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleRescueNearDeath(const FCE_RescueNearDeathEvent &inout Event) const
    {
        ::FLifeCycleUtils::EntityRescueFromNearDeath(Event.Sender, Event.RescueByEntity, Event.Time, Event.bRescueWithAnimation, Event.OverrideHpRatio);
        return;
    }
    UFUNCTION()
    void ServerJob_HandleRequestGiveUpNearDeath(const FCE_PlayerRequestGiveUpNearDeath &inout Event) const
    {
        Get local_4;
        const FC_NearDeathInfo& local_6 = local_4.opCall();
        if (local_6)
        {
            Has local_12;
            bool local_7 = local_12.opCall();
            ::FLifeCycleUtils::EntityDeath(Event.Sender, local_6.GetKilledByEntity(), Event.Time, true, true, false, true, EDeathReason(0));
            if (!(local_7))
            {
                ::FLifeCycleUtils::ServerDataTrackPlayerDeath(Event.Sender, EServerDataTrackDeathReason(3), local_6.GetKilledByEntity());
            }
        }
        return;
    }
    UFUNCTION()
    void MonitorServerJob_AddNearDeathBuff(const FECSEntity &inout Entity, const FC_NearDeathTag &inout NearDeathTag) const
    {
        int local_8 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        if (!(!(local_8)) && local_8.GetReviveData())
        {
            FBuffConfigRef local_34;
            if (local_34.IsValid())
            {
                FECSWorldPtr local_2_2 = ECS::GetECSWorld();
                Get local_40;
                FFPTime local_36 = FFPTime(local_40.opCall().Time);
                FBuffUtils::AddBuff(Entity, local_34, local_36, Entity, false, -1.0f, 1, false);
            }
        }
        return;
    }
    UFUNCTION()
    void MonitorServerJob_RemoveNearDeathBuff(const FECSEntity &inout Entity, const FC_NearDeathTag &inout NearDeathTag) const
    {
        int local_8 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        if (!(!(local_8)) && local_8.GetReviveData())
        {
            FBuffConfigRef local_34;
            if (local_34.IsValid())
            {
                FECSWorldPtr local_2_2 = ECS::GetECSWorld();
                Get local_40;
                FFPTime local_36 = FFPTime(local_40.opCall().Time);
                FBuffUtils::RemoveBuff(Entity, local_34, local_36, EBuffEndType(0));
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_AddBeingRescuedInfo(const FECSEntity &inout Entity, const FC_BeingRescuedInfo &inout BeingRescuedInfo) const
    {
        Entity.AddGameplayTag(GameplayTags::ESM_Ban_Move, NAME_None);
        return;
    }
    UFUNCTION()
    void Monitor_RemoveBeingRescuedInfo(const FECSEntity &inout Entity, const FC_BeingRescuedInfo &inout BeingRescuedInfo) const
    {
        Entity.RemoveGameplayTag(GameplayTags::ESM_Ban_Move, NAME_None);
        return;
    }
    UFUNCTION()
    void Monitor_ClientOnAddRescuedInteractionInProgress(const FECSEntity &inout Entity, const FC_BeingRescuedInfo &inout BeingRescuedInfo) const
    {
        Entity.AddGameplayTag(GameplayTags::CombatState_BeingRescued, NAME_None);
        return;
    }
    UFUNCTION()
    void Monitor_ClientOnRemoveRescuedInteractionInProgress(const FC_BeingRescuedInfo &inout C_RescuedInfo, const FECSEntity &inout Entity) const
    {
        Entity.RemoveGameplayTag(GameplayTags::CombatState_BeingRescued, NAME_None);
        return;
    }
    UFUNCTION()
    void Monitor_ClientOnRemoveRescuedClearProgress(const FC_BeingRescuedInfo &inout C_RescuedInfo, const FECSEntity &inout Entity) const
    {
        bool local_1;
        if (!(Entity.IsValid()))
        {
            local_1 = false;
        }
        else
        {
            Has local_6;
            local_1 = local_6.opCall();
        }
        if (local_1)
        {
            Remove local_12;
            local_12.opCall();
        }
        return;
    }
    UFUNCTION()
    void ClientOnRescuedInteractionInProgress(const FC_BeingRescuedInfo &inout C_RescuedInfo, const FECSEntity &inout Entity) const
    {
        bool local_1;
        ModifyOrAdd local_30;
        if (C_RescuedInfo)
        {
            if (!(FECSEntity(C_RescuedInfo.GetRescuedByEntity()).IsValid()))
            {
                local_1 = false;
            }
            else
            {
                Has local_14;
                local_1 = local_14.opCall();
            }
            if (local_1)
            {
                FC_LocalInteractProgress local_22;
                if (local_22.MaxProgressValue > 0.0f)
                {
                    local_30.opCall().RescueProgress = (local_22.ProgressValue / local_22.MaxProgressValue);
                }
                else
                {
                    local_30.opCall().RescueProgress = 0.0f;
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_InitNearDeathRule() const
    {
        ECS::GetContextJob();
        this.ServerJob_InitNearDeathRule();
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateDeferNearDeathTransition() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_174 = 0;
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
                this.Job_UpdateDeferNearDeathTransition(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_84.Iterator();
        for (; local_136.CanProceed;)
        {
            local_36 = local_136.Proceed();
            ++local_102;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_UpdateDeferNearDeathTransition(local_174, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_102);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_ReduceNearDeathHP() const
    {
        int local_14 = 0;
        int local_16 = 0;
        const FECSEntity& local_50;
        int local_52 = 0;
        MarkModifiedIfDirty local_60;
        int local_184 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_6 = this.GetECSWorld();
        Has local_10;
        if (!(local_10.opCall()))
        {
            return;
        }
        FECSWorldPtr local_6_2 = this.GetECSWorld();
        int local_22 = 0;
        int local_21 = local_22;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_6_3 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_26 = local_4.GetViewCacheEntities();
            int local_27 = 0;
            for (auto& local_42 : local_26)
            {
                local_42;
                FECSEntity local_46;
                if (!(local_46.IsValid()))
                {
                    continue;
                }
                ++local_27;
                FECSEntityScopeCycleCounter local_47 = FECSEntityScopeCycleCounter(local_46);
                this.ServerJob_ReduceNearDeathHP(local_50, local_52, local_14, local_16);
                local_60.opCall(local_52);
            }
            local_4.UpdateCachedEntityCount(local_27);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Exclude(local_98).opCall();
        Exclude(local_98).opCall();
        bool local_11 = local_4.BeginViewCacheBuild();
        int local_28 = local_4.GetViewCacheEpoch();
        int local_112 = 0;
        FECSRuntimeViewIterator local_146 = local_98.Iterator();
        for (; local_146.CanProceed;)
        {
            local_50 = local_146.Proceed();
            ++local_112;
            if (local_11)
            {
                local_4.AddViewCacheEntity(local_50.GetId());
            }
            FECSEntityScopeCycleCounter local_47_2 = FECSEntityScopeCycleCounter(local_50);
            FECSEntity::ModifyAndMarkDirtyManually<FC_NearDeathInfo> local_56 = FECSEntity::ModifyAndMarkDirtyManually<FC_NearDeathInfo>(local_50);
            this.ServerJob_ReduceNearDeathHP(local_184, local_52, local_14, local_16);
            local_60.opCall(local_52);
        }
        local_4.UpdateCachedEntityCount(local_112);
        if (local_11)
        {
            local_4.CommitViewCacheBuild(local_28);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleRescueNearDeath() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_RescueNearDeathEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_RescueNearDeathEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleRescueNearDeath(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleRequestGiveUpNearDeath() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerRequestGiveUpNearDeath> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayerRequestGiveUpNearDeath& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleRequestGiveUpNearDeath(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_MonitorServerJob_AddNearDeathBuff() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorNearDeathTagOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.MonitorServerJob_AddNearDeathBuff(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_MonitorServerJob_RemoveNearDeathBuff() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorNearDeathTagOnRemoveView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.MonitorServerJob_RemoveNearDeathBuff(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_AddBeingRescuedInfo() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorBeingRescuedInfoOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_AddBeingRescuedInfo(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_RemoveBeingRescuedInfo() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorBeingRescuedInfoOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_RemoveBeingRescuedInfo(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ClientOnAddRescuedInteractionInProgress() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorBeingRescuedInfoOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ClientOnAddRescuedInteractionInProgress(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ClientOnRemoveRescuedInteractionInProgress() const
    {
        int local_50 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorBeingRescuedInfoOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_48 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ClientOnRemoveRescuedInteractionInProgress(local_50, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ClientOnRemoveRescuedClearProgress() const
    {
        int local_50 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorBeingRescuedInfoOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_48 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ClientOnRemoveRescuedClearProgress(local_50, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientOnRescuedInteractionInProgress() const
    {
        int local_36 = 0;
        const FECSEntity& local_42;
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
                this.ClientOnRescuedInteractionInProgress(local_36, local_42);
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
            local_42 = local_124.Proceed();
            ++local_90;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_42.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_42);
            this.ClientOnRescuedInteractionInProgress(local_36, local_162);
        }
        local_2.UpdateCachedEntityCount(local_90);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}


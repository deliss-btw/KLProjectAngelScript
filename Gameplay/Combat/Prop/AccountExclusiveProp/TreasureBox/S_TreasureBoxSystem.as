

class US_TreasureBoxSystem : UECSScriptSystem
{
    US_TreasureBoxSystem()
    {
        return;
    }
    UFUNCTION()
    void Monitor_ServerRemoveTreasureBox(const FECSEntity &inout Entity, const FC_TreasureBoxConfig &inout TreasureBoxConfig) const
    {
        int local_8 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        if (!(local_8))
        {
            return;
        }
        return;
    }
    UFUNCTION()
    void ClientJob_InitAccountExclusiveTreasureBoxState(const FECSEntity &inout Entity, const FC_LevelObjectStatConfig &inout LevelObjectStatConfig, const FC_TreasureBoxConfig &inout TreasureBoxConfig, const FCS_FixedTime &inout FixedTime) const
    {
        int local_14 = 0;
        int local_23 = 0;
        int local_44 = 0;
        FECSEntity::ModifyOrAdd<FC_ESMExternalTransitOnLocalReg> local_48;
        int local_63 = 0;
        int local_84 = 0;
        Remove local_4;
        local_4.opCall();
        if (!(LevelObjectStatConfig.LevelObjectStatConfig.IsSet()))
        {
            return;
        }
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        if (!(local_14))
        {
            return;
        }
        FECSEntity local_22 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
        if (local_22.IsValid())
        {
            if (local_14.LevelObjectStatIdToEntityMap.Contains(local_23))
            {
                if (FECSEntity(local_14.LevelObjectStatIdToEntityMap[local_23]).IsValid())
                {
                    Get local_32;
                    const FC_DefaultToLocal& local_34 = local_32.opCall();
                    if (local_34)
                    {
                        if (FECSEntity(local_34.LocalEntityId).IsValid())
                        {
                            bool local_5 = ::TreasureBoxUtils::IsTreasureBoxCoolingDown(local_22, local_23);
                            bool local_39 = !(::FLevelObjectStatUtils::IsLevelObjectRecorded(local_22, LevelObjectStatConfig.LevelObjectStatConfig));
                            if ((int(::TreasureBoxUtils::GetTreasureBoxRecordState(local_22, local_23))) == 1)
                            {
                                FC_ESMExternalTransitOnLocalReg& local_50 = local_48.opCall();
                                if (local_50)
                                {
                                    const FTreasureBoxStateData& local_54 = 1.GetData();
                                    local_50.SMName = local_54.StateMachineName;
                                    local_50.StateName = local_54.StateName;
                                }
                            }
                            else
                            {
                                if (local_5)
                                {
                                    int local_55;
                                    FC_ESMExternalTransitOnLocalReg& local_50_2 = local_48.opCall();
                                    if (local_50_2)
                                    {
                                        const FTreasureBoxStateData& local_54_2 = 1.GetData();
                                        local_50_2.SMName = local_54_2.StateMachineName;
                                        local_50_2.StateName = local_54_2.StateName;
                                    }
                                    local_55 = local_44;
                                    if (local_55 > 0)
                                    {
                                        ModifyOrAdd local_60;
                                        FC_TreasureBoxRuntime& local_62 = local_60.opCall();
                                        if (local_62)
                                        {
                                            local_23 = FDateTime::UtcNow().ToUnixTimestamp();
                                            int local_69 = 0;
                                            if (::TreasureBoxUtils::GetTreasureBoxLastTime(local_22, local_63, local_69))
                                            {
                                                local_62.RefreshTargetTime = FFPTime((FixedTime.Time.ToSeconds() + local_55) - (local_23 - local_69));
                                            }
                                        }
                                    }
                                }
                                else
                                {
                                    if (local_39)
                                    {
                                        FC_ESMExternalTransitOnLocalReg& local_50_3 = local_48.opCall();
                                        if (local_50_3)
                                        {
                                            const FTreasureBoxStateData& local_54_3 = 3.GetData();
                                            local_50_3.SMName = local_54_3.StateMachineName;
                                            local_50_3.StateName = local_54_3.StateName;
                                        }
                                    }
                                    else
                                    {
                                        if (!(local_84) || local_84.CheckUnlockConditions(local_22))
                                        {
                                            FC_ESMExternalTransitOnLocalReg& local_50_4 = local_48.opCall();
                                            if (local_50_4)
                                            {
                                                const FTreasureBoxStateData& local_54_4 = 2.GetData();
                                                local_50_4.SMName = local_54_4.StateMachineName;
                                                local_50_4.StateName = local_54_4.StateName;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_ServerInitTreasureBoxStateOnPlayerLogin(const FCS_NetLivePlayerMask &inout NetLivePlayerMask) const
    {
        int local_8 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        if (!(local_8))
        {
            return;
        }
        TArray<FECSEntity> local_18 = FGameUtils::GetAllPlayerControllerEntities(true);
        Has local_36;
        for (auto& local_32 : local_18)
        {
            if (!(local_36.opCall()))
            {
                continue;
            }
            Get local_42;
            int local_37 = local_42.opCall().GetPlayerIndex();
            bool local_9 = NetLivePlayerMask.NewPlayerMask.GetBit(local_37);
            bool local_45 = NetLivePlayerMask.LastMask.GetBit(local_37);
            bool local_46 = NetLivePlayerMask.Mask.GetBit(local_37);
            if (((local_9 && local_45)) || ((!(local_9) && !(local_46)) && local_45))
            {
                ::TreasureBoxSpawnDropItemUtils::DestroyTrackedTreasureForPlayerIndex(local_37);
            }
            if (local_9)
            {
                for (auto& local_68 : local_8.GetTreasureBoxes())
                {
                    ::TreasureBoxSpawnDropItemUtils::RespawnUncollectedTreasureForPlayer(local_68.GetKey(), local_32);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_ServerInitTreasureBoxStateOnBoxSpawn(const FECSEntity &inout Entity, const FC_TreasureBoxConfig &inout TreasureBoxConfig) const
    {
        int local_14 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Has local_6;
        if (!(local_6.opCall()))
        {
            return;
        }
        if (!(local_14) || !(local_14.LevelObjectStatConfig.IsSet()))
        {
            return;
        }
        TArray<FECSEntity> local_24 = FGameUtils::GetAllPlayerControllerEntities(true);
        for (auto& local_38 : local_24)
        {
            ::TreasureBoxSpawnDropItemUtils::RespawnUncollectedTreasureForPlayer(Entity, TDataObjectPtr<FLevelObjectStatConfig>(), local_38);
        }
        return;
    }
    UFUNCTION()
    void Monitor_ServerDestroyTreasureBoxDropItemsOnBoxRemove(const FECSEntity &inout Entity, const FC_TreasureBoxConfig &inout TreasureBoxConfig) const
    {
        ::TreasureBoxSpawnDropItemUtils::DestroyTrackedTreasureForBox(Entity);
        return;
    }
    UFUNCTION()
    void ClientJob_HandleTreasureBoxRefreshTargetTime(const FCE_TreasureBoxRefreshTargetTime &inout Event) const
    {
        if (Event.TreasureBoxEntity.IsValid())
        {
            ModifyOrAdd local_6;
            FC_TreasureBoxRuntime& local_8 = local_6.opCall();
            if (local_8)
            {
                local_8.RefreshTargetTime = Event.RefreshTargetTime;
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_HandleTreasureBoxStateChanged(const FCE_TreasureBoxStateChanged &inout Event) const
    {
        int local_8 = 0;
        int local_14 = 0;
        if (!(Event.TreasureBoxEntity.IsValid()))
        {
            return;
        }
        if (!(local_8))
        {
            return;
        }
        if (!(local_14))
        {
            return;
        }
        if (!(FECSEntity(local_14.LocalEntityId).IsValid()))
        {
            return;
        }
        if ((int(Event.OldState) != 1 && (int(Event.NewState) == 1)))
        {
            ModifyOrAdd local_30;
            FC_ESMExternalTransitOnLocalReg& local_32 = local_30.opCall();
            if (local_32)
            {
                const FTreasureBoxStateData& local_34 = 4.GetData();
                local_32.SMName = local_34.StateMachineName;
                local_32.StateName = local_34.StateName;
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_HandleTreasureBoxRefreshTimer(const FC_TreasureBoxRuntime &inout TreasureBoxRuntime, const FECSEntity &inout TreasureBoxEntity) const
    {
        int local_10 = 0;
        if (ECS::GetContextTime().opCmp(TreasureBoxRuntime.RefreshTargetTime) >= 0)
        {
            if (!(local_10))
            {
                return;
            }
            Get local_14;
            const FC_DefaultToLocal& local_16 = local_14.opCall();
            if (local_16)
            {
                if (FECSEntity(local_16.LocalEntityId).IsValid())
                {
                    ModifyOrAdd local_28;
                    FC_ESMExternalTransitOnLocalReg& local_30 = local_28.opCall();
                    if (local_30)
                    {
                        const FTreasureBoxStateData& local_34 = 2.GetData();
                        local_30.SMName = local_34.StateMachineName;
                        local_30.StateName = local_34.StateName;
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleRemoveSpawnedPrefabTracker(const FC_TreasureTracker &inout TreasureTracker, const FECSEntity &inout TreasureEntity) const
    {
        int local_16 = 0;
        int local_18 = 0;
        ::TreasureBoxSpawnDropItemUtils::UnregisterTrackedTreasure(TreasureEntity);
        if (!(TreasureTracker.bCollected))
        {
            return;
        }
        FECSEntity local_6 = TreasureTracker.TrackPlayerEntity;
        if (!(local_6.IsValid()))
        {
            return;
        }
        FECSEntity local_10 = TreasureTracker.TreasureBoxEntity;
        if (!(local_10.IsValid()))
        {
            return;
        }
        if (!(local_16))
        {
            return;
        }
        int local_17 = local_18;
        if (local_17 >= 0)
        {
            FFPTime local_24 = FFPTime(-1);
            SendEvent local_22;
            FCE_TreasureBoxRefreshTargetTime& local_26 = local_22.opCall(local_24);
            if (local_26)
            {
                local_26.TreasureBoxEntity = local_10;
                local_26.RefreshTargetTime = FFPTime((ECS::GetContextTime().ToSeconds() + local_17));
            }
        }
        ::TreasureBoxUtils::SetTreasureBoxRecordState(local_6, TDataObjectPtr<FLevelObjectStatConfig>(), ETreasureBoxRecordState(2), true);
        return;
    }
    UFUNCTION()
    void Run_Monitor_ServerRemoveTreasureBox() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorTreasureBoxConfigOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ServerRemoveTreasureBox(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_InitAccountExclusiveTreasureBoxState() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_180 = 0;
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
                this.ClientJob_InitAccountExclusiveTreasureBoxState(local_40, local_42, local_48, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
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
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_90.Iterator();
        for (; local_142.CanProceed;)
        {
            local_40 = local_142.Proceed();
            ++local_108;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ClientJob_InitAccountExclusiveTreasureBoxState(local_180, local_42, local_48, local_6);
        }
        local_4.UpdateCachedEntityCount(local_108);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ServerInitTreasureBoxStateOnPlayerLogin() const
    {
        int local_24 = 0;
        ECS::GetContextJob();
        if (ECSInternal::GetMonitorSingletonOnModify(this.GetECSWorld(), FCS_NetLivePlayerMask, EECSRegType(0), true, true).bIsMonitored)
        {
            this.Monitor_ServerInitTreasureBoxStateOnPlayerLogin(local_24);
        }
        if (ECSInternal::GetMonitorSingletonOnAssign(this.GetECSWorld(), FCS_NetLivePlayerMask, EECSRegType(0), true, true).bIsMonitored)
        {
            this.Monitor_ServerInitTreasureBoxStateOnPlayerLogin(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ServerInitTreasureBoxStateOnBoxSpawn() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorTreasureBoxConfigOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ServerInitTreasureBoxStateOnBoxSpawn(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ServerDestroyTreasureBoxDropItemsOnBoxRemove() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorTreasureBoxConfigOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ServerDestroyTreasureBoxDropItemsOnBoxRemove(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleTreasureBoxRefreshTargetTime() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_TreasureBoxRefreshTargetTime> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_TreasureBoxRefreshTargetTime& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleTreasureBoxRefreshTargetTime(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleTreasureBoxStateChanged() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_TreasureBoxStateChanged> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_TreasureBoxStateChanged& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleTreasureBoxStateChanged(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    void Monitor___JobTimer_Pre___ClientJob_HandleTreasureBoxRefreshTimer(const FC_TreasureBoxRuntime &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.RefreshTargetTime;
        FName local_8 = FName("S_TreasureBoxSystem::ClientJob_HandleTreasureBoxRefreshTimer");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___ClientJob_HandleTreasureBoxRefreshTimer(const FC_TreasureBoxRuntime &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.RefreshTargetTime;
        FName local_8 = FName("S_TreasureBoxSystem::ClientJob_HandleTreasureBoxRefreshTimer");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___ClientJob_HandleTreasureBoxRefreshTimer() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorTreasureBoxRuntimeOnModifyView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___ClientJob_HandleTreasureBoxRefreshTimer(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorTreasureBoxRuntimeOnActiveView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___ClientJob_HandleTreasureBoxRefreshTimer(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___ClientJob_HandleTreasureBoxRefreshTimer() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorTreasureBoxRuntimeOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___ClientJob_HandleTreasureBoxRefreshTimer(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorTreasureBoxRuntimeOnActiveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___ClientJob_HandleTreasureBoxRefreshTimer(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleTreasureBoxRefreshTimer() const
    {
        int local_38 = 0;
        int local_46 = 0;
        int local_48 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        local_2.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_10 = local_2.GetExternalEntityList();
        FECSEntity local_28;
        for (auto& local_24 : local_10)
        {
            local_24;
            FECSEntityScopeCycleCounter local_29 = FECSEntityScopeCycleCounter(local_28);
            bool local_7 = false;
            bool local_31 = !(false);
            if (!(local_28.IsActive()) == local_31)
            {
                continue;
            }
            if (!(local_38))
            {
                continue;
            }
            FFPTime local_40 = local_38.RefreshTargetTime;
            if (local_40.opCmp(0.0) < 0 || (local_38.RefreshTargetTime == FPTIME_MAX))
            {
                continue;
            }
            if (local_7)
            {
                continue;
            }
            this.ClientJob_HandleTreasureBoxRefreshTimer(local_46, local_48);
        }
        local_2.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleRemoveSpawnedPrefabTracker() const
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
                this.ServerJob_HandleRemoveSpawnedPrefabTracker(local_36, local_42);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
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
            this.ServerJob_HandleRemoveSpawnedPrefabTracker(local_36, local_162);
        }
        local_2.UpdateCachedEntityCount(local_90);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}


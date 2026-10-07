
enum EExploreUnlockType
{
    CollectionPrefab,
    Teleporter,
}


class US_LevelDataTrackerSystem : UECSScriptSystem
{
    US_LevelDataTrackerSystem()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_TrackPlayerLogin(const FCE_PlayerLoginEvent &inout Event) const
    {
        int local_12 = 0;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (!(local_4.IsValid()))
        {
            return;
        }
        if (!(local_12))
        {
            return;
        }
        if (!(Event.bIsReconnect))
        {
            FPbPlayerLogDsPlayerEnter local_22;
            local_22.SetEnterType(0);
            XLog(ELog(80), FString().Append("[LevelDataTracker] PLAYER_ENTER report: uid=").Append(local_12.GetPlayerId()).Append(" enter_type=").Append(local_22.GetEnterType()));
            ::ServerDataTrackerHelper::LogProtoMessage3WithPlayer(local_4, 102001, local_22.ToWrapper());
        }
        else
        {
            FPbPlayerLogDsPlayerReconnect local_46;
            XLog(ELog(80), FString().Append("[LevelDataTracker] PLAYER_RECONNECT report: uid=").Append(local_12.GetPlayerId()));
            ::ServerDataTrackerHelper::LogProtoMessage3WithPlayer(local_4, 102004, local_46.ToWrapper());
        }
        return;
    }
    UFUNCTION()
    void ServerJob_TrackPlayerLeave(const FCE_PlayerLeaveEvent &inout Event) const
    {
        int local_12 = 0;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (!(local_4.IsValid()))
        {
            return;
        }
        if (!(local_12))
        {
            return;
        }
        Get local_16;
        const FC_PlayerWorldRegion& local_18 = local_16.opCall();
        if (local_18)
        {
            int64 local_22 = this.GetAreaIdFromRegion(local_18.GetRegionEntity());
            if (local_22 != 0)
            {
                FPbPlayerLogDsExploreAreaChange local_32;
                local_32.SetFromAreaId(local_22);
                local_32.SetToAreaId(0);
                FFPTime local_34 = FFPTime(local_18.GetEnterTime());
                if (local_34.opCmp(0.0) > 0)
                {
                    local_32.SetStayDuration(uint((FMath::Max(0.0, (FFPTime(Event.Time) - local_18.GetEnterTime()).ToSeconds()))));
                }
                XLog(ELog(80), FString().Append("[LevelDataTracker] AREA_CHANGE (leave) report: uid=").Append(local_12.GetPlayerId()).Append(" from=").Append(local_22).Append(" to=0 stay=").Append(local_32.GetStayDuration()).Append("s"));
                ::ServerDataTrackerHelper::LogProtoMessage3WithPlayer(local_4, 104002, local_32.ToWrapper());
            }
        }
        FPbPlayerLogDsPlayerLeave local_70;
        local_70.SetLeaveType(this.GetLeaveType(local_4));
        local_70.SetMidwayLeave(this.IsCommissionMidwayLeave());
        Get local_74;
        const FC_PlayerEnterDSTime& local_76 = local_74.opCall();
        if (local_76)
        {
            FFPTime local_42 = local_76.EnterTime;
            if (local_42.opCmp(0.0) > 0)
            {
                FFPTime local_42_2 = (FFPTime(Event.Time) - local_76.EnterTime);
                local_70.SetDuration(uint((FMath::Max(0.0, local_42_2.ToSeconds()))));
            }
        }
        XLog(ELog(80), FString().Append("[LevelDataTracker] PLAYER_LEAVE report: uid=").Append(local_12.GetPlayerId()).Append(" leave_type=").Append(local_70.GetLeaveType()).Append(" duration=").Append(local_70.GetDuration()).Append("s midway_leave=").Append(local_70.GetMidwayLeave()));
        ::ServerDataTrackerHelper::LogProtoMessage3WithPlayer(local_4, 102002, local_70.ToWrapper());
        return;
    }
    UFUNCTION()
    void Monitor_TrackPlayerDisconnect(const FECSEntity &inout PlayerEntity, const FC_DestroyDisconnectedPlayerTimer &inout Timer) const
    {
        int local_6 = 0;
        if (!(local_6))
        {
            return;
        }
        FPbPlayerLogDsPlayerDisconnect local_18;
        XLog(ELog(80), FString().Append("[LevelDataTracker] PLAYER_DISCONNECT report: uid=").Append(local_6.GetPlayerId()));
        ::ServerDataTrackerHelper::LogProtoMessage3WithPlayer(PlayerEntity, 102003, local_18.ToWrapper());
        return;
    }
    UFUNCTION()
    void ServerJob_TrackRegionChanged(const FCE_PlayerWorldRegionChanged &inout Event) const
    {
        int local_12 = 0;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (!(local_4.IsValid()))
        {
            return;
        }
        if (!(local_12))
        {
            return;
        }
        int64 local_16 = this.GetAreaIdFromRegion(Event.PrevRegionEntity);
        int64 local_14 = this.GetAreaIdFromRegion(Event.NewRegionEntity);
        if (local_16 == local_14)
        {
            return;
        }
        if (local_16 == 0)
        {
            FPbPlayerLogDsExploreAreaEnter local_28;
            local_28.SetAreaId(local_14);
            XLog(ELog(80), FString().Append("[LevelDataTracker] AREA_ENTER report: uid=").Append(local_12.GetPlayerId()).Append(" area_id=").Append(local_14));
            ::ServerDataTrackerHelper::LogProtoMessage3WithPlayer(local_4, 104001, local_28.ToWrapper());
        }
        else
        {
            FPbPlayerLogDsExploreAreaChange local_52;
            local_52.SetFromAreaId(local_16);
            local_52.SetToAreaId(local_14);
            local_52.SetStayDuration(uint((FMath::Max(0.0f, Event.PrevRegionDuration))));
            XLog(ELog(80), FString().Append("[LevelDataTracker] AREA_CHANGE report: uid=").Append(local_12.GetPlayerId()).Append(" from=").Append(local_16).Append(" to=").Append(local_14).Append(" stay=").Append(local_52.GetStayDuration()).Append("s"));
            ::ServerDataTrackerHelper::LogProtoMessage3WithPlayer(local_4, 104002, local_52.ToWrapper());
        }
        return;
    }
    UFUNCTION()
    void ServerJob_TrackCommissionEnd(const FCE_OnCommissionFinishRewardRspEvent &inout Event) const
    {
        int local_12 = 0;
        int local_20 = 0;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (!(local_4.IsValid()))
        {
            return;
        }
        if (!(local_12))
        {
            return;
        }
        FECSWorldPtr local_14 = ECS::GetECSWorld();
        int local_21 = 0;
        int local_23 = 0;
        int local_24 = 0;
        int local_25 = 0;
        FECSWorldPtr local_14_2 = ECS::GetECSWorld();
        GetDefaulted local_32;
        FFPTime local_28 = FFPTime(local_32.opCall().Time);
        if (local_20)
        {
            local_21 = local_20.GetbSuccess() ? 1 : 0;
            local_23 = local_20.GetFinishTier();
            local_24 = local_20.GetSubObjectiveIsFinish() ? 1 : 0;
            local_25 = local_20.GetRewardScore();
            local_28 = local_20.GetFinishTime();
        }
        int local_34 = 0;
        Get local_38;
        const FC_PlayerEnterDSTime& local_40 = local_38.opCall();
        if (local_40)
        {
            FFPTime local_42 = local_40.EnterTime;
            if (local_42.opCmp(0.0) > 0)
            {
                local_34 = uint((FMath::Max(0.0, (local_28 - local_40.EnterTime).ToSeconds())));
            }
        }
        int local_53 = 0;
        Get local_58;
        const FC_CommissionPlayerStats& local_60 = local_58.opCall();
        if (local_60)
        {
            local_53 = int(local_60.DeathCount);
        }
        FPbPlayerLogDsCommissionEnd local_70;
        local_70.SetResult(local_21);
        local_70.SetResultRank(local_23);
        local_70.SetDuration(local_34);
        local_70.SetDeathCount(local_53);
        local_70.SetSubtaskResult(local_24);
        local_70.SetResultScore(local_25);
        Get local_74;
        const FC_CommissionFinishReward& local_76 = local_74.opCall();
        if (local_76)
        {
            for (auto& local_90 : local_76.GetCommissionReward())
            {
                FPbPlayerLogDsCommissionEndRewardItem local_100 = local_70.AddRewardList();
                local_100.SetItemId(local_90.GetItemID());
                local_100.SetCount(local_90.GetCount());
            }
            for (auto& local_90 : local_76.GetCommissionFirstReward())
            {
                FPbPlayerLogDsCommissionEndRewardItem local_110 = local_70.AddRewardList();
                local_110.SetItemId(local_90.GetItemID());
                local_110.SetCount(local_90.GetCount());
            }
        }
        XLog(ELog(80), FString().Append("[LevelDataTracker] COMMISSION_END report: uid=").Append(local_12.GetPlayerId()).Append(" result=").Append(local_21).Append(" result_rank=").Append(local_23).Append(" duration=").Append(local_34).Append(" death=").Append(local_53).Append(" result_score=").Append(local_70.GetResultScore()));
        ::ServerDataTrackerHelper::LogProtoMessage3WithPlayer(local_4, 103001, local_70.ToWrapper());
        return;
    }
    uint GetLeaveType(const FECSEntity &inout PlayerEntity) const
    {
        Get local_4;
        const FC_PlayerExitDSReason& local_6 = local_4.opCall();
        if (local_6)
        {
            if ((int(local_6.Reason) == 6 || (int(local_6.Reason) == 5)))
            {
                return 0;
            }
        }
        return 1;
    }
    bool IsCommissionMidwayLeave() const
    {
        int local_8 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        if (!(local_8) || !(local_8.CommissionConfig.IsSet()))
        {
            return false;
        }
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        Has local_14;
        return !(local_14.opCall());
    }
    uint64 GetAreaIdFromRegion(const FECSEntity &inout RegionEntity) const
    {
        int local_11 = 0;
        if (!(RegionEntity.IsValid()))
        {
            return 0;
        }
        Get local_8;
        const FC_RegionWorldAreaConfig& local_10 = local_8.opCall();
        if (local_10)
        {
            if (local_10.GetWorldAreaConfig().IsSet())
            {
                return local_11;
            }
        }
        int64 local_4 = 0;
        return local_4;
    }
    uint64 GetPlayerAreaId(const FECSEntity &inout PlayerEntity) const
    {
        Get local_4;
        const FC_PlayerWorldRegion& local_6 = local_4.opCall();
        if (local_6)
        {
            return this.GetAreaIdFromRegion(local_6.GetRegionEntity());
        }
        return 0;
    }
    uint64 GetEntityLevelUnitConfigGUID(const FECSEntity &inout Entity) const
    {
        AIdentifiableECSPrefab local_14;
        Modify local_4;
        FC_PrefabLoaded& local_6 = local_4.opCall();
        if (local_6)
        {
            local_14 = (Cast<AIdentifiableECSPrefab>(local_6.TryGetPrefabActor()));
            if (local_14 != nullptr)
            {
                return local_14.GetConfigGUID().ToUint64();
            }
        }
        return 0;
    }
    UFUNCTION()
    void ServerJob_TrackAccountExclusiveChestOpen(const FCE_AccountExclusiveTreasureBoxCollected_DataTracker &inout Event) const
    {
        int local_20 = 0;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (!(local_4.IsValid()))
        {
            return;
        }
        FECSEntity local_10 = ::FASCommonUtils::GetUniquePlayerEntity(local_4);
        if (!(local_10.IsValid()))
        {
            return;
        }
        if (!(local_20))
        {
            return;
        }
        FPbPlayerLogDsExploreChestOpen local_30;
        local_30.SetChestId(int(Event.DataId));
        local_30.SetAreaId(this.GetPlayerAreaId(local_10));
        XLog(ELog(80), FString().Append("[LevelDataTracker] CHEST_OPEN report: uid=").Append(local_20.GetPlayerId()).Append(" chest_id=").Append(local_30.GetChestId()).Append(" area_id=").Append(local_30.GetAreaId()));
        ::ServerDataTrackerHelper::LogProtoMessage3WithPlayer(local_10, 104004, local_30.ToWrapper());
        return;
    }
    UFUNCTION()
    void ServerJob_TrackAccountExclusiveCollectionPrefab(const FCE_AccountExclusiveCollectionPrefabCollected_DataTracker &inout Event) const
    {
        int local_20 = 0;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (!(local_4.IsValid()))
        {
            return;
        }
        FECSEntity local_10 = ::FASCommonUtils::GetUniquePlayerEntity(local_4);
        if (!(local_10.IsValid()))
        {
            return;
        }
        if (!(local_20))
        {
            return;
        }
        FPbPlayerLogDsExploreUnlock local_30;
        local_30.SetUnlockType(0);
        local_30.SetTargetId(int(Event.DataId));
        local_30.SetAreaId(this.GetPlayerAreaId(local_10));
        XLog(ELog(80), FString().Append("[LevelDataTracker] EXPLORE_UNLOCK (collection_prefab) report: uid=").Append(local_20.GetPlayerId()).Append(" target_id=").Append(local_30.GetTargetId()).Append(" area_id=").Append(local_30.GetAreaId()));
        ::ServerDataTrackerHelper::LogProtoMessage3WithPlayer(local_10, 104003, local_30.ToWrapper());
        return;
    }
    UFUNCTION()
    void ServerJob_TrackTeleporterActivated(const FCE_AccountExclusiveTeleporterActivated_DataTracker &inout Event) const
    {
        int local_20 = 0;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (!(local_4.IsValid()))
        {
            return;
        }
        FECSEntity local_10 = ::FASCommonUtils::GetUniquePlayerEntity(local_4);
        if (!(local_10.IsValid()))
        {
            return;
        }
        if (!(local_20))
        {
            return;
        }
        FPbPlayerLogDsExploreUnlock local_30;
        local_30.SetUnlockType(1);
        local_30.SetTargetId(int(Event.DataId));
        local_30.SetAreaId(this.GetPlayerAreaId(local_10));
        XLog(ELog(80), FString().Append("[LevelDataTracker] EXPLORE_UNLOCK (teleporter) report: uid=").Append(local_20.GetPlayerId()).Append(" target_id=").Append(local_30.GetTargetId()).Append(" area_id=").Append(local_30.GetAreaId()));
        ::ServerDataTrackerHelper::LogProtoMessage3WithPlayer(local_10, 104003, local_30.ToWrapper());
        return;
    }
    UFUNCTION()
    void ServerJob_TrackEcoCollectable(const FCE_EcoCollectableCollected_DataTracker &inout Event) const
    {
        int local_20 = 0;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (!(local_4.IsValid()))
        {
            return;
        }
        FECSEntity local_10 = ::FASCommonUtils::GetUniquePlayerEntity(local_4);
        if (!(local_10.IsValid()))
        {
            return;
        }
        if (!(local_20))
        {
            return;
        }
        FPbPlayerLogDsGatherCollect local_30;
        if (Event.EcoCollectableEntity.IsValid())
        {
            local_30.SetNodeId(this.GetEntityLevelUnitConfigGUID(Event.EcoCollectableEntity));
        }
        local_30.SetAreaId(this.GetPlayerAreaId(local_10));
        XLog(ELog(80), FString().Append("[LevelDataTracker] GATHER_COLLECT (eco_collectable) report: uid=").Append(local_20.GetPlayerId()).Append(" node_id=").Append(local_30.GetNodeId()));
        ::ServerDataTrackerHelper::LogProtoMessage3WithPlayer(local_10, 104005, local_30.ToWrapper());
        return;
    }
    bool GetWorldEventInfo(const FECSEntity &inout LevelScriptEntity, uint64 &out EventId, uint64 &out EventInstanceId, uint &out EventType) const
    {
        int local_8 = 0;
        int local_15 = 0;
        AKLLevelScriptActor local_24;
        EventId = 0;
        EventInstanceId = 0;
        EventType = 0;
        if (!(local_8) || !(local_8.GetEventInfo().IsSet()))
        {
            return false;
        }
        ELevelEventType local_12;
        ELevelEventType local_11 = local_12;
        if ((int(local_11) != 0 && (int(local_11) != 1)))
        {
            return false;
        }
        EventId = local_15;
        Get local_20;
        const FC_LevelScriptActor& local_22 = local_20.opCall();
        if (local_22)
        {
            if (local_22.LevelScript.IsValid())
            {
                AActor local_26;
                local_24 = (Cast<AKLLevelScriptActor>(local_26));
                if (local_24 != nullptr)
                {
                    EventInstanceId = local_24.ConfigGUID.ToUint64();
                }
            }
        }
        EventType = int(local_11);
        return true;
    }
    UFUNCTION()
    void ServerJob_TrackWorldEventAppear(const FCE_LevelAreaEventActivated &inout Event) const
    {
        int local_8;
        int local_10;
        int local_11;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (!(local_4.IsValid()))
        {
            return;
        }
        if (!(this.GetWorldEventInfo(local_4, local_8, local_10, local_11)))
        {
            return;
        }
        FPbPlayerLogDsWorldEventAppear local_22;
        local_22.SetEventId(local_8);
        local_22.SetEventInstanceId(local_10);
        local_22.SetEventType(local_11);
        XLog(ELog(80), FString().Append("[LevelDataTracker] WORLD_EVENT_APPEAR report: event_id=").Append(local_8).Append(" instance=").Append(local_10).Append(" type=").Append(local_11));
        ::ServerDataTrackerHelper::LogProtoMessage3NoPlayer(104006, local_22.ToWrapper());
        return;
    }
    UFUNCTION()
    void ServerJob_TrackWorldEventStart(const FCE_LevelAreaEventPlayerEnter &inout Event) const
    {
        int local_12 = 0;
        int local_18;
        int local_20;
        int local_21;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (!(local_4.IsValid()))
        {
            return;
        }
        if (!(local_12))
        {
            return;
        }
        FECSEntity local_16 = Event.LevelScriptEntity;
        if (!(local_16.IsValid()))
        {
            return;
        }
        if (!(this.GetWorldEventInfo(local_16, local_18, local_20, local_21)))
        {
            return;
        }
        FPbPlayerLogDsWorldEventStart local_32;
        local_32.SetEventId(local_18);
        local_32.SetEventInstanceId(local_20);
        local_32.SetEventType(local_21);
        XLog(ELog(80), FString().Append("[LevelDataTracker] WORLD_EVENT_START report: uid=").Append(local_12.GetPlayerId()).Append(" event_id=").Append(local_18).Append(" instance=").Append(local_20).Append(" type=").Append(local_21));
        ::ServerDataTrackerHelper::LogProtoMessage3WithPlayer(local_4, 104007, local_32.ToWrapper());
        return;
    }
    UFUNCTION()
    void ServerJob_TrackWorldEventEnd(const FCE_LevelAreaEventPlayerLeave &inout Event) const
    {
        int local_12 = 0;
        int local_18;
        int local_20;
        int local_21;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (!(local_4.IsValid()))
        {
            return;
        }
        if (!(local_12))
        {
            return;
        }
        FECSEntity local_16 = Event.LevelScriptEntity;
        if (!(local_16.IsValid()))
        {
            return;
        }
        if (!(this.GetWorldEventInfo(local_16, local_18, local_20, local_21)))
        {
            return;
        }
        FPbPlayerLogDsWorldEventEnd local_32;
        local_32.SetEventId(local_18);
        local_32.SetEventInstanceId(local_20);
        local_32.SetEventType(local_21);
        local_32.SetResult(int(Event.Result));
        local_32.SetDuration(uint(int(Event.Duration)));
        XLog(ELog(80), FString().Append("[LevelDataTracker] WORLD_EVENT_END report: uid=").Append(local_12.GetPlayerId()).Append(" event_id=").Append(local_18).Append(" instance=").Append(local_20).Append(" result=").Append(local_32.GetResult()).Append(" duration=").Append(local_32.GetDuration()));
        ::ServerDataTrackerHelper::LogProtoMessage3WithPlayer(local_4, 104008, local_32.ToWrapper());
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TrackPlayerLogin() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerLoginEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayerLoginEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_TrackPlayerLogin(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TrackPlayerLeave() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerLeaveEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayerLeaveEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_TrackPlayerLeave(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_TrackPlayerDisconnect() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorDestroyDisconnectedPlayerTimerOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_TrackPlayerDisconnect(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TrackRegionChanged() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerWorldRegionChanged> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayerWorldRegionChanged& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_TrackRegionChanged(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TrackCommissionEnd() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_OnCommissionFinishRewardRspEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_OnCommissionFinishRewardRspEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_TrackCommissionEnd(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TrackAccountExclusiveChestOpen() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_AccountExclusiveTreasureBoxCollected_DataTracker> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_AccountExclusiveTreasureBoxCollected_DataTracker& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_TrackAccountExclusiveChestOpen(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TrackAccountExclusiveCollectionPrefab() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_AccountExclusiveCollectionPrefabCollected_DataTracker> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_AccountExclusiveCollectionPrefabCollected_DataTracker& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_TrackAccountExclusiveCollectionPrefab(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TrackTeleporterActivated() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_AccountExclusiveTeleporterActivated_DataTracker> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_AccountExclusiveTeleporterActivated_DataTracker& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_TrackTeleporterActivated(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TrackEcoCollectable() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EcoCollectableCollected_DataTracker> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EcoCollectableCollected_DataTracker& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_TrackEcoCollectable(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TrackWorldEventAppear() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_LevelAreaEventActivated> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_LevelAreaEventActivated& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_TrackWorldEventAppear(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TrackWorldEventStart() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_LevelAreaEventPlayerEnter> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_LevelAreaEventPlayerEnter& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_TrackWorldEventStart(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TrackWorldEventEnd() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_LevelAreaEventPlayerLeave> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_LevelAreaEventPlayerLeave& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_TrackWorldEventEnd(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}


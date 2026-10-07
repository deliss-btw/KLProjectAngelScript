

class US_GameDSMessageSystem : UECSScriptSystem
{
    UPROPERTY()
    float32 AutoSaveInterval = 60.0f;
    UPROPERTY()
    float32 HeartBeatInterval = 10.0f;
    UPROPERTY()
    float32 DestroyDisconnectedPlayerDelay = 600.0f;


    UFUNCTION()
    void Init_Implementation()
    {
        int local_1 = 60;
        if (FParse::Value(FCommandLine::Get(), "-auto_save=", local_1))
        {
            this.AutoSaveInterval = local_1;
        }
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        if ((int(this.GetWorld().GetNetMode())) != 1)
        {
            return true;
        }
        return false;
    }
    UFUNCTION()
    void ServerJob_CheckForDSFork() const
    {
        XLog(ELog(27), FString().Append("ServerJob_CheckForDSFork"));
        AKLGameModeMP local_14 = (Cast<AKLGameModeMP>(Gameplay::GetGameMode(__GetWorldContext())));
        if (local_14 != nullptr)
        {
            local_14.BeginWaitingForDSFork();
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleFinishPrepareGameEvent(const FCE_FinishPrepareGameEvent &inout Event) const
    {
        ::UGameDSConnectionSubsystem::Get().NotifyReadyForPlayerJoin();
        return;
    }
    UFUNCTION()
    void ServerJob_TickGameServerMessage() const
    {
        ::UGameDSConnectionSubsystem::Get().TickGameConnection(float32(ECS::GetContextDeltaTime().ToSeconds()));
        return;
    }
    UFUNCTION()
    void ServerJob_AutoSave() const
    {
        if (::UGameDSConnectionSubsystem::Get().IsConnectedToGameServer())
        {
            ::UGameDSConnectionSubsystem::Get().SaveAllPlayer();
        }
        return;
    }
    UFUNCTION()
    void ServerJob_DSHeartBeat() const
    {
        if (::UGameDSConnectionSubsystem::Get().IsConnectedToGameServer())
        {
            ::UGameDSConnectionSubsystem::Get().DSHeartBeat();
        }
        return;
    }
    UFUNCTION()
    void ServerJob_CheckAddItem() const
    {
        if (::UGameDSConnectionSubsystem::Get().IsConnectedToGameServer())
        {
            ::UGameDSConnectionSubsystem::Get().CheckAddItem();
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandlePlayerAddItemRequestPendingFlush(const FECSEntity &inout PlayerEntity, const FC_PlayerController &inout C_PlayerController) const
    {
        if (::UGameDSConnectionSubsystem::Get().IsConnectedToGameServer())
        {
            ::UGameDSConnectionSubsystem::Get().SendServerAddItemReq(C_PlayerController.GetPlayerId());
        }
        Remove local_8;
        local_8.opCall();
        return;
    }
    UFUNCTION()
    void ServerJob_HandleCheckEmptyDSEvent(const FCE_CheckEmptyDS &inout Event) const
    {
        if (::UGameDSConnectionSubsystem::Get().IsConnectedToGameServer())
        {
            ::UGameDSConnectionSubsystem::Get().CheckEmptyDS();
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleExitDSEvent(const FCE_ExitDS &inout Event) const
    {
        ::UGameDSConnectionSubsystem::Get().ExitDS();
        return;
    }
    UFUNCTION()
    void ServerJob_HandlePlayerLogin(const FECSEntity &inout PlayerEntity, const FC_PlayerController &inout C_PlayerController, const FC_PlayerPendingLogin &inout C_PlayerPendingLogin) const
    {
        bool local_6;
        if (!(C_PlayerController.GetbConnectionEstablished()))
        {
            local_6 = false;
        }
        else
        {
            Has local_4;
            local_6 = local_4.opCall();
        }
        if (local_6)
        {
            XLog(ELog(27), FString().Append("HandlePlayerLogin PlayerEntity=").Append(PlayerEntity).Append(" PlayerId=").Append(C_PlayerController.GetPlayerId()));
            Remove local_18;
            local_18.opCall();
            Has local_22;
            if (!(local_22.opCall()))
            {
                FC_PlayerEnterDSTime local_28;
                Assign local_26;
                local_26.opCall(local_28).EnterTime = ECS::GetContextTime();
            }
            FFPTime local_30 = FFPTime(-1);
            FECSEntity local_42 = FECSEntity(PlayerEntity.GetId());
            FECSWorldPtr local_32 = ECS::GetECSWorld();
            SendEvent local_36;
            local_36.opCall(local_42, local_30).bIsReconnect = C_PlayerPendingLogin.bIsReconnect;
            FKLLevelUtils::NotifyPlayerJoinGame(this.GetWorld(), PlayerEntity);
            Remove local_48;
            local_48.opCall();
            Remove local_52;
            local_52.opCall();
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandlePlayerLogout(const FECSEntity &inout PlayerEntity, const FCS_FixedTime &inout FixedTime, FC_PlayerController &inout C_PlayerController) const
    {
        Remove local_4;
        local_4.opCall();
        FECSNetUtils::ResetPlayerEntityNetworkParam(PlayerEntity);
        Has local_10;
        bool local_5 = local_10.opCall();
        if (local_5)
        {
            Get local_18;
            XLog(ELog(27), FString().Append("HandlePlayerLogout PlayerEntity=").Append(PlayerEntity).Append(" Reason=").Append(local_18.opCall().Reason));
            ::FGameConnectionUtils::DestroyExitPlayerEntity(PlayerEntity);
            return;
        }
        XLog(ELog(27), FString().Append("HandlePlayerLogout PlayerEntity=").Append(PlayerEntity).Append(" DestroyDisconnectedPlayerDelay=").Append(this.DestroyDisconnectedPlayerDelay));
        ModifyOrAdd local_34;
        local_34.opCall().TriggerTime = (FFPTime(FixedTime.Time) + FFPTime(this.DestroyDisconnectedPlayerDelay));
        return;
    }
    UFUNCTION()
    void ServerJob_HandlePlayerLogoutForEndPIE(const FECSEntity &inout PlayerEntity, const FC_PlayerController &inout C_PlayerController) const
    {
        ::FGameConnectionUtils::DestroyExitPlayerEntity(PlayerEntity);
        Remove local_4;
        local_4.opCall();
        return;
    }
    UFUNCTION()
    void ServerJob_DestroyExitingPlayerEntity(const FECSEntity &inout PlayerEntity, const FCS_FixedTime &inout FixedTime, const FC_DestroyDisconnectedPlayerTimer &inout DestroyDisconnectedPlayerTimer) const
    {
        XLog(ELog(27), FString().Append("DestroyExitingPlayerEntity Timer Trigger: TriggerTime=").Append(DestroyDisconnectedPlayerTimer.TriggerTime).Append(" FixedTime=").Append(FixedTime.Time).Append(" IsActive=").Append(PlayerEntity.IsActive()));
        if (DestroyDisconnectedPlayerTimer.TriggerTime.opCmp(0.0) > 0 && ((DestroyDisconnectedPlayerTimer.TriggerTime.opCmp(FixedTime.Time) <= 0)))
        {
            ::FGameConnectionUtils::DestroyExitPlayerEntity(PlayerEntity);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandlePlayerRequestEnterLevel(const FCE_PlayerRequestEnterLevel &inout Event) const
    {
        if (int(Event.LevelKey) > 0)
        {
            Get local_8;
            if (local_8.opCall())
            {
                ::UGameDSConnectionSubsystem::Get().PlayerRequestEnterDS(Event.Sender, int(Event.LevelKey), false, 0);
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleServerPlayerRequestEnterLevel(const FCE_ServerPlayerRequestEnterLevel &inout Event) const
    {
        XLog(ELog(27), FString().Append("HandleServerPlayerRequestEnterLevel Sender=").Append(Event.Sender).Append(" LevelKey=").Append(Event.LevelKey));
        if (int(Event.LevelKey) > 0)
        {
            ::UGameDSConnectionSubsystem::Get().PlayerRequestEnterDS(Event.Sender, int(Event.LevelKey), false, 0);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandlePlayerRequestLeaveCurrentLevel(const FCE_PlayerRequestLeaveCurrentLevel &inout Event) const
    {
        XLog(ELog(27), FString().Append("HandlePlayerRequestLeaveCurrentLevel Sender=").Append(Event.Sender));
        Get local_10;
        const FC_PlayerController& local_12 = local_10.opCall();
        if (local_12)
        {
            FPbDsPlayerInfo local_28 = ::UGameDSConnectionSubsystem::Get().GetPlayerInfo(local_12.GetPlayerId());
            if (local_28.GetUid() == local_12.GetPlayerId())
            {
                XLog(ELog(27), FString().Append("HandlePlayerRequestLeaveCurrentLevel Sender=").Append(Event.Sender).Append(" PreviousLevelKey=").Append(local_28.GetDsMiscInfo().GetPlayerMapInfo().GetWorldLevelKey()));
                int local_39 = local_28.GetDsMiscInfo().GetPlayerMapInfo().GetWorldLevelKey();
                ::UGameDSConnectionSubsystem::Get().PlayerRequestEnterDS(Event.Sender, 0, false);
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandlePlayerRequestBackToCityLevel(const FCE_PlayerRequestBackToCityLevel &inout Event) const
    {
        int local_145 = 0;
        XLog(ELog(27), FString().Append("HandlePlayerRequestLeaveCurrentLevel Sender=").Append(Event.Sender));
        Get local_10;
        if (local_10.opCall())
        {
            if (::FLevelUtils::GetCurrentLevelInfoConfig(nullptr))
            {
                TDataObjectPtr<FLevelInfoConfig> local_62;
                if ((local_62 && (0 == 1)))
                {
                    FString local_4 = FString();
                    ::UGameDSConnectionSubsystem::Get().PlayerRequestEnterDS(Event.Sender, local_145, false, 0);
                    return;
                }
                else
                {
                    FString local_4_2 = FString();
                    return;
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandlePlayerRequestQuitGame(const FCE_PlayerRequestQuitGame &inout Event) const
    {
        XLog(ELog(27), FString().Append("HandlePlayerRequestQuitGame Sender=").Append(Event.Sender));
        Get local_10;
        if (local_10.opCall())
        {
            ModifyOrAdd local_18;
            local_18.opCall().Reason = EDisconnectReason(6);
            FFPTime local_26 = FFPTime(-1);
            SendEvent local_24;
            local_24.opCall(local_26);
            SendEvent local_32;
            local_32.opCall((ECS::GetContextTime() + FFPTime(0.05)));
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleDelayDisconnectPlayer(const FCE_DelayDisconnectPlayer &inout Event) const
    {
        ::FGameConnectionUtils::DisconnectPlayerForQuitGame(Event.Sender);
        return;
    }
    UFUNCTION()
    void ServerJob_HandleSendErrorCodeToPlayer(const FCE_SendErrorCodeToPlayer &inout Event) const
    {
        FFPTime local_6 = FFPTime(-1);
        SendEvent local_4;
        local_4.opCall(local_6).ErrorCode = int(Event.ErrorCode);
        return;
    }
    UFUNCTION()
    void Monitor_OnRemovePlayerController(const FECSEntity &inout PlayerEntity, const FC_PlayerController &inout C_PlayerController) const
    {
        TWeakObjectPtr<AECSPlayerController> local_2 = C_PlayerController.GetUEPlayerController();
        AECSPlayerController local_4;
        APXECSPlayerController local_8 = (Cast<APXECSPlayerController>(local_4));
        if (local_8 != nullptr)
        {
            if (local_8 != nullptr)
            {
                XLog(ELog(27), FString().Append("Destroy PlayerController on removed PlayerEntity PlayerIndex=").Append(C_PlayerController.GetPlayerIndex()).Append(" PlayerId=").Append(C_PlayerController.GetPlayerId()).Append("!"));
                local_8.DisconnectPlayer(EDisconnectReason(0));
            }
        }
        ::UGameDSConnectionSubsystem::Get().NotifyPlayerEntityDestroyed(PlayerEntity.GetIdValue(), C_PlayerController.GetPlayerId());
        return;
    }
    UFUNCTION()
    void ServerJob_InitPlayerLevelObjectStatForPIE(const FECSEntity &inout Entity) const
    {
        return;
    }
    UFUNCTION()
    void Run_ServerJob_CheckForDSFork() const
    {
        ECS::GetContextJob();
        this.ServerJob_CheckForDSFork();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleFinishPrepareGameEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_FinishPrepareGameEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_FinishPrepareGameEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleFinishPrepareGameEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TickGameServerMessage() const
    {
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(0.2))))
        {
            return;
        }
        this.ServerJob_TickGameServerMessage();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_AutoSave() const
    {
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(this.AutoSaveInterval))))
        {
            return;
        }
        this.ServerJob_AutoSave();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DSHeartBeat() const
    {
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(this.HeartBeatInterval))))
        {
            return;
        }
        this.ServerJob_DSHeartBeat();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_CheckAddItem() const
    {
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1.0))))
        {
            return;
        }
        this.ServerJob_CheckAddItem();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandlePlayerAddItemRequestPendingFlush() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_166 = 0;
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
                this.ServerJob_HandlePlayerAddItemRequestPendingFlush(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_80.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ServerJob_HandlePlayerAddItemRequestPendingFlush(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleCheckEmptyDSEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_CheckEmptyDS> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_CheckEmptyDS& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleCheckEmptyDSEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleExitDSEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ExitDS> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ExitDS& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleExitDSEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandlePlayerLogin() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_172 = 0;
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
                this.ServerJob_HandlePlayerLogin(local_36, local_38, local_44);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Exclude(local_86).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_100 = 0;
        FECSRuntimeViewIterator local_134 = local_86.Iterator();
        for (; local_134.CanProceed;)
        {
            local_36 = local_134.Proceed();
            ++local_100;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ServerJob_HandlePlayerLogin(local_172, local_38, local_44);
        }
        local_2.UpdateCachedEntityCount(local_100);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandlePlayerLogout() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_170 = 0;
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
                this.ServerJob_HandlePlayerLogout(local_40, local_6, local_42);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_88.Iterator();
        for (; local_132.CanProceed;)
        {
            local_40 = local_132.Proceed();
            ++local_98;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_HandlePlayerLogout(local_170, local_6, local_42);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_98);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandlePlayerLogoutForEndPIE() const
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
                this.ServerJob_HandlePlayerLogoutForEndPIE(local_36, local_38);
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
            local_36 = local_124.Proceed();
            ++local_90;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ServerJob_HandlePlayerLogoutForEndPIE(local_162, local_38);
        }
        local_2.UpdateCachedEntityCount(local_90);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    void Monitor___JobTimer_Pre___ServerJob_DestroyExitingPlayerEntity(const FC_DestroyDisconnectedPlayerTimer &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.TriggerTime;
        FName local_8 = FName("S_GameDSMessageSystem::ServerJob_DestroyExitingPlayerEntity");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___ServerJob_DestroyExitingPlayerEntity(const FC_DestroyDisconnectedPlayerTimer &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.TriggerTime;
        FName local_8 = FName("S_GameDSMessageSystem::ServerJob_DestroyExitingPlayerEntity");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___ServerJob_DestroyExitingPlayerEntity() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorDestroyDisconnectedPlayerTimerOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___ServerJob_DestroyExitingPlayerEntity(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorDestroyDisconnectedPlayerTimerOnAssignView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___ServerJob_DestroyExitingPlayerEntity(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___ServerJob_DestroyExitingPlayerEntity() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorDestroyDisconnectedPlayerTimerOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___ServerJob_DestroyExitingPlayerEntity(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorDestroyDisconnectedPlayerTimerOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___ServerJob_DestroyExitingPlayerEntity(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DestroyExitingPlayerEntity() const
    {
        int local_6 = 0;
        int local_40 = 0;
        int local_48 = 0;
        int local_50 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        local_4.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_14 = local_4.GetExternalEntityList();
        for (auto& local_28 : local_14)
        {
            local_28;
            FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(FECSEntity());
            bool local_11 = false;
            if (!(local_40))
            {
                continue;
            }
            FFPTime local_42 = local_40.TriggerTime;
            if (local_42.opCmp(0.0) < 0 || (local_40.TriggerTime == FPTIME_MAX))
            {
                continue;
            }
            if (local_11)
            {
                continue;
            }
            this.ServerJob_DestroyExitingPlayerEntity(local_48, local_6, local_50);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandlePlayerRequestEnterLevel() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerRequestEnterLevel> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayerRequestEnterLevel& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandlePlayerRequestEnterLevel(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleServerPlayerRequestEnterLevel() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ServerPlayerRequestEnterLevel> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ServerPlayerRequestEnterLevel& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleServerPlayerRequestEnterLevel(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandlePlayerRequestLeaveCurrentLevel() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerRequestLeaveCurrentLevel> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayerRequestLeaveCurrentLevel& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_PlayerRequestLeaveCurrentLevel, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandlePlayerRequestLeaveCurrentLevel(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandlePlayerRequestBackToCityLevel() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerRequestBackToCityLevel> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayerRequestBackToCityLevel& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandlePlayerRequestBackToCityLevel(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandlePlayerRequestQuitGame() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerRequestQuitGame> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayerRequestQuitGame& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandlePlayerRequestQuitGame(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleDelayDisconnectPlayer() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DelayDisconnectPlayer> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DelayDisconnectPlayer& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleDelayDisconnectPlayer(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleSendErrorCodeToPlayer() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_SendErrorCodeToPlayer> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_SendErrorCodeToPlayer& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleSendErrorCodeToPlayer(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnRemovePlayerController() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorPlayerControllerOnRemoveView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnRemovePlayerController(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_InitPlayerLevelObjectStatForPIE() const
    {
        const FECSEntity& local_36;
        int local_160 = 0;
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
                this.ServerJob_InitPlayerLevelObjectStatForPIE(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Exclude(local_74).opCall();
        Exclude(local_74).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_88 = 0;
        FECSRuntimeViewIterator local_122 = local_74.Iterator();
        for (; local_122.CanProceed;)
        {
            local_36 = local_122.Proceed();
            ++local_88;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ServerJob_InitPlayerLevelObjectStatForPIE(local_160);
        }
        local_2.UpdateCachedEntityCount(local_88);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}


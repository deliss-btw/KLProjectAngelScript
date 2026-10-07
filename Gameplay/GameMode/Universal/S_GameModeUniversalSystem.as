

class US_GameModeUniversalSystem : US_ECSScriptGameModeSystemBase
{
    US_GameModeUniversalSystem()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return !(FGameModeUtils::CVar_GameMode_UseUniversalSystem.GetBool());
    }
    UFUNCTION()
    void ServerJob_Init() const
    {
        int local_20 = 0;
        UAS_GameModeSettings local_8 = (Cast<UAS_GameModeSettings>(UECSGameModeSettingsBase::Get(ECS::GetUEWorld())));
        if (local_8 == nullptr || !(local_8.GameModeProfile.IsSet()))
        {
            XError(ELog(33), "GameModeUniversalSystem: missing GameModeProfile on GameModeSettings");
            return;
        }
        FECSWorldPtr local_14 = this.GetECSWorld();
        UGameModeFlow local_24 = local_20.GetGameModeFlow();
        if (local_24 == nullptr)
        {
            XError(ELog(33), "GameModeUniversalSystem: FlowClass is null in GameModeProfile");
            return;
        }
        local_24.OnInit(local_20);
        local_24.ChangeGameState(EFCS_GameStageType(1));
        FECSWorldPtr local_14_2 = ECS::GetECSWorld();
        FCS_GameModeTimer local_58;
        Assign local_30;
        local_30.opCall(local_58);
        FECSWorldPtr local_14_3 = ECS::GetECSWorld();
        FCS_GameModeFirstTickTag local_64;
        Assign local_62;
        local_62.opCall(local_64);
        return;
    }
    UFUNCTION()
    void ClientJob_Init() const
    {
        UAS_GameModeSettings local_8 = (Cast<UAS_GameModeSettings>(UECSGameModeSettingsBase::Get(ECS::GetUEWorld())));
        if (local_8 == nullptr || !(local_8.GameModeProfile.IsSet()))
        {
            XError(ELog(33), "GameModeUniversalSystem: missing GameModeProfile on GameModeSettings");
            return;
        }
        FECSWorldPtr local_14 = this.GetECSWorld();
        return;
    }
    UFUNCTION()
    void ServerJob_FirstTick() const
    {
        int local_8 = 0;
        Remove local_18;
        FECSWorldPtr local_2 = this.GetECSWorld();
        UGameModeFlow local_12 = local_8.GetGameModeFlow();
        if (local_12 == nullptr)
        {
            FECSWorldPtr local_2_2 = this.GetECSWorld();
            local_18.opCall();
            return;
        }
        local_12.FirstTick(local_8);
        FECSWorldPtr local_2_3 = this.GetECSWorld();
        local_18.opCall();
        return;
    }
    UFUNCTION()
    void ServerJob_FastTick() const
    {
        int local_8 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        UGameModeFlow local_12 = local_8.GetGameModeFlow();
        if (local_12 == nullptr)
        {
            FECSWorldPtr local_2_2 = this.GetECSWorld();
            Remove local_18;
            local_18.opCall();
            return;
        }
        local_12.OnFastTick(local_8);
        return;
    }
    UFUNCTION()
    void ServerJob_Tick() const
    {
        int local_8 = 0;
        int local_20 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        UGameModeFlow local_12 = local_8.GetGameModeFlow();
        if (local_12 == nullptr)
        {
            return;
        }
        else
        {
            FECSWorldPtr local_2_2 = this.GetECSWorld();
            if (local_12.CanHandleClientJoin(local_8))
            {
                ::FGameModeUtils::HandleClientJoin();
            }
            local_12.TickGameModeGeneral(local_8);
            switch (int(local_20.GetStageType()))
            {
            case 1:
            {
                local_12.TickPreparing(local_8);
                return;
            }
            case 2:
            {
                local_12.TickStarting(local_8);
                return;
            }
            case 3:
            {
                local_12.TickPlaying(local_8);
                return;
            }
            case 4:
            {
                local_12.TickFinishing(local_8);
                return;
            }
            }
        }
    }
    UFUNCTION()
    void ServerJob_HandleReviveTeleport(FCE_Event_ReviveTeleport &inout Event) const
    {
        int local_8 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        UGameModeFlow local_12 = local_8.GetGameModeFlow();
        if (local_12 == nullptr)
        {
            return;
        }
        local_12.HandleReviveTeleport(local_8, Event);
        return;
    }
    UFUNCTION()
    void ServerJob_HandleDeath(FCE_DeathEvent &inout Event) const
    {
        int local_8 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        UGameModeFlow local_12 = local_8.GetGameModeFlow();
        if (local_12 == nullptr)
        {
            return;
        }
        local_12.HandleDeath(local_8, Event);
        return;
    }
    UFUNCTION()
    void ServerJob_HandleReborn(FCE_Reborn &inout Event) const
    {
        int local_8 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        UGameModeFlow local_12 = local_8.GetGameModeFlow();
        if (local_12 == nullptr)
        {
            return;
        }
        local_12.HandleReborn(local_8, Event);
        return;
    }
    UFUNCTION()
    void ServerJob_HandleGameModeFinish(const FCE_GameModeFinish &inout Event) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        UGameModeFlow local_12 = 0.GetGameModeFlow();
        if (local_12 == nullptr)
        {
            return;
        }
        local_12.GameModeFinish(Event.WinnerTeamIds, Event.LoserTeamIds);
        return;
    }
    UFUNCTION()
    void ServerJob_HandlePlayerEnterPVX(const FCE_PlayerEnterPVX &inout Event) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        Get local_6;
        UPVXGameModeFlow local_12 = (Cast<UPVXGameModeFlow>(local_6.opCall().GetGameModeFlow()));
        if (local_12 == nullptr)
        {
            return;
        }
        local_12.HandlePlayerEnterPVX(Event);
        return;
    }
    UFUNCTION()
    void ServerJob_HandlePlayerSelectInfo(const FCE_PlayerSelectInfoPVX &inout Event) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        Get local_6;
        UPVXGameModeFlow local_12 = (Cast<UPVXGameModeFlow>(local_6.opCall().GetGameModeFlow()));
        if (local_12 == nullptr)
        {
            return;
        }
        local_12.HandlePlayerSelectInfo(Event);
        return;
    }
    UFUNCTION()
    void ServerJob_OnCustomLevelEvent(const FCE_CustomLevelEvent &inout Event) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        Get local_6;
        UPVXGameModeFlow local_12 = (Cast<UPVXGameModeFlow>(local_6.opCall().GetGameModeFlow()));
        if (local_12 == nullptr)
        {
            return;
        }
        local_12.HandleCustomLevelEvent(Event);
        return;
    }
    UFUNCTION()
    void ServerJob_InitFakeCharacter_PVX(const FECSEntity &inout FakeEntity, const FC_FakeCharacterInit &inout FakeCharacterInit, const FCS_FixedTime &inout Time) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        Get local_6;
        UPVXGameModeFlow local_12 = (Cast<UPVXGameModeFlow>(local_6.opCall().GetGameModeFlow()));
        if (local_12 == nullptr)
        {
            return;
        }
        local_12.HandleInitFakeCharacter(FakeEntity, FakeCharacterInit);
        return;
    }
    UFUNCTION()
    void ServerJob_TrackPlayerLeavePVX(const FCE_PlayerLeaveEvent &inout Event) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        Get local_6;
        UPVXGameModeFlow local_12 = (Cast<UPVXGameModeFlow>(local_6.opCall().GetGameModeFlow()));
        if (local_12 == nullptr)
        {
            return;
        }
        local_12.HandlePlayerLeavePVX(Event);
        return;
    }
    UFUNCTION()
    void ServerJob_AdjustTimerOnTimeAdvance() const
    {
        int local_20 = 0;
        int local_26 = 0;
        int local_52 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        Has local_6;
        bool local_7 = !(local_6.opCall());
        if (local_7)
        {
            local_7 = true;
        }
        else
        {
            FECSWorldPtr local_2_2 = this.GetECSWorld();
            Has local_12;
            local_7 = !(local_12.opCall());
        }
        if (local_7)
        {
            return;
        }
        FECSWorldPtr local_2_3 = this.GetECSWorld();
        FECSWorldPtr local_2_4 = this.GetECSWorld();
        FFPTime local_28 = FFPTime(local_20.GetMatchStartTime());
        FFPTime local_30 = FFPTime(local_20.GetMatchEndTime());
        FFPTime local_32 = local_26.LastCheckedMatchStartTime;
        FFPTime local_34 = local_26.LastCheckedMatchEndTime;
        bool local_7_2 = (local_28.opCmp(local_32) < 0) && (local_32.opCmp(FFPTime(0)) >= 0);
        if (local_7_2 || ((local_30.opCmp(local_34) < 0) && (local_34.opCmp(FFPTime(0)) >= 0)))
        {
            FFPTime local_46;
            if (local_7_2)
            {
                local_46 = (local_32 - local_28);
            }
            else
            {
                local_46 = (local_34 - local_30);
            }
            FECSWorldPtr local_2_5 = this.GetECSWorld();
            for (auto& local_70 : local_52.TimerEntries)
            {
                local_70;
                FFPTime local_42;
                FFPTime local_38 = (local_42 - local_46);
            }
            local_52.RefreshNextTriggerTime();
            local_52.LastCheckedMatchStartTime = local_28;
            local_52.LastCheckedMatchEndTime = local_30;
            XLog(ELog(33), FString().Append("[GameModeTimer] Time advanced by ").Append(FString::ApplyFormat(local_46.ToSeconds(), ".1f")).Append("s, adjusted ").Append(local_52.TimerEntries.Num()).Append(" timer(s)"));
        }
        else
        {
            if (!((local_28 == local_32)) || !((local_30 == local_34)))
            {
                FECSWorldPtr local_2_6 = this.GetECSWorld();
                local_52.LastCheckedMatchStartTime = local_28;
                local_52.LastCheckedMatchEndTime = local_30;
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleGameModeTimer(FCS_GameModeTimer &inout Timer, const FCS_FixedTime &inout FixedTime) const
    {
        TArray<int> local_4;
        Timer.TimerEntries.GetKeys(local_4);
        TArray<int> local_8;
        for (auto local_22 : local_4)
        {
            if (!(Timer.TimerEntries.Contains(local_22)))
            {
                continue;
            }
            FFPTime local_26 = FFPTime(Timer.TimerEntries[local_22].TriggerTime);
            if (local_26.opCmp(FixedTime.Time) > 0)
            {
                continue;
            }
            if ((!((FInstancedStruct::GetPtr(Timer.TimerEntries[local_22].Action).opCall() == nullptr))))
            {
                Execute();
                XLog(ELog(33), FString().Append(" >>> ServerJob_HandleGameModeTimer ").Append(GetScriptOverrideMeta().StructType.GetName()).Append(" ").Append(FString::ApplyFormat(local_26.ToSeconds(), ".1f")).Append("s"));
            }
            if (!(Timer.TimerEntries.Contains(local_22)))
            {
                continue;
            }
            FGameModeTimerEntry& local_52 = Timer.TimerEntries[local_22];
            if (((local_52.IntervalSeconds > 0.0f) && (int(local_52.RemainingCount) != 0)))
            {
                FFPTime local_62 = local_52.TriggerTime;
                local_52.TriggerTime = (local_62 + FFPTime(local_52.IntervalSeconds));
                if (int(local_52.RemainingCount) > 0)
                {
                    --local_52.RemainingCount;
                }
            }
            else
            {
                local_8.Add(local_22);
            }
        }
        for (auto local_22 : local_8)
        {
        }
        Timer.RefreshNextTriggerTime();
        return;
    }
    UFUNCTION()
    void ServerJob_PVPPlayerSetReady(const FCE_PlayerSetReady &inout Event) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        Get local_6;
        UPVPGameModeFlowBase local_12 = (Cast<UPVPGameModeFlowBase>(local_6.opCall().GetGameModeFlow()));
        if (local_12 == nullptr)
        {
            return;
        }
        local_12.HandlePlayerSetReady(Event);
        return;
    }
    UFUNCTION()
    void ServerJob_PVPPlayerSetGO(const FCE_PVPPlayerSetGO &inout Event) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        Get local_6;
        UPVPGameModeFlowBase local_12 = (Cast<UPVPGameModeFlowBase>(local_6.opCall().GetGameModeFlow()));
        if (local_12 == nullptr)
        {
            return;
        }
        local_12.HandlePlayerSetGO(Event);
        return;
    }
    UFUNCTION()
    void ServerJob_PVPPlayerSwitchTeam(const FCE_PVPPlayerSwitchTeam &inout Event) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        Get local_6;
        UPVPGameModeFlowBase local_12 = (Cast<UPVPGameModeFlowBase>(local_6.opCall().GetGameModeFlow()));
        if (local_12 == nullptr)
        {
            return;
        }
        local_12.HandlePlayerSwitchTeam(Event);
        return;
    }
    UFUNCTION()
    void ServerJob_PVPPlayerSwitchGameRule(const FCE_PVPPlayerSwitchGameRule &inout Event) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        Get local_6;
        UPVPGameModeFlowBase local_12 = (Cast<UPVPGameModeFlowBase>(local_6.opCall().GetGameModeFlow()));
        if (local_12 == nullptr)
        {
            return;
        }
        local_12.HandlePlayerSwitchGameRule(Event);
        return;
    }
    UFUNCTION()
    void ServerJob_PVPAddBot(const FCE_PVPAddBot &inout Event) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        Get local_6;
        UPVPGameModeFlowBase local_12 = (Cast<UPVPGameModeFlowBase>(local_6.opCall().GetGameModeFlow()));
        if (local_12 == nullptr)
        {
            return;
        }
        local_12.HandleAddBot(Event);
        return;
    }
    UFUNCTION()
    void ServerJob_PVPRemoveBot(const FCE_PVPRemoveBot &inout Event) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        Get local_6;
        UPVPGameModeFlowBase local_12 = (Cast<UPVPGameModeFlowBase>(local_6.opCall().GetGameModeFlow()));
        if (local_12 == nullptr)
        {
            return;
        }
        local_12.HandleRemoveBot(Event);
        return;
    }
    UFUNCTION()
    void ServerJob_PVPPlayerRequestBackToRoom(const FCE_PVPPlayerRequestBackToRoom &inout Event) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        Get local_6;
        UPVPGameModeFlowBase local_12 = (Cast<UPVPGameModeFlowBase>(local_6.opCall().GetGameModeFlow()));
        if (local_12 == nullptr)
        {
            return;
        }
        local_12.HandlePlayerRequestBackToRoom(Event);
        return;
    }
    UFUNCTION()
    void ServerJob_AccumulateDamageStats(const FCE_DamageEvent &inout Event) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        Get local_6;
        UGameModeFlow local_10 = local_6.opCall().GetGameModeFlow();
        if (local_10 == nullptr)
        {
            return;
        }
        Get local_16;
        const FC_ControlledByPlayer& local_18 = local_16.opCall();
        if (local_18)
        {
            local_10.HandleAccumulateDamageStats(Event, local_18);
        }
        return;
    }
    UFUNCTION()
    void ClientJob_PVPBackToRoom(const FCE_GameModeStateChangedEvent &inout Event) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        Get local_6;
        UPVPGameModeFlowBase local_12 = (Cast<UPVPGameModeFlowBase>(local_6.opCall().GetGameModeFlow()));
        if (local_12 == nullptr)
        {
            return;
        }
        local_12.HandleClientBackToRoom();
        return;
    }
    UFUNCTION()
    void ClientJob_PVPSyncPrepBlocking(const FCE_GameModeStateChangedEvent &inout Event) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        Get local_6;
        UPVPGameModeFlowBase local_12 = (Cast<UPVPGameModeFlowBase>(local_6.opCall().GetGameModeFlow()));
        if (local_12 == nullptr)
        {
            return;
        }
        local_12.HandleClientSyncPrepBlocking();
        return;
    }
    UFUNCTION()
    void ClientJob_PVPSyncMainHUD(const FCE_GameModeStateChangedEvent &inout Event) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        Get local_6;
        UPVPGameModeFlowBase local_12 = (Cast<UPVPGameModeFlowBase>(local_6.opCall().GetGameModeFlow()));
        if (local_12 == nullptr)
        {
            return;
        }
        local_12.HandleClientSyncMainHUD();
        return;
    }
    UFUNCTION()
    void Monitor_PVXEntryUIByStage(const FCS_GameStates &inout GameStates) const
    {
        UClass local_28;
        UAS_GameModeSettingsPVX local_8 = (Cast<UAS_GameModeSettingsPVX>(::GameModeSettings::GetGameModeSettings(ECS::GetUEWorld())));
        if (local_8 == nullptr)
        {
            return;
        }
        if (WorldUtils::IsPlayInEditor(ECS::GetUEWorld()) && !(local_8.bEnablePIEQuickTestEntryUI))
        {
            return;
        }
        if (!(FECSWorldPtr::Has<FCS_LocalPlayer>(this.GetECSWorld()).opCall()))
        {
            return;
        }
        FECSWorldPtr local_12 = this.GetECSWorld();
        Get local_20;
        ULocalPlayer local_22 = local_20.opCall().UEPlayerController.GetLocalPlayer();
        if (local_22 == nullptr)
        {
            return;
        }
        TSubclassOf<UUserWidget> local_26 = TSubclassOf<UUserWidget>(::GameModeSettings::GetGameModeSettings(ECS::GetUEWorld()).EntryUIClass);
        if (!(local_26.IsValid()) || !(local_28.IsChildOf(UEUIUserWidget)))
        {
            return;
        }
        TSoftClassPtr<UEUIUserWidget> local_40 = TSoftClassPtr<UEUIUserWidget>(local_26);
        FEUIWidgetRef local_42 = FEUIWidget::FindWidgetByClass(local_22, local_40);
        if ((int(GameStates.GetStageType())) == 1)
        {
            if (!(local_42.IsValid()))
            {
                FEUIWidget::AddWidgetByClass(local_22, local_40);
            }
        }
        else
        {
            if (local_42.IsValid())
            {
                FEUIWidget::RemoveWidget(local_42);
            }
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_Init() const
    {
        ECS::GetContextJob();
        this.ServerJob_Init();
        return;
    }
    UFUNCTION()
    void Run_ClientJob_Init() const
    {
        ECS::GetContextJob();
        this.ClientJob_Init();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_FirstTick() const
    {
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        this.ServerJob_FirstTick();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_FastTick() const
    {
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        this.ServerJob_FastTick();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_Tick() const
    {
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if ((!((int(::FGameModeUtils::GetGameStageType()) != 0))) == (!(false)))
        {
            return;
        }
        if (!(local_2.IsOnInterval(FFPTime(1))))
        {
            return;
        }
        this.ServerJob_Tick();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleReviveTeleport() const
    {
        ECS::GetContextJob();
        TECSEventIterator<FCE_Event_ReviveTeleport> local_36 = FECSWorldPtr::PatchEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            FCE_Event_ReviveTeleport& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleReviveTeleport(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleDeath() const
    {
        ECS::GetContextJob();
        TECSEventIterator<FCE_DeathEvent> local_36 = FECSWorldPtr::PatchEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            FCE_DeathEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleDeath(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleReborn() const
    {
        ECS::GetContextJob();
        TECSEventIterator<FCE_Reborn> local_36 = FECSWorldPtr::PatchEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            FCE_Reborn& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleReborn(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleGameModeFinish() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_GameModeFinish> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_GameModeFinish& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleGameModeFinish(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandlePlayerEnterPVX() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerEnterPVX> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayerEnterPVX& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandlePlayerEnterPVX(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandlePlayerSelectInfo() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerSelectInfoPVX> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayerSelectInfoPVX& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_PlayerSelectInfoPVX, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandlePlayerSelectInfo(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_OnCustomLevelEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_CustomLevelEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_CustomLevelEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_OnCustomLevelEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_InitFakeCharacter_PVX() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_166 = 0;
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
                this.ServerJob_InitFakeCharacter_PVX(local_40, local_42, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Exclude(local_84).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_84.Iterator();
        for (; local_128.CanProceed;)
        {
            local_40 = local_128.Proceed();
            ++local_94;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_InitFakeCharacter_PVX(local_166, local_42, local_6);
        }
        local_4.UpdateCachedEntityCount(local_94);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TrackPlayerLeavePVX() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerLeaveEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayerLeaveEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_TrackPlayerLeavePVX(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_AdjustTimerOnTimeAdvance() const
    {
        ECS::GetContextJob();
        this.ServerJob_AdjustTimerOnTimeAdvance();
        return;
    }
    void Monitor___JobTimer_Pre___ServerJob_HandleGameModeTimer(const FCS_GameModeTimer &inout TimerComp) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.NextTriggerTime;
        FName local_8 = FName("S_GameModeUniversalSystem::ServerJob_HandleGameModeTimer");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, ENTITY_ID_NULL, true);
        }
        return;
    }
    void Monitor___JobTimer_Post___ServerJob_HandleGameModeTimer(const FCS_GameModeTimer &inout TimerComp) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.NextTriggerTime;
        FName local_8 = FName("S_GameModeUniversalSystem::ServerJob_HandleGameModeTimer");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, ENTITY_ID_NULL, false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___ServerJob_HandleGameModeTimer() const
    {
        int local_24 = 0;
        ECS::GetContextJob();
        if (ECSInternal::GetMonitorSingletonOnModify(this.GetECSWorld(), FCS_GameModeTimer, EECSRegType(0), true, true).bIsMonitored)
        {
            this.Monitor___JobTimer_Pre___ServerJob_HandleGameModeTimer(local_24);
        }
        if (ECSInternal::GetMonitorSingletonOnAssign(this.GetECSWorld(), FCS_GameModeTimer, EECSRegType(0), true, true).bIsMonitored)
        {
            this.Monitor___JobTimer_Pre___ServerJob_HandleGameModeTimer(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___ServerJob_HandleGameModeTimer() const
    {
        int local_24 = 0;
        ECS::GetContextJob();
        if (ECSInternal::GetMonitorSingletonOnModify(this.GetECSWorld(), FCS_GameModeTimer, EECSRegType(0), true, true).bIsMonitored)
        {
            this.Monitor___JobTimer_Post___ServerJob_HandleGameModeTimer(local_24);
        }
        if (ECSInternal::GetMonitorSingletonOnAssign(this.GetECSWorld(), FCS_GameModeTimer, EECSRegType(0), true, true).bIsMonitored)
        {
            this.Monitor___JobTimer_Post___ServerJob_HandleGameModeTimer(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleGameModeTimer() const
    {
        int local_14 = 0;
        int local_20 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        FECSWorldPtr local_6 = this.GetECSWorld();
        Has local_10;
        if (!(local_10.opCall()))
        {
            return;
        }
        FECSWorldPtr local_6_2 = this.GetECSWorld();
        this.ServerJob_HandleGameModeTimer(local_14, local_20);
        FECSWorldPtr local_6_3 = this.GetECSWorld();
        MarkModifiedIfDirty local_24;
        local_24.opCall(local_14);
        return;
    }
    UFUNCTION()
    void Run_ServerJob_PVPPlayerSetReady() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerSetReady> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayerSetReady& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_PlayerSetReady, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_PVPPlayerSetReady(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_PVPPlayerSetGO() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PVPPlayerSetGO> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PVPPlayerSetGO& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_PVPPlayerSetGO, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_PVPPlayerSetGO(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_PVPPlayerSwitchTeam() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PVPPlayerSwitchTeam> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PVPPlayerSwitchTeam& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_PVPPlayerSwitchTeam, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_PVPPlayerSwitchTeam(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_PVPPlayerSwitchGameRule() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PVPPlayerSwitchGameRule> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PVPPlayerSwitchGameRule& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_PVPPlayerSwitchGameRule, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_PVPPlayerSwitchGameRule(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_PVPAddBot() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PVPAddBot> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PVPAddBot& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_PVPAddBot, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_PVPAddBot(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_PVPRemoveBot() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PVPRemoveBot> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PVPRemoveBot& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_PVPRemoveBot, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_PVPRemoveBot(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_PVPPlayerRequestBackToRoom() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PVPPlayerRequestBackToRoom> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PVPPlayerRequestBackToRoom& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_PVPPlayerRequestBackToRoom, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_PVPPlayerRequestBackToRoom(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_AccumulateDamageStats() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DamageEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DamageEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_AccumulateDamageStats(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_PVPBackToRoom() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_GameModeStateChangedEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_GameModeStateChangedEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_PVPBackToRoom(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_PVPSyncPrepBlocking() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_GameModeStateChangedEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_GameModeStateChangedEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_PVPSyncPrepBlocking(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_PVPSyncMainHUD() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_GameModeStateChangedEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_GameModeStateChangedEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_PVPSyncMainHUD(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_PVXEntryUIByStage() const
    {
        int local_24 = 0;
        ECS::GetContextJob();
        if (ECSInternal::GetMonitorSingletonOnAssign(this.GetECSWorld(), FCS_GameStates, EECSRegType(0), false, true).bIsMonitored)
        {
            this.Monitor_PVXEntryUIByStage(local_24);
        }
        if (ECSInternal::GetMonitorSingletonOnModify(this.GetECSWorld(), FCS_GameStates, EECSRegType(0), false, true).bIsMonitored)
        {
            this.Monitor_PVXEntryUIByStage(local_24);
        }
        return;
    }
}



const FConsoleVariable CVar_VOX_InitLogLevel = FConsoleVariable();

class US_VOXRoomSystem : UECSScriptSystem
{
    US_VOXRoomSystem()
    {
        return;
    }
    UFUNCTION()
    void Monitor_OnPlayerJoinBattleTeam(const FECSEntity &inout PlayerEntity, const FC_PlayerInTeam &inout PlayerInTeam) const
    {
        int local_8;
        int local_34 = 0;
        if (!(this.ShouldUseBattleRoom()))
        {
            XLog(ELog(1), "[VOX] DS: OnAssign FC_PlayerInTeam skipped, GroupBySocialTeam reuses social room");
            return;
        }
        Has local_6;
        if (!(PlayerInTeam.GetTeamEntity().IsValid()) || !(local_6.opCall()))
        {
            XLog(ELog(1), "[VOX] DS: OnAssign FC_PlayerInTeam skipped, team entity invalid");
            return;
        }
        Get local_12;
        local_8 = local_12.opCall().GetTeamID();
        int local_20 = ::UGameDSConnectionSubsystem::Get().GetDsID();
        FString local_28 = ::VOXRoomId::MakeBattleRoomId(local_20, local_8);
        local_34.SetBattleRoomId(local_28);
        local_34.SetbInBattleRoom(true);
        XLog(ELog(1), FString().Append("[VOX] DS: player join battle team, enter room: ").Append(local_28));
        return;
    }
    UFUNCTION()
    void Monitor_OnPlayerLeaveBattleTeam(const FECSEntity &inout PlayerEntity, const FC_PlayerInTeam &inout PlayerInTeam) const
    {
        Has local_4;
        int local_12 = 0;
        if (!(local_4.opCall()))
        {
            XLog(ELog(1), "[VOX] DS: OnRemove FC_PlayerInTeam skipped, no VOX state");
            return;
        }
        if (!(local_12.GetbInBattleRoom()))
        {
            XLog(ELog(1), "[VOX] DS: OnRemove FC_PlayerInTeam skipped, not in battle room");
            return;
        }
        XLog(ELog(1), FString().Append("[VOX] DS: player leave battle team, exit room: ").Append(local_12.GetBattleRoomId()));
        local_12.SetBattleRoomId("");
        local_12.SetbInBattleRoom(false);
        return;
    }
    UFUNCTION()
    void Monitor_OnPlayerSwitchBattleTeam(const FECSEntity &inout PlayerEntity, const FC_PlayerInTeam &inout PlayerInTeam) const
    {
        bool local_1;
        int local_34 = 0;
        if (!(this.ShouldUseBattleRoom()))
        {
            return;
        }
        FString local_6;
        if (!(PlayerInTeam.GetTeamEntity().IsValid()))
        {
            local_1 = false;
        }
        else
        {
            Has local_10;
            local_1 = local_10.opCall();
        }
        if (local_1)
        {
            int local_12;
            Get local_16;
            local_12 = local_16.opCall().GetTeamID();
            int local_24 = ::UGameDSConnectionSubsystem::Get().GetDsID();
            local_6 = ::VOXRoomId::MakeBattleRoomId(local_24, local_12);
        }
        if ((local_6 == local_34.GetBattleRoomId()))
        {
            XLog(ELog(1), FString().Append("[VOX] DS: OnModify FC_PlayerInTeam skipped, room unchanged: ").Append(local_6));
            return;
        }
        if (local_34.GetbInBattleRoom())
        {
            XLog(ELog(1), FString().Append("[VOX] DS: player switch battle team, exit old room: ").Append(local_34.GetBattleRoomId()));
        }
        if (!(local_6.IsEmpty()))
        {
            local_34.SetBattleRoomId(local_6);
            local_34.SetbInBattleRoom(true);
            XLog(ELog(1), FString().Append("[VOX] DS: player switch battle team, enter new room: ").Append(local_6));
        }
        else
        {
            local_34.SetBattleRoomId("");
            local_34.SetbInBattleRoom(false);
            XLog(ELog(1), "[VOX] DS: player switch battle team, new team entity invalid, cleared battle room");
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnDSPlayerInfoChanged(const FECSEntity &inout PlayerEntity, const FC_DSPlayerInfo &inout DSPlayerInfo) const
    {
        int local_6 = 0;
        int64 local_8;
        int64 local_28;
        local_8 = DSPlayerInfo.GetSocialTeamId();
        if (local_8 == local_6.GetLastSocialTeamId())
        {
            return;
        }
        if (local_6.GetbInSocialRoom())
        {
            XLog(ELog(1), FString().Append("[VOX] DS: social team changed, exit old room: ").Append(local_6.GetSocialRoomId()).Append(", PrevTeamId=").Append(local_6.GetLastSocialTeamId()));
        }
        if (local_8 > 0)
        {
            FString local_16 = ::VOXRoomId::MakeSocialRoomId(local_8);
            local_6.SetSocialRoomId(local_16);
            local_6.SetbInSocialRoom(true);
            local_6.SetLastSocialTeamId(local_8);
            XLog(ELog(1), FString().Append("[VOX] DS: social team changed, enter room: ").Append(local_16).Append(", NewTeamId=").Append(local_8));
            return;
        }
        local_28 = local_6.GetLastSocialTeamId();
        local_6.SetSocialRoomId("");
        local_6.SetbInSocialRoom(false);
        local_6.SetLastSocialTeamId(0);
        XLog(ELog(1), FString().Append("[VOX] DS: social team cleared, player left social team, PrevTeamId=").Append(local_28));
        return;
    }
    UFUNCTION()
    void Monitor_OnVOXStateChanged(const FECSEntity &inout PlayerEntity, const FC_PlayerVOXState &inout ServerState) const
    {
        Has local_4;
        int local_14 = 0;
        if (!(local_4.opCall()))
        {
            return;
        }
        FECSWorldPtr local_8 = this.GetECSWorld();
        FString local_24 = ::UGameClientConnectionSubsystem::Get().GetCachedVOXAuthKey();
        if (local_24.IsEmpty())
        {
            XLog(ELog(1), "[VOX] Client: Monitor_OnVOXStateChanged skipped, no auth key cached");
            return;
        }
        if (!((ServerState.GetSocialRoomId() == local_14.LocalSocialRoomId)) || !((ServerState.GetBattleRoomId() == local_14.LocalBattleRoomId)))
        {
            ::VOXUtils::RestoreModesForCurrentContext();
            SendEvent local_32;
            local_32.opCall(FFPTime(-1));
        }
        if (!((ServerState.GetSocialRoomId() == local_14.LocalSocialRoomId)))
        {
            if (!(local_14.LocalSocialRoomId.IsEmpty()))
            {
                XLog(ELog(1), FString().Append("[VOX] Client: leaving social room: ").Append(local_14.LocalSocialRoomId));
                UKLVOXBridge::ExitRoom(local_14.LocalSocialRoomId);
            }
            if (!(ServerState.GetSocialRoomId().IsEmpty()))
            {
                this.EnsureVOXInitialized();
                this.EnterRoomWithAuthKey(EVOXChannelType(0), ServerState.GetSocialRoomId(), local_24, local_14);
            }
            local_14.LocalSocialRoomId = ServerState.GetSocialRoomId();
        }
        if (!((ServerState.GetBattleRoomId() == local_14.LocalBattleRoomId)))
        {
            if (!(local_14.LocalBattleRoomId.IsEmpty()))
            {
                XLog(ELog(1), FString().Append("[VOX] Client: leaving battle room: ").Append(local_14.LocalBattleRoomId));
                UKLVOXBridge::ExitRoom(local_14.LocalBattleRoomId);
            }
            if (!(ServerState.GetBattleRoomId().IsEmpty()))
            {
                this.EnsureVOXInitialized();
                this.EnterRoomWithAuthKey(EVOXChannelType(1), ServerState.GetBattleRoomId(), local_24, local_14);
            }
            local_14.LocalBattleRoomId = ServerState.GetBattleRoomId();
        }
        if (local_14.LocalSocialRoomId.IsEmpty() && local_14.LocalBattleRoomId.IsEmpty() && (UKLVOXBridge::IsVOXInitialized() || UKLVOXBridge::IsVOXInitializing()))
        {
            XLog(ELog(1), "[VOX] All rooms exited, uninitializing VOX");
            UKLVOXBridge::UninitVOX();
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnVOXStateRemoved(const FECSEntity &inout PlayerEntity, const FC_PlayerVOXState &inout OldState) const
    {
        Has local_4;
        int local_14 = 0;
        if (!(local_4.opCall()))
        {
            return;
        }
        FECSWorldPtr local_8 = this.GetECSWorld();
        if (!(local_14.LocalSocialRoomId.IsEmpty()))
        {
            XLog(ELog(1), FString().Append("[VOX] Client: entity removed, leaving social room: ").Append(local_14.LocalSocialRoomId));
            UKLVOXBridge::ExitRoom(local_14.LocalSocialRoomId);
            local_14.LocalSocialRoomId = "";
        }
        if (!(local_14.LocalBattleRoomId.IsEmpty()))
        {
            XLog(ELog(1), FString().Append("[VOX] Client: entity removed, leaving battle room: ").Append(local_14.LocalBattleRoomId));
            UKLVOXBridge::ExitRoom(local_14.LocalBattleRoomId);
            local_14.LocalBattleRoomId = "";
        }
        if (UKLVOXBridge::IsVOXInitialized() || UKLVOXBridge::IsVOXInitializing())
        {
            XLog(ELog(1), "[VOX] Entity removed, uninitializing VOX");
            UKLVOXBridge::UninitVOX();
        }
        return;
    }
    UFUNCTION()
    void ClientJob_UninitVOX() const
    {
        if (UKLVOXBridge::IsVOXInitialized() || UKLVOXBridge::IsVOXInitializing())
        {
            XLog(ELog(1), "[VOX] ECS World ending (shutdown/disconnect), UninitVOXForShutdown");
            UKLVOXBridge::UninitVOXForShutdown();
        }
        return;
    }
    bool ShouldUseBattleRoom() const
    {
        return (int(::FTeamUtils::GetCombatTeamRule()) != 1);
    }
    void EnterRoomWithAuthKey(const EVOXChannelType ChannelType, const FString &inout RoomId, const FString &inout AuthKey, FCS_ClientVOXState &inout ClientState) const
    {
        FString local_12;
        if (int(ChannelType) == 0)
        {
            local_12 = "Social";
        }
        else
        {
            local_12 = "Battle";
        }
        bool local_7 = ::VOXUtils::ShouldDeviceOn(ClientState.MicMode, EVOXChannelType(ChannelType));
        bool local_13 = ::VOXUtils::ShouldDeviceOn(ClientState.SpeakerMode, EVOXChannelType(ChannelType));
        XLog(ELog(1), FString().Append("[VOX] EnterRoomAndApplySettings ").Append(local_12).Append(" room=").Append(RoomId).Append(" mic=").Append(local_7).Append(" speaker=").Append(local_13));
        UKLVOXBridge::EnterRoomAndApplySettings(RoomId, AuthKey, "1", local_7, local_13);
        for (auto local_29 : ClientState.MutedPlayerUids)
        {
            UKLVOXBridge::AddUserToBlockList(RoomId, FString().Append(local_29));
        }
        if (ClientState.MutedPlayerUids.Num() > 0)
        {
            XLog(ELog(1), FString().Append("[VOX] Auto-blocked ").Append(ClientState.MutedPlayerUids.Num()).Append(" muted player(s) in ").Append(local_12).Append(" room=").Append(RoomId));
        }
        return;
    }
    void EnsureVOXInitialized() const
    {
        FCS_ClientVOXState local_8;
        FECSWorldPtr local_2 = this.GetECSWorld();
        if (UKLVOXBridge::IsVOXInitialized())
        {
            if (!(local_8.bVOXInitialized))
            {
                local_8.bVOXInitialized = true;
            }
            return;
        }
        if (UKLVOXBridge::IsVOXInitializing())
        {
            return;
        }
        XLog(ELog(1), "[VOX] Client: lazy init VOX on first join room");
        UKLVOXBridge::InitVOX(CVar_VOX_InitLogLevel.GetInt());
        EVOXVoiceMode local_13 = ::VOXUtils::LoadPersistedMicMode();
        EVOXVoiceMode local_12 = ::VOXUtils::LoadPersistedSpeakerMode();
        local_8.MicMode = EVOXVoiceMode(local_13);
        local_8.SpeakerMode = EVOXVoiceMode(local_12);
        local_8.bVOXInitialized = true;
        XLog(ELog(1), FString().Append("[VOX] Client: VOX initialized, persisted mic=").Append(int(local_13)).Append(" speaker=").Append(int(local_12)));
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnPlayerJoinBattleTeam() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorPlayerInTeamOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnPlayerJoinBattleTeam(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnPlayerLeaveBattleTeam() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorPlayerInTeamOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnPlayerLeaveBattleTeam(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnPlayerSwitchBattleTeam() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorPlayerInTeamOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnPlayerSwitchBattleTeam(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnDSPlayerInfoChanged() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorDSPlayerInfoOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnDSPlayerInfoChanged(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorDSPlayerInfoOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_OnDSPlayerInfoChanged(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnVOXStateChanged() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorPlayerVOXStateOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnVOXStateChanged(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorPlayerVOXStateOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_OnVOXStateChanged(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnVOXStateRemoved() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorPlayerVOXStateOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnVOXStateRemoved(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_UninitVOX() const
    {
        ECS::GetContextJob();
        this.ClientJob_UninitVOX();
        return;
    }
}


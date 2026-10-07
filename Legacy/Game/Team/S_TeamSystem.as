

class US_TeamSystem : UECSScriptSystem
{
    US_TeamSystem()
    {
        return;
    }
    bool IsPlayerEntityEnemy(const FECSEntity &inout PlayerEntity1, const FECSEntity &inout PlayerEntity2) const
    {
        FECSEntity local_4 = ::FASCommonUtils::GetUniqueAvatarPawnEntity(PlayerEntity1);
        if (!(local_4.IsValid()))
        {
            local_4 = ::FASCommonUtils::GetUniquePawnEntityFromAIController(PlayerEntity1);
        }
        if (!(local_4.IsValid()))
        {
            return false;
        }
        FECSEntity local_8 = ::FASCommonUtils::GetUniqueAvatarPawnEntity(PlayerEntity2);
        if (!(local_8.IsValid()))
        {
            local_8 = ::FASCommonUtils::GetUniquePawnEntityFromAIController(PlayerEntity2);
        }
        if (!(local_8.IsValid()))
        {
            return false;
        }
        return ::FASCommonUtils::IsTargetEntityEnemy(local_4, local_8);
    }
    UFUNCTION()
    void ServerJob_HandleTeamUp(const FCE_ClientToServerTeamUp &inout Event) const
    {
        if (!(Event.Sender.IsValid()))
        {
            return;
        }
        ::FSocialTeamUtils::ServerSendTeamUpRequest(Event.Sender, int(Event.TargetUid));
        return;
    }
    UFUNCTION()
    void ServerJob_HandleLeaveTeam(const FCE_ClientToServerLeaveTeam &inout Event) const
    {
        if (!(Event.Sender.IsValid()))
        {
            return;
        }
        ::FSocialTeamUtils::ServerSendLeaveTeamRequest(Event.Sender, Event.TeamId);
        return;
    }
    UFUNCTION()
    void ServerJob_HandleKickTeammate(const FCE_ClientToServerKickTeammate &inout Event) const
    {
        if (!(Event.Sender.IsValid()))
        {
            return;
        }
        ::FSocialTeamUtils::ServerSendKickTeammateRequest(Event.Sender, Event.TeamId, int(Event.KickUid));
        return;
    }
    UFUNCTION()
    void ServerJob_HandleTransferCaptain(const FCE_ClientToServerTransferCaptain &inout Event) const
    {
        if (!(Event.Sender.IsValid()))
        {
            return;
        }
        ::FSocialTeamUtils::ServerSendTransferCaptainRequest(Event.Sender, Event.TeamId, int(Event.NewCaptainUid));
        return;
    }
    UFUNCTION()
    void ServerJob_HandleTeamInviteReply(const FCE_ClientToServerTeamInviteReply &inout Event) const
    {
        if (!(Event.Sender.IsValid()))
        {
            return;
        }
        ::FSocialTeamUtils::ServerSendTeamInviteReplyRequest(Event.Sender, Event.TeamId, int(Event.SourceUid), Event.bAccept);
        return;
    }
    UFUNCTION()
    void ServerJob_HandleTeamApplyReply(const FCE_ClientToServerTeamApplyReply &inout Event) const
    {
        if (!(Event.Sender.IsValid()))
        {
            return;
        }
        ::FSocialTeamUtils::ServerSendTeamApplyReplyRequest(Event.Sender, Event.TeamId, int(Event.SourceUid), Event.bAccept);
        return;
    }
    UFUNCTION()
    void ClientJob_HandleTeamJoin(const FCE_ServerToClientTeamJoin &inout Event) const
    {
        FECSEntity local_2 = Event.Inviter;
        FECSEntity local_4 = Event.Invitee;
        bool local_6 = !(false);
        if (!(local_2.IsValid()) == local_6 || (!(local_4.IsValid()) == !(false)))
        {
            return;
        }
        FECSEntity local_12 = ::FASCommonUtils::GetLocalPlayerProxy();
        if (((!((local_2 == local_12))) && !((local_4 == local_12))))
        {
            return;
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleFindNearbyPlayer(const FCE_ClientToServerNearbyPlayerList &inout Event) const
    {
        int local_2 = 0;
        int local_124 = 0;
        if (!(::FASCommonUtils::GetUniqueAvatarPawnEntity(local_2).IsValid()))
        {
            return;
        }
        Get local_22;
        FVector local_18 = local_22.opCall().GetPosition();
        TMap<uint, float32> local_42;
        TArray<FPlayerBriefInfo> local_46;
        TArray<FECSEntity> local_54 = FGameUtils::GetAllPlayerControllerEntities(true);
        Has local_76;
        for (auto& local_68 : local_54)
        {
            if (!(::FASCommonUtils::GetUniqueAvatarPawnEntity(local_68).IsValid()) || !(local_76.opCall()))
            {
                continue;
            }
            FVector local_84 = local_22.opCall().GetPosition();
            if ((local_18 - local_84).Size() < 100000.0)
            {
                FPlayerBriefInfo local_112;
                ::PlayerBriefInfoBuild::ApplyFromDSPlayerEntity(local_112, local_68, ::FASCommonUtils::GetPlayerUidFromPlayerEntity(local_68));
                local_46.Add(local_112);
                local_42.Add(::FASCommonUtils::GetPlayerUidFromPlayerEntity(local_68), float32(((local_18 - local_84).Size())));
            }
        }
        FFPTime local_122 = FFPTime(-1);
        local_124.NearbyPlayerList = local_46;
        local_124.PlayerDistanceMap = local_42;
        return;
    }
    UFUNCTION()
    void Job_HandleDeath(const FCE_DeathEvent &inout Event) const
    {
        if (!(Event.Sender.IsValid()))
        {
            return;
        }
        if (!(::FASCommonUtils::IsMonsterPrefab(Event.Sender)))
        {
            return;
        }
        if (!(::FASCommonUtils::IsAvatarPrefab(FECSEntity(Event.KilledByEntity))))
        {
            return;
        }
        return;
    }
    UFUNCTION()
    void Job_HandleRescuedByTeammate(const FCE_RescuedByTeammate &inout Event) const
    {
        return;
    }
    UFUNCTION()
    void ServerJob_TickTeamExtraInfo() const
    {
        FECSWorldPtr local_4 = this.GetECSWorld();
        ::FTeamUtils::TickTeamManagerExtraInfo(0);
        return;
    }
    UFUNCTION()
    void ServerJob_OnAddPlayerController(const FECSEntity &inout PlayerEntity, const FC_PlayerController &inout C_PlayerController) const
    {
        if (::FTeamUtils::IsSingleTeamWorld())
        {
            ::FTeamUtils::HandlePlayerEnterForSingleTeam(PlayerEntity);
            return;
        }
        if (::FTeamUtils::IsPVXTeamWorld())
        {
            ::FTeamUtils::HandlePlayerEnterForPVXTeam(PlayerEntity);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_OnRemovePlayerController(const FECSEntity &inout PlayerEntity, const FC_PlayerController &inout C_PlayerController) const
    {
        Get local_4;
        const FC_PlayerInTeam& local_6 = local_4.opCall();
        if (local_6)
        {
            XLog(ELog(27), FString().Append("ServerJob_OnRemovePlayerController PlayerEntity=").Append(PlayerEntity).Append(" TeamEntity=").Append(local_6.GetTeamEntity()));
            ::FTeamUtils::RemoveMemberFromTeam(local_6.GetTeamEntity(), PlayerEntity, true);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleTeamUp() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ClientToServerTeamUp> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ClientToServerTeamUp& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleTeamUp(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleLeaveTeam() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ClientToServerLeaveTeam> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ClientToServerLeaveTeam& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_ClientToServerLeaveTeam, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleLeaveTeam(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleKickTeammate() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ClientToServerKickTeammate> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ClientToServerKickTeammate& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_ClientToServerKickTeammate, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleKickTeammate(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleTransferCaptain() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ClientToServerTransferCaptain> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ClientToServerTransferCaptain& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_ClientToServerTransferCaptain, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleTransferCaptain(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleTeamInviteReply() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ClientToServerTeamInviteReply> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ClientToServerTeamInviteReply& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_ClientToServerTeamInviteReply, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleTeamInviteReply(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleTeamApplyReply() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ClientToServerTeamApplyReply> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ClientToServerTeamApplyReply& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_ClientToServerTeamApplyReply, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleTeamApplyReply(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleTeamJoin() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ServerToClientTeamJoin> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ServerToClientTeamJoin& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleTeamJoin(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleFindNearbyPlayer() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ClientToServerNearbyPlayerList> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ClientToServerNearbyPlayerList& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleFindNearbyPlayer(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleDeath() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DeathEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DeathEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleDeath(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleRescuedByTeammate() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_RescuedByTeammate> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_RescuedByTeammate& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleRescuedByTeammate(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TickTeamExtraInfo() const
    {
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(0.5))))
        {
            return;
        }
        this.ServerJob_TickTeamExtraInfo();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_OnAddPlayerController() const
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
                this.ServerJob_OnAddPlayerController(local_36, local_38);
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
            this.ServerJob_OnAddPlayerController(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_OnRemovePlayerController() const
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
                this.ServerJob_OnRemovePlayerController(local_36, local_38);
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
            this.ServerJob_OnRemovePlayerController(local_162, local_38);
        }
        local_2.UpdateCachedEntityCount(local_90);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}


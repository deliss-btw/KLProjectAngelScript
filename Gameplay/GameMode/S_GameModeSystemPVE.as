

class US_ASGameModeSystemPVE : US_ECSScriptGameModeSystemBase
{
    US_ASGameModeSystemPVE()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_Begin() const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        0.SetStageType(EFCS_GameStageType(1));
        ::FGameModeUtils::InitAttributeScale(this.GetECSWorld());
        return;
    }
    UFUNCTION()
    void ServerJob_TickPrepare() const
    {
        int local_26 = 0;
        if (::FLevelDataLayerUtils::IsWaitingForStreaming(this.GetWorld(), false))
        {
            return;
        }
        if (!(::FGameModeUtils::IsInitialLoadingComplete()))
        {
            return;
        }
        if (::FGameModeUtils::IsWaitingForStartUpPlayers(this.GetECSWorld()))
        {
            return;
        }
        FECSWorldPtr local_6 = this.GetECSWorld();
        Has local_10;
        if (!(local_10.opCall()))
        {
            ::FGameModeUtils::InitTeamSpawner(this.GetECSWorld());
        }
        XLog(ELog(22), "FinishPrepareGameEvent");
        FFPTime local_18 = FFPTime(-1);
        FECSWorldPtr local_6_2 = this.GetECSWorld();
        SendEvent local_16;
        local_16.opCall(ENTITY_NULL, local_18);
        FECSWorldPtr local_6_3 = this.GetECSWorld();
        local_26.SetStageType(EFCS_GameStageType(2));
        return;
    }
    UFUNCTION()
    void ServerJob_TickStart() const
    {
        this.TickStartPlayers();
        return;
    }
    UFUNCTION()
    void ServerJob_HandleReviveTeleport(FCE_Event_ReviveTeleport &inout Event) const
    {
        ::FGameModeUtils::DefaultReviveTeleport(Event);
        return;
    }
    void TickStartPlayers() const
    {
        int local_14 = 0;
        int local_138 = 0;
        int local_150 = 0;
        ::FGameModeUtils::HandleClientJoin();
        FECSWorldPtr local_2 = this.GetECSWorld();
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        FECSRuntimeView local_52 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_56;
        local_56.opCall();
        Exclude(local_52).opCall();
        FECSRuntimeViewIterator local_94 = local_52.Iterator();
        for (; local_94.CanProceed;)
        {
            const FECSEntity& local_132 = local_94.Proceed();
            local_150.SetbReady(true);
            local_138.SetTeam(uint8(1));
            ::FGameModeUtils::SpawnAvatarsForPlayer(local_132, local_138, local_14);
            FECSEntity local_162 = FECSEntity(local_132.GetId());
            FECSWorldPtr local_2_3 = this.GetECSWorld();
            int local_165 = local_138.GetPlayerId();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_Begin() const
    {
        ECS::GetContextJob();
        this.ServerJob_Begin();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TickPrepare() const
    {
        ECS::GetContextJob();
        if ((!((int(::FGameModeUtils::GetGameStageType()) == 1))) == (!(false)))
        {
            return;
        }
        this.ServerJob_TickPrepare();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TickStart() const
    {
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if ((!((int(::FGameModeUtils::GetGameStageType()) == 2))) == (!(false)))
        {
            return;
        }
        if (!(local_2.IsOnInterval(FFPTime(1))))
        {
            return;
        }
        this.ServerJob_TickStart();
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
}




// NOTE: class defaults are not authored in this module: US_GameClientMessageSystem (default scalar field UECSSystem.SystemNetMode has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class US_GameClientMessageSystem : UECSScriptSystem
{
    US_GameClientMessageSystem()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        if ((int(this.GetWorld().GetNetMode())) == 1)
        {
            return true;
        }
        return false;
    }
    UFUNCTION()
    void Init_Implementation()
    {
        if ((int(this.GetWorld().GetNetMode())) == 1)
        {
            return;
        }
        XLog(ELog(27), FString().Append("Init"));
        AAS_ECSWorldSettings local_18 = (Cast<AAS_ECSWorldSettings>(this.GetWorld().GetWorldSettings()));
        if (local_18 != nullptr)
        {
            local_18.InitLevelInfo();
        }
        return;
    }
    UFUNCTION()
    void ClientJob_TickGameServerMessage() const
    {
        ::UGameClientConnectionSubsystem::Get().TickGameConnection(float32(ECS::GetContextDeltaTime().ToSeconds()));
        return;
    }
    UFUNCTION()
    void ClientJob_PingSelectedServer() const
    {
        if (::UGameClientConnectionSubsystem::Get().IsConnectedToGameServer() && ::UGameClientConnectionSubsystem::Get().HasSelectedServer())
        {
            ::UGameClientConnectionSubsystem::Get().PingSelectedServer();
        }
        return;
    }
    UFUNCTION()
    void ClientJob_HandlePlayerResponseQuitGame(const FCE_PlayerResponseQuitGame &inout Event) const
    {
        APlayerController local_2;
        int local_4 = 0;
        FECSWorldPtr local_6 = ECS::GetECSWorld();
        if (local_4)
        {
            local_2 = local_4.UEPlayerController;
        }
        if ((!((local_2 != nullptr))))
        {
            local_2 = Gameplay::GetPlayerController(__GetWorldContext(), 0);
        }
        System::QuitGame(__GetWorldContext(), local_2, EQuitPreference(0), true);
        return;
    }
    UFUNCTION()
    void ClientJob_HandlePlayerEnterDSFailed(const FCE_PlayerEnterDSFailed &inout Event) const
    {
        XLog(ELog(27), FString().Append("HandlePlayerEnterDSFailed ErrorCode=").Append(Event.ErrorCode));
        FCommonTipsParam local_14;
        ::CommonPopup::Tips(NSLOCTEXT("EnterDS", "EnterDS_Failed", "иї›е…ҐDSе¤±иґҐ"), local_14);
        return;
    }
    UFUNCTION()
    void ClientJob_DisplayPlayerErrorCode(const FCE_NotifyDSPlayerErrorCode &inout Event) const
    {
        ::FGameConnectionUtils::DisplayErrorCode(int(Event.ErrorCode));
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TickGameServerMessage() const
    {
        ECS::GetContextJob();
        this.ClientJob_TickGameServerMessage();
        return;
    }
    UFUNCTION()
    void Run_ClientJob_PingSelectedServer() const
    {
        ECS::GetContextJob();
        if (!(this.GetECSRuntime().IsOnInterval(FFPTime(30.0))))
        {
            return;
        }
        this.ClientJob_PingSelectedServer();
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandlePlayerResponseQuitGame() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerResponseQuitGame> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayerResponseQuitGame& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandlePlayerResponseQuitGame(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandlePlayerEnterDSFailed() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerEnterDSFailed> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayerEnterDSFailed& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandlePlayerEnterDSFailed(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_DisplayPlayerErrorCode() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_NotifyDSPlayerErrorCode> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_NotifyDSPlayerErrorCode& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_DisplayPlayerErrorCode(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}


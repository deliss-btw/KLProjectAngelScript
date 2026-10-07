

class US_EnhancedInputContextHelperSystem : UECSScriptSystem
{
    US_EnhancedInputContextHelperSystem()
    {
        return;
    }
    UFUNCTION()
    void ClientJob_HandleEnableInputContextRequest(const FCE_NotifyEnableInputContext &inout Event) const
    {
        if (Event.bEnable)
        {
            ::EnhancedInputUtils::AddInputContext(Event.Sender, Event.InputContextConfig);
            return;
        }
        ::EnhancedInputUtils::RemoveInputContext(Event.Sender, Event.InputContextConfig);
        return;
    }
    UFUNCTION()
    void ClientJob_HandleEnableInputContextTagRequest(const FCE_NotifyEnableInputContextTag &inout Event) const
    {
        if (Event.bEnable)
        {
            ::EnhancedInputUtils::EnableTag(Event.Sender, Event.Tag);
            return;
        }
        ::EnhancedInputUtils::DisableTag(Event.Sender, Event.Tag);
        return;
    }
    UFUNCTION()
    void ClientJob_HandleSetGameplayInputEnabledNotify(const FCE_SetGameplayInputEnabled &inout Event) const
    {
        FGameplayTag local_4 = FGameplayTag::RequestGameplayTag(n"InputContext.InGame", true);
        if (Event.bEnabled)
        {
            ::EnhancedInputUtils::EnableTag(Event.Sender, local_4);
        }
        else
        {
            ::EnhancedInputUtils::DisableTag(Event.Sender, local_4);
        }
        XLog(ELog(22), FString().Append("[GameplayInputGate][ClientReceive] Sender=").Append(Event.Sender).Append(" Enabled=").Append(Event.bEnabled).Append(" Tag=").Append(local_4));
        return;
    }
    UFUNCTION()
    void ClientJob_HandleSetTeleportInputBlockedNotify(const FCE_SetTeleportInputBlocked &inout Event, const FCS_LocalPlayer &inout LocalPlayer) const
    {
        APlayerController local_2 = LocalPlayer.UEPlayerController;
        if (!(IsValid(local_2)))
        {
            XWarning(ELog(22), FString().Append("[TeleportInputGate][ClientIgnore] Sender=").Append(Event.Sender).Append(" SourceDsId=").Append(Event.SourceDsId).Append(" Blocked=").Append(Event.bBlocked).Append(" Reason=InvalidPlayerController"));
            return;
        }
        ULocalPlayer local_12 = local_2.GetLocalPlayer();
        if (!(IsValid(local_12)))
        {
            XWarning(ELog(22), FString().Append("[TeleportInputGate][ClientIgnore] Sender=").Append(Event.Sender).Append(" SourceDsId=").Append(Event.SourceDsId).Append(" Blocked=").Append(Event.bBlocked).Append(" Reason=InvalidLocalPlayer"));
            return;
        }
        UKLEnhancedInputManagerSubsystem local_18 = UKLEnhancedInputManagerSubsystem::Get(local_12);
        if (local_18 != nullptr)
        {
            local_18.SetTeleportInputBlocked(Event.SourceDsId, Event.bBlocked);
            XLog(ELog(22), FString().Append("[TeleportInputGate][ClientReceive] Sender=").Append(Event.Sender).Append(" SourceDsId=").Append(Event.SourceDsId).Append(" Blocked=").Append(Event.bBlocked));
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleEnableInputContextRequest() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_NotifyEnableInputContext> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_NotifyEnableInputContext& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleEnableInputContextRequest(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleEnableInputContextTagRequest() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_NotifyEnableInputContextTag> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_NotifyEnableInputContextTag& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleEnableInputContextTagRequest(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleSetGameplayInputEnabledNotify() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_SetGameplayInputEnabled> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_SetGameplayInputEnabled& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleSetGameplayInputEnabledNotify(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleSetTeleportInputBlockedNotify() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        TECSEventConstIterator<FCE_SetTeleportInputBlocked> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_SetTeleportInputBlocked& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ClientJob_HandleSetTeleportInputBlockedNotify(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
}


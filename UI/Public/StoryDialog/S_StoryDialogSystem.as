

class US_StoryDialogSystem : US_EUIGroupScriptSystemBase
{
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> StoryDialogPage;

    US_StoryDialogSystem()
    {
        return;
    }
    UFUNCTION()
    void OnPageClosed_Implementation(const FEUIWidgetRef &inout PageHandle)
    {
        if (this.GetECSWorld().IsValid())
        {
            FFPTime local_10 = FFPTime(-1);
            FECSWorldPtr local_2 = this.GetECSWorld();
            SendEvent local_8;
            local_8.opCall(ENTITY_NULL, local_10);
        }
        return;
    }
    UFUNCTION()
    void ClientJob_OnPlayerEnterStoryDialog(const FCE_StoryDialogStart &inout Event, const FCS_LocalPlayer &inout LocalPlayer) const
    {
        FEUIWidgetRef local_4 = FEUIWidget::FindWidgetByClass(LocalPlayer.UEPlayerController.GetLocalPlayer(), this.StoryDialogPage);
        if (!(local_4.IsValid()))
        {
            local_4 = FEUIWidget::Legacy_AddGroupWidgetByClass(LocalPlayer.UEPlayerController.GetLocalPlayer(), this.StoryDialogPage, this);
        }
        else
        {
            XWarning(ELog(16), FString().Append("Story dialog page is already open"));
        }
        if (local_4.IsValid())
        {
            FC_PlayerStoryDialog local_22;
            Assign local_18;
            local_18.opCall(local_22).TargetEntity = Event.TargetEntity;
            ::FNPCWatchPlayerLookUtils::SetWatchPlayerLookDialogueActive(Event.TargetEntity, true);
            ::FVMS_StoryDialog::Get(LocalPlayer.UEPlayerController).InitiateDialog(Event.DialogInfo);
        }
        return;
    }
    UFUNCTION()
    void ClientJob_HandleInterruptStoryServerInterrupt(const FCE_StoryDialogServerInterrupt &inout Event, const FCS_LocalPlayer &inout LocalPlayer) const
    {
        Get local_4;
        const FC_PlayerStoryDialog& local_6 = local_4.opCall();
        if (local_6)
        {
            if ((!((Event.TargetEntity == ENTITY_NULL)) && !((local_6.TargetEntity == Event.TargetEntity))))
            {
                XLog(ELog(16), FString().Append("Story dialog target entity mismatch, ").Append(local_6.TargetEntity).Append(" != ").Append(Event.TargetEntity));
                return;
            }
            if (FEUIWidget::FindWidgetByClass(LocalPlayer.UEPlayerController.GetLocalPlayer(), this.StoryDialogPage).IsValid())
            {
                FEUIWidget::RemoveWidgetByClass(LocalPlayer.UEPlayerController.GetLocalPlayer(), this.StoryDialogPage);
            }
            ::FNPCWatchPlayerLookUtils::SetWatchPlayerLookDialogueActive(local_6.TargetEntity, false);
            Remove local_30;
            local_30.opCall();
        }
        return;
    }
    UFUNCTION()
    void ClientJob_OnPlayerSelectStoryDialogOption(const FCE_StoryDialogSelect &inout Event, const FCS_LocalPlayer &inout LocalPlayer) const
    {
        int local_12 = 0;
        XLog(ELog(0), FString().Append("EcosimAIV2Dialogue: ClientJob_OnPlayerSelectStoryDialogOption"));
        if (local_12)
        {
            FCE_StoryDialogEnd local_28;
            XLog(ELog(0), FString().Append("EcosimAIV2Dialogue: ClientJob_OnPlayerSelectStoryDialogOption CurrentDialog"));
            FFPTime local_24 = FFPTime(-1);
            FECSEntity local_18 = LocalPlayer.GetPlayerPawnEntity();
            local_28.SelectedIndex = int(Event.SelectedIndex);
            local_28.TargetEntity = local_12.TargetEntity;
            ::FNPCWatchPlayerLookUtils::SetWatchPlayerLookDialogueActive(local_12.TargetEntity, false);
            Remove local_32;
            local_32.opCall();
        }
        FEUIWidget::RemoveWidgetByClass(LocalPlayer.UEPlayerController.GetLocalPlayer(), this.StoryDialogPage);
        return;
    }
    UFUNCTION()
    void ServerJob_ReportStoryDialogSelection(const FCE_StoryDialogEnd &inout Event) const
    {
        XLog(ELog(0), FString().Append("EcosimAIV2Dialogue: ServerJob_ReportStoryDialogSelection"));
        FFPTime local_12 = FFPTime(-1);
        FCE_EcosimAIV2DialogueSelectEvent local_16;
        local_16.InteractSource = Event.Sender;
        local_16.InteractTarget = Event.TargetEntity;
        local_16.OptionIndex = int(Event.SelectedIndex);
        return;
    }
    UFUNCTION()
    void ServerJob_ReportInterruptStoryDialog(const FCE_StoryDialogInterrupt &inout Event) const
    {
        XLog(ELog(0), FString().Append("EcosimAIV2Dialogue: ServerJob_ReportInterruptStoryDialog"));
        return;
    }
    UFUNCTION()
    void ClientJob_HandleStoryDialogPageClosed(const FCE_StoryDialogPageClosed &inout Event) const
    {
        this.Run_Job_RequestInterruptStoryDialog();
        return;
    }
    UFUNCTION()
    void Job_RequestInterruptStoryDialog(const FECSEntity &inout Entity, const FC_PlayerStoryDialog &inout StoryDialog) const
    {
        int local_18 = 0;
        ::FASCommonUtils::GetControlledPawnEntity(Entity);
        FFPTime local_14 = FFPTime(-1);
        local_18.TargetEntity = StoryDialog.TargetEntity;
        ::FNPCWatchPlayerLookUtils::SetWatchPlayerLookDialogueActive(StoryDialog.TargetEntity, false);
        Remove local_24;
        local_24.opCall();
        return;
    }
    UFUNCTION()
    void Run_ClientJob_OnPlayerEnterStoryDialog() const
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
        TECSEventConstIterator<FCE_StoryDialogStart> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_StoryDialogStart& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ClientJob_OnPlayerEnterStoryDialog(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleInterruptStoryServerInterrupt() const
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
        TECSEventConstIterator<FCE_StoryDialogServerInterrupt> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_StoryDialogServerInterrupt& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ClientJob_HandleInterruptStoryServerInterrupt(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_OnPlayerSelectStoryDialogOption() const
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
        TECSEventConstIterator<FCE_StoryDialogSelect> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_StoryDialogSelect& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ClientJob_OnPlayerSelectStoryDialogOption(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_ReportStoryDialogSelection() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_StoryDialogEnd> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_StoryDialogEnd& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_ReportStoryDialogSelection(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_ReportInterruptStoryDialog() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_StoryDialogInterrupt> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_StoryDialogInterrupt& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_ReportInterruptStoryDialog(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleStoryDialogPageClosed() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_StoryDialogPageClosed> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_StoryDialogPageClosed& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleStoryDialogPageClosed(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_RequestInterruptStoryDialog() const
    {
        int local_132 = 0;
        int local_134 = 0;
        FECSManualJobStatScope local_1 = FECSManualJobStatScope(FName("[AS][ManualJob]S_StoryDialogSystem::Job_RequestInterruptStoryDialog"));
        ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        FECSRuntimeView local_48 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_52;
        local_52.opCall();
        Exclude(local_48).opCall();
        FECSRuntimeViewIterator local_90 = local_48.Iterator();
        for (; local_90.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_129 = FECSEntityScopeCycleCounter(local_90.Proceed());
            this.Job_RequestInterruptStoryDialog(local_132, local_134);
        }
        return;
    }
}


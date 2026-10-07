

class US_EcosimAIV2InteractDialogueSystem : UECSScriptSystem
{
    US_EcosimAIV2InteractDialogueSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_HandleEcosimAIV2InteractDialogueEvent(const FCE_EcosimAIV2InteractDialogueEvent &inout Event) const
    {
        FECSEntity local_4 = Event.InteractSource;
        FECSEntity local_8 = Event.InteractTarget;
        ::FEcosimAIV2Utils::TryTriggerNextInteractDialogue(local_4, local_8, -1);
        return;
    }
    UFUNCTION()
    void Job_HandleEcosimAIV2ClientDialogueSelectEvent(const FCE_EcosimAIV2ClientDialogueSelectEvent &inout Event) const
    {
        int local_33 = 0;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        Has local_8;
        bool local_9 = local_8.opCall();
        if (local_9)
        {
            Get local_14;
            const FC_EcosimAIV2PlayerDiagueInfo& local_16 = local_14.opCall();
            if (local_16)
            {
                FECSEntity local_20 = FECSEntity(local_16.CurrentSpeakToEntity.GetEntity());
                Get local_28;
                const FC_EcosimAIV2DialogueMemory& local_30 = local_28.opCall();
                if (local_30)
                {
                    if (!(local_30.CurrentSpeakToAndOption) || !(local_30.CurrentSpeakToAndOption.IsSet()))
                    {
                        return;
                    }
                    if ((Event.CurrentSectionIndex - 1) < local_33)
                    {
                        local_33 = Event.CurrentSectionIndex;
                        local_33 = local_33 - 1;
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnEcosimAIV2InteractSpeakChange(const FECSEntity &inout Entity, const FC_EcosimAIV2InteractSimpleSpeakToAndOption &inout EcosimAIV2InteractSpeak) const
    {
        if (EcosimAIV2InteractSpeak.SpeakToAndOptionList.IsEmpty())
        {
            Entity.RemoveGameplayTag(GameplayTags::EcosimAIV2_State_HasInteractDialogue, NAME_None);
            return;
        }
        Entity.AddGameplayTag(GameplayTags::EcosimAIV2_State_HasInteractDialogue, NAME_None);
        return;
    }
    UFUNCTION()
    void Monitor_OnEcosimAIV2InteractSimpleSpeakToAndOptionChange(const FECSEntity &inout Entity, const FC_EcosimAIV2InteractSimpleSpeakToAndOption &inout EcosimAIV2InteractSimpleSpeakToAndOption) const
    {
        SendEvent local_4;
        local_4.opCall(FFPTime(-1));
        return;
    }
    UFUNCTION()
    void Monitor_OnEcosimAIV2DialogueMemoryChange(const FECSEntity &inout Entity, const FC_EcosimAIV2DialogueMemory &inout EcosimAIV2DialogueMemory) const
    {
        SendEvent local_4;
        local_4.opCall(FFPTime(-1));
        return;
    }
    UFUNCTION()
    void Monitor_OnPlayerControllerChange(const FECSEntity &inout PlayerEntity, const FC_PlayerController &inout PlayerController) const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Get local_6;
        const FCS_EcosimAIV2CareAboutPlayerController& local_8 = local_6.opCall();
        if (local_8)
        {
            TArray<FECSEntity> local_14;
            local_14.Add(PlayerEntity);
            for (auto& local_30 : local_8.CareAboutPlayerControllerEntityList)
            {
                ::FEcosimAIV2Utils::UpdateSyncSpeakToAndOptionInfoByPlayerEntity(local_30, local_14);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_HandleEcosimAIV2UpdateDialogueSyncDataForAllPlayerEvent(const FCE_EcosimAIV2UpdateDialogueSyncDataForAllPlayerEvent &inout Event) const
    {
        int local_132 = 0;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        FECSRuntimeView local_44 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_48;
        local_48.opCall();
        TArray<FECSEntity> local_52;
        FECSRuntimeViewIterator local_86 = local_44.Iterator();
        for (; local_86.CanProceed;)
        {
            local_52.Add(local_86.Proceed());
        }
        ::FEcosimAIV2Utils::UpdateSyncSpeakToAndOptionInfoByPlayerEntity(local_4, local_52);
        FECSWorldPtr local_24 = ECS::GetECSWorld();
        local_132.CareAboutPlayerControllerEntityList.AddUnique(local_4);
        return;
    }
    UFUNCTION()
    void Job_HandleEcosimAIV2DialogueSelectEvent(const FCE_EcosimAIV2DialogueSelectEvent &inout Event) const
    {
        int local_20 = 0;
        int local_28 = 0;
        int local_46 = 0;
        FECSEntity local_4 = Event.InteractSource;
        FECSEntity local_8 = Event.InteractTarget;
        XLog(ELog(0), FString().Append("EcosimAIV2Dialogue: Job_HandleEcosimAIV2DialogueSelectEvent"));
        if (!(local_20))
        {
            return;
        }
        if (!(local_28))
        {
            return;
        }
        FEcosimAIV2SpeakToMemory& local_34 = local_20.SpeakToMemoryMap.FindOrAdd(FECSEntity(local_28.GetPlayerEntity()));
        FName local_36;
        local_36.GetDataName();
        local_34.SpokenToNameKeyList.Add(local_36);
        FFPTime local_44 = FFPTime(-1);
        local_46.InteractSource = local_4;
        local_46.InteractTarget = local_8;
        local_46.CurrentSpeakToAndOption = local_20.CurrentSpeakToAndOption;
        if (int(Event.OptionIndex) >= 0 && ::FEcosimAIV2Utils::TryTriggerNextInteractDialogue(local_4, local_8, int(Event.OptionIndex)))
        {
        }
        else
        {
            ::FEcosimAIV2Utils::ClearInteractDialogueInfo(local_4, local_8);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleEcosimAIV2InteractDialogueEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EcosimAIV2InteractDialogueEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EcosimAIV2InteractDialogueEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleEcosimAIV2InteractDialogueEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleEcosimAIV2ClientDialogueSelectEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EcosimAIV2ClientDialogueSelectEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EcosimAIV2ClientDialogueSelectEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleEcosimAIV2ClientDialogueSelectEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnEcosimAIV2InteractSpeakChange() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorEcosimAIV2InteractSimpleSpeakToAndOptionOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnEcosimAIV2InteractSpeakChange(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorEcosimAIV2InteractSimpleSpeakToAndOptionOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_OnEcosimAIV2InteractSpeakChange(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnEcosimAIV2InteractSimpleSpeakToAndOptionChange() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorEcosimAIV2InteractSimpleSpeakToAndOptionOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnEcosimAIV2InteractSimpleSpeakToAndOptionChange(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorEcosimAIV2InteractSimpleSpeakToAndOptionOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_OnEcosimAIV2InteractSimpleSpeakToAndOptionChange(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnEcosimAIV2DialogueMemoryChange() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorEcosimAIV2DialogueMemoryOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnEcosimAIV2DialogueMemoryChange(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorEcosimAIV2DialogueMemoryOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_OnEcosimAIV2DialogueMemoryChange(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnPlayerControllerChange() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorPlayerControllerOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnPlayerControllerChange(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleEcosimAIV2UpdateDialogueSyncDataForAllPlayerEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EcosimAIV2UpdateDialogueSyncDataForAllPlayerEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EcosimAIV2UpdateDialogueSyncDataForAllPlayerEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleEcosimAIV2UpdateDialogueSyncDataForAllPlayerEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleEcosimAIV2DialogueSelectEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EcosimAIV2DialogueSelectEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EcosimAIV2DialogueSelectEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleEcosimAIV2DialogueSelectEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}


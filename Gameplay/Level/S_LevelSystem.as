

class US_LevelSystemAS : UECSScriptSystem
{
    US_LevelSystemAS()
    {
        return;
    }
    UFUNCTION()
    void Job_UpdateLevelDebugHintText(const FCE_DebugShowHintText &inout Event) const
    {
        if (!((Event.SpecifiedShowEntity == ENTITY_NULL)) && !((::FASCommonUtils::GetLocalPlayerPawnEntity() == ::FASCommonUtils::GetUniqueAvatarPawnEntity(Event.SpecifiedShowEntity))))
        {
            return;
        }
        AAS_ECSPlayerController local_14 = ::FASCommonUtils::GetASECSProxyPlayerController();
        if (local_14 != nullptr)
        {
            local_14.ShowHintText.Execute(Event.ShowContent, Event.ShowLastTime, Event.SpecifiedShowEntity);
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateShowLevelHint(const FCE_ShowLevelHintPanel &inout Event) const
    {
        if ((::FASCommonUtils::GetUniquePlayerEntity(Event.Sender) == ::FASCommonUtils::GetLocalUniquePlayerEntity()))
        {
            AAS_ECSPlayerController local_12 = ::FASCommonUtils::GetASECSProxyPlayerController();
            if (local_12 != nullptr)
            {
                local_12.ShowLevelHintPanel.Execute(Event.HintName);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateChangeTargetMaterial(const FCE_ChangeTargetMaterial &inout Event) const
    {
        const AActor local_4;
        USkeletalMeshComponent local_12;
        FName local_22;
        local_4 = Event.Target.GetActor();
        if (local_4 != nullptr)
        {
            local_12 = (Cast<USkeletalMeshComponent>(local_4.GetDefaultAttachComponent()));
            if (local_12 != nullptr)
            {
                Event.Target.ModifyActorComponent(local_12.GetFName()).CastToMeshComponent();
                if ((!((Event.TargetMaterial == nullptr))))
                {
                    local_22.SetMaterial(int(Event.MaterialIndex), Event.TargetMaterial);
                }
                else
                {
                    local_22.SetMaterial(int(Event.MaterialIndex), Event.TargetMaterialInstance);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_UpdatCustomEventRequest(const FCE_CustomLevelEventRequest &inout Event) const
    {
        int local_8 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        local_8.CustomName = Event.CustomName;
        local_8.SetbPredictable(false);
        return;
    }
    UFUNCTION()
    void Monitor_UpdatePlayerLevelAreaEventInfo(const FECSEntity &inout PlayerEntity, const FC_PlayerLevelAreaEventInfo &inout PlayerLevelAreaEventInfo) const
    {
        AAS_ECSPlayerController local_2 = ::FASCommonUtils::GetASECSProxyPlayerController();
        if (local_2 != nullptr && (PlayerEntity == local_2.GetPlayerEntity()))
        {
            bool local_12;
            local_12 = true;
            Get local_16;
            const FC_PlayerEverEnterEventAreas& local_18 = local_16.opCall();
            if (local_18)
            {
                local_12 = !(local_18.EverEnterEventAreas.Contains(PlayerLevelAreaEventInfo.GetLevelScriptEntity()));
            }
            if (local_12)
            {
                Make local_28;
                TArray<FTextArgument> local_22;
                local_22.Add(local_28.opImplConv());
                Make local_42;
                local_22.Add(local_42.opImplConv());
                local_22.Add(local_28.opImplConv());
                if (PlayerLevelAreaEventInfo.GetPlayerFirstEnterMessageHint())
                {
                    ::MessageHintUtils::ShowMessageHint(PlayerEntity, PlayerLevelAreaEventInfo.GetPlayerFirstEnterMessageHint(), local_22);
                }
                if (PlayerLevelAreaEventInfo.GetAreaFirstEnterMessageHint())
                {
                    ::MessageHintUtils::ShowMessageHint(PlayerEntity, PlayerLevelAreaEventInfo.GetAreaFirstEnterMessageHint(), local_22);
                }
                ModifyOrAdd local_46;
                local_46.opCall().EverEnterEventAreas.Add(PlayerLevelAreaEventInfo.GetLevelScriptEntity());
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_CustomLevelEventCallback(const FCE_CustomLevelEvent &inout CustomLevelEvent) const
    {
        bool local_27;
        AActor local_30;
        AKLLevelScriptTutorialActor local_32;
        TArray<AActor> local_6 = FKLLevelUtils::GetAllLevelScriptActors(ECS::GetUEWorld());
        for (auto local_26 : local_6)
        {
            local_27 = true;
            local_30 = Cast<AKLLevelScriptTutorialActor>(local_26);
            local_32 = Cast<AKLLevelScriptTutorialActor>(local_30);
            if ((CustomLevelEvent.bIsTutorialEvent && !((local_32 != nullptr))))
            {
                local_27 = false;
            }
            if (local_27)
            {
                FKLLevelUtils::CustomLevelEventCallback(ECS::GetUEWorld(), CustomLevelEvent.Sender, CustomLevelEvent.CustomName, local_26);
            }
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateLevelDebugHintText() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DebugShowHintText> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DebugShowHintText& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_UpdateLevelDebugHintText(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateShowLevelHint() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ShowLevelHintPanel> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ShowLevelHintPanel& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_UpdateShowLevelHint(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateChangeTargetMaterial() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ChangeTargetMaterial> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ChangeTargetMaterial& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_UpdateChangeTargetMaterial(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_UpdatCustomEventRequest() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_CustomLevelEventRequest> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_CustomLevelEventRequest& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_UpdatCustomEventRequest(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_UpdatePlayerLevelAreaEventInfo() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorPlayerLevelAreaEventInfoOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_UpdatePlayerLevelAreaEventInfo(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorPlayerLevelAreaEventInfoOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_UpdatePlayerLevelAreaEventInfo(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_CustomLevelEventCallback() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_CustomLevelEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_CustomLevelEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_CustomLevelEventCallback(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}


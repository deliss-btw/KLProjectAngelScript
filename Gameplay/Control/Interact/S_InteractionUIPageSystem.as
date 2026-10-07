

class US_InteractionUIPageSystem : US_EUIGroupScriptSystemBase
{
    US_InteractionUIPageSystem()
    {
        return;
    }
    UFUNCTION()
    void ClientJob_HandleInteractActionOpenPageEvent(const FCE_InteractActionOpenPageEvent &inout Event, const FCS_LocalPlayer &inout LocalPlayer) const
    {
        ::FInteractUIPageUtils::OpenPageByInteractTarget(Event.InteractTargetInfo.GetTargetEntity(), Event.InteractTargetInfo.GetInteractTargetPointAndBehaviorIndex(), Event.WidgetTag, Event.PageWidget);
        return;
    }
    UFUNCTION()
    void ClientJob_HandleInteractActionClosePageEvent(const FCE_InteractActionClosePageEvent &inout Event, const FCS_LocalPlayer &inout LocalPlayer) const
    {
        ::FInteractUIPageUtils::ClosePageByInteractTarget(Event.InteractTarget);
        return;
    }
    UFUNCTION()
    void ClientJob_TickDetectInteractPageClosed(const FCS_LocalPlayer &inout LocalPlayer) const
    {
        this.Run_Job_EndClosedUIPageInteraction();
        this.Run_Job_EndUIPageInteractionOnTargetEntityDestroyed();
        return;
    }
    UFUNCTION()
    void Job_EndClosedUIPageInteraction(const FECSEntity &inout Entity, const FC_InteractUIPageInfo &inout InteractUIPageInfo) const
    {
        int local_34 = 0;
        if (InteractUIPageInfo.OpenedPage.IsLayoutLayerWidget())
        {
            return;
        }
        Get local_10;
        FECSEntity local_6 = local_10.opCall().GetPlayerPawnEntity();
        Get local_14;
        const FC_InteractionInfoModeZ& local_16 = local_14.opCall();
        if (local_16)
        {
            if ((local_16.TargetEntity == Entity))
            {
                Remove local_24;
                local_24.opCall();
            }
        }
        FFPTime local_30 = FFPTime(-1);
        local_34.TargetEntity = Entity;
        local_34.InteractTargetPointAndBehaviorIndex = InteractUIPageInfo.InteractTargetPointAndBehaviorIndex;
        Remove local_38;
        local_38.opCall();
        return;
    }
    UFUNCTION()
    void Job_EndUIPageInteractionOnTargetEntityDestroyed(const FECSEntity &inout PawnEntity, const FC_InteractionInfoModeZ &inout InteractionInfoModeZ) const
    {
        int local_12 = 0;
        if (!(InteractionInfoModeZ.TargetEntity) || !(InteractionInfoModeZ.TargetEntity.IsActive()))
        {
            FFPTime local_8 = FFPTime(-1);
            local_12.TargetEntity = InteractionInfoModeZ.TargetEntity;
            local_12.InteractTargetPointAndBehaviorIndex = InteractionInfoModeZ.InteractTargetPointAndBehaviorIndex;
            Remove local_16;
            local_16.opCall();
        }
        return;
    }
    UFUNCTION()
    void ClientJob_OnPlayerDeath(const FCE_DeathEvent &inout Event, const FCS_LocalPlayer &inout LocalPlayer) const
    {
        if ((FECSEntity(Event.Sender) == LocalPlayer.GetPlayerPawnEntity()))
        {
            this.Run_Job_CloseAllInteractPage();
        }
        return;
    }
    UFUNCTION()
    void Job_CloseAllInteractPage(const FECSEntity &inout Entity, const FC_InteractUIPageInfo &inout InteractUIPageInfo) const
    {
        Remove local_6;
        local_6.opCall();
        FEUIWidget::RemoveWidget(InteractUIPageInfo.OpenedPage);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleInteractActionOpenPageEvent() const
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
        TECSEventConstIterator<FCE_InteractActionOpenPageEvent> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_InteractActionOpenPageEvent& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ClientJob_HandleInteractActionOpenPageEvent(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleInteractActionClosePageEvent() const
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
        TECSEventConstIterator<FCE_InteractActionClosePageEvent> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_InteractActionClosePageEvent& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ClientJob_HandleInteractActionClosePageEvent(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TickDetectInteractPageClosed() const
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
        this.ClientJob_TickDetectInteractPageClosed(local_12);
        return;
    }
    UFUNCTION()
    void Run_Job_EndClosedUIPageInteraction() const
    {
        int local_132 = 0;
        int local_134 = 0;
        FECSManualJobStatScope local_1 = FECSManualJobStatScope(FName("[AS][ManualJob]S_InteractionUIPageSystem::Job_EndClosedUIPageInteraction"));
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
            this.Job_EndClosedUIPageInteraction(local_132, local_134);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_EndUIPageInteractionOnTargetEntityDestroyed() const
    {
        int local_132 = 0;
        int local_134 = 0;
        FECSManualJobStatScope local_1 = FECSManualJobStatScope(FName("[AS][ManualJob]S_InteractionUIPageSystem::Job_EndUIPageInteractionOnTargetEntityDestroyed"));
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
            this.Job_EndUIPageInteractionOnTargetEntityDestroyed(local_132, local_134);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_OnPlayerDeath() const
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
        TECSEventConstIterator<FCE_DeathEvent> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_DeathEvent& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ClientJob_OnPlayerDeath(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CloseAllInteractPage() const
    {
        int local_132 = 0;
        int local_134 = 0;
        FECSManualJobStatScope local_1 = FECSManualJobStatScope(FName("[AS][ManualJob]S_InteractionUIPageSystem::Job_CloseAllInteractPage"));
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
            this.Job_CloseAllInteractPage(local_132, local_134);
        }
        return;
    }
}




class US_CommonLoadingSystem : UECSScriptSystem
{
    US_CommonLoadingSystem()
    {
        return;
    }
    UFUNCTION()
    void ClientJob_HandleServerShowLoading(const FCE_ShowLoadingPage &inout Event) const
    {
        ::CommonPopup::Loading(FGameplayTag::RequestGameplayTag(n"UI.Type.Commonpupop.Loading", true), int(Event.DisplayTime), Event.FadeInTime, Event.FadeOutTime);
        return;
    }
    UFUNCTION()
    void ClientJob_OnCommonPopupManagerChanged(const FCE_NotifyCommonPopupManagerChanged &inout Event, FCS_CommonLoadingManager &inout Manager, const FCS_LocalPlayer &inout LocalPlayer) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void ClientJob_TickLoading(FCS_CommonLoadingManager &inout Manager) const
    {
        float32 local_16;
        float local_4 = ECS::GetRuntimeInfo().DeltaTime.ToSeconds();
        float32 local_5 = float32(local_4);
        if (Manager.bClosing)
        {
            Manager.FadeOutRemainingTime -= local_5;
            if (Manager.FadeOutRemainingTime <= 0.0f)
            {
                FEUIWidget::RemoveWidget(Manager.LoadingPage);
                ::CommonPopupUtils::DequeuePopupInternal(int(Manager.PopupId));
                FECSWorldPtr local_10 = ECS::GetECSWorld();
                Remove local_14;
                local_14.opCall();
            }
            return;
        }
        else
        {
            Manager.DisplayingPopupRemainingTime = (Manager.DisplayingPopupRemainingTime - local_5);
            if ((Manager.DisplayingPopupRemainingTime <= 0.0f && (Manager.QueuedPopupDisplayTime <= 0.0f)))
            {
                Manager.bClosing = true;
                if (Manager.BlendOutSpeed > 0.0f)
                {
                    local_16 = 1.0f / Manager.BlendOutSpeed;
                }
                else
                {
                    local_16 = 0.5f;
                }
                Manager.FadeOutRemainingTime = local_16;
                return;
            }
        }
    }
    UFUNCTION()
    void Run_ClientJob_HandleServerShowLoading() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ShowLoadingPage> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ShowLoadingPage& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleServerShowLoading(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_OnCommonPopupManagerChanged() const
    {
        int local_16 = 0;
        int local_22 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        Has local_14;
        if (!(local_14.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_3 = this.GetECSWorld();
        FECSWorldPtr local_4_4 = this.GetECSWorld();
        TECSEventConstIterator<FCE_NotifyCommonPopupManagerChanged> local_58 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_58.CanProceed;)
        {
            const FCE_NotifyCommonPopupManagerChanged& local_80 = local_58.Proceed();
            FECSEntityScopeCycleCounter local_81 = FECSEntityScopeCycleCounter(local_80.Sender);
            ECSInternal::PushContextTime(local_80.GetHandleTime());
            this.ClientJob_OnCommonPopupManagerChanged(local_80, local_16, local_22);
            ECSInternal::PopContextTime();
        }
        FECSWorldPtr local_4_5 = this.GetECSWorld();
        MarkModifiedIfDirty local_88;
        local_88.opCall(local_16);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TickLoading() const
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
        this.ClientJob_TickLoading(local_12);
        FECSWorldPtr local_4_3 = this.GetECSWorld();
        MarkModifiedIfDirty local_20;
        local_20.opCall(local_12);
        return;
    }
}


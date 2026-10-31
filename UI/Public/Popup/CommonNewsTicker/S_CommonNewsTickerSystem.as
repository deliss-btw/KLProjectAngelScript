class US_CommonNewsTickerSystem : UECSScriptSystem
{
    US_CommonNewsTickerSystem()
    {
        return;
    }
    UFUNCTION()
    void ClientJob_OnCommonPopupManagerChanged(const FCE_NotifyCommonPopupManagerChanged &inout Event, FCS_CommonNewsTickerManager &inout Manager, const FCS_LocalPlayer &inout C_LocalPlayer) const
    {
        if (!(::CommonPopupUtils::HasMatchingPopupType(Event.AffectedPopupTypes, FGameplayTag::RequestGameplayTag(n"UI.Type.Commonpupop.NewsTicker", true))))
        {
            return;
        }
        FEUIWidgetRef local_22;
        for (auto local_18 : Event.RemovedPopupIds)
        {
            if (int(Manager.DisplayingTickerPopupId) == int(local_18))
            {
                FEUIWidget::RemoveWidget(Manager.DisplayingTicker);
                Manager.DisplayingTicker = local_22;
                continue;
            }
        }
        for (auto local_23 : Event.NewDisplayingPopupIds)
        {
            FCommonNewsTickerInfo local_30;
            if (Manager.PendingTickers.RemoveAndCopyValue(local_23, local_30))
            {
                FVM_CommonNewsTicker& local_34 = ::FVM_CommonNewsTicker::Create(this.GetOwner(), local_30.Content, int(local_30.RepeatCount));
                TSoftClassPtr<UEUIUserWidget> local_44 = ::CommonPopupSettings::Get().CommonNewsTickerWidget;
                local_22 = FEUIWidget::AddWidgetByClass(C_LocalPlayer.UEPlayerController.GetLocalPlayer(), local_44, FEUIModelRef(local_34));
                if (local_22)
                {
                    Manager.DisplayingTicker = local_22;
                    Manager.DisplayingTickerRepeatCount = int(local_30.RepeatCount);
                    Manager.DisplayingTickerPopupId = local_23;
                }
                break;
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_TickDisplayingNewsTicker(FCS_CommonNewsTickerManager &inout Manager, const FCS_LocalTime &inout C_LocalTime) const
    {
        UWidget_NewsTracker local_8;
        if (Manager.DisplayingTicker.IsValid())
        {
            bool local_2;
            local_2 = false;
            local_8 = (Cast<UWidget_NewsTracker>(Manager.DisplayingTicker.RequireWidget()));
            if (local_8 != nullptr)
            {
                local_2 = GetbTickerEnd();
            }
            if (!(local_2))
            {
                return;
            }
            FEUIWidget::RemoveWidget(Manager.DisplayingTicker);
            Manager.DisplayingTicker = FEUIWidgetRef();
            ::CommonPopupUtils::DequeuePopupInternal(int(Manager.DisplayingTickerPopupId));
        }
        if (!(Manager.DisplayingTicker.IsValid()) && Manager.PendingTickers.IsEmpty())
        {
            FECSWorldPtr local_14 = ECS::GetECSWorld();
            Remove local_18;
            local_18.opCall();
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
    void Run_ClientJob_TickDisplayingNewsTicker() const
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
        this.ClientJob_TickDisplayingNewsTicker(local_16, local_22);
        FECSWorldPtr local_4_5 = this.GetECSWorld();
        MarkModifiedIfDirty local_30;
        local_30.opCall(local_16);
        return;
    }
}


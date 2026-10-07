

class US_CommonBannerSystem : UECSScriptSystem
{
    US_CommonBannerSystem()
    {
        return;
    }
    UFUNCTION()
    void ClientJob_OnCommonPopupManagerChanged(const FCE_NotifyCommonPopupManagerChanged &inout Event, FCS_CommonBannerManager &inout Manager, const FCS_LocalPlayer &inout C_LocalPlayer) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void ClientJob_TickDisplayingCommonBanner(FCS_CommonBannerManager &inout Manager, const FCS_LocalTime &inout C_LocalTime) const
    {
        if (Manager.DisplayingBanner.IsValid())
        {
            float local_4 = C_LocalTime.DeltaTime.ToSeconds();
            Manager.DisplayingBannerLifetime -= float32(local_4);
            if (Manager.DisplayingBannerLifetime > 0.0f)
            {
                return;
            }
            FEUIWidget::RemoveWidget(Manager.DisplayingBanner);
            Manager.DisplayingBanner = FEUIWidgetRef();
            ::CommonPopupUtils::DequeuePopupInternal(int(Manager.DisplayingBannerPopupId));
        }
        if (!(Manager.DisplayingBanner.IsValid()) && Manager.PendingBanners.IsEmpty())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            Remove local_16;
            local_16.opCall();
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
    void Run_ClientJob_TickDisplayingCommonBanner() const
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
        this.ClientJob_TickDisplayingCommonBanner(local_16, local_22);
        FECSWorldPtr local_4_5 = this.GetECSWorld();
        MarkModifiedIfDirty local_30;
        local_30.opCall(local_16);
        return;
    }
}


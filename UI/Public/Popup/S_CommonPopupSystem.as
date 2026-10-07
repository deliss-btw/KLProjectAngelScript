

class US_CommonPopupSystem : US_EUIGroupScriptSystemBase
{
    UPROPERTY()
    bool bLoadingScreenVisible = false;


    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return (int(this.GetWorld().GetNetMode()) == 1);
    }
    UFUNCTION()
    void Init_Implementation()
    {
        UKLLoadingScreenSubsystem local_4 = UKLLoadingScreenSubsystem::Get();
        if (local_4 != nullptr)
        {
            local_4.GetOnLoadingScreenVisibilityChangedDelegate().AddUFunction(this, n"OnLoadingScreenVisibilityChanged");
        }
        this.bLoadingScreenVisible = KLLoadingScreen::IsLoadingScreenVisible(__GetWorldContext());
        return;
    }
    UFUNCTION()
    void ClientJob_UpdateDisplayingPopup(FCS_CommonPopupManager &inout Manager, const FCS_CommonPopupManagerRecord &inout Record, const FCS_LocalPlayer &inout LocalPlayer) const
    {
        int local_12 = 0;
        const FCommonPopupInfo& local_52;
        TArrayConstIterator<FCommonPopupInfo> local_98;
        if (this.bLoadingScreenVisible)
        {
            return;
        }
        FFPTime local_8 = FFPTime(-1);
        TSet<int> local_32;
        for (auto local_49 : Record.DisplayingChangedQueues)
        {
            if (Manager.QueuedPopups.Contains(local_49))
            {
                if (local_52.IsValid() && !(local_32.Contains(local_52.PopupId)))
                {
                    local_32.Add(local_52.PopupId);
                    local_12.NewDisplayingPopupIds.Add(local_52.PopupId);
                    local_12.AffectedPopupTypes.Add(local_52.PopupType);
                }
            }
        }
        TSet<int> local_74;
        for (auto& local_92 : Record.RemovedPopups)
        {
            local_92;
            for (; local_98.CanProceed;)
            {
                local_52 = local_98.Proceed();
                if (!(local_74.Contains(local_52.PopupId)))
                {
                    local_74.Add(local_52.PopupId);
                    local_12.RemovedPopupIds.Add(local_52.PopupId);
                    local_12.AffectedPopupTypes.Add(local_52.PopupType);
                }
            }
        }
        FECSWorldPtr local_106 = ECS::GetECSWorld();
        Remove local_110;
        local_110.opCall();
        return;
    }
    UFUNCTION()
    void ClientJob_ReleaseCollectedPopups(FCS_CommonPopupManager &inout Manager) const
    {
        FFPTime local_6;
        if (Manager.CollectStartTime.IsEmpty())
        {
            return;
        }
        int local_2 = 1045220557;
        FFPTime local_8 = ECS::GetContextTime();
        TArray<ECommonPopupQueueType> local_12;
        for (auto& local_30 : Manager.CollectStartTime)
        {
            (local_8 - local_6);
            if (local_6.ToSeconds() >= 0.20000000298023224)
            {
                local_12.Add(local_30.GetKey());
            }
        }
        if (local_12.IsEmpty())
        {
            return;
        }
        auto local_42 = local_12.Iterator();
        for (; local_42.CanProceed;)
        {
            if (Manager.QueuedPopups.Contains(int(local_42.Proceed())))
            {
            }
        }
        auto local_48 = local_12.Iterator();
        for (; local_48.CanProceed;)
        {
            int& local_50 = int(local_48.Proceed());
            ::CommonPopupDisplayingUtils_Internal::TryPromoteQueue(Manager, local_50);
        }
        return;
    }
    UFUNCTION()
    void ClientJob_CheckStuckPopups(FCS_CommonPopupManager &inout Manager) const
    {
        ::CommonPopupUtils::CheckStuckDisplayingPopups(Manager, 60.0f);
        return;
    }
    UFUNCTION()
    void OnLoadingScreenVisibilityChanged(const bool bVisible, const ELoadingScreenAction Action)
    {
        this.bLoadingScreenVisible = bVisible;
        return;
    }
    UFUNCTION()
    void Run_ClientJob_UpdateDisplayingPopup() const
    {
        int local_20 = 0;
        int local_26 = 0;
        int local_32 = 0;
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
        Has local_18;
        if (!(local_18.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_4 = this.GetECSWorld();
        FECSWorldPtr local_4_5 = this.GetECSWorld();
        FECSWorldPtr local_4_6 = this.GetECSWorld();
        this.ClientJob_UpdateDisplayingPopup(local_20, local_26, local_32);
        FECSWorldPtr local_4_7 = this.GetECSWorld();
        MarkModifiedIfDirty local_40;
        local_40.opCall(local_20);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ReleaseCollectedPopups() const
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
        this.ClientJob_ReleaseCollectedPopups(local_12);
        FECSWorldPtr local_4_3 = this.GetECSWorld();
        MarkModifiedIfDirty local_20;
        local_20.opCall(local_12);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_CheckStuckPopups() const
    {
        int local_16 = 0;
        ECS::GetContextJob();
        if (!(this.GetECSRuntime().IsOnInterval(FFPTime(5.0))))
        {
            return;
        }
        FECSWorldPtr local_10 = this.GetECSWorld();
        Has local_14;
        if (!(local_14.opCall()))
        {
            return;
        }
        FECSWorldPtr local_10_2 = this.GetECSWorld();
        this.ClientJob_CheckStuckPopups(local_16);
        FECSWorldPtr local_10_3 = this.GetECSWorld();
        MarkModifiedIfDirty local_24;
        local_24.opCall(local_16);
        return;
    }
}


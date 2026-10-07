

class US_LoadingScreenUIStateSystem : US_EUIGroupScriptSystemBase
{
    US_LoadingScreenUIStateSystem()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return (int(this.GetWorld().GetNetMode()) == 1);
    }
    UFUNCTION()
    void Init_Implementation()
    {
        if ((int(this.GetWorld().GetNetMode())) == 1)
        {
            return;
        }
        UKLLoadingScreenSubsystem local_10 = UKLLoadingScreenSubsystem::Get();
        if (local_10 != nullptr)
        {
            local_10.GetOnLoadingScreenVisibilityChangedDelegate().AddUFunction(this, n"OnLoadingScreenVisibilityChanged");
        }
        this.SyncLoadingState(KLLoadingScreen::IsLoadingScreenVisible(__GetWorldContext()), false);
        return;
    }
    UFUNCTION()
    void OnLoadingScreenVisibilityChanged(const bool bVisible, const ELoadingScreenAction Action)
    {
        this.SyncLoadingState(bVisible, true);
        if ((bVisible && (int(Action) == 1)))
        {
            this.CloseWindowMenus();
        }
        return;
    }
    void CloseWindowMenus()
    {
        ULocalPlayer local_2 = this.GetSyncLocalPlayer();
        if (local_2 == nullptr)
        {
            return;
        }
        FEUIWidget::RemoveLayoutWidgets(local_2, EEUILayoutLayer(4));
        return;
    }
    void SyncLoadingState(const bool bVisible, const bool bNotifyLoadingFinished)
    {
        ULocalPlayer local_2 = this.GetSyncLocalPlayer();
        if (local_2 == nullptr)
        {
            return;
        }
        if (!(bVisible) && bNotifyLoadingFinished)
        {
            ::FMS_CombatHUDVisibility::Get(local_2).OnLoadingFinished();
        }
        ::FMS_ClientCondition::Get(local_2).SetLoadingState(bVisible);
        return;
    }
    ULocalPlayer GetSyncLocalPlayer()
    {
        ULocalPlayer local_8;
        AECSPlayerController local_20;
        if ((int(this.GetWorld().GetNetMode())) == 1)
        {
            return nullptr;
        }
        FECSWorldPtr local_12 = ECS::GetECSWorld();
        if (!(local_12.IsValid()))
        {
            return local_8;
        }
        Get local_18;
        const FCS_LocalPlayer& local_14 = local_18.opCall();
        if (local_14)
        {
            local_20 = local_14.UEPlayerController;
            if (local_20 != nullptr)
            {
                return local_14.UEPlayerController.GetLocalPlayer();
            }
        }
        return local_8;
    }
}


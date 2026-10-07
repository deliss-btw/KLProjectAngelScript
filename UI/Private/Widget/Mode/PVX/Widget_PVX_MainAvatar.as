
namespace UWidget_PVX_MainAvatar
{
    const int ViewID = 0;

}
class UWidget_PVX_MainAvatar : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Page> Page;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PVX_MainAvatar> PVX_MainAvatar;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarShowcase> Showcase;
    UPROPERTY()
    UEUICommonListViewBase IllustrateTypeList;
    UPROPERTY()
    UEUICommonListViewBase w_list_human;
    UPROPERTY()
    FEUIActionBinding AvatarListPrevActionBinding;
    UPROPERTY()
    FEUIActionBinding AvatarListNextActionBinding;
    UPROPERTY()
    FEUIInputActionDataRow ConfirmSelectIARow;
    UPROPERTY()
    FEUIInputActionDataRow ReplaceSelectIARow;
    UPROPERTY()
    FEUIActionBinding SelectActionBinding;
    UPROPERTY()
    FEUIActionBinding ClosePanelActionBinding;
    UPROPERTY()
    FEUIActionBinding ClosePanelActionBinding2;
    UPROPERTY()
    FConfigVM_AvatarShowcase ShowcaseConfig;
    FEUIModelWeakRef __PVX_MainAvatar;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;
    UPROPERTY()
    FGetEUIModelRef PVX_MainAvatarDelegate;
    UPROPERTY()
    FGetEUIModelRef ShowcaseDelegate;

    UWidget_PVX_MainAvatar()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        if (this.PVX_MainAvatar.IsValid() && IsPVPMode())
        {
            this.ClosePanelActionBinding.Register(this, n"OnClosePanelPressed");
            this.ClosePanelActionBinding2.Register(this, n"OnClosePanelPressed");
        }
        if (this.IllustrateTypeList != nullptr)
        {
            this.IllustrateTypeList.SetSelectedIndex(0);
        }
        TEUIModelRef<FVM_AvatarShowcase> local_8;
        local_8;
        local_8.SetCurrentShowcase();
        return;
    }
    UFUNCTION()
    void OnClosePanelPressed()
    {
        this.ClosePage(false);
        return;
    }
    UFUNCTION()
    void HandleConfirmButtonEnabledChange(const bool bEnabled)
    {
        if (this.PVX_MainAvatar.IsValid() && IsPVPMode())
        {
            return;
        }
        bool local_2 = !(bEnabled);
        this.SelectActionBinding.SetCollapsed(local_2);
        return;
    }
    UFUNCTION()
    void HandleAvatarReadyChage(const bool bReady)
    {
        if (this.PVX_MainAvatar.IsValid() && IsPVPMode())
        {
            return;
        }
        if (bReady)
        {
        }
        else
        {
        }
        this.SelectActionBinding.SetInputAction();
        return;
    }
    UFUNCTION()
    void OnAvatarTypeListGoPrev()
    {
        if (this.IllustrateTypeList != nullptr)
        {
            this.IllustrateTypeList.SelectPreviousItem(true, false);
        }
        return;
    }
    UFUNCTION()
    void OnAvatarTypeListGoNext()
    {
        if (this.IllustrateTypeList != nullptr)
        {
            this.IllustrateTypeList.SelectNextItem(true, false);
        }
        return;
    }
    UFUNCTION()
    void HandleCampusChange(const bool bMonsterCampus)
    {
        if (!(this.PVX_MainAvatar.IsValid()) || !(IsPVXMode()))
        {
            return;
        }
        if (bMonsterCampus)
        {
            this.AvatarListPrevActionBinding.SetDisabled(true);
            this.AvatarListNextActionBinding.SetDisabled(true);
        }
        return;
    }
    UFUNCTION()
    void HandleFinishPrepareGameChange(const bool bPrepareFinish)
    {
        if (!(this.PVX_MainAvatar.IsValid()) || !(IsPVXMode()))
        {
            return;
        }
        if (bPrepareFinish)
        {
            FEUIWidget::RemoveLayoutWidgets(this.GetOwningLocalPlayer(), EEUILayoutLayer(4));
        }
        return;
    }
    UFUNCTION()
    void Page_ClosePage() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Page_CloseGroup() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void PVX_MainAvatar_OnSelectIllustrateFilter(const int IllustrateFilterItemIndex) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(IllustrateFilterItemIndex);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void PVX_MainAvatar_OnSelectAvatar(const int AvatarIndex) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(AvatarIndex);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void PVX_MainAvatar_OnAvatarSelectConfirm() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void PVX_MainAvatar_OnPlayerReadyChanged(const FECSEntity &inout PlayerEntity, const bool bSelf, const bool bIsReady) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(PlayerEntity);
        FEUIWidgetModelCallbackBuilder::PushArg local_46;
        local_46.opCall(bSelf);
        local_46.opCall(bIsReady);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void PVX_MainAvatar_OnPlayerAvatarChanged(const FECSEntity &inout PlayerEntity, const uint PlayerAvatarID) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(PlayerEntity);
        FEUIWidgetModelCallbackBuilder::PushArg local_46;
        local_46.opCall(PlayerAvatarID);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_PVX_MainAvatar& local_6;
        TEUIModelRef<FVM_PVX_MainAvatar> local_2 = this.PVX_MainAvatar.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.PVX_MainAvatar.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_PVX_MainAvatar::__IndexOf_bConfirmButtonEnabled());
                }
                if (local_6)
                {
                    this.HandleConfirmButtonEnabledChange(local_6.GetbConfirmButtonEnabled());
                }
                break;
            }
            case 1:
            {
                this.PVX_MainAvatar.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_PVX_MainAvatar::__IndexOf_bReady());
                }
                if (local_6)
                {
                    this.HandleAvatarReadyChage(local_6.GetbReady());
                }
                break;
            }
            case 2:
            {
                this.PVX_MainAvatar.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_PVX_MainAvatar::__IndexOf_bMonsterCampus());
                }
                if (local_6)
                {
                    this.HandleCampusChange(local_6.GetbMonsterCampus());
                }
                break;
            }
            case 3:
            {
                this.PVX_MainAvatar.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_PVX_MainAvatar::__IndexOf_bPrepareFinish());
                }
                if (local_6)
                {
                    this.HandleFinishPrepareGameChange(local_6.GetbPrepareFinish());
                }
            }
            }
            It.MarkCurrentClean();
            It.opPreInc();
        }
        if (It.ReachMax())
        {
            XError(ELog(17), "Observed model changes consume max.");
            if (It.IsDirty(0))
            {
                XError(ELog(17), "Remaining observed model change: HandleConfirmButtonEnabledChange");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: HandleAvatarReadyChage");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: HandleCampusChange");
            }
            if (It.IsDirty(3))
            {
                XError(ELog(17), "Remaining observed model change: HandleFinishPrepareGameChange");
            }
            return;
        }
        this.__PVX_MainAvatar = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Page.Initialize(this, FName("VM_Page"), EEUIWidgetRefModelCreationType(0), false);
        this.PVX_MainAvatar.Initialize(this, FName("VM_PVX_MainAvatar"), EEUIWidgetRefModelCreationType(0), false);
        this.Showcase.Initialize(this, FName("VM_AvatarShowcase"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PageDelegate.IsBound())
        {
            this.Page.SetRef(this.PageDelegate.Execute());
        }
        if (this.PVX_MainAvatarDelegate.IsBound())
        {
            this.PVX_MainAvatar.SetRef(this.PVX_MainAvatarDelegate.Execute());
        }
        if (this.ShowcaseDelegate.IsBound())
        {
            this.Showcase.SetRef(this.ShowcaseDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_PVX_MainAvatar
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleConfirmButtonEnabledChange"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleAvatarReadyChage"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleCampusChange"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleFinishPrepareGameChange"));
    return;
}
FEUIWidgetRef CreateWidget(const APlayerController OwningPlayer, const TSoftClassPtr<UEUIUserWidget> &inout WidgetClass)
{
    return FEUIWidget::CreateWidget(OwningPlayer.GetLocalPlayer(), WidgetClass);
}
FEUIWidgetRef AddWidget(const APlayerController OwningPlayer, const FGameplayTag &inout WidgetTag)
{
    return FEUIWidget::AddWidget(OwningPlayer.GetLocalPlayer(), WidgetTag);
}
}

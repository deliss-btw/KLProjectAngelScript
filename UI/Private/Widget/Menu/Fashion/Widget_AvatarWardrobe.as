namespace UWidget_AvatarMainWardrobe
{
    const int ViewID = 0;
}
namespace UWidget_AvatarWardrobeEntrance
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_AvatarMainWardrobe : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarMainWardrobe> Wardrobe;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarShowcase> Showcase;
    UPROPERTY()
    UEUICommonListViewBase EUI_List;
    UPROPERTY()
    UEUICommonListViewBase w_list_high;
    UPROPERTY()
    UEUICommonListViewBase w_tile_Item;
    UPROPERTY()
    UEUIDynamicEntryBox w_entry_cloth;
    UPROPERTY()
    FEUIActionBinding ReturnActionBinding;
    UPROPERTY()
    FEUIActionBinding SaveOutfitActionBinding;
    UPROPERTY()
    FEUIActionBinding MainTabPrevActionBinding;
    UPROPERTY()
    FEUIActionBinding MainTabNextActionBinding;
    int SyncedMainTabIndex = INDEX_NONE;
    UPROPERTY()
    FConfigVM_AvatarShowcase ShowcaseConfig;
    FEUIModelWeakRef __Wardrobe;
    UPROPERTY()
    FGetEUIModelRef WardrobeDelegate;
    UPROPERTY()
    FGetEUIModelRef ShowcaseDelegate;

    UFUNCTION()
    void OnViewBind_Implementation()
    {
        if (this.Wardrobe.IsValid())
        {
            TEUIModelRef<FVM_AvatarShowcase> local_4;
            local_4;
            this.Wardrobe.Get().SetCurrentShowcase(local_4);
        }
        this.RefreshActionBinding();
        this.SyncedMainTabIndex = INDEX_NONE;
        this.SyncMainTabSelection();
        this.FocusInitialWardrobeEntry();
        return;
    }
    UFUNCTION()
    void HandleWardrobeActionStateChanged()
    {
        this.RefreshActionBinding();
        int local_1 = 1;
        if (this.Wardrobe.IsValid() && (this.Wardrobe.Get().GetPendingNavigationType() == 1) && (int(this.Wardrobe.Get().GetPendingMainTab()) != int(this.Wardrobe.Get().GetCurrentMainTab())))
        {
            this.SyncedMainTabIndex = INDEX_NONE;
        }
        this.SyncMainTabSelection();
        return;
    }
    UFUNCTION()
    void HandleWardrobeMainTabStateChanged()
    {
        this.RefreshActionBinding();
        this.SyncedMainTabIndex = INDEX_NONE;
        this.SyncMainTabSelection();
        return;
    }
    UFUNCTION()
    void OnWardrobeReturnAction()
    {
        if (!(this.Wardrobe.IsValid()) || this.Wardrobe.Get().HandleReturnAction())
        {
            this.ClosePage(false);
            return;
        }
        this.RefreshActionBinding();
        return;
    }
    UFUNCTION()
    void OnWardrobeSaveOutfitAction()
    {
        if (this.Wardrobe.IsValid())
        {
            this.Wardrobe.Get().OnSaveOutfitAction();
        }
        this.RefreshActionBinding();
        return;
    }
    UFUNCTION()
    void OnWardrobeMainTabPrevAction()
    {
        this.SelectMainTabByOffset(-1);
        return;
    }
    UFUNCTION()
    void OnWardrobeMainTabNextAction()
    {
        this.SelectMainTabByOffset(1);
        return;
    }
    void RefreshActionBinding()
    {
        this.ReturnActionBinding.SetCollapsed(false);
        if (!(this.Wardrobe.IsValid()))
        {
            this.SaveOutfitActionBinding.SetCollapsed(true);
            this.MainTabPrevActionBinding.SetCollapsed(true);
            this.MainTabNextActionBinding.SetCollapsed(true);
            return;
        }
        this.SaveOutfitActionBinding.SetCollapsed(!(this.Wardrobe.Get().CanShowSaveOutfitAction()));
        bool local_1 = (this.Wardrobe.Get().GetMainTabItems().Num() > 1);
        this.MainTabPrevActionBinding.SetCollapsed(!(local_1));
        this.MainTabNextActionBinding.SetCollapsed(!(local_1));
        return;
    }
    void SelectMainTabByOffset(const int Offset)
    {
        if (this.Wardrobe.IsValid())
        {
            this.Wardrobe.Get().RequestMainTabByOffset(Offset);
        }
        return;
    }
    void SyncMainTabSelection()
    {
        if (!(this.Wardrobe.IsValid()) || ((this.EUI_List == nullptr)))
        {
            this.SyncedMainTabIndex = INDEX_NONE;
            return;
        }
        int local_6 = this.Wardrobe.Get().GetCurrentMainTabListIndex();
        if (local_6 == this.SyncedMainTabIndex)
        {
            return;
        }
        if (this.Wardrobe.Get().GetMainTabItems().IsValidIndex(local_6))
        {
            this.SyncedMainTabIndex = local_6;
            this.EUI_List.SetSelectedIndex(local_6);
            return;
        }
        this.SyncedMainTabIndex = INDEX_NONE;
        return;
    }
    void FocusInitialWardrobeEntry()
    {
        if (this.w_entry_cloth != nullptr)
        {
        }
        return;
    }
    UFUNCTION()
    void Wardrobe_HandleSlotTabSelected(const int Index) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Index);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Wardrobe_HandleMainTabSelected(const int Index) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Index);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Wardrobe_HandleHighFashionOptionSelected(const int Index) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Index);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Wardrobe_HandleTileFashionOptionSelected(const int Index) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Index);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Wardrobe_OnSaveOutfitAction() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Wardrobe_OnEquipAction() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Wardrobe_OnUnEquipAction() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        TEUIModelRef<FVM_AvatarMainWardrobe> local_2 = this.Wardrobe.AsRef();
        FVM_AvatarMainWardrobe& local_6 = local_2.Get();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            int local_57 = It.GetIndex();
            if (local_57 <= 1)
            {
                if (local_57 != 0)
                {
                    if (local_57 != 1)
                    {
                    }
                }
                else
                {
                    this.Wardrobe.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_AvatarMainWardrobe::__IndexOf_ContentSwitcherIndex());
                        local_6.TrackPropertyRead(::FVM_AvatarMainWardrobe::__IndexOf_ActionStateRevision());
                    }
                    if (local_6)
                    {
                        this.HandleWardrobeActionStateChanged();
                    }
                    this.Wardrobe.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_AvatarMainWardrobe::__IndexOf_MainTabItems());
                        local_6.TrackPropertyRead(::FVM_AvatarMainWardrobe::__IndexOf_SelectedMainTabItem());
                    }
                    if (local_6)
                    {
                        this.HandleWardrobeMainTabStateChanged();
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
                XError(ELog(17), "Remaining observed model change: HandleWardrobeActionStateChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: HandleWardrobeMainTabStateChanged");
            }
            return;
        }
        this.__Wardrobe = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Wardrobe.Initialize(this, FName("VM_AvatarMainWardrobe"), EEUIWidgetRefModelCreationType(0), false);
        this.Showcase.Initialize(this, FName("VM_AvatarShowcase"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.WardrobeDelegate.IsBound())
        {
            this.Wardrobe.SetRef(this.WardrobeDelegate.Execute());
        }
        if (this.ShowcaseDelegate.IsBound())
        {
            this.Showcase.SetRef(this.ShowcaseDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_AvatarWardrobeEntrance : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarWardrobeEntrance> WardrobeEntrance;
    UPROPERTY()
    FGetEUIModelRef WardrobeEntranceDelegate;

    UWidget_AvatarWardrobeEntrance()
    {
        return;
    }
    UFUNCTION()
    void WardrobeEntrance_HandleWardrobeClicked() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.WardrobeEntrance.Initialize(this, FName("VM_AvatarWardrobeEntrance"), EEUIWidgetRefModelCreationType(1), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.WardrobeEntranceDelegate.IsBound())
        {
            this.WardrobeEntrance.SetRef(this.WardrobeEntranceDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AvatarMainWardrobe
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.WidgetType = UWidget_AvatarMainWardrobe;
    Result.ObservedModelChangesSubscriberCount = 2;
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleWardrobeActionStateChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleWardrobeMainTabStateChanged"));
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
namespace UWidget_AvatarWardrobeEntrance
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.WidgetType = UWidget_AvatarWardrobeEntrance;
    Result.ObservedModelChangesSubscriberCount = 0;
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

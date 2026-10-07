
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
    int SyncedMainTabIndex;
    UPROPERTY()
    FConfigVM_AvatarShowcase ShowcaseConfig;
    FEUIModelWeakRef __Wardrobe;
    UPROPERTY()
    FGetEUIModelRef WardrobeDelegate;
    UPROPERTY()
    FGetEUIModelRef ShowcaseDelegate;

    UWidget_AvatarMainWardrobe()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    UFUNCTION()
    void HandleWardrobeActionStateChanged()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    UFUNCTION()
    void HandleWardrobeMainTabStateChanged()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    UFUNCTION()
    void OnWardrobeReturnAction()
    {
        if (!(this.Wardrobe.IsValid()) || HandleReturnAction())
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
            OnSaveOutfitAction();
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
        this.SaveOutfitActionBinding.SetCollapsed(!(CanShowSaveOutfitAction()));
        bool local_1 = (GetMainTabItems().Num() > 1);
        this.MainTabPrevActionBinding.SetCollapsed(!(local_1));
        this.MainTabNextActionBinding.SetCollapsed(!(local_1));
        return;
    }
    void SelectMainTabByOffset(const int Offset)
    {
        if (this.Wardrobe.IsValid())
        {
            RequestMainTabByOffset();
        }
        return;
    }
    void SyncMainTabSelection()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
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
        FVM_AvatarMainWardrobe& local_6;
        TEUIModelRef<FVM_AvatarMainWardrobe> local_2 = this.Wardrobe.AsRef();
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

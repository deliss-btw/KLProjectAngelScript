
namespace UWidget_AvatarSelection
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_AvatarSelection : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarSelection> AvatarSelection;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarSelectionShowcase> AvatarSelectionShowcase;
    UPROPERTY()
    UEUICommonListViewBase AvatarList;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarShowcase> Showcase;
    UPROPERTY()
    FConfigVM_AvatarSelection AvatarSelectionConfig;
    UPROPERTY()
    FConfigVM_AvatarShowcase ShowcaseConfig;
    FEUIModelWeakRef __AvatarSelection;
    UPROPERTY()
    FGetEUIModelRef AvatarSelectionDelegate;
    UPROPERTY()
    FGetEUIModelRef AvatarSelectionShowcaseDelegate;
    UPROPERTY()
    FGetEUIModelRef ShowcaseDelegate;

    UWidget_AvatarSelection()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        TEUIModelRef<FVM_AvatarShowcase> local_2;
        local_2;
        local_2.Setup();
        if (this.AvatarSelection.IsValid() && ((this.AvatarList != nullptr)))
        {
            this.AvatarList.SetSelectedIndex(GetSelectedAvatarIndex());
        }
        return;
    }
    UFUNCTION()
    void OnSelectedAvatarChangedForShowcase()
    {
        if (this.AvatarSelectionShowcase.IsValid())
        {
            RefreshShowcaseAvatars();
        }
        return;
    }
    UFUNCTION()
    void GoToSelectedAvatar()
    {
        FVM_MainMenuAvatar& local_2 = ::FVM_MainMenuAvatar::Create(this);
        TEUIModelRef<FVM_AvatarInfo> local_4;
        local_4.GetSelectedAvatar();
        local_2.SetCurrentSelectedAvatar(local_4);
        FEUIWidget::AddWidget(this.GetOwningLocalPlayer(), GameplayTags::UI_Type_Avatar_Main, FEUIModelRef(local_2));
        return;
    }
    UFUNCTION()
    TArray<FEUIModelContainer> AvatarSelection_FilteredAvatars() const
    {
        FVM_AvatarSelection& local_2;
        TArray<FEUIModelContainer> local_12;
        if (local_2)
        {
            local_12 = local_2.GetFilteredAvatars();
        }
        else
        {
            local_12 = TArray<FEUIModelContainer>();
        }
        return local_12;
    }
    UFUNCTION()
    TArray<FEUIModelContainer> AvatarSelection_IllustrateTypes() const
    {
        FVM_AvatarSelection& local_2;
        TArray<FEUIModelContainer> local_12;
        if (local_2)
        {
            local_12 = local_2.GetIllustrateTypes();
        }
        else
        {
            local_12 = TArray<FEUIModelContainer>();
        }
        return local_12;
    }
    UFUNCTION()
    void AvatarSelection_OnSelectIllustrateFilter(const int IllustrateFilterItemIndex) const
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
    void AvatarSelection_OnSelectAvatar(const int AvatarIndex) const
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
    void AvatarSelection_ApplySelection() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void AvatarSelection_GotoAvatarBuildPage() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_AvatarSelection& local_6;
        TEUIModelRef<FVM_AvatarSelection> local_2 = this.AvatarSelection.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            int local_57 = It.GetIndex();
            if (local_57 <= 0)
            {
                if (local_57 != 0)
                {
                }
                else
                {
                    this.AvatarSelection.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_AvatarSelection::__IndexOf_SelectedAvatar());
                    }
                    if (local_6)
                    {
                        this.OnSelectedAvatarChangedForShowcase();
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
                XError(ELog(17), "Remaining observed model change: OnSelectedAvatarChangedForShowcase");
            }
            return;
        }
        this.__AvatarSelection = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.AvatarSelection.Initialize(this, FName("VM_AvatarSelection"), EEUIWidgetRefModelCreationType(0), false);
        this.AvatarSelectionShowcase.Initialize(this, FName("VM_AvatarSelectionShowcase"), EEUIWidgetRefModelCreationType(0), false);
        this.Showcase.Initialize(this, FName("VM_AvatarShowcase"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.AvatarSelectionDelegate.IsBound())
        {
            this.AvatarSelection.SetRef(this.AvatarSelectionDelegate.Execute());
        }
        if (this.AvatarSelectionShowcaseDelegate.IsBound())
        {
            this.AvatarSelectionShowcase.SetRef(this.AvatarSelectionShowcaseDelegate.Execute());
        }
        if (this.ShowcaseDelegate.IsBound())
        {
            this.Showcase.SetRef(this.ShowcaseDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AvatarSelection
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSelectedAvatarChangedForShowcase"));
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

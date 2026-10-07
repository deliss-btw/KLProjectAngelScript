
namespace UWidget_CreatePlayer
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CreatePlayer : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CreatePlayer> CreatePlayerVM;
    UPROPERTY()
    UEditableTextBox w_editText_rename;
    UPROPERTY()
    UEUICommonListViewBase w_tile_select_face;
    UPROPERTY()
    UEUICommonListViewBase w_tile_fashion;
    UPROPERTY()
    UEUICommonListViewBase w_list_tab;
    UPROPERTY()
    FEUIActionBinding PrevBtnActionBinding;
    UPROPERTY()
    FEUIActionBinding NextBtnActionBinding;
    UPROPERTY()
    FEUIActionBinding ConfirmBtnActionBinding;
    UPROPERTY()
    FConfigVM_CreatePlayer CreatePlayerVMConfig;
    FEUIModelWeakRef __CreatePlayerVM;
    UPROPERTY()
    FGetEUIModelRef CreatePlayerVMDelegate;

    UWidget_CreatePlayer()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.GetOwningLocalPlayer().InjectTipsLocalPlayerFromWidget();
        if (this.w_tile_select_face != nullptr)
        {
            this.w_tile_select_face.SetSelectedIndex(GetSelectedFaceItemIndex());
        }
        this.RefreshFashionList();
        this.RefreshTabList();
        this.RefreshBtnState();
        return;
    }
    UFUNCTION()
    void OnViewUnBind_Implementation()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        if (!(this.CreatePlayerVM.IsValid()))
        {
            return;
        }
        InDeltaTime.WidgetTick();
        return;
    }
    UFUNCTION()
    void OnSelectedFashionSlotTypeIndexChanged()
    {
        this.RefreshTabList();
        this.RefreshFashionList();
        return;
    }
    UFUNCTION()
    void OnCreatePlayerPhaseChanged()
    {
        if (int(GetCreatePlayerPhase()) == 3)
        {
            this.w_editText_rename.SetText(FText::FromString(GetInputNickname()));
        }
        if (int(GetCreatePlayerPhase()) == 0)
        {
            if (this.w_tile_select_face != nullptr)
            {
                this.w_tile_select_face.SetSelectedIndex(GetSelectedFaceItemIndex());
            }
            this.RefreshFashionList();
            this.RefreshTabList();
        }
        this.RefreshBtnState();
        return;
    }
    UFUNCTION()
    void OnCreatePlayerPhaseChanged_ResetFocus()
    {
        if (!(this.CreatePlayerVM.IsValid()))
        {
            return;
        }
        ECreatePlayerPhase local_2;
        local_2 = GetCreatePlayerPhase();
        if ((int(local_2) == 1 && (this.w_tile_select_face != nullptr)))
        {
            this.RuleSetUserFocus(this.w_tile_select_face);
            return;
        }
        if (((int(local_2)) == 2 && (this.w_tile_fashion != nullptr)))
        {
            this.RuleSetUserFocus(this.w_tile_fashion);
            return;
        }
        if ((int(local_2) == 3 && (this.w_editText_rename != nullptr)))
        {
            this.RuleSetUserFocus(this.w_editText_rename);
            return;
        }
        this.RuleSetFocus();
        return;
    }
    UFUNCTION()
    void OnInputTextChanged(const FText &inout InText)
    {
        InText.OnNicknameTextChanged();
        this.RefreshBtnState();
        return;
    }
    UFUNCTION()
    void OnInputTextCommitted(const FText &inout InText, const ETextCommit CommitMethod)
    {
        if (int(CommitMethod) != 1)
        {
            return;
        }
        InText.OnNicknameTextCommitted();
        this.RefreshBtnState();
        return;
    }
    UFUNCTION()
    void OnMaskActiveChanged()
    {
        this.RefreshBtnState();
        return;
    }
    void RefreshBtnState()
    {
        if (!(this.CreatePlayerVM.IsValid()))
        {
            return;
        }
        if (GetbMaskActive())
        {
            this.PrevBtnActionBinding.SetCollapsed(true);
            this.NextBtnActionBinding.SetCollapsed(true);
            this.ConfirmBtnActionBinding.SetCollapsed(true);
            return;
        }
        bool local_1 = (GetPhaseOrderCursor() == 0);
        bool local_2 = IsOnLastActivePhase();
        bool local_5 = CanAdvanceFromCurrentPhase();
        bool local_7 = local_2;
        if (local_2 && (int(GetCreatePlayerPhase()) == 2))
        {
            local_7 = (GetSelectedFashionSlotTypeIndex() >= (GetAvailableFashionSlotTypes().Num() - 1));
        }
        this.PrevBtnActionBinding.SetCollapsed(local_1 || GetbConfirmLocked());
        this.NextBtnActionBinding.SetCollapsed(local_7 || !(local_5));
        this.ConfirmBtnActionBinding.SetCollapsed(!(local_7) || !(local_5));
        return;
    }
    void RefreshTabList()
    {
        if (this.w_list_tab != nullptr)
        {
            this.w_list_tab.SetSelectedIndex(GetSelectedFashionSlotTypeIndex());
        }
        return;
    }
    void RefreshFashionList()
    {
        if (this.w_tile_fashion != nullptr)
        {
            this.w_tile_fashion.SetSelectedIndex(GetSelectedFashionItemIndex());
        }
        return;
    }
    UFUNCTION()
    void CreatePlayerVM_OnMaleSelected() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CreatePlayerVM_OnFamaleSelected() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CreatePlayerVM_OnConfirmCreate() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CreatePlayerVM_OnGotoPrevPhase() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CreatePlayerVM_OnGotoNextPhase() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CreatePlayerVM_OnSelectFaceItem(const int ItemIndex) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(ItemIndex);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CreatePlayerVM_OnSelectFashionSlotType(const int SlotTypeIndex) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(SlotTypeIndex);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CreatePlayerVM_OnSelectFashionItem(const int ItemIndex) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(ItemIndex);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_CreatePlayer& local_6;
        TEUIModelRef<FVM_CreatePlayer> local_2 = this.CreatePlayerVM.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.CreatePlayerVM.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_CreatePlayer::__IndexOf_SelectedFashionSlotTypeIndex());
                }
                if (local_6)
                {
                    this.OnSelectedFashionSlotTypeIndexChanged();
                }
                break;
            }
            case 1:
            {
                this.CreatePlayerVM.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_CreatePlayer::__IndexOf_CreatePlayerPhase());
                    local_6.TrackPropertyRead(::FVM_CreatePlayer::__IndexOf_SelectedFashionSlotTypeIndex());
                    local_6.TrackPropertyRead(::FVM_CreatePlayer::__IndexOf_CreatePlayerGender());
                    local_6.TrackPropertyRead(::FVM_CreatePlayer::__IndexOf_bGenderSelected());
                    local_6.TrackPropertyRead(::FVM_CreatePlayer::__IndexOf_SelectedFaceID());
                    local_6.TrackPropertyRead(::FVM_CreatePlayer::__IndexOf_SelectedHairID());
                    local_6.TrackPropertyRead(::FVM_CreatePlayer::__IndexOf_SelectedUpperID());
                    local_6.TrackPropertyRead(::FVM_CreatePlayer::__IndexOf_SelectedLowerID());
                    local_6.TrackPropertyRead(::FVM_CreatePlayer::__IndexOf_SelectedSuitID());
                    local_6.TrackPropertyRead(::FVM_CreatePlayer::__IndexOf_bConfirmLocked());
                }
                if (local_6)
                {
                    this.OnCreatePlayerPhaseChanged();
                }
                break;
            }
            case 2:
            {
                this.CreatePlayerVM.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_CreatePlayer::__IndexOf_CreatePlayerPhase());
                }
                if (local_6)
                {
                    this.OnCreatePlayerPhaseChanged_ResetFocus();
                }
                break;
            }
            case 3:
            {
                this.CreatePlayerVM.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_CreatePlayer::__IndexOf_bMaskActive());
                }
                if (local_6)
                {
                    this.OnMaskActiveChanged();
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
                XError(ELog(17), "Remaining observed model change: OnSelectedFashionSlotTypeIndexChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnCreatePlayerPhaseChanged");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: OnCreatePlayerPhaseChanged_ResetFocus");
            }
            if (It.IsDirty(3))
            {
                XError(ELog(17), "Remaining observed model change: OnMaskActiveChanged");
            }
            return;
        }
        this.__CreatePlayerVM = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CreatePlayerVM.Initialize(this, FName("VM_CreatePlayer"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CreatePlayerVMDelegate.IsBound())
        {
            this.CreatePlayerVM.SetRef(this.CreatePlayerVMDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CreatePlayer
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSelectedFashionSlotTypeIndexChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnCreatePlayerPhaseChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnCreatePlayerPhaseChanged_ResetFocus"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnMaskActiveChanged"));
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

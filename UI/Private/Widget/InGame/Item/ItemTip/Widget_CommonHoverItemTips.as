
namespace UWidget_CommonHoverItemTips
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommonHoverItemTips : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonItemTipHost> TipHost;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonItemTip> DisplayTip;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Item> DisplayItem;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonItemTipDisplayAdapter> TipDisplay;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonItemTipOperationList> OperationList;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonHoverContent> CommonHoverContent;
    UPROPERTY()
    UWidget HoverAnchor;
    UPROPERTY()
    UEUIDynamicEntryBox w_entry_operation;
    TArray<TEUIModelRef<FVM_InputAction>> TipActions;
    bool bPendingFocusOperationList = false;
    UPROPERTY()
    FEUIActionBinding TipActionBinding0;
    UPROPERTY()
    FEUIActionBinding TipActionBinding1;
    UPROPERTY()
    FEUIActionBinding TipActionBinding2;
    FEUIModelWeakRef __TipHost;
    FEUIModelWeakRef __OperationList;
    FEUIModelWeakRef __CommonHoverContent;
    UPROPERTY()
    FGetEUIModelRef TipHostDelegate;
    UPROPERTY()
    FGetEUIModelRef DisplayTipDelegate;
    UPROPERTY()
    FGetEUIModelRef DisplayItemDelegate;
    UPROPERTY()
    FGetEUIModelRef TipDisplayDelegate;
    UPROPERTY()
    FGetEUIModelRef OperationListDelegate;
    UPROPERTY()
    FGetEUIModelRef CommonHoverContentDelegate;


    UFUNCTION()
    void OnViewBind_Implementation()
    {
        if (this.TipHost.IsValid())
        {
            EnsureDisplayTip();
        }
        this.RefreshDisplayTip();
        this.RefreshOperationHoverAnchors();
        this.HandleChainNavigationEnterRequest();
        return;
    }
    UFUNCTION()
    void OnViewUnbind_Implementation()
    {
        this.bPendingFocusOperationList = false;
        this.ResetTipActionBindings();
        this.DisplayTip.SetRef(FEUIModelRef());
        this.DisplayItem.SetRef(FEUIModelRef());
        this.TipDisplay.SetRef(FEUIModelRef());
        this.OperationList.SetRef(FEUIModelRef());
        return;
    }
    UFUNCTION()
    void OnDisplayTipChanged(const TEUIModelRef<FVM_CommonItemTip> &inout InDisplayTip)
    {
        TEUIModelRef<FVM_CommonItemTip> local_2 = InDisplayTip;
        if (!(local_2.IsValid()) && this.TipHost.IsValid())
        {
            TEUIModelRef<FVM_CommonItemTip> local_6;
            EnsureDisplayTip();
            local_6.GetDisplayTip();
            local_2 = local_6;
        }
        this.DisplayTip.SetRef(local_2);
        this.RefreshDisplayModels();
        return;
    }
    UFUNCTION()
    void OnOperationListShowStateChanged(const bool bInShowList)
    {
        this.RefreshOperationHoverAnchors();
        this.RefreshTipActionBindings();
        if (!(bInShowList))
        {
            this.bPendingFocusOperationList = false;
            return;
        }
        if (bInShowList)
        {
            this.FocusOperationListIfPending();
        }
        return;
    }
    UFUNCTION()
    void OnDisplayTipActionFingerprintChanged(const int InActionFingerprint)
    {
        this.RefreshTipActionBindings();
        this.HandleChainNavigationEnterRequest();
        return;
    }
    UFUNCTION()
    void OnChainNavigationEnterRequested(const bool bInRequested)
    {
        if (!(bInRequested))
        {
            return;
        }
        this.HandleChainNavigationEnterRequest();
        return;
    }
    void HandleChainNavigationEnterRequest()
    {
        if (!(this.CommonHoverContent.IsValid()))
        {
            return;
        }
        if (!(GetbChainNavigationEnterRequested()))
        {
            return;
        }
        if (this.TryEnterTipByChainNavigation())
        {
            ClearEnterByChainNavigationRequest();
        }
        return;
    }
    bool TryEnterTipByChainNavigation()
    {
        if (this.OperationList.IsValid() && GetShowList())
        {
            this.MarkPendingFocusOperationList();
            this.FocusOperationListIfPending();
            return true;
        }
        int local_4 = this.FindMoreTipActionIndex();
        if (local_4 < 0)
        {
            return false;
        }
        this.EnqueueTipAction(local_4);
        return true;
    }
    int FindMoreTipActionIndex() const
    {
        int local_1 = 0;
        for (; local_1 < this.TipActions.Num(); ++local_1)
        {
            if (this.TipActions[local_1].IsValid() && this.IsMoreTipAction())
            {
                return local_1;
            }
        }
        return -1;
    }
    void RefreshDisplayTip()
    {
        if (!(this.TipHost.IsValid()))
        {
            this.DisplayTip.SetRef(FEUIModelRef());
            this.DisplayItem.SetRef(FEUIModelRef());
            this.TipDisplay.SetRef(FEUIModelRef());
            this.OperationList.SetRef(FEUIModelRef());
            this.ResetTipActionBindings();
            return;
        }
        TEUIModelRef<FVM_CommonItemTip> local_6;
        local_6.GetDisplayTip();
        this.DisplayTip.SetRef(local_6);
        this.RefreshDisplayModels();
        return;
    }
    void RefreshDisplayModels()
    {
        if (!(this.DisplayTip.IsValid()))
        {
            this.DisplayItem.SetRef(FEUIModelRef());
            this.TipDisplay.SetRef(FEUIModelRef());
            this.OperationList.SetRef(FEUIModelRef());
            this.ResetTipActionBindings();
            return;
        }
        TEUIModelRef<FVM_Item> local_6;
        local_6.GetItem();
        this.DisplayItem.SetRef(local_6);
        TEUIModelRef<FVM_CommonItemTipDisplayAdapter> local_8;
        local_8.GetTipDisplay();
        this.TipDisplay.SetRef(local_8);
        TEUIModelRef<FVM_CommonItemTipOperationList> local_10;
        local_10.GetOperationList();
        this.OperationList.SetRef(local_10);
        this.RefreshOperationHoverAnchors();
        this.RefreshTipActionBindings();
        this.FocusOperationListIfPending();
        return;
    }
    void ResetTipActionBindings()
    {
        this.TipActionBinding0.SetDisabled(false);
        this.TipActionBinding1.SetDisabled(false);
        this.TipActionBinding2.SetDisabled(false);
        this.TipActionBinding0.SetCollapsed(true);
        this.TipActionBinding1.SetCollapsed(true);
        this.TipActionBinding2.SetCollapsed(true);
        this.TipActionBinding0.UnRegister();
        this.TipActionBinding1.UnRegister();
        this.TipActionBinding2.UnRegister();
        this.TipActions.Empty(0);
        return;
    }
    void RefreshTipActionBindings()
    {
        this.ResetTipActionBindings();
        bool local_1 = !(this.DisplayTip.IsValid());
        if (local_1)
        {
            return;
        }
        this.TipActions.SetNum(3);
        const TArray<TEUIModelRef<FVM_InputAction>>& local_4 = GetTipActions();
        int local_5 = 0;
        while (local_1)
        {
            if (!(local_4[local_5].IsValid()))
            {
            }
            else
            {
                if (GetInputAction().IsNull())
                {
                }
                else
                {
                    FName local_11 = this.GetTipActionHandlerName(local_5);
                    if ((local_11 == n"None"))
                    {
                    }
                    else
                    {
                        this.TipActions[local_5] = local_4[local_5];
                        this.RegisterTipActionBinding(local_5, GetInputAction(), local_11, this.ShouldDisableTipAction());
                    }
                }
            }
            ++local_5;
            if (local_5 >= local_4.Num())
            {
                local_1 = false;
                continue;
            }
            local_1 = (local_5 < 3);
        }
        this.HandleChainNavigationEnterRequest();
        return;
    }
    void RegisterTipActionBinding(const int Index, const FEUIInputAction &inout InputAction, const FName &inout HandlerName, const bool bDisabled)
    {
        switch (Index)
        {
        case 0:
        {
            this.TipActionBinding0.SetInputAction(InputAction);
            this.TipActionBinding0.SetDisabled(bDisabled);
            this.TipActionBinding0.SetCollapsed(false);
            this.TipActionBinding0.Register(this, HandlerName);
            return;
        }
        case 1:
        {
            this.TipActionBinding1.SetInputAction(InputAction);
            this.TipActionBinding1.SetDisabled(bDisabled);
            this.TipActionBinding1.SetCollapsed(false);
            this.TipActionBinding1.Register(this, HandlerName);
            return;
        }
        case 2:
        {
            this.TipActionBinding2.SetInputAction(InputAction);
            this.TipActionBinding2.SetDisabled(bDisabled);
            this.TipActionBinding2.SetCollapsed(false);
            this.TipActionBinding2.Register(this, HandlerName);
            return;
        }
        }
        return;
    }
    bool ShouldDisableTipAction(const FVM_InputAction &inout Action) const
    {
        return this.IsMoreTipAction(Action) && this.OperationList.IsValid() && GetShowList();
    }
    FName GetTipActionHandlerName(const int Index) const
    {
        switch (Index)
        {
        case 0:
        {
            return n"TriggerTipAction0";
        }
        case 1:
        {
            return n"TriggerTipAction1";
        }
        case 2:
        {
            return n"TriggerTipAction2";
        }
        }
        return n"None";
    }
    void EnqueueTipAction(const int Index)
    {
        if ((Index < 0 || (Index >= this.TipActions.Num())))
        {
            return;
        }
        TEUIModelRef<FVM_InputAction> local_6 = this.TipActions[Index];
        if (!(local_6.IsValid()))
        {
            return;
        }
        bool local_2 = this.ShouldFocusOperationListAfterTipAction();
        if (local_2)
        {
            this.MarkPendingFocusOperationList();
        }
        if (local_2 && this.CommonHoverContent.IsValid())
        {
            PinHoverPassThrough();
        }
        FEUIWidgetModelCallbackBuilder local_28 = FEUIWidgetModelCallbackBuilder::MakeCallback(local_6.opImplConv(), FVM_InputAction::ExecuteAction);
        local_28.EnqueueCallback();
        this.FocusOperationListIfPending();
        return;
    }
    bool ShouldFocusOperationListAfterTipAction(const FVM_InputAction &inout Action) const
    {
        return this.IsMoreTipAction(Action);
    }
    bool IsMoreTipAction(const FVM_InputAction &inout Action) const
    {
        FEUIInputAction local_6;
        if (!(::UGlobalItemSettings::Get().ItemTipActionInputs.Find(EItemTipActionId(5), local_6)))
        {
            return false;
        }
        UInputAction local_14 = local_6.EnhancedAction;
        UInputAction local_12;
        return local_12 == local_14 && (FEUIInputActionDataRow(Action.GetInputAction().TableRowAction) == local_6.TableRowAction);
    }
    void FocusOperationListIfPending()
    {
        if (!(this.bPendingFocusOperationList))
        {
            return;
        }
        if (this.w_entry_operation == nullptr)
        {
            return;
        }
        if (!(this.OperationList.IsValid()) || !(GetShowList()))
        {
            return;
        }
        TArray<UUserWidget> local_10 = this.w_entry_operation.GetAllEntries();
        for (auto local_24 : local_10)
        {
            if (local_24 != nullptr)
            {
                this.RuleSetUserFocus(local_24);
                this.bPendingFocusOperationList = false;
                return;
            }
        }
        this.RuleSetUserFocus(this.w_entry_operation);
        this.bPendingFocusOperationList = false;
        return;
    }
    void MarkPendingFocusOperationList()
    {
        this.bPendingFocusOperationList = true;
        return;
    }
    UFUNCTION()
    void TriggerTipAction0()
    {
        this.EnqueueTipAction(0);
        return;
    }
    UFUNCTION()
    void TriggerTipAction1()
    {
        this.EnqueueTipAction(1);
        return;
    }
    UFUNCTION()
    void TriggerTipAction2()
    {
        this.EnqueueTipAction(2);
        return;
    }
    void RefreshOperationHoverAnchors()
    {
        this.ApplySharedHoverAnchorToOperationList();
        this.ApplySharedHoverAnchorToExistingOperationEntries();
        return;
    }
    void ApplySharedHoverAnchorToOperationList()
    {
        if (this.OperationList.IsValid())
        {
            this.HoverAnchor.SetSharedHoverAnchor();
        }
        return;
    }
    void ApplySharedHoverAnchorToExistingOperationEntries()
    {
        UWidget_CommonActionEntry local_20;
        if (this.w_entry_operation == nullptr)
        {
            return;
        }
        for (auto local_18 : this.w_entry_operation.GetAllEntries())
        {
            local_20 = Cast<UWidget_CommonActionEntry>(local_18);
            if (local_20 != nullptr)
            {
                local_20.ApplySharedHoverAnchor(this.HoverAnchor);
            }
        }
        return;
    }
    UFUNCTION()
    void TipHost_PinAndOpenOperations() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TipHost_Unpin() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void DisplayTip_ToggleOperationList() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void DisplayTip_ExecuteMoreAction() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void DisplayTip_ExecuteUseAction() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void DisplayTip_ExecuteGSUseAction() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void DisplayTip_ExecuteDropAction() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void DisplayTip_ExecuteDestroyAction() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void DisplayTip_ExecuteEquipAction() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    TDataObjectPtr<FItemConfig> DisplayItem_ItemConfig() const
    {
        FVM_Item& local_2;
        TDataObjectPtr<FItemConfig> local_52;
        if (local_2)
        {
            local_52 = local_2.GetItemConfig();
        }
        else
        {
            local_52 = TDataObjectPtr<FItemConfig>();
        }
        return local_52;
    }
    UFUNCTION()
    int DisplayItem_Num() const
    {
        FVM_Item& local_2;
        int local_5;
        if (local_2)
        {
            local_5 = local_2.GetNum();
        }
        else
        {
            local_5 = 0;
        }
        return local_5;
    }
    UFUNCTION()
    int DisplayItem_OptionalNum() const
    {
        FVM_Item& local_2;
        return local_2 ? local_2.GetOptionalNum() : 0;
    }
    UFUNCTION()
    FText DisplayItem_ItemCategory() const
    {
        FVM_Item& local_2;
        FText local_16 = local_2 ? local_2.GetItemCategory() : FText();
        return local_16;
    }
    UFUNCTION()
    FSlateBrush DisplayItem_ItemIcon() const
    {
        FVM_Item& local_2;
        FSlateBrush local_136;
        if (local_2)
        {
            local_136 = local_2.GetItemIcon();
        }
        else
        {
            local_136 = FSlateBrush();
        }
        return local_136;
    }
    UFUNCTION()
    FText DisplayItem_ItemOwnLimit() const
    {
        FVM_Item& local_2;
        FText local_16 = local_2 ? local_2.GetItemOwnLimit() : FText();
        return local_16;
    }
    UFUNCTION()
    bool DisplayItem_ShouldShowNum() const
    {
        FVM_Item& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetShouldShowNum();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    bool DisplayItem_ShouldShowOptionalNum() const
    {
        FVM_Item& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetShouldShowOptionalNum();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    bool DisplayItem_ShouldShowOfMark() const
    {
        FVM_Item& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetShouldShowOfMark();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    bool DisplayItem_ShouldShowRangeMark() const
    {
        FVM_Item& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetShouldShowRangeMark();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    FSlateColor DisplayItem_NumTextColor() const
    {
        FVM_Item& local_2;
        FSlateColor local_18 = local_2 ? local_2.GetNumTextColor() : FSlateColor();
        return local_18;
    }
    UFUNCTION()
    bool DisplayItem_HasOwnLimit() const
    {
        FVM_Item& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.HasOwnLimit();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    void DisplayItem_OnCustomSelected() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void OperationList_ToggleShowList() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CommonHoverContent_CloseHover() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CommonHoverContent_PinHoverPassThrough() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_CommonItemTipHost& local_6;
        FVM_CommonItemTipOperationList& local_12;
        FVM_CommonHoverContent& local_18;
        TEUIModelRef<FVM_CommonItemTipHost> local_2 = this.TipHost.AsRef();
        TEUIModelRef<FVM_CommonItemTipOperationList> local_8 = this.OperationList.AsRef();
        TEUIModelRef<FVM_CommonHoverContent> local_14 = this.CommonHoverContent.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_68 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.TipHost.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_CommonItemTipHost::__IndexOf_DisplayTip());
                }
                if (local_6)
                {
                    this.OnDisplayTipChanged(local_6.GetDisplayTip());
                }
                break;
            }
            case 1:
            {
                this.OperationList.TrackRead();
                if (local_12)
                {
                    local_12.TrackPropertyRead(::FVM_CommonItemTipOperationList::__IndexOf_bShowList());
                }
                if (local_12)
                {
                    this.OnOperationListShowStateChanged(local_12.GetbShowList());
                }
                break;
            }
            case 2:
            {
                this.TipHost.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_CommonItemTipHost::__IndexOf_DisplayTipActionFingerprint());
                }
                if (local_6)
                {
                    this.OnDisplayTipActionFingerprintChanged(local_6.GetDisplayTipActionFingerprint());
                }
                break;
            }
            case 3:
            {
                this.CommonHoverContent.TrackRead();
                if (local_18)
                {
                    local_18.TrackPropertyRead(::FVM_CommonHoverContent::__IndexOf_bChainNavigationEnterRequested());
                }
                if (local_18)
                {
                    this.OnChainNavigationEnterRequested(local_18.GetbChainNavigationEnterRequested());
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
                XError(ELog(17), "Remaining observed model change: OnDisplayTipChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnOperationListShowStateChanged");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: OnDisplayTipActionFingerprintChanged");
            }
            if (It.IsDirty(3))
            {
                XError(ELog(17), "Remaining observed model change: OnChainNavigationEnterRequested");
            }
            return;
        }
        this.__TipHost = local_2.opImplConv();
        this.__OperationList = local_8.opImplConv();
        this.__CommonHoverContent = local_14.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.TipHost.Initialize(this, FName("VM_CommonItemTipHost"), EEUIWidgetRefModelCreationType(1), false);
        this.DisplayTip.Initialize(this, FName("VM_CommonItemTip"), EEUIWidgetRefModelCreationType(1), true);
        this.DisplayItem.Initialize(this, FName("VM_Item"), EEUIWidgetRefModelCreationType(1), true);
        this.TipDisplay.Initialize(this, FName("VM_CommonItemTipDisplayAdapter"), EEUIWidgetRefModelCreationType(1), true);
        this.OperationList.Initialize(this, FName("VM_CommonItemTipOperationList"), EEUIWidgetRefModelCreationType(1), true);
        this.CommonHoverContent.Initialize(this, FName("VM_CommonHoverContent"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TipHostDelegate.IsBound())
        {
            this.TipHost.SetRef(this.TipHostDelegate.Execute());
        }
        if (this.DisplayTipDelegate.IsBound())
        {
            this.DisplayTip.SetRef(this.DisplayTipDelegate.Execute());
        }
        if (this.DisplayItemDelegate.IsBound())
        {
            this.DisplayItem.SetRef(this.DisplayItemDelegate.Execute());
        }
        if (this.TipDisplayDelegate.IsBound())
        {
            this.TipDisplay.SetRef(this.TipDisplayDelegate.Execute());
        }
        if (this.OperationListDelegate.IsBound())
        {
            this.OperationList.SetRef(this.OperationListDelegate.Execute());
        }
        if (this.CommonHoverContentDelegate.IsBound())
        {
            this.CommonHoverContent.SetRef(this.CommonHoverContentDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommonHoverItemTips
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnDisplayTipChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnOperationListShowStateChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnDisplayTipActionFingerprintChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnChainNavigationEnterRequested"));
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

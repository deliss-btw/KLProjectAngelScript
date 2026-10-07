
namespace UWidget_ForgeMain
{
    const int ViewID = 0;

}
class UWidget_ForgeMain : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Page> Page;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_WeaponForge> WeaponForge;
    UPROPERTY()
    UEUICommonListViewBase EUI_List;
    UPROPERTY()
    UScrollBox ScrollBoxHorizontal;
    UPROPERTY()
    UScrollBox ScrollBoxVertical;
    UPROPERTY()
    FEUIInputActionDataRow ForgeIARow;
    UPROPERTY()
    FEUIInputActionDataRow CraftIARow;
    UPROPERTY()
    FEUIActionBinding CloseActionBinding;
    UPROPERTY()
    FEUIActionBinding ForgeActionBinding;
    UPROPERTY()
    FEUIActionBinding GamepadNextActionBinding;
    UPROPERTY()
    FConfigVM_WeaponForge WeaponForgeConfig;
    FEUIModelWeakRef __WeaponForge;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;
    UPROPERTY()
    FGetEUIModelRef WeaponForgeDelegate;

    UWidget_ForgeMain()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        if (this.EUI_List != nullptr)
        {
            int local_4;
            local_4 = GetSelectedCategoryIndex();
            if (GetMenuBarEntries().IsValidIndex())
            {
                this.EUI_List.SetSelectedIndex(local_4);
            }
        }
        return;
    }
    UFUNCTION()
    UWidget GetDesiredFocusWidget_Implementation() const
    {
        if (!(this.WeaponForge.IsValid()))
        {
            return nullptr;
        }
        TEUIModelWeakRef<FM_ForgeNode> local_8;
        local_8.GetCurrentSelectNode();
        TEUIModelWeakRef<FM_ForgeNode> local_6;
        if (!(local_6.IsValid()))
        {
            UWidget local_4;
            return local_4;
        }
        TEUIModelWeakRef<FVM_ForgeWeaponFormulaTree> local_10;
        if (!(GetCurrentTreeMap().Find(GetTreeId(), local_10)) || !(local_10.IsValid()))
        {
            UWidget local_4;
            return local_4;
        }
        TEUIModelWeakRef<FVM_ForgeWeaponItem> local_14;
        if (!(GetItemNodeMap().Find(local_6, local_14)) || !(local_14.IsValid()))
        {
            UWidget local_4;
            return local_4;
        }
        UWidget_ForgeWeaponItem local_16 = GetForgeWeaponItemWidget();
        return local_16;
    }
    UFUNCTION()
    void HandleRelatedFocusChanged_Implementation()
    {
        this.RefreshGamepadNextActionBindingVisibility();
        return;
    }
    UFUNCTION()
    void OnWeaponTypeListGoPrev()
    {
        if (this.EUI_List != nullptr)
        {
            this.EUI_List.SetSelectedIndex(FMath::Max((GetSelectedCategoryIndex() - 1), 0));
        }
        return;
    }
    UFUNCTION()
    void OnWeaponTypeListGoNext()
    {
        if (this.EUI_List != nullptr)
        {
            int local_5 = GetMenuBarEntries().Num() - 1;
            this.EUI_List.SetSelectedIndex(FMath::Min((GetSelectedCategoryIndex() + 1)));
        }
        return;
    }
    UFUNCTION()
    void HandleForgeOrCraftChanged(const bool bForgeOrCraft)
    {
        if (bForgeOrCraft)
        {
        }
        else
        {
        }
        this.ForgeActionBinding.SetInputAction();
        return;
    }
    UFUNCTION()
    void HandleIsCurrentSelectItemLockChanged(const bool IsCurrentSelectItemLock)
    {
        this.ForgeActionBinding.SetCollapsed(IsCurrentSelectItemLock);
        this.RefreshGamepadNextActionBindingVisibility();
        return;
    }
    UFUNCTION()
    void HandleCostInsufficientChanged(const bool bInsufficient)
    {
        this.ForgeActionBinding.SetDisabled(bInsufficient);
        return;
    }
    UFUNCTION()
    void HandleCurrentSelectNodeChanged(const TEUIModelWeakRef<FM_ForgeNode> &inout CurrentSelectNode)
    {
        this.FocusCurrentSelectNode();
        return;
    }
    void FocusCurrentSelectNode()
    {
        TEUIModelWeakRef<FM_ForgeNode> local_4;
        local_4.GetCurrentSelectNode();
        TEUIModelWeakRef<FM_ForgeNode> local_2;
        if (!(local_2.IsValid()))
        {
            return;
        }
        TEUIModelWeakRef<FVM_ForgeWeaponFormulaTree> local_8;
        if (!(GetCurrentTreeMap().Find(GetTreeId(), local_8)) || !(local_8.IsValid()))
        {
            return;
        }
        TEUIModelWeakRef<FVM_ForgeWeaponItem> local_12;
        if (!(GetItemNodeMap().Find(local_2, local_12)) || !(local_12.IsValid()))
        {
            return;
        }
        if (this.ScrollBoxHorizontal != nullptr)
        {
            this.ScrollBoxHorizontal.ScrollWidgetIntoView(GetForgeWeaponItemWidget(), true, EDescendantScrollDestination(2), 0.0f);
        }
        if (this.ScrollBoxVertical != nullptr)
        {
            this.ScrollBoxVertical.ScrollWidgetIntoView(GetForgeWeaponItemWidget(), true, EDescendantScrollDestination(2), 0.0f);
        }
        if (GetForgeWeaponItemWidget() != nullptr)
        {
            this.RuleSetUserFocus(GetForgeWeaponItemWidget());
        }
        return;
    }
    void RefreshGamepadNextActionBindingVisibility()
    {
        bool local_6;
        bool local_1 = false;
        if (!(this.IsPartOfFocusPath(this.ScrollBoxVertical)))
        {
            local_1 = true;
        }
        else
        {
            if (!(GetCurrentWeaponIsUnlock()))
            {
                local_6 = false;
            }
            else
            {
                TEUIModelRef<FVM_CommonConsume> local_4;
                local_4.GetCurrentCommonConsume();
                bool local_5 = local_4.IsValid();
                if (!(local_5))
                {
                    local_5 = false;
                }
                else
                {
                    local_4.GetCurrentCommonConsume();
                    local_5 = HasRewards();
                }
                local_5 = !local_5;
                local_6 = local_5;
            }
            if (local_6)
            {
                local_1 = true;
            }
            else
            {
                if (GetIsCurrentSelectItemLock())
                {
                    local_1 = true;
                }
            }
        }
        this.GamepadNextActionBinding.SetCollapsed(local_1);
        return;
    }
    UFUNCTION()
    void HandleCurrentWeaponInfoChanged()
    {
        this.RefreshGamepadNextActionBindingVisibility();
        return;
    }
    UFUNCTION()
    void HandleCurrentCommonConsumeChanged()
    {
        this.RefreshGamepadNextActionBindingVisibility();
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
    void WeaponForge_OnWeaponCategorySelected(const int Index) const
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
    void WeaponForge_OnDoForgeButtonClick() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_WeaponForge& local_6;
        TEUIModelRef<FVM_WeaponForge> local_2 = this.WeaponForge.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.WeaponForge.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_WeaponForge::__IndexOf_bForgeOrCraft());
                }
                if (local_6)
                {
                    this.HandleForgeOrCraftChanged(local_6.GetbForgeOrCraft());
                }
                break;
            }
            case 1:
            {
                this.WeaponForge.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_WeaponForge::__IndexOf_IsCurrentSelectItemLock());
                }
                if (local_6)
                {
                    this.HandleIsCurrentSelectItemLockChanged(local_6.GetIsCurrentSelectItemLock());
                }
                break;
            }
            case 2:
            {
                this.WeaponForge.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_WeaponForge::__IndexOf_bIsCurrentCostInsufficient());
                }
                if (local_6)
                {
                    this.HandleCostInsufficientChanged(local_6.GetbIsCurrentCostInsufficient());
                }
                break;
            }
            case 3:
            {
                this.WeaponForge.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_WeaponForge::__IndexOf_CurrentSelectNode());
                }
                if (local_6)
                {
                    this.HandleCurrentSelectNodeChanged(local_6.GetCurrentSelectNode());
                }
                break;
            }
            case 4:
            {
                this.WeaponForge.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_WeaponForge::__IndexOf_CurrentWeaponInfo());
                }
                if (local_6)
                {
                    this.HandleCurrentWeaponInfoChanged();
                }
                break;
            }
            case 5:
            {
                this.WeaponForge.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_WeaponForge::__IndexOf_CurrentCommonConsume());
                }
                if (local_6)
                {
                    this.HandleCurrentCommonConsumeChanged();
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
                XError(ELog(17), "Remaining observed model change: HandleForgeOrCraftChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: HandleIsCurrentSelectItemLockChanged");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: HandleCostInsufficientChanged");
            }
            if (It.IsDirty(3))
            {
                XError(ELog(17), "Remaining observed model change: HandleCurrentSelectNodeChanged");
            }
            if (It.IsDirty(4))
            {
                XError(ELog(17), "Remaining observed model change: HandleCurrentWeaponInfoChanged");
            }
            if (It.IsDirty(5))
            {
                XError(ELog(17), "Remaining observed model change: HandleCurrentCommonConsumeChanged");
            }
            return;
        }
        this.__WeaponForge = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Page.Initialize(this, FName("VM_Page"), EEUIWidgetRefModelCreationType(0), false);
        this.WeaponForge.Initialize(this, FName("VM_WeaponForge"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PageDelegate.IsBound())
        {
            this.Page.SetRef(this.PageDelegate.Execute());
        }
        if (this.WeaponForgeDelegate.IsBound())
        {
            this.WeaponForge.SetRef(this.WeaponForgeDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ForgeMain
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleForgeOrCraftChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleIsCurrentSelectItemLockChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleCostInsufficientChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleCurrentSelectNodeChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleCurrentWeaponInfoChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleCurrentCommonConsumeChanged"));
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


namespace UWidget_BattleBuildPage
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_BattleBuildPage : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Page> Page;
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_BattleBuildPage> BattleBuild;
    UPROPERTY()
    UEUIListView SelectList;
    UPROPERTY()
    UPanelWidget BattleBuildEntryContainer;
    UPROPERTY()
    TMap<TDataObjectPtr<FItemQuickSlotConfig>, UWidget_BattleBuildEntry> QuickSlotToEntryMap;
    FEUIModelWeakRef __BattleBuild;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;

    UWidget_BattleBuildPage()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        UWidget_BattleBuildEntry local_24;
        for (auto local_20 : this.BattleBuildEntryContainer.GetAllChildren())
        {
            local_24 = Cast<UWidget_BattleBuildEntry>(local_20);
            if (local_24 != nullptr)
            {
                this.QuickSlotToEntryMap.Add(GetQuickSlot(), local_24);
            }
        }
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        // body not fully recovered вЂ” stub [unresolved-operand]
    }
    UFUNCTION()
    void OnSelectedQuickSlotChanged(const TDataObjectPtr<FItemQuickSlotConfig> &inout QuickSlot)
    {
        TDataObjectPtr<FItemQuickSlotConfig> local_2;
        if (this.QuickSlotToEntryMap.Find(QuickSlot, local_2))
        {
            local_2.SetFocus();
            return;
        }
        return;
    }
    UFUNCTION()
    void OnQuickSlotChanged()
    {
        if ((int(this.GetCurrentInputType())) == 1)
        {
            if (this.SelectList.HasFocusedDescendants())
            {
                this.SelectList.SetFocus();
            }
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
    TArray<FEUIModelWeakRef> BattleBuild_SelectListEntries() const
    {
        FVMS_BattleBuildPage& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetSelectListEntries());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    void BattleBuild_ChangeQuickSlot() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void BattleBuild_ResetQuickSlot() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVMS_BattleBuildPage& local_6;
        TEUIModelRef<FVMS_BattleBuildPage> local_2 = this.BattleBuild.AsRef();
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
                    this.BattleBuild.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVMS_BattleBuildPage::__IndexOf_SelectedQuickSlot());
                    }
                    if (local_6)
                    {
                        this.OnSelectedQuickSlotChanged(local_6.GetSelectedQuickSlot());
                    }
                    this.BattleBuild.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVMS_BattleBuildPage::__IndexOf_QuickSlotChanged());
                    }
                    if (local_6)
                    {
                        this.OnQuickSlotChanged();
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
                XError(ELog(17), "Remaining observed model change: OnSelectedQuickSlotChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnQuickSlotChanged");
            }
            return;
        }
        this.__BattleBuild = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Page.Initialize(this, FName("VM_Page"), EEUIWidgetRefModelCreationType(0), false);
        this.BattleBuild.Initialize(this, FName("VMS_BattleBuildPage"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PageDelegate.IsBound())
        {
            this.Page.SetRef(this.PageDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_BattleBuildPage
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSelectedQuickSlotChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnQuickSlotChanged"));
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

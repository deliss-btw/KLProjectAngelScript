
namespace UWidget_BtnOperationList
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_BtnOperationList : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_BtnOperationList> ItemList;
    UPROPERTY()
    UEUIDynamicEntryBox w_entry_options;
    bool bPendingFocusFirstOption = false;
    FEUIModelWeakRef __ItemList;
    UPROPERTY()
    FGetEUIModelRef ItemListDelegate;


    UFUNCTION()
    UWidget GetDesiredFocusWidget_Implementation() const
    {
        if (this.w_entry_options == nullptr)
        {
            return nullptr;
        }
        for (auto local_20 : this.w_entry_options.GetAllEntries())
        {
            if (local_20 != nullptr)
            {
                return local_20;
            }
        }
        return this.w_entry_options;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.bPendingFocusFirstOption = true;
        this.SyncFirstOptionFocus();
        return;
    }
    UFUNCTION()
    void OnBtnListChanged()
    {
        this.SyncFirstOptionFocus();
        return;
    }
    void SyncFirstOptionFocus()
    {
        if (!(this.bPendingFocusFirstOption) || (int(this.GetCurrentInputType()) != 1) || (this.w_entry_options == nullptr))
        {
            return;
        }
        for (auto local_22 : this.w_entry_options.GetAllEntries())
        {
            if (local_22 != nullptr)
            {
                this.RuleSetUserFocus(local_22);
                this.bPendingFocusFirstOption = false;
                return;
            }
        }
        this.RuleSetUserFocus(this.w_entry_options);
        return;
    }
    UFUNCTION()
    void ItemList_OnHoverBegin() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void ItemList_OnHoverEnd() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_BtnOperationList& local_6;
        TEUIModelRef<FVM_BtnOperationList> local_2 = this.ItemList.AsRef();
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
                    this.ItemList.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_BtnOperationList::__IndexOf_BtnList());
                    }
                    if (local_6)
                    {
                        this.OnBtnListChanged();
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
                XError(ELog(17), "Remaining observed model change: OnBtnListChanged");
            }
            return;
        }
        this.__ItemList = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ItemList.Initialize(this, FName("VM_BtnOperationList"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ItemListDelegate.IsBound())
        {
            this.ItemList.SetRef(this.ItemListDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_BtnOperationList
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnBtnListChanged"));
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

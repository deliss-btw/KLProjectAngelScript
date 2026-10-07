
namespace UWidget_ItemOperation
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_ItemOperation : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ItemOperationList> OperationList;
    UPROPERTY()
    UEUICommonListView ListView;
    FEUIModelWeakRef __OperationList;
    UPROPERTY()
    FGetEUIModelRef OperationListDelegate;

    UWidget_ItemOperation()
    {
        return;
    }
    UFUNCTION()
    void OnInitialized_Implementation()
    {
        this.ListView.BP_OnItemClicked.AddUFunction(this, n"OnItemClicked");
        return;
    }
    UFUNCTION()
    void OnRemovedFromFocusPath_Implementation(const FFocusEvent &inout InFocusEvent)
    {
        if (this.OperationList)
        {
            if (this.OperationList.opArrow().HasExpandedItem())
            {
                return;
            }
            this.OperationList.opArrow().SetbShowList(false);
        }
        return;
    }
    UFUNCTION()
    void OnItemClicked(const FEUIModelContainer &inout Item)
    {
        this.OperationList_OnItemClicked(Item);
        return;
    }
    UFUNCTION()
    void OnShowListChanged(const bool bShowList)
    {
        if (bShowList)
        {
            this.ActivateWidget();
            return;
        }
        this.DeactivateWidget();
        return;
    }
    UFUNCTION()
    void OperationList_OnItemClicked(const FEUIModelContainer &inout ListItem) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(ListItem);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void OperationList_HideList() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_ItemOperationList& local_6;
        TEUIModelRef<FVM_ItemOperationList> local_2 = this.OperationList.AsRef();
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
                    this.OperationList.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_ItemOperationList::__IndexOf_bShowList());
                    }
                    if (local_6)
                    {
                        this.OnShowListChanged(local_6.GetbShowList());
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
                XError(ELog(17), "Remaining observed model change: OnShowListChanged");
            }
            return;
        }
        this.__OperationList = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.OperationList.Initialize(this, FName("VM_ItemOperationList"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.OperationListDelegate.IsBound())
        {
            this.OperationList.SetRef(this.OperationListDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ItemOperation
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnShowListChanged"));
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

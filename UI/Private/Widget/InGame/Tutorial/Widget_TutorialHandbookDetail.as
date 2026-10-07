
namespace UWidget_TutorialHandbookDetail
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_TutorialHandbookDetail : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TutorialHandbookDetail> DetailVM;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_GuideGroupDetail> GroupDetail;
    UPROPERTY()
    UEUICommonListView w_list_tab;
    UPROPERTY()
    FEUIActionBinding PrevPageAction;
    UPROPERTY()
    FEUIActionBinding NextPageAction;
    FEUIModelWeakRef __DetailVM;
    UPROPERTY()
    FGetEUIModelRef DetailVMDelegate;
    UPROPERTY()
    FGetEUIModelRef GroupDetailDelegate;

    UWidget_TutorialHandbookDetail()
    {
        return;
    }
    UFUNCTION()
    void OnInitialized_Implementation()
    {
        this.w_list_tab.BP_OnItemSelectionChanged.AddUFunction(this, n"OnListItemSelectionChanged");
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        if (this.DetailVM.opArrow().GetSelectedDetail().IsValid())
        {
            this.GroupDetail.SetRef(this.DetailVM.opArrow().GetSelectedDetail());
            this.RefreshActionVisibility();
        }
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        this.RegisterScrollRecipientExternal(this.w_list_tab);
        return;
    }
    UFUNCTION()
    void Destruct_Implementation()
    {
        this.UnregisterScrollRecipientExternal(this.w_list_tab);
        return;
    }
    UFUNCTION()
    void OnListItemSelectionChanged(const FEUIModelContainer &inout Item, const bool bIsSelected)
    {
        if (bIsSelected)
        {
            this.DetailVM.opArrow().SelectByItem(Item);
        }
        return;
    }
    UFUNCTION()
    void OnSelectedDetailChanged(const TEUIModelRef<FVM_GuideGroupDetail> &inout InSelectedDetail)
    {
        this.GroupDetail.SetRef(InSelectedDetail);
        this.RefreshActionVisibility();
        return;
    }
    UFUNCTION()
    void OnPrevPagePressed()
    {
        if (!(this.GroupDetail.IsValid()))
        {
            return;
        }
        this.GroupDetail.opArrow().PrevPage();
        this.RefreshActionVisibility();
        return;
    }
    UFUNCTION()
    void OnNextPagePressed()
    {
        if (!(this.GroupDetail.IsValid()))
        {
            return;
        }
        this.GroupDetail.opArrow().NextPage();
        this.RefreshActionVisibility();
        return;
    }
    void RefreshActionVisibility()
    {
        if (!(this.GroupDetail.IsValid()))
        {
            this.PrevPageAction.SetCollapsed(true);
            this.NextPageAction.SetCollapsed(true);
            return;
        }
        this.PrevPageAction.SetCollapsed(!(this.GroupDetail.opArrow().HasPrevPage()));
        this.NextPageAction.SetCollapsed(!(this.GroupDetail.opArrow().HasNextPage()));
        return;
    }
    UFUNCTION()
    void DetailVM_SelectByIndex(const int Index) const
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
    void DetailVM_SelectByItem(const FEUIModelContainer &inout Item) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Item);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void GroupDetail_PrevPage() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void GroupDetail_NextPage() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_TutorialHandbookDetail& local_6;
        TEUIModelRef<FVM_TutorialHandbookDetail> local_2 = this.DetailVM.AsRef();
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
                    this.DetailVM.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_TutorialHandbookDetail::__IndexOf_SelectedDetail());
                    }
                    if (local_6)
                    {
                        this.OnSelectedDetailChanged(local_6.GetSelectedDetail());
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
                XError(ELog(17), "Remaining observed model change: OnSelectedDetailChanged");
            }
            return;
        }
        this.__DetailVM = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.DetailVM.Initialize(this, FName("VM_TutorialHandbookDetail"), EEUIWidgetRefModelCreationType(0), false);
        this.GroupDetail.Initialize(this, FName("VM_GuideGroupDetail"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.DetailVMDelegate.IsBound())
        {
            this.DetailVM.SetRef(this.DetailVMDelegate.Execute());
        }
        if (this.GroupDetailDelegate.IsBound())
        {
            this.GroupDetail.SetRef(this.GroupDetailDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TutorialHandbookDetail
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSelectedDetailChanged"));
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

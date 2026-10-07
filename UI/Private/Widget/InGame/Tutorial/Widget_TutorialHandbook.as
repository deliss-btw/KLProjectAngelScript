
namespace UWidget_TutorialHandbook
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_TutorialHandbook : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MenuPage> MenuPage;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Page> Page;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TutorialHandbook> HandbookVM;
    UPROPERTY()
    FEUIActionBinding EnterAction;
    UPROPERTY()
    FConfigVM_MenuPage MenuPageConfig;
    FEUIModelWeakRef __HandbookVM;
    UPROPERTY()
    FGetEUIModelRef MenuPageDelegate;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;
    UPROPERTY()
    FGetEUIModelRef HandbookVMDelegate;

    UWidget_TutorialHandbook()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.RefreshEnterAction();
        return;
    }
    UFUNCTION()
    void OnHasHoveredEntryChanged(const bool bHasHovered)
    {
        this.RefreshEnterAction();
        return;
    }
    UFUNCTION()
    void OnEnterPressed()
    {
        this.HandbookVM.opArrow().EnterHoveredOrSelected();
        return;
    }
    void RefreshEnterAction()
    {
        this.EnterAction.SetCollapsed(!(this.HandbookVM.opArrow().GetbHasHoveredEntry()));
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
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_TutorialHandbook& local_6;
        TEUIModelRef<FVM_TutorialHandbook> local_2 = this.HandbookVM.AsRef();
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
                    this.HandbookVM.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_TutorialHandbook::__IndexOf_bHasHoveredEntry());
                    }
                    if (local_6)
                    {
                        this.OnHasHoveredEntryChanged(local_6.GetbHasHoveredEntry());
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
                XError(ELog(17), "Remaining observed model change: OnHasHoveredEntryChanged");
            }
            return;
        }
        this.__HandbookVM = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.MenuPage.Initialize(this, FName("VM_MenuPage"), EEUIWidgetRefModelCreationType(0), false);
        this.Page.Initialize(this, FName("VM_Page"), EEUIWidgetRefModelCreationType(0), false);
        this.HandbookVM.Initialize(this, FName("VM_TutorialHandbook"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MenuPageDelegate.IsBound())
        {
            this.MenuPage.SetRef(this.MenuPageDelegate.Execute());
        }
        if (this.PageDelegate.IsBound())
        {
            this.Page.SetRef(this.PageDelegate.Execute());
        }
        if (this.HandbookVMDelegate.IsBound())
        {
            this.HandbookVM.SetRef(this.HandbookVMDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TutorialHandbook
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnHasHoveredEntryChanged"));
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

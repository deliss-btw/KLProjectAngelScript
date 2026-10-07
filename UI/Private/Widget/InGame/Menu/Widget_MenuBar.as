
namespace UWidget_MenuBar
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_MenuBar : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_MenuManager> MenuManager;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_KeepShowcaseVisible> KeepShowcase;
    UPROPERTY()
    UEUICommonListView EUI_List;
    FEUIModelWeakRef __MenuManager;
    UPROPERTY()
    FGetEUIModelRef KeepShowcaseDelegate;

    UWidget_MenuBar()
    {
        return;
    }
    UFUNCTION()
    void Refresh()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    UFUNCTION()
    void MenuManager_OnMenuBarItemSelected(const FEUIModelContainer &inout MenuBarItem) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(MenuBarItem);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVMS_MenuManager& local_6;
        TEUIModelRef<FVMS_MenuManager> local_2 = this.MenuManager.AsRef();
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
                    this.MenuManager.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVMS_MenuManager::__IndexOf_bRefreshMenuBar());
                    }
                    if (local_6)
                    {
                        this.Refresh();
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
                XError(ELog(17), "Remaining observed model change: Refresh");
            }
            return;
        }
        this.__MenuManager = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.MenuManager.Initialize(this, FName("VMS_MenuManager"), EEUIWidgetRefModelCreationType(0), false);
        this.KeepShowcase.Initialize(this, FName("VM_KeepShowcaseVisible"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.KeepShowcaseDelegate.IsBound())
        {
            this.KeepShowcase.SetRef(this.KeepShowcaseDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_MenuBar
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("Refresh"));
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


namespace UWidget_PVX_Main
{
    const int ViewID = 0;

}
class UWidget_PVX_Main : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Page> Page;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PVX_Main> PVX_Main;
    UPROPERTY()
    UEUIDynamicWidget DynamicWidgetPage;
    UPROPERTY()
    UEUICommonListViewBase EUI_List;
    UPROPERTY()
    FEUIActionBinding MenuCategoryPrevActionBinding;
    UPROPERTY()
    FEUIActionBinding MenuCategoryNextActionBinding;
    FEUIModelWeakRef __PVX_Main;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;
    UPROPERTY()
    FGetEUIModelRef PVX_MainDelegate;

    UWidget_PVX_Main()
    {
        return;
    }
    UFUNCTION()
    void OnMenuCategoryListGoPrev()
    {
        if (this.EUI_List != nullptr)
        {
            this.EUI_List.SetSelectedIndex(FMath::Max((GetCurrentMenuIndex() - 1), 0));
        }
        return;
    }
    UFUNCTION()
    void OnMenuCategoryListGoNext()
    {
        if (this.EUI_List != nullptr)
        {
            int local_5 = GetMenuCategoryKeys().Num() - 1;
            this.EUI_List.SetSelectedIndex(FMath::Min((GetCurrentMenuIndex() + 1)));
        }
        return;
    }
    UFUNCTION()
    void OnDynamicWidgetChanged(const FEUIDynamicWidgetData &inout InDynamicWidget) const
    {
        if (this.DynamicWidgetPage != nullptr)
        {
            this.DynamicWidgetPage.SetDynamicWidgetData(InDynamicWidget);
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
    void PVX_Main_OnMenuBarIndexSelected(const int Index) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Index);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_PVX_Main& local_6;
        TEUIModelRef<FVM_PVX_Main> local_2 = this.PVX_Main.AsRef();
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
                    this.PVX_Main.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_PVX_Main::__IndexOf_DynamicWidget());
                    }
                    if (local_6)
                    {
                        this.OnDynamicWidgetChanged(local_6.GetDynamicWidget());
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
                XError(ELog(17), "Remaining observed model change: OnDynamicWidgetChanged");
            }
            return;
        }
        this.__PVX_Main = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Page.Initialize(this, FName("VM_Page"), EEUIWidgetRefModelCreationType(0), false);
        this.PVX_Main.Initialize(this, FName("VM_PVX_Main"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PageDelegate.IsBound())
        {
            this.Page.SetRef(this.PageDelegate.Execute());
        }
        if (this.PVX_MainDelegate.IsBound())
        {
            this.PVX_Main.SetRef(this.PVX_MainDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_PVX_Main
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnDynamicWidgetChanged"));
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

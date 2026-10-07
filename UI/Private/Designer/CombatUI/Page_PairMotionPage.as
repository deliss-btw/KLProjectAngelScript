
namespace UPage_PairMotionPage
{
    const int ViewID = 0;

}
class UPage_PairMotionPage : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Page> Page;
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_PairMotionPage> PairMotionPage;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;

    UPage_PairMotionPage()
    {
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
    TArray<FEUIModelWeakRef> PairMotionPage_DisplayMotionRefs() const
    {
        FVMS_PairMotionPage& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetDisplayMotionRefs());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    FEUIModelRef PairMotionPage_MotionTabs_0() const
    {
        FVMS_PairMotionPage& local_2;
        FEUIModelRef local_10;
        if (local_2 && local_2.GetMotionTabs().IsValidIndex(0))
        {
            local_10 = local_2.GetMotionTabs()[0];
        }
        else
        {
            local_10 = FEUIModelRef();
        }
        return local_10;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Page.Initialize(this, FName("VM_Page"), EEUIWidgetRefModelCreationType(0), false);
        this.PairMotionPage.Initialize(this, FName("VMS_PairMotionPage"), EEUIWidgetRefModelCreationType(0), false);
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

namespace UPage_PairMotionPage
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
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

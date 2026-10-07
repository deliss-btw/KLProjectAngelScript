
namespace UPage_MotionPage
{
    const int ViewID = 0;

}
class UPage_MotionPage : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Page> Page;
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_MotionPage> MotionPage;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;

    UPage_MotionPage()
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
    TArray<FEUIModelWeakRef> MotionPage_DisplayMotionRefs() const
    {
        FVMS_MotionPage& local_2;
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
    FEUIModelRef MotionPage_MotionTabs_0() const
    {
        FVMS_MotionPage& local_2;
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
    FEUIModelRef MotionPage_MotionTabs_1() const
    {
        FVMS_MotionPage& local_2;
        FEUIModelRef local_10;
        if (local_2 && local_2.GetMotionTabs().IsValidIndex(1))
        {
            local_10 = local_2.GetMotionTabs()[1];
        }
        else
        {
            local_10 = FEUIModelRef();
        }
        return local_10;
    }
    UFUNCTION()
    FEUIModelRef MotionPage_MotionTabs_2() const
    {
        FVMS_MotionPage& local_2;
        FEUIModelRef local_10;
        if (local_2 && local_2.GetMotionTabs().IsValidIndex(2))
        {
            local_10 = local_2.GetMotionTabs()[2];
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
        this.MotionPage.Initialize(this, FName("VMS_MotionPage"), EEUIWidgetRefModelCreationType(0), false);
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

namespace UPage_MotionPage
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

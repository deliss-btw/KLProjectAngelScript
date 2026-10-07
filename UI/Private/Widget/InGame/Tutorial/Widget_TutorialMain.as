
namespace UWidget_TutorialMain
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_TutorialMain : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TutorialMain> TutorialVM;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_GuideGroupDetail> GroupDetail;
    UPROPERTY()
    FEUIActionBinding PrevPageAction;
    UPROPERTY()
    FEUIActionBinding NextPageAction;
    UPROPERTY()
    FEUIActionBinding ConfirmAction;
    UPROPERTY()
    FGetEUIModelRef TutorialVMDelegate;
    UPROPERTY()
    FGetEUIModelRef GroupDetailDelegate;

    UWidget_TutorialMain()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.GroupDetail.SetRef(this.TutorialVM.opArrow().GetGroupDetail());
        this.RefreshActionVisibility();
        return;
    }
    UFUNCTION()
    void OnPrevPagePressed()
    {
        this.GroupDetail.opArrow().PrevPage();
        this.RefreshActionVisibility();
        return;
    }
    UFUNCTION()
    void OnNextPagePressed()
    {
        this.GroupDetail.opArrow().NextPage();
        this.RefreshActionVisibility();
        return;
    }
    UFUNCTION()
    void OnConfirmPressed()
    {
        this.TutorialVM.opArrow().OnClose();
        this.ClosePage(false);
        return;
    }
    void RefreshActionVisibility()
    {
        this.PrevPageAction.SetCollapsed(!(this.GroupDetail.opArrow().HasPrevPage()));
        this.NextPageAction.SetCollapsed(!(this.GroupDetail.opArrow().HasNextPage()));
        this.ConfirmAction.SetCollapsed(!(this.GroupDetail.opArrow().IsLastPage()));
        return;
    }
    UFUNCTION()
    void TutorialVM_OnClose() const
    {
        FEUIModelRef local_2;
        local_2;
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
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.TutorialVM.Initialize(this, FName("VM_TutorialMain"), EEUIWidgetRefModelCreationType(0), false);
        this.GroupDetail.Initialize(this, FName("VM_GuideGroupDetail"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TutorialVMDelegate.IsBound())
        {
            this.TutorialVM.SetRef(this.TutorialVMDelegate.Execute());
        }
        if (this.GroupDetailDelegate.IsBound())
        {
            this.GroupDetail.SetRef(this.GroupDetailDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TutorialMain
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

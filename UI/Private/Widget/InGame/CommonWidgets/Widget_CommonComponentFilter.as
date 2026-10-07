
namespace UWidget_CommonComponentFilter
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommonComponentFilter : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonComponentFilter> CommonComponentFilterVM;
    UPROPERTY()
    UWidget_CommonActionEntry w_itemtips;
    UPROPERTY()
    FGetEUIModelRef CommonComponentFilterVMDelegate;

    UWidget_CommonComponentFilter()
    {
        return;
    }
    UFUNCTION()
    void CommonComponentFilterVM_OnFilterButtonClicked() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CommonComponentFilterVM_OnSubPageClosed() const
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
        this.CommonComponentFilterVM.Initialize(this, FName("VM_CommonComponentFilter"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommonComponentFilterVMDelegate.IsBound())
        {
            this.CommonComponentFilterVM.SetRef(this.CommonComponentFilterVMDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommonComponentFilter
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

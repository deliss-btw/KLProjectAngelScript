
namespace UWidget_TrainingItem
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_TrainingItem : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TrainingItem> TrainingItemVM;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_RedDot> RedDotVM;
    UPROPERTY()
    FConfigVM_RedDot RedDotVMConfig;
    UPROPERTY()
    FGetEUIModelRef TrainingItemVMDelegate;
    UPROPERTY()
    FGetEUIModelRef RedDotVMDelegate;

    UWidget_TrainingItem()
    {
        return;
    }
    UFUNCTION()
    void TrainingItemVM_OnTrainingClick() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TrainingItemVM_OnTrainingHover() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void TrainingItemVM_OnTrainingUnhover() const
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
        this.TrainingItemVM.Initialize(this, FName("VM_TrainingItem"), EEUIWidgetRefModelCreationType(0), false);
        this.RedDotVM.Initialize(this, FName("VM_RedDot"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TrainingItemVMDelegate.IsBound())
        {
            this.TrainingItemVM.SetRef(this.TrainingItemVMDelegate.Execute());
        }
        if (this.RedDotVMDelegate.IsBound())
        {
            this.RedDotVM.SetRef(this.RedDotVMDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TrainingItem
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

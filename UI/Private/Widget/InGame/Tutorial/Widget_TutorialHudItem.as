
namespace UWidget_TutorialHudItem
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_TutorialHudItem : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TutorialHudItem> ItemVM;
    UPROPERTY()
    FGetEUIModelRef ItemVMDelegate;

    UWidget_TutorialHudItem()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ItemVM.Initialize(this, FName("VM_TutorialHudItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ItemVMDelegate.IsBound())
        {
            this.ItemVM.SetRef(this.ItemVMDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TutorialHudItem
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

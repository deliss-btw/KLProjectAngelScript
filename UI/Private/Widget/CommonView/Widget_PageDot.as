
namespace UWidget_PageDot
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_PageDot : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PageDot> DotVM;
    UPROPERTY()
    FGetEUIModelRef DotVMDelegate;

    UWidget_PageDot()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.DotVM.Initialize(this, FName("VM_PageDot"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.DotVMDelegate.IsBound())
        {
            this.DotVM.SetRef(this.DotVMDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_PageDot
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

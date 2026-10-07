
namespace UWidget_RedDot
{
    const int ViewID = 0;

}
class UWidget_RedDot : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_RedDot> RedDotVM;
    UPROPERTY()
    FConfigVM_RedDot RedDotVMConfig;
    UPROPERTY()
    FGetEUIModelRef RedDotVMDelegate;

    UWidget_RedDot()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.RedDotVM.Initialize(this, FName("VM_RedDot"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.RedDotVMDelegate.IsBound())
        {
            this.RedDotVM.SetRef(this.RedDotVMDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_RedDot
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

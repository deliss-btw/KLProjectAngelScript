
namespace UWidget_Common_Center_Spend
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_Common_Center_Spend : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Common_Center_Spend> CenterSpendVM;
    UPROPERTY()
    FGetEUIModelRef CenterSpendVMDelegate;

    UWidget_Common_Center_Spend()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CenterSpendVM.Initialize(this, FName("VM_Common_Center_Spend"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CenterSpendVMDelegate.IsBound())
        {
            this.CenterSpendVM.SetRef(this.CenterSpendVMDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_Common_Center_Spend
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

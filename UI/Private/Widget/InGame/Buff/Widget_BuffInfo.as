
namespace UWidget_BuffInfo
{
    const int ViewID = 0;

}
class UWidget_BuffInfo : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_BuffInfo> BuffInfo;
    UPROPERTY()
    FGetEUIModelRef BuffInfoDelegate;

    UWidget_BuffInfo()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.BuffInfo.Initialize(this, FName("VM_BuffInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.BuffInfoDelegate.IsBound())
        {
            this.BuffInfo.SetRef(this.BuffInfoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_BuffInfo
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

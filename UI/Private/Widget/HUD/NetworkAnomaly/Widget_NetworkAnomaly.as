
namespace UWidget_NetworkAnomaly
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_NetworkAnomaly : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_NetworkAnomaly> NetworkVM;
    UPROPERTY()
    FGetEUIModelRef NetworkVMDelegate;

    UWidget_NetworkAnomaly()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        if (this.NetworkVM.IsValid())
        {
            InDeltaTime.WidgetTick();
        }
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.NetworkVM.Initialize(this, FName("VM_NetworkAnomaly"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.NetworkVMDelegate.IsBound())
        {
            this.NetworkVM.SetRef(this.NetworkVMDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_NetworkAnomaly
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

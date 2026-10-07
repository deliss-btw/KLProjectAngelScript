
namespace UWidget_ShowEcho
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_ShowEcho : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ShowEcho> ShowEcho;
    UPROPERTY()
    FGetEUIModelRef ShowEchoDelegate;

    UWidget_ShowEcho()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ShowEcho.Initialize(this, FName("VM_ShowEcho"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ShowEchoDelegate.IsBound())
        {
            this.ShowEcho.SetRef(this.ShowEchoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ShowEcho
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

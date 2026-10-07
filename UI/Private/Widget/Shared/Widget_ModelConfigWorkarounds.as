
namespace UWidget_CameraModifierModelConfig
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CameraModifierModelConfig : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CameraModifier> CameraModifier;
    UPROPERTY()
    FConfigVM_CameraModifier CameraModifierConfig;
    UPROPERTY()
    FGetEUIModelRef CameraModifierDelegate;

    UWidget_CameraModifierModelConfig()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CameraModifier.Initialize(this, FName("VM_CameraModifier"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CameraModifierDelegate.IsBound())
        {
            this.CameraModifier.SetRef(this.CameraModifierDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CameraModifierModelConfig
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

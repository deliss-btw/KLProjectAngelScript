
namespace UWidget_HUDHintManager
{
    const int ViewID = 0;

}
class UWidget_HUDHintManager : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_HUDHintManager> HUDHintManager;

    UWidget_HUDHintManager()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.HUDHintManager.Initialize(this, FName("VMS_HUDHintManager"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_HUDHintManager
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

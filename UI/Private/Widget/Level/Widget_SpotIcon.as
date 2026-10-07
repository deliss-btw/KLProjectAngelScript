
namespace UWidget_SpotIcon
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_SpotIcon : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SpotInfo> SpotInfo;
    UPROPERTY()
    FGetEUIModelRef SpotInfoDelegate;

    UWidget_SpotIcon()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SpotInfo.Initialize(this, FName("VM_SpotInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SpotInfoDelegate.IsBound())
        {
            this.SpotInfo.SetRef(this.SpotInfoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_SpotIcon
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

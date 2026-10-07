
namespace UWidget_TeleporterInfo
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_TeleporterInfo : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Teleporter> Teleporter;
    UPROPERTY()
    FGetEUIModelRef TeleporterDelegate;

    UWidget_TeleporterInfo()
    {
        return;
    }
    UFUNCTION()
    void Teleporter_Teleport() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Teleporter.Initialize(this, FName("VM_Teleporter"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TeleporterDelegate.IsBound())
        {
            this.Teleporter.SetRef(this.TeleporterDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TeleporterInfo
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


namespace UWidget_WorldMapTeleporterListEntry
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_WorldMapTeleporterListEntry : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_WorldMapSpotInfo> SpotInfo;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SelectableItem> SelectableItem;
    UPROPERTY()
    FGetEUIModelRef SpotInfoDelegate;
    UPROPERTY()
    FGetEUIModelRef SelectableItemDelegate;

    UWidget_WorldMapTeleporterListEntry()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SpotInfo.Initialize(this, FName("VM_WorldMapSpotInfo"), EEUIWidgetRefModelCreationType(0), false);
        this.SelectableItem.Initialize(this, FName("VM_SelectableItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SpotInfoDelegate.IsBound())
        {
            this.SpotInfo.SetRef(this.SpotInfoDelegate.Execute());
        }
        if (this.SelectableItemDelegate.IsBound())
        {
            this.SelectableItem.SetRef(this.SelectableItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_WorldMapTeleporterListEntry
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

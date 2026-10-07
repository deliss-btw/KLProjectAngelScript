
namespace UWidget_WorldMap
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_WorldMap : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MenuPage> MenuPage;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_WorldMapUtils> WorldMapUtils;
    UPROPERTY()
    FConfigVM_MenuPage MenuPageConfig;
    UPROPERTY()
    FGetEUIModelRef MenuPageDelegate;

    UWidget_WorldMap()
    {
        return;
    }
    UFUNCTION()
    void WorldMapUtils_CloseWorldMapAndOpenHalfScreenMinimap() const
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
        this.MenuPage.Initialize(this, FName("VM_MenuPage"), EEUIWidgetRefModelCreationType(0), false);
        this.WorldMapUtils.Initialize(this, FName("VM_WorldMapUtils"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MenuPageDelegate.IsBound())
        {
            this.MenuPage.SetRef(this.MenuPageDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_WorldMap
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


namespace UWidget_WorldMapInfo
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_WorldMapInfo : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_WorldMapInfo> WorldMapInfo;
    UPROPERTY()
    UEUITextBlock NameText;
    UPROPERTY()
    bool bOverrideName;
    UPROPERTY()
    FText OverrideName;
    UPROPERTY()
    FConfigVM_WorldMapInfo WorldMapInfoConfig;
    UPROPERTY()
    FGetEUIModelRef WorldMapInfoDelegate;

    UWidget_WorldMapInfo()
    {
        return;
    }
    UFUNCTION()
    void PreConstruct_Implementation(const bool IsDesignTime)
    {
        if (this.bOverrideName)
        {
            this.NameText.SetText(this.OverrideName);
            return;
        }
        TDataObjectPtr<FMapConfig> local_26 = this.WorldMapInfoConfig.MapConfig;
        if (local_26)
        {
            this.NameText.SetText(local_26.opArrow().MapName);
        }
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.WorldMapInfo.Initialize(this, FName("VM_WorldMapInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.WorldMapInfoDelegate.IsBound())
        {
            this.WorldMapInfo.SetRef(this.WorldMapInfoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_WorldMapInfo
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

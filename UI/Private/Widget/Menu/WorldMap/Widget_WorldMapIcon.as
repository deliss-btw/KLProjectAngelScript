
namespace UWidget_WorldMapIcon
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_WorldMapIcon : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_WorldRegionIcon> RegionIcon;
    UPROPERTY()
    FSlateBrush IconBrush;
    UPROPERTY()
    bool bShowIconName = true;
    UPROPERTY()
    bool bOverrideIconName;
    UPROPERTY()
    FText IconName;
    UPROPERTY()
    FText IconDescription;
    UPROPERTY()
    FVector2D IconCenterOffset;
    UPROPERTY()
    UEUIImage IconImage;
    UPROPERTY()
    UEUITextBlock NameText;
    UPROPERTY()
    UEUIImage Shadow;
    UPROPERTY()
    FConfigVM_WorldRegionIcon RegionIconConfig;
    UPROPERTY()
    FGetEUIModelRef RegionIconDelegate;


    UFUNCTION()
    void PreConstruct_Implementation(const bool IsDesignTime)
    {
        this.IconImage.SetBrush(this.IconBrush);
        this.Shadow.SetBrush(this.IconBrush);
        if (this.bShowIconName)
        {
            if (this.bOverrideIconName)
            {
                this.NameText.SetText(this.IconName);
            }
            else
            {
                FText local_10;
                if (this.RegionIconConfig.LevelInfoConfig)
                {
                    local_10 = this.RegionIconConfig.LevelInfoConfig.opArrow().LevelDisplayName;
                }
                else
                {
                    local_10 = FText();
                }
                this.NameText.SetText(local_10);
            }
            return;
        }
        this.NameText.SetText(FText());
        return;
    }
    UFUNCTION()
    void RegionIcon_GotoRegionMap() const
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
        this.RegionIcon.Initialize(this, FName("VM_WorldRegionIcon"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.RegionIconDelegate.IsBound())
        {
            this.RegionIcon.SetRef(this.RegionIconDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_WorldMapIcon
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

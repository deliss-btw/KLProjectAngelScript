
namespace UWidget_levelHintPanel
{
    const int ViewID = 0;

}
class UWidget_levelHintPanel : UEUIUserWidget
{
    UPROPERTY()
    UImage ShowImage;
    UPROPERTY()
    URichTextBlock ShowTextContent;
    UPROPERTY()
    UTextBlock ShowName;
    UPROPERTY()
    UDataTable LevelHintDataTable;
    FLevelHintData HintData;

    UWidget_levelHintPanel()
    {
        return;
    }
    UFUNCTION()
    void ShowInfoContent(const FName &inout HintName)
    {
        if (this.LevelHintDataTable.FindRow(HintName, this.HintData))
        {
            this.ShowImage.SetBrushFromTexture(this.HintData.HintImage, false);
            this.ShowTextContent.SetText(this.HintData.HintContent);
            this.ShowName.SetText(this.HintData.Name);
        }
        this.SetVisibility(ESlateVisibility(0));
        return;
    }
}

namespace UWidget_levelHintPanel
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


namespace UWidget_MissionPanel
{
    const int ViewID = 0;

}
class UWidget_MissionPanel : UEUIUserWidget
{
    UPROPERTY()
    TMap<FName, FUI_HintInfo> AllHintInfoData;
    UPROPERTY()
    UImage ShowImage;
    UPROPERTY()
    URichTextBlock ShowTextContent;
    FUI_HintInfo CurrentInfo;

    UWidget_MissionPanel()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        this.OnVisibilityChanged.AddUFunction(this, n"OnMissionPanelShow");
        return;
    }
    UFUNCTION()
    void ShowInfoContent(const FName &inout MissionName)
    {
        this.AllHintInfoData[MissionName].InfoImage.LoadBrush();
        this.ShowTextContent.SetText(this.AllHintInfoData[MissionName].InfoContent);
        return;
    }
    UFUNCTION()
    void OnMissionPanelShow(const ESlateVisibility bIsShow)
    {
        if (int(bIsShow) == 2)
        {
            if (!(this.CurrentInfo.CustomLevelEventName.IsNone()))
            {
                ::HUD_Development::DebugSendCustomLevelEventFromClient(this.CurrentInfo.CustomLevelEventName);
            }
        }
        return;
    }
}

namespace UWidget_MissionPanel
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

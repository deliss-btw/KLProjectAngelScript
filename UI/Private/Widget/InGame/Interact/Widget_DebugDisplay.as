namespace UWidget_DebugDisplayPanel
{
    const int ViewID = 0;

}
class UWidget_DebugDisplayPanel : UEUIActivatableWidget
{
    UPROPERTY()
    UUserWidget UI_DebugDisplay;

    UWidget_DebugDisplayPanel()
    {
        return;
    }
}

namespace UWidget_DebugDisplayPanel
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.WidgetType = UWidget_DebugDisplayPanel;
    Result.ObservedModelChangesSubscriberCount = 0;
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

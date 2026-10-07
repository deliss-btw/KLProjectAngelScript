
namespace UWidget_ConnectServerMap
{
    const int ViewID = 0;

}
class UWidget_ConnectServerMap : UEUIActivatableWidget
{
    UWidget_ConnectServerMap()
    {
        return;
    }
}

namespace UWidget_ConnectServerMap
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

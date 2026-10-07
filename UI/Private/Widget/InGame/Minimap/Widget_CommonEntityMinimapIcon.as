
namespace UWidget_CommonEntityMinimapIcon
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommonEntityMinimapIcon : UEUIUserWidget
{
    UWidget_CommonEntityMinimapIcon()
    {
        return;
    }
}

namespace UWidget_CommonEntityMinimapIcon
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

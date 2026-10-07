
namespace UWidget_SocialInteraction
{
    const int ViewID = 0;

}
class UWidget_SocialInteraction : UEUIUserWidget
{
    UPROPERTY()
    UGridPanel InteractionPanel;

    UWidget_SocialInteraction()
    {
        return;
    }
}

namespace UWidget_SocialInteraction
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

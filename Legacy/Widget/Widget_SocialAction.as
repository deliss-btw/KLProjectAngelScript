
namespace UWidget_SocialAction
{
    const int ViewID = 0;

}
class UWidget_SocialAction : UEUIActivatableWidget
{
    UWidget_SocialAction()
    {
        return;
    }
    UFUNCTION()
    void ExitSocialAction()
    {
        this.SetVisibility(ESlateVisibility(2));
        return;
    }
}

namespace UWidget_SocialAction
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


namespace UWidget_ShowcaseTest
{
    const int ViewID = 0;

}
class UWidget_ShowcaseTest : UEUIActivatableWidget
{
    UWidget_ShowcaseTest()
    {
        return;
    }
}

namespace UWidget_ShowcaseTest
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


namespace UWidget_RichTextKeyHint
{
    const int ViewID = 0;

}
class UWidget_RichTextKeyHint : UEUIUserWidget
{
    UPROPERTY()
    UEUIInputActionWidget IAWidget;

    UWidget_RichTextKeyHint()
    {
        return;
    }
}

namespace UWidget_RichTextKeyHint
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

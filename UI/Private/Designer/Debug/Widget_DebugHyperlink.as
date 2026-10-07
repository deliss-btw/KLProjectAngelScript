
namespace UWidget_DebugHyperlink
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_DebugHyperlink : UEUIUserWidget
{
    UPROPERTY()
    UEUITextBlock RichTextBlock;
    UPROPERTY()
    UEUITextBlock PlainTextBlock;
    UPROPERTY()
    UEUITextBlock ForcePlainBlock;
    UPROPERTY()
    UEUITextBlock WrapTextBlock;
    UPROPERTY()
    UEUITextBlock StyleTextBlock;
    UPROPERTY()
    UTextBlock StatusText;
    UPROPERTY()
    UEUIButton FocusAnchor;

    UWidget_DebugHyperlink()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        // body not fully recovered вЂ” stub [emitter-panic]
    }
    UFUNCTION()
    bool OnLinkClicked(const FEUIHyperlinkInfo &in Info)
    {
        FText local_18;
        if (::HyperlinkActionHelper::HandleHyperlink(Info))
        {
            FText local_10;
            FText::FromString(Info.Param);
            FText::FromString(local_10);
            FText::AsCultureInvariant("ACTION: {0} param={1}");
            FText::Format(local_18, local_10);
            this.StatusText.SetText(local_18);
            return true;
        }
        FText::FromString(local_18);
        this.StatusText.SetText(FText::Format(FText::AsCultureInvariant("HREF: {0}"), local_18));
        return false;
    }
}

namespace UWidget_DebugHyperlink
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

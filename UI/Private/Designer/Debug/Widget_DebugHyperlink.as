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
        FString local_12 = (FString("请阅读 <a href=\"https://www.example.com\">用户协议</> 和 ") + "<a action=\"open_shop\" param=\"weapon\">武器商店</> 了解详情");
        FText local_16 = FText::AsCultureInvariant(local_12);
        this.RichTextBlock.SetText(local_16);
        this.PlainTextBlock.SetText(local_16);
        this.ForcePlainBlock.SetText(local_16);
        FString local_12_2 = (FString("这是一段会换行的长文本，请点击 ") + "<a href=\"https://example.com/terms\">这是一个很长很长的超链接文本它会自动换行到下一行显示</> ");
        FString local_8 = (local_12_2 + "中间的普通文字 ");
        FString local_12_3 = (local_8 + "<a action=\"show_item\" param=\"123\">这是另一个action超链接也很长会换行</> ");
        FString local_8_2 = (local_12_3 + "结尾文字");
        FText local_4 = FText::AsCultureInvariant(local_8_2);
        this.WrapTextBlock.SetText(local_4);
        FString local_8_3 = (FString("Style: ") + "<a style=\"Red18B\" href=\"https://example.com\">Red18B红色链接</> ");
        FString local_12_4 = (local_8_3 + "<a style=\"Yellow24F\" href=\"https://example.com\">Yellow24F黄色链接</> ");
        FString local_8_4 = (local_12_4 + "<a style=\"Gray16\" action=\"test\" param=\"style\">Gray16灰色action链接</> ");
        FString local_12_5 = (local_8_4 + "<a href=\"https://example.com\">无style默认蓝色</> ");
        FString local_8_5 = (local_12_5 + "<a style=\"NotExist\" href=\"https://example.com\">不存在行名回退蓝色</>");
        FText local_20 = FText::AsCultureInvariant(local_8_5);
        this.StyleTextBlock.SetText(local_20);
        this.StyleTextBlock.OnHyperlinkClicked.BindUFunction(this, n"OnLinkClicked");
        this.StatusText.SetText(FText::Format(FText::AsCultureInvariant("Short: {0} | Wrap: {1} | Style: {2}"), this.RichTextBlock.GetHyperlinkCount(), this.WrapTextBlock.GetHyperlinkCount(), this.StyleTextBlock.GetHyperlinkCount()));
        this.RichTextBlock.OnHyperlinkClicked.BindUFunction(this, n"OnLinkClicked");
        this.WrapTextBlock.OnHyperlinkClicked.BindUFunction(this, n"OnLinkClicked");
        return;
    }
    UFUNCTION()
    bool OnLinkClicked(const FEUIHyperlinkInfo &in Info)
    {
        if (::HyperlinkActionHelper::HandleHyperlink(Info))
        {
            FText local_10;
            FText::FromString(Info.Param);
            FText::FromString(local_10);
            this.StatusText.SetText(FText::Format(FText::AsCultureInvariant("ACTION: {0} param={1}"), local_10, Info.Action));
            return true;
        }
        this.StatusText.SetText(FText::Format(FText::AsCultureInvariant("HREF: {0}"), FText::FromString(Info.Href)));
        return false;
    }
}

namespace UWidget_DebugHyperlink
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.WidgetType = UWidget_DebugHyperlink;
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

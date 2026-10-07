
namespace UWidget_ChatMessage
{
    const int ViewID = 0;

}
class UWidget_ChatMessage : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ChatMessage> ChatMessage;
    UPROPERTY()
    UEUITextBlock w_message;
    UPROPERTY()
    FGetEUIModelRef ChatMessageDelegate;

    UWidget_ChatMessage()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        if (this.w_message != nullptr)
        {
            this.w_message.OnHyperlinkClicked.BindUFunction(this, n"OnChatMessageHyperlinkClicked");
        }
        return;
    }
    UFUNCTION()
    bool OnChatMessageHyperlinkClicked(const FEUIHyperlinkInfo &in Info)
    {
        return ::ChatSystemHyperlinkRouter::Handle(Info, this);
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ChatMessage.Initialize(this, FName("VM_ChatMessage"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ChatMessageDelegate.IsBound())
        {
            this.ChatMessage.SetRef(this.ChatMessageDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ChatMessage
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

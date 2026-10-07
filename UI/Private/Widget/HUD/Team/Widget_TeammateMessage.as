
namespace UWidget_TeammateMessage
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_TeammateMessage : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TeammateMessageBubbleManager> TeammateMessage;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TeammateMessageBubble> TeammateMessageBubble;
    UPROPERTY()
    FGetEUIModelRef TeammateMessageDelegate;
    UPROPERTY()
    FGetEUIModelRef TeammateMessageBubbleDelegate;

    UWidget_TeammateMessage()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        if (this.TeammateMessage.IsValid())
        {
            this.TeammateMessageBubble.SetRef(this.TeammateMessage.opArrow().GetDisplayingBubble());
        }
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.TeammateMessage.Initialize(this, FName("VM_TeammateMessageBubbleManager"), EEUIWidgetRefModelCreationType(0), false);
        this.TeammateMessageBubble.Initialize(this, FName("VM_TeammateMessageBubble"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TeammateMessageDelegate.IsBound())
        {
            this.TeammateMessage.SetRef(this.TeammateMessageDelegate.Execute());
        }
        if (this.TeammateMessageBubbleDelegate.IsBound())
        {
            this.TeammateMessageBubble.SetRef(this.TeammateMessageBubbleDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TeammateMessage
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

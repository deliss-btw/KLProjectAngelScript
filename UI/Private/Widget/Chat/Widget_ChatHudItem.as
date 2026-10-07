
namespace UWidget_ChatHudItem
{
    const int ViewID = 0;

}
class UWidget_ChatHudItem : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ChatHudLineItem> ChatItem;
    UPROPERTY()
    FGetEUIModelRef ChatItemDelegate;

    UWidget_ChatHudItem()
    {
        return;
    }
    UFUNCTION()
    void ChatItem_OnClick() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ChatItem.Initialize(this, FName("VM_ChatHudLineItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ChatItemDelegate.IsBound())
        {
            this.ChatItem.SetRef(this.ChatItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ChatHudItem
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

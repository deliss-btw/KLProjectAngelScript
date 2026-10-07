
namespace UWidget_ChatChannelTab
{
    const int ViewID = 0;

}
class UWidget_ChatChannelTab : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ChatChannelTab> ChatChannelTab;
    UPROPERTY()
    FGetEUIModelRef ChatChannelTabDelegate;

    UWidget_ChatChannelTab()
    {
        return;
    }
    UFUNCTION()
    void OnTabBtnClicked()
    {
        XLog(ELog(74), FString().Append("OnTabBtnClicked: ").Append(GetTabChannelID()));
        if (this.ChatChannelTab.IsValid())
        {
            FMsg_ChatChannelTabSelected local_16;
            FEUIModelRef local_14;
            local_14;
            FEUIMessageBus::Publish(EUIMessageBus);
            local_16.ParentType = this.ChatChannelTab.opArrow().GetParentType();
            local_16.SelectChannelID = this.ChatChannelTab.opArrow().GetTabChannelID();
        }
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ChatChannelTab.Initialize(this, FName("VM_ChatChannelTab"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ChatChannelTabDelegate.IsBound())
        {
            this.ChatChannelTab.SetRef(this.ChatChannelTabDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ChatChannelTab
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


namespace UWidget_MailBriefItem
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_MailBriefItem : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MailBriefItem> BriefItem;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SelectableItem> SelectableItem;
    UPROPERTY()
    FGetEUIModelRef BriefItemDelegate;
    UPROPERTY()
    FGetEUIModelRef SelectableItemDelegate;

    UWidget_MailBriefItem()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.BriefItem.Initialize(this, FName("VM_MailBriefItem"), EEUIWidgetRefModelCreationType(0), false);
        this.SelectableItem.Initialize(this, FName("VM_SelectableItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.BriefItemDelegate.IsBound())
        {
            this.BriefItem.SetRef(this.BriefItemDelegate.Execute());
        }
        if (this.SelectableItemDelegate.IsBound())
        {
            this.SelectableItem.SetRef(this.SelectableItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_MailBriefItem
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

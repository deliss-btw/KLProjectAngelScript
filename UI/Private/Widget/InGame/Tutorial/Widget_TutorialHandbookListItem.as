
namespace UWidget_TutorialHandbookListItem
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_TutorialHandbookListItem : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TutorialHandbookListItem> ListItemVM;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SelectableItem> SelectableItem;
    UPROPERTY()
    FGetEUIModelRef ListItemVMDelegate;
    UPROPERTY()
    FGetEUIModelRef SelectableItemDelegate;

    UWidget_TutorialHandbookListItem()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ListItemVM.Initialize(this, FName("VM_TutorialHandbookListItem"), EEUIWidgetRefModelCreationType(0), false);
        this.SelectableItem.Initialize(this, FName("VM_SelectableItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ListItemVMDelegate.IsBound())
        {
            this.ListItemVM.SetRef(this.ListItemVMDelegate.Execute());
        }
        if (this.SelectableItemDelegate.IsBound())
        {
            this.SelectableItem.SetRef(this.SelectableItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TutorialHandbookListItem
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


namespace UWidget_MenuBarEntry
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_MenuBarEntry : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SelectableItem> SelectableItem;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Text> Text;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MenuBarItem> MenuBarItem;
    UPROPERTY()
    FGetEUIModelRef SelectableItemDelegate;
    UPROPERTY()
    FGetEUIModelRef TextDelegate;
    UPROPERTY()
    FGetEUIModelRef MenuBarItemDelegate;

    UWidget_MenuBarEntry()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SelectableItem.Initialize(this, FName("VM_SelectableItem"), EEUIWidgetRefModelCreationType(0), false);
        this.Text.Initialize(this, FName("VM_Text"), EEUIWidgetRefModelCreationType(0), true);
        this.MenuBarItem.Initialize(this, FName("VM_MenuBarItem"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SelectableItemDelegate.IsBound())
        {
            this.SelectableItem.SetRef(this.SelectableItemDelegate.Execute());
        }
        if (this.TextDelegate.IsBound())
        {
            this.Text.SetRef(this.TextDelegate.Execute());
        }
        if (this.MenuBarItemDelegate.IsBound())
        {
            this.MenuBarItem.SetRef(this.MenuBarItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_MenuBarEntry
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

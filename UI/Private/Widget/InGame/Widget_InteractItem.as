
namespace UWidget_InteractItem
{
    const int ViewID = 0;

}
class UWidget_InteractItem : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_InteractItem> InteractItem;
    UPROPERTY()
    FGetEUIModelRef InteractItemDelegate;

    UWidget_InteractItem()
    {
        return;
    }
    UFUNCTION()
    FText InteractItem_DisplayText() const
    {
        FVM_InteractItem& local_2;
        FText local_12 = local_2 ? local_2.GetDisplayText() : FText();
        return local_12;
    }
    UFUNCTION()
    void InteractItem_OnButtonClicked() const
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
        this.InteractItem.Initialize(this, FName("VM_InteractItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.InteractItemDelegate.IsBound())
        {
            this.InteractItem.SetRef(this.InteractItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_InteractItem
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

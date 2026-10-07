
namespace UWidget_ForgeWeaponItemUnlockCondItem
{
    const int ViewID = 0;

}
class UWidget_ForgeWeaponItemUnlockCondItem : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ForgeWeaponItemUnlockCondItem> UnlockCondItem;
    UPROPERTY()
    FGetEUIModelRef UnlockCondItemDelegate;

    UWidget_ForgeWeaponItemUnlockCondItem()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.UnlockCondItem.Initialize(this, FName("VM_ForgeWeaponItemUnlockCondItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.UnlockCondItemDelegate.IsBound())
        {
            this.UnlockCondItem.SetRef(this.UnlockCondItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ForgeWeaponItemUnlockCondItem
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

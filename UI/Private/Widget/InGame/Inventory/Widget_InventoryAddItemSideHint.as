
namespace UWidget_InventoryAddItemSideHint
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_InventoryAddItemSideHint : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonSideHint_Small> CommonSideHint;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Lifetime> Lifetime;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ItemRarity> ItemRarity;
    UPROPERTY()
    FGetEUIModelRef CommonSideHintDelegate;
    UPROPERTY()
    FGetEUIModelRef LifetimeDelegate;
    UPROPERTY()
    FGetEUIModelRef ItemRarityDelegate;

    UWidget_InventoryAddItemSideHint()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CommonSideHint.Initialize(this, FName("VM_CommonSideHint_Small"), EEUIWidgetRefModelCreationType(0), false);
        this.Lifetime.Initialize(this, FName("VM_Lifetime"), EEUIWidgetRefModelCreationType(0), false);
        this.ItemRarity.Initialize(this, FName("VM_ItemRarity"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommonSideHintDelegate.IsBound())
        {
            this.CommonSideHint.SetRef(this.CommonSideHintDelegate.Execute());
        }
        if (this.LifetimeDelegate.IsBound())
        {
            this.Lifetime.SetRef(this.LifetimeDelegate.Execute());
        }
        if (this.ItemRarityDelegate.IsBound())
        {
            this.ItemRarity.SetRef(this.ItemRarityDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_InventoryAddItemSideHint
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

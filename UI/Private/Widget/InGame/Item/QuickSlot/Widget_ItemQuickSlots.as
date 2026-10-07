
namespace UWidget_ItemQuickSlots
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_ItemQuickSlots : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_InventoryQuickSlots> InventoryQuickSlots;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_InventoryQuickSlotsFocus> SlotsDefaultFocus;
    UPROPERTY()
    UWidget HoverArea;
    UPROPERTY()
    UWidget_ItemQuickSlot QuickSlot_Heal;
    UPROPERTY()
    UWidget_ItemQuickSlot QuickSlot_Attack_1;
    UPROPERTY()
    UWidget_ItemQuickSlot QuickSlot_Attack_2;
    UPROPERTY()
    UWidget_ItemQuickSlot QuickSlot_Mount;
    UPROPERTY()
    UWidget_ItemQuickSlot QuickSlot_Remnant;
    UPROPERTY()
    FGetEUIModelRef InventoryQuickSlotsDelegate;
    UPROPERTY()
    FGetEUIModelRef SlotsDefaultFocusDelegate;

    UWidget_ItemQuickSlots()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        if (!(this.InventoryQuickSlots))
        {
            FEUIModelRef local_4;
            this.InventoryQuickSlots = local_4;
        }
        return;
    }
    UFUNCTION()
    UWidget GetDesiredFocusWidget_Implementation() const
    {
        if (!(this.SlotsDefaultFocus))
        {
            return nullptr;
        }
        TDataObjectPtr<FItemQuickSlotConfig> local_28 = this.SlotsDefaultFocus.opArrow().GetQuickSlot();
        if (!(local_28))
        {
            return nullptr;
        }
        if (this.QuickSlot_Heal != nullptr && this.QuickSlot_Heal.IsSlot(local_28))
        {
            return this.QuickSlot_Heal;
        }
        if (this.QuickSlot_Attack_1 != nullptr && this.QuickSlot_Attack_1.IsSlot(local_28))
        {
            return this.QuickSlot_Attack_1;
        }
        if (this.QuickSlot_Attack_2 != nullptr && this.QuickSlot_Attack_2.IsSlot(local_28))
        {
            return this.QuickSlot_Attack_2;
        }
        if (this.QuickSlot_Mount != nullptr && this.QuickSlot_Mount.IsSlot(local_28))
        {
            return this.QuickSlot_Mount;
        }
        if (this.QuickSlot_Remnant != nullptr && this.QuickSlot_Remnant.IsSlot(local_28))
        {
            return this.QuickSlot_Remnant;
        }
        return nullptr;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.InventoryQuickSlots.Initialize(this, FName("VM_InventoryQuickSlots"), EEUIWidgetRefModelCreationType(0), true);
        this.SlotsDefaultFocus.Initialize(this, FName("VM_InventoryQuickSlotsFocus"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.InventoryQuickSlotsDelegate.IsBound())
        {
            this.InventoryQuickSlots.SetRef(this.InventoryQuickSlotsDelegate.Execute());
        }
        if (this.SlotsDefaultFocusDelegate.IsBound())
        {
            this.SlotsDefaultFocus.SetRef(this.SlotsDefaultFocusDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ItemQuickSlots
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

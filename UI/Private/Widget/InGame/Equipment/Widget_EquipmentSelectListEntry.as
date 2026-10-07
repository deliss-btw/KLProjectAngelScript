
namespace UWidget_EquipmentSelectListEntry
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_EquipmentSelectListEntry : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_EquipmentSelectListItem> EquipmentSelectListItem;
    UPROPERTY()
    FGetEUIModelRef EquipmentSelectListItemDelegate;

    UWidget_EquipmentSelectListEntry()
    {
        return;
    }
    UFUNCTION()
    FEUIModelRef EquipmentSelectListItem_EquipmentInfo() const
    {
        FVM_EquipmentSelectListItem& local_2;
        FEUIModelRef local_8;
        if (local_2)
        {
            local_8 = local_2.GetEquipmentInfo();
        }
        else
        {
            local_8 = FEUIModelRef();
        }
        return local_8;
    }
    UFUNCTION()
    void EquipmentSelectListItem_SelectEquipment() const
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
        this.EquipmentSelectListItem.Initialize(this, FName("VM_EquipmentSelectListItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.EquipmentSelectListItemDelegate.IsBound())
        {
            this.EquipmentSelectListItem.SetRef(this.EquipmentSelectListItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_EquipmentSelectListEntry
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

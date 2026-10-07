
namespace UWidget_AvatarEquipmenItem
{
    const int ViewID = 0;

}
class UWidget_AvatarEquipmenItem : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarEquipmentItem> AvatarEquipItemVM;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SelectableItem> Selectable;
    UPROPERTY()
    FGetEUIModelRef AvatarEquipItemVMDelegate;
    UPROPERTY()
    FGetEUIModelRef SelectableDelegate;

    UWidget_AvatarEquipmenItem()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.AvatarEquipItemVM.Initialize(this, FName("VM_AvatarEquipmentItem"), EEUIWidgetRefModelCreationType(0), false);
        this.Selectable.Initialize(this, FName("VM_SelectableItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.AvatarEquipItemVMDelegate.IsBound())
        {
            this.AvatarEquipItemVM.SetRef(this.AvatarEquipItemVMDelegate.Execute());
        }
        if (this.SelectableDelegate.IsBound())
        {
            this.Selectable.SetRef(this.SelectableDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AvatarEquipmenItem
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

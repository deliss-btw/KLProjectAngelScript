namespace UWidget_EquipmentTraitHoverEntry
{
    const int ViewID = 0;
}
namespace UWidget_EquipmentTraitHover
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_EquipmentTraitHoverEntry : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TraitDetailListItem> TraitDetailListItem;
    UPROPERTY()
    FGetEUIModelRef TraitDetailListItemDelegate;

    UWidget_EquipmentTraitHoverEntry()
    {
        return;
    }
    UFUNCTION()
    bool TraitDetailListItem_bIsCurrentLevel() const
    {
        bool local_5;
        FVM_TraitDetailListItem& local_2 = this.TraitDetailListItem.Get();
        if (local_2)
        {
            local_5 = local_2.GetbIsCurrentLevel();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.TraitDetailListItem.Initialize(this, FName("VM_TraitDetailListItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TraitDetailListItemDelegate.IsBound())
        {
            this.TraitDetailListItem.SetRef(this.TraitDetailListItemDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_EquipmentTraitHover : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TraitDetailList> TraitDetailList;
    UPROPERTY()
    FGetEUIModelRef TraitDetailListDelegate;

    UWidget_EquipmentTraitHover()
    {
        return;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> TraitDetailList_ListItems() const
    {
        FVM_TraitDetailList& local_2 = this.TraitDetailList.Get();
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetListItems());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.TraitDetailList.Initialize(this, FName("VM_TraitDetailList"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TraitDetailListDelegate.IsBound())
        {
            this.TraitDetailList.SetRef(this.TraitDetailListDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_EquipmentTraitHoverEntry
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.WidgetType = UWidget_EquipmentTraitHoverEntry;
    Result.ObservedModelChangesSubscriberCount = 0;
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
namespace UWidget_EquipmentTraitHover
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.WidgetType = UWidget_EquipmentTraitHover;
    Result.ObservedModelChangesSubscriberCount = 0;
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

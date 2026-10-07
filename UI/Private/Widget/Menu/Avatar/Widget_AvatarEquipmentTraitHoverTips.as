
namespace UWidget_AvatarEquipmentTraitHoverTips
{
    const int ViewID = 0;

}
class UWidget_AvatarEquipmentTraitHoverTips : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarEquipmentTraitHoverTips> TraitHoverTips;
    UPROPERTY()
    FGetEUIModelRef TraitHoverTipsDelegate;

    UWidget_AvatarEquipmentTraitHoverTips()
    {
        return;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> TraitHoverTips_ListItems() const
    {
        FVM_AvatarEquipmentTraitHoverTips& local_2;
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
        this.TraitHoverTips.Initialize(this, FName("VM_AvatarEquipmentTraitHoverTips"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TraitHoverTipsDelegate.IsBound())
        {
            this.TraitHoverTips.SetRef(this.TraitHoverTipsDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AvatarEquipmentTraitHoverTips
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

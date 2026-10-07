
namespace UWidget_EquipmentTraitInfo
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_EquipmentTraitInfo : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TraitInfo> TraitInfo;
    UPROPERTY()
    FGetEUIModelRef TraitInfoDelegate;

    UWidget_EquipmentTraitInfo()
    {
        return;
    }
    UFUNCTION()
    bool TraitInfo_bHighlight() const
    {
        FVM_TraitInfo& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbHighlight();
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
        this.TraitInfo.Initialize(this, FName("VM_TraitInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TraitInfoDelegate.IsBound())
        {
            this.TraitInfo.SetRef(this.TraitInfoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_EquipmentTraitInfo
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


namespace UWidget_EquipmentCompare
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_EquipmentCompare : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_EquipmentCompare> EquipmentCompare;
    UPROPERTY()
    FGetEUIModelRef EquipmentCompareDelegate;

    UWidget_EquipmentCompare()
    {
        return;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> EquipmentCompare_CompareAttributes() const
    {
        FVM_EquipmentCompare& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetCompareAttributes());
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
        this.EquipmentCompare.Initialize(this, FName("VM_EquipmentCompare"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.EquipmentCompareDelegate.IsBound())
        {
            this.EquipmentCompare.SetRef(this.EquipmentCompareDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_EquipmentCompare
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

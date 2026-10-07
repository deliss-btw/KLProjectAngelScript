
namespace UWidget_EquipmentSelectDetail
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_EquipmentSelectDetail : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_EquipmentSelectDetail> EquipmentSelectDetail;
    UPROPERTY()
    FGetEUIModelRef EquipmentSelectDetailDelegate;

    UWidget_EquipmentSelectDetail()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.EquipmentSelectDetail.Initialize(this, FName("VM_EquipmentSelectDetail"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.EquipmentSelectDetailDelegate.IsBound())
        {
            this.EquipmentSelectDetail.SetRef(this.EquipmentSelectDetailDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_EquipmentSelectDetail
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

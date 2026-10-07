
namespace UWidget_EquipmentInfo
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_EquipmentInfo : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_EquipmentInfo> EquipmentInfo;
    UPROPERTY()
    FGetEUIModelRef EquipmentInfoDelegate;

    UWidget_EquipmentInfo()
    {
        return;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> EquipmentInfo_EquipmentTraits() const
    {
        FVM_EquipmentInfo& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetEquipmentTraits());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> EquipmentInfo_EquipmentAttributes() const
    {
        FVM_EquipmentInfo& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetEquipmentAttributes());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    bool EquipmentInfo_bShowDescription() const
    {
        FVM_EquipmentInfo& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbShowDescription();
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
        this.EquipmentInfo.Initialize(this, FName("VM_EquipmentInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.EquipmentInfoDelegate.IsBound())
        {
            this.EquipmentInfo.SetRef(this.EquipmentInfoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_EquipmentInfo
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


namespace UWidget_ItemHoverTips
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_ItemHoverTips : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_EquipHoverTips> EquipHoverTips;
    UPROPERTY()
    FGetEUIModelRef EquipHoverTipsDelegate;

    UWidget_ItemHoverTips()
    {
        return;
    }
    UFUNCTION()
    void OnClickGoTo()
    {
        if (this.EquipHoverTips.IsValid())
        {
            OnClickGoTo();
        }
        return;
    }
    UFUNCTION()
    void EquipHoverTips_ExecuteOnClickGoTo() const
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
        this.EquipHoverTips.Initialize(this, FName("VM_EquipHoverTips"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.EquipHoverTipsDelegate.IsBound())
        {
            this.EquipHoverTips.SetRef(this.EquipHoverTipsDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ItemHoverTips
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

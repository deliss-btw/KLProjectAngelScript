
namespace UWidget_CommissionBadgeItem
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommissionBadgeItem : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommissionBadgeItem> CommissionFinish;
    UPROPERTY()
    FGetEUIModelRef CommissionFinishDelegate;

    UWidget_CommissionBadgeItem()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CommissionFinish.Initialize(this, FName("VM_CommissionBadgeItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommissionFinishDelegate.IsBound())
        {
            this.CommissionFinish.SetRef(this.CommissionFinishDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommissionBadgeItem
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

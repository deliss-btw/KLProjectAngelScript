
namespace UWidget_CommissionRewardInfo
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommissionRewardInfo : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommissionRewardInfo> CommissionRewardInfo;
    UPROPERTY()
    FGetEUIModelRef CommissionRewardInfoDelegate;

    UWidget_CommissionRewardInfo()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CommissionRewardInfo.Initialize(this, FName("VM_CommissionRewardInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommissionRewardInfoDelegate.IsBound())
        {
            this.CommissionRewardInfo.SetRef(this.CommissionRewardInfoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommissionRewardInfo
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

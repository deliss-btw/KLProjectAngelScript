
namespace UWidget_CommissionEntry
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommissionEntry : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommissionInfo> CommissionInfo;
    UPROPERTY()
    FGetEUIModelRef CommissionInfoDelegate;

    UWidget_CommissionEntry()
    {
        return;
    }
    UFUNCTION()
    FEUIModelRef CommissionInfo_CommissionRewardList() const
    {
        FVM_CommissionInfo& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetCommissionRewardList() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    FEUIModelRef CommissionInfo_CommissionFirstTimeRewardList() const
    {
        FVM_CommissionInfo& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetCommissionFirstTimeRewardList() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    void CommissionInfo_StartCommission() const
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
        this.CommissionInfo.Initialize(this, FName("VM_CommissionInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommissionInfoDelegate.IsBound())
        {
            this.CommissionInfo.SetRef(this.CommissionInfoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommissionEntry
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

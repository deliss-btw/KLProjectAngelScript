
namespace UWidget_CommissionDetail
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommissionDetail : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommissionDetail> CommissionDetail;
    UPROPERTY()
    FEUIActionBinding ViewLocation;
    UPROPERTY()
    FGetEUIModelRef CommissionDetailDelegate;

    UWidget_CommissionDetail()
    {
        return;
    }
    UFUNCTION()
    void CommissionDetail_OnViewLocationButtonClicked() const
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
        this.CommissionDetail.Initialize(this, FName("VM_CommissionDetail"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommissionDetailDelegate.IsBound())
        {
            this.CommissionDetail.SetRef(this.CommissionDetailDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommissionDetail
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


namespace UWidget_SubmitRechargeTier
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_SubmitRechargeTier : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SubmitRechargeTier> RechargeTier;
    UPROPERTY()
    FGetEUIModelRef RechargeTierDelegate;

    UWidget_SubmitRechargeTier()
    {
        return;
    }
    UFUNCTION()
    void OnTierClicked()
    {
        if (!(this.RechargeTier.IsValid()))
        {
            return;
        }
        FKLPayResultDelegate local_5;
        local_5.BindUFunction(this, n"OnKLPayResult");
        int local_6 = GetPriceAmount();
        UMiHoYoSDKHelper::KLPay(FString().Append(GetTierId()), local_5);
        return;
    }
    UFUNCTION()
    void OnKLPayResult(const FKLPayResult &in KLPayResult)
    {
        if (!(this.RechargeTier.IsValid()))
        {
            return;
        }
        else
        {
            if (KLPayResult.bSuccess)
            {
                GrantVoucherReward();
                return;
            }
        }
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.RechargeTier.Initialize(this, FName("VM_SubmitRechargeTier"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.RechargeTierDelegate.IsBound())
        {
            this.RechargeTier.SetRef(this.RechargeTierDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_SubmitRechargeTier
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

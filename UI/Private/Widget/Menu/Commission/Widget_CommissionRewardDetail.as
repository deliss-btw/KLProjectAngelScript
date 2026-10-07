
namespace UWidget_CommissionRewardDetail
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommissionRewardDetail : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonRewardList> Rewards;
    UPROPERTY()
    FConfigVM_CommonRewardList RewardsConfig;
    UPROPERTY()
    FGetEUIModelRef RewardsDelegate;

    UWidget_CommissionRewardDetail()
    {
        return;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> Rewards_Rewards() const
    {
        FVM_CommonRewardList& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetRewards());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    void Rewards_GotoCommissionRewardDetail() const
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
        this.Rewards.Initialize(this, FName("VM_CommonRewardList"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.RewardsDelegate.IsBound())
        {
            this.Rewards.SetRef(this.RewardsDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommissionRewardDetail
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

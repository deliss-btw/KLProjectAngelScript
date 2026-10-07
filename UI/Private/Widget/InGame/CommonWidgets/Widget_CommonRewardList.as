
namespace UWidget_CommonRewardList
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommonRewardList : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonRewardList> RewardListModel;
    UPROPERTY()
    FConfigVM_CommonRewardList RewardListModelConfig;
    UPROPERTY()
    FGetEUIModelRef RewardListModelDelegate;

    UWidget_CommonRewardList()
    {
        return;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> RewardListModel_Rewards() const
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
    void RewardListModel_GotoCommissionRewardDetail() const
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
        this.RewardListModel.Initialize(this, FName("VM_CommonRewardList"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.RewardListModelDelegate.IsBound())
        {
            this.RewardListModel.SetRef(this.RewardListModelDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommonRewardList
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


namespace UWidget_MonsterWeaknessInfo
{
    const int ViewID = 0;
}
namespace UWidget_MonsterWeaknessInfoTips
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_MonsterWeaknessInfo : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MonsterWeaknessInfo> MonsterWeaknessInfo;
    UPROPERTY()
    FConfigVM_MonsterWeaknessInfo MonsterWeaknessInfoConfig;
    UPROPERTY()
    FGetEUIModelRef MonsterWeaknessInfoDelegate;

    UWidget_MonsterWeaknessInfo()
    {
        return;
    }
    UFUNCTION()
    void MonsterWeaknessInfo_GotoCommissionRewardDetail() const
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
        this.MonsterWeaknessInfo.Initialize(this, FName("VM_MonsterWeaknessInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MonsterWeaknessInfoDelegate.IsBound())
        {
            this.MonsterWeaknessInfo.SetRef(this.MonsterWeaknessInfoDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_MonsterWeaknessInfoTips : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MonsterWeaknessInfo> MonsterWeaknessInfo;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonRewardList> RewardList;
    UPROPERTY()
    FConfigVM_MonsterWeaknessInfo MonsterWeaknessInfoConfig;
    UPROPERTY()
    FConfigVM_CommonRewardList RewardListConfig;
    UPROPERTY()
    FGetEUIModelRef MonsterWeaknessInfoDelegate;
    UPROPERTY()
    FGetEUIModelRef RewardListDelegate;

    UWidget_MonsterWeaknessInfoTips()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        if (this.MonsterWeaknessInfo)
        {
            this.RewardList.SetRef(this.MonsterWeaknessInfo.opArrow().GetRewardList());
        }
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        if (this.MonsterWeaknessInfo)
        {
            this.RewardList.SetRef(this.MonsterWeaknessInfo.opArrow().GetRewardList());
        }
        return;
    }
    UFUNCTION()
    void MonsterWeaknessInfo_GotoCommissionRewardDetail() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> RewardList_Rewards() const
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
    void RewardList_GotoCommissionRewardDetail() const
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
        this.MonsterWeaknessInfo.Initialize(this, FName("VM_MonsterWeaknessInfo"), EEUIWidgetRefModelCreationType(0), false);
        this.RewardList.Initialize(this, FName("VM_CommonRewardList"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MonsterWeaknessInfoDelegate.IsBound())
        {
            this.MonsterWeaknessInfo.SetRef(this.MonsterWeaknessInfoDelegate.Execute());
        }
        if (this.RewardListDelegate.IsBound())
        {
            this.RewardList.SetRef(this.RewardListDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_MonsterWeaknessInfo
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
namespace UWidget_MonsterWeaknessInfoTips
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

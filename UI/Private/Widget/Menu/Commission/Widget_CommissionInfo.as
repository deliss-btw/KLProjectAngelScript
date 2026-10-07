
namespace UWidget_CommissionInfo
{
    const int ViewID = 0;
}
namespace UWidget_CommissionInfoEntry
{
    const int ViewID = 0;
}
namespace UWidget_CommissionInfoAndMonsterInfo
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommissionInfo : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommissionInfo> CommissionInfo;
    UPROPERTY()
    FGetEUIModelRef CommissionInfoDelegate;

    UWidget_CommissionInfo()
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

UCLASS(Abstract)
class UWidget_CommissionInfoEntry : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SelectableItem> SelectableItem;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommissionInfo> CommissionInfo;
    UPROPERTY()
    FGetEUIModelRef SelectableItemDelegate;
    UPROPERTY()
    FGetEUIModelRef CommissionInfoDelegate;

    UWidget_CommissionInfoEntry()
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
        this.SelectableItem.Initialize(this, FName("VM_SelectableItem"), EEUIWidgetRefModelCreationType(0), false);
        this.CommissionInfo.Initialize(this, FName("VM_CommissionInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SelectableItemDelegate.IsBound())
        {
            this.SelectableItem.SetRef(this.SelectableItemDelegate.Execute());
        }
        if (this.CommissionInfoDelegate.IsBound())
        {
            this.CommissionInfo.SetRef(this.CommissionInfoDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_CommissionInfoAndMonsterInfo : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommissionInfo> CommissionInfo;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MonsterInfo> MonsterInfo;
    UPROPERTY()
    FGetEUIModelRef CommissionInfoDelegate;
    UPROPERTY()
    FGetEUIModelRef MonsterInfoDelegate;

    UWidget_CommissionInfoAndMonsterInfo()
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
        this.MonsterInfo.Initialize(this, FName("VM_MonsterInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommissionInfoDelegate.IsBound())
        {
            this.CommissionInfo.SetRef(this.CommissionInfoDelegate.Execute());
        }
        if (this.MonsterInfoDelegate.IsBound())
        {
            this.MonsterInfo.SetRef(this.MonsterInfoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommissionInfo
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
namespace UWidget_CommissionInfoEntry
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
namespace UWidget_CommissionInfoAndMonsterInfo
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

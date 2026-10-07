
namespace UWidget_CommissionMonsterInfo
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommissionMonsterInfo : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommissionMonsterInfo> CommissionMonsterInfo;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_DynamicWidgetSelector> MonsterSelector;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MonsterInfo> SelectedMonsterInfo;
    UPROPERTY()
    FGetEUIModelRef CommissionMonsterInfoDelegate;
    UPROPERTY()
    FGetEUIModelRef MonsterSelectorDelegate;
    UPROPERTY()
    FGetEUIModelRef SelectedMonsterInfoDelegate;

    UWidget_CommissionMonsterInfo()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        if (this.CommissionMonsterInfo)
        {
            this.MonsterSelector.SetRef(this.CommissionMonsterInfo.opArrow().GetMonsterSelector());
            if (this.MonsterSelector)
            {
                this.SelectedMonsterInfo.SetRef(TEUIModelRef<FVM_MonsterInfo>(FEUIModelContainer::GetModel(this.MonsterSelector.opArrow().GetSelectedModel()).opCall()));
            }
        }
        return;
    }
    UFUNCTION()
    void MonsterSelector_SelectPreviousModel() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void MonsterSelector_SelectNextModel() const
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
        this.CommissionMonsterInfo.Initialize(this, FName("VM_CommissionMonsterInfo"), EEUIWidgetRefModelCreationType(0), false);
        this.MonsterSelector.Initialize(this, FName("VM_DynamicWidgetSelector"), EEUIWidgetRefModelCreationType(0), true);
        this.SelectedMonsterInfo.Initialize(this, FName("VM_MonsterInfo"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommissionMonsterInfoDelegate.IsBound())
        {
            this.CommissionMonsterInfo.SetRef(this.CommissionMonsterInfoDelegate.Execute());
        }
        if (this.MonsterSelectorDelegate.IsBound())
        {
            this.MonsterSelector.SetRef(this.MonsterSelectorDelegate.Execute());
        }
        if (this.SelectedMonsterInfoDelegate.IsBound())
        {
            this.SelectedMonsterInfo.SetRef(this.SelectedMonsterInfoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommissionMonsterInfo
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

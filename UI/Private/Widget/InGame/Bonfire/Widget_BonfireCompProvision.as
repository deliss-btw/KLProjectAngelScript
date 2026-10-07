
namespace UWidget_BonfireCompProvision
{
    const int ViewID = 0;

}
class UWidget_BonfireCompProvision : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_BonfirePage_Supply> BonfirePage;
    UPROPERTY()
    FGetEUIModelRef BonfirePageDelegate;

    UWidget_BonfireCompProvision()
    {
        return;
    }
    UFUNCTION()
    FEUIModelContainer BonfirePage_HoverModels() const
    {
        FVM_BonfirePage_Supply& local_2;
        FEUIModelContainer local_32 = local_2 ? local_2.GetHoverModels() : FEUIModelContainer();
        return local_32;
    }
    UFUNCTION()
    TSoftClassPtr<UUserWidget> BonfirePage_HoverWidgetClass() const
    {
        FVM_BonfirePage_Supply& local_2;
        TSoftClassPtr<UUserWidget> local_34;
        if (local_2)
        {
            local_34 = local_2.GetHoverWidgetClass();
        }
        else
        {
            local_34 = TSoftClassPtr<UUserWidget>();
        }
        return local_34;
    }
    UFUNCTION()
    int BonfirePage_BonfireState() const
    {
        FVM_BonfirePage_Supply& local_2;
        return local_2 ? local_2.GetBonfireState() : 0;
    }
    UFUNCTION()
    FText BonfirePage_RemainedRefillTimes() const
    {
        FVM_BonfirePage_Supply& local_2;
        FText local_12 = local_2 ? local_2.GetRemainedRefillTimes() : FText();
        return local_12;
    }
    UFUNCTION()
    FText BonfirePage_RemainedRefillTimesMax() const
    {
        FVM_BonfirePage_Supply& local_2;
        FText local_12 = local_2 ? local_2.GetRemainedRefillTimesMax() : FText();
        return local_12;
    }
    UFUNCTION()
    FText BonfirePage_ResidualText() const
    {
        FVM_BonfirePage_Supply& local_2;
        FText local_12 = local_2 ? local_2.GetResidualText() : FText();
        return local_12;
    }
    UFUNCTION()
    FText BonfirePage_RefillCostHint() const
    {
        FVM_BonfirePage_Supply& local_2;
        FText local_12 = local_2 ? local_2.GetRefillCostHint() : FText();
        return local_12;
    }
    UFUNCTION()
    FText BonfirePage_HintText() const
    {
        FVM_BonfirePage_Supply& local_2;
        FText local_12 = local_2 ? local_2.GetHintText() : FText();
        return local_12;
    }
    UFUNCTION()
    FText BonfirePage_ButtonText() const
    {
        FVM_BonfirePage_Supply& local_2;
        FText local_12 = local_2 ? local_2.GetButtonText() : FText();
        return local_12;
    }
    UFUNCTION()
    FText BonfirePage_ConsumeKeyText() const
    {
        FVM_BonfirePage_Supply& local_2;
        FText local_12 = local_2 ? local_2.GetConsumeKeyText() : FText();
        return local_12;
    }
    UFUNCTION()
    FText BonfirePage_SupplyHintText() const
    {
        FVM_BonfirePage_Supply& local_2;
        FText local_12 = local_2 ? local_2.GetSupplyHintText() : FText();
        return local_12;
    }
    UFUNCTION()
    float32 BonfirePage_ConsumeOpacity() const
    {
        FVM_BonfirePage_Supply& local_2;
        return local_2 ? local_2.GetConsumeOpacity() : 0.0f;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> BonfirePage_ItemRefs() const
    {
        FVM_BonfirePage_Supply& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetItemRefs());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    float32 BonfirePage_FillPercent() const
    {
        FVM_BonfirePage_Supply& local_2;
        return local_2 ? local_2.GetFillPercent() : 0.0f;
    }
    UFUNCTION()
    void BonfirePage_GenerateHoverModel() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void BonfirePage_OnAddButtonClicked() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void BonfirePage_OnConfirmButtonClicked() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void BonfirePage_OnCancelButtonClicked() const
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
        this.BonfirePage.Initialize(this, FName("VM_BonfirePage_Supply"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.BonfirePageDelegate.IsBound())
        {
            this.BonfirePage.SetRef(this.BonfirePageDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_BonfireCompProvision
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

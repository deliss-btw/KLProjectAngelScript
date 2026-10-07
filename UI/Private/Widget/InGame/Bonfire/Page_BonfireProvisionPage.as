
namespace UPage_BonfireProvisionPage
{
    const int ViewID = 0;

}
class UPage_BonfireProvisionPage : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Page> Page;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_BonfirePage_Supply> BonfirePage;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_BonfireProvisionPage> BonfireProvisionPage;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;
    UPROPERTY()
    FGetEUIModelRef BonfirePageDelegate;
    UPROPERTY()
    FGetEUIModelRef BonfireProvisionPageDelegate;

    UPage_BonfireProvisionPage()
    {
        return;
    }
    UFUNCTION()
    void Page_ClosePage() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Page_CloseGroup() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
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
    int BonfireProvisionPage_CoinsCost() const
    {
        FVM_BonfireProvisionPage& local_2;
        return local_2 ? local_2.GetCoinsCost() : 0;
    }
    UFUNCTION()
    TEUIModelRef<FVM_CommonConsume> BonfireProvisionPage_CoinsConsume() const
    {
        FVM_BonfireProvisionPage& local_2;
        TEUIModelRef<FVM_CommonConsume> local_10;
        if (local_2)
        {
            local_10 = local_2.GetCoinsConsume();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_CommonConsume>();
        }
        return local_10;
    }
    UFUNCTION()
    TEUIModelRef<FVM_CommonItemBar> BonfireProvisionPage_CoinsAmountBar() const
    {
        FVM_BonfireProvisionPage& local_2;
        TEUIModelRef<FVM_CommonItemBar> local_10;
        if (local_2)
        {
            local_10 = local_2.GetCoinsAmountBar();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_CommonItemBar>();
        }
        return local_10;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Page.Initialize(this, FName("VM_Page"), EEUIWidgetRefModelCreationType(0), false);
        this.BonfirePage.Initialize(this, FName("VM_BonfirePage_Supply"), EEUIWidgetRefModelCreationType(0), false);
        this.BonfireProvisionPage.Initialize(this, FName("VM_BonfireProvisionPage"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PageDelegate.IsBound())
        {
            this.Page.SetRef(this.PageDelegate.Execute());
        }
        if (this.BonfirePageDelegate.IsBound())
        {
            this.BonfirePage.SetRef(this.BonfirePageDelegate.Execute());
        }
        if (this.BonfireProvisionPageDelegate.IsBound())
        {
            this.BonfireProvisionPage.SetRef(this.BonfireProvisionPageDelegate.Execute());
        }
        return;
    }
}

namespace UPage_BonfireProvisionPage
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

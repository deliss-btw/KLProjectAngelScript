
namespace UWidget_Recharge
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_Recharge : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MenuPage> MenuPage;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Page> Page;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_GovReviewCharge> GovReviewCharge;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ShopPanel> ShopPanel;
    UPROPERTY()
    FConfigVM_MenuPage MenuPageConfig;
    UPROPERTY()
    FConfigVM_GovReviewCharge GovReviewChargeConfig;
    UPROPERTY()
    FConfigVM_ShopPanel ShopPanelConfig;
    UPROPERTY()
    FGetEUIModelRef MenuPageDelegate;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;
    UPROPERTY()
    FGetEUIModelRef GovReviewChargeDelegate;
    UPROPERTY()
    FGetEUIModelRef ShopPanelDelegate;

    UWidget_Recharge()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        if (!(this.GovReviewCharge))
        {
            this.GovReviewCharge.SetRef(TEUIModelRef<FVM_GovReviewCharge>(::FVM_GovReviewCharge::Create(this)));
        }
        bool local_1 = !(this.ShopPanel) && this.GovReviewCharge.IsValid();
        if (!(local_1))
        {
            local_1 = false;
        }
        else
        {
            TEUIModelRef<FVM_ShopPanel> local_8;
            local_8.GetShopPanel();
            local_1 = local_8.IsValid();
        }
        if (local_1)
        {
            TEUIModelRef<FVM_ShopPanel> local_8;
            local_8.GetShopPanel();
            this.ShopPanel.SetRef(local_8);
        }
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
    TEUIModelRef<FVM_ShopPanel> GovReviewCharge_ShopPanel() const
    {
        FVM_GovReviewCharge& local_2;
        TEUIModelRef<FVM_ShopPanel> local_10;
        if (local_2)
        {
            local_10 = local_2.GetShopPanel();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_ShopPanel>();
        }
        return local_10;
    }
    UFUNCTION()
    void GovReviewCharge_OnTabSelected(const int Index) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Index);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void ShopPanel_OnShopCategorySelected(const int Index) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Index);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void ShopPanel_OnShopGoodsItemSelected(const TEUIModelRef<FVM_ShopGoodsItem> &inout Item) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Item);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void ShopPanel_Purchase() const
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
        this.MenuPage.Initialize(this, FName("VM_MenuPage"), EEUIWidgetRefModelCreationType(0), false);
        this.Page.Initialize(this, FName("VM_Page"), EEUIWidgetRefModelCreationType(0), false);
        this.GovReviewCharge.Initialize(this, FName("VM_GovReviewCharge"), EEUIWidgetRefModelCreationType(0), false);
        this.ShopPanel.Initialize(this, FName("VM_ShopPanel"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MenuPageDelegate.IsBound())
        {
            this.MenuPage.SetRef(this.MenuPageDelegate.Execute());
        }
        if (this.PageDelegate.IsBound())
        {
            this.Page.SetRef(this.PageDelegate.Execute());
        }
        if (this.GovReviewChargeDelegate.IsBound())
        {
            this.GovReviewCharge.SetRef(this.GovReviewChargeDelegate.Execute());
        }
        if (this.ShopPanelDelegate.IsBound())
        {
            this.ShopPanel.SetRef(this.ShopPanelDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_Recharge
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

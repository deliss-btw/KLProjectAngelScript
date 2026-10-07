
namespace UWidget_ShopPanel
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_ShopPanel : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ShopPanel> ShopPanel;
    UPROPERTY()
    FConfigVM_ShopPanel ShopPanelConfig;
    UPROPERTY()
    FGetEUIModelRef ShopPanelDelegate;

    UWidget_ShopPanel()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
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
        this.ShopPanel.Initialize(this, FName("VM_ShopPanel"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ShopPanelDelegate.IsBound())
        {
            this.ShopPanel.SetRef(this.ShopPanelDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ShopPanel
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

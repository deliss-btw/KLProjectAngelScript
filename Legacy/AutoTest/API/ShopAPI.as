namespace AutoTest::API::ShopAPI
{
TEUIModelRef<FVM_ShopPanel> GetShopViewModel()
{
    UWidget_ShopPanel local_28;
    TEUIModelRef<FVM_ShopPanel> local_2;
    TArray<UWidget> local_6;
    KLAutomation::GetAllWidgetsOfClass(local_6, UWidget_ShopPanel, false);
    ThrowIf(local_6.IsEmpty(), "Can't get ShopViewModel, check if the Shop Widget is open.");
    for (auto local_24 : local_6)
    {
        local_28 = Cast<UWidget_ShopPanel>(local_24);
        ThrowIf(local_28, !((local_28 != nullptr)));
        if (local_28.ShopPanel.Get())
        {
            TEUIModelRef<FVM_ShopPanel> local_30;
            local_30;
            local_2 = local_30;
            break;
        }
    }
    return local_2;
}
void PerformPurchase()
{
    TEUIModelRef<FVM_ShopPanel> local_2 = AutoTest::API::ShopAPI::GetShopViewModel();
    bool local_5 = !(local_2);
    ThrowIf(local_5, "Can't get ShopViewModel, check if the Shop Widget is open.");
    local_2.Get().Purchase();
    return;
}
FString GetCurrentSelectedGoodsName()
{
    TEUIModelRef<FVM_ShopPanel> local_2 = AutoTest::API::ShopAPI::GetShopViewModel();
    bool local_5 = !(local_2);
    ThrowIf(local_5, "Can't get ShopViewModel, check if the Shop Widget is open.");
    TEUIModelRef<FVM_ShopGoodsItem> local_10 = local_2.Get().GetSelectedGoodsItem();
    TEUIModelRef<FVM_ShopGoodsItem> local_8;
    ThrowIf(!(local_8), "Can't get SelectedGoodsItem, check if the Shop Widget is open.");
    ThrowIf(!(local_8.IsValid()), "SelectedGoodsItem is invalid.");
    ThrowIf(!(local_8.Get().GetItem().IsValid()), "SelectedGoodsItem has no Item.");
    FName local_14 = local_8.Get().GetItem().Get().GetItemConfig().GetDataName();
    return local_14.ToString();
}
void OpenShopPage(const TDataObjectPtr<FShopConfig> &inout ShopConfig)
{
    bool local_1 = !(ShopConfig);
    ThrowIf(local_1, "ShopConfig is invalid.");
    APlayerController local_6 = FASCommonUtils::GetLocalPlayerController();
    if (local_6 != nullptr)
    {
        FShopPanelModelData local_30;
        local_30.ShopConfig = ShopConfig;
        Make local_68;
        FEUIWidget::AddWidgetWithModelContainer(local_6.GetLocalPlayer(), GameplayTags::UI_Type_Shop, local_68.opImplConv());
        FString local_92 = "";
    }
    return;
}
void OpenShopPage(const FString &inout ShopConfigName)
{
    TDataObjectPtr<FShopConfig> local_24;
    TDataObjectIterator<FShopConfig> local_40;
    for (; local_40; )
    {
        if ((local_40.GetDataPtr().GetDataName() == ShopConfigName))
        {
            local_24 = local_40.GetDataPtr();
            break;
        }
        local_40.opPreInc();
    }
    ThrowIf(!(local_24), FString().Append("Can't find ShopConfig with name: ").Append(ShopConfigName));
    AutoTest::API::ShopAPI::OpenShopPage(local_24);
    return;
}
}

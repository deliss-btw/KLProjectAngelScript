
namespace AutoTest::API::ShopAPI
{
TEUIModelRef<FVM_ShopPanel> GetShopViewModel()
{
    // body not fully recovered вЂ” stub [unresolved-operand]
    TEUIModelRef<FVM_ShopPanel> __r; return __r;
}
void PerformPurchase()
{
    ThrowIf(!(AutoTest::API::ShopAPI::GetShopViewModel()), "Can't get ShopViewModel, check if the Shop Widget is open.");
    Purchase();
    return;
}
FString GetCurrentSelectedGoodsName()
{
    ThrowIf(!(AutoTest::API::ShopAPI::GetShopViewModel()), "Can't get ShopViewModel, check if the Shop Widget is open.");
    TEUIModelRef<FVM_ShopGoodsItem> local_10;
    local_10.GetSelectedGoodsItem();
    TEUIModelRef<FVM_ShopGoodsItem> local_8;
    bool local_5 = !(local_8);
    ThrowIf(local_5, "Can't get SelectedGoodsItem, check if the Shop Widget is open.");
    ThrowIf(!(local_8.IsValid()), "SelectedGoodsItem is invalid.");
    TEUIModelRef<FVM_Item> local_12;
    local_12.GetItem();
    ThrowIf(!(local_12.IsValid()), "SelectedGoodsItem has no Item.");
    local_12.GetItem();
    FName local_14 = GetItemConfig().GetDataName();
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

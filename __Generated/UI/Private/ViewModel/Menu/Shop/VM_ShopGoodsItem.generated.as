

struct FShopGoodsItemSelected : FEUIModelEvent
{
    FEUIModelEvent _base_FEUIModelEvent;

    FShopGoodsItemSelected()
    {
        FEUIModelEvent local_22 = FEUIModelEvent("", "FEUIModelRef");
        return;
    }
    void Broadcast(const FEUIModelRef &inout Arg0) const
    {
        Z__CastTemplate local_4;
        local_4.opCall().Broadcast(Arg0);
        return;
    }
}

namespace __FVM_ShopGoodsItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ShopGoodsItem> __ModelContainer_Require_FVM_ShopGoodsItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ShopGoodsItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ShopGoodsItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ShopGoodsItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ShopGoodsItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ShopGoodsItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

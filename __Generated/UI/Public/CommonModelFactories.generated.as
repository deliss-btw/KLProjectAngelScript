

struct FItemModelFactory
{
    UPROPERTY()
    TEUIModelRef<FM_ItemData> ItemDataModel;

    FItemModelFactory()
    {
        return;
    }
    FItemModelFactory(const TEUIModelRef<FM_ItemData> &inout InItemDataModel)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    void SetItemDataModel(const TEUIModelRef<FM_ItemData> &inout InItemDataModel)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    TEUIModelRef<FVM_Item> Product_FVM_Item(const UObject ContextObject) const
    {
        Product local_2;
        return TEUIModelRef<FVM_Item>(local_2.opImplConv());
    }
    TEUIModelRef<FVM_ItemAction> Product_FVM_ItemAction(const UObject ContextObject) const
    {
        Product local_2;
        return TEUIModelRef<FVM_ItemAction>(local_2.opImplConv());
    }
}

namespace __FItemModelFactoryHelperFunctions
{
UFUNCTION()
FEUIModelRef Product_FVM_Item(const FItemModelFactory &inout ModelFactory)
{
    return ModelFactory.Product_FVM_Item(GetCurrentWorld()).opImplConv();
}
UFUNCTION()
FEUIModelRef Product_FVM_ItemAction(const FItemModelFactory &inout ModelFactory)
{
    return ModelFactory.Product_FVM_ItemAction(GetCurrentWorld()).opImplConv();
}
}



struct FShopGoodsListConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FDataObjectPtr m_Category;
    UPROPERTY()
    TArray<FDataObjectPtr> m_GoodsList;


    TDataObjectPtr<FShopCategoryConfig> GetCategory() const property
    {
        TDataObjectPtr<FShopCategoryConfig> __r;
        return __r;
    }
    void SetCategory(const TDataObjectPtr<FShopCategoryConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FShopCategoryConfig>> local_2;
        this.m_Category = local_2;
        return;
    }
    const TArray<TDataObjectPtr<FShopGoodsConfig>> GetGoodsList() const property
    {
        const TArray<TDataObjectPtr<FShopGoodsConfig>> __r;
        return __r;
    }
    void SetGoodsList(const TArray<TDataObjectPtr<FShopGoodsConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FShopGoodsConfig>>> local_2;
        this.m_GoodsList = local_2;
        return;
    }
}


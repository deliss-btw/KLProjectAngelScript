

struct FShopConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FText DisplayName;
    UPROPERTY()
    FSoftBrush DisplayIcon;
    UPROPERTY()
    FDataObjectPtr m_UnlockCondition;
    UPROPERTY()
    TArray<FDataObjectPtr> m_ShowCostTypes;
    UPROPERTY()
    TArray<FDataObjectPtr> m_GoodsLists;


    const TDataObjectPtr<FServerConditionConfigBase> GetUnlockCondition() const property
    {
        const TDataObjectPtr<FServerConditionConfigBase> __r;
        return __r;
    }
    void SetUnlockCondition(const TDataObjectPtr<FServerConditionConfigBase> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FServerConditionConfigBase>> local_2;
        this.m_UnlockCondition = local_2;
        return;
    }
    const TArray<TDataObjectPtr<FItemConfig>> GetShowCostTypes() const property
    {
        const TArray<TDataObjectPtr<FItemConfig>> __r;
        return __r;
    }
    void SetShowCostTypes(const TArray<TDataObjectPtr<FItemConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FItemConfig>>> local_2;
        this.m_ShowCostTypes = local_2;
        return;
    }
    const TArray<TDataObjectPtr<FShopGoodsListConfig>> GetGoodsLists() const property
    {
        const TArray<TDataObjectPtr<FShopGoodsListConfig>> __r;
        return __r;
    }
    void SetGoodsLists(const TArray<TDataObjectPtr<FShopGoodsListConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FShopGoodsListConfig>>> local_2;
        this.m_GoodsLists = local_2;
        return;
    }
}


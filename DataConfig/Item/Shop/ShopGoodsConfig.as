

struct FShopGoodsConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FDataObjectPtr m_UnlockCondition;
    UPROPERTY()
    FDataObjectPtr m_Item;
    UPROPERTY()
    FDataObjectPtr m_RefreshRuleConfig;
    UPROPERTY()
    uint PersonalLimitCount;
    UPROPERTY()
    FDataObjectPtr m_CostItem;
    UPROPERTY()
    uint CostCount;


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
    TDataObjectPtr<FItemConfig> GetItem() const property
    {
        TDataObjectPtr<FItemConfig> __r;
        return __r;
    }
    void SetItem(const TDataObjectPtr<FItemConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FItemConfig>> local_2;
        this.m_Item = local_2;
        return;
    }
    TDataObjectPtr<FRefreshRuleConfig> GetRefreshRuleConfig() const property
    {
        TDataObjectPtr<FRefreshRuleConfig> __r;
        return __r;
    }
    void SetRefreshRuleConfig(const TDataObjectPtr<FRefreshRuleConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FRefreshRuleConfig>> local_2;
        this.m_RefreshRuleConfig = local_2;
        return;
    }
    TDataObjectPtr<FItemConfig> GetCostItem() const property
    {
        TDataObjectPtr<FItemConfig> __r;
        return __r;
    }
    void SetCostItem(const TDataObjectPtr<FItemConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FItemConfig>> local_2;
        this.m_CostItem = local_2;
        return;
    }
}


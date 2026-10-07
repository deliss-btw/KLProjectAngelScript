
namespace FM_ShopCategory
{
    const int ModelId = 0;

}
struct FM_ShopCategory : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    TDataObjectPtr<FShopCategoryConfig> m_Config;
    UPROPERTY()
    TArray<TEUIModelRef<FM_ShopGoods>> m_ShopGoods;

    FM_ShopCategory()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FM_ShopCategory(const FM_ShopCategory &inout Other)
    {
        this.m_Config = Other.m_Config;
        this.m_ShopGoods = Other.m_ShopGoods;
        return;
    }
    FM_ShopCategory& opAssign(const FM_ShopCategory &inout Other)
    {
        this.m_Config = Other.m_Config;
        return Other.m_ShopGoods;
    }
    FSoftBrush GetCategoryIcon() const
    {
        if (this.GetConfig())
        {
            return this.GetConfig().opArrow().DisplayIcon;
        }
        return FSoftBrush();
    }
    FText GetCategoryName() const
    {
        if (this.GetConfig())
        {
            return this.GetConfig().opArrow().DisplayName;
        }
        return FText();
    }
    TDataObjectPtr<FShopCategoryConfig> GetConfig() const property
    {
        TDataObjectPtr<FShopCategoryConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FShopCategoryConfig> GetModify_Config() property
    {
        TDataObjectPtr<FShopCategoryConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetConfig(const TDataObjectPtr<FShopCategoryConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Config = __Value;
        return;
    }
    TArray<TEUIModelRef<FM_ShopGoods>> GetShopGoods() const property
    {
        TArray<TEUIModelRef<FM_ShopGoods>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FM_ShopGoods>> GetModify_ShopGoods() property
    {
        TArray<TEUIModelRef<FM_ShopGoods>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetShopGoods(const TArray<TEUIModelRef<FM_ShopGoods>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ShopGoods = __Value;
        return;
    }
}

namespace FM_ShopCategory
{
FM_ShopCategory& Create(const UObject ContextObject)
{
    return FM_ShopCategory::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FM_ShopCategory CreateByManager(const UEUIManagerSubsystem Manager)
{
    FM_ShopCategory __r;
    TEUIModelRef<FM_ShopCategory> local_6 = TEUIModelRef<FM_ShopCategory>(EUIInternal::MakeModelWithManager(Manager, FM_ShopCategory::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_ShopCategory;
}
int __IndexOf_Config()
{
    return 0;
}
int __IndexOf_ShopGoods()
{
    return 1;
}
}

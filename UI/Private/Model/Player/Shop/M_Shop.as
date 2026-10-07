
namespace FM_Shop
{
    const int ModelId = 0;

}
struct FM_Shop : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    TDataObjectPtr<FShopConfig> m_ShopConfig;
    UPROPERTY()
    TArray<TEUIModelRef<FM_ShopCategory>> m_ShopCategories;

    FM_Shop()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FM_Shop' by default constructor.");
        return;
    }
    FM_Shop(const FM_Shop &inout Other)
    {
        this.m_ShopConfig = Other.m_ShopConfig;
        this.m_ShopCategories = Other.m_ShopCategories;
        return;
    }
    FM_Shop(const TDataObjectPtr<FShopConfig> &inout InShopConfig)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetShopConfig(InShopConfig);
        return;
    }
    FM_Shop& opAssign(const FM_Shop &inout Other)
    {
        this.m_ShopConfig = Other.m_ShopConfig;
        return Other.m_ShopCategories;
    }
    void PostConstruct()
    {
        FMS_ShopGoodsData& local_2 = ::FMS_ShopGoodsData::Get(this.GetContext().Manager);
        for (auto& local_18 : this.GetShopConfig().opArrow().GetGoodsLists())
        {
            FM_ShopCategory& local_20 = this.FindOrCreateShopCategory(local_18.opArrow().GetCategory());
            for (auto& local_34 : local_18.opArrow().GetGoodsList())
            {
                if (!(local_34))
                {
                    XError(ELog(31), FString().Append("Goods list ").Append(local_18.GetDataName()).Append(" contains invalid goods config"));
                    continue;
                }
                local_20.GetModify_ShopGoods().Add(local_2.RequireShopGoodsModel(local_34));
            }
        }
        return;
    }
    bool HasMultipleCategories() const
    {
        return (this.GetShopCategories().Num() > 1);
    }
    FM_ShopCategory FindOrCreateShopCategory(const TDataObjectPtr<FShopCategoryConfig> &inout Category)
    {
        bool local_13 = false;
        FM_ShopCategory __r;
        for (auto& local_16 : this.GetModify_ShopCategories())
        {
            TDataObjectPtr<FShopCategoryConfig> local_40;
            local_40 = local_16.opArrow().GetConfig();
            local_13 = (local_40 == Category.opImplConv());
            if (local_13)
            {
                return __r;
            }
        }
        FM_ShopCategory& local_90 = ::FM_ShopCategory::Create(this.GetContext().Manager);
        local_90.SetConfig(Category);
        this.GetModify_ShopCategories().Add(TEUIModelRef<FM_ShopCategory>(local_90));
        return local_13;
    }
    const TDataObjectPtr<FShopConfig> GetShopConfig() const property
    {
        const TDataObjectPtr<FShopConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FShopConfig> GetModify_ShopConfig() property
    {
        TDataObjectPtr<FShopConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetShopConfig(const TDataObjectPtr<FShopConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ShopConfig = __Value;
        return;
    }
    const TArray<TEUIModelRef<FM_ShopCategory>> GetShopCategories() const property
    {
        const TArray<TEUIModelRef<FM_ShopCategory>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FM_ShopCategory>> GetModify_ShopCategories() property
    {
        TArray<TEUIModelRef<FM_ShopCategory>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetShopCategories(const TArray<TEUIModelRef<FM_ShopCategory>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ShopCategories = __Value;
        return;
    }
}

struct __Lambda_UI_Private_Model_Player_Shop_M_Shop_29
{
    __Lambda_UI_Private_Model_Player_Shop_M_Shop_29()
    {
        return;
    }
    bool opCall(const TEUIModelRef<FM_ShopCategory> &inout A, const TEUIModelRef<FM_ShopCategory> &inout B)
    {
        return (A.opArrow().GetConfig().opArrow().DisplayPriority < B.opArrow().GetConfig().opArrow().DisplayPriority);
    }
}

namespace FM_Shop
{
FM_Shop& Create(const UObject ContextObject, const TDataObjectPtr<FShopConfig> &inout ShopConfig)
{
    return FM_Shop::CreateByManager(EUIInternal::GetContextManager(ContextObject), ShopConfig);
}
FM_Shop CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FShopConfig> &inout ShopConfig)
{
    FM_Shop __r;
    TEUIModelRef<FM_Shop> local_6 = TEUIModelRef<FM_Shop>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_Shop::ModelId, 0, ShopConfig));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_Shop;
}
int __IndexOf_ShopConfig()
{
    return 0;
}
int __IndexOf_ShopCategories()
{
    return 1;
}
}

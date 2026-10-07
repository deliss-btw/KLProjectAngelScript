
namespace FM_ShopGoods
{
    const int ModelId = 0;

}
struct FM_ShopGoods : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    TDataObjectPtr<FShopGoodsConfig> m_ShopGoodsConfig;
    UPROPERTY()
    int m_RemainingCount;
    UPROPERTY()
    bool m_bIsUnlocked;

    FM_ShopGoods()
    {
        this.m_RemainingCount = 0;
        this.m_bIsUnlocked = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FM_ShopGoods(const FM_ShopGoods &inout Other)
    {
        this.m_RemainingCount = 0;
        this.m_bIsUnlocked = false;
        this.m_ShopGoodsConfig = Other.m_ShopGoodsConfig;
        this.m_RemainingCount = int(Other.m_RemainingCount);
        this.m_bIsUnlocked = Other.m_bIsUnlocked;
        return;
    }
    FM_ShopGoods opAssign(const FM_ShopGoods &inout Other)
    {
        FM_ShopGoods __r;
        this.m_ShopGoodsConfig = Other.m_ShopGoodsConfig;
        this.m_RemainingCount = int(Other.m_RemainingCount);
        this.m_bIsUnlocked = Other.m_bIsUnlocked;
        return __r;
    }
    int GetCostItemNum() const
    {
        if (this.GetShopGoodsConfig())
        {
            return ::NumericUtils::AsInt32(this.GetShopGoodsConfig().opArrow().CostCount);
        }
        return 0;
    }
    FSoftBrush GetCostItemIcon() const
    {
        if (!(!(this.GetShopGoodsConfig())) && this.GetShopGoodsConfig().opArrow().GetCostItem())
        {
            return this.GetShopGoodsConfig().opArrow().GetCostItem().opArrow().ItemIcon;
        }
        return FSoftBrush();
    }
    TDataObjectPtr<FRefreshRuleConfig> GetRefreshRuleConfig() const
    {
        if (this.GetShopGoodsConfig())
        {
            return this.GetShopGoodsConfig().opArrow().GetRefreshRuleConfig();
        }
        return TDataObjectPtr<FRefreshRuleConfig>(nullptr);
    }
    bool HasPersonalLimit() const
    {
        if (this.GetShopGoodsConfig())
        {
            TDataObjectPtr<FRefreshRuleConfig> local_26;
            local_26 = this.GetShopGoodsConfig().opArrow().GetRefreshRuleConfig();
            return !((local_26 == nullptr)) && (this.GetShopGoodsConfig().opArrow().PersonalLimitCount > 0);
        }
        return false;
    }
    bool IsUnlocked() const
    {
        return this.GetbIsUnlocked();
    }
    bool IsSoldOut() const
    {
        return this.HasPersonalLimit() && (this.GetRemainingCount() <= 0);
    }
    bool CanPurchase() const
    {
        return this.GetbIsUnlocked() && !(this.IsSoldOut());
    }
    int GetEquipmentLevel() const
    {
        CastTo local_28;
        TDataObjectPtr<FEquipmentConfig> local_52 = local_28.opCall();
        if (local_52)
        {
            return local_52.opArrow().Level;
        }
        return 0;
    }
    bool CmpWith(const FM_ShopGoods &inout Other) const
    {
        bool local_1 = this.HasPersonalLimit();
        bool local_2 = Other.HasPersonalLimit();
        if (this.CanPurchase() && !(Other.CanPurchase()))
        {
            return true;
        }
        if (!(this.CanPurchase()) && Other.CanPurchase())
        {
            return false;
        }
        if (local_1 && !(local_2))
        {
            return true;
        }
        bool local_4 = !(local_1);
        bool local_3 = local_4 && local_2;
        if (local_3)
        {
            return false;
        }
        TDataObjectPtr<FItemConfig> local_28 = this.GetShopGoodsConfig().opArrow().GetItem();
        TDataObjectPtr<FItemConfig> local_76 = Other.GetShopGoodsConfig().opArrow().GetItem();
        if (!(local_28))
        {
            local_3 = false;
        }
        else
        {
            local_3 = local_76;
        }
        if (local_3)
        {
            if (int(local_28.opArrow().Rarity) != int(local_76.opArrow().Rarity))
            {
                return (int(local_28.opArrow().Rarity) > int(local_76.opArrow().Rarity));
            }
            int local_79 = this.GetEquipmentLevel();
            int local_80 = Other.GetEquipmentLevel();
            if (local_79 != local_80)
            {
                return (local_79 > local_80);
            }
        }
        return (this.GetShopGoodsConfig().opArrow().DataId < Other.GetShopGoodsConfig().opArrow().DataId);
    }
    const TDataObjectPtr<FShopGoodsConfig> GetShopGoodsConfig() const property
    {
        const TDataObjectPtr<FShopGoodsConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FShopGoodsConfig> GetModify_ShopGoodsConfig() property
    {
        TDataObjectPtr<FShopGoodsConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetShopGoodsConfig(const TDataObjectPtr<FShopGoodsConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ShopGoodsConfig = __Value;
        return;
    }
    int GetRemainingCount() const property
    {
        this.TrackPropertyRead(1);
        return this.m_RemainingCount;
    }
    void SetRemainingCount(const int __Value) property
    {
        if (this.m_RemainingCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_RemainingCount = __Value;
        return;
    }
    bool GetbIsUnlocked() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bIsUnlocked;
    }
    void SetbIsUnlocked(const bool __Value) property
    {
        if (!(this.m_bIsUnlocked) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bIsUnlocked = __Value;
        return;
    }
}

namespace FM_ShopGoods
{
FM_ShopGoods& Create(const UObject ContextObject)
{
    return FM_ShopGoods::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FM_ShopGoods CreateByManager(const UEUIManagerSubsystem Manager)
{
    FM_ShopGoods __r;
    TEUIModelRef<FM_ShopGoods> local_6 = TEUIModelRef<FM_ShopGoods>(EUIInternal::MakeModelWithManager(Manager, FM_ShopGoods::ModelId));
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
    return FM_ShopGoods;
}
int __IndexOf_ShopGoodsConfig()
{
    return 0;
}
int __IndexOf_RemainingCount()
{
    return 1;
}
int __IndexOf_bIsUnlocked()
{
    return 2;
}
}

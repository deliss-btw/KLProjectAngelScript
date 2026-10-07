
namespace FMS_ShopGoodsData
{
    const int ModelId = 0;

}
struct FMsg_ShopGoodsDataUpdated : FEUIMessage
{
    FMsg_ShopGoodsDataUpdated()
    {
        return;
    }
}

struct FMS_ShopGoodsData : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TMap<TDataObjectPtr<FShopGoodsConfig>, TEUIModelRef<FM_ShopGoods>> m_ShopGoodsMap;
    UPROPERTY()
    TSet<TDataObjectPtr<FShopConfig>> m_UnlockedShops;
    UPROPERTY()
    TSet<uint> m_KnownInvalidGoodsIds;

    FMS_ShopGoodsData()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_ShopGoodsData(const FMS_ShopGoodsData &inout Other)
    {
        this.m_ShopGoodsMap = Other.m_ShopGoodsMap;
        this.m_UnlockedShops = Other.m_UnlockedShops;
        this.m_KnownInvalidGoodsIds = Other.m_KnownInvalidGoodsIds;
        return;
    }
    FMS_ShopGoodsData& opAssign(const FMS_ShopGoodsData &inout Other)
    {
        this.m_ShopGoodsMap = Other.m_ShopGoodsMap;
        this.m_UnlockedShops = Other.m_UnlockedShops;
        return Other.m_KnownInvalidGoodsIds;
    }
    bool IsShopUnlocked(const TDataObjectPtr<FShopConfig> &inout ShopConfig) const
    {
        return this.GetUnlockedShops().Contains(ShopConfig);
    }
    TEUIModelRef<FM_ShopGoods> RequireShopGoodsModel(const TDataObjectPtr<FShopGoodsConfig> &inout ShopGoodsConfig)
    {
        if (!(!(!(ShopGoodsConfig))))
        {
            return TEUIModelRef<FM_ShopGoods>();
        }
        return this.AddOrCreateShopGoodsModelFromConfig(ShopGoodsConfig);
    }
    void GS_RequestShopping(const TEUIModelRef<FM_ShopGoods> &inout ShopGoods, const int ShoppingCount)
    {
        if (!(ShopGoods.IsValid()))
        {
            return;
        }
        if ((!((ShoppingCount > 0))))
        {
            return;
        }
        if (!(ShopGoods.opArrow().GetbIsUnlocked()))
        {
            return;
        }
        FPbDoShoppingReq local_6;
        local_6.SetGoodsId(ShopGoods.opArrow().GetShopGoodsConfig().opArrow().DataId);
        local_6.SetNum(ShoppingCount);
        this.SendProto(local_6.ToWrapper());
        return;
    }
    void GS_OnDoShoppingRsp(const FPbDoShoppingRsp &inout Rsp)
    {
        if (Rsp.GetRetcode() == 0)
        {
            FMsg_DoShoppingResult local_32;
            TArray<FPbAddItemResult> local_8;
            Rsp.GetResultList(local_8);
            TArray<FDoShoppingResultItem> local_12;
            for (auto& local_26 : local_8)
            {
                FDoShoppingResultItem local_28;
                local_28.ItemGuid = local_26.GetGuid();
                local_12.Add(local_28);
            }
            FEUIModelRef local_38 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus);
            local_32.GoodsId = Rsp.GetGoodsId();
            local_32.Num = Rsp.GetNum();
            local_32.Items = local_12;
        }
        return;
    }
    void GS_OnPlayerShopDataNotify(const FPbPlayerShopDataNotify &inout Msg)
    {
        this.GetModify_ShopGoodsMap().Empty(0);
        this.GetModify_UnlockedShops().Empty(0);
        int local_2 = 0;
        for (; local_2 < Msg.GetUnlockShopList_Num(); ++local_2)
        {
            int local_4 = Msg.GetUnlockShopList_Index(local_2);
            GetDataObjectByGSDataId<FShopConfig> local_54;
            TDataObjectPtr<FShopConfig> local_30 = local_54.opImplConv();
            if (local_30)
            {
                this.GetModify_UnlockedShops().Add(local_30);
                continue;
            }
            XError(ELog(27), FString().Append("Failed to unlock shop, shop config not found for data id ").Append(Msg.GetUnlockShopList_Index(local_2)));
        }
        int local_2_2 = 0;
        for (; local_2_2 < Msg.GetUnlockGoodsList_Num(); ++local_2_2)
        {
            TEUIModelRef<FM_ShopGoods> local_110 = this.AddOrCreateShopGoodsModelFromServer(Msg.GetUnlockGoodsList_Index(local_2_2));
            if (local_110)
            {
                local_110.opArrow().SetbIsUnlocked(true);
            }
        }
        int local_2_3 = 0;
        for (; local_2_3 < Msg.GetRemainGoodsList_Num(); ++local_2_3)
        {
            TEUIModelRef<FM_ShopGoods> local_112 = this.AddOrCreateShopGoodsModelFromServer(Msg.GetRemainGoodsList_Index(local_2_3).GetFirst());
            if (local_112)
            {
                local_112.opArrow().SetRemainingCount(::NumericUtils::AsInt32(Msg.GetRemainGoodsList_Index(local_2_3).GetSecond()));
            }
        }
        return;
    }
    void GS_OnShopUpdateNotify(const FPbShopUpdateNotify &inout Msg)
    {
        int local_1 = 0;
        for (; local_1 < Msg.GetUnlockShopList_Num(); ++local_1)
        {
            int local_3 = Msg.GetUnlockShopList_Index(local_1);
            GetDataObjectByGSDataId<FShopConfig> local_52;
            TDataObjectPtr<FShopConfig> local_28 = local_52.opImplConv();
            if (local_28)
            {
                this.GetModify_UnlockedShops().Add(local_28);
                continue;
            }
            XError(ELog(27), FString().Append("Failed to unlock shop, shop config not found for data id ").Append(Msg.GetUnlockShopList_Index(local_1)));
        }
        int local_1_2 = 0;
        for (; local_1_2 < Msg.GetUnlockGoodsList_Num(); ++local_1_2)
        {
            TEUIModelRef<FM_ShopGoods> local_108 = this.AddOrCreateShopGoodsModelFromServer(Msg.GetUnlockGoodsList_Index(local_1_2));
            if (local_108)
            {
                local_108.opArrow().SetbIsUnlocked(true);
            }
        }
        int local_1_3 = 0;
        for (; local_1_3 < Msg.GetRemainGoodsList_Num(); ++local_1_3)
        {
            TEUIModelRef<FM_ShopGoods> local_110 = this.AddOrCreateShopGoodsModelFromServer(Msg.GetRemainGoodsList_Index(local_1_3).GetFirst());
            if (local_110)
            {
                local_110.opArrow().SetRemainingCount(::NumericUtils::AsInt32(Msg.GetRemainGoodsList_Index(local_1_3).GetSecond()));
            }
        }
        FEUIModelRef local_128 = FEUIModelRef(this);
        FEUIMessageBus::PublishOrPatch(EUIMessageBus).opCall(local_128);
        return;
    }
    TEUIModelRef<FM_ShopGoods> AddOrCreateShopGoodsModelFromServer(const uint GoodsId)
    {
        GetDataObjectByGSDataId<FShopGoodsConfig> local_48;
        TDataObjectPtr<FShopGoodsConfig> local_24 = local_48.opImplConv();
        if (!(local_24))
        {
            if (!(this.GetKnownInvalidGoodsIds().Contains(GoodsId)))
            {
                XError(ELog(27), FString().Append("Failed to add or update shop goods model, shop goods config not found for ").Append(GoodsId));
                this.GetModify_KnownInvalidGoodsIds().Add(GoodsId);
            }
            return TEUIModelRef<FM_ShopGoods>();
        }
        bool local_97 = false;
        return this.AddOrCreateShopGoodsModelInternal(local_24, local_97);
    }
    TEUIModelRef<FM_ShopGoods> AddOrCreateShopGoodsModelFromConfig(const TDataObjectPtr<FShopGoodsConfig> &inout ShopGoodsConfig)
    {
        bool local_1 = false;
        TEUIModelRef<FM_ShopGoods> local_4 = this.AddOrCreateShopGoodsModelInternal(ShopGoodsConfig, local_1);
        if (local_4 && local_1)
        {
            local_4.opArrow().SetRemainingCount(::NumericUtils::AsInt32(ShopGoodsConfig.opArrow().PersonalLimitCount));
            TDataObjectPtr<FServerConditionConfigBase> local_32;
            local_32 = ShopGoodsConfig.opArrow().GetUnlockCondition();
            local_4.opArrow().SetbIsUnlocked((local_32 == nullptr));
        }
        return local_4;
    }
    TEUIModelRef<FM_ShopGoods> AddOrCreateShopGoodsModelInternal(const TDataObjectPtr<FShopGoodsConfig> &inout ShopGoodsConfig, bool &inout bIsNewCreate)
    {
        TEUIModelRef<FM_ShopGoods> local_2;
        if (this.GetShopGoodsMap().Find(ShopGoodsConfig, local_2))
        {
            bIsNewCreate = false;
            return local_2;
        }
        FM_ShopGoods& local_6 = ::FM_ShopGoods::Create(this.GetContext().Manager);
        local_6.SetShopGoodsConfig(ShopGoodsConfig);
        this.GetModify_ShopGoodsMap().Add(local_6.GetShopGoodsConfig(), TEUIModelRef<FM_ShopGoods>(local_6));
        bIsNewCreate = true;
        return (TEUIModelRef<FM_ShopGoods>(local_6));
    }
    const TMap<TDataObjectPtr<FShopGoodsConfig>, TEUIModelRef<FM_ShopGoods>> GetShopGoodsMap() const property
    {
        const TMap<TDataObjectPtr<FShopGoodsConfig>, TEUIModelRef<FM_ShopGoods>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TMap<TDataObjectPtr<FShopGoodsConfig>, TEUIModelRef<FM_ShopGoods>> GetModify_ShopGoodsMap() property
    {
        TMap<TDataObjectPtr<FShopGoodsConfig>, TEUIModelRef<FM_ShopGoods>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetShopGoodsMap(const TMap<TDataObjectPtr<FShopGoodsConfig>, TEUIModelRef<FM_ShopGoods>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ShopGoodsMap = __Value;
        return;
    }
    const TSet<TDataObjectPtr<FShopConfig>> GetUnlockedShops() const property
    {
        const TSet<TDataObjectPtr<FShopConfig>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TSet<TDataObjectPtr<FShopConfig>> GetModify_UnlockedShops() property
    {
        TSet<TDataObjectPtr<FShopConfig>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetUnlockedShops(const TSet<TDataObjectPtr<FShopConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_UnlockedShops = __Value;
        return;
    }
    const TSet<uint> GetKnownInvalidGoodsIds() const property
    {
        const TSet<uint> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TSet<uint> GetModify_KnownInvalidGoodsIds() property
    {
        TSet<uint> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetKnownInvalidGoodsIds(const TSet<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_KnownInvalidGoodsIds = __Value;
        return;
    }
}

struct FDoShoppingResultItem
{
    UPROPERTY()
    uint64 ItemGuid = 0;


}

struct FMsg_DoShoppingResult : FEUIMessage
{
    UPROPERTY()
    uint GoodsId = 0;
    UPROPERTY()
    uint Num = 0;
    UPROPERTY()
    TArray<FDoShoppingResultItem> Items;


}

namespace FMS_ShopGoodsData
{
FMS_ShopGoodsData& Get(const UObject ContextObject)
{
    return FMS_ShopGoodsData::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_ShopGoodsData GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_ShopGoodsData __r;
    TEUIModelRef<FMS_ShopGoodsData> local_6 = TEUIModelRef<FMS_ShopGoodsData>(EUIInternal::MakeModelWithManager(Manager, FMS_ShopGoodsData::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelProtoRspDefine local_10;
    local_10.FunctionName = "__GS_OnDoShoppingRsp";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnPlayerShopDataNotify";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnShopUpdateNotify";
    Result.ProtoRspDefines.Add(local_10);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_ShopGoodsData;
}
void __GS_OnDoShoppingRsp(FMS_ShopGoodsData &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnDoShoppingRsp(FPbDoShoppingRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnPlayerShopDataNotify(FMS_ShopGoodsData &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnPlayerShopDataNotify(FPbPlayerShopDataNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnShopUpdateNotify(FMS_ShopGoodsData &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnShopUpdateNotify(FPbShopUpdateNotify::FromWrapper(ProtoWrapper));
    return;
}
int __IndexOf_ShopGoodsMap()
{
    return 0;
}
int __IndexOf_UnlockedShops()
{
    return 1;
}
int __IndexOf_KnownInvalidGoodsIds()
{
    return 2;
}
}

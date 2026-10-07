
namespace FMS_VirtualItemManager
{
    const int ModelId = 0;

}
struct FMS_VirtualItemManager : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TEUIModelRef<FMS_PlayerInventory> m_PlayerInventory;
    UPROPERTY()
    UGlobalItemSettings m_Settings;
    UPROPERTY()
    bool m_bCoinInitialized;
    UPROPERTY()
    TMap<TDataObjectPtr<FVirtualItemConfig>, TEUIModelRef<FM_ItemData>> m_OwnedVirtualItems;

    FMS_VirtualItemManager()
    {
        this.m_Settings = nullptr;
        this.m_bCoinInitialized = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_VirtualItemManager(const FMS_VirtualItemManager &inout Other)
    {
        this.m_Settings = nullptr;
        this.m_bCoinInitialized = false;
        this.m_PlayerInventory = Other.m_PlayerInventory;
        this.m_Settings = Other.m_Settings;
        this.m_bCoinInitialized = Other.m_bCoinInitialized;
        this.m_OwnedVirtualItems = Other.m_OwnedVirtualItems;
        return;
    }
    FMS_VirtualItemManager& opAssign(const FMS_VirtualItemManager &inout Other)
    {
        this.m_PlayerInventory = Other.m_PlayerInventory;
        this.m_Settings = Other.m_Settings;
        this.m_bCoinInitialized = Other.m_bCoinInitialized;
        return Other.m_OwnedVirtualItems;
    }
    void PostConstruct()
    {
        this.SetSettings(::UGlobalItemSettings::Get());
        this.SetPlayerInventory(TEUIModelRef<FMS_PlayerInventory>(::FMS_PlayerInventory::Get(this.GetContext().Manager)));
        this.GetPlayerInventory().opArrow().RegisterExternalItem(this.RequestVirtualItem(this.GetSettings().CoinConfig));
        this.GetPlayerInventory().opArrow().RegisterExternalItem(this.RequestVirtualItem(this.GetSettings().VoucherConfig));
        this.GetPlayerInventory().opArrow().RegisterExternalItem(this.RequestVirtualItem(this.GetSettings().SoulsConfig));
        this.GetPlayerInventory().opArrow().RegisterExternalItem(this.RequestVirtualItem(this.GetSettings().PointsConfig));
        this.GetPlayerInventory().opArrow().RegisterExternalItem(this.RequestVirtualItem(this.GetSettings().BattleTokenConfig));
        return;
    }
    void GS_OnPlayerCoinNotify(const FPbPlayerCoinNotify &inout Notify)
    {
        int local_3 = Notify.GetCoin();
        this.UpdateVirtualItemFromNotify(this.GetSettings().CoinConfig);
        int local_3_2 = Notify.GetVoucher();
        this.UpdateVirtualItemFromNotify(this.GetSettings().VoucherConfig);
        int local_3_3 = Notify.GetSouls();
        this.UpdateVirtualItemFromNotify(this.GetSettings().SoulsConfig);
        int local_3_4 = Notify.GetPoints();
        this.UpdateVirtualItemFromNotify(this.GetSettings().PointsConfig);
        int local_3_5 = Notify.GetBattleToken();
        this.UpdateVirtualItemFromNotify(this.GetSettings().BattleTokenConfig);
        if (this.GetbCoinInitialized())
        {
            FEUIModelRef local_12 = this.GetPlayerInventory().opImplConv();
            FEUIMessageBus::PublishOrPatch(EUIMessageBus).opCall(local_12);
        }
        this.SetbCoinInitialized(true);
        return;
    }
    void UpdateVirtualItemFromNotify(const TDataObjectPtr<FItemConfig> &inout Config, const int NewNum)
    {
        int local_7;
        if (!(Config))
        {
            return;
        }
        TEUIModelRef<FM_ItemData> local_4 = this.RequestVirtualItem(Config);
        local_7 = local_4.opArrow().GetNum();
        local_4.opArrow().SetNum(NewNum);
        if (this.GetbCoinInitialized() && (NewNum > local_7))
        {
            ::PlayerInventoryUtils::ShowInventoryAddMessage(this.GetManager(), Config, (NewNum - local_7));
        }
        return;
    }
    TEUIModelRef<FM_ItemData> RequestVirtualItem(const TDataObjectPtr<FItemConfig> &inout ItemConfig)
    {
        CastTo local_4;
        TDataObjectPtr<FVirtualItemConfig> local_28 = local_4.opCall();
        if (this.GetOwnedVirtualItems().Contains(local_28))
        {
            return this.GetOwnedVirtualItems()[local_28];
        }
        FM_ItemData& local_56 = ::FM_ItemData::Create(this.GetContext().Manager);
        local_56.SetConfig(ItemConfig);
        local_56.SetNum(0);
        this.GetModify_OwnedVirtualItems().Add(local_28, TEUIModelRef<FM_ItemData>(local_56));
        return (TEUIModelRef<FM_ItemData>(local_56));
    }
    TEUIModelRef<FMS_PlayerInventory> GetPlayerInventory() const property
    {
        this.TrackPropertyRead(0);
        return this.m_PlayerInventory;
    }
    void SetPlayerInventory(const TEUIModelRef<FMS_PlayerInventory> &inout __Value) property
    {
        TEUIModelRef<FMS_PlayerInventory> local_2;
        local_2 = this.m_PlayerInventory;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PlayerInventory = __Value;
        return;
    }
    UGlobalItemSettings GetSettings() const property
    {
        this.TrackPropertyRead(1);
        return this.m_Settings;
    }
    void SetSettings(const UGlobalItemSettings __Value) property
    {
        if (this.m_Settings == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        return;
    }
    bool GetbCoinInitialized() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bCoinInitialized;
    }
    void SetbCoinInitialized(const bool __Value) property
    {
        if (!(this.m_bCoinInitialized) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bCoinInitialized = __Value;
        return;
    }
    const TMap<TDataObjectPtr<FVirtualItemConfig>, TEUIModelRef<FM_ItemData>> GetOwnedVirtualItems() const property
    {
        const TMap<TDataObjectPtr<FVirtualItemConfig>, TEUIModelRef<FM_ItemData>> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TMap<TDataObjectPtr<FVirtualItemConfig>, TEUIModelRef<FM_ItemData>> GetModify_OwnedVirtualItems() property
    {
        TMap<TDataObjectPtr<FVirtualItemConfig>, TEUIModelRef<FM_ItemData>> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetOwnedVirtualItems(const TMap<TDataObjectPtr<FVirtualItemConfig>, TEUIModelRef<FM_ItemData>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_OwnedVirtualItems = __Value;
        return;
    }
}

namespace FMS_VirtualItemManager
{
FMS_VirtualItemManager& Get(const UObject ContextObject)
{
    return FMS_VirtualItemManager::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_VirtualItemManager GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_VirtualItemManager __r;
    TEUIModelRef<FMS_VirtualItemManager> local_6 = TEUIModelRef<FMS_VirtualItemManager>(EUIInternal::MakeModelWithManager(Manager, FMS_VirtualItemManager::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelProtoRspDefine local_10;
    local_10.FunctionName = "__GS_OnPlayerCoinNotify";
    Result.ProtoRspDefines.Add(local_10);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_VirtualItemManager;
}
void __GS_OnPlayerCoinNotify(FMS_VirtualItemManager &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnPlayerCoinNotify(FPbPlayerCoinNotify::FromWrapper(ProtoWrapper));
    return;
}
int __IndexOf_PlayerInventory()
{
    return 0;
}
int __IndexOf_Settings()
{
    return 1;
}
int __IndexOf_bCoinInitialized()
{
    return 2;
}
int __IndexOf_OwnedVirtualItems()
{
    return 3;
}
}

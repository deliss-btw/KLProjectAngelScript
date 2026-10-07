
namespace FPlayerInventoryItem
{
    const FPlayerInventoryItem Invalid = FPlayerInventoryItem();
}
namespace FM_PlayerInventoryExternalItemProxy
{
    const int ModelId = 0;
}
namespace FMS_PlayerInventory
{
    const int ModelId = 0;

}
struct FPlayerInventoryItem
{
    UPROPERTY()
    uint64 m_ItemUid;
    UPROPERTY()
    int64 LastModifiedTimestamp;

    FPlayerInventoryItem(const uint64 InItemUid, const int64 InLastModifiedTimestamp)
    {
        this.m_ItemUid = InItemUid;
        this.LastModifiedTimestamp = InLastModifiedTimestamp;
        return;
    }
    uint64 GetItemUid() const property
    {
        return this.m_ItemUid;
    }
}

struct FPlayerInventoryItemList
{
    UPROPERTY()
    TArray<FPlayerInventoryItem> Items;

    FPlayerInventoryItemList()
    {
        return;
    }
}

struct FMsg_PlayerInventoryChanged : FEUIMessage
{
    FMsg_PlayerInventoryChanged()
    {
        return;
    }
}

struct FMsg_ItemDecomposeSuccessNotify : FEUIMessage
{
    FMsg_ItemDecomposeSuccessNotify()
    {
        return;
    }
}

struct FPlayerInventoryItemRawData
{
    UPROPERTY()
    uint64 ItemUid;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> ItemConfig;
    UPROPERTY()
    int ItemNum;
    UPROPERTY()
    int64 LastModifiedTimestamp;


}

struct FM_PlayerInventoryExternalItemProxy : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    TEUIModelRef<FM_ItemData> m_ExternalItemData;
    UPROPERTY()
    TEUIModelRef<FM_ItemData> m_ProxySumItem;

    FM_PlayerInventoryExternalItemProxy()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FM_PlayerInventoryExternalItemProxy' by default constructor.");
        return;
    }
    FM_PlayerInventoryExternalItemProxy(const FM_PlayerInventoryExternalItemProxy &inout Other)
    {
        this.m_ExternalItemData = Other.m_ExternalItemData;
        this.m_ProxySumItem = Other.m_ProxySumItem;
        return;
    }
    FM_PlayerInventoryExternalItemProxy(const TEUIModelRef<FM_ItemData> &inout InExternalItemData, const TEUIModelRef<FM_ItemData> &inout InProxySumItem)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetExternalItemData(InExternalItemData);
        this.SetProxySumItem(InProxySumItem);
        return;
    }
    FM_PlayerInventoryExternalItemProxy& opAssign(const FM_PlayerInventoryExternalItemProxy &inout Other)
    {
        this.m_ExternalItemData = Other.m_ExternalItemData;
        return Other.m_ProxySumItem;
    }
    void PostConstruct()
    {
        this.GetProxySumItem().opArrow().SetNum(this.GetExternalItemData().opArrow().GetNum());
        return;
    }
    void OnExternalItemNumChanged()
    {
        this.GetProxySumItem().opArrow().SetNum(this.GetExternalItemData().opArrow().GetNum());
        return;
    }
    int GetNum() const property
    {
        return this.GetExternalItemData().opArrow().GetNum();
    }
    TEUIModelRef<FM_ItemData> GetExternalItemData() const property
    {
        this.TrackPropertyRead(0);
        return this.m_ExternalItemData;
    }
    void SetExternalItemData(const TEUIModelRef<FM_ItemData> &inout __Value) property
    {
        TEUIModelRef<FM_ItemData> local_2;
        local_2 = this.m_ExternalItemData;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ExternalItemData = __Value;
        return;
    }
    TEUIModelRef<FM_ItemData> GetProxySumItem() const property
    {
        this.TrackPropertyRead(1);
        return this.m_ProxySumItem;
    }
    void SetProxySumItem(const TEUIModelRef<FM_ItemData> &inout __Value) property
    {
        TEUIModelRef<FM_ItemData> local_2;
        local_2 = this.m_ProxySumItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ProxySumItem = __Value;
        return;
    }
}

struct FMS_PlayerInventory : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TMap<TDataObjectPtr<FItemConfig>, FPlayerInventoryItemList> m_OwnedItems;
    UPROPERTY()
    TMap<TDataObjectPtr<FItemConfig>, TEUIModelWeakRef<FM_ItemData>> m_InventorySumItems;
    UPROPERTY()
    TEUIModelRef<FMS_ItemDataCache> m_ItemDataCache;
    UPROPERTY()
    TMap<TDataObjectPtr<FItemConfig>, TEUIModelRef<FM_PlayerInventoryExternalItemProxy>> m_ExternalItems;
    UPROPERTY()
    bool bGameplayInventoryInitialized;

    FMS_PlayerInventory()
    {
        this.bGameplayInventoryInitialized = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_PlayerInventory(const FMS_PlayerInventory &inout Other)
    {
        this.bGameplayInventoryInitialized = true;
        this.m_OwnedItems = Other.m_OwnedItems;
        this.m_InventorySumItems = Other.m_InventorySumItems;
        this.m_ItemDataCache = Other.m_ItemDataCache;
        this.m_ExternalItems = Other.m_ExternalItems;
        return;
    }
    FMS_PlayerInventory& opAssign(const FMS_PlayerInventory &inout Other)
    {
        this.m_OwnedItems = Other.m_OwnedItems;
        this.m_InventorySumItems = Other.m_InventorySumItems;
        this.m_ItemDataCache = Other.m_ItemDataCache;
        return Other.m_ExternalItems;
    }
    void PostConstruct()
    {
        this.SetItemDataCache(TEUIModelRef<FMS_ItemDataCache>(::FMS_ItemDataCache::Get(this.GetContext().Manager)));
        return;
    }
    int GetTotalItemNum(const TDataObjectPtr<FItemConfig> &inout Config) const
    {
        if (Config)
        {
            if (this.GetExternalItems().Find(Config))
            {
                return opArrow().GetNum();
            }
            TEUIModelWeakRef<FM_ItemData> local_10;
            if (this.GetInventorySumItems().Find(Config, local_10) && local_10.IsValid())
            {
                return GetNum();
            }
            return this.CountOwnedItemNum(Config);
        }
        return 0;
    }
    int64 GetItemLastModifiedTimestamp(const uint64 ItemUid) const
    {
        return this.FindInventoryItemByUid(ItemUid).LastModifiedTimestamp;
    }
    TEUIModelRef<FM_ItemData> GetSumItem(const TDataObjectPtr<FItemConfig> &inout Config)
    {
        if (!(Config))
        {
            return TEUIModelRef<FM_ItemData>();
        }
        if (this.GetExternalItems().Find(Config))
        {
            return opArrow().GetExternalItemData();
        }
        TEUIModelWeakRef<FM_ItemData> local_12;
        if (this.GetInventorySumItems().Find(Config, local_12) && local_12.IsValid())
        {
            return TEUIModelRef<FM_ItemData>();
        }
        FM_ItemData& local_16 = ::FM_ItemData::Create(this.GetContext().Manager);
        local_16.SetConfig(Config);
        local_16.SetNum(this.CountOwnedItemNum(Config));
        this.GetModify_InventorySumItems().Add(Config, TEUIModelWeakRef<FM_ItemData>(local_16));
        return (TEUIModelRef<FM_ItemData>(local_16));
    }
    TEUIModelRef<FM_ItemData> FindItemDataByUid(const uint64 ItemUid) const
    {
        __Lambda_UI_Private_Model_Inventory_M_PlayerInventory_184 local_12;
        TEUIModelRef<FM_ItemData> local_8;
        if (ItemUid == 0)
        {
            return local_8;
        }
        local_8 = ::FMS_ItemDataCache::Get(this.GetContext().Manager).RequireItemData(ItemUid);
        if (this.GetOwnedItems().Contains(local_8.opArrow().GetConfig()) && this.GetOwnedItems()[local_8.opArrow().GetConfig()].Items.ContainsByPredicate(local_12))
        {
            return local_8;
        }
        return TEUIModelRef<FM_ItemData>();
    }
    bool IsInInventory(const TEUIModelRef<FM_ItemData> &inout ItemData) const
    {
        if (!(ItemData))
        {
            return false;
        }
        if (!(this.GetItemDataCache().opArrow().TryGetItemUid(ItemData, 0)))
        {
            return false;
        }
        if (!(this.GetOwnedItems().Contains(ItemData.opArrow().GetConfig())))
        {
            return false;
        }
        __Lambda_UI_Private_Model_Inventory_M_PlayerInventory_215 local_10;
        return this.GetOwnedItems()[ItemData.opArrow().GetConfig()].Items.ContainsByPredicate(local_10);
    }
    bool HasItem(const TDataObjectPtr<FItemConfig> &inout ItemConfig) const
    {
        if (!(ItemConfig))
        {
            return false;
        }
        return this.GetOwnedItems().Contains(ItemConfig);
    }
    TArray<TEUIModelRef<FM_ItemData>> GetAllItems()
    {
        TArrayConstIterator<FPlayerInventoryItem> local_82;
        TEUIModelRef<FMS_EquipmentDataCache> local_2 = TEUIModelRef<FMS_EquipmentDataCache>(::FMS_EquipmentDataCache::Get(this.GetContext().Manager));
        TArray<TEUIModelRef<FM_ItemData>> local_8;
        for (auto& local_28 : this.GetOwnedItems())
        {
            TDataObjectPtr<FItemConfig> local_52 = local_28.GetKey();
            for (; local_82.CanProceed;)
            {
                const FPlayerInventoryItem& local_90 = local_82.Proceed();
                if (int(local_52.opArrow().ItemType) == 2 || (int(local_52.opArrow().ItemType) == 7))
                {
                    bool local_94 = local_90.GetItemUid().IsEquipByHiddenAvatar();
                    if (local_94)
                    {
                        continue;
                    }
                }
                local_8.Add(this.GetItemDataCache().opArrow().RequireItemData(local_90.GetItemUid()));
            }
        }
        for (auto& local_120 : this.GetExternalItems())
        {
            local_120;
            if (opArrow().GetNum() > 0)
            {
                local_8.Add(opArrow().GetExternalItemData());
            }
        }
        return local_8;
    }
    TArray<TEUIModelRef<FM_ItemData>> GetAllItemsByCategory(const FGameplayTag &inout Category)
    {
        TEUIModelRef<FMS_EquipmentDataCache> local_2 = TEUIModelRef<FMS_EquipmentDataCache>(::FMS_EquipmentDataCache::Get(this.GetContext().Manager));
        TArray<TEUIModelRef<FM_ItemData>> local_8;
        for (auto& local_28 : this.GetOwnedItems())
        {
            local_28;
            CastTo local_32;
            TDataObjectPtr<FInventoryItemConfig> local_56 = local_32.opCall();
            if (local_56)
            {
                if (local_56.opArrow().ItemCategory.AsGameplayTag().MatchesTag(Category))
                {
                    TArrayConstIterator<FPlayerInventoryItem> local_88;
                    for (; local_88.CanProceed;)
                    {
                        const FPlayerInventoryItem& local_96 = local_88.Proceed();
                        if (int(local_56.opArrow().ItemType) == 2 || (int(local_56.opArrow().ItemType) == 7))
                        {
                            bool local_100 = local_96.GetItemUid().IsEquipByHiddenAvatar();
                            if (local_100)
                            {
                                continue;
                            }
                        }
                        local_8.Add(::FMS_ItemDataCache::Get(this.GetContext().Manager).RequireItemData(local_96.GetItemUid()));
                    }
                }
            }
        }
        for (auto& local_124 : this.GetExternalItems())
        {
            if (local_124.GetKey().opArrow().ItemCategory.AsGameplayTag().MatchesTag(Category))
            {
                if (opArrow().GetNum() > 0)
                {
                    local_8.Add(opArrow().GetExternalItemData());
                }
            }
        }
        return local_8;
    }
    TArray<TEUIModelRef<FM_ItemData>> GetAllItemsByItemTags(const FGameplayTagContainer &inout ItemTags)
    {
        TEUIModelRef<FMS_EquipmentDataCache> local_2 = TEUIModelRef<FMS_EquipmentDataCache>(::FMS_EquipmentDataCache::Get(this.GetContext().Manager));
        TArray<TEUIModelRef<FM_ItemData>> local_8;
        for (auto& local_28 : this.GetOwnedItems())
        {
            local_28;
            CastTo local_32;
            TDataObjectPtr<FInventoryItemConfig> local_56 = local_32.opCall();
            if (local_56)
            {
                if (local_56.opArrow().ItemTags.HasAny(ItemTags))
                {
                    TArrayConstIterator<FPlayerInventoryItem> local_86;
                    for (; local_86.CanProceed;)
                    {
                        const FPlayerInventoryItem& local_94 = local_86.Proceed();
                        if (int(local_56.opArrow().ItemType) == 2 || (int(local_56.opArrow().ItemType) == 7))
                        {
                            bool local_98 = local_94.GetItemUid().IsEquipByHiddenAvatar();
                            if (local_98)
                            {
                                continue;
                            }
                        }
                        local_8.Add(::FMS_ItemDataCache::Get(this.GetContext().Manager).RequireItemData(local_94.GetItemUid()));
                    }
                }
            }
        }
        for (auto& local_122 : this.GetExternalItems())
        {
            if (local_122.GetKey().opArrow().ItemTags.HasAny(ItemTags))
            {
                if (opArrow().GetNum() > 0)
                {
                    local_8.Add(opArrow().GetExternalItemData());
                }
            }
        }
        return local_8;
    }
    TArray<TEUIModelRef<FM_ItemData>> GetAllItemsByType(const EItemType ItemType)
    {
        TEUIModelRef<FMS_EquipmentDataCache> local_2 = TEUIModelRef<FMS_EquipmentDataCache>(::FMS_EquipmentDataCache::Get(this.GetContext().Manager));
        TArray<TEUIModelRef<FM_ItemData>> local_8;
        for (auto& local_28 : this.GetOwnedItems())
        {
            TDataObjectPtr<FItemConfig> local_52 = local_28.GetKey();
            if (int(local_28.GetKey().opArrow().ItemType) == int(ItemType))
            {
                TArrayConstIterator<FPlayerInventoryItem> local_86;
                for (; local_86.CanProceed;)
                {
                    const FPlayerInventoryItem& local_94 = local_86.Proceed();
                    if (int(local_52.opArrow().ItemType) == 2 || (int(local_52.opArrow().ItemType) == 7))
                    {
                        bool local_95 = local_94.GetItemUid().IsEquipByHiddenAvatar();
                        if (local_95)
                        {
                            continue;
                        }
                    }
                    local_8.Add(::FMS_ItemDataCache::Get(this.GetContext().Manager).RequireItemData(local_94.GetItemUid()));
                }
            }
        }
        for (auto& local_118 : this.GetExternalItems())
        {
            if (int(local_118.GetKey().opArrow().ItemType) == int(ItemType))
            {
                if (opArrow().GetNum() > 0)
                {
                    local_8.Add(opArrow().GetExternalItemData());
                }
            }
        }
        return local_8;
    }
    int GetCurrentTrunkSlotNum(const EItemTrunk Trunk) const
    {
        bool local_23;
        int local_1 = 0;
        TEUIModelRef<FMS_EquipmentDataCache> local_4 = TEUIModelRef<FMS_EquipmentDataCache>(::FMS_EquipmentDataCache::Get(this.GetContext().Manager));
        for (auto& local_26 : this.GetOwnedItems())
        {
            TDataObjectPtr<FItemConfig> local_50 = local_26.GetKey();
            if (int(local_26.GetKey().opArrow().ItemTrunk) == int(Trunk))
            {
                int local_76 = int(local_50.opArrow().ItemType);
                if (local_76 == 2 || ((int(local_50.opArrow().ItemType) == 7)))
                {
                    TArrayConstIterator<FPlayerInventoryItem> local_84;
                    for (; local_84.CanProceed;)
                    {
                        const FPlayerInventoryItem& local_92 = local_84.Proceed();
                        local_23 = local_92.GetItemUid().IsEquipByHiddenAvatar();
                        if (!(local_23))
                        {
                            local_1 = local_1 + 1;
                        }
                    }
                    continue;
                }
                local_1 = local_1 + local_76;
            }
        }
        return local_1;
    }
    int GetItemNumToReachInventoryAndBankLimit(const TDataObjectPtr<FItemConfig> &inout ItemConfig) const
    {
        int local_4 = FMath::Min(this.GetItemNumToReachTrunkLimit(ItemConfig), this.GetItemNumToReachInventoryLimit(ItemConfig));
        if (ItemConfig && (ItemConfig.opArrow().BringMax > 0))
        {
            local_4 = local_4 + this.GetBankRemainingCapacity(ItemConfig);
        }
        return local_4;
    }
    int GetItemNumToReachTrunkLimit(const TDataObjectPtr<FItemConfig> &inout ItemConfig) const
    {
        if (::ItemConfigUtils::LimitTrunkMax(ItemConfig))
        {
            int local_2 = ::ItemConfigUtils::GetTrunkMax(ItemConfig) - this.GetCurrentTrunkSlotNum(ItemConfig.opArrow().ItemTrunk);
            if (local_2 < 0)
            {
                return 0;
            }
            return (local_2 * ::ItemConfigUtils::GetPackMax(ItemConfig)) + (this.GetTotalItemNum(ItemConfig) % ::ItemConfigUtils::GetPackMax(ItemConfig));
        }
        return 2147483647;
    }
    int GetItemNumToReachInventoryLimit(const TDataObjectPtr<FItemConfig> &inout ItemConfig) const
    {
        if (::ItemConfigUtils::LimitInventoryMax(ItemConfig))
        {
            return (::ItemConfigUtils::GetInventoryMax(ItemConfig) - this.GetTotalItemNum(ItemConfig));
        }
        if (::ItemConfigUtils::LimitOwnMax(ItemConfig))
        {
            return (::ItemConfigUtils::GetOwnMax(ItemConfig) - this.GetTotalItemNum(ItemConfig));
        }
        return 2147483647;
    }
    int GetBankRemainingCapacity(const TDataObjectPtr<FItemConfig> &inout ItemConfig) const
    {
        if (!(ItemConfig) || !(::ItemConfigUtils::LimitBankMax(ItemConfig)))
        {
            return 0;
        }
        if (!(FECSEntity(this.GetContext().GetLocalPlayer()).IsValid()))
        {
            return 0;
        }
        int local_13 = 0;
        Get local_18;
        const FC_GameplayItemBank& local_20 = local_18.opCall();
        if (local_20)
        {
            local_20.GetItems().Find(ItemConfig, local_13);
        }
        return FMath::Max((::ItemConfigUtils::GetBankMax(ItemConfig) - local_13), 0);
    }
    int GetItemNumToReachOwnLimit(const TDataObjectPtr<FItemConfig> &inout ItemConfig) const
    {
        return this.GetItemNumToReachInventoryLimit(ItemConfig);
    }
    void RegisterExternalItem(const TEUIModelRef<FM_ItemData> &inout ItemData)
    {
        TDataObjectPtr<FItemConfig> local_24 = ItemData.opArrow().GetConfig();
        bool local_49 = !(this.GetExternalItems().Contains(local_24));
        TEUIModelRef<FM_PlayerInventoryExternalItemProxy> local_54 = TEUIModelRef<FM_PlayerInventoryExternalItemProxy>(::FM_PlayerInventoryExternalItemProxy::Create(this.GetContext().Manager, ItemData, this.GetSumItem(local_24)));
        this.GetModify_ExternalItems().Add(local_24, local_54);
        return;
    }
    void UnregisterExternalItem(const TEUIModelRef<FM_ItemData> &inout ItemData)
    {
        if (!(ItemData))
        {
            return;
        }
        TDataObjectPtr<FItemConfig> local_26 = ItemData.opArrow().GetConfig();
        this.UpdateSumItem(local_26);
        return;
    }
    bool IsExternalItemRegistered(const TDataObjectPtr<FItemConfig> &inout ItemConfig) const
    {
        return this.GetExternalItems().Contains(ItemConfig);
    }
    void GS_RequestUseItem(const TEUIModelRef<FM_ItemData> &inout ItemData, const int ItemNum)
    {
        if (!(ItemData.IsValid()) || !(ItemData.opArrow().GetConfig()))
        {
            XError(ELog(59), "[FMS_PlayerInventory] GS_RequestUseItem failed, invalid item data.");
            return;
        }
        if (ItemNum <= 0)
        {
            XError(ELog(59), FString().Append("[FMS_PlayerInventory] GS_RequestUseItem failed, invalid count=").Append(ItemNum).Append("."));
            return;
        }
        CastTo local_36;
        TDataObjectPtr<FCommonItemConfig> local_60 = local_36.opCall();
        if (!(local_60) || local_60.opArrow().GSUseEffects.IsEmpty())
        {
            XError(ELog(59), FString().Append("[FMS_PlayerInventory] GS_RequestUseItem failed, item has no GSUseEffects. ItemConfig: ").Append(ItemData.opArrow().GetConfig().GetDataName().ToString()));
            return;
        }
        FPbUseItemReq local_70;
        local_70.SetItemId(ItemData.opArrow().GetConfig().opArrow().DataId);
        local_70.SetCount(::NumericUtils::AsUInt32(ItemNum));
        this.SendProto(local_70.ToWrapper());
        return;
    }
    void GS_OnUseItemRsp(const FPbUseItemRsp &inout Rsp)
    {
        if (Rsp.GetRetcode() != 0)
        {
            XWarning(ELog(59), FString().Append("[FMS_PlayerInventory]GS_OnUseItemRsp failed, retcode=").Append(Rsp.GetRetcode()).Append(", item_id=").Append(Rsp.GetItemId()).Append("."));
            return;
        }
        XLog(ELog(59), FString().Append("[FMS_PlayerInventory]GS_OnUseItemRsp success, item_id=").Append(Rsp.GetItemId()).Append("."));
        return;
    }
    void GS_RequestDecomposeItem(const TEUIModelRef<FM_ItemData> &inout ItemData, const int ItemNum)
    {
        int64 local_2 = 0;
        if (!(this.GetItemDataCache().opArrow().TryGetItemUid(ItemData, local_2)))
        {
            XError(ELog(59), FString().Append("Item data ").Append(ItemData).Append(" has no valid item uid"));
            return;
        }
        FPbDoItemDecomposeReq local_18;
        if (::ItemConfigUtils::IsStackable(ItemData.opArrow().GetConfig()))
        {
            local_18.SetItemId(ItemData.opArrow().GetConfig().opArrow().DataId);
            local_18.SetNum(::NumericUtils::AsUInt32(ItemNum));
        }
        else
        {
            local_18.AddGuidList(local_2);
        }
        this.SendProto(local_18.ToWrapper());
        return;
    }
    void GS_RequestBatchDecomposeItems(const TArray<uint64> &inout ItemGuidList)
    {
        FPbDoItemDecomposeReq local_4;
        for (auto local_20 : ItemGuidList)
        {
            local_4.AddGuidList(local_20);
        }
        this.SendProto(local_4.ToWrapper());
        return;
    }
    void GS_OnItemDecomposeRsp(const FPbDoItemDecomposeRsp &inout Rsp)
    {
        XLog(ELog(59), FString().Append("[FMS_PlayerInventory]GS_OnItemDecomposeRsp."));
        if (Rsp.GetRetcode() == 0)
        {
            FEUIModelRef local_14 = FEUIModelRef(this);
            FEUIMessageBus::PublishOrPatch(EUIMessageBus).opCall(local_14);
        }
        return;
    }
    int FindRootCategoryIndexForItem(const TDataObjectPtr<FItemConfig> &inout ItemConfig) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    void GS_RequestDestroyItem(const TDataObjectPtr<FItemConfig> &inout ItemConfig, const int ItemNum)
    {
        FPbDoItemDestroyReq local_4;
        local_4.SetItemId(ItemConfig.opArrow().DataId);
        local_4.SetNum(::NumericUtils::AsUInt32(ItemNum));
        this.SendProto(local_4.ToWrapper());
        return;
    }
    void MonitorGameplayInventoryChange(const FC_GameplayInventory &inout GameplayInventory)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void OnGameplayInventoryItemAddedNotify(const FCE_GameplayInventoryItemAddedNotify &inout Event)
    {
        for (auto& local_16 : Event.Items)
        {
            this.OnInventoryItemIncrease(local_16.GetConfig(), local_16.GetNumber());
        }
        return;
    }
    void GS_OnPlayerInventoryInit(const FPbPlayerInventoryNotify &inout Notify)
    {
        TArray<FPbItem> local_4;
        Notify.GetItemList(local_4);
        this.InitItemData(this.MakeItemRawDataFromGSNotify(local_4), false);
        return;
    }
    void GS_OnInventoryItemUpdate(const FPbInventoryItemNotify &inout Notify)
    {
        TArray<FPbItem> local_4;
        Notify.GetItemList(local_4);
        this.UpdateItemData(this.MakeItemRawDataFromGSNotify(local_4));
        return;
    }
    void GS_OnInventoryItemRemoved(const FPbInventoryDelItemNotify &inout Notify)
    {
        int local_5;
        TArray<uint64> local_4;
        local_5 = Notify.GetGuidList_Num();
        int local_7 = 0;
        for (; local_7 < local_5; ++local_7)
        {
            int local_10 = Notify.GetGuidList_Index(local_7);
            if (this.EnsureIsGSInventoryItemUid(local_10))
            {
                local_4.Add(local_10);
            }
        }
        this.RemoveItemData(local_4);
        return;
    }
    TArray<FPlayerInventoryItemRawData> MakeItemRawDataFromGSNotify(const TArray<FPbItem> &inout GSItemList)
    {
        int local_22;
        TArray<FPlayerInventoryItemRawData> local_4;
        for (auto& local_20 : GSItemList)
        {
            local_22 = local_20.GetGuid();
            if (!(this.EnsureIsGSInventoryItemUid(local_22)))
            {
                continue;
            }
            FPlayerInventoryItemRawData local_54;
            local_54.ItemUid = local_22;
            local_54.ItemConfig = this.GetPbItemConfig(local_20);
            local_54.ItemNum = this.GetPbItemNum(local_20);
            local_54.LastModifiedTimestamp = this.GetPbItemTimestamp(local_20);
            local_4.Add(local_54);
        }
        return local_4;
    }
    void RemoveItemData(const TArray<uint64> &inout ItemUidList)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void UpdateItemData(const TArray<FPlayerInventoryItemRawData> &inout ItemRawDataList)
    {
        this.UpdateItemDataInternal(ItemRawDataList, true, true);
        return;
    }
    void ConsumeRootCategoryRedDot(const uint64 ItemUid, const TDataObjectPtr<FItemConfig> &inout ItemConfig) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void InitItemData(const TArray<FPlayerInventoryItemRawData> &inout ItemRawDataList, const bool bIsFromGameplayInventory)
    {
        TArrayConstIterator<FPlayerInventoryItem> local_32;
        TArray<TDataObjectPtr<FItemConfig>> local_4;
        for (auto& local_24 : this.GetOwnedItems())
        {
            if (!(bIsFromGameplayInventory) != !(::GameplayInventoryUtils::ShouldAddToGameplayInventory(local_24.GetKey())))
            {
                continue;
            }
            for (; local_32.CanProceed;)
            {
                const FPlayerInventoryItem& local_40 = local_32.Proceed();
                if (bIsFromGameplayInventory)
                {
                    if (!(this.EnsureIsGameplayInventoryItemUid(local_40.GetItemUid())))
                    {
                        continue;
                    }
                }
                else
                {
                    if (!(this.EnsureIsGSInventoryItemUid(local_40.GetItemUid())))
                    {
                        continue;
                    }
                }
                this.GetItemDataCache().opArrow().RequireItemData(local_40.GetItemUid()).opArrow().SetNum(0);
            }
            local_4.Add(local_24.GetKey());
        }
        for (auto& local_62 : local_4)
        {
            local_62;
        }
        this.UpdateItemDataInternal(ItemRawDataList, false, false);
        return;
    }
    void UpdateItemDataInternal(const TArray<FPlayerInventoryItemRawData> &inout ItemRawDataList, const bool bNotifyChange, const bool bGenerateRedDot = false)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    int GetPbItemNum(const FPbItem &inout PbItem) const
    {
        if (PbItem.HasStackableItem())
        {
            return PbItem.GetStackableItem().GetCount();
        }
        return 1;
    }
    TDataObjectPtr<FItemConfig> GetPbItemConfig(const FPbItem &inout PbItem) const
    {
        return ::FItemConfig::GetByDataId(PbItem.GetItemId());
    }
    int64 GetPbItemTimestamp(const FPbItem &inout PbItem) const
    {
        return PbItem.GetTime();
    }
    void UpdateSumItem(const TDataObjectPtr<FItemConfig> &inout Config)
    {
        TEUIModelWeakRef<FM_ItemData> local_2;
        if (this.GetInventorySumItems().Find(Config, local_2))
        {
            if (local_2.IsValid())
            {
                this.CountOwnedItemNum(Config).SetNum();
            }
            else
            {
            }
        }
        return;
    }
    int CountOwnedItemNum(const TDataObjectPtr<FItemConfig> &inout Config) const
    {
        FPlayerInventoryItemList local_4;
        if (this.GetOwnedItems().Find(Config, local_4))
        {
            int local_6 = 0;
            for (auto& local_22 : local_4.Items)
            {
                TEUIModelRef<FM_ItemData> local_26 = ::FMS_ItemDataCache::Get(this.GetContext().Manager).RequireItemData(local_22.GetItemUid());
                TDataObjectPtr<FItemConfig> local_52;
                local_52 = local_26.opArrow().GetConfig();
                if ((local_52 == Config.opImplConv()))
                {
                    local_6 = local_6 + local_26.opArrow().GetNum();
                }
            }
            return local_6;
        }
        return 0;
    }
    const FPlayerInventoryItem FindInventoryItemByUid(const uint64 ItemUid) const
    {
        bool local_3 = false;
        const FPlayerInventoryItem __r;
        if (ItemUid == 0)
        {
        }
        else
        {
            TDataObjectPtr<FItemConfig> local_32 = this.GetItemDataCache().opArrow().RequireItemData(ItemUid).opArrow().GetConfig();
            local_3 = !(!(!(local_32)));
            if (local_3)
            {
            }
            else
            {
                if (this.GetOwnedItems().Contains(local_32))
                {
                    TArray<FPlayerInventoryItem> local_58;
                    for (auto& local_72 : local_58)
                    {
                        if (local_72.GetItemUid() == ItemUid)
                        {
                            return __r;
                        }
                    }
                }
            }
        }
        return local_3;
    }
    bool EnsureIsGameplayInventoryItemUid(const uint64 ItemUid) const
    {
        if (::GameplayInventoryUtils::IsGameplayInventoryItemUid(ItemUid))
        {
            return true;
        }
        XError(ELog(59), FString().Append("Item uid ").Append(ItemUid).Append(" is not a gameplay inventory item uid"));
        return false;
    }
    bool EnsureIsGSInventoryItemUid(const uint64 ItemUid) const
    {
        if (!(::GameplayInventoryUtils::IsGameplayInventoryItemUid(ItemUid)))
        {
            return true;
        }
        XError(ELog(59), FString().Append("Item uid ").Append(ItemUid).Append(" is not a GS inventory item uid"));
        return false;
    }
    void OnInventoryItemIncrease(const TDataObjectPtr<FItemConfig> &inout ItemConfig, const int IncreaseNum)
    {
        ::PlayerInventoryUtils::ShowInventoryAddMessage(this.GetManager(), ItemConfig, IncreaseNum);
        return;
    }
    const TMap<TDataObjectPtr<FItemConfig>, FPlayerInventoryItemList> GetOwnedItems() const property
    {
        const TMap<TDataObjectPtr<FItemConfig>, FPlayerInventoryItemList> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TMap<TDataObjectPtr<FItemConfig>, FPlayerInventoryItemList> GetModify_OwnedItems() property
    {
        TMap<TDataObjectPtr<FItemConfig>, FPlayerInventoryItemList> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetOwnedItems(const TMap<TDataObjectPtr<FItemConfig>, FPlayerInventoryItemList> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_OwnedItems = __Value;
        return;
    }
    const TMap<TDataObjectPtr<FItemConfig>, TEUIModelWeakRef<FM_ItemData>> GetInventorySumItems() const property
    {
        const TMap<TDataObjectPtr<FItemConfig>, TEUIModelWeakRef<FM_ItemData>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TMap<TDataObjectPtr<FItemConfig>, TEUIModelWeakRef<FM_ItemData>> GetModify_InventorySumItems() property
    {
        TMap<TDataObjectPtr<FItemConfig>, TEUIModelWeakRef<FM_ItemData>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetInventorySumItems(const TMap<TDataObjectPtr<FItemConfig>, TEUIModelWeakRef<FM_ItemData>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_InventorySumItems = __Value;
        return;
    }
    TEUIModelRef<FMS_ItemDataCache> GetItemDataCache() const property
    {
        this.TrackPropertyRead(2);
        return this.m_ItemDataCache;
    }
    void SetItemDataCache(const TEUIModelRef<FMS_ItemDataCache> &inout __Value) property
    {
        TEUIModelRef<FMS_ItemDataCache> local_2;
        local_2 = this.m_ItemDataCache;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ItemDataCache = __Value;
        return;
    }
    const TMap<TDataObjectPtr<FItemConfig>, TEUIModelRef<FM_PlayerInventoryExternalItemProxy>> GetExternalItems() const property
    {
        const TMap<TDataObjectPtr<FItemConfig>, TEUIModelRef<FM_PlayerInventoryExternalItemProxy>> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TMap<TDataObjectPtr<FItemConfig>, TEUIModelRef<FM_PlayerInventoryExternalItemProxy>> GetModify_ExternalItems() property
    {
        TMap<TDataObjectPtr<FItemConfig>, TEUIModelRef<FM_PlayerInventoryExternalItemProxy>> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetExternalItems(const TMap<TDataObjectPtr<FItemConfig>, TEUIModelRef<FM_PlayerInventoryExternalItemProxy>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_ExternalItems = __Value;
        return;
    }
}

struct __Lambda_UI_Private_Model_Inventory_M_PlayerInventory_184
{
    UPROPERTY()
    uint64 __ItemUid;

    __Lambda_UI_Private_Model_Inventory_M_PlayerInventory_184(const uint64 _InItemUid)
    {
        this.__ItemUid = _InItemUid;
        return;
    }
    uint64 GetItemUid() property
    {
        uint64 __r;
        return __r;
    }
    bool opCall(const FPlayerInventoryItem &inout Item)
    {
        return (Item.GetItemUid() == this.GetItemUid());
    }
}

struct __Lambda_UI_Private_Model_Inventory_M_PlayerInventory_215
{
    UPROPERTY()
    uint64 __ItemUid;

    __Lambda_UI_Private_Model_Inventory_M_PlayerInventory_215(const uint64 _InItemUid)
    {
        this.__ItemUid = _InItemUid;
        return;
    }
    uint64 GetItemUid() property
    {
        uint64 __r;
        return __r;
    }
    bool opCall(const FPlayerInventoryItem &inout Item)
    {
        return (Item.GetItemUid() == this.GetItemUid());
    }
}

struct __Lambda_UI_Private_Model_Inventory_M_PlayerInventory_861
{
    UPROPERTY()
    uint64 __ItemUid;

    __Lambda_UI_Private_Model_Inventory_M_PlayerInventory_861(const uint64 _InItemUid)
    {
        this.__ItemUid = _InItemUid;
        return;
    }
    uint64 GetItemUid() property
    {
        uint64 __r;
        return __r;
    }
    bool opCall(const FPlayerInventoryItem &inout Item)
    {
        return (Item.GetItemUid() == this.GetItemUid());
    }
}

struct __Lambda_UI_Private_Model_Inventory_M_PlayerInventory_997
{
    UPROPERTY()
    uint64 __ItemUid;

    __Lambda_UI_Private_Model_Inventory_M_PlayerInventory_997(const uint64 _InItemUid)
    {
        this.__ItemUid = _InItemUid;
        return;
    }
    uint64 GetItemUid() property
    {
        uint64 __r;
        return __r;
    }
    bool opCall(const FPlayerInventoryItem &inout Item)
    {
        return (Item.GetItemUid() == this.GetItemUid());
    }
}

namespace FM_PlayerInventoryExternalItemProxy
{
FM_PlayerInventoryExternalItemProxy& Create(const UObject ContextObject, const TEUIModelRef<FM_ItemData> &inout ExternalItemData, const TEUIModelRef<FM_ItemData> &inout ProxySumItem)
{
    return FM_PlayerInventoryExternalItemProxy::CreateByManager(EUIInternal::GetContextManager(ContextObject), ExternalItemData, ProxySumItem);
}
FM_PlayerInventoryExternalItemProxy CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_ItemData> &inout ExternalItemData, const TEUIModelRef<FM_ItemData> &inout ProxySumItem)
{
    FM_PlayerInventoryExternalItemProxy __r;
    TEUIModelRef<FM_PlayerInventoryExternalItemProxy> local_6 = TEUIModelRef<FM_PlayerInventoryExternalItemProxy>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_PlayerInventoryExternalItemProxy::ModelId, 0, ExternalItemData, ProxySumItem));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FM_PlayerInventoryExternalItemProxy;
}
void __OnExternalItemNumChanged(FM_PlayerInventoryExternalItemProxy &inout Model)
{
    Model.OnExternalItemNumChanged();
    return;
}
int __IndexOf_ExternalItemData()
{
    return 0;
}
int __IndexOf_ProxySumItem()
{
    return 1;
}
}
namespace FMS_PlayerInventory
{
FMS_PlayerInventory& Get(const UObject ContextObject)
{
    return FMS_PlayerInventory::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_PlayerInventory GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_PlayerInventory __r;
    TEUIModelRef<FMS_PlayerInventory> local_6 = TEUIModelRef<FMS_PlayerInventory>(EUIInternal::MakeModelWithManager(Manager, FMS_PlayerInventory::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelProtoRspDefine local_10;
    local_10.FunctionName = "__GS_OnUseItemRsp";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnItemDecomposeRsp";
    Result.ProtoRspDefines.Add(local_10);
    FEUIModelMonitorDefine local_22;
    local_22.FunctionName = "__MonitorGameplayInventoryChange";
    local_22.ComponentType = FC_GameplayInventory;
    Result.MonitorFunctions.Add(local_22);
    FEUIModelEventDefine local_32;
    local_32.FunctionName = "__OnGameplayInventoryItemAddedNotify";
    local_32.EventType = FCE_GameplayInventoryItemAddedNotify;
    Result.EventFunctions.Add(local_32);
    local_10.FunctionName = "__GS_OnPlayerInventoryInit";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnInventoryItemUpdate";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnInventoryItemRemoved";
    Result.ProtoRspDefines.Add(local_10);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_PlayerInventory;
}
void __GS_OnUseItemRsp(FMS_PlayerInventory &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnUseItemRsp(FPbUseItemRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnItemDecomposeRsp(FMS_PlayerInventory &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnItemDecomposeRsp(FPbDoItemDecomposeRsp::FromWrapper(ProtoWrapper));
    return;
}
void __MonitorGameplayInventoryChange(FMS_PlayerInventory &inout Model, const FECSEntity &inout Entity, const FC_GameplayInventory &inout Component)
{
    Model.MonitorGameplayInventoryChange(Component);
    return;
}
void __OnGameplayInventoryItemAddedNotify(FMS_PlayerInventory &inout Model, const FCE_GameplayInventoryItemAddedNotify &inout Event)
{
    Model.OnGameplayInventoryItemAddedNotify(Event);
    return;
}
void __GS_OnPlayerInventoryInit(FMS_PlayerInventory &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnPlayerInventoryInit(FPbPlayerInventoryNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnInventoryItemUpdate(FMS_PlayerInventory &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnInventoryItemUpdate(FPbInventoryItemNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnInventoryItemRemoved(FMS_PlayerInventory &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnInventoryItemRemoved(FPbInventoryDelItemNotify::FromWrapper(ProtoWrapper));
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
int __IndexOf_OwnedItems()
{
    return 0;
}
int __IndexOf_InventorySumItems()
{
    return 1;
}
int __IndexOf_ItemDataCache()
{
    return 2;
}
int __IndexOf_ExternalItems()
{
    return 3;
}
}

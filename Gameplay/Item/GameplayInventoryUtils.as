
namespace GameplayInventoryUtils
{
    const uint64 InvalidUid = 0;
    const int UnlimitedNum = 2147483647;
}
namespace GameplayInventoryUtils_Internal
{
    const uint64 GameplayInventoryItemUidFlag = 2147483648;
    const uint64 GameplayInventoryItemUidSeqMask = 2147483647;

}
struct __Lambda_Gameplay_Item_GameplayInventoryUtils_503
{
    UPROPERTY()
    FECSEntity __Player;

    __Lambda_Gameplay_Item_GameplayInventoryUtils_503()
    {
        return;
    }
    __Lambda_Gameplay_Item_GameplayInventoryUtils_503(const FECSEntity &inout _InPlayer)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FECSEntity GetPlayer() property
    {
        FECSEntity __r;
        return __r;
    }
    bool opCall(const uint64 &inout A, const uint64 &inout B)
    {
        int local_6 = 0;
        return (local_6.GetItems()[A].GetLastModifiedTimestamp() < local_6.GetItems()[B].GetLastModifiedTimestamp());
    }
}

namespace GameplayInventoryUtils
{
void AddItem(const FECSEntity &inout Player, const TDataObjectPtr<FItemConfig> &inout Config, const int Number)
{
    GameplayInventoryUtils_Internal::AddItemInternal(Player, Config, Number);
    return;
}
void AddItemWithNotify(const FECSEntity &inout Player, const TDataObjectPtr<FItemConfig> &inout Config, const int Number)
{
    GameplayInventoryUtils_Internal::AddItemInternal(Player, Config, Number);
    FFPTime local_6 = FFPTime(-1);
    SendEvent local_4;
    FCE_GameplayInventoryItemAddedNotify& local_10 = local_4.opCall(local_6);
    if (local_10)
    {
        local_10.Items.Add(FGameplayInventoryBatchAddItemData(Config, Number));
    }
    return;
}
void AddItemsWithNotify(const FECSEntity &inout Player, const TArray<FGameplayInventoryBatchAddItemData> &inout Items)
{
    for (auto& local_16 : Items)
    {
        GameplayInventoryUtils_Internal::AddItemInternal(Player, local_16.GetConfig(), local_16.GetNumber());
    }
    FFPTime local_24 = FFPTime(-1);
    SendEvent local_22;
    FCE_GameplayInventoryItemAddedNotify& local_26 = local_22.opCall(local_24);
    if (local_26)
    {
        local_26.Items = Items;
    }
    return;
}
void RemoveItem(const FECSEntity &inout Player, const TDataObjectPtr<FItemConfig> &inout Config, const int Number)
{
    GameplayInventoryUtils_Internal::RemoveItemInternal(Player, Config, Number);
    return;
}
void RemoveAllItems(const FECSEntity &inout Player, const TDataObjectPtr<FItemConfig> &inout Config)
{
    GameplayInventoryUtils_Internal::RemoveAllItemsInternal(Player, Config);
    return;
}
void Empty(const FECSEntity &inout Player)
{
    GameplayInventoryUtils_Internal::EmptyInternal(Player);
    return;
}
int GetInventoryItemNum(const FECSEntity &inout Player, const TDataObjectPtr<FItemConfig> &inout Config)
{
    if (!(Player.IsValid()))
    {
        XWarning(ELog(61), "GetInventoryItemNum: Player is invalid, return 0");
        return 0;
    }
    Get local_8;
    const FC_GameplayInventory& local_10 = local_8.opCall();
    if (local_10)
    {
        TArray<uint64> local_14;
        if (GameplayInventoryUtils_Internal::FindGameplayItemUids(Player, Config, local_14))
        {
            int local_15 = 0;
            for (auto local_30 : local_14)
            {
                local_15 = local_15 + local_10.GetItems()[local_30].GetNum();
            }
            return local_15;
        }
    }
    return 0;
}
int GetItemNum(const FECSEntity &inout Player, const uint64 Uid)
{
    Get local_4;
    const FC_GameplayInventory& local_6 = local_4.opCall();
    if (local_6)
    {
        FGameplayInventoryItemData local_38;
        if (local_6.GetItems().Find(Uid, local_38))
        {
            return local_38.GetNum();
        }
    }
    return 0;
}
TDataObjectPtr<FItemConfig> GetItemConfig(const FECSEntity &inout Player, const uint64 Uid)
{
    Get local_4;
    const FC_GameplayInventory& local_6 = local_4.opCall();
    if (local_6)
    {
        FGameplayInventoryItemData local_38;
        if (local_6.GetItems().Find(Uid, local_38))
        {
            return local_38.GetConfig();
        }
    }
    return TDataObjectPtr<FItemConfig>(nullptr);
}
TArray<TDataObjectPtr<FItemConfig>> GetAllItemConfigs(const FECSEntity &inout Player)
{
    TArray<TDataObjectPtr<FItemConfig>> local_4;
    Get local_8;
    const FC_GameplayInventoryCache& local_10 = local_8.opCall();
    if (local_10)
    {
        local_10.ConfigToUidList.GetKeys(local_4);
    }
    return local_4;
}
int GetItemNumToReachInventoryAndBankLimit(const FECSEntity &inout Player, const TDataObjectPtr<FItemConfig> &inout ItemConfig)
{
    int local_4 = FMath::Min(GameplayInventoryUtils::GetItemNumToReachInventoryMax(Player, ItemConfig), GameplayInventoryUtils::GetItemNumToReachTrunkMax(Player, ItemConfig));
    if (0 > 0)
    {
        int local_8;
        local_8 = 0;
        GetDefaulted local_12;
        const FC_GameplayItemBank& local_14 = local_12.opCall();
        if (local_14)
        {
            int local_15 = 0;
            int local_3 = GetBankMax();
            if (local_14.GetItems().Find(ItemConfig, local_15))
            {
                local_8 = FMath::Max(local_3 - local_15, 0);
            }
            else
            {
                local_8 = local_3;
            }
        }
        local_4 = local_4 + local_8;
    }
    return local_4;
}
int GetItemNumToReachInventoryOrTrunkLimit(const FECSEntity &inout Player, const TDataObjectPtr<FItemConfig> &inout ItemConfig)
{
    return FMath::Min(GameplayInventoryUtils::GetItemNumToReachInventoryMax(Player, ItemConfig), GameplayInventoryUtils::GetItemNumToReachTrunkMax(Player, ItemConfig));
}
int GetItemNumToReachTrunkMax(const FECSEntity &inout Player, const TDataObjectPtr<FItemConfig> &inout ItemConfig)
{
    if (!(ItemConfigUtils::LimitTrunkMax(ItemConfig)))
    {
        return 2147483647;
    }
    int local_2 = ItemConfigUtils::GetPackMax(ItemConfig);
    int local_3 = ItemConfigUtils::GetTrunkMax(ItemConfig);
    int local_4 = GameplayInventoryUtils_Internal::GetGameplayItemUidNumForTrunk(Player, ItemConfig.opArrow().ItemTrunk);
    if (local_4 <= 0)
    {
        return local_3 * local_2;
    }
    if (local_4 <= local_3)
    {
        int64 local_8 = GameplayInventoryUtils_Internal::FindLatestModifiedGameplayItemUid(Player, ItemConfig);
        if (local_8 == 0)
        {
            return ((local_3 - local_4) * local_2);
        }
        return ((local_3 - local_4) * local_2) + FMath::Max(0, local_2 - GameplayInventoryUtils::GetItemNum(Player, local_8));
    }
    return 0;
}
int GetItemNumToReachInventoryMax(const FECSEntity &inout Player, const TDataObjectPtr<FItemConfig> &inout ItemConfig)
{
    if (!(ItemConfigUtils::LimitInventoryMax(ItemConfig)))
    {
        return 2147483647;
    }
    return (ItemConfigUtils::GetInventoryMax(ItemConfig) - GameplayInventoryUtils::GetInventoryItemNum(Player, ItemConfig));
}
bool ShouldAddToGameplayInventory(const TDataObjectPtr<FItemConfig> &inout Config)
{
    FAngelscriptGameThreadScopeWorldContext local_2 = FAngelscriptGameThreadScopeWorldContext(ECS::GetUEWorld());
    if (ECS::GetRuntimeInfo().IsServer)
    {
        if (!(UGameDSConnectionSubsystem::Get().IsConnectedToGameServer()))
        {
            return true;
        }
    }
    else
    {
        if (ECS::GetRuntimeInfo().IsClient)
        {
            if (!(UGameClientConnectionSubsystem::Get().IsConnectedToGameServer()))
            {
                return true;
            }
        }
    }
    return ItemConfigUtils::IsDSItem(Config);
}
bool IsGameplayInventoryItemUid(const uint64 Uid)
{
    int64 local_2 = Uid & 2147483648;
    return (local_2 != 0);
}
void SaveGameplayInventoryToGSData(const FECSEntity &inout Player)
{
    int local_6 = 0;
    int local_44 = 0;
    FC_GameplayInventoryUidGenerator local_50;
    int local_137 = 0;
    if (!(!(!(local_6))))
    {
        return;
    }
    int local_21 = local_6.GetPlayerId();
    FPbDsPlayerInfo local_32 = UGameDSConnectionSubsystem::Get().GetPlayerInfo(local_21);
    if (!(local_32.IsValid()))
    {
        XError(ELog(27), FString().Append("Failed to get player info for player ").Append(Player));
        return;
    }
    if (!(!(!(local_44))))
    {
        return;
    }
    FECSEntity::Get<FC_GameplayInventoryUidGenerator> local_48 = FECSEntity::Get<FC_GameplayInventoryUidGenerator>(Player);
    if (!(!(!(local_50))))
    {
        return;
    }
    FPbDsPlayerItemCompInfo local_70 = local_32.GetItemCompInfo();
    local_70.ClearItemList();
    for (auto& local_88 : local_44.GetItems())
    {
        if (ItemConfigUtils::IsDSItem(GetConfig()))
        {
            FPbItemBin local_108 = local_70.AddItemList();
            GameplayInventoryUtils_Internal::SaveGameplayItemToPB(local_108, local_88.GetKey());
        }
    }
    int local_111 = int(local_50.NextSeqId);
    local_70.SetGuidSeqId(local_111);
    Get local_116;
    const FC_GameplayItemBank& local_118 = local_116.opCall();
    if (local_118)
    {
        for (auto& local_136 : local_118.GetItems())
        {
            local_136;
            if (local_21 > 0)
            {
                FPbItemBin local_98 = local_70.AddItemList();
                local_98.SetId(local_111);
                local_98.SetGuid(0);
                local_98.SetTime(0);
                local_98.GetStackableItem().SetCount(NumericUtils::AsUInt32(local_137));
            }
        }
    }
    return;
}
void InitGameplayInventory(const FECSEntity &inout Player)
{
    int local_6 = 0;
    int local_14 = 0;
    int local_20 = 0;
    int local_28;
    bool local_74;
    int local_260 = 0;
    if (!(!(!(local_6))))
    {
        return;
    }
    local_14.GetModify_Items().Empty(0);
    local_20.ConfigToUidList.Empty(0);
    local_28 = local_6.GetPlayerId();
    FPbDsPlayerInfo local_50 = UGameDSConnectionSubsystem::Get().GetPlayerInfo(local_28);
    if (local_50.IsValid())
    {
        FC_GameplayInventoryUidGenerator local_26;
        FPbDsPlayerItemCompInfo local_70 = local_50.GetItemCompInfo();
        int local_72 = local_70.GetItemList_Num();
        local_26.NextSeqId = local_70.GetGuidSeqId();
        if (local_72 == 0 && (int(local_26.NextSeqId) == 0))
        {
            XLog(ELog(0), FString().Append("LoadPlayer bagsize and nextitemid is 0, load item from config"));
        }
        int local_80 = 0;
        for (; local_80 < local_70.GetItemList_Num(); ++local_80)
        {
            FPbItemBin local_100 = local_70.GetItemList_Index(local_80);
            int64 local_102 = local_100.GetGuid();
            if (local_102 != 0)
            {
                local_74 = false;
            }
            else
            {
                int local_73 = local_100.GetTime();
                local_74 = (local_73 == 0);
            }
            if (local_74)
            {
                continue;
            }
            TDataObjectPtr<FItemConfig> local_130 = FItemConfig::GetByDataId(local_100.GetId());
            local_74 = !((local_130 == nullptr));
            if (local_74)
            {
                int local_156;
                FGameplayInventoryItemData local_186;
                GameplayInventoryUtils_Internal::LoadGameplayItemFromPB(local_100, local_156, local_186);
                local_14.GetModify_Items().Add(local_156, local_186);
                local_20.ConfigToUidList.FindOrAdd(local_130).GetUids().Add(local_156);
            }
        }
        for (auto& local_204 : local_20.ConfigToUidList)
        {
            local_204;
        }
        local_80 = 0;
        for (; local_80 < local_70.GetDsItemMsgList_Num(); ++local_80)
        {
            FPbAddItemMsg local_228 = local_70.GetDsItemMsgList_Index(local_80);
            int local_229 = 0;
            for (; local_229 < local_228.GetOpList_Num(); ++local_229)
            {
                FPbAddItemOp local_250 = local_228.GetOpList_Index(local_229);
                if (!(FItemConfig::GetByDataId(local_250.GetItemId())))
                {
                    XWarning(ELog(27), FString().Append("RecvPacket OnDSAddItemReq ItemMsg=").Append(local_228.GetIndex()).Append(" Op=").Append(local_250.GetItemId()).Append(" ").Append(local_250.GetCount()).Append(" ItemConfig not found"));
                    continue;
                }
                int local_27 = InventoryUtils::LowLevelAddInventoryItem(false, false, local_250.GetCount(), Player);
                if (local_27 > 0)
                {
                    XWarning(ELog(27), FString().Append("RecvPacket OnDSAddItemReq ItemMsg=").Append(local_228.GetIndex()).Append(" Op=").Append(local_250.GetItemId()).Append(" ").Append(local_250.GetCount()).Append(" RemainItemCount=").Append(local_27).Append(" send mail"));
                }
                local_70.SetDsCurItemMsgIndex(local_228.GetIndex());
            }
        }
        local_70.ClearDsItemMsgList();
        int local_229_2 = 0;
        for (; local_229_2 < local_70.GetItemList_Num(); ++local_229_2)
        {
            FPbItemBin local_90 = local_70.GetItemList_Index(local_229_2);
            int64 local_104 = local_90.GetGuid();
            if (local_104 != 0)
            {
                local_74 = false;
            }
            else
            {
                int local_71 = local_90.GetTime();
                local_74 = (local_71 == 0);
            }
            if (local_74)
            {
                TDataObjectPtr<FItemConfig> local_130_2 = FItemConfig::GetByDataId(local_90.GetId());
                if (!((local_130_2 == nullptr)))
                {
                    if (local_260.GetModify_Items().Contains(local_130_2))
                    {
                        XError(ELog(61), FString().Append("д»“еє“е­жЎЈй”™иЇЇпјЊе‡єзЋ°е¤љдёЄй‡Ќе¤Ќз‰©е“ЃпјЊuid = ").Append(local_90.GetId()));
                        continue;
                    }
                    local_260.GetModify_Items().Add(local_130_2, NumericUtils::AsInt32(local_90.GetStackableItem().GetCount()));
                }
            }
        }
    }
    return;
}
}
namespace GameplayInventoryUtils_Internal
{
void AddItemInternal(const FECSEntity &inout Player, const TDataObjectPtr<FItemConfig> &inout Config, const int Number)
{
    int local_6 = 0;
    int local_68 = 0;
    int local_7 = Number;
    int local_9 = ItemConfigUtils::GetPackMax(Config);
    int64 local_14 = GameplayInventoryUtils_Internal::FindLatestModifiedGameplayItemUid(Player, Config);
    if (local_14 != 0)
    {
        FGameplayInventoryItemData& local_18 = local_6.GetModify_Items()[local_14];
        int local_19 = FMath::Min(local_7, (local_9 - local_18.GetNum()));
        local_18.SetNum(local_18.GetNum() + local_19);
        local_7 = local_7 - local_19;
        if (local_19 > 0)
        {
            local_18.SetLastModifiedTimestamp(FASCommonUtils::GetTimestamp());
        }
    }
    while (local_7 > 0)
    {
        int64 local_12 = GameplayInventoryUtils_Internal::GenerateGameplayItemUid(Player);
        if (local_12 == 0)
        {
            Config.GetDataName();
            FString local_28 = FString();
            break;
        }
        FGameplayInventoryItemData local_62;
        local_62.SetConfig(Config);
        local_62.SetNum(FMath::Min(local_7, local_9));
        local_62.SetLastModifiedTimestamp(FASCommonUtils::GetTimestamp());
        local_6.GetModify_Items().Add(local_12, local_62);
        local_7 = local_7 - local_62.GetNum();
        local_68.ConfigToUidList.FindOrAdd(Config).GetUids().Add(local_12);
    }
    return;
}
void RemoveItemInternal(const FECSEntity &inout Player, const TDataObjectPtr<FItemConfig> &inout Config, const int Number)
{
    int local_6 = 0;
    int local_30 = 0;
    int local_7 = Number;
    TArray<uint64> local_12;
    if (GameplayInventoryUtils_Internal::FindGameplayItemUids(Player, Config, local_12))
    {
        int local_17 = local_12.Num() - 1;
        for (; local_17 >= 0; --local_17)
        {
            FGameplayInventoryItemData& local_24 = local_6.GetModify_Items()[local_12[local_17]];
            if (local_7 >= local_24.GetNum())
            {
                local_7 = local_7 - local_24.GetNum();
                local_30.ConfigToUidList[Config].GetUids().RemoveAt(local_17);
                if (local_7 <= 0)
                {
                    break;
                }
                continue;
            }
            local_24.SetNum((local_24.GetNum() - local_7));
            break;
        }
    }
    return;
}
void RemoveAllItemsInternal(const FECSEntity &inout Player, const TDataObjectPtr<FItemConfig> &inout Config)
{
    Modify local_4;
    FC_GameplayInventoryCache& local_6 = local_4.opCall();
    if (local_6)
    {
        if (local_6.ConfigToUidList.Contains(Config))
        {
            Modify local_12;
            if (local_12.opCall())
            {
                for (auto local_28 : local_6.ConfigToUidList[Config].GetUids())
                {
                }
            }
        }
    }
    return;
}
void EmptyInternal(const FECSEntity &inout Player)
{
    ModifyOrAdd local_4;
    FC_GameplayInventory& local_6 = local_4.opCall();
    if (local_6)
    {
        local_6.GetModify_Items().Empty(0);
    }
    Modify local_12;
    FC_GameplayInventoryCache& local_14 = local_12.opCall();
    if (local_14)
    {
        local_14.ConfigToUidList.Empty(0);
    }
    return;
}
uint64 FindLatestModifiedGameplayItemUid(const FECSEntity &inout Player, const TDataObjectPtr<FItemConfig> &inout Config)
{
    Get local_4;
    const FC_GameplayInventoryCache& local_6 = local_4.opCall();
    if (local_6)
    {
        if (local_6.ConfigToUidList.Contains(Config))
        {
            const TArray<uint64>& local_10 = local_6.ConfigToUidList[Config].GetUids();
            if (!(local_10.IsEmpty()))
            {
                return local_10.Last(0);
            }
        }
    }
    return 0;
}
bool FindGameplayItemUids(const FECSEntity &inout Player, const TDataObjectPtr<FItemConfig> &inout Config, TArray<uint64> &inout OutItems)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    bool __r; return __r;
}
int GetGameplayItemUidNum(const FECSEntity &inout Player, const TDataObjectPtr<FItemConfig> &inout Config)
{
    Get local_4;
    const FC_GameplayInventoryCache& local_6 = local_4.opCall();
    if (local_6)
    {
        if (local_6.ConfigToUidList.Contains(Config))
        {
            return local_6.ConfigToUidList[Config].GetUids().Num();
        }
    }
    return 0;
}
int GetGameplayItemUidNumForTrunk(const FECSEntity &inout Player, const EItemTrunk ItemTrunk)
{
    int local_1 = 0;
    Get local_6;
    const FC_GameplayInventoryCache& local_8 = local_6.opCall();
    if (local_8)
    {
        for (auto& local_28 : local_8.ConfigToUidList)
        {
            if (int(local_28.GetKey().opArrow().ItemTrunk) == int(ItemTrunk))
            {
                local_1 = local_1 + GetUids().Num();
            }
        }
    }
    return local_1;
}
uint64 GenerateGameplayItemUid(const FECSEntity &inout Player)
{
    int local_6 = 0;
    FC_GameplayInventoryUidGenerator local_16;
    if (!(!(!(local_6))))
    {
        return 0;
    }
    if (!(!(!(local_16))))
    {
        return 0;
    }
    int64 local_10 = (local_6.GetPlayerId() << 32) | 2147483648;
    int64 local_22 = int(local_16.NextSeqId) & 2147483647;
    int64 local_24 = local_10 | local_22;
    local_16.NextSeqId = (int(local_16.NextSeqId) + 1);
    if (int(local_16.NextSeqId) > 2147483647)
    {
        XWarning(ELog(61), FString().Append("Gameplay inventory uid generator overflow for player ").Append(Player).Append(", reset to 0"));
        local_16.NextSeqId = 0;
    }
    return local_24;
}
void SaveGameplayItemToPB(FPbItemBin &inout Item, const uint64 ItemUid, const FGameplayInventoryItemData &inout ItemData)
{
    Item.SetGuid(ItemUid);
    Item.SetId(ItemData.GetConfig().opArrow().DataId);
    Item.GetStackableItem().SetCount(NumericUtils::AsUInt32(ItemData.GetNum()));
    Item.SetTime(ItemData.GetLastModifiedTimestamp());
    return;
}
void LoadGameplayItemFromPB(const FPbItemBin &inout Item, uint64 &inout ItemUid, FGameplayInventoryItemData &inout ItemData)
{
    ItemUid = Item.GetGuid();
    ItemData.SetConfig(FItemConfig::GetByDataId(Item.GetId()));
    ItemData.SetNum(NumericUtils::AsInt32(Item.GetStackableItem().GetCount()));
    ItemData.SetLastModifiedTimestamp(Item.GetTime());
    return;
}
}

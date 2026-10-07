

struct FInventoryAddItemCollectScope
{
    UPROPERTY()
    bool bActive = false;
    UPROPERTY()
    bool bOwner = false;

    FInventoryAddItemCollectScope(const bool bEnable)
    {
        if (!(bEnable) || !(ECS::GetRuntimeInfo().IsServer))
        {
            return;
        }
        this.bActive = true;
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        FCS_InventoryAddItemCollect local_10;
        this.bOwner = (int(local_10.ScopeDepth) <= 0);
        if (this.bOwner)
        {
            local_10.ScopeDepth = 0;
            local_10.Records.Reset(0);
        }
        local_10.ScopeDepth = (int(local_10.ScopeDepth) + 1);
        return;
    }
    bool ShouldFlush() const
    {
        return (this.bActive && this.bOwner);
    }
    TArray<FInventoryAddItemRecord> GetRecords() const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Get local_6;
        const FCS_InventoryAddItemCollect& local_8 = local_6.opCall();
        if (local_8)
        {
            return local_8.Records;
        }
        return TArray<FInventoryAddItemRecord>();
    }
}

struct FInventoryAddItemReasonScope
{
    UPROPERTY()
    bool bActive;

    FInventoryAddItemReasonScope()
    {
        this.bActive = false;
        return;
    }
    FInventoryAddItemReasonScope(const uint Reason)
    {
        int local_10 = 0;
        this.bActive = false;
        if (!(ECS::GetRuntimeInfo().IsServer))
        {
            return;
        }
        this.bActive = true;
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        local_10.ReasonStack.Add(Reason);
        return;
    }
}

namespace InventoryUtils
{
UFUNCTION()
int AddInventoryItem(const FECSEntity &inout Entity, const TDataObjectPtr<FItemConfig> &inout Item, const int Number)
{
    bool local_1 = !(Entity.IsValid());
    bool local_2 = !(false);
    local_1 = local_1 == local_2 || (Item == nullptr);
    local_1 = local_1 || (Number <= 0);
    if (local_1)
    {
        return Number;
    }
    if (ECS::GetRuntimeInfo().IsServer)
    {
        FECSEntity local_12 = FASCommonUtils::GetUniquePlayerEntity(Entity);
        int local_3 = InventoryUtils::LowLevelAddInventoryItem(true, true, Number, local_12);
        int local_13 = Number - local_3;
        if (local_13 > 0)
        {
            InventoryUtils::RecordAddedInventoryItemToScope(local_12, Item, local_13);
        }
        if (local_3 > 0)
        {
            InventoryUtils::ShowInventoryLimitReachedMessage(Entity, Item);
        }
        return local_3;
    }
    return Number;
}
void RecordAddedInventoryItemToScope(const FECSEntity &inout Player, const TDataObjectPtr<FItemConfig> &inout Item, const int Number)
{
    if (!(ECS::GetRuntimeInfo().IsServer) || (Item == nullptr) || (Number <= 0))
    {
        return;
    }
    FECSWorldPtr local_6 = ECS::GetECSWorld();
    Modify local_10;
    FCS_InventoryAddItemCollect& local_12 = local_10.opCall();
    if (local_12)
    {
        if (int(local_12.ScopeDepth) > 0)
        {
            FInventoryAddItemRecord local_44;
            local_44.Player = Player;
            local_44.Item = Item;
            local_44.Number = Number;
            local_12.Records.Add(local_44);
        }
    }
    return;
}
int AddInventoryItemByName(const FECSEntity &inout Entity, const FName &inout ItemName, const int Number)
{
    UDataTable::FindDataObject local_8;
    TDataObjectPtr<FItemConfig> local_32 = local_8.opCall(ItemName);
    if (local_32)
    {
        return InventoryUtils::AddInventoryItem(Entity, local_32, Number);
    }
    return Number;
}
TDataObjectPtr<FItemConfig> GetItemConfigByName(const FName &inout ItemName)
{
    UDataTable::FindDataObject local_8;
    return local_8.opCall(ItemName);
}
UFUNCTION()
int GetCanAddToInventoryItemNum(const FECSEntity &inout Entity, const TDataObjectPtr<FItemConfig> &inout Item)
{
    if (!(Entity.IsValid()) || (Item == nullptr))
    {
        return 0;
    }
    if (!(GameplayInventoryUtils::ShouldAddToGameplayInventory(Item)))
    {
        return 2147483647;
    }
    bool local_2 = ECS::GetRuntimeInfo().IsClient;
    if (local_2)
    {
        FAngelscriptGameThreadScopeWorldContext local_6 = FAngelscriptGameThreadScopeWorldContext(ECS::GetUEWorld());
        return UScriptAsToCppModelFunctionRouter::Get().OnGetItemNumToReachInventoryAndBankLimit.Execute(Item);
    }
    return GameplayInventoryUtils::GetItemNumToReachInventoryAndBankLimit(FASCommonUtils::GetUniquePlayerEntity(Entity), Item);
}
UFUNCTION()
void ShowInventoryLimitReachedMessage(const FECSEntity &inout Entity, const TDataObjectPtr<FItemConfig> &inout Item)
{
    TArray<FTextArgument> local_4;
    Make local_10;
    local_4.Add(local_10.opImplConv());
    MessageHintUtils::ShowMessageHint(FASCommonUtils::GetUniquePlayerEntity(Entity), InventoryUtils::GetGlobalItemSettings().ItemLimitReachedHint, local_4);
    return;
}
void ShowItemInventoryReachLimitAddToBankMessage(const FECSEntity &inout Entity, const TDataObjectPtr<FItemConfig> &inout Item)
{
    TArray<FTextArgument> local_4;
    Make local_10;
    local_4.Add(local_10.opImplConv());
    MessageHintUtils::ShowMessageHint(FASCommonUtils::GetUniquePlayerEntity(Entity), InventoryUtils::GetGlobalItemSettings().ItemInventoryReachLimitAddToBankHint, local_4);
    return;
}
UFUNCTION()
bool RemoveInventoryItem(const FECSEntity &inout Entity, const TDataObjectPtr<FItemConfig> &inout Item, const int Number)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return false;
    }
    bool local_1 = !(Entity.IsValid());
    bool local_2 = !(false);
    local_1 = local_1 == local_2 || (Item == nullptr);
    if (local_1)
    {
        return false;
    }
    if (!(GameplayInventoryUtils::ShouldAddToGameplayInventory(Item)))
    {
        XError(ELog(61), FString().Append("Cannot remove GS item ").Append(Item.GetDataName()).Append(" using blueprint function."));
        return false;
    }
    FECSEntity local_18 = FASCommonUtils::GetUniquePlayerEntity(Entity);
    if (GameplayInventoryUtils::GetInventoryItemNum(local_18, Item) >= Number)
    {
        GameplayInventoryUtils::RemoveItem(local_18, Item, Number);
        return true;
    }
    return false;
}
bool RemoveInventoryItemByName(const FECSEntity &inout Entity, const FName &inout ItemName, const int Number)
{
    UDataTable::FindDataObject local_8;
    TDataObjectPtr<FItemConfig> local_32 = local_8.opCall(ItemName);
    if (local_32)
    {
        return InventoryUtils::RemoveInventoryItem(Entity, local_32, Number);
    }
    return false;
}
bool RemoveInventoryItemByInventoryID(const FECSEntity &inout Entity, const uint64 ItemUid, const int Number)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return false;
    }
    if (!(Entity.IsValid()) == !(false))
    {
        return false;
    }
    FECSEntity local_10 = FASCommonUtils::GetUniquePlayerEntity(Entity);
    if (GameplayInventoryUtils::GetItemNum(local_10, ItemUid) >= Number)
    {
        TDataObjectPtr<FItemConfig> local_36 = GameplayInventoryUtils::GetItemConfig(local_10, ItemUid);
        GameplayInventoryUtils::RemoveItem(local_10, local_36, Number);
        return true;
    }
    return false;
}
void ConsumeInventoryItem(const FECSEntity &inout Entity, const TDataObjectPtr<FItemConfig> &inout Item, const int Number)
{
    bool local_1;
    int local_76 = 0;
    if (!(Entity.IsValid()))
    {
        local_1 = false;
    }
    else
    {
        Has local_6;
        local_1 = local_6.opCall();
    }
    if (local_1)
    {
        bool local_7;
        Get local_12;
        local_7 = local_12.opCall().GetbNotCostItem();
        if (local_7)
        {
            return;
        }
    }
    if (InventoryUtils::RemoveInventoryItem(Entity, Item, Number))
    {
        if (Item && (int(Item.opArrow().ItemType) == 4))
        {
            CastTo local_20;
            TDataObjectPtr<FCombatItemConfig> local_44 = local_20.opCall();
            if (local_44)
            {
                FGameplayTag local_80;
                ECS::GetContextTime();
                local_76.CombatItemConfig = local_44;
                InventoryUtils::LogDataTrackCombatItemChange(Entity, Item, false, Number, InventoryUtils::GetInventoryItemNumber(Entity, Item), 1);
                if (false || local_80.MatchesTag(GameplayTags::ItemCategory_Usable_Combat_Attack) || local_80.MatchesTag(GameplayTags::ItemCategory_Usable_Combat_Solution) || local_80.MatchesTag(GameplayTags::ItemCategory_Usable_Combat_Support))
                {
                    CommissionStatsUtils::AddUsePropItemCount(Entity);
                }
            }
        }
    }
    return;
}
void LogDataTrackCombatItemChange(const FECSEntity &inout Entity, const TDataObjectPtr<FItemConfig> &inout Item, const bool bIsAdd, const int ChangeCount, const int CurrentCount, const uint Reason)
{
    int local_52 = 0;
    if (!(ECS::GetRuntimeInfo().IsServer) || !(Entity.IsValid()) || !(Item))
    {
        return;
    }
    CastTo local_6;
    if (!(local_6.opCall()))
    {
        return;
    }
    FECSEntity local_34 = Entity;
    Has local_38;
    if (!(local_38.opCall()))
    {
        FECSEntity local_42 = FASCommonUtils::GetUniqueAvatarPawnEntity(FASCommonUtils::GetUniquePlayerEntity(Entity));
        if (local_42.IsValid())
        {
            local_34 = local_42;
        }
    }
    int local_51 = 0;
    Get local_56;
    const FC_CombatState& local_58 = local_56.opCall();
    if (local_58)
    {
        if (local_58.bInCombat)
        {
            local_52 = local_58.SelfCombatSession.SessionID;
            local_51 = local_52;
        }
    }
    FPbPlayerLogDsCombatItemChange local_68;
    local_68.SetItemId(local_52);
    local_68.SetIsAdd(bIsAdd);
    local_68.SetChangeCount(FMath::Max(0, ChangeCount));
    local_68.SetCurrentCount(FMath::Max(0, CurrentCount));
    local_68.SetReason(Reason);
    local_68.SetAssociationId(local_51);
    ServerDataTrackerHelper::LogProtoMessage3WithPawn(local_34, 102598, local_68.ToWrapper());
    return;
}
UFUNCTION()
int GetInventoryItemNumber(const FECSEntity &inout Entity, const TDataObjectPtr<FItemConfig> &inout Item)
{
    bool local_1 = !(Entity.IsValid());
    bool local_2 = !(false);
    local_1 = local_1 == local_2 || (Item == nullptr);
    if (local_1)
    {
        return 0;
    }
    if (ECS::GetRuntimeInfo().IsClient)
    {
        FAngelscriptGameThreadScopeWorldContext local_6 = FAngelscriptGameThreadScopeWorldContext(ECS::GetUEWorld());
        return UScriptAsToCppModelFunctionRouter::Get().OnGetGetTotalItemNum.Execute(Item);
    }
    if (!(GameplayInventoryUtils::ShouldAddToGameplayInventory(Item)))
    {
        XError(ELog(61), FString().Append("Cannot get item num of GS item ").Append(Item.GetDataName()).Append(" using blueprint function on DS."));
        return 0;
    }
    return GameplayInventoryUtils::GetInventoryItemNum(FASCommonUtils::GetUniquePlayerEntity(Entity), Item);
}
int GetInventoryItemNumberByInventoryID(const FECSEntity &inout Entity, const uint64 ItemUid)
{
    if (!(Entity.IsValid()))
    {
        return 0;
    }
    if (ECS::GetRuntimeInfo().IsClient)
    {
        FAngelscriptGameThreadScopeWorldContext local_4 = FAngelscriptGameThreadScopeWorldContext(ECS::GetUEWorld());
        return UScriptAsToCppModelFunctionRouter::Get().OnGetItemNum.Execute(ItemUid);
    }
    return GameplayInventoryUtils::GetItemNum(FASCommonUtils::GetUniquePlayerEntity(Entity), ItemUid);
}
UFUNCTION()
bool HasItemInInventory(const FECSEntity &inout PlayerOrEntity, const TDataObjectPtr<FItemConfig> &inout Item)
{
    bool local_1 = !(PlayerOrEntity.IsValid());
    bool local_2 = !(false);
    local_1 = local_1 == local_2 || (Item == nullptr);
    if (local_1)
    {
        return false;
    }
    if (ECS::GetRuntimeInfo().IsClient)
    {
        FAngelscriptGameThreadScopeWorldContext local_4 = FAngelscriptGameThreadScopeWorldContext(ECS::GetUEWorld());
        return UScriptAsToCppModelFunctionRouter::Get().OnHasItem.Execute(Item);
    }
    if (!(GameplayInventoryUtils::ShouldAddToGameplayInventory(Item)))
    {
        XError(ELog(61), FString().Append("Cannot check if player has GS item ").Append(Item.GetDataName()).Append(" using blueprint function on DS."));
        return false;
    }
    FECSEntity local_20 = FASCommonUtils::GetUniquePlayerEntity(PlayerOrEntity);
    return (GameplayInventoryUtils::GetInventoryItemNum(local_20, Item) > 0);
}
UFUNCTION()
bool HasItemInInventoryByName(const FECSEntity &inout PlayerOrEntity, const FName &inout ItemName)
{
    UDataTable::FindDataObject local_8;
    TDataObjectPtr<FItemConfig> local_32 = local_8.opCall(ItemName);
    if (local_32)
    {
        return InventoryUtils::HasItemInInventory(PlayerOrEntity, local_32);
    }
    return false;
}
int LowLevelAddInventoryItem(const FECSEntity &inout OwnerEntity, const FItemConfig &inout Item, const int Number, const bool bShowMessage, const bool bAddToGSImmidiate)
{
    TDataObjectPtr<FItemConfig> local_24;
    bool local_25 = GameplayInventoryUtils::ShouldAddToGameplayInventory(local_24);
    if (local_25)
    {
        int local_26 = GameplayInventoryUtils::GetItemNumToReachInventoryAndBankLimit(OwnerEntity, local_24);
        int local_29 = FMath::Max(Number - local_26, 0);
        int local_28 = FMath::Min(Number, local_26);
        if (local_28 > 0)
        {
            int local_30 = GameplayInventoryUtils::GetItemNumToReachInventoryOrTrunkLimit(OwnerEntity, local_24);
            int local_27 = FMath::Min(local_30, local_28);
            int local_32 = local_28 - local_27;
            if (local_27 > 0)
            {
                if ((bShowMessage && (local_32 <= 0)))
                {
                    GameplayInventoryUtils::AddItemWithNotify(OwnerEntity, local_24, local_27);
                }
                else
                {
                    GameplayInventoryUtils::AddItem(OwnerEntity, local_24, local_27);
                }
            }
            if (local_32 > 0)
            {
                GameplayItemBankUtils::AddItem(OwnerEntity, local_24, local_32);
                if (bShowMessage)
                {
                    FFPTime local_42 = FFPTime(-1);
                    SendEvent local_40;
                    FCE_GameplayInventoryItemAddedNotify& local_44 = local_40.opCall(local_42);
                    if (local_44)
                    {
                        local_44.Items.Add(FGameplayInventoryBatchAddItemData(local_24, local_28));
                    }
                }
                InventoryUtils::ShowItemInventoryReachLimitAddToBankMessage(OwnerEntity, local_24);
            }
            InventoryUtils::LogDataTrackCombatItemChange(OwnerEntity, local_24, true, local_28, InventoryUtils::GetInventoryItemNumber(OwnerEntity, local_24), 2);
        }
        return local_29;
    }
    else
    {
        InventoryUtils_GSInventoryInternal::AddItemToGSInventory(OwnerEntity, local_24, Number);
        if (bAddToGSImmidiate)
        {
            FC_PlayerAddItemRequestPendingFlushTag local_78;
            Assign local_76;
            local_76.opCall(local_78);
        }
        return 0;
    }
}
void SyncInventoryInfoToAudioVo(const FECSEntity &inout InventoryGetter, const FECSEntity &inout ItemDropper, const TDataObjectPtr<FItemConfig> &inout Item, const int AddNum)
{
    FFPTime local_6 = FFPTime(-1);
    FCE_InventoryAudioVo local_10;
    local_10.InventoryGetter = InventoryGetter;
    local_10.InventoryDropper = ItemDropper;
    local_10.Item = Item;
    local_10.AddNum = AddNum;
    return;
}
void LoadItemInventory(const FECSEntity &inout PlayerEntity)
{
    if (!(PlayerEntity.IsValid()))
    {
        return;
    }
    GameplayInventoryUtils::InitGameplayInventory(PlayerEntity);
    Modify local_6;
    FC_MotionUnlock& local_8 = local_6.opCall();
    if (local_8)
    {
        local_8.Load(PlayerEntity);
    }
    int local_10 = StigmataUtils::GetEntityHealItemMax(PlayerEntity);
    int local_9 = FGameModeUtils::GetCombatRestrictionPotionMaxCount();
    if (local_9 >= 0)
    {
        local_10 = local_9;
    }
    UNearDeathSettings local_14 = NearDeathSettings::Get();
    int local_11 = InventoryUtils::GetInventoryItemNumber(PlayerEntity, TDataObjectPtr<FItemConfig>());
    if (local_11 < local_10)
    {
        int local_12 = local_10 - local_11;
        UNearDeathSettings local_14_2 = NearDeathSettings::Get();
        InventoryUtils::AddInventoryItem(PlayerEntity, TDataObjectPtr<FItemConfig>());
        XLog(ELog(0), FString().Append("[LoadItemInventory] Topped up potions: cur=").Append(local_11).Append(", max=").Append(local_10).Append(", added=").Append(local_12));
    }
    return;
}
int SaveItemInventory(const FECSEntity &inout Entity, const bool bSendToDBNow)
{
    if (!(Entity.IsValid()))
    {
        return 0;
    }
    FECSEntity local_10 = FASCommonUtils::GetUniquePlayerEntity(Entity);
    GameplayInventoryUtils::SaveGameplayInventoryToGSData(local_10);
    Modify local_14;
    FC_ItemQuickSlot& local_16 = local_14.opCall();
    if (local_16)
    {
        local_16.Save(local_10);
    }
    Modify local_20;
    FC_MotionUnlock& local_22 = local_20.opCall();
    if (local_22)
    {
        local_22.Save(local_10);
    }
    if (bSendToDBNow)
    {
        int local_23;
        Get local_28;
        local_23 = local_28.opCall().GetPlayerId();
        FPbDsPlayerInfo local_50 = UGameDSConnectionSubsystem::Get().GetPlayerInfo(local_23);
        XLog(ELog(0), FString().Append("SavePlayer Item:").Append(local_50.GetNickname()).Append(" data_version:").Append(local_50.GetDsDataVersion()).Append(" bag_size:").Append(local_50.GetBagItemList_Num()));
    }
    return 0;
}
void RemoveAllInventoryItems(const FECSEntity &inout Entity)
{
    if (!(Entity.IsValid()))
    {
        return;
    }
    GameplayInventoryUtils::Empty(FASCommonUtils::GetUniquePlayerEntity(Entity));
    return;
}
UGlobalItemSettings GetGlobalItemSettings()
{
    return GetGameplaySettings<UGlobalItemSettings>();
}
TDataObjectPtr<FItemQuickSlotConfig> GetQuickSlotConfigByName(const FName &inout QuickSlotName)
{
    InventoryUtils::GetItemQuickSlotTable();
    UDataTable::FindDataObject local_6;
    return local_6.opCall(QuickSlotName);
}
TDataObjectPtr<FItemConfig> GetQuickSlotItem(const FECSEntity &inout Entity, const TDataObjectPtr<FItemQuickSlotConfig> &inout QuickSlot)
{
    FASCommonUtils::GetUniquePlayerEntity(Entity);
    Get local_12;
    const FC_ItemQuickSlot& local_14 = local_12.opCall();
    if (local_14)
    {
        TDataObjectPtr<FItemConfig> local_40;
        if (local_14.GetQuickSlots().Find(QuickSlot, local_40))
        {
            return local_40;
        }
    }
    return TDataObjectPtr<FItemConfig>();
}
TDataObjectPtr<FItemConfig> GetQuickSlotItemByName(const FECSEntity &inout Entity, const FName &inout QuickSlotName)
{
    TDataObjectPtr<FItemQuickSlotConfig> local_24 = InventoryUtils::GetQuickSlotConfigByName(QuickSlotName);
    if (local_24)
    {
        return InventoryUtils::GetQuickSlotItem(Entity, local_24);
    }
    return TDataObjectPtr<FItemConfig>();
}
void SetQuickSlotItem(const FECSEntity &inout Entity, const TDataObjectPtr<FItemQuickSlotConfig> &inout QuickSlot, const TDataObjectPtr<FItemConfig> &inout Item)
{
    int local_20 = 0;
    if (!(InventoryUtils::CheckCanSetItemToQuickSlot(Entity, QuickSlot, Item)) || !(InventoryUtils::CheckAndNotifyItemCustomSetToQuickSlotCondition(Entity, QuickSlot, Item)))
    {
        return;
    }
    FASCommonUtils::GetUniquePlayerEntity(Entity);
    if (!(ECS::IsFixedFrameJob()))
    {
        FFPTime local_16 = FFPTime(-1);
        local_20.QuickSlot = QuickSlot;
        local_20.Item = Item;
        return;
    }
    ModifyOrAdd local_72;
    FC_ItemQuickSlot& local_74 = local_72.opCall();
    if (local_74)
    {
        TDataObjectPtr<FItemConfig> local_98;
        if (local_74.GetQuickSlots().Find(QuickSlot, local_98))
        {
            if ((local_98 == Item.opImplConv()))
            {
                return;
            }
        }
        if (Item)
        {
            local_74.GetModify_QuickSlots().Add(QuickSlot, Item);
        }
        else
        {
        }
        ModifyOrAdd local_126;
        FC_ItemQuickSlotChangeHistory& local_128 = local_126.opCall();
        if (local_128)
        {
            local_128.RecordChange(QuickSlot, local_98, Item);
        }
    }
    return;
}
void SetQuickSlotItemByName(const FECSEntity &inout Entity, const FName &inout QuickSlotName, const TDataObjectPtr<FItemConfig> &inout Item)
{
    TDataObjectPtr<FItemQuickSlotConfig> local_24 = InventoryUtils::GetQuickSlotConfigByName(QuickSlotName);
    if (local_24)
    {
        InventoryUtils::SetQuickSlotItem(Entity, local_24, Item);
    }
    return;
}
bool MatchFilter(const TDataObjectPtr<FItemConfig> &inout Item, const FItemQuickSlotFilter &inout Filter)
{
    CastTo local_4;
    TDataObjectPtr<FInventoryItemConfig> local_28 = local_4.opCall();
    if (local_28)
    {
        return Item && (int(Filter.AllowedItemType) == int(Item.opArrow().ItemType)) && local_28.opArrow().ItemCategory.AsGameplayTag().MatchesAny(Filter.AllowedItemCategories);
    }
    return false;
}
bool MatchQuickSlotFilter(const TDataObjectPtr<FItemConfig> &inout Item, const TDataObjectPtr<FItemQuickSlotConfig> &inout QuickSlot)
{
    if ((!(Item) || !(QuickSlot)))
    {
        return false;
    }
    if (!(QuickSlot.opArrow().ItemSpecifier.IsEmpty()))
    {
        return QuickSlot.opArrow().ItemSpecifier.IsMatch(Item);
    }
    return InventoryUtils::MatchFilter(Item, QuickSlot.opArrow().ItemFilter);
}
bool IsPresentationOnlyItem(const TDataObjectPtr<FItemConfig> &inout Item)
{
    bool local_29;
    if (!(Item))
    {
        local_29 = false;
    }
    else
    {
        CastTo local_4;
        local_29 = local_4.opCall();
    }
    return local_29;
}
void ForceSetQuickSlotItem_Internal(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FItemQuickSlotConfig> &inout QuickSlot, const TDataObjectPtr<FItemConfig> &inout Item)
{
    ModifyOrAdd local_4;
    FC_ItemQuickSlot& local_6 = local_4.opCall();
    if (local_6)
    {
        TDataObjectPtr<FItemConfig> local_32;
        local_6.GetQuickSlots().Find(QuickSlot, local_32);
        if ((local_32 == Item.opImplConv()))
        {
            return;
        }
        if (Item)
        {
            local_6.GetModify_QuickSlots().Add(QuickSlot, Item);
        }
        else
        {
        }
        ModifyOrAdd local_60;
        FC_ItemQuickSlotChangeHistory& local_62 = local_60.opCall();
        if (local_62)
        {
            local_62.RecordChange(QuickSlot, local_32, Item);
        }
    }
    return;
}
bool CheckCanSetItemToQuickSlot(const FECSEntity &inout Entity, const TDataObjectPtr<FItemQuickSlotConfig> &inout QuickSlot, const TDataObjectPtr<FItemConfig> &inout Item)
{
    bool local_1;
    int local_10 = 0;
    if (!(QuickSlot))
    {
        local_1 = false;
    }
    else
    {
        local_1 = Entity;
    }
    local_1 = !local_1;
    if (local_1)
    {
        return false;
    }
    if (!(Item))
    {
        return QuickSlot.opArrow().bAllowEmpty;
    }
    if (!(InventoryUtils::MatchQuickSlotFilter(Item, QuickSlot)))
    {
        return false;
    }
    if (!(QuickSlot.opArrow().bAllowUnownedItem) && (InventoryUtils::GetInventoryItemNumber(Entity, Item) <= 0))
    {
        return false;
    }
    local_1 = !(local_10);
    if (local_1)
    {
        return true;
    }
    TDataObjectPtr<FItemConfig> local_34;
    if (local_10.GetQuickSlots().Find(QuickSlot, local_34))
    {
        if ((local_34 == Item.opImplConv()))
        {
            return false;
        }
    }
    if (int(QuickSlot.opArrow().MutuallyExclusiveCondition) != 0)
    {
        for (auto& local_78 : local_10.GetQuickSlots())
        {
            if (!(InventoryUtils_QuickSlotInternal::FilterMatchesMutuallyExclusiveCondition(QuickSlot, local_78.GetKey())))
            {
                local_1 = false;
            }
            else
            {
                TDataObjectPtr<FItemConfig> local_102;
                TDataObjectPtr<FItemConfig> local_126;
                local_102 = local_126;
                local_1 = (local_102 == Item.opImplConv());
            }
            if (local_1)
            {
                return false;
            }
        }
    }
    return true;
}
bool CheckAndNotifyItemCustomSetToQuickSlotCondition(const FECSEntity &inout Entity, const TDataObjectPtr<FItemQuickSlotConfig> &inout QuickSlot, const TDataObjectPtr<FItemConfig> &inout Item)
{
    if (QuickSlot && (QuickSlot.GetDataName() == n"ConsumableItem_TemporaryAbility"))
    {
        FCommonTipsParam local_28;
        bool local_5;
        bool local_4 = RemnantUtils::CheckCanChangeRemnantSkill(FASCommonUtils::GetUniquePlayerEntity(Entity), FASCommonUtils::GetUniqueAvatarPawnEntity(Entity));
        local_5 = !(local_4);
        if (!(local_5))
        {
            local_5 = false;
        }
        else
        {
            local_5 = ECS::GetRuntimeInfo().IsClient;
        }
        if (local_5)
        {
            CommonPopup::Tips(NSLOCTEXT("Inventory", "Inventory_ChangeRemnantItem_FailHint", "еЅ“е‰Ќж— жі•дёўејѓе’’з‰©"), local_28);
        }
        return local_4;
    }
    bool local_19 = !(Item);
    if (local_19)
    {
        return true;
    }
    if (int(Item.opArrow().ItemType) == 4)
    {
        FCommonTipsParam local_28;
        bool local_5;
        FECSEntity local_18 = FASCommonUtils::GetUniqueAvatarPawnEntity(Entity);
        local_19 = local_18.IsValid() && FASCommonUtils::IsInCombat(local_18);
        if (local_19)
        {
            local_5 = ECS::GetRuntimeInfo().IsClient;
            if (local_5)
            {
                CommonPopup::Tips(NSLOCTEXT("Inventory", "Inventory_ChangeCombatItemInCombat_FailHint", "ж€ж–—дё­ж— жі•ж›ґжЌўж€ж–—йЃ“е…·"), local_28);
            }
            return false;
        }
    }
    else
    {
        FCommonTipsParam local_28;
        bool local_5;
        if (int(Item.opArrow().ItemType) == 101)
        {
            if (!(FASCommonUtils::GetControlledPawnEntity(Entity).IsValid()))
            {
                local_19 = false;
            }
            else
            {
                Has local_34;
                local_19 = local_34.opCall();
            }
            if (local_19)
            {
                if (ECS::GetRuntimeInfo().IsClient)
                {
                    CommonPopup::Tips(NSLOCTEXT("Inventory", "Inventory_ChangeMountWhileRiding_FailHint", "йЄ‘д№дё­ж— жі•ж›ґжЌўеќђйЄ‘"), local_28);
                }
                return false;
            }
        }
    }
    return true;
}
TArray<TDataObjectPtr<FItemConfig>> GetAllValidItemsForQuickSlot(const FECSEntity &inout Entity, const TDataObjectPtr<FItemQuickSlotConfig> &inout QuickSlot)
{
    TArray<TDataObjectPtr<FItemConfig>> local_4;
    TDataObjectIterator<FItemConfig> local_20;
    for (; local_20; )
    {
        if (!(local_20.GetDataPtr()))
        {
        }
        else
        {
            bool local_21 = InventoryUtils::CheckCanSetItemToQuickSlot(Entity, QuickSlot, local_20.GetDataPtr());
            if (local_21)
            {
                local_4.Add(local_20.GetDataPtr());
            }
        }
        local_20.opPreInc();
    }
    return local_4;
}
UDataTable GetItemQuickSlotTable()
{
    return InventoryUtils::GetGlobalItemSettings().ItemQuickSlotTable;
}
void InitQuickSlotConsumableItemsForPawn(const FECSEntity &inout PawnEntity)
{
    int local_16 = 0;
    int local_24 = 0;
    USkillConfig local_100;
    FBuffConfigRef local_104;
    if (!(FASCommonUtils::GetUniquePlayerEntity(PawnEntity).IsValid()))
    {
        return;
    }
    if (!(local_16))
    {
        return;
    }
    FECSWorldPtr local_18 = ECS::GetECSWorld();
    for (auto& local_42 : local_16.GetQuickSlots())
    {
        if (int(local_42.GetKey().opArrow().ItemFilter.AllowedItemType) != 4)
        {
            continue;
        }
        if (FGameModeUtils::IsTacticalSlotRestricted(local_42.GetKey()))
        {
            continue;
        }
        CastTo local_50;
        TDataObjectPtr<FCombatItemConfig> local_74 = local_50.opCall();
        if (!(local_74))
        {
            continue;
        }
        local_100 = local_74.opArrow().ItemSkillConfig;
        if (local_100 != nullptr)
        {
            InventoryUtils::EquipQuickSlotSkill(PawnEntity, local_100, EESMTriggerInputSlot(local_42.GetKey().opArrow().InputSlot));
        }
        if (local_104.IsValid())
        {
            FBuffUtils::AddBuff(PawnEntity, local_104, local_24.Time, PawnEntity, false, -1.0f, 1, false);
        }
    }
    return;
}
void EquipQuickSlotSkill(const FECSEntity &inout Entity, const USkillConfig ItemSkillConfig, const EESMTriggerInputSlot Slot)
{
    int local_6 = 0;
    if (int(Slot) != 11)
    {
        if (int(Slot) == 33)
        {
            local_6 = 9;
        }
        else
        {
            local_6 = 0;
        }
        FSkillUtils::CreateSkillEntityAndAddSkill(Entity.GetWorld(), Entity, ItemSkillConfig, ESkillSlot(0), false, true);
        FSkillUtils::BindSkillInputSlot(Entity, ItemSkillConfig, EESMTriggerInputSlot(Slot));
        return;
    }
    FSkillUtils::CreateSkillEntityAndAddSkill(Entity.GetWorld(), Entity, ItemSkillConfig, ESkillSlot(7), true, false, 1);
    return;
}
float32 UnequipQuickSlotSkill(const FECSEntity &inout Entity, const USkillConfig ItemSkillConfig, const EESMTriggerInputSlot Slot)
{
    float32 local_1 = 1.0f;
    Get local_6;
    const FC_Skill& local_8 = local_6.opCall();
    if (local_8)
    {
        int local_11 = FSkillUtils::GetSkillIndex(Entity, ItemSkillConfig);
        if (local_11 >= 0)
        {
            FECSEntity local_16 = local_8.GetSkillInstanceEntity(local_11);
            if (local_16)
            {
                float32 local_2 = float32((FSkillUtils::GetSkillCDRemainTime(Entity, local_11).ToSeconds()));
                float32 local_21 = FSkillUtils::GetSkillCDDuration(Entity, local_11);
                if (local_21 > 0.0f)
                {
                    local_1 = local_2 / local_21;
                }
                FSkillUtils::RemoveSkill(local_16, Entity, true);
            }
        }
    }
    FSkillUtils::UnbindSkillInputSlot(Entity, ItemSkillConfig, EESMTriggerInputSlot(Slot));
    return local_1;
}
uint GetCurrentAddItemReason()
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Get local_6;
    const FCS_InventoryAddItemReason& local_8 = local_6.opCall();
    if (local_8)
    {
        if (local_8.ReasonStack.Num() > 0)
        {
            return local_8.ReasonStack[(local_8.ReasonStack.Num() - 1)];
        }
    }
    return 0;
}
}
namespace InventoryUtils_QuickSlotInternal
{
bool FilterMatchesMutuallyExclusiveCondition(const TDataObjectPtr<FItemQuickSlotConfig> &inout Self, const TDataObjectPtr<FItemQuickSlotConfig> &inout Other)
{
    switch (int(Self.opArrow().MutuallyExclusiveCondition))
    {
    case 1:
    {
        FItemQuickSlotFilter local_18;
        return (local_18.opCmp(Other.opArrow().ItemFilter) == 0);
    }
    case 2:
    {
        int local_2 = int(Self.opArrow().ItemFilter.AllowedItemType);
        return (local_2 == int(Other.opArrow().ItemFilter.AllowedItemType));
    }
    case 3:
    {
        return Self.opArrow().ItemFilter.AllowedItemCategories.HasAllExact(Other.opArrow().ItemFilter.AllowedItemCategories) && Other.opArrow().ItemFilter.AllowedItemCategories.HasAllExact(Self.opArrow().ItemFilter.AllowedItemCategories);
    }
    }
    return false;
}
}
namespace InventoryUtils_GSInventoryInternal
{
void AddItemToGSInventory(const FECSEntity &inout Entity, const TDataObjectPtr<FItemConfig> &inout Config, const int AddNum)
{
    Get local_4;
    const FC_PlayerController& local_6 = local_4.opCall();
    if (local_6)
    {
        FPbDsPlayerInfo local_32 = UGameDSConnectionSubsystem::Get().GetPlayerInfo(local_6.GetPlayerId());
        if (local_32.IsValid())
        {
            FC_GSInventory local_38;
            FPbDsPlayerItemCompInfo local_58 = local_32.GetItemCompInfo();
            FPbAddItemMsg local_78 = local_58.AddGsItemMsgList();
            if (int(local_38.GSAddItemMsgIndex) == 0)
            {
                local_38.GSAddItemMsgIndex = (local_58.GetGsCurItemMsgIndex() + 1);
            }
            else
            {
                local_38.GSAddItemMsgIndex = (int(local_38.GSAddItemMsgIndex) + 1);
            }
            local_78.SetReason(InventoryUtils::GetCurrentAddItemReason());
            local_78.SetIndex(int(local_38.GSAddItemMsgIndex));
            FPbAddItemOp local_100 = local_78.AddOpList();
            int local_80_2 = Config.opArrow().DataId;
            local_100.SetItemId(local_80_2);
            local_100.SetCount(AddNum);
            XLog(ELog(59), FString().Append("AddItemToGS: ").Append(Config.opArrow().DataId).Append(" ").Append(AddNum).Append(" ").Append(local_38.GSAddItemMsgIndex));
        }
    }
    return;
}
}

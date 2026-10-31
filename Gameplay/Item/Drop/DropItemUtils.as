namespace DropItemsUtils
{
    const FConsoleVariable CVar_DropItem_ProjectToNavMesh = FConsoleVariable();
    const FConsoleVariable CVar_DropItem_ProjectToNavMeshQueryExtent = FConsoleVariable();
    const FConsoleVariable CVar_DropItem_ProjectToNavMeshCheckUpDistance = FConsoleVariable();
    const FConsoleVariable CVar_DropItem_ProjectToNavMeshShowDebug = FConsoleVariable();
    const int DropGroundingCheckDistance = 2000;
    const int DropGroundingCheckUpDistance = 100;

struct FDropWeigthChooseItem
{
    UPROPERTY()
    FName ConfigName = NAME_None;
    UPROPERTY()
    TArray<FDropItemData> Drops;
    UPROPERTY()
    EDropItemAllocation DropAllocation;
    UPROPERTY()
    TDataObjectPtr<FDropItemGroundBagConfig> GroundBagConfig;
    UPROPERTY()
    int RemnantUsableCount = 0;

    FDropWeigthChooseItem(const FDropItemConfig &inout Config)
    {
        this.ConfigName = Config.GetDataName();
        this.Drops = Config.Drops;
        this.DropAllocation = Config.DropAllocation;
        this.GroundBagConfig = Config.GetGroundBagConfig();
        return;
    }
}

struct FDropItemDeliver
{
    UPROPERTY()
    TArray<DropItemsUtils::FDropWeigthChooseItem> DropWeightChooseItems;
    UPROPERTY()
    TArray<FECSEntity> PlayerEntities;
    UPROPERTY()
    EDropItemAllocation OverrideDropAllocation;
    UPROPERTY()
    TDataObjectPtr<FDropItemGroundBagConfig> GroundBagConfig;

}

struct FDropRequestContext
{
    UPROPERTY()
    FDropMovementConfigData Movement;
    UPROPERTY()
    bool bHasOverrideTransform;
    UPROPERTY()
    FTransform OverrideTransform;

}

struct FDropSpawnParams
{
    UPROPERTY()
    EDropItemAllocation OverrideAllocation = EDropItemAllocation(0);
    UPROPERTY()
    FECSEntity PlayerEntity;
    UPROPERTY()
    FECSEntity DropSourceEntity;
    UPROPERTY()
    bool bNeedSobelSample;
    UPROPERTY()
    int SobelSequenceIndex = 0;
    UPROPERTY()
    FVector2D LastSobelValue;
    UPROPERTY()
    TArray<int> PendingItemNums;
    UPROPERTY()
    TArray<TDataObjectPtr<FItemConfig>> PendingItemConfigs;

    void ResetPendingItems()
    {
        this.PendingItemNums.Reset(0);
        this.PendingItemConfigs.Reset(0);
        return;
    }
}

void FillDropItemPackages(const FDropItemData &inout DropItemData, TArray<FDropItemPackage> &inout OutDropItemPackages)
{
    OutDropItemPackages = DropItemData.DropItemPackages;
    return;
}
bool IsDropMuted(const FECSEntity &inout DropSourceEntity, const EMuteDropItemType DropType)
{
    if (!(DropSourceEntity.IsValid()))
    {
        return false;
    }
    Get local_6;
    const FC_MuteDropItem& local_8 = local_6.opCall();
    if (local_8)
    {
        return local_8.HasMuteDropItemType(EMuteDropItemType(DropType));
    }
    return false;
}
bool ShouldBlockDropWithLog(const FECSEntity &inout DropSourceEntity, const EMuteDropItemType DropType, const FString &inout Reason)
{
    if (!(DropItemsUtils::IsDropMuted(DropSourceEntity, EMuteDropItemType(DropType))))
    {
        return false;
    }
    Get local_6;
    int local_8 = local_6.opCall().MuteDropItemMask;
    XLog(ELog(71), FString().Append("MuteDrop blocked drop. Reason=").Append(Reason).Append(", SourceEntity=").Append(DropSourceEntity.GetIdValue()).Append(", DropType=").Append(int(DropType)).Append(", Mask=").Append(local_8));
    return true;
}
bool CanTriggerDrop(const EDropTriggerType Type, const FECSEntity &inout Entity)
{
    Get local_4;
    const FC_DropItemSource& local_6 = local_4.opCall();
    if (local_6)
    {
        for (auto& local_22 : local_6.DropItems)
        {
            if (int(local_22.TriggerType) == int(Type))
            {
                return true;
            }
        }
    }
    return false;
}
void TryTriggerDropItems(const EDropTriggerType Type, const FECSEntity &inout DropSourceEntity, const FECSEntity &inout DropTriggerBy = ENTITY_NULL)
{
    Get local_4;
    const FC_DropItemSource& local_6 = local_4.opCall();
    if (local_6)
    {
        bool local_13;
        TArray<TDataObjectPtr<FDropItemConfigBase>> local_12;
        local_13 = false;
        for (auto& local_28 : local_6.DropItems)
        {
            if (int(local_28.TriggerType) == int(Type))
            {
                local_12.Add(local_28.Item);
                if ((FDropItemConfig == local_28.Item.GetType()) || (FDropItemGroupConfig == local_28.Item.GetType()))
                {
                    local_13 = true;
                }
            }
        }
        if (local_13)
        {
            FInventoryAddItemCollectScope local_38 = FInventoryAddItemCollectScope(local_6.bShowRewardPopup);
            DropItemsUtils::DropItemsFromBaseConfig(local_12, local_6.DropMovement, DropSourceEntity, DropTriggerBy);
            if (local_38.ShouldFlush())
            {
                DropItemsUtils::FlushRewardPopup(local_38.GetRecords(), 0.0f);
            }
        }
        else
        {
            XLog(ELog(71), FString().Append("DropItems: includeNewDropItem is false"));
        }
    }
    return;
}
void TryTriggerDropItemsByManualEvent(const FCE_DropManualTrigger &inout Event)
{
    FECSEntity local_4 = FECSEntity(Event.Sender);
    Get local_8;
    const FC_DropItemSource& local_10 = local_8.opCall();
    if (local_10)
    {
        bool local_17;
        TArray<TDataObjectPtr<FDropItemConfigBase>> local_16;
        local_17 = false;
        for (auto& local_32 : local_10.DropItems)
        {
            if (int(local_32.TriggerType) == 4)
            {
                local_16.Add(local_32.Item);
                if ((FDropItemConfig == local_32.Item.GetType()) || (FDropItemGroupConfig == local_32.Item.GetType()))
                {
                    local_17 = true;
                }
            }
        }
        if (local_17)
        {
            DropItemsUtils::FDropRequestContext local_92;
            local_92.Movement = local_10.DropMovement;
            if (Event.bHasOverridePosition)
            {
                FTransform local_116;
                local_116.SetLocation(Event.OverridePosition);
                local_116.SetRotation(FQuat::Identity);
                local_92.bHasOverrideTransform = true;
                local_92.OverrideTransform = local_116;
            }
            FInventoryAddItemCollectScope local_118 = FInventoryAddItemCollectScope(local_10.bShowRewardPopup);
            DropItemsUtils::DropItemsFromBaseConfigWithCtx(local_16, local_92, local_4, Event.DropTriggerBy);
            if (local_118.ShouldFlush())
            {
                DropItemsUtils::FlushRewardPopup(local_118.GetRecords(), 0.0f);
            }
        }
        else
        {
            XLog(ELog(71), FString().Append("DropItems: includeNewDropItem is false"));
        }
    }
    return;
}
void FlushRewardPopup(const TArray<FInventoryAddItemRecord> &inout Records, const float32 DelaySeconds = 0.f)
{
    bool local_2;
    int local_102;
    FDataObjectPtr local_128;
    if (!(ECS::GetRuntimeInfo().IsServer) || Records.IsEmpty())
    {
        return;
    }
    TArray<FECSEntity> local_6;
    for (auto& local_20 : Records)
    {
        if (local_20.Player.IsValid() && !(local_6.Contains(local_20.Player)))
        {
            local_6.Add(local_20.Player);
        }
    }
    Has local_40;
    for (auto& local_36 : local_6)
    {
        if (!(local_36.IsValid()) || !(local_40.opCall()))
        {
            continue;
        }
        TArray<TDataObjectPtr<FItemConfig>> local_44;
        TArray<int> local_48;
        for (auto& local_20 : Records)
        {
            local_2 = !((local_20.Player == local_36));
            if (local_2)
            {
                local_2 = true;
            }
            else
            {
                TDataObjectPtr<FItemConfig> local_76;
                local_76 = local_20.Item;
                local_2 = (local_76 == nullptr);
            }
            local_2 = local_2 || (int(local_20.Number) <= 0);
            if (local_2)
            {
                continue;
            }
            int local_101 = INDEX_NONE;
            local_102 = local_101;
            int local_103 = 0;
            for (; local_103 < local_44.Num(); ++local_103)
            {
                TDataObjectPtr<FItemConfig> local_100;
                local_100 = local_44[local_103];
                local_128;
                if ((local_100 == local_128))
                {
                    local_102 = local_103;
                    break;
                }
            }
            local_101 = INDEX_NONE;
            if (local_102 == local_101)
            {
                local_48.Add(local_44.Add(local_20.Item));
                continue;
            }
            local_101 = int(local_20.Number);
            int local_21 = local_48[local_102] + local_101;
        }
        if (local_44.IsEmpty())
        {
            continue;
        }
        FFPTime local_134 = FFPTime(-1);
        SendEvent local_132;
        FCE_RewardPopupNotify& local_136 = local_132.opCall(local_134);
        if (local_136)
        {
            local_136.DelaySeconds = DelaySeconds;
            int local_103_2 = 0;
            for (; local_103_2 < local_44.Num(); )
            {
                local_136.Items.Add(FGameplayInventoryBatchAddItemData(local_44[local_103_2], local_48[local_103_2]));
                ++local_103_2;
            }
        }
    }
    return;
}
void DropItemsFromBaseConfig(const TArray<TDataObjectPtr<FDropItemConfigBase>> &inout DropBaseConfigs, const FDropMovementConfigData &inout Movement, const FECSEntity &inout DropSourceEntity = ENTITY_NULL, const FECSEntity &inout DropTriggerBy = ENTITY_NULL)
{
    DropItemsUtils::FDropRequestContext local_52;
    local_52.Movement = Movement;
    DropItemsUtils::DropItemsFromBaseConfigWithCtx(DropBaseConfigs, local_52, DropSourceEntity, DropTriggerBy);
    return;
}
void DropItemsFromBaseConfigWithCtx(const TArray<TDataObjectPtr<FDropItemConfigBase>> &inout DropBaseConfigs, const DropItemsUtils::FDropRequestContext &inout RequestCtx, const FECSEntity &inout DropSourceEntity = ENTITY_NULL, const FECSEntity &inout DropTriggerBy = ENTITY_NULL)
{
    TArray<DropItemsUtils::FDropItemDeliver> local_4;
    DropItemsUtils::CollectDropDeliverForPlayers(DropBaseConfigs, local_4, DropTriggerBy);
    TArray<FECSEntity> local_8;
    DropItemsUtils::DropItemsFromDelivers(local_4, RequestCtx, DropSourceEntity, local_8);
    return;
}
void DropBodyPartDestroyDropItems(const FCharacterBodyPartConfig &inout ConfigData, const TArray<TDataObjectPtr<FDropItemConfigBase>> &inout DropBaseConfigs, const FDropMovementConfigData &inout Movement, const FECSEntity &inout DropSourceEntity, const FECSEntity &inout DropTriggerBy = ENTITY_NULL)
{
    DropItemsUtils::FDropRequestContext local_52;
    local_52.Movement = Movement;
    if (DropItemsUtils::ShouldBlockDropWithLog(DropSourceEntity, EMuteDropItemType(2), "DropBodyPartDestroyDropItems"))
    {
        return;
    }
    if (!(ConfigData.DestroyDropItemAttachmentSocket.IsNone()))
    {
        FTransform local_112 = FTransformUtils::GetSocketTransformInGameMesh(DropSourceEntity, ConfigData.DestroyDropItemAttachmentSocket, ECS::GetContextTime(), FDownsampleConfig());
        local_52.bHasOverrideTransform = true;
        local_52.OverrideTransform = local_112;
    }
    TArray<DropItemsUtils::FDropItemDeliver> local_116;
    DropItemsUtils::CollectDropDeliverForPlayers(DropBaseConfigs, local_116, DropTriggerBy);
    TArray<FECSEntity> local_120;
    DropItemsUtils::DropItemsFromDelivers(local_116, local_52, DropSourceEntity, local_120);
    return;
}
TArray<FECSEntity> DropItemsFromBPCaller(const TDataObjectPtr<FDropItemConfigBase> &inout DropBaseConfig, const FDropMovementConfigData &inout Movement, const FECSEntity &inout DropSourceEntity, const FECSEntity &inout DropTriggerBy, const bool bHasOverridePosition, const FVector &inout OverridePosition)
{
    TArray<FECSEntity> local_4;
    DropItemsUtils::FDropRequestContext local_56;
    local_56.Movement = Movement;
    if (bHasOverridePosition)
    {
        FTransform local_80;
        local_80.SetLocation(OverridePosition);
        local_80.SetRotation(FQuat::Identity);
        local_56.bHasOverrideTransform = true;
        local_56.OverrideTransform = local_80;
    }
    TArray<TDataObjectPtr<FDropItemConfigBase>> local_86;
    local_86.Add(DropBaseConfig);
    TArray<DropItemsUtils::FDropItemDeliver> local_92;
    DropItemsUtils::CollectDropDeliverForPlayers(local_86, local_92, DropTriggerBy);
    DropItemsUtils::DropItemsFromDelivers(local_92, local_56, DropSourceEntity, local_4);
    return local_4;
}
int RandomChooseFromDropItems(const DropItemsUtils::FDropWeigthChooseItem &inout WeightChooseItem)
{
    int local_1 = 0;
    for (auto& local_18 : WeightChooseItem.Drops)
    {
        if (int(local_18.Weight) > 0)
        {
            local_1 = local_1 + int(local_18.Weight);
        }
    }
    XLog(ELog(71), FString().Append("config ").Append(WeightChooseItem.ConfigName).Append(" TotalWeight: ").Append(local_1));
    if (local_1 <= 0)
    {
        return INDEX_NONE;
    }
    int local_19 = FMath::RandRange(1, local_1);
    int local_27 = 0;
    int local_28 = 0;
    for (; local_28 < WeightChooseItem.Drops.Num(); ++local_28)
    {
        if (WeightChooseItem.Drops[local_28].Weight > 0)
        {
            local_27 = local_27 + WeightChooseItem.Drops[local_28].Weight;
            if (local_19 <= local_27)
            {
                return local_28;
            }
        }
    }
    return INDEX_NONE;
}
FECSEntity CreateDropGroundBagEntity(const DropItemsUtils::FDropRequestContext &inout RequestCtx, DropItemsUtils::FDropSpawnParams &inout SpawnParams, const TDataObjectPtr<FDropItemGroundBagConfig> &inout GroundBagConfig)
{
    TSoftClassPtr<ACollectionPrefab> local_10;
    bool local_11 = false;
    bool local_12;
    UClass local_14;
    if (!(GroundBagConfig))
    {
        local_12 = false;
    }
    else
    {
        local_11 = !local_11;
        local_12 = local_11;
    }
    if (local_12)
    {
        if (IsValid(local_14))
        {
        }
    }
    else
    {
        EItemRarity local_17;
        EItemRarity local_18 = EItemRarity(0);
        local_17 = local_18;
        for (auto& local_32 : SpawnParams.PendingItemConfigs)
        {
            if (local_32 && (int(local_18) > int(local_17)))
            {
                local_17 = local_18;
            }
        }
        UGlobalItemSettings::Get().Drops.Find(local_17, local_10);
    }
    FVector local_42;
    FRotator local_48;
    DropItemsUtils::CreateDropInitPositionAndRotation(RequestCtx, SpawnParams, local_42, local_48);
    FECSEntity local_58 = DropItemsUtils::SpawnDropItemEntity(local_42, local_48, local_10.Get(), RequestCtx.Movement, SpawnParams.PlayerEntity);
    local_58.IsValid();
    if (local_58.IsValid())
    {
        FC_DropGroundBagInfo local_88;
        Assign local_62;
        local_62.opCall(local_88).SetGroundBagConfig(GroundBagConfig);
    }
    return local_58;
}
void AddPendingItemToDropGroundBag(const FECSEntity &inout BagEntity, DropItemsUtils::FDropSpawnParams &inout SpawnParams)
{
    Modify local_4;
    FC_CollectItem& local_6 = local_4.opCall();
    if (local_6)
    {
        local_6.GetModify_Items().Append(SpawnParams.PendingItemConfigs);
        local_6.GetModify_Nums().Append(SpawnParams.PendingItemNums);
        SpawnParams.ResetPendingItems();
        return;
    }
    XError(ELog(71), "AddPendingItemToDropGroundBag: invalid drop bag entity");
    return;
}
void DropItemsFromDelivers(const TArray<DropItemsUtils::FDropItemDeliver> &inout DropDelivers, const DropItemsUtils::FDropRequestContext &inout RequestCtx, const FECSEntity &inout DropSourceEntity, TArray<FECSEntity> &inout ResultEntities)
{
    for (auto& local_16 : DropDelivers)
    {
        for (auto& local_30 : local_16.PlayerEntities)
        {
            DropItemsUtils::FDropSpawnParams local_54;
            local_54.DropSourceEntity = DropSourceEntity;
            local_54.PlayerEntity = local_30;
            local_54.OverrideAllocation = EDropItemAllocation(local_16.OverrideDropAllocation);
            if (int(local_54.OverrideAllocation) != 3)
            {
                local_54.bNeedSobelSample = (local_16.DropWeightChooseItems.Num() > 1);
            }
            for (auto& local_72 : local_16.DropWeightChooseItems)
            {
                DropItemsUtils::InternalDropItemsFromWeightChooseItem(local_72, RequestCtx, local_54, ResultEntities);
            }
            if (int(local_16.OverrideDropAllocation) == 3 && (local_54.PendingItemConfigs.Num() > 0))
            {
                FECSEntity local_82 = DropItemsUtils::CreateDropGroundBagEntity(RequestCtx, local_54, local_16.GroundBagConfig);
                DropItemsUtils::AddPendingItemToDropGroundBag(local_82, local_54);
                if (local_82.IsValid())
                {
                    ResultEntities.Add(local_82);
                }
            }
        }
    }
    DropItemsUtils::ServerDataTrackLootDrop(DropSourceEntity, ResultEntities);
    return;
}
void DropItemsFromWeightChooseItem(const DropItemsUtils::FDropWeigthChooseItem &inout WeightChooseItem, const FDropMovementConfigData &inout Movement, const FECSEntity &inout DropSourceEntity = ENTITY_NULL)
{
    DropItemsUtils::FDropSpawnParams local_24;
    local_24.DropSourceEntity = DropSourceEntity;
    DropItemsUtils::FDropRequestContext local_76;
    local_76.Movement = Movement;
    TArray<FECSEntity> local_80;
    DropItemsUtils::InternalDropItemsFromWeightChooseItem(WeightChooseItem, local_76, local_24, local_80);
    return;
}
void InternalDropItemsFromWeightChooseItem(const DropItemsUtils::FDropWeigthChooseItem &inout WeightChooseItem, const DropItemsUtils::FDropRequestContext &inout RequestCtx, DropItemsUtils::FDropSpawnParams &inout SpawnParams, TArray<FECSEntity> &inout ResultEntities)
{
    int local_31;
    const FItemConfig& local_82;
    EDropItemAllocation local_83;
    UClass local_200;
    int local_232 = 0;
    int local_2 = DropItemsUtils::RandomChooseFromDropItems(WeightChooseItem);
    int local_1 = INDEX_NONE;
    if (local_2 == local_1)
    {
        XLog(ELog(71), FString().Append("RandomChooseFromDropItems: no valid drop item"));
        return;
    }
    const FDropItemData& local_12 = WeightChooseItem.Drops[local_2];
    EDropItemAllocation local_13 = WeightChooseItem.DropAllocation;
    if (int(SpawnParams.OverrideAllocation) != 0)
    {
        local_13 = SpawnParams.OverrideAllocation;
    }
    if (int(local_13) == 3)
    {
        if (int(SpawnParams.OverrideAllocation) != 3)
        {
            SpawnParams.ResetPendingItems();
        }
    }
    else
    {
        if (int(local_13) != 1)
        {
            if (!(SpawnParams.bNeedSobelSample))
            {
                bool local_3;
                local_3 = (local_12.DropItemPackages.Num() > 1);
                SpawnParams.bNeedSobelSample = local_3;
            }
        }
    }
    for (auto& local_30 : local_12.DropItemPackages)
    {
        local_31 = int(local_30.Num);
        TDataObjectPtr<FItemConfig> local_56 = local_30.Item;
        if ((local_56 == nullptr))
        {
            XLog(ELog(71), FString().Append("DropItemPackage: is not valid"));
            continue;
        }
        local_83 = local_82.DefaultDropAllocation;
        if (int(local_13) != 0)
        {
            local_83 = local_13;
        }
        if (int(local_83) == 0)
        {
            local_83 = EDropItemAllocation(2);
        }
        FECSEntity local_88 = SpawnParams.PlayerEntity;
        if (int(local_83) == 1)
        {
            Has local_92;
            if (!(local_88.IsValid()) || !(local_92.opCall()))
            {
                XError(ELog(71), FString().Append("AddInventoryItem: PlayerEntity (").Append(local_88).Append(") is not a valid player entity. Item: ").Append(local_82.ItemName).Append(", DropNum: ").Append(local_31));
                return;
            }
            local_31 = InventoryUtils::AddInventoryItem(local_88, TDataObjectPtr<FItemConfig>(local_82), local_31);
        }
        if (local_31 > 0)
        {
            EItemRarity local_171;
            bool local_94;
            local_94 = false;
            TDataObjectPtr<FTestThreeChooseOneItemConfig> local_142 = TDataObjectPtr<FTestThreeChooseOneItemConfig>(local_56.opImplConv());
            TArray<FTraitParam> local_170;
            EItemRarity local_172 = EItemRarity(0);
            local_171 = local_172;
            if (local_142)
            {
                local_94 = true;
                if (GetBoonRandomSlots())
                {
                    local_170 = BoonRandomDropUtils::RandomTraitsFromSlotsConfig(SpawnParams.PlayerEntity);
                    int local_177 = 0;
                    for (; local_177 < local_170.Num(); ++local_177)
                    {
                        FTraitParam& local_180 = local_170[local_177];
                        if (local_180.GetTrait())
                        {
                            if (int(local_172) > int(local_171))
                            {
                                local_171 = local_172;
                            }
                        }
                    }
                }
            }
            FECSEntity local_186 = FECSEntity(ENTITY_NULL);
            if (int(local_13) != 3)
            {
                FVector local_192;
                FRotator local_198;
                if (local_94)
                {
                    TSoftClassPtr<ACollectionPrefab> local_210;
                    if (UGlobalItemSettings::Get().BoonRarityPrefabs.Find(local_171, local_210))
                    {
                        local_200 = local_210.Get();
                    }
                }
                else
                {
                    local_200 = UGlobalItemSettings::Get().GetItemDropPrefab(local_82);
                }
                DropItemsUtils::CreateDropInitPositionAndRotation(RequestCtx, SpawnParams, local_192, local_198);
                local_186 = DropItemsUtils::SpawnDropItemEntity(local_192, local_198, local_200, RequestCtx.Movement, SpawnParams.PlayerEntity);
                if (local_186.IsValid())
                {
                    ResultEntities.Add(local_186);
                }
            }
            if (local_94)
            {
                if (local_186.IsValid())
                {
                    local_232.SetInfos(local_170);
                }
            }
            else
            {
                DropItemsUtils::AddDropCollectItem(local_186, local_31, local_56, WeightChooseItem, SpawnParams);
            }
        }
    }
    if (int(local_13) == 3 && ((int(SpawnParams.OverrideAllocation) != 3)) && (SpawnParams.PendingItemConfigs.Num() > 0))
    {
        FECSEntity local_220 = DropItemsUtils::CreateDropGroundBagEntity(RequestCtx, SpawnParams, WeightChooseItem.GroundBagConfig);
        DropItemsUtils::AddPendingItemToDropGroundBag(local_220, SpawnParams);
        if (local_220.IsValid())
        {
            ResultEntities.Add(local_220);
        }
    }
    return;
}
void CreateDropInitPositionAndRotation(const DropItemsUtils::FDropRequestContext &inout RequestCtx, DropItemsUtils::FDropSpawnParams &inout SpawnParams, FVector &out DropInitPosition, FRotator &out DropInitRotation)
{
    FDropMovementConfigData local_14;
    FVector local_6;
    DropInitPosition = local_6;
    DropInitRotation = FRotator();
    FECSEntity local_16 = SpawnParams.DropSourceEntity;
    if (int(local_14.Type) == 0)
    {
        const FC_Transform& local_52;
        Get local_50;
        float32 local_73;
        if (RequestCtx.bHasOverrideTransform)
        {
            DropInitPosition = RequestCtx.OverrideTransform.GetLocation();
            float local_32 = local_14.LocationZOffset;
            DropInitPosition.Z += local_32;
            local_32 = RequestCtx.OverrideTransform.GetRotation().Rotator().Yaw;
            DropInitRotation.Yaw = local_32;
        }
        else
        {
            local_52 = local_50.opCall();
            if (local_52)
            {
                DropInitPosition = local_52.GetPosition();
                float local_28_2 = FTransformUtils::GetGroundingPosition(SpawnParams.DropSourceEntity, local_52).Z;
                float32 local_29_2 = local_14.LocationZOffset;
                local_28_2 = local_28_2 + local_29_2;
                DropInitPosition.Z = local_28_2;
                local_28_2 = local_52.GetRotation().Rotator().Yaw;
                DropInitRotation.Yaw = local_28_2;
            }
        }
        if (SpawnParams.bNeedSobelSample)
        {
            if (int(SpawnParams.SobelSequenceIndex) == 0)
            {
                SpawnParams.LastSobelValue = (FMath::RandPointInCircle(0.5f) + FVector2D(0.5, 0.5));
            }
            FVector2D local_64 = ImportanceSampling::NextSobolCell2D(int(SpawnParams.SobelSequenceIndex), 1, SpawnParams.LastSobelValue);
            FVector2D local_56 = (local_64 * 2.0);
            float32 local_29_3 = local_14.DropAreaSize;
            float local_32_3 = local_29_3;
            FVector2D local_56_2 = ((local_56 - FVector2D::UnitVector) * local_32_3);
            DropInitPosition.X += local_56_2.X;
            local_32_3 = DropInitPosition.Y;
            local_32_3 = local_32_3 + local_56_2.Y;
            DropInitPosition.Y = local_32_3;
            ++SpawnParams.SobelSequenceIndex;
            SpawnParams.LastSobelValue = local_64;
        }
        local_73 = 100.0f;
        Get local_78;
        const FC_Collision& local_80 = local_78.opCall();
        if (local_80)
        {
            local_73 = local_80.GetScaledHeight();
        }
        if (DropItemsUtils::CVar_DropItem_ProjectToNavMesh.GetBool())
        {
            FVector local_86;
            FVector local_26(FVector::OneVector);
            float32 local_29_4 = DropItemsUtils::CVar_DropItem_ProjectToNavMeshQueryExtent.GetFloat();
            bool local_20 = UNavigationSystemV1::ProjectPointToNavigation(__GetWorldContext(), DropInitPosition, local_86, nullptr, TSubclassOf<UNavigationQueryFilter>(nullptr), (local_26 * local_29_4));
            if (local_20)
            {
                DropInitPosition = local_86;
                local_73 = DropItemsUtils::CVar_DropItem_ProjectToNavMeshCheckUpDistance.GetFloat();
            }
            if (DropItemsUtils::CVar_DropItem_ProjectToNavMeshShowDebug.GetBool())
            {
                Print(FString().Append("NaviLocation find ").Append(local_20).Append(": ").Append(local_86), 10.0f, FLinearColor::Yellow);
                DebugDraw::DrawDebugPoint(ECS::GetUEWorld(), local_86, 10.0f, FColor::Red, false, 10.0f, uint8(0));
            }
        }
        FHitResult local_172;
        FCollisionQueryParams local_210;
        local_210.bTraceComplex = false;
        local_210.AddIgnoredEntityId(local_16.GetId());
        FCollisionRollbackScope local_214 = FCollisionRollbackScope(ECS::GetECSWorld());
        FCollisionResponseParams local_232;
        FVector local_26_2(FVector::DownVector);
        float local_32_5 = (local_73 + 2000.0f);
        FVector local_26_3 = (DropInitPosition + (local_26_2 * local_32_5));
        FVector local_94_2(FVector::UpVector);
        float local_28_4 = local_73;
        bool local_234 = FPhysicsUtils::LineTraceSingle(local_16, false, EPhysicsTraceTag(21), local_172, (DropInitPosition + (local_94_2 * local_28_4)), local_26_3, FPhysicsUtils::ConvertToCollisionChannel(ETraceTypeQuery(5)), local_210, local_232);
        if (local_234)
        {
            local_32_5 = local_172.ImpactPoint.Z;
            local_32_5 = local_32_5 + 10.0;
            local_28_4 = local_32_5 + local_14.LocationZOffset;
            DropInitPosition.Z = local_28_4;
        }
        return;
    }
    if (int(local_14.Type) == 1)
    {
        const FC_Transform& local_52;
        Get local_50;
        if RequestCtx.bHasOverrideTransform
        {
            DropInitPosition = RequestCtx.OverrideTransform.GetLocation();
            DropInitRotation.Yaw = RequestCtx.OverrideTransform.GetRotation().Rotator().Yaw;
        }
        else
        {
            local_52 = local_50.opCall();
            if (local_52)
            {
                DropInitPosition = (FVector(local_52.GetPosition()) + local_14.StartLocationOffset);
                DropInitRotation.Yaw = local_52.GetRotation().Rotator().Yaw;
            }
        }
        float32 local_29_5 = local_14.RandomYawAngle;
        if (local_29_5 > 0.0f)
        {
            local_29_5 = (FMath::RandRange(0.0f, local_14.RandomYawAngle)) - (local_14.RandomYawAngle / 2.0f);
            float local_32_6 = DropInitRotation.Yaw;
            DropInitRotation.Yaw = (local_32_6 + local_29_5);
        }
    }
    return;
}
FECSEntity SpawnDropItemEntity(const FVector &inout DropInitPosition, const FRotator &inout DropInitRotation, const UClass DropPrefab, const FDropMovementConfigData &inout Movement, const FECSEntity &inout PlayerEntity)
{
    int local_20 = 0;
    int local_28 = 0;
    Assign local_32;
    int local_72 = 0;
    int local_122 = 0;
    int local_166 = 0;
    int local_186 = 0;
    if (DropPrefab != nullptr)
    {
        FECSEntity local_10 = ECS::RequestEntityByPrefabDeferred(TSubclassOf<AECSPrefab>(DropPrefab), DropInitPosition, DropInitRotation, EPrefabCollisionAlignment(2), EECSRegType(0), false);
        local_20.GetModify_Items().Reset(0);
        local_20.GetModify_Nums().Reset(0);
        if ((!((PlayerEntity == ENTITY_NULL))))
        {
            FC_NetRelevancePolicy local_33;
            local_32.opCall(local_33).RelevancePolicyType = (5 != 0);
            FC_DropItemExclusivePlayer local_40;
            Assign local_38;
            local_38.opCall(local_40).PlayerId = local_28.GetPlayerId();
            FNetPlayerMask local_42;
            local_42.SetBit(local_28.GetPlayerIndex(), true);
            FECSNetUtils::SetNetRelevance(local_10, local_42);
        }
        else
        {
            FC_NetRelevancePolicy local_33;
            local_32.opCall(local_33).RelevancePolicyType = false;
        }
        float local_48 = ECS::GetContextTime().ToSeconds();
        float32 local_51 = UGlobalItemSettings::Get().DropItemDefaultAutoDestroySeconds;
        local_48 = local_48 + local_51;
        FC_DropItemAutoDestroy local_62;
        Assign local_58;
        local_58.opCall(local_62).SetDestroyTimer(FFPTime(local_48));
        if (int(Movement.Type) == 1)
        {
            local_72.SetGravityScale(Movement.GravityScale);
            FC_DropItemWaitingLandTag local_78;
            Assign local_76;
            local_76.opCall(local_78);
            ModifyOrAdd local_82;
            FC_EntityHitCollider& local_84 = local_82.opCall();
            if (local_84)
            {
                local_84.SetEntity(local_10);
                local_84.SetLastPosition(DropInitPosition);
                local_84.GetExtraConfig().SetbHitSceneEvent(false);
                local_84.GetExtraConfig().SetbEndMovementWhenHitScene(true);
                local_84.GetExtraConfig().SetPropMovementCollisionCheckMode(EPropMovementCollisionCheckMode(0));
                local_84.GetExtraConfig().SetbCollisionCheckIncludeDynamic(true);
                FObjectTypeMask local_86;
                local_86.SetMask(1);
                local_84.GetExtraConfig().SetObjectTypeMask(local_86);
                local_84.GetExtraConfig().SetbMovementEndEvent(false);
            }
            local_122.SetMoveBeginTime(FFPTime(0));
            local_122.SetMoveTime(FFPTime(0));
            local_122.SetLastMoveTime(FFPTime(0));
            local_122.SetMoveTotalTime(FFPTime(-1));
            FRotator local_128 = DropInitRotation;
            if (Movement.RandomPitchMax >= Movement.RandomPitchMin)
            {
                float32 local_130 = FMath::RandRange(Movement.RandomPitchMin, Movement.RandomPitchMax);
                local_128.Pitch += local_130;
            }
            local_122.SetVelocity((local_128.GetForwardVector() * Movement.InitSpeed));
            if (Movement.AngleVelocity != 0.0f)
            {
                FVector3f local_148 = FVector3f(DropInitRotation.RotateVector(Movement.GetRotationAxisNormalized()));
                float32 local_130_2 = FMath::DegreesToRadians(Movement.AngleVelocity * float32(FECSWorld::FixedFrameInterval.ToSeconds()));
                local_166.SetDeltaRotation(FQuat4f(local_148, local_130_2));
                local_166.SetRotationBeginTime(FFPTime(0));
                local_166.SetRotationTotalTime(FFPTime(-1));
                if (Movement.AngleVelocityDecreseAfterLand > 0.0f)
                {
                    local_186.SetbEnable(false);
                    local_186.SetAngleVelocity(Movement.AngleVelocity);
                    local_186.SetDecreaseAngleVelocityRate(Movement.AngleVelocityDecreseAfterLand);
                    local_186.SetRotationAxis(local_148);
                }
            }
        }
        return local_10;
    }
    return ENTITY_NULL;
}
void AddDropCollectItem(const FECSEntity &inout DropEntity, const int DropNum, const TDataObjectPtr<FItemConfig> &inout Item, const DropItemsUtils::FDropWeigthChooseItem &inout WeightChooseItem, DropItemsUtils::FDropSpawnParams &inout SpawnParams)
{
    Assign local_88;
    FC_RemnantDropItemInfo local_90;
    if (!(DropEntity.IsValid()))
    {
        SpawnParams.PendingItemNums.Add(DropNum);
        SpawnParams.PendingItemConfigs.Add(Item);
        return;
    }
    Modify local_6;
    FC_CollectItem& local_8 = local_6.opCall();
    if (local_8)
    {
        local_8.GetModify_Items().Add(Item);
        local_8.GetModify_Nums().Add(DropNum);
    }
    else
    {
        XError(ELog(71), "AddDropCollectItem: invalid drop entity");
    }
    if (DropEntity)
    {
        if (TDataObjectPtr<FRemnantItemConfig>(Item.opImplConv()))
        {
            int local_2 = WeightChooseItem.RemnantUsableCount;
            if (local_2 > 0)
            {
                local_88.opCall(local_90).SetRemainUsableCount(int(WeightChooseItem.RemnantUsableCount));
                return;
            }
            local_88.opCall(local_90).SetRemainUsableCount(local_2);
        }
    }
    return;
}
TArray<TDataObjectPtr<FDropItemConfig>> CollectDisplayDropItemConfigs(const TArray<TDataObjectPtr<FDropItemConfigBase>> &inout DropBaseConfigs)
{
    TArray<TDataObjectPtr<FDropItemConfig>> local_4;
    for (auto& local_20 : DropBaseConfigs)
    {
        TDataObjectPtr<FDropItemConfig> local_44 = TDataObjectPtr<FDropItemConfig>(local_20.opImplConv());
        if (local_44)
        {
            local_4.Add(local_44);
        }
        else
        {
            if (TDataObjectPtr<FDropItemGroupConfig>(local_20.opImplConv()))
            {
                const FDropItemGroupConfig& local_168;
                for (auto& local_182 : local_168.Drops)
                {
                    TDataObjectPtr<FDropItemConfig> local_206 = local_182.Item;
                    if (local_182.DropRate > 0.0f)
                    {
                        local_4.Add(local_206);
                    }
                }
            }
        }
    }
    return local_4;
}
void CollectDropDeliverForPlayers(const TArray<TDataObjectPtr<FDropItemConfigBase>> &inout DropBaseConfigs, TArray<DropItemsUtils::FDropItemDeliver> &inout ResultDelivers, const FECSEntity &inout DropTriggerBy)
{
    bool local_11;
    Has local_28;
    DropItemsUtils::FDropWeigthChooseItem local_264;
    TArray<FECSEntity> local_4;
    int local_265 = 0;
    float32 local_381;
    if ((DropTriggerBy == ENTITY_NULL) || FGameUtils::GetLevelScriptEntities().Contains(DropTriggerBy))
    {
        local_4 = FGameUtils::GetAllPlayerControllerEntities(true);
    }
    else
    {
        FECSEntity local_20 = FASCommonUtils::GetUniquePlayerEntity(DropTriggerBy);
        Has local_24;
        bool local_5 = local_24.opCall();
        if (local_5)
        {
            local_4 = FTeamUtils::GetTeammates(DropTriggerBy);
        }
        else
        {
            if (!(local_20.IsValid()))
            {
                local_11 = false;
            }
            else
            {
                local_11 = local_28.opCall();
            }
            if (local_11)
            {
                local_4.Add(local_20);
            }
            else
            {
                local_4 = FGameUtils::GetAllPlayerControllerEntities(true);
            }
        }
    }
    FECSEntity local_16 = FASCommonUtils::GetUniquePlayerEntity(DropTriggerBy);
    if (!(local_16.IsValid()) || !(local_28.opCall()))
    {
        local_16 = ENTITY_NULL;
    }
    TDataObjectPtr<FBadWeatherDropItemRateUpRule> local_54 = TDataObjectPtr<FBadWeatherDropItemRateUpRule>(nullptr);
    FECSWorldPtr local_104 = ECS::GetECSWorld();
    Get local_108;
    const FCS_CommissionDSGlobalInfo& local_110 = local_108.opCall();
    if (local_110)
    {
        if (local_110.StartWeatherConfig)
        {
            local_54 = GetBadWeatherUpRule();
        }
    }
    for (auto& local_124 : DropBaseConfigs)
    {
        if (TDataObjectPtr<FDropItemConfig>(local_124.opImplConv()))
        {
            DropItemsUtils::FDropItemDeliver local_230;
            local_230.DropWeightChooseItems.Add(local_264);
            if (local_265 == 1)
            {
                local_230.PlayerEntities.Add(ENTITY_NULL);
            }
            else
            {
                if (local_265 == 2)
                {
                    local_230.PlayerEntities.Add(local_16);
                }
                else
                {
                    int local_29 = local_265;
                    if (local_29 == 0)
                    {
                        local_230.PlayerEntities.Append(local_4);
                    }
                }
            }
            ResultDelivers.Add(local_230);
        }
        else
        {
            if (TDataObjectPtr<FDropItemGroupConfig>(local_124.opImplConv()))
            {
                const FDropItemGroupConfig& local_340;
                DropItemsUtils::FDropItemDeliver local_230;
                local_230.OverrideDropAllocation = EDropItemAllocation(local_340.DropAllocation);
                local_230.GroundBagConfig = local_340.GetGroundBagConfig();
                int local_29_2 = int(local_340.DropType);
                if (local_29_2 == 1)
                {
                    local_230.PlayerEntities.Add(ENTITY_NULL);
                }
                else
                {
                    if (int(local_340.DropType) == 2)
                    {
                        local_230.PlayerEntities.Add(local_16);
                    }
                    else
                    {
                        local_29_2 = int(local_340.DropType);
                        if (local_29_2 == 0)
                        {
                            local_230.PlayerEntities.Append(local_4);
                        }
                    }
                }
                for (auto& local_380 : local_340.Drops)
                {
                    float32 local_382 = local_380.DropRate;
                    local_381 = local_382;
                    int local_383 = 1;
                    local_11 = local_380.bUseBadWeatherDropRateUpRule;
                    if (!(local_11))
                    {
                        local_11 = false;
                    }
                    else
                    {
                        local_11 = local_54;
                    }
                    if (local_11)
                    {
                        local_382 = local_382 / 100.0f;
                        local_381 = local_381 * FMath::Max(1.0f, local_382 + 1.0f);
                        local_383 = local_383 + FMath::Max(0, local_29_2);
                    }
                    int local_387 = 0;
                    for (; local_387 < local_383; ++local_387)
                    {
                        if (local_381 >= 100.0f || (FMath::RandRange(0.0f, 100.0f) < local_381))
                        {
                            local_230.DropWeightChooseItems.Add(local_264);
                        }
                    }
                }
                ResultDelivers.Add(local_230);
            }
        }
    }
    return;
}
void CollectDropItemConfigs(const TArray<TDataObjectPtr<FDropItemConfigBase>> &inout DropBaseConfigs, TArray<TDataObjectPtr<FDropItemConfig>> &inout ResultNewConfigs)
{
    for (auto& local_16 : DropBaseConfigs)
    {
        TDataObjectPtr<FDropItemConfig> local_40 = TDataObjectPtr<FDropItemConfig>(local_16.opImplConv());
        if (local_40)
        {
            ResultNewConfigs.Add(local_40);
        }
        else
        {
            if (TDataObjectPtr<FDropItemGroupConfig>(local_16.opImplConv()))
            {
                const FDropItemGroupConfig& local_164;
                for (auto& local_178 : local_164.Drops)
                {
                    if (local_178.DropRate > 0.0f)
                    {
                        TDataObjectPtr<FDropItemConfig> local_88;
                        local_88 = local_178.Item;
                        ResultNewConfigs.Add(local_88);
                        break;
                    }
                }
            }
            else
            {
                XLog(ELog(71), FString().Append("CollectDropItemConfigs: BaseConfig is not FDropItemConfig or FDropItemGroupConfig "));
            }
        }
    }
    return;
}
void ServerDataTrackLootDrop(const FECSEntity &inout DropSourceEntity, const TArray<FECSEntity> &inout ResultEntities)
{
    int local_3 = 0;
    int local_25;
    int local_53;
    int local_54;
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    int local_2 = 0;
    int local_4 = 0;
    Get local_8;
    const FC_MonsterInfo& local_10 = local_8.opCall();
    if (local_10)
    {
        if (local_10.GetMonsterConfig())
        {
            local_2 = local_3;
            local_4 = DropSourceEntity.GetIdValue();
        }
    }
    for (auto& local_24 : ResultEntities)
    {
        local_25 = 0;
        Get local_30;
        const FC_DropItemExclusivePlayer& local_32 = local_30.opCall();
        if (local_32)
        {
            local_25 = int(local_32.PlayerId);
        }
        FPbPlayerLogDsLootDrop local_42;
        local_42.SetMonsterId(local_2);
        local_42.SetMonsterSessionId(local_4);
        local_3 = local_24.GetIdValue();
        local_42.SetTreasureInstanceId(local_3);
        Get local_46;
        const FC_CollectItem& local_48 = local_46.opCall();
        if (local_48)
        {
            int local_51 = FMath::Min(local_48.GetItems().Num(), local_48.GetNums().Num());
            int local_52 = 0;
            for (; local_52 < local_51; ++local_52)
            {
                if (!(local_48.GetItems()[local_52]))
                {
                    continue;
                }
                local_53 = local_3;
                local_54 = local_48.GetNums()[local_52];
                FPbLootDropItemInfo local_64 = local_42.AddItemList();
                local_64.SetItemId(local_53);
                local_64.SetItemNum(local_54);
            }
        }
        FECSEntity local_78 = FASCommonUtils::FindPlayerEntityByUid(local_25);
        FPbPlayerLogDsCombatCommon local_92 = FPbPlayerLogDsCombatCommon(local_42.GetCommon());
        FECSEntity local_106 = FECSEntity(ENTITY_NULL);
        if (local_78.IsValid())
        {
            local_106 = FASCommonUtils::GetControlledPawnEntity(local_78);
        }
        FCombatStateUtils::GetDataTrackPbCombatCommonData(local_106, local_92);
        if (local_78.IsValid())
        {
            ServerDataTrackerHelper::LogProtoMessage3WithPlayer(local_78, 102512, local_42.ToWrapper());
        }
        else
        {
            ServerDataTrackerHelper::LogProtoMessage3NoPlayer(102512, local_42.ToWrapper());
        }
    }
    return;
}
void ServerDataTrackTreasureCollect(const FECSEntity &inout InteractSource, const FECSEntity &inout InteractTarget)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    if (!(InteractSource.IsValid()) || !(InteractTarget.IsValid()))
    {
        return;
    }
    FPbPlayerLogDsTreasureCollect local_12;
    local_12.SetTreasureInstanceId(InteractTarget.GetIdValue());
    ServerDataTrackerHelper::LogProtoMessage3WithPawn(InteractSource, 102516, local_12.ToWrapper());
    return;
}
}

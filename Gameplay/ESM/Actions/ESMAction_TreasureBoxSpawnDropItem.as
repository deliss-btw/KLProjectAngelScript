

// NOTE: class defaults are not authored in this module: UESMAction_TreasureBoxSpawnDropItem (default scalar field UESMAction.ActionFilterType has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class UESMAction_TreasureBoxSpawnDropItem : UESMBPBaseInstantAction
{
    UESMAction_TreasureBoxSpawnDropItem()
    {
        return;
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(1);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ::TreasureBoxSpawnDropItemUtils::SpawnDropItemsForEveryone(Context.GetEntity());
        return;
    }
}

namespace TreasureBoxSpawnDropItemUtils
{
FECSEntity SpawnTreasureForPlayer(const FECSEntity &inout TreasureConfigEntity, const TSubclassOf<AECSPrefab> &inout TreasurePrefabClass, const FECSEntity &inout PlayerControllerEntity, const bool bTrackTreasure = false)
{
    int local_6 = 0;
    int local_12 = 0;
    FECSEntity local_48;
    int local_82 = 0;
    int local_98 = 0;
    FRotator local_22 = local_12.GetRotation().Rotator();
    FVector local_40 = (FVector(local_12.GetPosition()) + local_6.SpawnLocationOffset);
    if (!(local_48.IsValid()))
    {
        return ENTITY_NULL;
    }
    ModifyOrAdd local_52;
    if (local_52.opCall())
    {
    }
    Get local_60;
    const FC_PlayerController& local_62 = local_60.opCall();
    if (local_62)
    {
        FC_NetRelevance local_68;
        Assign local_66;
        if (local_66.opCall(local_68))
        {
            FECSNetUtils::SetNetRelevance(local_48, FNetPlayerMask::MakeForPlayerIndex(local_62.GetPlayerIndex()));
        }
        FECSWorldPtr local_76 = ECS::GetECSWorld();
        FTreasureDropItemRecord local_90;
        local_90.DropEntity = local_48;
        local_90.BoxEntity = TreasureConfigEntity;
        local_82.DropItemsByPlayerIndex.FindOrAdd(local_62.GetPlayerIndex()).Records.Add(local_90);
    }
    bool local_99 = false;
    bool local_100 = false;
    for (auto& local_114 : local_6.DropItems)
    {
        int local_139 = int(local_114.TriggerType);
        local_98.AddDropItem(EDropTriggerType(local_139), TDataObjectPtr<FDropItemConfigBase>());
        if (int(local_114.TriggerType) == 3)
        {
            local_99 = true;
            continue;
        }
        local_100 = true;
    }
    if (local_99)
    {
        ModifyOrAdd local_144;
        local_144.opCall().bHasNonAutoDropItem = local_100;
    }
    if (bTrackTreasure)
    {
        FC_TreasureTracker local_158;
        Assign local_148;
        FC_TreasureTracker& local_160 = local_148.opCall(local_158);
        if (local_160)
        {
            local_160.TrackPlayerEntity = PlayerControllerEntity;
            local_160.TreasureBoxEntity = TreasureConfigEntity;
        }
    }
    return local_48;
}
void RespawnUncollectedTreasureForPlayer(const FECSEntity &inout TreasureBoxEntity, const TDataObjectPtr<FLevelObjectStatConfig> &inout LevelObjectStatConfig, const FECSEntity &inout PlayerControllerEntity)
{
    int local_4 = 0;
    int local_14 = 0;
    if (!(TreasureBoxEntity.IsValid()) || !(PlayerControllerEntity.IsValid()) || !(LevelObjectStatConfig.IsSet()))
    {
        return;
    }
    if ((int(TreasureBoxUtils::GetTreasureBoxRecordState(PlayerControllerEntity, local_4))) != 1)
    {
        return;
    }
    if (TreasureBoxSpawnDropItemUtils::HasTrackedTreasureForBoxAndPlayer(TreasureBoxEntity, PlayerControllerEntity))
    {
        return;
    }
    if (!(local_14))
    {
        return;
    }
    TSubclassOf<AECSPrefab> local_16 = local_14.TreasurePrefabClass.TryLoadClass();
    if (!(local_16.IsValid()))
    {
        return;
    }
    TreasureBoxSpawnDropItemUtils::SpawnTreasureForPlayer(TreasureBoxEntity, local_16, PlayerControllerEntity, true);
    return;
}
bool HasTrackedTreasureForBoxAndPlayer(const FECSEntity &inout BoxEntity, const FECSEntity &inout PlayerControllerEntity)
{
    int local_6 = 0;
    int local_16 = 0;
    if (!(local_6))
    {
        return false;
    }
    FECSWorldPtr local_10 = ECS::GetECSWorld();
    if (!(local_16) || !(local_16.DropItemsByPlayerIndex.Contains(local_6.GetPlayerIndex())))
    {
        return false;
    }
    for (auto& local_34 : local_16.DropItemsByPlayerIndex[local_6.GetPlayerIndex()].Records)
    {
        if ((local_34.BoxEntity == BoxEntity))
        {
            return true;
        }
    }
    return false;
}
void DestroyTrackedTreasureForPlayerIndex(const int PlayerIndex)
{
    int local_8 = 0;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if (!(local_8))
    {
        return;
    }
    if (!(local_8.DropItemsByPlayerIndex.Contains(PlayerIndex)))
    {
        return;
    }
    FTreasureDropItemList& local_12 = local_8.DropItemsByPlayerIndex[PlayerIndex];
    for (auto& local_26 : local_12.Records)
    {
        if (local_26.DropEntity.IsValid())
        {
            FASCommonUtils::DestroyEntity(local_26.DropEntity);
        }
    }
    return;
}
void DestroyTrackedTreasureForBox(const FECSEntity &inout BoxEntity)
{
    int local_10 = 0;
    TArray<FTreasureDropItemRecord> local_30;
    if (!(BoxEntity.IsValid()))
    {
        return;
    }
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    if (!(local_10))
    {
        return;
    }
    for (auto& local_28 : local_10.DropItemsByPlayerIndex)
    {
        local_28;
        int local_34 = local_30.Num() - 1;
        for (; local_34 >= 0; --local_34)
        {
            if ((!((FECSEntity(local_30[local_34].BoxEntity) == BoxEntity))))
            {
                continue;
            }
            if (local_30[local_34].DropEntity.IsValid())
            {
                FASCommonUtils::DestroyEntity(local_30[local_34].DropEntity);
            }
            local_30.RemoveAt(local_34);
        }
    }
    return;
}
void UnregisterTrackedTreasure(const FECSEntity &inout DropEntity)
{
    int local_10 = 0;
    TArray<FTreasureDropItemRecord> local_30;
    if (!(DropEntity.IsValid()))
    {
        return;
    }
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    if (!(local_10))
    {
        return;
    }
    for (auto& local_28 : local_10.DropItemsByPlayerIndex)
    {
        local_28;
        int local_34 = local_30.Num() - 1;
        for (; local_34 >= 0; --local_34)
        {
            if ((FECSEntity(local_30[local_34].DropEntity) == DropEntity))
            {
                local_30.RemoveAt(local_34);
            }
        }
    }
    return;
}
void SpawnDropItemsForEveryone(const FECSEntity &inout TreasureConfigEntity)
{
    int local_6 = 0;
    if (!(local_6))
    {
        return;
    }
    TSubclassOf<AECSPrefab> local_10 = local_6.TreasurePrefabClass.TryLoadClass();
    if (!(local_10.IsValid()))
    {
        return;
    }
    TArray<FECSEntity> local_20 = FGameUtils::GetAllPlayerControllerEntities(true);
    for (auto& local_34 : local_20)
    {
        TreasureBoxSpawnDropItemUtils::SpawnTreasureForPlayer(TreasureConfigEntity, local_10, local_34, false);
    }
    return;
}
FECSEntity SpawnDropItemsForTriggerPlayer(const FECSEntity &inout TreasureConfigEntity, const FECSEntity &inout TriggerPlayerEntity, const bool bTrackTreasure = false)
{
    int local_6 = 0;
    if (!(local_6))
    {
        return ENTITY_NULL;
    }
    TSubclassOf<AECSPrefab> local_10 = local_6.TreasurePrefabClass.TryLoadClass();
    if (!(local_10.IsValid()))
    {
        return ENTITY_NULL;
    }
    if (!(TriggerPlayerEntity.IsValid()))
    {
        return ENTITY_NULL;
    }
    FECSEntity local_16 = FECSEntity(ENTITY_NULL);
    Get local_20;
    const FC_ControlledByPlayer& local_22 = local_20.opCall();
    if (local_22)
    {
        local_16 = FECSEntity(local_22.GetPlayerEntity());
    }
    if (!(local_16.IsValid()))
    {
        return ENTITY_NULL;
    }
    return TreasureBoxSpawnDropItemUtils::SpawnTreasureForPlayer(TreasureConfigEntity, local_10, local_16, bTrackTreasure);
}
}

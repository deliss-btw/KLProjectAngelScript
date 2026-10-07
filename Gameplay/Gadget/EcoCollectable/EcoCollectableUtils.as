
namespace EcoCollectableUtils
{
FName GetWeatherName(const FECSEntity &inout NonSyncedEntity)
{
    int local_6 = 0;
    if (!(local_6))
    {
        return NAME_None;
    }
    FECSEntity local_16 = FWeatherUtils::GetWeatherRegionEntityBySoftPtr(local_6.LayoutInfo.SpawnerBoundWeatherVolume);
    if (local_16.IsValid())
    {
        return FWeatherUtils::GetWeatherNameFromRegionEntity(local_16);
    }
    return NAME_None;
}
bool CalculateVisibilityState(const FECSEntity &inout NonSyncedEntity, EEcoCollectableNonSyncedVisibilityStatus &out OutVisibilityStatus)
{
    int local_8;
    int local_9;
    int local_10;
    float32 local_40 = 0.0f;
    FC_EcoCollectableNonSyncedVisualStatus& local_48;
    bool local_49;
    FDataObjectPtr local_98;
    int local_175;
    OutVisibilityStatus = EEcoCollectableNonSyncedVisibilityStatus(0);
    FName local_6 = EcoCollectableUtils::GetWeatherName(NonSyncedEntity);
    if ((local_6 == NAME_None))
    {
        return false;
    }
    int local_12 = FTimeOfDayUtils::GetCurrentTimeOfDayInSeconds();
    FTimeOfDayUtils::GetTimeOfDayHourAndMinute(local_12, local_8, local_9, local_10);
    int local_11 = FEcologySceneInfoUtils::CombineDayTime(local_9, local_10);
    Modify local_18;
    FC_EcoCollectableLayoutInfo& local_20 = local_18.opCall();
    if (local_20)
    {
        if ((local_20.CachedSpawnerEntityId == ENTITY_ID_NULL))
        {
            local_20.CachedSpawnerEntityId = EcologyConfigUtils::FindConfigByUUID(local_20.LayoutInfo.SpawnerGUID, ECS::GetECSWorld());
        }
        if (!((local_20.CachedSpawnerEntityId == ENTITY_ID_NULL)))
        {
            FECSEntity local_32 = FECSEntity(local_20.CachedSpawnerEntityId);
            Get local_36;
            const FC_EcoCollectableSpawnerRuntime& local_38 = local_36.opCall();
            if (local_38)
            {
                bool local_42;
                float32 local_41;
                float32 local_39;
                local_39 = 1.0f;
                local_41 = 1.0f;
                local_42 = false;
                if (ECS::GetRuntimeInfo().IsClient)
                {
                    if (!(local_48))
                    {
                        local_49 = false;
                    }
                    else
                    {
                        local_49 = local_48.bSpawnRatioCacheValid;
                    }
                    local_49 = local_49 && (local_48.CachedWeatherName == local_6);
                    local_49 = local_49 && (int(local_48.CachedTimeSegments) == local_11);
                    local_42 = local_49;
                    if (local_42)
                    {
                        local_39 = local_48.CachedBundleSpawnRatio;
                        local_40 = local_48.CachedCreatureSpawnRatio;
                        local_41 = local_40;
                    }
                }
                local_49 = !(local_42);
                if (local_49)
                {
                    if (local_20.LayoutInfo.BundleDef.IsSet())
                    {
                        TDataObjectPtr<FSpawnerCountRatioDefinitionRow> local_146;
                        TDataObjectPtr<FEcologyResourceDefinitionRow> local_122 = TDataObjectPtr<FEcologyResourceDefinitionRow>(nullptr);
                        local_98;
                        if (local_146.IsSet())
                        {
                            local_39 = local_40;
                        }
                    }
                    if (local_20.LayoutInfo.CreatureDef.IsSet())
                    {
                        TDataObjectPtr<FSpawnerCountRatioDefinitionRow> local_170;
                        TDataObjectPtr<FEcologyResourceDefinitionRow> local_122_2 = TDataObjectPtr<FEcologyResourceDefinitionRow>(nullptr);
                        local_98;
                        if (local_170.IsSet())
                        {
                            local_41 = local_40;
                        }
                    }
                    if (ECS::GetRuntimeInfo().IsClient)
                    {
                        Modify local_174;
                        local_48 = local_174.opCall();
                        if (local_48)
                        {
                            local_48.CachedWeatherName = local_6;
                            local_48.CachedTimeSegments = local_11;
                            local_48.CachedBundleSpawnRatio = local_39;
                            local_48.CachedCreatureSpawnRatio = local_41;
                            local_49 = true;
                            local_48.bSpawnRatioCacheValid = local_49;
                        }
                    }
                }
                if (local_20.LayoutInfo.BundleDef.IsSet())
                {
                    if (local_38.CreatureDefToCountMap.Contains(local_20.LayoutInfo.BundleDef))
                    {
                        local_175 = local_38.CreatureDefToCountMap[local_20.LayoutInfo.BundleDef];
                        if (local_20.LayoutInfo.BakedOrderIndex == -1)
                        {
                            local_49 = false;
                        }
                        else
                        {
                            local_40 = local_175;
                            local_40 = local_40 * local_39;
                            local_49 = (local_20.LayoutInfo.BakedOrderIndex >= local_40);
                        }
                        if (local_49)
                        {
                            OutVisibilityStatus = EEcoCollectableNonSyncedVisibilityStatus(1);
                            return true;
                        }
                    }
                }
                if (local_20.LayoutInfo.CreatureDef.IsSet())
                {
                    if (!(local_20.LayoutInfo.BundleDef.IsSet()))
                    {
                        if (local_38.CreatureDefToCountMap.Contains(local_20.LayoutInfo.CreatureDef))
                        {
                            local_175 = local_38.CreatureDefToCountMap[local_20.LayoutInfo.CreatureDef];
                            if (local_20.LayoutInfo.BakedOrderIndex != -1 && ((local_20.LayoutInfo.BakedOrderIndex >= (local_175 * local_41))))
                            {
                                OutVisibilityStatus = EEcoCollectableNonSyncedVisibilityStatus(1);
                                return true;
                            }
                            OutVisibilityStatus = EEcoCollectableNonSyncedVisibilityStatus(0);
                            return true;
                        }
                    }
                    else
                    {
                        if (local_41 == 0.0f)
                        {
                            OutVisibilityStatus = EEcoCollectableNonSyncedVisibilityStatus(1);
                            return true;
                        }
                        OutVisibilityStatus = EEcoCollectableNonSyncedVisibilityStatus(0);
                        return true;
                    }
                }
            }
            else
            {
            }
        }
        else
        {
        }
    }
    OutVisibilityStatus = EEcoCollectableNonSyncedVisibilityStatus(0);
    return false;
}
FECSEntityId GetCurrespondingStaticEntityIdOfDynamic(const FECSEntityId &inout DynamicEntityId)
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Get local_6;
    const FCS_EcoCollectableDataCache& local_8 = local_6.opCall();
    if (local_8)
    {
        if (local_8.GetDynamic2StaticEntityIdMap().Contains(DynamicEntityId))
        {
            return local_8.GetDynamic2StaticEntityIdMap()[DynamicEntityId];
        }
    }
    return ENTITY_ID_NULL;
}
FECSEntityId GetCurrespondingDynamicEntityIdOfStatic(const FECSEntityId &inout StaticEntityId)
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Get local_6;
    const FCS_EcoCollectableDataCache& local_8 = local_6.opCall();
    if (local_8)
    {
        if (local_8.GetStatic2DynamicEntityIdMap().Contains(StaticEntityId))
        {
            return local_8.GetStatic2DynamicEntityIdMap()[StaticEntityId];
        }
    }
    return ENTITY_ID_NULL;
}
bool LowLevelIsAllShowOrHidden(const FECSEntity &inout NonSyncedEntity, const bool bCheckCollectDitherPart, const bool bInCheckAllShow, int &out OutAllShowOrHidden)
{
    const AActor local_6;
    int local_12 = 0;
    bool local_25;
    bool local_26;
    AGameActor local_34;
    bool local_71;
    OutAllShowOrHidden = 0;
    local_6 = NonSyncedEntity.GetActor();
    TArray<FName> local_20;
    if (bCheckCollectDitherPart)
    {
        Get local_10;
        local_20 = local_10.opCall().CollectedDitherLogicNames;
    }
    else
    {
        Get local_16;
        local_20 = local_16.opCall().EnvDitherLogicNamesExcludeFruit;
    }
    if (local_6 == nullptr)
    {
        local_25 = false;
    }
    else
    {
        local_25 = local_12;
    }
    if (local_25)
    {
        bool local_29;
        bool local_28;
        if (local_20.IsEmpty())
        {
            OutAllShowOrHidden = -1;
            return true;
        }
        local_28 = false;
        local_29 = false;
        local_34 = (Cast<AGameActor>(local_6));
        if (local_34 != nullptr)
        {
            for (auto& local_48 : local_20)
            {
                TArray<USceneComponent> local_52 = local_34.GetCachedSceneComponentByLogicName(local_48);
                for (auto local_70 : local_52)
                {
                    local_25 = FEcoCollectableUtils::GetSceneComponentVisibility(local_70);
                    local_26 = !(local_28);
                    if (local_26)
                    {
                        if (bInCheckAllShow)
                        {
                            local_26 = local_25;
                        }
                        else
                        {
                            local_26 = !(local_25);
                        }
                        local_29 = local_26;
                        local_71 = true;
                        local_28 = local_71;
                    }
                    else
                    {
                        if (!(local_29))
                        {
                            local_26 = false;
                        }
                        else
                        {
                            if (bInCheckAllShow)
                            {
                                local_71 = local_25;
                            }
                            else
                            {
                                local_71 = !(local_25);
                            }
                            local_26 = local_71;
                        }
                        local_29 = local_26;
                    }
                }
            }
            OutAllShowOrHidden = local_29 ? 1 : 0;
            return true;
        }
    }
    return false;
}
void TryRefreshEcoCollectableAtStatic(const FECSEntity &inout StaticEntity, TSet<FECSEntityId> &inout ProcessedDynamics, int &inout RefreshedCount)
{
    FECSEntityId local_3 = EcoCollectableUtils::GetCurrespondingDynamicEntityIdOfStatic(StaticEntity.GetId());
    if ((local_3 == ENTITY_ID_NULL) || ProcessedDynamics.Contains(local_3))
    {
        return;
    }
    ProcessedDynamics.Add(local_3);
    if (!(FECSEntity(local_3).IsValid()))
    {
        return;
    }
    Modify local_18;
    FC_EcoCollectableSyncedRuntime& local_20 = local_18.opCall();
    if (local_20)
    {
        FECSWorldPtr local_22 = ECS::GetECSWorld();
        Get local_26;
        const FCS_FixedTime& local_28 = local_26.opCall();
        if (local_28)
        {
            local_20.SetRecoverCDTargetTime(local_28.Time);
        }
        else
        {
            local_20.SetRecoverCDTargetTime(ECS::GetContextTime());
        }
        local_20.SetbReadyForCollect(true);
        ++RefreshedCount;
    }
    return;
}
void RefreshNearbyEcoCollectables(const FVector &inout PlayerPos, const float32 RangeCm, int &out InRangeCount, int &out RefreshedCount)
{
    InRangeCount = 0;
    RefreshedCount = 0;
    InRangeCount = 0;
    RefreshedCount = 0;
    TSet<FECSEntityId> local_24;
    FECSEntity local_28 = FECSEntity(ENTITY_ID_NULL);
    FECSRuntimeQuery local_72 = FECSRuntimeQueryHelper::RuntimeQueryInSphere(local_28, PlayerPos, RangeCm, EECSQueryRegsitryType(3), false);
    Include local_116;
    local_116.opCall();
    FECSRuntimeQueryIterator local_138 = local_72.Iterator();
    for (; local_138.CanProceed;)
    {
        const FECSEntity& local_162 = local_138.Proceed();
        if (!(local_162.IsValid()))
        {
            continue;
        }
        ++InRangeCount;
        EcoCollectableUtils::TryRefreshEcoCollectableAtStatic(local_162, local_24, RefreshedCount);
    }
    FECSWorldPtr local_164 = ECS::GetECSWorld();
    Get local_168;
    const FCS_EcoCollectableDataCache& local_170 = local_168.opCall();
    Has local_200;
    Get local_206;
    if (local_170)
    {
        for (auto& local_188 : local_170.GetStatic2DynamicEntityIdMap())
        {
            FECSEntity local_196 = FECSEntity(local_188.GetKey());
            if (!(local_196.IsValid()) || !(local_200.opCall()))
            {
                continue;
            }
            if (local_206.opCall().GetPosition().Distance(PlayerPos) > RangeCm)
            {
                continue;
            }
            ++InRangeCount;
            EcoCollectableUtils::TryRefreshEcoCollectableAtStatic(local_196, local_24, RefreshedCount);
        }
    }
    return;
}
}

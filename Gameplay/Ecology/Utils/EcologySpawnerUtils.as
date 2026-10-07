

struct FDelaySpawnFlockTask
{
    UPROPERTY()
    FECSEntity SpawnerEntity;
    UPROPERTY()
    int SpawnerInfoIndex;
    UPROPERTY()
    FRandomGenerator RandomGenerator;
    UPROPERTY()
    float32 UsedCost;


    void opCall()
    {
        int local_4 = 0;
        int local_10 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        FFlockSpawnerData& local_14 = local_10.SpawnerData[this.SpawnerInfoIndex];
        if (local_14.FlockEntities.Num() >= int(local_14.FinalExceptBatch))
        {
            return;
        }
        ::FEcologySpawnerUtils::SpawnFlockEntityByFlockSpawner(local_4, this, local_10, this.SpawnerInfoIndex, this.RandomGenerator, int(this.UsedCost));
        return;
    }
}

struct __Lambda_Gameplay_Ecology_Utils_EcologySpawnerUtils_480
{
    UPROPERTY()
    FECSEntity __FlockEntity;

    __Lambda_Gameplay_Ecology_Utils_EcologySpawnerUtils_480()
    {
        return;
    }
    __Lambda_Gameplay_Ecology_Utils_EcologySpawnerUtils_480(const FECSEntity &inout _InFlockEntity)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FECSEntity GetFlockEntity() property
    {
        FECSEntity __r;
        return __r;
    }
    void opCall()
    {
        this.GetFlockEntity().SetActive(true, FFPTime(-1));
        return;
    }
}

struct __Lambda_Gameplay_Ecology_Utils_EcologySpawnerUtils_768
{
    UPROPERTY()
    FECSEntity __NewCreatureEntity;

    __Lambda_Gameplay_Ecology_Utils_EcologySpawnerUtils_768()
    {
        return;
    }
    __Lambda_Gameplay_Ecology_Utils_EcologySpawnerUtils_768(const FECSEntity &inout _InNewCreatureEntity)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FECSEntity GetNewCreatureEntity() property
    {
        FECSEntity __r;
        return __r;
    }
    void opCall()
    {
        FC_WaitingLoadedViewPrefabTag local_6;
        Assign local_4;
        local_4.opCall(local_6);
        return;
    }
}

namespace FEcologySpawnerUtils
{
float32 CalFlockSpawnCost(FCS_EcologyScriptGlobalContext &inout Context, const FECSEntity &inout Entity, const FC_EcologyFlockComponent &inout FlockComponent)
{
    if (FEcologySceneInfoUtils::FindSpawnRatioDataByFlock(Context, Entity, FlockComponent))
    {
        return 1.0f / 0.0f;
    }
    return 1.0f;
}
void SpawnEcologyTeamEntityBySpawner(const FCS_FixedTime &inout FixedTime, const FECSEntity &inout SpawnerEntity, FC_EcologyRuntimeClassicFlockSpawner &inout Spawner)
{
    FRandomGenerator local_2;
    TArray<FFlockSpawnerData> local_6 = local_2 = FASCommonUtils::CreateRandomGenerator(SpawnerEntity, FixedTime.Time, 0);
    int local_7 = 0;
    for (; local_7 < local_6.Num(); )
    {
        FEcologySpawnerUtils::RefreshFlockSpawner(FixedTime, SpawnerEntity, local_7);
        ++local_7;
    }
    return;
}
float32 GetFlockInfoBatchRatio(FCS_EcologyScriptGlobalContext &inout GlobalContext, const FECSEntity &inout SpawnerEntity, FC_EcologyRuntimeClassicFlockSpawner &inout SpawnerComponent, const int SpawnerInfoIndex)
{
    TDataObjectPtr<FSpawnerCountRatioDefinitionRow> local_128;
    float32 local_155;
    float32 local_156 = 0.0f;
    int local_8 = FEcologySceneInfoUtils::GetCurrentTimeSegments(GlobalContext);
    TDataObjectPtr<FEcologyResourceDefinitionRow> local_104 = TDataObjectPtr<FEcologyResourceDefinitionRow>(nullptr);
    TDataObjectPtr<FCreatureDefinitionRow> local_56 = TDataObjectPtr<FCreatureDefinitionRow>(SpawnerComponent.SpawnerData[SpawnerInfoIndex].CreatureType.GetCreatureType().opImplConv());
    if (local_128)
    {
        local_155 = local_156;
    }
    else
    {
        local_155 = 1.0f;
    }
    return local_155;
}
void DelaySpawnFlockEntityByFlockSpawner(const FCS_FixedTime &inout FixedTime, const FECSEntity &inout SpawnerEntity, FC_EcologyRuntimeClassicFlockSpawner &inout Spawner, const int SpawnerInfoIndex, const FRandomGenerator &inout InRandomGenerator, const float32 UsedCost = 0.0f)
{
    int local_8 = 0;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    FDelaySpawnFlockTask local_16;
    local_16.SpawnerEntity = SpawnerEntity;
    local_16.SpawnerInfoIndex = SpawnerInfoIndex;
    local_16.RandomGenerator = InRandomGenerator;
    local_16.UsedCost = UsedCost;
    FEcologyDelayTaskUtils::AddTaskToSpawnLayer(local_8.CreateTask(SpawnerEntity, Foundation::MakeClosure(local_16), 100), EDelayTaskPriority(1));
    return;
}
void SpawnFlockEntityByFlockSpawner(const FCS_FixedTime &inout FixedTime, const FECSEntity &inout SpawnerEntity, FC_EcologyRuntimeClassicFlockSpawner &inout Spawner, const int SpawnerInfoIndex, const FRandomGenerator &inout InRandomGenerator, const float32 UsedCost = 0.0f)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
int InternalSpawnFlockWithResource(FC_EcologyRuntimeClassicFlockSpawner &inout Spawner, FFlockSpawnerData &inout FlockInfo, const FRuntimeSpawnerReference &inout SpawnDataRef, TArray<FResourceSummaryForFlockSpawner> &inout SpwanableResource, FRandomGenerator &inout RandomGenerator, const int MatchBatches)
{
    AECSRegionVolume local_146;
    if (SpwanableResource.Num() <= 0)
    {
        return 0;
    }
    int local_4 = FlockInfo.MinCount;
    int local_5 = FlockInfo.MaxCount;
    int local_7 = RandomGenerator.NextRangeInt(0, (SpwanableResource.Num() - 1));
    int local_8 = 0;
    int local_9 = 0;
    for (; local_9 < MatchBatches; )
    {
        FResourceSummaryForFlockSpawner& local_12 = SpwanableResource[local_7];
        FEcologyFlockActivityTarget local_16;
        local_16.MainTargetResource = local_12.Resource.GetId();
        FEcologyFlockSpawnParam local_114;
        local_114.SpawnNum = RandomGenerator.NextRangeInt(local_4, local_5);
        TDataObjectPtr<FEcologyCreatureDefinitionRow> local_138 = FlockInfo.CreatureType.GetCreatureType();
        UBaseEcologyPlanerDefine local_140;
        local_114.PlanerDefine = local_140;
        local_114.bAcceptSpawnRatio = FlockInfo.bAcceptSpawnRatio;
        TArray<TSoftObjectPtr<AECSRegionVolume>> local_144;
        if (local_146 != nullptr)
        {
            AECSRegionVolume local_148;
            local_144.Add(TSoftObjectPtr<AECSRegionVolume>(local_148));
        }
        FECSEntity local_162 = FEcologySpawnerUtils::SpawnEcologyFlockEntity(local_114, SpawnDataRef, local_144);
        ++local_8;
        FlockInfo.FlockEntities.Add(local_162);
        --local_12.LeftCount;
        if (int(local_12.LeftCount) <= 0)
        {
            SpwanableResource.RemoveAtSwap(local_7);
        }
        if (SpwanableResource.Num() <= 0)
        {
            return local_8;
        }
        local_7 = RandomGenerator.NextRangeInt(0, (SpwanableResource.Num() - 1));
        ++local_9;
    }
    return local_8;
}
void RefreshFlockSpawner(const FCS_FixedTime &inout FixedTime, const FECSEntity &inout FlockSpawner, const int Slot)
{
    int local_4 = 0;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    FRandomGenerator local_6 = FASCommonUtils::CreateRandomGenerator(FlockSpawner, FixedTime.Time, 0);
    FC_EcologyRuntimeClassicFlockSpawner local_14;
    TArray<FFlockSpawnerData> local_16 = local_14.SpawnerData;
    FFlockSpawnerData& local_20 = local_16[Slot];
    TArray<FECSEntity> local_28;
    int local_30 = int(local_20.MaxBatch);
    float32 local_29 = local_30;
    int local_30_2 = local_20.FlockEntities.Num();
    float32 local_17 = local_30_2;
    float32 local_31 = 1.0f;
    if (local_16[Slot].bAcceptSpawnRatio)
    {
        local_31 = FEcologySpawnerUtils::GetFlockInfoBatchRatio(local_4, FlockSpawner, local_14, Slot);
    }
    int local_30_3 = int(local_20.MaxBatch);
    int local_30_4 = FMath::CeilToInt((local_30_3 * local_31));
    int local_37 = local_20.FlockEntities.Num() - 1;
    for (; local_37 >= local_30_4; --local_37)
    {
        FECSEntity local_42 = FECSEntity(local_20.FlockEntities[local_37]);
        if (!(local_42.IsValid()))
        {
            local_20.FlockEntities.RemoveAtSwap(local_37);
            continue;
        }
        local_28.Add(local_42);
    }
    for (auto& local_56 : local_28)
    {
        FEcologyLifeCycleUtils::KillFlockEntity(local_56);
    }
    if ((local_30_4 - FMath::FloorToInt(local_17)) > 0)
    {
        FEcologySpawnerUtils::SpawnFlockEntityByFlockSpawner(FixedTime, FlockSpawner, local_14, Slot, local_6, local_17);
    }
    for (auto& local_56 : local_20.FlockEntities)
    {
        Modify local_60;
        FC_EcologyFlockChildSpawnComponent& local_62 = local_60.opCall();
        if (local_62)
        {
            FEcologySpawnerUtils::RefreshFlockChildCount(local_56, local_62);
        }
    }
    Has local_66;
    for (auto& local_56 : local_20.FlockEntities)
    {
        if (local_56.IsValid() && !(local_66.opCall()))
        {
            FC_NeedCheckResourceTag local_74;
            Assign local_72;
            local_72.opCall(local_74);
        }
    }
    return;
}
void SetupEntityAsRuntimeUnit(const FECSEntity &inout Entity, const EEcologyVoxelUnitSlot Slot, const FVector &inout InitExtent, const FVector &inout InitPosition, const bool bSyncUpdate = true)
{
    FC_EcologyVoxelUnit local_6;
    local_6.LastScope = FBox(FVector::ZeroVector, FVector::OneVector.opNeg());
    local_6.Slot = Slot;
    local_6.AABBExtent = InitExtent;
    local_6.SceneSpaceCost = 1;
    if (bSyncUpdate)
    {
        FEcologySceneInfoUtils::UpdateEntityToVoxelScene(Entity, InitPosition, local_6, true);
        return;
    }
    FC_WaitingUpdateToVoxelSceneTag local_34;
    Assign local_32;
    local_32.opCall(local_34);
    return;
}
void SetupFlockPlaner(const FECSEntity &inout FlockEntity, const TSoftObjectPtr<UBaseEcologyPlanerDefine> &inout Config)
{
    UBaseEcologyPlanerDefine local_10;
    int local_540 = 0;
    Ecology::SyncLoadObject(Config.ToSoftObjectPath());
    if ((!((local_10 != nullptr))))
    {
        return;
    }
    UBaseEcologyPlanerDefine local_542;
    local_540.SlotAllocator.AllocatorType = local_542.SlotAllocatorType;
    local_540.SlotAllocator.bLazyAllocate = local_542.bLazyAllocateSlot;
    local_540.ChangeAreaData.bNeedPathConnectedCheckBeforeChangeArea = local_542.bNeedPathConnectedCheckBeforeChangeArea;
    local_540.NoResourceData.bAllowAutoSearchResource = local_542.bAllowAutoSearchResource;
    local_540.NoResourceData.bAllowNoResourceWanderMove = local_542.bAllowNoResourceWanderMove;
    local_540.NoResourceData.PivotPolicy = local_542.NoResourceActivityPivotPolicy;
    local_540.NoResourceData.FlockUpdatePolicy = local_542.NoResourceFlockUpdatePolicy;
    FC_EcologyPlaner local_556;
    local_556.PlanerDefine = local_542;
    local_556.PlanerType = EEcologyTargetPlanerType(1);
    local_542.SetupEcologyPlanerEntity(FlockEntity, local_556);
    return;
}
void SetupChangeAreaTrigger(const FECSEntity &inout FlockEntity, const FEcologyFlockSpawnParam &inout BaseContext)
{
    if (BaseContext.CreatureConfig.GetCreatureType())
    {
    }
    return;
}
FECSEntity SpawnEcologyFlockEntity(const FEcologyFlockSpawnParam &inout BaseContext, const FRuntimeSpawnerReference &inout SpawnerData, const TArray<TSoftObjectPtr<AECSRegionVolume>> &inout ActivityVolumes)
{
    int local_124 = 0;
    int local_160 = 0;
    FEcologyFlockActivityTarget local_2 = BaseContext.SpawnFEcologyFlockActivityTarget;
    FECSEntity local_6 = FECSEntity(local_2.MainTargetResource);
    if (!(local_6.IsValid()))
    {
        XLog(ELog(30), FString().Append("Create Ecology With Invalid Resource"));
    }
    FECSEntity local_10 = ECS::GetECSWorld().Create(EEntityType(10), n"EcologyFlock");
    FC_EcologyFlockComponent local_32;
    local_32.FlockMainCreature = BaseContext.CreatureConfig.GetCreatureType();
    if (ActivityVolumes.Num() > 0)
    {
        local_32.bLimitedByActivityVolume = true;
        local_32.ActivityVolumes = ActivityVolumes;
    }
    if (int(BaseContext.SpawnNum) > 0)
    {
        FC_EcologyFlockChildSpawnComponent local_116;
        local_116.DefaultSpawnNum = int(BaseContext.SpawnNum);
        local_116.bAcceptSpawnRatio = BaseContext.bAcceptSpawnRatio;
    }
    if (local_32.FlockMainCreature)
    {
        const FEcologyCreatureDefinitionRow& local_118;
        if (!(local_118.FlockTags.IsEmpty()))
        {
            local_124.Append(local_118.FlockTags);
        }
        if (local_118.bEnableBossBattleForArea)
        {
        }
    }
    FVector local_136 = BaseContext.DefaultPosition;
    if (local_6.IsValid())
    {
        Get local_140;
        const FC_Transform& local_142 = local_140.opCall();
        if (local_142)
        {
            local_136 = local_142.GetPosition();
        }
    }
    local_10.InitTransform(local_136, FQuat::Identity);
    FEcologySpawnerUtils::SetupEntityAsRuntimeUnit(local_10, EEcologyVoxelUnitSlot(2), FVector::OneVector, local_136, true);
    FEcologySpawnerUtils::SetupFlockPlaner(local_10, BaseContext.PlanerDefine);
    if (!(BaseContext.bSkipChangeAreaTrigger))
    {
        FEcologySpawnerUtils::SetupChangeAreaTrigger(local_10, BaseContext);
    }
    FEcologyBehaviorUtils::FlockClaimNewResource(local_10, local_6, false);
    FECSWorldPtr local_20 = ECS::GetECSWorld();
    Modify local_148;
    FEcologySchedulerUtils::AddFlockToScheduler(local_10, local_32, local_148.opCall());
    if (!(BaseContext.bSkipDelayActivation) && FEcologyMisc::CVar_Ecology_DelayActiveFlock.GetBool())
    {
        if (int(BaseContext.CreatureConfig.GetMonsterRank()) != 2)
        {
            local_10.SetActive(false, FFPTime(-1));
            FECSWorldPtr local_20_2 = ECS::GetECSWorld();
            __Lambda_Gameplay_Ecology_Utils_EcologySpawnerUtils_480 local_164;
            FEcologyDelayTaskUtils::AddTaskToSpawnLayer(local_160.CreateTask(local_10, Foundation::MakeClosure(local_164), 100), EDelayTaskPriority(1));
        }
    }
    return local_10;
}
void SpawnCreatureEntityByFlockEntity(const FECSEntity &inout FlockEntity, const FC_EcologyFlockComponent &inout FlockComponent, const FC_EcologyFlockChildSpawnComponent &inout ChildManagerComp, const TSoftClassPtr<AECSPrefab> &inout SpawnClass, const int PosOffsetIndex)
{
    FECSEntity local_10 = FECSEntity(FlockComponent.ActivityTarget.MainTargetResource);
    FVector local_16;
    FQuat local_24;
    float local_26 = 200.0;
    float local_30 = 1000.0;
    FHexCoord local_33 = FEcologyHexUtils::GetHexCoordAtIndex(PosOffsetIndex);
    FVector local_44 = FHexCoord::HexToWorld3D(local_33, float32(local_26), 0.0f);
    FRandomGenerator local_51 = FASCommonUtils::CreateRandomGenerator(FlockEntity, PosOffsetIndex);
    float32 local_37 = local_51.NextRange(0.0f, 12.0f) * 30.0f;
    FRotator local_72 = FRotator(0.0, (local_37 + (local_51.NextRangeInt(10, 15))), 0.0);
    Get local_80;
    const FC_Transform& local_82 = local_80.opCall();
    if (local_82)
    {
        local_16 = local_82.GetPosition();
        local_24 = FQuat(local_72);
    }
    else
    {
        Get local_96;
        const FC_Transform& local_98 = local_96.opCall();
        if (local_98)
        {
            local_16 = local_98.GetPosition();
            local_24 = FQuat(local_72);
        }
    }
    FVector local_50 = (local_16 + (local_24.GetUpVector() * 0.0));
    FVector local_106_2 = (local_50 + local_44);
    FEcologyCreatureSpawnerContext local_172;
    local_172.RuntimeSpawnerEntity = FlockComponent.SpawnerDataRef.SpawnerEntity;
    local_172.CreaturePrefab = SpawnClass;
    local_172.FlockEntity = FlockEntity.GetId();
    local_172.TargetLocation = local_106_2;
    local_172.TargetRotation = local_24;
    FECSEntity local_6 = FEcologySpawnerUtils::SpawnCreatureByContext(local_172);
    if (!(local_6))
    {
        return;
    }
    if ((local_26 <= 0.0 && (local_30 <= 0.0)))
    {
    }
    else
    {
        FC_WaitingSetupTransformTag local_186;
        Assign local_184;
        local_184.opCall(local_186);
        FECSWorldPtr local_188 = ECS::GetECSWorld();
        FSetupCreaturePositionEQSContext local_196;
        local_196.TargetEntity = local_6.GetId();
        FAIEQSProxyCustomDataHandle::SetAs local_206;
        local_206.opCall(local_196, EAIEQSProxyEventDataType(3));
        TSoftObjectPtr<UEnvQuery> local_218;
        Ecology::SyncLoadObject(local_218.ToSoftObjectPath());
        UEnvQuery local_230;
        FAIEQSProxyCustomDataHandle local_202;
        int local_56 = FAIEQSUtils::ExecuteWorldEQSExt(local_230, EEnvQueryRunMode(1), local_202, false);
        FAIEQSUtils::SetIntParam(local_56, n"SelfEntity", FlockEntity.GetIdValue());
        FAIEQSUtils::SetFloatParam(local_56, n"Donut.InnerRadius", float32(local_26));
        FAIEQSUtils::SetFloatParam(local_56, n"Donut.OuterRadius", float32(local_30));
        FAIEQSUtils::SetOverrideLocation(local_56, local_106_2);
    }
    return;
}
void SetupFlockChild(const FECSEntity &inout NewCreatureEntity, const FECSEntity &inout FlockEntity)
{
    int local_16 = 0;
    if ((FlockEntity == ENTITY_NULL))
    {
        return;
    }
    Modify local_6;
    FC_EcologyFlockComponent& local_8 = local_6.opCall();
    if (local_8)
    {
        local_16.FlockProxyEntity = FlockEntity.GetId();
        FEcologySpawnerUtils::AddChildToFlock(FlockEntity, local_8, local_16, NewCreatureEntity);
    }
    return;
}
void AddChildToFlock(const FECSEntity &inout FlockEntity, FC_EcologyFlockComponent &inout FlockComponent, FC_FlockMember &inout MemberComponent, const FECSEntity &inout ChildEntity)
{
    FlockComponent.CreatureEntities.Add(ChildEntity.GetId());
    if ((FlockComponent.LeaderEntity == ENTITY_ID_NULL))
    {
        FlockComponent.LeaderEntity = ChildEntity.GetId();
        MemberComponent.bIsLeader = true;
    }
    FC_FlockAllocateSlotTag local_10;
    Assign local_8;
    local_8.opCall(local_10);
    return;
}
void RemoveChildFromFlock(const FECSEntity &inout FlockEntity, FC_EcologyFlockComponent &inout FlockComponent, const FECSEntityId &inout ChildEntity)
{
    FlockComponent.CreatureEntities.RemoveSwap(ChildEntity);
    if ((FlockComponent.LeaderEntity == ChildEntity) && (FlockComponent.CreatureEntities.Num() > 0))
    {
        for (auto& local_20 : FlockComponent.CreatureEntities)
        {
            FECSEntity local_28 = FECSEntity(local_20);
            Modify local_32;
            FC_FlockMember& local_34 = local_32.opCall();
            if (local_34)
            {
                local_34.bIsLeader = true;
                FlockComponent.LeaderEntity = local_20;
            }
        }
    }
    FC_FlockAllocateSlotTag local_40;
    Assign local_38;
    local_38.opCall(local_40);
    return;
}
void InitEcologyAIKnowledge(const FECSEntity &inout CreatureEntity, const FECSEntity &inout FlockEntity, const TDataObjectPtr<FEcologyCreatureDefinitionRow> &inout CreatureType)
{
    int local_534 = 0;
    const FEcologyCreatureDefinitionRow& local_536;
    if (!(CreatureType))
    {
        return;
    }
    Assign local_6;
    local_6.opCall(FC_EcologyKnowledge());
    if (!(local_536.CreatureTags.IsEmpty()))
    {
        local_534.Append(local_536.CreatureTags);
    }
    FC_CreatureEcologyState local_528;
    local_528.FlockProxyEntity = FlockEntity.GetId();
    local_528.Creature = CreatureType;
    local_528.bCanFly = local_536.bCanFly;
    local_528.bCanNaviWalk = true;
    local_528.OverSlotWanderInnerRadius = local_536.OverSlotWanderInnerRadius;
    local_528.OverSlotWanderOuterRadius = local_536.OverSlotWanderOuterRadius;
    local_528.ForceMoveStanceWithoutEmergency = local_536.ForceMoveStanceWithoutEmergency;
    local_528.RunMoveStanceDistanceWithoutEmergency = local_536.RunMoveStanceDistanceWithoutEmergency;
    local_528.ForceMoveStanceEmergency = local_536.ForceMoveStanceEmergency;
    local_528.RunMoveStanceDistanceWithEmergency = local_536.RunMoveStanceDistanceWithEmergency;
    local_528.ForceMuteCombatInChangeArea = local_536.ForceMuteCombatInChangeArea;
    ECS::GetContextTime();
    FString local_574 = FString();
    return;
}
FC_CreatureMeta& SetupCreatureMeta(const FECSEntity &inout NewCreatureEntity, const FEcologyCreatureSpawnerContext &inout Context)
{
    int local_181 = 0;
    int local_182 = 0;
    int local_252 = 0;
    FC_CreatureMeta local_66;
    local_66.CreatureType = Context.GetCreatureType();
    local_66.SpawnerConfigRef = Context.SpawnerConfigRef;
    local_66.RuntimeSpawnerEntity = Context.RuntimeSpawnerEntity;
    FECSEntity local_118 = FECSEntity(Context.RuntimeSpawnerEntity);
    if (local_118)
    {
        FC_SpawnerReadyTracker local_130;
        if (local_130 && !(local_130.bSpawnComplete))
        {
            ++local_130.PendingReadyCount;
        }
    }
    TDataObjectPtr<FLevelInfoConfig> local_156 = FLevelUtils::GetCurrentLevelInfoConfig(nullptr);
    if (local_156 && (local_181 == 2))
    {
        FECSWorldPtr local_184 = NewCreatureEntity.GetWorld();
        if (FEcologySceneInfoUtils::GetWorldAreaConfigByPosition(local_184, Context.TargetLocation))
        {
            local_66.Level = local_182;
        }
    }
    else
    {
        if (local_156 && (local_181 == 3))
        {
            FECSWorldPtr local_184_2 = NewCreatureEntity.GetWorld();
            Get local_236;
            const FCS_CommissionInfo& local_238 = local_236.opCall();
            if (local_238)
            {
                if (local_238.CommissionConfig)
                {
                }
            }
        }
    }
    if (int(local_66.Level) <= 0)
    {
        FECSWorldPtr local_184_3 = NewCreatureEntity.GetWorld();
        Get local_242;
        const FCS_EcologyWorldInfo& local_244 = local_242.opCall();
        if (local_244)
        {
            local_66.Level = int(local_244.BaseWorldMonsterLevel);
        }
    }
    bool local_123 = false;
    local_66.bLazyLoad = local_123;
    local_66.ViewPrefab = Context.LoadMonsterPrefab();
    if (!(local_66.bLazyLoad))
    {
        int local_302;
        int local_301;
        FECSWorldPtr local_184_4 = ECS::GetECSWorld();
        FDelayTaskHandle local_298 = local_252.CreateTask(NewCreatureEntity, Foundation::MakeClosure(__Lambda_Gameplay_Ecology_Utils_EcologySpawnerUtils_768(NewCreatureEntity)), 100);
        local_302 = 1;
        local_301 = local_302;
        if (!(local_118))
        {
            local_123 = false;
        }
        else
        {
            Has local_306;
            local_123 = local_306.opCall();
        }
        if (local_123)
        {
            local_302 = 0;
            local_301 = local_302;
        }
        FEcologyDelayTaskUtils::AddTaskToSpawnLayer(local_298, EDelayTaskPriority(local_301));
    }
    return local_123;
}
FECSEntity SpawnCreatureByContext(const FEcologyCreatureSpawnerContext &inout Context)
{
    int local_76 = 0;
    TSubclassOf<ACharacterPrefab> local_12 = Context.LoadMonsterPrefab();
    TSoftClassPtr<ACharacterPrefab> local_10 = local_12;
    FECSEntity local_28;
    if (local_10.IsNull())
    {
        XError(ELog(30), FString().Append("Creature Creature Failed because prefab is null ").Append(Context.CreatureConfigProxy.Config.ToString()));
        FEcologySpawnerUtils::DecrementPendingReadyOnFailure(Context.RuntimeSpawnerEntity);
        return local_28;
    }
    local_28 = ECS::GetECSWorld().Create(EECSRegType(0), EEntityType(3), n"creature");
    local_28.InitTransform(Context.TargetLocation, Context.TargetRotation);
    FEcologySpawnerUtils::SetupCreatureMeta(local_28, Context);
    FEcologySpawnerUtils::SetupFlockChild(local_28, FECSEntity(Context.FlockEntity));
    FEcologySpawnerUtils::InitEcologyAIKnowledge(local_28, FECSEntity(Context.FlockEntity), Context.GetCreatureType());
    if (int(Context.MuteDropItemMask) != 0)
    {
        FC_MuteDropItem local_70;
        Assign local_68;
        local_68.opCall(local_70).MuteDropItemMask = int(Context.MuteDropItemMask);
    }
    if (Context.AdditionalSpawnTag.IsValid())
    {
        local_76.Add(Context.AdditionalSpawnTag);
    }
    if ((!((Context.SpawnInitEntryName == NAME_None))))
    {
        ModifyOrAdd local_82;
        local_82.opCall().SetInitEntryName(Context.SpawnInitEntryName);
    }
    FEcologySpawnerUtils::SetupEntityAsRuntimeUnit(local_28, EEcologyVoxelUnitSlot(1), FVector::OneVector, Context.TargetLocation, true);
    return local_28;
}
void RefreshFlockChildCount(const FECSEntity &inout FlockEntity, const FC_EcologyFlockChildSpawnComponent &inout ChildManager)
{
    int local_6 = 0;
    float32 local_11 = 0.0f;
    int local_82 = 0;
    int local_7 = ChildManager.DefaultSpawnNum;
    if (ChildManager.bAcceptSpawnRatio)
    {
        float32 local_10;
        local_10 = 1.0f;
        if (FEcologySceneInfoUtils::FindSpawnRatioDataByFlock(FEcologyUtils::ModifyGlobalContext(ECS::GetECSWorld()), FlockEntity, local_6))
        {
            local_10 = local_11;
        }
        local_11 = local_7;
        local_11 = local_11 * local_10;
        local_7 = FMath::CeilToInt(local_11);
    }
    if (FECSEntity(local_6.ActivityTarget.MainTargetResource))
    {
        FC_EcologyResourceProviderSummary local_76;
        if (!(local_76.bEnableDynamicSlot))
        {
            if (local_82)
            {
                local_7 = FMath::Min(local_7, local_82.SlotData.Num());
            }
        }
    }
    int local_8 = local_6.CreatureEntities.Num();
    if (local_8 > local_7)
    {
        int local_83 = local_8 - 1;
        for (; local_83 >= local_7; )
        {
            FEcologyLifeCycleUtils::KillCreatureEntity(FECSEntity(local_6.CreatureEntities[local_83]));
            local_6.CreatureEntities.RemoveAtSwap(local_83);
            --local_83;
        }
    }
    else
    {
        int local_83_2 = local_8;
        for (; local_83_2 < local_7; )
        {
            FEcologySpawnerUtils::SpawnCreatureEntityByFlockEntity(FlockEntity, local_6, ChildManager, ChildManager.CreatureDefinition.GetCreaturePrefab());
            ++local_83_2;
        }
    }
    return;
}
void EcologyInitNavAgent(const FECSEntity &inout CreatureEntity)
{
    ModifyOrAdd local_4;
    if (local_4.opCall())
    {
        Get local_12;
        const FC_CreatureMeta& local_14 = local_12.opCall();
        if (local_14)
        {
            if (local_14.CreatureType)
            {
                const FEcologyCreatureDefinitionRow& local_16;
                if (local_16.NavFilter.IsValid())
                {
                }
            }
        }
    }
    return;
}
void SetBornLocationToCreatureEcologyStateComponent(const FECSEntity &inout CreatureEntity)
{
    int local_8 = 0;
    int local_14 = 0;
    if (!(CreatureEntity.IsValid()))
    {
        return;
    }
    if (!(local_8))
    {
        return;
    }
    if (!(local_14))
    {
        return;
    }
    local_14.ActivityData.BornLocation = local_8.GetPosition();
    return;
}
AEcologySpawnerPrefabBase GetSpawnerPrefabByRuntimeEntity(const FECSEntity &inout RuntimeSpawnerEntity)
{
    int local_16 = 0;
    int local_34 = 0;
    AEcologySpawnerPrefabBase local_6 = Cast<AEcologySpawnerPrefabBase>(ULevelActorManager::Get().GetInLevelPrefabByEntity(RuntimeSpawnerEntity));
    AEcologySpawnerPrefabBase local_8 = local_6;
    if (local_8 != nullptr)
    {
        return local_8;
    }
    if (!(local_16))
    {
        return nullptr;
    }
    FECSEntity local_20 = FECSEntity(local_16.ConfigRef);
    if (!(local_20))
    {
        return local_6;
    }
    Has local_28;
    bool local_9 = local_28.opCall();
    if (local_9)
    {
        const FLevelUnitConfig& local_36 = local_34.GetLevelUnitConfig();
        if (local_36.ActorPath.IsValid())
        {
            AActor local_38;
            return Cast<AEcologySpawnerPrefabBase>(local_38);
        }
    }
    return Cast<AEcologySpawnerPrefabBase>(ULevelActorManager::Get().GetInLevelPrefabByEntity(local_20));
}
void TryMarkSpawnComplete(const FECSEntity &inout SpawnerEntity)
{
    FC_SpawnerReadyTracker local_6;
    bool local_7 = !(local_6);
    if (local_7)
    {
        local_7 = true;
    }
    else
    {
        local_7 = local_6.bSpawnComplete;
    }
    if (local_7)
    {
        return;
    }
    local_6.bSpawnComplete = true;
    if (int(local_6.PendingReadyCount) <= 0)
    {
        FEcologySpawnerUtils::MarkAndNotirySpawnerReady(SpawnerEntity, local_6);
    }
    return;
}
void DecrementPendingReadyOnFailure(const FECSEntityId &inout RuntimeSpawnerId)
{
    FC_SpawnerReadyTracker local_20;
    FECSEntity local_4 = FECSEntity(RuntimeSpawnerId);
    if (!(local_4))
    {
        return;
    }
    Has local_14;
    if (!(local_14.opCall()))
    {
        return;
    }
    if (!(local_20))
    {
        return;
    }
    --local_20.PendingReadyCount;
    if ((local_20.bSpawnComplete && (int(local_20.PendingReadyCount) <= 0)))
    {
        FEcologySpawnerUtils::MarkAndNotirySpawnerReady(local_4, local_20);
    }
    return;
}
void NotifyNewMonsterReady(const FECSEntity &inout RuntimeSpawnerEntity, const FECSEntity &inout CreatureEntity)
{
    EcologyStatsUtils::StatsCreatureSpawned(CreatureEntity);
    AEcologySpawnerPrefabBase local_4 = FEcologySpawnerUtils::GetSpawnerPrefabByRuntimeEntity(RuntimeSpawnerEntity);
    if (local_4 != nullptr)
    {
        local_4.OnNewMonsterReady.Broadcast(CreatureEntity.GetId());
        FKLFlowEvent_SpawnerMonster local_8;
        local_8.SpawnerEntityId = RuntimeSpawnerEntity.GetId();
        local_8.MonsterEntityId = CreatureEntity.GetId();
        KLFlowLibrary::PostFlowEvent(KLFlowEventTags::Level_NewMonsterReady, FInstancedStruct::Make(local_8));
    }
    return;
}
void NotifyMonsterDeath(const FECSEntity &inout RuntimeSpawnerEntity, const FECSEntity &inout CreatureEntity)
{
    EcologyStatsUtils::StatsCreatureDeath(CreatureEntity);
    AEcologySpawnerPrefabBase local_4 = FEcologySpawnerUtils::GetSpawnerPrefabByRuntimeEntity(RuntimeSpawnerEntity);
    if (local_4 != nullptr)
    {
        local_4.OnMonsterDeath.Broadcast(CreatureEntity.GetId());
        FKLFlowEvent_SpawnerMonster local_8;
        local_8.SpawnerEntityId = RuntimeSpawnerEntity.GetId();
        local_8.MonsterEntityId = CreatureEntity.GetId();
        KLFlowLibrary::PostFlowEvent(KLFlowEventTags::Level_MonsterDeath, FInstancedStruct::Make(local_8));
    }
    return;
}
void MarkAndNotirySpawnerReady(const FECSEntity &inout SpawnerEntity, FC_SpawnerReadyTracker &inout Tracker)
{
    Has local_4;
    bool local_5 = local_4.opCall();
    if (local_5)
    {
        return;
    }
    Assign local_10;
    local_10.opCall(FC_LevelUnitReadyTag());
    AEcologySpawnerPrefabBase local_16 = FEcologySpawnerUtils::GetSpawnerPrefabByRuntimeEntity(SpawnerEntity);
    if (local_16 != nullptr)
    {
        local_16.OnSpawnerReady.Broadcast(SpawnerEntity.GetId());
    }
    if (FECSEntity(Tracker.LevelUnitEntity))
    {
        local_10.opCall(FC_LevelUnitReadyTag());
    }
    return;
}
int GetSpawnerExpectedConfiguredEntityCount(const FECSEntity &inout SpawnerEntity)
{
    int local_2 = 0;
    int local_1 = -1;
    Get local_6;
    const FC_EcologyConfigReference& local_8 = local_6.opCall();
    if (local_8)
    {
        if (local_8.ReadSpawnerConfig())
        {
            const FInstancedStruct& local_16 = GetConfigData();
            if (FInstancedStruct::GetPtr(local_16).opCall())
            {
                return local_2;
            }
            if (FInstancedStruct::GetPtr(local_16).opCall())
            {
                local_2 = unresolved.NPCConfig ? 1 : 0;
                return local_2;
            }
            if (FInstancedStruct::GetPtr(local_16).opCall())
            {
                return local_1;
            }
            if (FInstancedStruct::GetPtr(local_16).opCall())
            {
                return local_1;
            }
        }
    }
    return local_1;
}
bool ApplySpawnInitEntry(const FECSEntity &inout Entity, const FName &inout EntryName)
{
    FEntitySpawnInitEntry local_6;
    int local_18 = 0;
    if (!(FEcologySpawnerUtils::GetMatchedSpawnInitEntry(Entity, EntryName, local_6)))
    {
        return false;
    }
    ModifyOrAdd local_12;
    local_12.opCall().SetInitEntryName(EntryName);
    if (local_6.HasESMOverride())
    {
        local_18.Add(uint8(int(local_6.ESMEntryStateOverride.SMIndex)), local_6.ESMEntryStateOverride.EntryState);
    }
    return true;
}
bool GetMatchedSpawnInitEntry(const FECSEntity &inout Entity, const FName &inout EntryName, FEntitySpawnInitEntry &inout OutEntry)
{
    int local_8 = 0;
    if ((EntryName == NAME_None))
    {
        return false;
    }
    if (!(local_8))
    {
        return false;
    }
    for (auto& local_22 : local_8.SpawnInitEntries)
    {
        if ((local_22.InitEntryName == EntryName))
        {
            return true;
        }
    }
    return false;
}
bool GetCurrentSpawnInitEntry(const FECSEntity &inout Entity, FEntitySpawnInitEntry &inout OutEntry)
{
    int local_6 = 0;
    if (!(local_6) || (local_6.GetInitEntryName() == NAME_None))
    {
        return false;
    }
    return FEcologySpawnerUtils::GetMatchedSpawnInitEntry(Entity, local_6.GetInitEntryName(), OutEntry);
}
}

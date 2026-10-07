

struct FResourceSummaryForFlockSpawner
{
    UPROPERTY()
    FECSEntity Resource;
    UPROPERTY()
    int LeftCount;
    UPROPERTY()
    FVoxelPosition Cell;
    UPROPERTY()
    float32 SpawnBatchRatio;
    UPROPERTY()
    float32 SpawnCreatureRatio;


}

struct FWeightedIndexInfo
{
    UPROPERTY()
    int Index;
    UPROPERTY()
    int Weight;


}

struct FFlockCostPair
{
    UPROPERTY()
    FECSEntity Flock;
    UPROPERTY()
    float32 Cost;

    FFlockCostPair()
    {
        this.Cost = 0.0f;
        this.Cost = 0.0f;
        return;
    }
    FFlockCostPair(const FECSEntity &inout InFlock, const float32 InCost)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

class US_EcologySpawnerSystem : UECSScriptSystem
{
    float32 ConstNPCGroundTraceHeightMultiplier = 1.5f;
    float32 ConstNPCGroundSnapOffset = 0.05f;


    TConstRawPtr<FVirtualConfigData> ReadSpawnerConfig(const FECSEntity &inout ConfigEntity) const
    {
        int local_12 = 0;
        int local_26 = 0;
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            return TConstRawPtr<FVirtualConfigData>(local_12.SpawnerConfig);
        }
        Has local_20;
        bool local_5_2 = local_20.opCall();
        if (local_5_2)
        {
            const FLevelConfigInstance& local_28 = local_26.GetLevelUnitConfigInstance();
            if (FInstancedStruct::GetPtr(local_28.GetConfigData()).opCall())
            {
                return TConstRawPtr<FVirtualConfigData>();
            }
        }
        return local_16;
    }
    void SpawnBossByMixBossSpawner(const FECSEntity &inout SpawnerEntity, FC_EcologyMixRandomBossSpawner &inout ModifiabSpawnerComponent, const FC_EcologyConfigReference &inout ConfigRef) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argint]
    }
    void SpawnBossBySpawnPool(const FECSEntity &inout SpawnerEntity, FCS_EcologyScriptGlobalContext &inout EcologyContext, FC_EcologyMixRandomBossSpawner &inout ModifiabSpawnerComponent, const FMixedRandomBossSpawnerConfig &inout ConfigData, const int PoolIndex) const
    {
        int local_8 = 0;
        const FRandomBossSpawnInfoPoolConfig& local_2 = ConfigData.SpawnPool[PoolIndex];
        int local_9 = local_2.BossInfo.Num();
        if (local_9 <= 0)
        {
            return;
        }
        int local_9_2 = local_2.BossInfo.Num();
        int local_13 = int(local_2.CountScope.X);
        int local_10 = FMath::Min(int(local_2.CountScope.Y), local_9_2);
        int local_15 = local_13;
        if (local_13 < local_10)
        {
            local_15 = local_8.RandomGenerator.NextRangeInt(local_13, local_10);
        }
        if (!((local_15 < local_9_2)))
        {
            int local_17 = 0;
            for (; local_17 < local_15; ++local_17)
            {
                int local_18 = local_17;
                FECSEntity local_22 = this.SpawnBossBySpawnInfo(SpawnerEntity, ConfigData, PoolIndex, local_18);
                if (local_22)
                {
                    FMixRandomBossSpawnResult local_30;
                    local_30.BossIndex = local_18;
                    local_30.PoolIndex = PoolIndex;
                    local_30.RandomValue = 0;
                    ModifiabSpawnerComponent.SpawnResult.Add(local_22.GetId(), local_30);
                }
            }
            return;
        }
        TArray<FWeightedIndexInfo> local_36;
        int local_18_2 = 0;
        int local_17_2 = 0;
        for (; local_17_2 < local_9_2; )
        {
            const FRandomBossSpawnInfoConfig& local_38 = local_2.BossInfo[local_17_2];
            FWeightedIndexInfo local_40;
            local_40.Weight = FMath::Max(int(local_38.Weight), 1);
            local_40.Index = local_17_2;
            local_18_2 = local_18_2 + int(local_40.Weight);
            local_36.Add(local_40);
            ++local_17_2;
        }
        int local_42 = local_8.RandomGenerator.NextRangeInt(local_13, local_10);
        while (local_42 > 0 && (local_36.Num() > 0))
        {
            int local_14 = local_8.RandomGenerator.NextRangeInt(0, local_18_2);
            FWeightedIndexInfo local_40;
            local_40 = local_36[0];
            int local_45 = 0;
            int local_46 = 0;
            for (; local_46 < local_36.Num(); )
            {
                FWeightedIndexInfo& local_48 = local_36[local_46];
                if (local_14 <= int(local_48.Weight))
                {
                    local_40 = local_48;
                    local_45 = local_46;
                    break;
                }
                local_14 = local_14 - int(local_48.Weight);
                ++local_46;
            }
            local_18_2 = local_18_2 - int(local_40.Weight);
            local_36.RemoveAtSwap(local_45);
            FECSEntity local_26 = this.SpawnBossBySpawnInfo(SpawnerEntity, ConfigData, PoolIndex, int(local_40.Index));
            if (local_26)
            {
                FMixRandomBossSpawnResult local_30;
                local_30.BossIndex = int(local_40.Index);
                local_30.PoolIndex = PoolIndex;
                local_30.RandomValue = local_14;
                ModifiabSpawnerComponent.SpawnResult.Add(local_26.GetId(), local_30);
                --local_42;
            }
        }
        return;
    }
    FECSEntity SpawnBossBySpawnInfo(const FECSEntity &inout SpawnerEntity, const FMixedRandomBossSpawnerConfig &inout ConfigData, const int PoolIndex, const int BossConfigIndex) const
    {
        int local_10 = 0;
        int local_12 = 0;
        int local_22 = 0;
        bool local_187;
        FECSEntityId local_199;
        FC_EcologyResourceProviderSummary local_258;
        FDataObjectPtr local_306;
        int local_312 = 0;
        int local_324 = 0;
        int local_1 = true;
        FScopeCycleCounter local_3 = FScopeCycleCounter(FStatID(n"SpawnBossBySpawnInfo"), false);
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        FECSWorldPtr local_8_2 = ECS::GetECSWorld();
        const FRandomBossSpawnInfoConfig& local_16 = ConfigData.SpawnPool[PoolIndex].BossInfo[BossConfigIndex];
        TArray<FECSEntity> local_26;
        TArray<FECSEntity> local_30;
        TSet<FDataObjectPtr> local_74 = ::FEcologyUtils::FindAllCareResourceType(local_16.GetCreatureType());
        FECSRuntimeQuery local_136 = FECSRuntimeQueryHelper::MakeRuntimeQuery(SpawnerEntity, EECSQueryRegsitryType(4), false);
        Include local_180;
        local_180.opCall();
        Include local_184;
        local_184.opCall();
        bool local_2 = (local_16.ActivityVolumes.Num() > 0);
        if (local_2 && !(local_16.CheckAllVolumeIsValid()))
        {
            SpawnerEntity.GetId();
            XError(ELog(30), FString().Append("Spawn Boss failed because volume not exit ").Append(local_199).Append(local_199).Append(", Pool:").Append(PoolIndex).Append(", Boss:").Append(BossConfigIndex).Append(" "));
            return ENTITY_NULL;
        }
        ::FEcologySceneInfoUtils::GetTimeSegmentsGameplayTagContaiers(local_12, ::FEcologySceneInfoUtils::GetCurrentTimeSegments(local_10));
        FECSRuntimeQueryIterator local_226 = local_136.Iterator();
        for (; local_226.CanProceed;)
        {
            const FECSEntity& local_250 = local_226.Proceed();
            int local_251 = 0;
            FECSEntity::Get<FC_EcologyResourceProviderSummary> local_256 = FECSEntity::Get<FC_EcologyResourceProviderSummary>(local_250);
            local_306;
            FDataObjectPtr local_282 = local_306;
            if (!(local_74.Contains(local_282)))
            {
                continue;
            }
            if (local_2)
            {
                if (!(local_16.CheckPositionInVolumes(local_312.GetPosition())))
                {
                    continue;
                }
            }
            if (int(local_258.PinedTeamCount) >= int(local_258.MaxTeamCount))
            {
                continue;
            }
            bool local_185 = true;
            Has local_318;
            local_187 = local_318.opCall();
            if (local_187)
            {
            }
            if (!(local_185))
            {
                continue;
            }
            if (local_258.bHighPriorityResource)
            {
                local_30.Add(local_250);
            }
            else
            {
                local_26.Add(local_250);
            }
        }
        if (local_26.Num() <= 0 && (local_30.Num() <= 0))
        {
            XError(ELog(30), FString().Append("No valid resource found for Boss spawning; AllSpwanableResource and HighPrioritySpwanableResource are empty.  ").Append(local_16.GetCreatureType().ToString()));
            return ENTITY_NULL;
        }
        if (local_30.Num() > 0)
        {
        }
        else
        {
        }
        int local_325 = local_22.RandomGenerator.NextRangeInt(0, (local_324.Num() - 1));
        FEcologyFlockActivityTarget local_330;
        local_324[local_325].GetId();
        local_330.MainTargetResource = local_199;
        FEcologyFlockSpawnParam local_426;
        local_16.GetCreatureProxy();
        local_426.SpawnNum = 1;
        TDataObjectPtr<FEcologyCreatureDefinitionRow> local_54 = local_16.GetCreatureType();
        UBaseEcologyPlanerDefine local_454;
        local_426.PlanerDefine = local_454;
        FRuntimeSpawnerReference local_456;
        SpawnerEntity.GetId();
        local_456.SpawnerEntity = local_199;
        FECSEntity local_460 = ::FEcologySpawnerUtils::SpawnEcologyFlockEntity(local_426, local_456, local_16.ActivityVolumes);
        ::FEcologyBehaviorUtils::AddChangeAreaTirggers(local_460, local_16.ChangeAreaTriggerDefinitionCollection);
        return local_460;
    }
    UFUNCTION()
    void Monitor_InitTeamSpawner(const FECSEntity &inout SpawnerEntity, const FC_EcologyRuntimeClassicFlockSpawner &inout RuntimeSpawner) const
    {
        if (FEcologyMisc::CVar_EcosimAI_LOD.GetInt() > 0)
        {
            return;
        }
        FC_EcologyForceRefreshSpawnerTag local_10;
        Assign local_8;
        local_8.opCall(local_10);
        return;
    }
    UFUNCTION()
    void Monitor_InitBossSpawner(const FECSEntity &inout SpawnerEntity, const FC_EcologyMixRandomBossSpawner &inout RuntimeSpawner) const
    {
        FC_EcologyForceRefreshSpawnerTag local_6;
        Assign local_4;
        local_4.opCall(local_6);
        return;
    }
    UFUNCTION()
    void Monitor_TeamSpawnerInactive(const FECSEntity &inout SpawnerEntity, const FC_EcologyRuntimeClassicFlockSpawner &inout SpawnerData) const
    {
        for (auto& local_16 : SpawnerData.SpawnerData)
        {
            for (auto& local_30 : local_16.FlockEntities)
            {
                ::FEcologyLifeCycleUtils::MarkEntityWaitDestroy(local_30, ECS::GetContextTime());
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_FlockEntityActive(const FECSEntity &inout FlockEntity, const FC_EcologyFlockChildSpawnComponent &inout ChildManager) const
    {
        ::FEcologySpawnerUtils::RefreshFlockChildCount(FlockEntity, ChildManager);
        return;
    }
    UFUNCTION()
    void Jon_CleanUpFlockEntity(const FECSEntity &inout FlockEntity, FC_EcologyFlockComponent &inout FlockComponent) const
    {
        int local_6;
        for (auto& local_22 : local_6.CreatureEntities)
        {
            ::FEcologyLifeCycleUtils::MarkEntityWaitDestroy(FECSEntity(local_22), ECS::GetContextTime());
        }
        ::FEcologyLifeCycleUtils::ImmediateUnregisterFlockData(FlockEntity, FlockComponent);
        return;
    }
    UFUNCTION()
    void Job_HandleEQSProxyEvent(const FCE_AIEQSProxyEvent &inout Event) const
    {
        int local_6 = 0;
        if (int(Event.SharedDataHandle.SharedDataType) == 3)
        {
            FAIEQSProxyCustomDataHandle::GetAs(Event.SharedDataHandle);
            FECSEntity local_14 = FECSEntity(local_6.TargetEntity);
            if (1 == int(Event.Status))
            {
                local_14.TeleportTo(Event.Location, FFPTime(-1));
            }
            Remove local_26;
            local_26.opCall();
        }
        return;
    }
    UFUNCTION()
    void Job_OnRequestRefresh(const FCE_RequestRefreshSpawnerEvent &inout Event) const
    {
        bool local_29;
        for (auto& local_16 : Event.Spawners)
        {
            if (!(FECSEntity(local_16)))
            {
                local_29 = false;
            }
            else
            {
                Has local_28;
                local_29 = local_28.opCall();
            }
            if (local_29)
            {
                FC_EcologyForceRefreshSpawnerTag local_36;
                Assign local_34;
                local_34.opCall(local_36);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_ForceRefreshClassicSpanwer(const FECSEntity &inout SpawnerEntity, const FCS_FixedTime &inout FixedTime, FC_EcologyRuntimeClassicFlockSpawner &inout ModifiabSpawnerComponent) const
    {
        if (FEcologyMisc::CVar_EcosimAI_LOD.GetInt() > 0)
        {
            return;
        }
        ::FEcologySpawnerUtils::SpawnEcologyTeamEntityBySpawner(FixedTime, SpawnerEntity, ModifiabSpawnerComponent);
        Remove local_8;
        local_8.opCall();
        return;
    }
    UFUNCTION()
    void Job_ForceRefreshBossSpanwer(const FECSEntity &inout SpawnerEntity, const FCS_FixedTime &inout FixedTime, FC_EcologyMixRandomBossSpawner &inout ModifiabSpawnerComponent, const FC_EcologyConfigReference &inout Config) const
    {
        FC_SpawnerReadyTracker local_14;
        int local_2 = ModifiabSpawnerComponent.SpawnResult.Num();
        this.SpawnBossByMixBossSpawner(SpawnerEntity, ModifiabSpawnerComponent, Config);
        Remove local_6;
        local_6.opCall();
        int local_1 = ModifiabSpawnerComponent.SpawnResult.Num() - local_2;
        if ((local_14 && (local_1 > 0)))
        {
            local_14.PendingReadyCount = (int(local_14.PendingReadyCount) + local_1);
        }
        ::FEcologySpawnerUtils::TryMarkSpawnComplete(SpawnerEntity);
        return;
    }
    UFUNCTION()
    void Monitor_BossSpawnerInactive(const FECSEntity &inout SpawnerEntity, const FC_EcologyMixRandomBossSpawner &inout SpawnerData) const
    {
        for (auto& local_20 : SpawnerData.SpawnResult)
        {
            FECSEntity local_24 = FECSEntity(local_20.GetKey());
            if (local_24.IsValid())
            {
                ::FEcologyLifeCycleUtils::MarkEntityWaitDestroy(local_24, ECS::GetContextTime());
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_ConstFlockSpawnerInactivate(const FECSEntity &inout SpawnerEntity, const FC_EcologyRuntimeConstFlockSpawner &inout SpawnerData) const
    {
        ::FConstFlockSpawnerUtils::CleanUpConstFlockSpawner(SpawnerEntity, SpawnerData);
        return;
    }
    UFUNCTION()
    void Job_CleanUpConstFlockSpawner(const FECSEntity &inout SpawnerEntity, const FC_EcologyRuntimeConstFlockSpawner &inout SpawnerData) const
    {
        ::FConstFlockSpawnerUtils::CleanUpConstFlockSpawner(SpawnerEntity, SpawnerData);
        return;
    }
    UFUNCTION()
    void Monitor_ConstFlockSpawnerActivate(const FECSEntity &inout SpawnerEntity, const FC_EcologyRuntimeConstFlockSpawner &inout SpawnerData) const
    {
        int local_22 = 0;
        if (SpawnerData.PendingExternalResourceUnitId.IsValid())
        {
            return;
        }
        FECSEntity local_12 = ::FConstFlockSpawnerUtils::ResolveExternalResourceByUnitId(SpawnerData.PendingExternalResourceUnitId);
        if (local_12.IsValid())
        {
            FECSEntity local_16 = FECSEntity(SpawnerData.FlockEntity);
            ::FEcologyBehaviorUtils::FlockClaimNewResource(local_16, local_12, false);
            local_22.PendingExternalResourceUnitId = FLevelUnitReference();
        }
        else
        {
            SpawnerEntity.GetId();
            FECSEntityId local_29;
            XLog(ELog(30), FString().Append("ConstFlockSpawner: External Resource UnitId=").Append(SpawnerData.PendingExternalResourceUnitId.GUID).Append(" not resolved yet for ").Append(local_29));
        }
        return;
    }
    UFUNCTION()
    void Job_RefreshConstFlockSpawner(const FECSEntity &inout SpawnerEntity, FC_EcologyRuntimeConstFlockSpawner &inout SpawnerData) const
    {
        ::FConstFlockSpawnerUtils::RefreshConstSpawnerCreatures(SpawnerEntity, SpawnerData);
        return;
    }
    UFUNCTION()
    void Monitor_PostConstFlockSpawnerActivate(const FECSEntity &inout SpawnerEntity, const FC_EcologyRuntimeConstFlockSpawner &inout SpawnerData) const
    {
        ::FEcologySpawnerUtils::TryMarkSpawnComplete(SpawnerEntity);
        return;
    }
    UFUNCTION()
    void Job_RefreshConstNPCSpawner(const FECSEntity &inout SpawnerEntity, FC_EcologyRuntimeConstNPCSpawner &inout NPCSpawner, const FC_EcologyConfigReference &inout ConfigRef) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Monitor_ConstNPCSpawnerInactivate(const FECSEntity &inout SpawnerEntity, const FC_EcologyRuntimeConstNPCSpawner &inout NPCSpawner) const
    {
        FECSEntity local_4 = FECSEntity(NPCSpawner.CreatureEntity);
        if (local_4.IsValid())
        {
            ::FEcologyLifeCycleUtils::MarkEntityWaitDestroy(local_4, ECS::GetContextTime());
        }
        return;
    }
    UFUNCTION()
    void Job_CleanUpConstNPCSpawner(const FECSEntity &inout SpawnerEntity, const FC_EcologyRuntimeConstNPCSpawner &inout NPCSpawner) const
    {
        FECSEntity local_4 = FECSEntity(NPCSpawner.CreatureEntity);
        if (local_4.IsValid())
        {
            ::FEcologyLifeCycleUtils::MarkEntityWaitDestroy(local_4, ECS::GetContextTime());
        }
        return;
    }
    UFUNCTION()
    void Job_ClearRefreshTag(const FECSEntity &inout SpawnerEntity) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
    UFUNCTION()
    void Run_Monitor_InitTeamSpawner_StaticReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyRuntimeClassicFlockSpawnerOnActiveView(this.GetECSWorld(), EECSRegType(1), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_InitTeamSpawner(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_InitTeamSpawner_DefaultReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyRuntimeClassicFlockSpawnerOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_InitTeamSpawner(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_InitTeamSpawner_LocalReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyRuntimeClassicFlockSpawnerOnActiveView(this.GetECSWorld(), EECSRegType(2), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_InitTeamSpawner(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_InitBossSpawner_StaticReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyMixRandomBossSpawnerOnActiveView(this.GetECSWorld(), EECSRegType(1), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_InitBossSpawner(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_InitBossSpawner_DefaultReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyMixRandomBossSpawnerOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_InitBossSpawner(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_InitBossSpawner_LocalReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyMixRandomBossSpawnerOnActiveView(this.GetECSWorld(), EECSRegType(2), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_InitBossSpawner(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_TeamSpawnerInactive_StaticReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyRuntimeClassicFlockSpawnerOnInactiveView(this.GetECSWorld(), EECSRegType(1), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_TeamSpawnerInactive(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_TeamSpawnerInactive_DefaultReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyRuntimeClassicFlockSpawnerOnInactiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_TeamSpawnerInactive(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_TeamSpawnerInactive_LocalReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyRuntimeClassicFlockSpawnerOnInactiveView(this.GetECSWorld(), EECSRegType(2), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_TeamSpawnerInactive(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_FlockEntityActive_StaticReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyFlockChildSpawnComponentOnActiveView(this.GetECSWorld(), EECSRegType(1), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_FlockEntityActive(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_FlockEntityActive_DefaultReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyFlockChildSpawnComponentOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_FlockEntityActive(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_FlockEntityActive_LocalReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyFlockChildSpawnComponentOnActiveView(this.GetECSWorld(), EECSRegType(2), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_FlockEntityActive(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Jon_CleanUpFlockEntity_StaticReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        MarkModifiedIfDirty local_48;
        int local_172 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 1;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Jon_CleanUpFlockEntity(local_38, local_40);
                local_48.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Exclude(local_86).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_100 = 0;
        FECSRuntimeViewIterator local_134 = local_86.Iterator();
        for (; local_134.CanProceed;)
        {
            local_38 = local_134.Proceed();
            ++local_100;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Jon_CleanUpFlockEntity(local_172, local_40);
            local_48.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_100);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Jon_CleanUpFlockEntity_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        MarkModifiedIfDirty local_48;
        int local_172 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_6 = 0;
        int local_5 = local_6;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Jon_CleanUpFlockEntity(local_38, local_40);
                local_48.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Exclude(local_86).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_100 = 0;
        FECSRuntimeViewIterator local_134 = local_86.Iterator();
        for (; local_134.CanProceed;)
        {
            local_38 = local_134.Proceed();
            ++local_100;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Jon_CleanUpFlockEntity(local_172, local_40);
            local_48.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_100);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Jon_CleanUpFlockEntity_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        MarkModifiedIfDirty local_48;
        int local_172 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 2;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Jon_CleanUpFlockEntity(local_38, local_40);
                local_48.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Exclude(local_86).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_100 = 0;
        FECSRuntimeViewIterator local_134 = local_86.Iterator();
        for (; local_134.CanProceed;)
        {
            local_38 = local_134.Proceed();
            ++local_100;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Jon_CleanUpFlockEntity(local_172, local_40);
            local_48.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_100);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleEQSProxyEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_AIEQSProxyEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_AIEQSProxyEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleEQSProxyEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_OnRequestRefresh() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_RequestRefreshSpawnerEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_RequestRefreshSpawnerEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_OnRequestRefresh(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ForceRefreshClassicSpanwer() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_174 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_10 = 2;
        int local_9 = local_10;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_ForceRefreshClassicSpanwer(local_40, local_6, local_42);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Exclude(local_88).opCall();
        bool local_8 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_88.Iterator();
        for (; local_136.CanProceed;)
        {
            local_40 = local_136.Proceed();
            ++local_102;
            if (local_8)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_ForceRefreshClassicSpanwer(local_174, local_6, local_42);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_8)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ForceRefreshBossSpanwer() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_184 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_10 = 2;
        int local_9 = local_10;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_ForceRefreshBossSpanwer(local_40, local_6, local_42, local_48);
                FECSEntity::MarkModifiedIfDirty<FC_EcologyMixRandomBossSpawner> local_56;
                local_56.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Exclude(local_94).opCall();
        bool local_8 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_112 = 0;
        FECSRuntimeViewIterator local_146 = local_94.Iterator();
        for (; local_146.CanProceed;)
        {
            local_40 = local_146.Proceed();
            ++local_112;
            if (local_8)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_ForceRefreshBossSpanwer(local_184, local_6, local_42, local_48);
            FECSEntity::MarkModifiedIfDirty<FC_EcologyMixRandomBossSpawner>(local_40).opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_112);
        if (local_8)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_BossSpawnerInactive_StaticReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyMixRandomBossSpawnerOnInactiveView(this.GetECSWorld(), EECSRegType(1), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_BossSpawnerInactive(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_BossSpawnerInactive_DefaultReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyMixRandomBossSpawnerOnInactiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_BossSpawnerInactive(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_BossSpawnerInactive_LocalReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyMixRandomBossSpawnerOnInactiveView(this.GetECSWorld(), EECSRegType(2), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_BossSpawnerInactive(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ConstFlockSpawnerInactivate_StaticReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyRuntimeConstFlockSpawnerOnInactiveView(this.GetECSWorld(), EECSRegType(1), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_ConstFlockSpawnerInactivate(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ConstFlockSpawnerInactivate_DefaultReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyRuntimeConstFlockSpawnerOnInactiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_ConstFlockSpawnerInactivate(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ConstFlockSpawnerInactivate_LocalReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyRuntimeConstFlockSpawnerOnInactiveView(this.GetECSWorld(), EECSRegType(2), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_ConstFlockSpawnerInactivate(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CleanUpConstFlockSpawner_StaticReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_168 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 1;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_CleanUpConstFlockSpawner(local_38, local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_82 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_86;
        local_86.opCall();
        Include local_90;
        local_90.opCall();
        Exclude(local_82).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_96 = 0;
        FECSRuntimeViewIterator local_130 = local_82.Iterator();
        for (; local_130.CanProceed;)
        {
            local_38 = local_130.Proceed();
            ++local_96;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_CleanUpConstFlockSpawner(local_168, local_40);
        }
        local_4.UpdateCachedEntityCount(local_96);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CleanUpConstFlockSpawner_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_168 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_6 = 0;
        int local_5 = local_6;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_CleanUpConstFlockSpawner(local_38, local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_82 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_86;
        local_86.opCall();
        Include local_90;
        local_90.opCall();
        Exclude(local_82).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_96 = 0;
        FECSRuntimeViewIterator local_130 = local_82.Iterator();
        for (; local_130.CanProceed;)
        {
            local_38 = local_130.Proceed();
            ++local_96;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_CleanUpConstFlockSpawner(local_168, local_40);
        }
        local_4.UpdateCachedEntityCount(local_96);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CleanUpConstFlockSpawner_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_168 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 2;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_CleanUpConstFlockSpawner(local_38, local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_82 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_86;
        local_86.opCall();
        Include local_90;
        local_90.opCall();
        Exclude(local_82).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_96 = 0;
        FECSRuntimeViewIterator local_130 = local_82.Iterator();
        for (; local_130.CanProceed;)
        {
            local_38 = local_130.Proceed();
            ++local_96;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_CleanUpConstFlockSpawner(local_168, local_40);
        }
        local_4.UpdateCachedEntityCount(local_96);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ConstFlockSpawnerActivate_StaticReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyRuntimeConstFlockSpawnerOnActiveView(this.GetECSWorld(), EECSRegType(1), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_ConstFlockSpawnerActivate(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ConstFlockSpawnerActivate_DefaultReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyRuntimeConstFlockSpawnerOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_ConstFlockSpawnerActivate(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ConstFlockSpawnerActivate_LocalReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyRuntimeConstFlockSpawnerOnActiveView(this.GetECSWorld(), EECSRegType(2), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_ConstFlockSpawnerActivate(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_RefreshConstFlockSpawner_StaticReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        MarkModifiedIfDirty local_48;
        int local_172 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 1;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_RefreshConstFlockSpawner(local_38, local_40);
                local_48.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Exclude(local_86).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_100 = 0;
        FECSRuntimeViewIterator local_134 = local_86.Iterator();
        for (; local_134.CanProceed;)
        {
            local_38 = local_134.Proceed();
            ++local_100;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_RefreshConstFlockSpawner(local_172, local_40);
            local_48.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_100);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_RefreshConstFlockSpawner_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        MarkModifiedIfDirty local_48;
        int local_172 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_6 = 0;
        int local_5 = local_6;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_RefreshConstFlockSpawner(local_38, local_40);
                local_48.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Exclude(local_86).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_100 = 0;
        FECSRuntimeViewIterator local_134 = local_86.Iterator();
        for (; local_134.CanProceed;)
        {
            local_38 = local_134.Proceed();
            ++local_100;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_RefreshConstFlockSpawner(local_172, local_40);
            local_48.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_100);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_RefreshConstFlockSpawner_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        MarkModifiedIfDirty local_48;
        int local_172 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 2;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_RefreshConstFlockSpawner(local_38, local_40);
                local_48.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Exclude(local_86).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_100 = 0;
        FECSRuntimeViewIterator local_134 = local_86.Iterator();
        for (; local_134.CanProceed;)
        {
            local_38 = local_134.Proceed();
            ++local_100;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_RefreshConstFlockSpawner(local_172, local_40);
            local_48.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_100);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_PostConstFlockSpawnerActivate_StaticReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyRuntimeConstFlockSpawnerOnActiveView(this.GetECSWorld(), EECSRegType(1), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_PostConstFlockSpawnerActivate(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_PostConstFlockSpawnerActivate_DefaultReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyRuntimeConstFlockSpawnerOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_PostConstFlockSpawnerActivate(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_PostConstFlockSpawnerActivate_LocalReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyRuntimeConstFlockSpawnerOnActiveView(this.GetECSWorld(), EECSRegType(2), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_PostConstFlockSpawnerActivate(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_RefreshConstNPCSpawner_StaticReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        MarkModifiedIfDirty local_54;
        int local_182 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 1;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_RefreshConstNPCSpawner(local_38, local_40, local_46);
                local_54.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_92 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Exclude(local_92).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_110 = 0;
        FECSRuntimeViewIterator local_144 = local_92.Iterator();
        for (; local_144.CanProceed;)
        {
            local_38 = local_144.Proceed();
            ++local_110;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_RefreshConstNPCSpawner(local_182, local_40, local_46);
            local_54.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_110);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_RefreshConstNPCSpawner_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        MarkModifiedIfDirty local_54;
        int local_182 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_6 = 0;
        int local_5 = local_6;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_RefreshConstNPCSpawner(local_38, local_40, local_46);
                local_54.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_92 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Exclude(local_92).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_110 = 0;
        FECSRuntimeViewIterator local_144 = local_92.Iterator();
        for (; local_144.CanProceed;)
        {
            local_38 = local_144.Proceed();
            ++local_110;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_RefreshConstNPCSpawner(local_182, local_40, local_46);
            local_54.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_110);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_RefreshConstNPCSpawner_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        MarkModifiedIfDirty local_54;
        int local_182 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 2;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_RefreshConstNPCSpawner(local_38, local_40, local_46);
                local_54.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_92 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Exclude(local_92).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_110 = 0;
        FECSRuntimeViewIterator local_144 = local_92.Iterator();
        for (; local_144.CanProceed;)
        {
            local_38 = local_144.Proceed();
            ++local_110;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_RefreshConstNPCSpawner(local_182, local_40, local_46);
            local_54.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_110);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ConstNPCSpawnerInactivate_StaticReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyRuntimeConstNPCSpawnerOnInactiveView(this.GetECSWorld(), EECSRegType(1), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_ConstNPCSpawnerInactivate(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ConstNPCSpawnerInactivate_DefaultReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyRuntimeConstNPCSpawnerOnInactiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_ConstNPCSpawnerInactivate(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ConstNPCSpawnerInactivate_LocalReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyRuntimeConstNPCSpawnerOnInactiveView(this.GetECSWorld(), EECSRegType(2), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_ConstNPCSpawnerInactivate(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CleanUpConstNPCSpawner_StaticReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_168 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 1;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_CleanUpConstNPCSpawner(local_38, local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_82 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_86;
        local_86.opCall();
        Include local_90;
        local_90.opCall();
        Exclude(local_82).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_96 = 0;
        FECSRuntimeViewIterator local_130 = local_82.Iterator();
        for (; local_130.CanProceed;)
        {
            local_38 = local_130.Proceed();
            ++local_96;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_CleanUpConstNPCSpawner(local_168, local_40);
        }
        local_4.UpdateCachedEntityCount(local_96);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CleanUpConstNPCSpawner_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_168 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_6 = 0;
        int local_5 = local_6;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_CleanUpConstNPCSpawner(local_38, local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_82 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_86;
        local_86.opCall();
        Include local_90;
        local_90.opCall();
        Exclude(local_82).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_96 = 0;
        FECSRuntimeViewIterator local_130 = local_82.Iterator();
        for (; local_130.CanProceed;)
        {
            local_38 = local_130.Proceed();
            ++local_96;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_CleanUpConstNPCSpawner(local_168, local_40);
        }
        local_4.UpdateCachedEntityCount(local_96);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CleanUpConstNPCSpawner_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_168 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 2;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_CleanUpConstNPCSpawner(local_38, local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_82 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_86;
        local_86.opCall();
        Include local_90;
        local_90.opCall();
        Exclude(local_82).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_96 = 0;
        FECSRuntimeViewIterator local_130 = local_82.Iterator();
        for (; local_130.CanProceed;)
        {
            local_38 = local_130.Proceed();
            ++local_96;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_CleanUpConstNPCSpawner(local_168, local_40);
        }
        local_4.UpdateCachedEntityCount(local_96);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearRefreshTag_StaticReg() const
    {
        const FECSEntity& local_38;
        int local_162 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 1;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_ClearRefreshTag(local_38);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_76 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_80;
        local_80.opCall();
        Include local_84;
        local_84.opCall();
        Exclude(local_76).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_90 = 0;
        FECSRuntimeViewIterator local_124 = local_76.Iterator();
        for (; local_124.CanProceed;)
        {
            local_38 = local_124.Proceed();
            ++local_90;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_ClearRefreshTag(local_162);
        }
        local_4.UpdateCachedEntityCount(local_90);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearRefreshTag_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_162 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_6 = 0;
        int local_5 = local_6;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_ClearRefreshTag(local_38);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_76 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_80;
        local_80.opCall();
        Include local_84;
        local_84.opCall();
        Exclude(local_76).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_90 = 0;
        FECSRuntimeViewIterator local_124 = local_76.Iterator();
        for (; local_124.CanProceed;)
        {
            local_38 = local_124.Proceed();
            ++local_90;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_ClearRefreshTag(local_162);
        }
        local_4.UpdateCachedEntityCount(local_90);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearRefreshTag_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_162 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 2;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_ClearRefreshTag(local_38);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_76 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_80;
        local_80.opCall();
        Include local_84;
        local_84.opCall();
        Exclude(local_76).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_90 = 0;
        FECSRuntimeViewIterator local_124 = local_76.Iterator();
        for (; local_124.CanProceed;)
        {
            local_38 = local_124.Proceed();
            ++local_90;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_ClearRefreshTag(local_162);
        }
        local_4.UpdateCachedEntityCount(local_90);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
}


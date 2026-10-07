

class APVX_Level_AutoSpawnMonster : AKLLevelScriptBaseActor
{
    UPROPERTY()
    bool bAutoSpawn = true;
    UPROPERTY()
    FName SpawnOnCustomEvent;
    UPROPERTY()
    bool bIsLoopSpawn = true;
    UPROPERTY()
    bool bUseBuff = true;
    UPROPERTY()
    TArray<FBuffConfigRef> ExternSpawnBuffs;
    UPROPERTY()
    TDataObjectPtr<FMinimapIconConfig> IconSettings;
    UPROPERTY()
    TSoftObjectPtr<AGenericSpawnerECSPrefab> GenericSpawnerECSPrefab;
    UPROPERTY()
    bool bUseRandomSpawner = false;
    UPROPERTY()
    TArray<TSoftObjectPtr<AGenericSpawnerECSPrefab>> RandomSpawnerECSPrefabs;
    UPROPERTY()
    int RandomSpawnCount = 1;
    UPROPERTY()
    TArray<TDataObjectPtr<FMonsterMainConfig>> MonsterConfigs;
    UPROPERTY()
    int SpawnCountMin = 2;
    UPROPERTY()
    int SpawnCountMax = 4;
    UPROPERTY()
    float32 SpawnRadius = 700.0f;
    TArray<FBuffConfigRef> SpawnBuffs;
    int SpawnCount = 0;
    bool bIsSpawned = false;
    TArray<FECSEntity> SpawnedMonsters;


    UFUNCTION()
    void PreLevelBeginPlay_Implementation()
    {
        Super::PreLevelBeginPlay_Implementation();
        this.RegisterLevelEventCallback(n"OnLevelCustomEvent", FCE_CustomLevelEvent, ENTITY_NULL);
        if (this.bAutoSpawn)
        {
            this.StartSpawn();
        }
        return;
    }
    UFUNCTION()
    void OnLevelCustomEvent(const FCE_CustomLevelEvent &inout Event)
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void TurnOnMinimapIcon()
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    FECSEntity ResolveSpawnerFromSoftPtr(const TSoftObjectPtr<AGenericSpawnerECSPrefab> &inout Prefab)
    {
        AGenericSpawnerECSPrefab local_8;
        if (Prefab.IsNull())
        {
            return FECSEntity();
        }
        if ((!((local_8 != nullptr))))
        {
            return FECSEntity();
        }
        return ECS::GetPrefabEntity(local_8);
    }
    FECSEntity ResolveMonsterSpawnerEntity()
    {
        return this.ResolveSpawnerFromSoftPtr(this.GenericSpawnerECSPrefab);
    }
    bool ShouldSpawnViaEcologyConstFlock() const
    {
        if (this.bUseRandomSpawner)
        {
            return this.RandomSpawnerECSPrefabs.Num() > 0 && (this.RandomSpawnCount > 0);
        }
        return !(this.GenericSpawnerECSPrefab.IsNull());
    }
    void ApplyBuffsToMonsterEntity(const FECSEntity &inout NewEntity)
    {
        if (!(NewEntity))
        {
            return;
        }
        if (this.bUseBuff)
        {
            for (auto& local_16 : this.SpawnBuffs)
            {
                ::BlueprintFunctions_Common::InitEntityAddBuff(FECSEntityAdapter(NewEntity), local_16);
            }
        }
        for (auto& local_16 : this.ExternSpawnBuffs)
        {
            ::BlueprintFunctions_Common::InitEntityAddBuff(FECSEntityAdapter(NewEntity), local_16);
        }
        return;
    }
    void CollectCreaturesAfterConstFlockRefresh(const FECSEntity &inout SpawnerEntity, const bool bAppend = false)
    {
        int local_16 = 0;
        Get local_34;
        if (!(bAppend))
        {
            this.SpawnedMonsters.Empty(0);
            this.SpawnCount = 0;
        }
        Has local_6;
        if (!(local_6.opCall()))
        {
            return;
        }
        Has local_10;
        if (!(local_10.opCall()))
        {
            return;
        }
        Get local_22;
        FName local_18(local_22.opCall().DataLayerName);
        if (!(FECSEntity(local_16.FlockEntity).IsValid()) || !(local_34.opCall()))
        {
            return;
        }
        for (auto& local_50 : local_34.opCall().CreatureEntities)
        {
            FECSEntity local_26 = FECSEntity(local_50);
            if (!(local_26.IsValid()))
            {
                continue;
            }
            KLLevelCommon::AssignDataLayerName(local_26, local_18);
            this.ApplyBuffsToMonsterEntity(local_26);
            this.SpawnedMonsters.Add(local_26);
            ++this.SpawnCount;
        }
        return;
    }
    void SpawnMonstersViaConstFlockSpawner()
    {
        Has local_26;
        int local_32 = 0;
        if (this.bUseRandomSpawner)
        {
            bool local_11;
            if (this.RandomSpawnerECSPrefabs.Num() == 0 || (this.RandomSpawnCount <= 0))
            {
                return;
            }
            TArray<int> local_8;
            int local_9 = 0;
            for (; local_9 < this.RandomSpawnerECSPrefabs.Num(); )
            {
                local_8.Add(local_9);
                ++local_9;
            }
            local_8.Shuffle();
            int local_10 = FMath::Min(this.RandomSpawnCount, local_8.Num());
            local_11 = false;
            int local_12 = 0;
            for (; local_12 < local_10; ++local_12)
            {
                FECSEntity local_22 = this.ResolveSpawnerFromSoftPtr(this.RandomSpawnerECSPrefabs[local_8[local_12]]);
                if (!(local_22.IsValid()) || !(local_26.opCall()))
                {
                    continue;
                }
                ::FConstFlockSpawnerUtils::RefreshConstSpawnerCreatures(local_22, local_32);
                this.CollectCreaturesAfterConstFlockRefresh(local_22, local_11);
                local_11 = true;
            }
            return;
        }
        FECSEntity local_18 = this.ResolveMonsterSpawnerEntity();
        if (!(local_18.IsValid()) || !(local_26.opCall()))
        {
            return;
        }
        ::FConstFlockSpawnerUtils::RefreshConstSpawnerCreatures(local_18, local_32);
        this.CollectCreaturesAfterConstFlockRefresh(local_18, false);
        return;
    }
    UFUNCTION()
    void RandomSpawnMonster()
    {
        if (this.MonsterConfigs.Num() == 0)
        {
            return;
        }
        int local_5 = FMath::RandRange(this.SpawnCountMin, this.SpawnCountMax);
        this.SpawnCount = 0;
        int local_6 = 0;
        for (; local_6 < local_5; ++local_6)
        {
            TDataObjectPtr<FMonsterMainConfig> local_32 = this.MonsterConfigs[(FMath::RandRange(0, (this.MonsterConfigs.Num() - 1)))];
            FVector local_62(FVector::ZeroVector);
            ::BlueprintFunctions_Level::GetEntityLocation(FECSEntityAdapter(this.LevelScriptEntity), local_62);
            float32 local_69 = -this.SpawnRadius;
            float32 local_71 = FMath::RandRange(local_69, this.SpawnRadius);
            local_62.X += local_71;
            local_71 = FMath::RandRange(-this.SpawnRadius, this.SpawnRadius);
            local_62.Y += local_71;
            FRotator local_82 = FRotator(0.0, FMath::RandRange(0, 360), 0.0);
            FECSEntity local_96 = ::BlueprintFunctions_Ecology::SpawnMonsterByMonsterIdInValidPos(FECSEntityAdapter(this.LevelScriptEntity), local_32, local_62, local_82, 1000.0f, 50.0f, true, nullptr, 0, NAME_None, false);
            if (!(local_96))
            {
                continue;
            }
            Get local_104;
            KLLevelCommon::AssignDataLayerName(local_96, local_104.opCall().DataLayerName);
            this.ApplyBuffsToMonsterEntity(local_96);
            this.SpawnedMonsters.Add(local_96);
            ++this.SpawnCount;
        }
        return;
    }
    void StartSpawn()
    {
        this.bIsSpawned = true;
        this.SpawnedMonsters.Empty(0);
        this.TurnOnMinimapIcon();
        if (this.ShouldSpawnViaEcologyConstFlock())
        {
            this.SpawnMonstersViaConstFlockSpawner();
        }
        else
        {
            XWarning(ELog(22), FString().Append("PVX_Level_AutoSpawnMonster: Ecology spawner not configured (bUseRandomSpawner=").Append(this.bUseRandomSpawner).Append("), using RandomSpawnMonster. InstanceName=").Append(this.GetName()).Append(", UniqueID=").Append(this.GetUniqueID()));
            this.RandomSpawnMonster();
        }
        this.RegisterLevelEventCallback(n"ReceiveDeathEvent_PVX", FCE_DeathEvent, ENTITY_NULL);
        return;
    }
    UFUNCTION()
    void ReceiveDeathEvent_PVX(const FCE_DeathEvent &inout DeathEvent)
    {
        Has local_4;
        bool local_5;
        if (!(local_4.opCall()))
        {
            local_5 = false;
        }
        else
        {
            Has local_10;
            local_5 = local_10.opCall();
        }
        Get local_16;
        if (local_5)
        {
            Get local_20;
            if ((local_16.opCall().GetOwnerDataLayerName() == local_20.opCall().DataLayerName))
            {
                --this.SpawnCount;
                if (this.SpawnCount <= 0)
                {
                    this.TurnOffMinimapIcon();
                    this.UnregisterLevelEventCallback(n"ReceiveDeathEvent_PVX", FCE_DeathEvent, ENTITY_NULL);
                }
            }
        }
        Has local_46;
        if (this.ShouldSpawnViaEcologyConstFlock())
        {
            int local_27 = 0;
            for (auto& local_42 : this.SpawnedMonsters)
            {
                if (local_42.IsValid() && local_42.IsActive() && !(local_46.opCall()))
                {
                    ++local_27;
                }
            }
            if (local_27 <= 0)
            {
                this.TurnOffMinimapIcon();
                this.UnregisterLevelEventCallback(n"ReceiveDeathEvent_PVX", FCE_DeathEvent, ENTITY_NULL);
            }
        }
        return;
    }
    void TurnOffMinimapIcon()
    {
        ::EntityLevelSpotUtils::RemoveSpotData(this.LevelScriptEntity, ELevelSpotDataSource(4));
        return;
    }
}


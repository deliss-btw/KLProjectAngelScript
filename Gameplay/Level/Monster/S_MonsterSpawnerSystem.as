

class US_MonsterSpawnerSystem : UECSScriptSystem
{
    US_MonsterSpawnerSystem()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_LevelProcessRandomSpawnMonster(const FECSEntity &inout SpawnerEntity, const FC_RandomMonsterSpawner &inout RandomMonsterSpawner) const
    {
        FC_RandomMonsterSpawnerRuntimeInfo local_18;
        AActor local_38;
        UClass local_72;
        if (RandomMonsterSpawner.CandidatePoints.Num() == 0)
        {
            return;
        }
        if (RandomMonsterSpawner.MonsterTypeList.Num() == 0)
        {
            return;
        }
        ARandomMonsterSpawnerPrefab local_6 = (Cast<ARandomMonsterSpawnerPrefab>(ULevelActorManager::Get().GetInLevelPrefabByEntity(SpawnerEntity)));
        TArray<TSoftObjectPtr<AActor>> local_22 = RandomMonsterSpawner.CandidatePoints;
        local_22.Shuffle();
        int local_23 = 0;
        for (; local_23 < int(RandomMonsterSpawner.TargetSpawnNum); ++local_23)
        {
            TSoftObjectPtr<AActor> local_34 = local_22[(local_23 % local_22.Num())];
            if ((!((local_38 != nullptr))))
            {
                XWarning(ELog(22), FString().Append("MonsterSpawner ").Append(SpawnerEntity).Append(": Failed to get spawn point ").Append(local_34.ToString()));
                continue;
            }
            int local_1 = RandomMonsterSpawner.MonsterTypeList.Num();
            local_1 = local_1 - 1;
            TSoftClassPtr<AMonsterPrefab> local_60 = TSoftClassPtr<AMonsterPrefab>(RandomMonsterSpawner.MonsterTypeList[FMath::RandRange(0, local_1)]);
            local_72 = Cast<UClass>(local_60.ToSoftObjectPath().TryLoad());
            TSubclassOf<AECSPrefab> local_74 = TSubclassOf<AECSPrefab>(local_72);
            if ((local_74 == nullptr))
            {
                XWarning(ELog(22), FString().Append("MonsterSpawner ").Append(SpawnerEntity).Append(": Failed to load monster prefab ").Append(local_60));
                continue;
            }
            FECSEntity local_94 = ECS::RequestEntityByPrefabDeferred(local_74, local_38.GetActorLocation(), local_38.GetActorRotation(), EPrefabCollisionAlignment(2), EECSRegType(0), false);
            if (!(local_94.IsValid()))
            {
                XError(ELog(22), FString().Append("MonsterSpawner ").Append(SpawnerEntity).Append(": Failed to spawn monster ").Append(local_60).Append(" at ").Append(local_38.GetActorLocation()));
            }
            FC_MonsterSpawnedBySpawner local_106;
            Assign local_102;
            local_102.opCall(local_106).SpawnerEntity = SpawnerEntity;
            local_18.SpawnedMonsters.Add(local_94);
            Get local_110;
            const FC_OwnerDataLayer& local_112 = local_110.opCall();
            if (local_112)
            {
                KLLevelCommon::AssignDataLayerName(local_94, local_112.GetOwnerDataLayerName());
            }
            if (local_6 != nullptr)
            {
                local_6.OnEntitySpawned.Broadcast(local_94);
            }
        }
        local_18.bSpawnFinished = true;
        if (local_6 != nullptr)
        {
            local_6.OnEntitySpawnFinished.Broadcast();
        }
        Remove local_118;
        local_118.opCall();
        return;
    }
    UFUNCTION()
    void ServerJob_ListenDeathEvent(const FCE_DeathEvent &inout DeathEvent) const
    {
        ARandomMonsterSpawnerPrefab local_20;
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            FECSEntity local_12;
            if (!(local_12.IsValid()))
            {
                return;
            }
            local_20 = (Cast<ARandomMonsterSpawnerPrefab>(ULevelActorManager::Get().GetInLevelPrefabByEntity(local_12)));
            if (!((local_20 != nullptr)))
            {
                return;
            }
            local_20.OnEntityDead.Broadcast(DeathEvent.Sender, FECSEntity(DeathEvent.KilledByEntity));
            Get local_28;
            const FC_RandomMonsterSpawnerRuntimeInfo& local_30 = local_28.opCall();
            if (local_30)
            {
                if (local_30.bSpawnFinished)
                {
                    bool local_31;
                    local_31 = true;
                    for (auto& local_46 : local_30.SpawnedMonsters)
                    {
                        if (::FASCommonUtils::IsCharacterEntityAlive(local_46))
                        {
                            local_31 = false;
                            break;
                        }
                    }
                    if (local_31)
                    {
                        local_20.OnEntityAllDead.Broadcast();
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_LevelProcessRandomSpawnMonster() const
    {
        const FECSEntity& local_42;
        int local_44 = 0;
        int local_172 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(0.2))))
        {
            return;
        }
        int local_11 = 0;
        int local_10 = local_11;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_14 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_18 = local_4.GetViewCacheEntities();
            int local_19 = 0;
            for (auto& local_34 : local_18)
            {
                local_34;
                FECSEntity local_38;
                if (!(local_38.IsValid()))
                {
                    continue;
                }
                ++local_19;
                FECSEntityScopeCycleCounter local_39 = FECSEntityScopeCycleCounter(local_38);
                this.ServerJob_LevelProcessRandomSpawnMonster(local_42, local_44);
            }
            local_4.UpdateCachedEntityCount(local_19);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Exclude(local_86).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_20 = local_4.GetViewCacheEpoch();
        int local_100 = 0;
        FECSRuntimeViewIterator local_134 = local_86.Iterator();
        for (; local_134.CanProceed;)
        {
            local_42 = local_134.Proceed();
            ++local_100;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_42.GetId());
            }
            FECSEntityScopeCycleCounter local_39_2 = FECSEntityScopeCycleCounter(local_42);
            this.ServerJob_LevelProcessRandomSpawnMonster(local_172, local_44);
        }
        local_4.UpdateCachedEntityCount(local_100);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_20);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_ListenDeathEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DeathEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DeathEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_ListenDeathEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}


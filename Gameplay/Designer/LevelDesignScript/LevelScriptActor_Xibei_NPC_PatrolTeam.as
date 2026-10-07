

class ALevelScriptActor_Xibei_NPC_PatrolTeam : AKLLevelScriptBaseActor
{
    UPROPERTY()
    TSubclassOf<AKLLevelScriptActor> PreconditionKLLevelClass;
    UPROPERTY()
    TMap<FString, FEcosimAIV2CreateEntityBatch> CreateEntityBatchConfig;
    UPROPERTY()
    TArray<TSubclassOf<AECSPrefab>> CartPrefabClasses;
    UPROPERTY()
    TArray<TDataObjectPtr<FMonsterMainConfig>> CartMountList;
    UPROPERTY()
    TSubclassOf<UInteractionBehaviorBase> CartMountInteractClass;
    UPROPERTY()
    FName CartCreatedEventName;
    UPROPERTY()
    float32 LengthOffset = 400.0f;
    UPROPERTY()
    float32 WidthOffset = 150.0f;
    UPROPERTY()
    int SideBalanceTolerance = 2;
    UPROPERTY()
    FPatrolTargetPointConfig PatrolPointConfig;
    TArray<FECSEntity> EntityList;
    TArray<FECSEntity> SlotEntities;
    TArray<FString> BatchKeys;
    TSubclassOf<AECSPrefab> SelectedCartPrefab;
    TDataObjectPtr<FMonsterMainConfig> SelectedCartMountConfig;
    FECSEntity TeamEntity;
    FECSEntity CartEntity;
    FECSEntity CartMountEntity;
    ATargetPoint StartPoint;
    ATargetPoint NextPoint;
    int CurPatrolPointIndex = 0;
    int CurrentSpawnedEntityNumber = 0;
    int TotalSpawnedEntityNumber = 0;
    bool bTeamCreated = false;
    FLevelTimerCallback StreamingPollTimer;


    UFUNCTION()
    void ECSBeginPlayBP_Implementation()
    {
        this.ResetRuntimeState();
        if ((!((this.PreconditionKLLevelClass == nullptr))))
        {
            KLDataLayer::SetDataLayerRuntimeStateByLBPClass(__GetWorldContext(), this.PreconditionKLLevelClass, EDataLayerRuntimeState(2));
            this.StreamingPollTimer.BindUFunction(this, n"OnStreamingPollTick");
            UECSLevelTimerFunctions::ECSLevelSetTimer(this, this.StreamingPollTimer, 0.5f, true, -1.0f);
            return;
        }
        this.InitPatrolAndSpawn();
        return;
    }
    UFUNCTION()
    void ECSEndPlayBP_Implementation()
    {
        UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.StreamingPollTimer);
        for (auto& local_16 : this.EntityList)
        {
            if (local_16.IsValid())
            {
                ::BlueprintFunctions_Level::Level_DestroyEntityDirectly(FECSEntityAdapter(local_16));
            }
        }
        this.EntityList.Empty(0);
        this.SlotEntities.Empty(0);
        XLog(ELog(22), "Xibei_NPC_PatrolTeam: ECSEndPlay, all entities destroyed");
        return;
    }
    void ResetRuntimeState()
    {
        this.EntityList.Empty(0);
        this.SlotEntities.Empty(0);
        this.BatchKeys.Empty(0);
        this.SelectedCartPrefab = nullptr;
        TDataObjectPtr<FMonsterMainConfig> local_26;
        this.SelectedCartMountConfig = local_26;
        this.TeamEntity = ENTITY_NULL;
        this.CartEntity = ENTITY_NULL;
        this.CartMountEntity = ENTITY_NULL;
        this.StartPoint = nullptr;
        this.NextPoint = nullptr;
        this.CurPatrolPointIndex = 0;
        this.CurrentSpawnedEntityNumber = 0;
        this.TotalSpawnedEntityNumber = 0;
        this.bTeamCreated = false;
        return;
    }
    UFUNCTION()
    void OnStreamingPollTick()
    {
        UWorldPartitionSubsystem local_4 = UWorldPartitionSubsystem::Get();
        if (local_4 == nullptr)
        {
            UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.StreamingPollTimer);
            this.InitPatrolAndSpawn();
            return;
        }
        if (local_4.IsAllDataLayerStreamingCompleted())
        {
            UECSLevelTimerFunctions::ECSLevelClearTimer(this, this.StreamingPollTimer);
            this.InitPatrolAndSpawn();
        }
        return;
    }
    void InitPatrolAndSpawn()
    {
        this.StartPoint = ::BlueprintFunctions_Designer::GetPatrolConfigSpawnPoint(this.PatrolPointConfig);
        if (this.StartPoint != nullptr)
        {
            this.NextPoint = ::BlueprintFunctions_Designer::GetPatrolConfigNextPoint(this.PatrolPointConfig, this.CurPatrolPointIndex);
        }
        if (this.StartPoint == nullptr)
        {
            XWarning(ELog(22), "Xibei_NPC_PatrolTeam: StartPoint is null, skip entity creation");
            return;
        }
        this.CreateEntityBatch();
        return;
    }
    FTransform ComputeAnchorTransform()
    {
        FTransform local_24;
        FVector local_36 = this.StartPoint.GetActorLocation();
        FRotator local_48 = this.StartPoint.GetActorRotation();
        if (this.NextPoint != nullptr)
        {
            FVector local_64 = (this.NextPoint.GetActorLocation() - local_36);
            local_64.Z = 0.0;
            if (!(local_64.IsNearlyZero(9.999999747378752e-5)))
            {
                local_48 = FRotator::MakeFromX(local_64);
            }
        }
        local_48.Pitch = 0.0;
        local_48.Roll = 0.0;
        local_24.SetLocation(local_36);
        local_24.SetRotation(FQuat(local_48));
        return local_24;
    }
    void CreateEntityBatch()
    {
        TSubclassOf<AECSPrefab> local_44;
        TSubclassOf<AECSPrefab> local_62;
        FECSEntity local_284;
        bool local_390;
        if (this.CreateEntityBatchConfig.Num() == 0)
        {
            XWarning(ELog(22), "Xibei_NPC_PatrolTeam: CreateEntityBatchConfig is empty");
            return;
        }
        this.BatchKeys.Empty(0);
        this.CreateEntityBatchConfig.GetKeys(this.BatchKeys);
        TArray<TSubclassOf<AECSPrefab>> local_8;
        for (auto& local_22 : this.BatchKeys)
        {
            FEcosimAIV2CreateEntityBatch& local_24 = this.CreateEntityBatchConfig[local_22];
            int local_25 = 0;
            for (; local_25 < int(local_24.MonsterNum); ++local_25)
            {
                for (auto& local_40 : local_24.MonsterConfigList)
                {
                    if (!(local_40.IsSet()))
                    {
                        continue;
                    }
                    local_44.GetCombatPrefab();
                    local_8.Add(local_44);
                }
            }
            local_25 = 0;
            for (; local_25 < int(local_24.NPCNum); ++local_25)
            {
                for (auto& local_58 : local_24.NPCConfigList)
                {
                    if (!(local_58.IsSet()))
                    {
                        continue;
                    }
                    local_62.GetCombatPrefab();
                    local_8.Add(local_62);
                }
            }
        }
        this.SelectedCartPrefab = nullptr;
        if (this.CartPrefabClasses.Num() > 0)
        {
            this.SelectedCartPrefab = this.CartPrefabClasses[FMath::RandRange(0, (this.CartPrefabClasses.Num() - 1))];
            local_8.Add(this.SelectedCartPrefab);
        }
        TDataObjectPtr<FMonsterMainConfig> local_88;
        this.SelectedCartMountConfig = local_88;
        if (this.CartMountList.Num() > 0)
        {
            this.SelectedCartMountConfig = this.CartMountList[FMath::RandRange(0, (this.CartMountList.Num() - 1))];
            if (this.SelectedCartMountConfig.IsSet())
            {
                TSubclassOf<AECSPrefab> local_116;
                local_116.GetCombatPrefab();
                local_8.Add(local_116);
            }
        }
        if (local_8.Num() == 0)
        {
            XWarning(ELog(22), "Xibei_NPC_PatrolTeam: no member to spawn");
            return;
        }
        ::BlueprintFunctions_Level::Level_EcosimAIV2PrecreateConvoyTeam(local_8, this.LengthOffset, this.WidthOffset, this.TeamEntity);
        ::BlueprintFunctions_Level::Level_EcosimAIV2SetTeamSideBalanceTolerance(this.TeamEntity, this.SideBalanceTolerance);
        XLog(ELog(22), FString().Append("Xibei_NPC_PatrolTeam: precreated convoy team=").Append(this.TeamEntity).Append(", slots=").Append(local_8.Num()));
        FTransform local_172 = this.ComputeAnchorTransform();
        this.TotalSpawnedEntityNumber = local_8.Num();
        this.CurrentSpawnedEntityNumber = 0;
        this.bTeamCreated = false;
        this.EntityList.Empty(0);
        this.SlotEntities.Empty(0);
        int local_2 = 0;
        for (auto& local_22 : this.BatchKeys)
        {
            FEcosimAIV2CreateEntityBatch& local_24_2 = this.CreateEntityBatchConfig[local_22];
            int local_173 = 0;
            for (; local_173 < int(local_24_2.MonsterNum); ++local_173)
            {
                for (auto& local_40 : local_24_2.MonsterConfigList)
                {
                    if (!(local_40.IsSet()))
                    {
                        continue;
                    }
                    FTransform local_200;
                    ::BlueprintFunctions_Level::Level_EcosimAIV2GetSlotWorldTransform(this.TeamEntity, local_2, local_172, local_200);
                    FVector local_206(local_200.GetLocation());
                    FVector local_218;
                    bool local_3 = UNavigationSystemV1::ProjectPointToNavigation(__GetWorldContext(), local_206, local_218, nullptr, TSubclassOf<UNavigationQueryFilter>(nullptr), FVector(1000.0, 1000.0, 1000.0));
                    if (local_3)
                    {
                        float local_226 = (local_218 - local_206).Size();
                        XLog(ELog(22), FString().Append("Xibei_NPC_PatrolTeam: Mount [").Append(local_22).Append("] Slot[").Append(local_2).Append("] NavProject OK, Projected=").Append(local_218).Append(", Dist=").Append(local_226).Append(" cm"));
                        FECSDebugDraw::DrawDebugSphere(n"XibeiPatrolTeam", local_218, 30.0f, 12, FColor::Blue, FColor::Blue, 20.0f, uint8(0), 0.0f);
                        FECSDebugDraw::DrawDebugString(n"XibeiPatrolTeam", (local_218 + FVector(0.0, 0.0, 150.0)), FString().Append("NavProj Dist=").Append(local_226).Append(" cm"), FColor::Blue, 1.0f, FColor(uint8(0), uint8(0), uint8(0), uint8(0)), 20.0f);
                        FECSDebugDraw::DrawDebugLine(n"XibeiPatrolTeam", local_206, local_218, FColor::Blue, FColor::Blue, 20.0f, uint8(0), 0.0f);
                        local_206 = local_218;
                    }
                    else
                    {
                        XLog(ELog(22), FString().Append("Xibei_NPC_PatrolTeam: Mount [").Append(local_22).Append("] Slot[").Append(local_2).Append("] NavProject FAILED, using original Loc=").Append(local_206));
                    }
                    FEntityCreateFinishDelegate local_248;
                    local_248 = FEntityCreateFinishDelegate(this, n"OnEntityCreateFinish");
                    FRotator local_262 = FRotator(local_200.GetRotation());
                    FECSEntityAdapter local_278 = FECSEntityAdapter();
                    FString local_288 = FString().Append("Mount [").Append(local_22).Append("] Slot[").Append(local_2).Append("] Loc=").Append(local_200.GetLocation());
                    XLog(ELog(22), FString().Append("Xibei_NPC_PatrolTeam: Spawn ").Append(local_288).Append(", Entity=").Append(local_284));
                    FECSDebugDraw::DrawDebugString(n"XibeiPatrolTeam", (local_200.GetLocation() + FVector(0.0, 0.0, 100.0)), local_288, FColor::Green, 1.0f, FColor(uint8(0), uint8(0), uint8(0), uint8(0)), 20.0f);
                    FECSDebugDraw::DrawDebugSphere(n"XibeiPatrolTeam", local_200.GetLocation(), 30.0f, 12, FColor::Green, FColor::Green, 20.0f, uint8(0), 0.0f);
                    FVector local_244 = (local_200.GetLocation() + FVector(0.0, 0.0, 2000.0));
                    FVector local_300 = (local_200.GetLocation() - FVector(0.0, 0.0, 2000.0));
                    FHitResult local_376;
                    local_390 = System::LineTraceSingle(__GetWorldContext(), local_244, local_300, ETraceTypeQuery(5), false, TArray<AActor>(), EDrawDebugTrace(0), local_376, true, FLinearColor(1.0f, 0.0f, 0.0f, 1.0f), FLinearColor(0.0f, 1.0f, 0.0f, 1.0f), 5.0f);
                    if (local_390)
                    {
                        FString local_394 = FString().Append("GroundHit=").Append(local_376.ImpactPoint).Append(" DistToSpawn=").Append((FVector(local_376.ImpactPoint) - local_200.GetLocation()).Size()).Append(" cm");
                        XLog(ELog(22), FString().Append("Xibei_NPC_PatrolTeam: Mount [").Append(local_22).Append("] Slot[").Append(local_2).Append("] ").Append(local_394));
                        FECSDebugDraw::DrawDebugLine(n"XibeiPatrolTeam", local_244, local_376.ImpactPoint, FColor::Yellow, FColor::Yellow, 20.0f, uint8(0), 0.0f);
                        FECSDebugDraw::DrawDebugSphere(n"XibeiPatrolTeam", local_376.ImpactPoint, 30.0f, 12, FColor::Red, FColor::Red, 20.0f, uint8(0), 0.0f);
                        FECSDebugDraw::DrawDebugString(n"XibeiPatrolTeam", (FVector(local_376.ImpactPoint) + FVector(0.0, 0.0, 50.0)), local_394, FColor::Red, 1.0f, FColor(uint8(0), uint8(0), uint8(0), uint8(0)), 20.0f);
                    }
                    else
                    {
                        XLog(ELog(22), FString().Append("Xibei_NPC_PatrolTeam: Mount [").Append(local_22).Append("] Slot[").Append(local_2).Append("] Ground trace NO HIT from ").Append(local_244));
                        FECSDebugDraw::DrawDebugLine(n"XibeiPatrolTeam", local_244, local_300, FColor::Red, FColor::Red, 20.0f, uint8(0), 0.0f);
                    }
                    this.SlotEntities.Add(local_284);
                    if (local_284.IsValid())
                    {
                        this.EntityList.Add(local_284);
                    }
                    else
                    {
                        --this.TotalSpawnedEntityNumber;
                    }
                    ++local_2;
                }
            }
            local_173 = 0;
            for (; local_173 < int(local_24_2.NPCNum); ++local_173)
            {
                for (auto& local_58 : local_24_2.NPCConfigList)
                {
                    if (!(local_58.IsSet()))
                    {
                        continue;
                    }
                    FTransform local_200;
                    ::BlueprintFunctions_Level::Level_EcosimAIV2GetSlotWorldTransform(this.TeamEntity, local_2, local_172, local_200);
                    FVector local_300_2(local_200.GetLocation());
                    FVector local_218;
                    bool local_377 = UNavigationSystemV1::ProjectPointToNavigation(__GetWorldContext(), local_300_2, local_218, nullptr, TSubclassOf<UNavigationQueryFilter>(nullptr), FVector(1000.0, 1000.0, 1000.0));
                    if (local_377)
                    {
                        float local_222 = (local_218 - local_300_2).Size();
                        XLog(ELog(22), FString().Append("Xibei_NPC_PatrolTeam: NPC [").Append(local_22).Append("] Slot[").Append(local_2).Append("] NavProject OK, Projected=").Append(local_218).Append(", Dist=").Append(local_222).Append(" cm"));
                        FECSDebugDraw::DrawDebugSphere(n"XibeiPatrolTeam", local_218, 30.0f, 12, FColor::Blue, FColor::Blue, 20.0f, uint8(0), 0.0f);
                        FECSDebugDraw::DrawDebugString(n"XibeiPatrolTeam", (local_218 + FVector(0.0, 0.0, 150.0)), FString().Append("NavProj Dist=").Append(local_222).Append(" cm"), FColor::Blue, 1.0f, FColor(uint8(0), uint8(0), uint8(0), uint8(0)), 20.0f);
                        FECSDebugDraw::DrawDebugLine(n"XibeiPatrolTeam", local_300_2, local_218, FColor::Blue, FColor::Blue, 20.0f, uint8(0), 0.0f);
                        local_300_2 = local_218;
                    }
                    else
                    {
                        XLog(ELog(22), FString().Append("Xibei_NPC_PatrolTeam: NPC [").Append(local_22).Append("] Slot[").Append(local_2).Append("] NavProject FAILED, using original Loc=").Append(local_300_2));
                    }
                    FEntityCreateFinishDelegate local_248;
                    local_248 = FEntityCreateFinishDelegate(this, n"OnEntityCreateFinish");
                    FECSEntity local_256 = ::BlueprintFunctions_Ecology::BP_SpawnNPCInValidPos(local_58, local_300_2, FRotator(local_200.GetRotation()), local_248, 1000.0f, 50.0f, true, nullptr, local_24_2.SpawnInitEntryName);
                    this.SlotEntities.Add(local_256);
                    if (local_256.IsValid())
                    {
                        this.EntityList.Add(local_256);
                    }
                    else
                    {
                        --this.TotalSpawnedEntityNumber;
                    }
                    ++local_2;
                }
            }
        }
        FTransform local_200;
        if ((!((this.SelectedCartPrefab == nullptr))))
        {
            ::BlueprintFunctions_Level::Level_EcosimAIV2GetSlotWorldTransform(this.TeamEntity, local_2, local_172, local_200);
            FEntityCreateFinishDelegate local_248;
            local_248 = FEntityCreateFinishDelegate(this, n"OnCartEntityCreateFinish");
            FRotator local_262_2 = FRotator(local_200.GetRotation());
            FVector local_306 = local_200.GetLocation();
            this.CartEntity = local_284;
            this.SlotEntities.Add(this.CartEntity);
            if (this.CartEntity.IsValid())
            {
                this.EntityList.Add(this.CartEntity);
            }
            else
            {
                --this.TotalSpawnedEntityNumber;
            }
            ++local_2;
            XLog(ELog(22), FString().Append("Xibei_NPC_PatrolTeam: Cart prefab spawned, entity=").Append(this.CartEntity));
        }
        if (this.SelectedCartMountConfig.IsSet())
        {
            FVector local_306_2 = (FRotator(local_200.GetRotation()).GetForwardVector() * 200.0);
            FVector local_244_2 = (local_200.GetLocation() + local_306_2);
            FRotator local_262_3 = FRotator(local_200.GetRotation());
            FEntityCreateFinishDelegate local_248;
            local_248 = FEntityCreateFinishDelegate(this, n"OnCartMountEntityCreateFinish");
            local_390 = true;
            FECSEntityAdapter local_278_2 = FECSEntityAdapter();
            this.CartMountEntity = local_284;
            this.SlotEntities.Add(this.CartMountEntity);
            if (this.CartMountEntity.IsValid())
            {
                this.EntityList.Add(this.CartMountEntity);
            }
            else
            {
                --this.TotalSpawnedEntityNumber;
            }
            ++local_2;
            XLog(ELog(22), FString().Append("Xibei_NPC_PatrolTeam: CartMount spawned in front of Cart, entity=").Append(this.CartMountEntity).Append(", loc=").Append(local_244_2));
        }
        XLog(ELog(22), FString().Append("Xibei_NPC_PatrolTeam: CreateEntityBatch spawning ").Append(this.TotalSpawnedEntityNumber).Append(" entities at anchored slots"));
        if ((this.TotalSpawnedEntityNumber <= 0 && !(this.bTeamCreated)))
        {
            this.bTeamCreated = true;
            this.OnAllEntitiesCreated();
        }
        return;
    }
    UFUNCTION()
    void OnEntityCreateFinish(const FECSEntity &inout Entity)
    {
        ++this.CurrentSpawnedEntityNumber;
        XLog(ELog(22), FString().Append("Xibei_NPC_PatrolTeam: Entity created (").Append(this.CurrentSpawnedEntityNumber).Append("/").Append(this.TotalSpawnedEntityNumber).Append("), entity=").Append(Entity));
        if ((this.CurrentSpawnedEntityNumber >= this.TotalSpawnedEntityNumber && !(this.bTeamCreated)))
        {
            this.bTeamCreated = true;
            this.OnAllEntitiesCreated();
        }
        return;
    }
    UFUNCTION()
    void OnCartEntityCreateFinish(const FECSEntity &inout Entity)
    {
        this.CartEntity = Entity;
        if (!(this.CartCreatedEventName.IsNone()) && Entity.IsValid())
        {
            ::FLevelUtils::SendCustomLevelEvent(Entity, this.CartCreatedEventName);
            XLog(ELog(22), FString().Append("Xibei_NPC_PatrolTeam: Cart created, sent level event '").Append(this.CartCreatedEventName).Append("', entity=").Append(Entity));
        }
        this.OnEntityCreateFinish(Entity);
        return;
    }
    UFUNCTION()
    void OnCartMountEntityCreateFinish(const FECSEntity &inout Entity)
    {
        this.CartMountEntity = Entity;
        XLog(ELog(22), FString().Append("Xibei_NPC_PatrolTeam: CartMount created, entity=").Append(Entity));
        this.OnEntityCreateFinish(Entity);
        return;
    }
    void OnAllEntitiesCreated()
    {
        int local_1 = 0;
        for (; local_1 < this.SlotEntities.Num(); ++local_1)
        {
            if (this.SlotEntities[local_1].IsValid())
            {
                ::BlueprintFunctions_Level::Level_EcosimAIV2BindEntityToSlot(this.TeamEntity, local_1, this.SlotEntities[local_1]);
            }
        }
        XLog(ELog(22), FString().Append("Xibei_NPC_PatrolTeam: all members bound to slots, team=").Append(this.TeamEntity));
        if (this.CartEntity.IsValid() && this.CartMountEntity.IsValid() && this.CartMountInteractClass.IsValid())
        {
            ::BlueprintFunctions_Level::Level_TriggerInteractToTarget(this.CartMountEntity, this.CartEntity, this.CartMountInteractClass, 0, 0, false);
            XLog(ELog(22), FString().Append("Xibei_NPC_PatrolTeam: Triggered mountв†’cart interact, source=").Append(this.CartMountEntity).Append(", target=").Append(this.CartEntity));
        }
        if (this.NextPoint != nullptr)
        {
            FTransform local_36;
            local_36.SetLocation(this.NextPoint.GetActorLocation());
            local_36.SetRotation(FQuat(this.NextPoint.GetActorRotation()));
            ::BlueprintFunctions_Level::Level_EcosimAIV2SetTeamEntityTargetTransform(this.TeamEntity, local_36);
        }
        this.RegisterLevelEventCallback(n"OnPatrolActionEvent", FCE_EcosimAIV2ActionEvent, ENTITY_NULL);
        XLog(ELog(22), "Xibei_NPC_PatrolTeam: All entities joined team, patrol started");
        return;
    }
    UFUNCTION()
    void OnPatrolActionEvent(const FCE_EcosimAIV2ActionEvent &inout Event)
    {
        if (int(Event.ActionEventType) != 0)
        {
            return;
        }
        if (this.NextPoint == nullptr)
        {
            return;
        }
        this.NextPoint = ::BlueprintFunctions_Designer::GetPatrolConfigNextPoint(this.PatrolPointConfig, this.CurPatrolPointIndex);
        if (this.NextPoint != nullptr)
        {
            FTransform local_32;
            local_32.SetLocation(this.NextPoint.GetActorLocation());
            local_32.SetRotation(FQuat(this.NextPoint.GetActorRotation()));
            ::BlueprintFunctions_Level::Level_EcosimAIV2SetTeamEntityTargetTransform(this.TeamEntity, local_32);
            XLog(ELog(22), FString().Append("Xibei_NPC_PatrolTeam: Patrol reached target, next point index=").Append(this.CurPatrolPointIndex));
            return;
        }
        FTransform local_32;
        local_32.SetLocation(FVector::ZeroVector);
        local_32.SetRotation(FQuat::Identity);
        ::BlueprintFunctions_Level::Level_EcosimAIV2SetTeamEntityTargetTransform(this.TeamEntity, local_32);
        XLog(ELog(22), "Xibei_NPC_PatrolTeam: NextPoint is null, set team target to origin");
        return;
    }
}


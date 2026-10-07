
namespace BlueprintFunctions_AllyAssist
{
UFUNCTION()
bool AllyAssist_IsAllyAssistRule()
{
    return BlueprintFunctions_BossTracking::BossTracking_GetEntryRuleConfig().IsSet() && (0 == 5);
}
UFUNCTION()
void AllyAssist_FindSpawnPointsInAnnulus(const FVector &inout Center, const float32 MinRadius, const float32 MaxRadius, TArray<AAllySpawnPoint> &out Result)
{
    TArray<AAllySpawnPoint> local_4;
    Result = local_4;
    TArray<AAllySpawnPoint> local_8;
    GetAllActorsOfClass(local_8);
    float32 local_10 = MinRadius * MinRadius;
    float32 local_9 = MaxRadius * MaxRadius;
    for (auto local_28 : local_8)
    {
        if (local_28 == nullptr)
        {
            continue;
        }
        float32 local_11 = float32(((local_28.GetActorLocation() - Center).SizeSquared2D()));
        if ((local_11 >= local_10 && (local_11 <= local_9)))
        {
            Result.Add(local_28);
        }
    }
    return;
}
UFUNCTION()
bool AllyAssist_PickRandomSpawnPoint(const FVector &inout Center, const float32 MinRadius, const float32 MaxRadius, FVector &out SpawnLocation, FRotator &out SpawnRotation)
{
    FVector local_6;
    SpawnLocation = local_6;
    SpawnRotation = FRotator();
    TArray<AAllySpawnPoint> local_16 = TArray<AAllySpawnPoint>();
    BlueprintFunctions_AllyAssist::AllyAssist_FindSpawnPointsInAnnulus(Center, MinRadius, MaxRadius, local_16);
    if (local_16.Num() == 0)
    {
        return false;
    }
    AAllySpawnPoint local_22 = local_16[FMath::RandRange(0, (local_16.Num() - 1))];
    SpawnLocation = local_22.GetActorLocation();
    FVector local_42 = (Center - SpawnLocation).GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector);
    SpawnRotation = local_42.Rotation();
    return true;
}
UFUNCTION()
void AllyAssist_ActivateSpawnersInAnnulus(const FVector &inout Center, const float32 MinRadius, const float32 MaxRadius)
{
    int local_134 = 0;
    FECSRuntimeView local_40 = ECS::GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
    Include local_44;
    local_44.opCall();
    float32 local_46 = MinRadius * MinRadius;
    float32 local_45 = MaxRadius * MaxRadius;
    int local_48 = 0;
    FECSEntity local_54;
    float32 local_55 = 3.4028235e38f;
    FECSRuntimeViewIterator local_90 = local_40.Iterator();
    for (; local_90.CanProceed;)
    {
        const FECSEntity& local_128 = local_90.Proceed();
        if (!(local_134))
        {
            continue;
        }
        float32 local_47 = float32(((FVector(local_134.GetPosition()) - Center).SizeSquared2D()));
        if (local_47 < local_55)
        {
            local_55 = local_47;
            local_54 = local_128;
        }
        bool local_125 = (local_47 >= local_46) && (local_47 <= local_45);
        local_128.SetActive(local_125, FFPTime(-1));
        if (local_125)
        {
            ++local_48;
        }
    }
    if (local_48 == 0 && local_54.IsValid())
    {
        local_54.SetActive(true, FFPTime(-1));
    }
    return;
}
UFUNCTION()
void AllyAssist_SpawnAllies(const FECSEntity &inout BossEntity, const TDataObjectPtr<FMonsterMainConfig> &inout NPCConfig, const int Count, const float32 MinRadius, const float32 MaxRadius, TArray<FECSEntity> &out SpawnedNPCs)
{
    bool local_19;
    TArray<FECSEntity> local_4;
    SpawnedNPCs = local_4;
    if (!(ECS::GetRuntimeInfo().IsServer) || !(BossEntity.IsValid()))
    {
        return;
    }
    GetDefaulted local_16;
    FVector local_12 = local_16.opCall().GetPosition();
    int local_17 = 0;
    for (; local_17 < Count; ++local_17)
    {
        local_19 = false;
        FVector local_36 = BlueprintFunctions_Common::FindRandomReachablePointInRadius(local_19, BossEntity, local_12, MinRadius, MaxRadius, -500.0f, 500.0f, 15);
        if (!(local_19))
        {
            XWarning(ELog(22), FString().Append("AllyAssist: failed to find valid spawn pos for NPC #").Append(local_17));
            continue;
        }
        FECSEntity local_72 = BlueprintFunctions_Ecology::SpawnMonsterByMonsterId(NPCConfig, local_36, FRotator(0.0, FMath::RandRange(0.0f, 360.0f), 0.0).Quaternion(), nullptr, NAME_None, false);
        if (local_72.IsValid())
        {
            SpawnedNPCs.Add(local_72);
            XLog(ELog(22), FString().Append("AllyAssist: spawned NPC #").Append(local_17).Append(" at ").Append(local_36));
        }
    }
    return;
}
UFUNCTION()
void AllyAssist_ForceAlliesAttackTarget(const TArray<FECSEntity> &inout AllyNPCs, const FECSEntity &inout TargetEntity)
{
    for (auto& local_16 : AllyNPCs)
    {
        if (local_16.IsValid() && TargetEntity.IsValid())
        {
            BlueprintFunctions_Level::Level_EntityForceOnlyCombatWithTarget(FECSEntityAdapter(local_16), TargetEntity);
        }
    }
    return;
}
UFUNCTION()
void AllyAssist_ClearAlliesForceTarget(const TArray<FECSEntity> &inout AllyNPCs)
{
    for (auto& local_16 : AllyNPCs)
    {
        if (local_16.IsValid())
        {
            BlueprintFunctions_Level::Level_ClearEntityForceOnlyCombatWithTarget(FECSEntityAdapter(local_16));
        }
    }
    return;
}
UFUNCTION()
void AllyAssist_DestroyAllAllies(const TArray<FECSEntity> &inout AllyNPCs)
{
    Has local_20;
    for (auto& local_16 : AllyNPCs)
    {
        if (local_16.IsValid() && !(local_20.opCall()))
        {
            FLifeCycleUtils::EntityDestroyDirectly(local_16, ECS::GetECSWorld().GetFixedTime().Time);
        }
    }
    return;
}
UFUNCTION()
void AllyAssist_GetAlivePlayerPawns(TArray<FECSEntity> &out PlayerPawns)
{
    TArray<FECSEntity> local_4;
    PlayerPawns = local_4;
    FECSRuntimeView local_44 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
    Include local_48;
    local_48.opCall();
    Exclude(local_44).opCall();
    FECSRuntimeViewIterator local_86 = local_44.Iterator();
    for (; local_86.CanProceed;)
    {
        PlayerPawns.Add(FECSEntity(local_86.Proceed()));
    }
    return;
}
UFUNCTION()
void AllyAssist_TeleportEntityToLocation(const FECSEntity &inout Entity, const FVector &inout Location, const FRotator &inout Rotation, const bool bSetCameraRotation = true, const bool bTeleportCamera = true)
{
    if (!(ECS::GetRuntimeInfo().IsServer) || !(Entity.IsValid()))
    {
        return;
    }
    BlueprintFunctions_Common::TeleportEntityToLocation(FECSEntityAdapter(Entity), Location, Rotation, bSetCameraRotation, Rotation, bTeleportCamera, true, ELoadingScreenAction(0), true);
    XLog(ELog(22), FString().Append("AllyAssist: teleported entity to ").Append(Location));
    return;
}
UFUNCTION()
void AllyAssist_TeleportPlayersNearBoss(const FECSEntity &inout BossEntity, const float32 SpawnPointMinRadius, const float32 SpawnPointMaxRadius)
{
    if (!(ECS::GetRuntimeInfo().IsServer) || !(BossEntity.IsValid()))
    {
        return;
    }
    GetDefaulted local_12;
    FVector local_8 = local_12.opCall().GetPosition();
    FVector local_18;
    FRotator local_24;
    if (!(BlueprintFunctions_AllyAssist::AllyAssist_PickRandomSpawnPoint(local_8, SpawnPointMinRadius, SpawnPointMaxRadius, local_18, local_24)))
    {
        XWarning(ELog(22), "AllyAssist: no spawn point in range, skipping teleport");
        return;
    }
    TArray<FECSEntity> local_30;
    BlueprintFunctions_AllyAssist::AllyAssist_GetAlivePlayerPawns(local_30);
    for (auto& local_44 : local_30)
    {
        BlueprintFunctions_AllyAssist::AllyAssist_TeleportEntityToLocation(local_44, local_18, local_24, true, true);
    }
    return;
}
UFUNCTION()
void AllyAssist_ActivateSpawnersNearBoss(const FECSEntity &inout BossEntity, const float32 SpawnPointMinRadius, const float32 SpawnPointMaxRadius)
{
    if (!(ECS::GetRuntimeInfo().IsServer) || !(BossEntity.IsValid()))
    {
        return;
    }
    GetDefaulted local_12;
    BlueprintFunctions_AllyAssist::AllyAssist_ActivateSpawnersInAnnulus(FVector(local_12.opCall().GetPosition()), SpawnPointMinRadius, SpawnPointMaxRadius);
    return;
}
}

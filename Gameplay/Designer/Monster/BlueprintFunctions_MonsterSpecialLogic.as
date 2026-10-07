
namespace BlueprintFunctions_MonsterSpecialLogic
{
UFUNCTION()
TArray<FECSEntity> SpawnProjectileInArea(const FECSEntityAdapter &inout OwnerEntity, const FFireProjectileConfig &inout Config, const FVector &inout CenterWorldPos, const float32 Radius = 500.0f, const float32 HeightOffset = 1000.0f, const int SpawnCount = 1, const bool bEnableJitter = true, const float32 MaxJitterAngle = 5.0f, const FFPTime &inout LifeTimeOverride = -1, const FVector2D &inout SimpleVelocityOverrideRange = FVector2D(0.0f,0.0f), const TSoftClassPtr<AFXActor> &inout WarningFXAsset = TSoftClassPtr<AFXActor>(), const float32 WarningFXGroundTraceExtraDepth = 500.0f, const float32 WarningFXHeightFromGround = 0.0f)
{
    FCE_CharacterFireProjectile local_94;
    TArray<FECSEntity> local_4;
    int local_116 = 0;
    if (!(OwnerEntity.IsValid()) || (SpawnCount <= 0) || (Radius <= 0.0f))
    {
        return local_4;
    }
    FECSEntity local_16 = OwnerEntity.opImplConv();
    bool local_7 = !(WarningFXAsset.IsNull());
    if (local_7)
    {
        FPreloadAssetUtils::LoadFXActor(WarningFXAsset);
    }
    if (!(ECS::GetRuntimeInfo().IsClient))
    {
        local_7 = false;
    }
    else
    {
        Has local_20;
        local_7 = !(Config.bLocalPrediction) || !(local_20.opCall());
    }
    if (local_7)
    {
        return local_4;
    }
    FECSWorldPtr local_26 = local_16.GetWorld();
    Get local_30;
    FFPTime local_24 = FFPTime(local_30.opCall().Time);
    FVector2D local_44 = FVector2D(0.5, 0.5);
    int local_45 = 0;
    for (; local_45 < SpawnCount; ++local_45)
    {
        FVector2D local_40 = ImportanceSampling::NextSobolCell2D(((int((local_24.ToSeconds() * 1000.0))) * SpawnCount) + local_45, 1, local_44);
        local_44 = local_40;
        float local_34_2 = local_40.X;
        FVector2D local_50 = FFireProjectileInAreaUtils::ConcentricDiskMapping(local_34_2, local_40.Y);
        FVector2D local_60 = (local_50 * Radius);
        local_34_2 = CenterWorldPos.Z;
        local_34_2 = local_34_2 + HeightOffset;
        FVector local_76 = FVector((CenterWorldPos.X + local_60.X), (CenterWorldPos.Y + local_60.Y), local_34_2);
        float32 local_77 = 0.0f;
        float32 local_78 = 0.0f;
        if (bEnableJitter && (MaxJitterAngle > 0.0f))
        {
            local_78 = FMath::FRand() * 360.0f;
            local_77 = FMath::FRand() * MaxJitterAngle;
        }
        FRotator3f local_85 = FRotator3f(local_77 + -90.0f, local_78, 0.0f);
        if (FProjectileUtils::SpawnProjectileEvent(local_16, local_24, Config, LifeTimeOverride) < 0)
        {
            continue;
        }
        FECSWorldPtr local_26_2 = local_16.GetWorld();
        FECSWorldPtr::PatchEvent(local_26_2);
        FFireProjectileData local_96 = local_94.FireConfig;
        local_96.SetPositionOffset(local_76);
        local_96.SetSpawnPositionOffsetType(EProjectileSpawnPositionOffsetType(3));
        local_96.SetSpawnRotationType(EProjectileSpawnRotationType(2));
        local_96.SetRotationOffset(local_85);
        if (SimpleVelocityOverrideRange.X > 0.0)
        {
            local_34_2 = FMath::Lerp(SimpleVelocityOverrideRange.X, SimpleVelocityOverrideRange.Y, FMath::FRand());
            float32 local_79 = float32(local_34_2);
            FSimpleProjectileMovementConfigData local_104;
            local_104.SetInitSpeed(local_79);
            local_116.SetData(local_104);
        }
        bool local_5 = !(ECS::GetRuntimeInfo().IsClient);
        if (local_5 && !(WarningFXAsset.IsNull()))
        {
            FFXConfig local_232;
            local_232.SetAsset(FSoftClassPath(WarningFXAsset.ToString()));
            local_232.SetbDetach(true);
            local_232.SetbUseWorldOriginAsBaseTransformSource(true);
            local_232.SetLocationOffset(local_76);
            local_232.SetLocationOffsetSpace(EFXOffsetSpace(2));
            FSpawnOnGroundConfig local_260;
            local_260.SetbSpawnOnGround(true);
            local_260.SetMaxTraceDownDist(HeightOffset + WarningFXGroundTraceExtraDepth);
            local_260.SetHeightFromGround(WarningFXHeightFromGround);
            local_232.SetSpawnOnGroundConfig(local_260);
            ECSFX::PlayFXInstant(local_16, local_232, local_24, 1.0f, true, false);
        }
        local_4.Add(local_94.ProjectileEntity);
    }
    return local_4;
}
bool IsNavReachableFromEntityToPos(const FECSEntity &inout CheckEntity, const FVector &inout TargetPos, const bool bDebugDraw, const float32 DebugLifeTime)
{
    int local_6 = 0;
    if (!(local_6))
    {
        return false;
    }
    FVector local_14 = local_6.GetPosition();
    local_14.Z -= (FCollisionUtils::GetCollisionHeight(CheckEntity) * 0.5f);
    bool local_7 = FAINavigationUtils::IsDirectlyReachable(CheckEntity, local_14, TargetPos);
    if (bDebugDraw)
    {
        if (local_7)
        {
        }
        else
        {
        }
        DebugDraw::DrawDebugLine(ECS::GetUEWorld(), local_14, TargetPos);
    }
    return local_7;
}
UFUNCTION()
FECSEntity BP_SpawnPropInValidPosWithFlatCheck(const FECSEntityAdapter &inout Entity, const TSoftClassPtr<APropPrefabBase> &inout SoftPrefab, const FVector &inout Location, const FRotator &inout Rotation, const FEntityCreateFinishDelegate &inout OnCreateFinish, const float32 MaxNearbyRadius = 500.f, const float32 StepLength = 50.f, const float32 RetryStepLength = 200.f, const bool bSpawnEvenNoValidPos = true, const bool bSpawnEvenFlatCheckFailed = true, const bool bSpawnOnGround = false, const float32 SpawnOnGroundMaxTraceDownDist = 1000.f, const float32 SpawnOnGroundHeightFromGround = 50.f, const bool bCheckFlatTerrain = false, const float32 FlatTerrainRadius = 1000.f, const float32 FlatTerrainMaxHeight = 100.f, const int FlatTerrainMaxRetries = 5, const bool bDebugDraw = false, const TSoftClassPtr<AKLLevelPrefabBase> &inout ExclusionPrefab = TSoftClassPtr<AKLLevelPrefabBase>(), const float32 ExclusionRadius = 0.f, const bool bCheckNavReachableFromEntity = false)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    FECSEntity __r; return __r;
}
}

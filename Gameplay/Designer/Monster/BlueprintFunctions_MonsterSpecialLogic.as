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
    UClass local_78;
    int local_86;
    bool local_115;
    bool local_195;
    int local_272 = 0;
    Get local_454;
    FECSEntity __return;
    bool local_2 = !(false);
    if (!(Entity.IsValid()) == local_2)
    {
        XError(ELog(0), FString().Append("Failed to BP_SpawnPropInValidPosWithFlatCheck, Entity not Valid"));
        return FECSEntity();
    }
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return FECSEntity();
    }
    UObject local_24 = SoftPrefab.ToSoftObjectPath().TryLoad();
    if (local_24 == nullptr)
    {
        XError(ELog(0), FString().Append("Failed to BP_SpawnPropInValidPosWithFlatCheck, Prefab not Valid"));
        return FECSEntity();
    }
    FECSEntity local_12 = Entity.opImplConv();
    FCollisionQueryParams local_66;
    local_66.bTraceComplex = false;
    local_66.AddIgnoredEntityId(Entity.GetEntity().GetId().GetIdValue());
    int local_71 = int(FPhysicsUtils::ConvertToCollisionChannel(ETraceTypeQuery(5)));
    float32 local_72 = 500.0f;
    float32 local_74 = 15.0f;
    bool local_1 = !(ExclusionPrefab.IsNull()) && (ExclusionRadius > 0.0f);
    if (local_1)
    {
        ExclusionPrefab.ToSoftObjectPath().TryLoad();
        local_78 = ExclusionPrefab.Get();
    }
    if (bCheckFlatTerrain || local_1)
    {
        local_86 = FlatTerrainMaxRetries + 1;
    }
    else
    {
        local_86 = 1;
    }
    bool local_75 = false;
    bool local_87 = local_75;
    FVector local_94 = Location;
    int local_95 = 0;
    FECSEntity local_462;
    for (; local_95 < local_86; ++local_95)
    {
        FVector local_102 = Location;
        if (local_95 > 0)
        {
            float32 local_73 = (local_95 - 1);
            local_73 = local_73 / 4.0f;
            local_73 = ((local_95 - 1) % 4);
            local_73 = local_73 * 90.0f;
            float32 local_104 = FMath::DegreesToRadians(local_73);
            local_73 = (uint(local_73) + 1);
            float32 local_108 = local_73 * RetryStepLength;
            local_73 = FMath::Cos(local_104);
            float32 local_109 = local_73 * local_108;
            local_102.X += local_109;
            local_73 = FMath::Sin(local_104);
            local_109 = local_73 * local_108;
            local_102.Y += local_109;
        }
        local_115 = false;
        FVector local_142 = FASCommonUtils::FindLegalLocationByPrefab(local_115, Entity.opImplConv(), SoftPrefab.Get().GetDefaultObject(), local_102, Rotation.Quaternion(), MaxNearbyRadius, StepLength, 8, true);
        if (!(local_115) && !(bSpawnEvenNoValidPos))
        {
            continue;
        }
        if (bDebugDraw)
        {
            DebugDraw::DrawDebugSphere(ECS::GetUEWorld(), local_142, 30.0f, 8, FColor::Blue, false, local_74, uint8(0), 0.0f);
        }
        if (local_1 && (local_78 != nullptr))
        {
            FECSRuntimeView local_186 = local_12.GetWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
            Include local_190;
            local_190.opCall();
            Include local_194;
            local_194.opCall();
            local_195 = false;
            FECSRuntimeViewIterator local_230 = local_186.Iterator();
            for (; local_230.CanProceed;)
            {
                local_230.Proceed();
                if (!(local_272.PrefabClass.opArrow().IsChildOf(local_78)))
                {
                    continue;
                }
                Get local_282;
                float32 local_109_2 = float32(FVector(local_282.opCall().GetPosition()).Dist2D(local_142));
                if (local_109_2 < ExclusionRadius)
                {
                    XLog(ELog(4), FString().Append("BP_SpawnPropInValidPosWithFlatCheck exclusion check: found nearby exclusion prop at dist ").Append(local_109_2).Append(" < ").Append(ExclusionRadius).Append(", retry ").Append(local_95));
                    if (bDebugDraw)
                    {
                        DebugDraw::DrawDebugSphere(ECS::GetUEWorld(), local_142, 40.0f, 8, FColor(uint8(180), uint8(0), uint8(255), uint8(255)), false, local_74, uint8(0), 0.0f);
                    }
                    local_195 = true;
                    break;
                }
            }
            if (local_195)
            {
                continue;
            }
        }
        if (bCheckFlatTerrain)
        {
            bool local_376;
            if (bSpawnEvenFlatCheckFailed && !(local_87))
            {
                local_87 = true;
                local_94 = local_142;
            }
            FHitResult local_354;
            FHitResult local_446;
            FCollisionResponseParams local_374;
            FVector local_360 = (FVector(FVector::UpVector) * SpawnOnGroundMaxTraceDownDist);
            FVector local_122 = (local_142 - local_360);
            float local_114_3 = local_72;
            FVector local_366 = (FVector(FVector::UpVector) * local_114_3);
            bool local_83 = FPhysicsUtils::LineTraceSingle(local_12, false, EPhysicsTraceTag(38), local_354, (local_142 + local_366), local_122, ECollisionChannel(local_71), local_66, local_374);
            if (!(local_83))
            {
                XLog(ELog(4), FString().Append("BP_SpawnPropInValidPosWithFlatCheck flat check: center ground trace failed at ").Append(local_142).Append(", retry ").Append(local_95));
                continue;
            }
            float32 local_108_2 = float32(local_354.Location.Z);
            local_376 = true;
            int local_85_2 = 0;
            for (; local_85_2 < 4; ++local_85_2)
            {
                float32 local_73_2 = FMath::DegreesToRadians((local_85_2 * 90.0f));
                float local_112_2 = local_142.Y;
                float32 local_109_3 = FMath::Sin(local_73_2);
                local_112_2 = local_112_2 + (local_109_3 * FlatTerrainRadius);
                local_114_3 = local_142.X;
                local_109_3 = FMath::Cos(local_73_2) * FlatTerrainRadius;
                local_114_3 = local_114_3 + local_109_3;
                local_366 = FVector(local_114_3, local_112_2, local_142.Z);
                local_360 = (local_366 - (FVector(FVector::UpVector) * SpawnOnGroundMaxTraceDownDist));
                local_195 = FPhysicsUtils::LineTraceSingle(local_12, false, EPhysicsTraceTag(38), local_446, (local_366 + (FVector(FVector::UpVector) * local_72)), local_360, ECollisionChannel(local_71), local_66, local_374);
                if (!(local_195))
                {
                    XLog(ELog(4), FString().Append("BP_SpawnPropInValidPosWithFlatCheck flat check: dir ").Append(local_85_2).Append(" no ground hit, retry ").Append(local_95));
                    if (bDebugDraw)
                    {
                        DebugDraw::DrawDebugPoint(ECS::GetUEWorld(), local_366, 15.0f, FColor::Red, false, local_74, uint8(0));
                    }
                    local_376 = false;
                    break;
                }
                local_112_2 = local_108_2;
                local_112_2 = FMath::Abs(local_446.Location.Z - local_112_2);
                local_109_3 = float32(local_112_2);
                if (local_109_3 > FlatTerrainMaxHeight)
                {
                    XLog(ELog(4), FString().Append("BP_SpawnPropInValidPosWithFlatCheck flat check: dir ").Append(local_85_2).Append(" heightDiff ").Append(local_109_3).Append(" > ").Append(FlatTerrainMaxHeight).Append(", retry ").Append(local_95));
                    if (bDebugDraw)
                    {
                        DebugDraw::DrawDebugPoint(ECS::GetUEWorld(), local_446.Location, 15.0f, FColor::Red, false, local_74, uint8(0));
                    }
                    local_376 = false;
                    break;
                }
                if (bDebugDraw)
                {
                    DebugDraw::DrawDebugPoint(ECS::GetUEWorld(), local_446.Location, 15.0f, FColor::Green, false, local_74, uint8(0));
                }
            }
            if (!(local_376))
            {
                continue;
            }
        }
        if (bSpawnOnGround)
        {
            FHitResult local_446;
            FCollisionResponseParams local_374;
            FVector local_278_2 = FVector(FVector::UpVector);
            FVector local_122_2 = (local_278_2 * SpawnOnGroundMaxTraceDownDist);
            bool local_447 = FPhysicsUtils::LineTraceSingle(local_12, false, EPhysicsTraceTag(38), local_446, local_142, (local_142 - local_122_2), ECollisionChannel(local_71), local_66, local_374);
            if (local_447)
            {
                XLog(ELog(4), FString().Append("BP_SpawnPropInValidPosWithFlatCheck SpawnOnGround hit at ").Append(local_446.Location).Append(", adjusted Z from ").Append(local_142.Z).Append(" to ").Append((local_446.Location.Z + SpawnOnGroundHeightFromGround)));
                local_142.Z = (local_446.Location.Z + SpawnOnGroundHeightFromGround);
            }
            else
            {
                XLog(ELog(4), FString().Append("BP_SpawnPropInValidPosWithFlatCheck SpawnOnGround trace failed from ").Append(local_142).Append(" downward ").Append(SpawnOnGroundMaxTraceDownDist).Append(", skip spawn"));
                return FECSEntity();
            }
        }
        if (bCheckNavReachableFromEntity && !(BlueprintFunctions_MonsterSpecialLogic::IsNavReachableFromEntityToPos(local_12, local_142, bDebugDraw, local_74)))
        {
            XLog(ELog(4), FString().Append("BP_SpawnPropInValidPosWithFlatCheck nav check: final pos ").Append(local_142).Append(" not navmesh-reachable from entity, skip spawn"));
            return FECSEntity();
        }
        if (bDebugDraw)
        {
            DebugDraw::DrawDebugSphere(ECS::GetUEWorld(), local_142, 50.0f, 12, FColor::Yellow, false, local_74, uint8(0), 0.0f);
        }
        FECSWorldPtr local_166 = local_12.GetWorld();
        FFPTime local_450 = FFPTime(local_454.opCall().Time);
        local_462 = PropUtils::SpawnPropByPrefabNew(Entity.opImplConv(), SoftPrefab.Get(), local_450, local_142, Rotation, NAME_None);
        if (OnCreateFinish.IsBound())
        {
            ULevelEventManager::Get().RegisterEntityEntityCreateFinishCallback(local_462, OnCreateFinish);
        }
        return local_462;
    }
    local_75 = bCheckFlatTerrain && bSpawnEvenFlatCheckFailed;
    if (local_75 && local_87)
    {
        FVector local_366_2 = local_94;
        XLog(ELog(4), FString().Append("BP_SpawnPropInValidPosWithFlatCheck: all ").Append(local_86).Append(" candidates failed flat terrain check, force spawn at ").Append(local_366_2));
        if (bSpawnOnGround)
        {
            FHitResult local_446;
            FCollisionResponseParams local_374;
            FVector local_122_3 = (FVector(FVector::UpVector) * SpawnOnGroundMaxTraceDownDist);
            bool local_75_2 = FPhysicsUtils::LineTraceSingle(local_12, false, EPhysicsTraceTag(38), local_446, local_366_2, (local_366_2 - local_122_3), ECollisionChannel(local_71), local_66, local_374);
            if (local_75_2)
            {
                float local_112_3 = local_446.Location.Z + SpawnOnGroundHeightFromGround;
                XLog(ELog(4), FString().Append("BP_SpawnPropInValidPosWithFlatCheck SpawnOnGround hit at ").Append(local_446.Location).Append(", adjusted Z from ").Append(local_366_2.Z).Append(" to ").Append(local_112_3));
                local_112_3 = SpawnOnGroundHeightFromGround;
                local_366_2.Z = (local_446.Location.Z + local_112_3);
            }
            else
            {
                XLog(ELog(4), FString().Append("BP_SpawnPropInValidPosWithFlatCheck SpawnOnGround trace failed from ").Append(local_366_2).Append(" downward ").Append(SpawnOnGroundMaxTraceDownDist).Append(", skip spawn"));
                __return = FECSEntity();
            }
        }
        if (bCheckNavReachableFromEntity && !(BlueprintFunctions_MonsterSpecialLogic::IsNavReachableFromEntityToPos(local_12, local_366_2, bDebugDraw, local_74)))
        {
            XLog(ELog(4), FString().Append("BP_SpawnPropInValidPosWithFlatCheck nav check: fallback pos ").Append(local_366_2).Append(" not navmesh-reachable from entity, skip spawn"));
            return FECSEntity();
        }
        if (bDebugDraw)
        {
            DebugDraw::DrawDebugSphere(ECS::GetUEWorld(), local_366_2, 50.0f, 12, FColor::Yellow, false, local_74, uint8(0), 0.0f);
        }
        FECSWorldPtr local_166_2 = local_12.GetWorld();
        FFPTime local_450_2 = FFPTime(local_454.opCall().Time);
        FECSEntity local_28 = PropUtils::SpawnPropByPrefabNew(Entity.opImplConv(), SoftPrefab.Get(), local_450_2, local_366_2, Rotation, NAME_None);
        if (OnCreateFinish.IsBound())
        {
            ULevelEventManager::Get().RegisterEntityEntityCreateFinishCallback(local_28, OnCreateFinish);
        }
        __return = local_28;
    }
    else
    {
        XLog(ELog(4), FString().Append("BP_SpawnPropInValidPosWithFlatCheck: all ").Append(local_86).Append(" candidates failed (flat terrain / exclusion) check, skip spawn"));
        __return = local_462;
    }
    return __return;
}
}

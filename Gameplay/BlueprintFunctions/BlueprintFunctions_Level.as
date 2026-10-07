
namespace BlueprintFunctions_Level
{
enum EDistanceCompareType
{
    LessThanOrEqual,
    GreaterThanOrEqual,
}

enum EPlayersFilterType
{
    All,
    Any,
}

FFPTime GetWorldTime(const FECSEntity &inout ContextEntity)
{
    return BlueprintFunctions_Common::GetWorldTime(ContextEntity);
}
UFUNCTION()
float32 Level_RandomRange(const float32 Min, const float32 Max)
{
    return FMath::RandRange(Min, Max);
}
UFUNCTION()
void Level_StartCameraModifier(const FECSEntity &inout Entity, const FTPCameraModifierConfigRef &inout ModifierConfig, const float32 Duration = -1.f)
{
    Entity.IsValid();
    ModifierConfig.IsValid();
    FCameraUtils::StartModifier(Entity, ECS::GetContextTime(), n"LevelDesign", ModifierConfig, -1.0f);
    if (Duration > 0.0f)
    {
        FCameraUtils::StopModifier(Entity, (ECS::GetContextTime() + FFPTime(Duration)), n"LevelDesign", ModifierConfig, -1.0f, false);
    }
    return;
}
UFUNCTION()
void Level_StopCameraModifier(const FECSEntity &inout Entity, const FTPCameraModifierConfigRef &inout ModifierConfig, const bool bWarnIfNotExists = true)
{
    Entity.IsValid();
    ModifierConfig.IsValid();
    FCameraUtils::StopModifier(Entity, ECS::GetContextTime(), n"LevelDesign", ModifierConfig, -1.0f, bWarnIfNotExists);
    return;
}
UFUNCTION()
FVector2D Level_RandomDirection2D()
{
    float32 local_10 = FMath::DegreesToRadians(float32((FMath::RandRange(0.0, 360.0))));
    return FVector2D(FMath::Cos(local_10), FMath::Sin(local_10));
}
UFUNCTION()
FVector GetFixedPosition(const FVector &inout Location, const AActor Actor, const FECSEntity &inout Entity)
{
    if ((!((Location == FVector::ZeroVector))))
    {
        return Location;
    }
    if (Actor != nullptr)
    {
        return Actor.GetActorLocation();
    }
    if ((!((Entity == ENTITY_NULL))))
    {
        Get local_12;
        return local_12.opCall().GetPosition();
    }
    return FVector::ZeroVector;
}
UFUNCTION()
void Level_GetIntrusionSpawnCandidateCombatRegions(const FVector &inout WorldLocation, const float32 Radius, TArray<AECSCombatRegionVolume> &out CombatRegions)
{
    AECSCombatRegionVolume local_34;
    TArray<AECSCombatRegionVolume> local_4;
    CombatRegions = local_4;
    CombatRegions.Reset(0);
    if (Radius <= 0.0f)
    {
        return;
    }
    ULevelActorManager local_10 = ULevelActorManager::Get();
    if (local_10 == nullptr)
    {
        return;
    }
    float local_14 = (Radius * Radius);
    const TArray<AECSRegionVolumeBase>& local_18 = local_10.GetRegionVolumes();
    for (auto local_32 : local_18)
    {
        local_34 = Cast<AECSCombatRegionVolume>(local_32);
        if ((local_34 == nullptr || !(local_34.bAffectCombat)))
        {
            continue;
        }
        FVector local_90;
        if (local_34.GetRootComponent() != nullptr)
        {
            local_90 = local_34.GetRootComponent().GetWorldTransform().GetLocation();
        }
        else
        {
            local_90 = local_34.GetActorLocation();
        }
        if (local_90.DistSquared2D(WorldLocation) < local_14)
        {
            CombatRegions.Add(local_34);
        }
    }
    return;
}
bool Level_IsIntrusionPointInsideCombatRegionXY(const AECSCombatRegionVolume CombatRegion, const FVector &inout Point)
{
    if (CombatRegion == nullptr)
    {
        return false;
    }
    FBox local_46 = CombatRegion.GetVolumeBoundsWithCache().GetBox();
    if (!(local_46.IsValid) || !(local_46.IsInsideXY(Point)))
    {
        return false;
    }
    return CombatRegion.QuickEncompassesPoint(FVector(Point.X, Point.Y, local_46.GetCenter().Z));
}
bool Level_TryProjectIntrusionSpawnCandidateToNav(const AECSCombatRegionVolume CombatRegion, const FVector &inout CandidateLocation, const FVector &inout NavQueryExtent, FVector &out OutNavLocation)
{
    FVector local_6;
    OutNavLocation = local_6;
    if (!(BlueprintFunctions_Level::Level_IsIntrusionPointInsideCombatRegionXY(CombatRegion, CandidateLocation)))
    {
        return false;
    }
    FBox local_50 = CombatRegion.GetVolumeBoundsWithCache().GetBox();
    FVector local_68 = FVector(CandidateLocation.X, CandidateLocation.Y, local_50.GetCenter().Z);
    FVector local_80 = NavQueryExtent;
    float local_74_2 = local_50.GetExtent().Z + 100.0;
    local_80.Z = FMath::Max(local_80.Z, local_74_2);
    FVector local_86;
    if (!(UNavigationSystemV1::ProjectPointToNavigation(__GetWorldContext(), local_68, local_86, nullptr, TSubclassOf<UNavigationQueryFilter>(nullptr), local_80)))
    {
        return false;
    }
    if (!(BlueprintFunctions_Level::Level_IsIntrusionPointInsideCombatRegionXY(CombatRegion, local_86)))
    {
        return false;
    }
    OutNavLocation = local_86;
    return true;
}
UFUNCTION()
bool Level_FindIntrusionSpawnNavLocationInCombatRegion(const AECSCombatRegionVolume CombatRegion, FVector &out SpawnLocation, const float32 StepLength = 300.0f, const int DirectionsPerRing = 12, const int MaxCandidateChecks = 96, const FVector &inout NavQueryExtent = FVector(100.0f,100.0f,8000.0f))
{
    FVector local_6;
    SpawnLocation = local_6;
    SpawnLocation = FVector::ZeroVector;
    if (CombatRegion == nullptr)
    {
        return false;
    }
    FBox local_52 = CombatRegion.GetVolumeBoundsWithCache().GetBox();
    bool local_9 = !(local_52.IsValid);
    if (local_9)
    {
        return false;
    }
    FVector local_106;
    if (CombatRegion.GetRootComponent() != nullptr)
    {
        local_106 = CombatRegion.GetRootComponent().GetWorldTransform().GetLocation();
    }
    else
    {
        local_106 = CombatRegion.GetActorLocation();
    }
    if (BlueprintFunctions_Level::Level_TryProjectIntrusionSpawnCandidateToNav(CombatRegion, local_106, NavQueryExtent, SpawnLocation))
    {
        return true;
    }
    float32 local_109 = FMath::Max(StepLength, 1.0f);
    int local_112 = FMath::Max(DirectionsPerRing, 1);
    int local_110 = FMath::Max(MaxCandidateChecks, 1);
    float local_118_2 = FMath::Max(FMath::Abs((local_106.X - local_52.Min.X)), (FMath::Abs((local_52.Max.X - local_106.X))));
    float local_120_2 = FMath::Max(FMath::Abs((local_106.Y - local_52.Min.Y)), (FMath::Abs(local_52.Max.Y - local_106.Y)));
    float32 local_108 = float32((FMath::Sqrt((local_118_2 * local_118_2) + (local_120_2 * local_120_2))));
    float32 local_107 = local_108 + local_109;
    int local_126 = 1;
    float32 local_127 = local_109;
    float32 local_125 = FMath::DegreesToRadians(float32((FMath::RandRange(0.0, 360.0))));
    int local_130 = 0;
    for (; (int(local_130) < int(local_112)) && (int(local_126) < int(local_110)); ++local_130)
    {
        float32 local_108_2 = (local_130 * 2.0f) * 3.1415927f;
        float32 local_132 = local_112;
        local_132 = local_125 + (local_108_2 / local_132);
        FVector local_100 = (local_106 + FVector((FMath::Cos(local_132) * local_127), (FMath::Sin(local_132) * local_127), 0.0));
        ++local_126;
        if (BlueprintFunctions_Level::Level_TryProjectIntrusionSpawnCandidateToNav(CombatRegion, local_100, NavQueryExtent, SpawnLocation))
        {
            return true;
        }
    }
    while (local_9)
    {
        local_127 = local_127 + local_109;
        if (local_127 > local_107)
        {
            local_9 = false;
            continue;
        }
        local_9 = (local_126 < local_110);
    }
    return false;
}
UFUNCTION()
FECSEntity IDToEntity(const FECSEntityId &inout EntityID)
{
    return FECSEntity(EntityID);
}
UFUNCTION()
void GetAllMonsterInRange(TArray<FECSEntity> &inout AllEntities, const FVector &inout Location, const float32 Range, const bool bIncludeDeath = false, const bool bOnlyBoss = false)
{
    AllEntities.Reset(0);
    FECSWorldPtr local_6 = ECS::GetECSWorld();
    FECSEntity local_10 = FECSEntity(ENTITY_ID_NULL);
    FECSRuntimeQuery local_52 = FECSRuntimeQueryHelper::RuntimeQueryInSphere(local_10, Location, Range, EECSQueryRegsitryType(3), false);
    Include local_96;
    local_96.opCall();
    if (!(bIncludeDeath))
    {
        Exclude(local_52).opCall();
    }
    FECSRuntimeQueryIterator local_122 = local_52.Iterator();
    for (; local_122.CanProceed;)
    {
        const FECSEntity& local_146 = local_122.Proceed();
        if (FASCommonUtils::IsMonsterPrefab(local_146))
        {
            if (bOnlyBoss && (int(FASCommonUtils::GetMonsterRank(local_146)) != 2))
            {
                continue;
            }
            AllEntities.Add(local_146);
        }
    }
    return;
}
UFUNCTION()
void GetAllBossEntities(TArray<FECSEntity> &inout Entities, const bool bIncludeDeath = false)
{
    Entities.Reset(0);
    FECSWorldPtr local_6 = ECS::GetECSWorld();
    FECSEntity local_10 = FECSEntity(ENTITY_ID_NULL);
    FECSRuntimeQuery local_52 = FECSRuntimeQueryHelper::MakeRuntimeQuery(local_10, EECSQueryRegsitryType(3), false);
    Include local_96;
    local_96.opCall();
    if (!(bIncludeDeath))
    {
        Exclude(local_52).opCall();
    }
    FECSRuntimeQueryIterator local_122 = local_52.Iterator();
    for (; local_122.CanProceed;)
    {
        const FECSEntity& local_146 = local_122.Proceed();
        if (FASCommonUtils::IsMonsterPrefab(local_146))
        {
            if ((int(FASCommonUtils::GetMonsterRank(local_146))) == 2)
            {
                Entities.Add(local_146);
            }
        }
    }
    return;
}
UFUNCTION()
void GetEntityInRangeWithTypeName(TArray<FECSEntity> &inout AllEntities, const FVector &inout Location, const float32 Range, const FName &inout Name, const bool bIncludeDeath = false)
{
    AllEntities.Reset(0);
    FECSWorldPtr local_6 = ECS::GetECSWorld();
    FECSEntity local_10 = FECSEntity(ENTITY_ID_NULL);
    FECSRuntimeQuery local_52 = FECSRuntimeQueryHelper::RuntimeQueryInSphere(local_10, Location, Range, EECSQueryRegsitryType(3), false);
    Include local_96;
    local_96.opCall();
    if (!(bIncludeDeath))
    {
        Exclude(local_52).opCall();
    }
    FECSRuntimeQueryIterator local_122 = local_52.Iterator();
    FText local_202;
    for (; local_122.CanProceed;)
    {
        const FECSEntity& local_146 = local_122.Proceed();
        if (!((GetPrefabConfigPtr(local_146) == nullptr)) && (local_202 == FText::FromName(Name)))
        {
            AllEntities.Add(local_146);
        }
    }
    return;
}
UFUNCTION()
void GetAllPlayerProxys(TArray<FECSEntity> &inout Proxys)
{
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    FECSRuntimeView local_42 = local_4.GetRuntimeView(EECSRuntimeViewType(2));
    Include local_46;
    local_46.opCall();
    Proxys.Reset(0);
    FECSRuntimeViewIterator local_82 = local_42.Iterator();
    for (; local_82.CanProceed;)
    {
        Proxys.Add(local_82.Proceed());
    }
    return;
}
UFUNCTION()
void GetAllPlayerPawnEntities(TArray<FECSEntity> &inout Pawns)
{
    TArray<FECSEntity> local_4;
    BlueprintFunctions_Level::GetAllPlayerProxys(local_4);
    Pawns.Reset(0);
    for (auto& local_22 : local_4)
    {
        FECSEntity local_26 = FASCommonUtils::GetUniqueAvatarPawnEntity(local_22);
        if (local_26.IsValid())
        {
            Pawns.Add(local_26);
        }
    }
    return;
}
UFUNCTION()
void GetAllPlayerEntitiesInRange(TArray<FECSEntity> &inout AllEntities, const FVector &inout Location, const float32 Range, const bool bIncludeBackGround = true)
{
    FPlayerUtils::GetAllPlayerPawnEntitiesInRange(AllEntities, ECS::GetECSWorld(), Location, Range, bIncludeBackGround);
    return;
}
UFUNCTION()
bool Level_IsTeleporterActiveForPlayer(const FECSEntity &inout TeleporterEntity, const FECSEntity &inout PlayerPawnEntity)
{
    int local_8 = 0;
    int local_9 = 0;
    if (!(TeleporterEntity.IsValid()) || !(PlayerPawnEntity.IsValid()))
    {
        return false;
    }
    if (!(local_8) || !(local_8.TeleporterConfig.IsSet()))
    {
        return false;
    }
    return TeleporterUtils::IsTeleporterActive(PlayerPawnEntity, local_9, TeleporterEntity);
}
UFUNCTION()
bool CheckPlayersDistanceToEntity(const FECSEntity &inout TargetEntity, const float32 Distance, const BlueprintFunctions_Level::EDistanceCompareType CompareType = EDistanceCompareType::LessThanOrEqual, const BlueprintFunctions_Level::EPlayersFilterType PlayersFilterType = EPlayersFilterType::All)
{
    Has local_4;
    if (!(local_4.opCall()))
    {
        return false;
    }
    Get local_16;
    FVector local_12 = local_16.opCall().GetPosition();
    TArray<FECSEntity> local_24 = FGameUtils::GetAllPlayerControllerEntities(true);
    float32 local_26 = Distance * Distance;
    for (auto& local_40 : local_24)
    {
        FASCommonUtils::GetUniqueAvatarPawnEntity(local_40);
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            bool local_59;
            float32 local_25 = float32(local_12.DistSquared(FVector(local_16.opCall().GetPosition())));
            local_59 = false;
            if (int(CompareType) == 0)
            {
                local_59 = (local_25 <= local_26);
            }
            else
            {
                if (int(CompareType) == 1)
                {
                    local_59 = (local_25 >= local_26);
                }
            }
            if (int(PlayersFilterType) == 1 && local_59)
            {
                return true;
            }
            if (int(PlayersFilterType) == 0 && !(local_59))
            {
                return false;
            }
        }
        else
        {
            if (int(PlayersFilterType) == 0)
            {
                return false;
            }
        }
    }
    return (int(PlayersFilterType) == 0);
}
UFUNCTION()
void GetCurrentPlayerEntity(const FECSEntityAdapter &inout Proxy, FECSEntity &out Entity)
{
    FECSEntity local_4;
    Entity = local_4;
    Get local_8;
    const FC_PlayerController& local_10 = local_8.opCall();
    if (local_10)
    {
        Entity = local_10.GetPlayerPawnEntity();
    }
    return;
}
UFUNCTION()
float32 GetCurrentTimeOfDayInHours()
{
    return FTimeOfDayUtils::GetCurrentTimeOfDayInHours();
}
UFUNCTION()
FName GetCurrentTODStageName()
{
    return FTimeOfDayUtils::GetCurrentTODStageName();
}
UFUNCTION()
FString GetEntityPlayerName(const FECSEntityAdapter &inout Entity)
{
    int local_20 = 0;
    if ((!((FASCommonUtils::GetUniquePlayerEntity(Entity.opImplConv()) == ENTITY_NULL))))
    {
        if (local_20)
        {
            return local_20.GetNickName();
        }
    }
    return Entity.ToString();
}
UFUNCTION()
FString GetEntityPlayerOrDisplayName(const FECSEntityAdapter &inout Entity)
{
    int local_20 = 0;
    int local_34 = 0;
    if ((!((FASCommonUtils::GetUniquePlayerEntity(Entity.opImplConv()) == ENTITY_NULL))))
    {
        if (local_20)
        {
            return local_20.GetNickName();
        }
    }
    FECSEntity local_4 = Entity.GetEntity();
    Has local_28;
    bool local_13 = local_28.opCall();
    if (local_13)
    {
        FECSEntity local_12 = Entity.GetEntity();
        Get local_32;
        FECSEntity local_4_2 = FECSEntity(local_32.opCall().GetPawnEntity());
        return local_34.DisplayName.ToString();
    }
    TDataObjectPtr<FBasePrefabConfig> local_58 = GetPrefabConfigPtr(Entity.GetEntity());
    if (local_58)
    {
        return local_58.opArrow().DisplayName.ToString();
    }
    return Entity.ToString();
}
UFUNCTION()
bool IsAvatarPawnEntity(const FECSEntityAdapter &inout Entity)
{
    FECSEntity local_4 = Entity.opImplConv();
    Has local_12;
    bool local_13 = local_12.opCall();
    if (local_13)
    {
        Get local_18;
        local_4 = local_18.opCall().GetDriverEntity();
    }
    return FASCommonUtils::IsAvatarPrefab(local_4);
}
UFUNCTION()
void MoveEntityToLocation(const FECSEntityAdapter &inout Entity, const FVector &inout Location, const FRotator &inout Rotation, const bool bSetCameraRotation = false, const FRotator &inout CameraRotation = FRotator::ZeroRotator, const bool bTeleportCamera = false, const bool bShowBlackScreen = true)
{
    FECSEntity local_4 = Entity.opImplConv();
    Has local_12;
    bool local_13 = local_12.opCall();
    if (local_13)
    {
        Get local_18;
        local_4 = local_18.opCall().GetPlayerPawnEntity();
    }
    else
    {
        Has local_22;
        bool local_13_2 = local_22.opCall();
        if (local_13_2)
        {
            Get local_26;
            local_4 = local_26.opCall().GetMountEntity();
        }
    }
    Has local_30;
    bool local_13_3 = local_30.opCall();
    if (local_13_3)
    {
        BlueprintFunctions_Common::TeleportEntityToLocation(FECSEntityAdapter(local_4), Location, Rotation, bSetCameraRotation, CameraRotation, bTeleportCamera, bShowBlackScreen, ELoadingScreenAction(0), bShowBlackScreen);
    }
    else
    {
        XError(ELog(0), "No Transform!");
    }
    return;
}
UFUNCTION()
bool MoveEntityToValidPos(const FECSEntityAdapter &inout Entity, const FVector &inout Location, const FRotator &inout Rotation, const bool bSetCameraRotation = false, const FRotator &inout CameraRotation = FRotator::ZeroRotator, const bool bTeleportCamera = false, const bool bShowBlackScreen = true, const float32 MaxNearbyRadius = 500, const float32 StepLength = 50, const bool bMoveEvenNoValidPos = true)
{
    FECSEntity local_4 = Entity.opImplConv();
    Has local_12;
    bool local_13 = local_12.opCall();
    if (local_13)
    {
        Get local_18;
        local_4 = local_18.opCall().GetPlayerPawnEntity();
    }
    else
    {
        Has local_22;
        bool local_13_2 = local_22.opCall();
        if (local_13_2)
        {
            Get local_26;
            local_4 = local_26.opCall().GetMountEntity();
        }
    }
    if (!(local_4.IsValid()))
    {
        return false;
    }
    bool local_13_3 = false;
    FVector local_54 = FASCommonUtils::FindLegalLocationExt(local_4, Location, MaxNearbyRadius, StepLength, 8, FVector(100.0, 100.0, 100.0), true);
    local_13_3 = local_13_3 || bMoveEvenNoValidPos;
    if (local_13_3)
    {
        BlueprintFunctions_Common::TeleportEntityToLocation(FECSEntityAdapter(local_4), local_54, Rotation, bSetCameraRotation, CameraRotation, bTeleportCamera, bShowBlackScreen, ELoadingScreenAction(0), bShowBlackScreen);
        return true;
    }
    return false;
}
UFUNCTION()
FVector FindRandomLegalLocation(const FECSEntity &inout PawnEntity, const FVector &inout CenterLocation, const float32 MaxRadius, const float32 StepSize, const int NumRays, const FVector &inout Extent, const bool bSampleCenterPoint)
{
    return FAIPathFollowUtils::FindLegalLocationExt(PawnEntity, CenterLocation, MaxRadius, StepSize, NumRays, Extent, bSampleCenterPoint, true, false, false, true);
}
UFUNCTION()
void MoveEntityByOffset(const FECSEntityAdapter &inout Entity, const FVector &inout Offset)
{
    FECSEntity local_4 = Entity.opImplConv();
    Has local_12;
    bool local_13 = local_12.opCall();
    if (local_13)
    {
        Get local_18;
        local_4 = local_18.opCall().GetPlayerPawnEntity();
    }
    else
    {
        Has local_22;
        bool local_13_2 = local_22.opCall();
        if (local_13_2)
        {
            Get local_26;
            local_4 = local_26.opCall().GetMountEntity();
        }
    }
    Has local_30;
    bool local_13_3 = local_30.opCall();
    if (local_13_3)
    {
        Get local_34;
        BlueprintFunctions_Common::TeleportEntityToLocation(FECSEntityAdapter(local_4), (FVector(local_34.opCall().GetPosition()) + Offset), local_34.opCall().GetRotation().Rotator(), false, FRotator::ZeroRotator, false, true, ELoadingScreenAction(0), true);
    }
    else
    {
        XError(ELog(0), "No Transform!");
    }
    return;
}
UFUNCTION()
void GetEntityTransform(const FECSEntityAdapter &inout Entity, FTransform &out Transform)
{
    FTransform local_24;
    Transform = local_24;
    Has local_28;
    bool local_29 = local_28.opCall();
    if (local_29)
    {
        Get local_34;
        Transform = local_34.opCall().Tolocal_24;
        return;
    }
    XError(ELog(0), "No Transform!");
    return;
}
UFUNCTION()
void GetEntityLocation(const FECSEntityAdapter &inout Entity, FVector &out Location)
{
    FVector local_6;
    Location = local_6;
    if (ECS::IsFixedFrameJob())
    {
        Has local_12;
        bool local_7 = local_12.opCall();
        if (local_7)
        {
            Get local_16;
            Location = local_16.opCall().GetPosition();
        }
        else
        {
            XError(ELog(0), "No Transform!");
        }
        return;
    }
    GetDefaulted local_22;
    Location = local_22.opCall().GetPosition();
    return;
}
UFUNCTION()
void GetEntityRotation(const FECSEntityAdapter &inout Entity, FRotator &out Rotation)
{
    FRotator local_6;
    Rotation = local_6;
    Has local_10;
    bool local_11 = local_10.opCall();
    if (local_11)
    {
        Get local_16;
        Rotation = local_16.opCall().GetRotation().Rotator();
        return;
    }
    XError(ELog(0), "No Transform!");
    return;
}
UFUNCTION()
FVector GetEntityVelocity(const FECSEntity &inout Entity, const int HistoryFrame = 2)
{
    FFPTime local_2 = ECS::GetContextTime();
    FC_Transform local_24;
    FC_Transform local_44;
    FECSEntity::SampleHistory(Entity).opCall(local_2, local_24);
    FECSEntity::SampleHistory(Entity).opCall((local_2 - (FFPTime(FECSWorld::FixedFrameInterval) * HistoryFrame)), local_44);
    if ((FVector(local_24.GetPosition()) == local_44.GetPosition()))
    {
        return FVector::ZeroVector;
    }
    else
    {
        FVector local_72 = (FVector(local_24.GetPosition()) - local_44.GetPosition());
        return (local_72 / (FECSWorld::FixedFrameInterval.ToSeconds() * HistoryFrame));
    }
}
UFUNCTION()
void GetEntityListByPrefabClass(TArray<FECSEntity> &inout AllEntities, const TSubclassOf<AECSPrefab> &inout PrefabClass)
{
    int local_130 = 0;
    UClass local_132;
    AllEntities.Reset(0);
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    if (!(local_4.IsValid()))
    {
        return;
    }
    FECSRuntimeView local_46 = local_4.GetRuntimeView(EECSRuntimeViewType(2));
    Exclude(local_46).opCall();
    Include local_54;
    local_54.opCall();
    FECSRuntimeViewIterator local_88 = local_46.Iterator();
    for (; local_88.CanProceed;)
    {
        const FECSEntity& local_124 = local_88.Proceed();
        if (local_130)
        {
            local_132 = local_130.PrefabClass.Get();
            if ((PrefabClass == local_132))
            {
                AllEntities.Add(local_124);
            }
        }
    }
    return;
}
UFUNCTION()
bool RandomSuccess(const float Rate)
{
    return (FMath::RandRange(0.0, 1.0) <= Rate);
}
UFUNCTION()
void Level_HealHP(const FECSEntityAdapter &inout Entity, const float32 HP = 0, const float32 HPRatio = 0)
{
    BlueprintFunctions_Common::HealHP(Entity, Entity, HP, HPRatio, false, EHealHPType(0));
    return;
}
UFUNCTION()
void Level_SetHPToRatio(const FECSEntityAdapter &inout Entity, const float32 TargetHPRatio = 1)
{
    const FECSRuntimeInfo& local_2 = ECS::GetRuntimeInfo();
    Get local_8;
    float32 local_9 = local_8.opCall().GetAttributeValue(Attribute::HP, local_2.Time);
    float32 local_10 = (local_8.opCall().GetAttributeValue(Attribute::HPMax, local_2.Time) * TargetHPRatio) - local_9;
    if (local_10 > 0.0f)
    {
        FGameAttributeUtils::Recover(Entity.opImplConv(), Attribute::HP, local_2.Time, local_10, -1.0f);
        return;
    }
    float32 local_11 = -local_10;
    FGameAttributeUtils::Consume(Entity.opImplConv(), Attribute::HP, local_2.Time, local_11);
    return;
}
UFUNCTION()
void Level_SetPostureToRatio(const FECSEntityAdapter &inout Entity, const float32 TargetPostureRatio = 1)
{
    const FECSRuntimeInfo& local_2 = ECS::GetRuntimeInfo();
    Get local_8;
    float32 local_9 = local_8.opCall().GetAttributeValue(Attribute::Posture, local_2.Time);
    float32 local_10 = (local_8.opCall().GetAttributeValue(Attribute::PostureMax, local_2.Time) * (1.0f - TargetPostureRatio)) - local_9;
    if (local_10 > 0.0f)
    {
        FGameAttributeUtils::Recover(Entity.opImplConv(), Attribute::Posture, local_2.Time, local_10, -1.0f);
        return;
    }
    float32 local_11 = -local_10;
    FGameAttributeUtils::Consume(Entity.opImplConv(), Attribute::Posture, local_2.Time, local_11);
    return;
}
UFUNCTION()
FECSEntity LevelAddBuff(const FECSEntityAdapter &inout BuffFromEntity, const FECSEntity &inout Entity, const FBuffConfigRef &inout BuffConfig, const float32 OverrideDuration = -1)
{
    FECSEntityAdapter local_8 = BuffFromEntity;
    FECSEntity local_12 = Entity;
    return FBuffUtils::AddBuff(local_12, BuffConfig, ECS::GetECSWorld().GetFixedTime().Time, local_8.opImplConv(), false, OverrideDuration, 1, false);
}
UFUNCTION()
void LevelAddBuffForPlayerInRnage(const FECSEntityAdapter &inout BuffFromEntity, const FBuffConfigRef &inout BuffConfig, const FVector &inout Center, const float32 Range = 2000.0f, const float32 OverrideDuration = -1)
{
    TArray<FECSEntity> local_6 = BlueprintFunctions_Common::GetAllPlayerEntitiesInRangeAS(Center, Range, true);
    FECSEntityAdapter local_16 = BuffFromEntity;
    FECSWorldPtr local_20 = ECS::GetECSWorld();
    for (auto& local_34 : local_6)
    {
        FBuffUtils::AddBuff(local_34, BuffConfig, local_20.GetFixedTime().Time, local_16.opImplConv(), false, OverrideDuration, 1, false);
    }
    return;
}
UFUNCTION()
bool LevelRemoveBuffById(const FECSEntityAdapter &inout Entity, const FECSEntity &inout BuffId)
{
    if ((BuffId == ENTITY_NULL))
    {
        XWarning(ELog(0), "Level Remove Buff None !");
        return false;
    }
    FECSEntityAdapter local_10 = Entity;
    return FBuffUtils::RemoveBuff(local_10.opImplConv(), BuffId, ECS::GetECSWorld().GetFixedTime().Time, EBuffEndType(0));
}
UFUNCTION()
void Level_RemoveLockTarget(const FECSEntityAdapter &inout Entity, const FECSEntity &inout RemoveTarget = ENTITY_NULL)
{
    int local_10 = 0;
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    if (local_10)
    {
        if (!((RemoveTarget == ENTITY_NULL)) && !((FECSEntity(local_10.GetTargetEntity()) == RemoveTarget)))
        {
            return;
        }
        FLockTargetUtils::DisposeChangeLockTarget(Entity.opImplConv(), ENTITY_NULL, local_10.GetTargetEntity(), -1, false, EPreChangeTargetReason(4), ELockTargetType(0));
    }
    return;
}
UFUNCTION()
void Level_MuteCombat(const FECSEntityAdapter &inout Entity, const bool bMute, const FName &inout MuteSource = n"LevelMuteCombat")
{
    if (!(Entity.IsValid()))
    {
        return;
    }
    if (bMute)
    {
        FAIKnowledgeUtils::AddMuteCombat(Entity.opImplConv(), MuteSource, false);
        return;
    }
    FAIKnowledgeUtils::RemoveMuteCombat(Entity.opImplConv(), MuteSource);
    return;
}
UFUNCTION()
void Level_MuteBeAITarget(const FECSEntityAdapter &inout Entity, const bool bMute, const FName &inout MuteSource = n"LevelMuteBeAITarget")
{
    if (!(Entity.IsValid()))
    {
        return;
    }
    if (bMute)
    {
        FAIKnowledgeUtils::AddMuteBeAITarget(Entity.opImplConv(), MuteSource);
        return;
    }
    FAIKnowledgeUtils::RemoveMuteBeAITarget(Entity.opImplConv(), MuteSource);
    return;
}
UFUNCTION()
void Level_MuteInvolvedFight(const FECSEntityAdapter &inout Entity, const bool bMute, const FName &inout MuteSource = n"LevelMuteInvolvedFight")
{
    if (!(Entity.IsValid()))
    {
        return;
    }
    if (bMute)
    {
        FAIKnowledgeUtils::AddMuteCombat(Entity.opImplConv(), MuteSource, false);
        FAIKnowledgeUtils::AddMuteBeAITarget(Entity.opImplConv(), MuteSource);
        return;
    }
    FAIKnowledgeUtils::RemoveMuteCombat(Entity.opImplConv(), MuteSource);
    FAIKnowledgeUtils::RemoveMuteBeAITarget(Entity.opImplConv(), MuteSource);
    return;
}
UFUNCTION()
void Level_EntityForceOnlyCombatWithTarget(const FECSEntityAdapter &inout Entity, const FECSEntity &inout TargetEntity)
{
    Get local_4;
    if (local_4.opCall())
    {
        FAITargetingUtils::AddExternalTarget(Entity.opImplConv(), FTargetEntity(TargetEntity), FName("Level_EntityForceOnlyCombatWithTarget"), EAIExternalTargetPriority(2));
    }
    return;
}
UFUNCTION()
void Level_ClearEntityForceOnlyCombatWithTarget(const FECSEntityAdapter &inout Entity)
{
    Get local_4;
    if (local_4.opCall())
    {
        FAITargetingUtils::RemoveExternalTarget(Entity.opImplConv(), FName("Level_EntityForceOnlyCombatWithTarget"));
    }
    return;
}
UFUNCTION()
void Level_EntitySwitchAI(const FECSEntityAdapter &inout Entity, const bool IsAIRun)
{
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    Get local_8;
    const FC_ControlledByAI& local_10 = local_8.opCall();
    if (local_10)
    {
        FECSEntity local_20 = FECSEntity(local_10.GetControllerEntity());
        Modify local_24;
        FC_BehaviorTree& local_26 = local_24.opCall();
        if (local_26)
        {
            local_26.SetbShouldRun(IsAIRun);
        }
    }
    return;
}
UFUNCTION()
void Level_KillEntity(const FECSEntityAdapter &inout Entity, const FECSEntity &inout Killer)
{
    FLifeCycleUtils::KillEntityCheckNearDeathRule(Entity.opImplConv(), Killer.GetId(), ECS::GetECSWorld().GetFixedTime().Time, true, true, false, true);
    return;
}
UFUNCTION()
void Level_DestroyEntityDirectly(const FECSEntityAdapter &inout Entity)
{
    FLifeCycleUtils::EntityDestroyDirectly(Entity.opImplConv(), ECS::GetECSWorld().GetFixedTime().Time);
    return;
}
UFUNCTION()
void Level_RemoveEntity(const FECSEntityAdapter &inout Entity)
{
    BlueprintFunctions_Level::Level_DestroyEntityDirectly(Entity);
    return;
}
UFUNCTION()
void Level_SpawnEnergyBall(const FECSEntityAdapter &inout Entity, const TSubclassOf<AEnergyBallPrefab> &inout Prefab, const FVector &inout Location)
{
    EnergyBallUtils::SpawnEnergyBallByPrefab(Entity.opImplConv(), Prefab, ECS::GetRuntimeInfo().Time, Location, 1, EEnergyBallSpawnDirection(0));
    return;
}
UFUNCTION()
void Level_SpawnEnergyBallInArea(const FVector &inout Location, const TSubclassOf<AEnergyBallPrefab> &inout Prefab, const float32 Radius)
{
    EnergyBallUtils::SpawnEnergyBallInArea(Location, Prefab, ECS::GetRuntimeInfo().Time, Radius);
    return;
}
UFUNCTION()
void ServerShowLevelHintPanel(const FECSEntityAdapter &inout TargetPawnEntity, const FName &inout HintName)
{
    int local_10 = 0;
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    FECSEntityAdapter::SendEvent<FCE_ShowLevelHintPanel> local_8 = FECSEntityAdapter::SendEvent<FCE_ShowLevelHintPanel>(TargetPawnEntity);
    local_10.HintName = HintName;
    local_10.SetbPredictable(false);
    return;
}
UFUNCTION()
void Level_StartBlackScreen(const FECSEntity &inout Entity, const float32 BlackTime, const float32 FadeInTime = -1, const float32 FadeOutTime = -1)
{
    if (Entity.IsValid())
    {
        FCE_ShowLoadingPage local_12;
        FFPTime local_8 = FFPTime(-1);
        local_12.DisplayTime = BlackTime;
        local_12.FadeInTime = FadeInTime;
        local_12.FadeOutTime = FadeOutTime;
        return;
    }
    XError(ELog(0), "Level_StartBlackScreen и°ѓз”Ёй”™иЇЇ! Entity жЇз©єпјЃпјЃ");
    return;
}
UFUNCTION()
void GetWeatherRegionVolumeByAreaConfig(const TDataObjectPtr<FWorldAreaConfig> &inout AreaConfig, AECSRegionVolume &out RegionVolume)
{
    AECSRegionVolume local_26;
    if (!(AreaConfig.IsSet()))
    {
        return;
    }
    TArray<AECSRegionVolumeBase> local_10 = ULevelActorManager::Get().GetRegionVolumes();
    for (auto local_24 : local_10)
    {
        local_26 = Cast<AECSRegionVolume>(local_24);
        bool local_29 = local_26 != nullptr && local_26.bAffectWeather;
        if (!(local_29))
        {
            local_29 = false;
        }
        else
        {
            TDataObjectPtr<FWorldAreaConfig> local_54;
            local_54 = local_26.AreaConfig;
            local_29 = (local_54 == AreaConfig.opImplConv());
        }
        if (local_29)
        {
            RegionVolume = local_26;
            return;
        }
    }
    return;
}
UFUNCTION()
void AddTeamLinkEnergyInArea(const FVector &inout Center, const float32 Range = 5000.0f, const float32 AddLinkEnergy = 0)
{
    return;
}
UFUNCTION()
void Level_TriggerEntitySimpleSkill(const FECSEntityAdapter &inout Entity, const int SkillIndex)
{
    FCombatUtils::TriggerEntitySimpleSkill(Entity.opImplConv(), SkillIndex, 0.1f);
    return;
}
UFUNCTION()
void Level_TriggerEntitySkill(const FECSEntityAdapter &inout Entity, const USkillConfig SkillConfig)
{
    FCombatUtils::TriggerEntitySkill(Entity.opImplConv(), SkillConfig, 0.1f);
    return;
}
UFUNCTION()
void Level_ForceSetBossPhase(const FECSEntityAdapter &inout Entity, const int Phase = 1)
{
    ECS::GetRuntimeInfo();
    FNameHandle_EntityBBVarInt local_12;
    local_12;
    FECSEntity local_6 = Entity.GetEntity();
    return;
}
UFUNCTION()
void Level_ForceChangeLockTarget(const FECSEntityAdapter &inout PlayerEntity, const FECSEntity &inout TargetEntity)
{
    int local_10 = 0;
    FECSEntity local_16;
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    if (local_10)
    {
        if (!((TargetEntity == ENTITY_NULL)) && (FECSEntity(local_10.GetTargetEntity()) == TargetEntity))
        {
            return;
        }
    }
    if (FASCommonUtils::IsEntityActiveAndAlive(TargetEntity))
    {
        bool local_18;
        local_18 = false;
        if (FASCommonUtils::IsAvatarPrefab(PlayerEntity.opImplConv()))
        {
            local_18 = true;
        }
        if (local_10)
        {
            local_16 = local_10.GetTargetEntity();
        }
        else
        {
            local_16 = ENTITY_NULL;
        }
        FLockTargetUtils::DisposeChangeLockTarget(PlayerEntity.opImplConv(), TargetEntity, local_16, -1, local_18, EPreChangeTargetReason(0), ELockTargetType(2));
    }
    return;
}
UFUNCTION()
void Level_AddForceEngagingTarget(const FECSEntityAdapter &inout Entity, const FECSEntity &inout EngagingTargetEntity)
{
    Get local_4;
    if (local_4.opCall())
    {
        FAITargetingUtils::AddExternalTarget(Entity.opImplConv(), FTargetEntity(EngagingTargetEntity), FName("Level_AddForceEngagingTarget"), EAIExternalTargetPriority(2));
    }
    return;
}
UFUNCTION()
void SetScriptControlState(const FECSEntityAdapter &inout Entity, const bool bNeedControlledByLevel)
{
    FAIKnowledgeUtils::SetScriptControlState(Entity.opImplConv(), bNeedControlledByLevel);
    return;
}
UFUNCTION()
void TeleportEcosimEntityToTransform(const FECSEntityAdapter &inout Entity, const FVector &inout TargetLocation, const FRotator &inout TargetRotation)
{
    FASCommonUtils::TeleportEntityToTransform(Entity.opImplConv(), TargetLocation, TargetRotation);
    return;
}
UFUNCTION()
void Level_SetEntityInitInfo(const FECSEntity &inout Entity, const FName &inout InitToState)
{
    int local_8 = 0;
    if (!(InitToState.IsNone()))
    {
        local_8.ToState = InitToState;
    }
    return;
}
UFUNCTION()
void Level_GetRandomTransformByRangeAndAngle(const FTransform &inout AnchorTransform, FVector &out RandomLocation, FRotator &out RandomRotation, const float32 RandomLocationHorizontalRange = 200, const float32 RandomYawOffset = 30)
{
    FVector local_6;
    RandomLocation = local_6;
    RandomRotation = FRotator();
    FVector local_34 = AnchorTransform.GetLocation();
    float32 local_13 = -RandomLocationHorizontalRange;
    float local_26 = FMath::RandRange(local_13, RandomLocationHorizontalRange);
    float32 local_13_2 = -RandomLocationHorizontalRange;
    RandomLocation = (local_34 + FVector((FMath::RandRange(local_13_2, RandomLocationHorizontalRange)), local_26, 0.0));
    FRotator local_54 = AnchorTransform.GetRotation().Rotator();
    float32 local_13_3 = -RandomYawOffset;
    RandomRotation = (local_54 + FRotator(0.0, (FMath::RandRange(local_13_3, RandomYawOffset)), 0.0));
    return;
}
UFUNCTION()
void Level_ChangeMoveStance(const FECSEntity &inout Entity, const ECharacterMoveStance MoveStance)
{
    ECS::GetContextTime();
    return;
}
UFUNCTION()
void Level_EcosimAIV2CreateWaveEntity(FECSEntity &out WaveEntity)
{
    FECSEntity local_4;
    WaveEntity = local_4;
    WaveEntity = FEcosimAIV2Utils::CreateWaveEntity();
    return;
}
UFUNCTION()
void Level_EcosimAIV2AddMemberToWaveEntity(const FECSEntity &inout WaveEntity, const FECSEntity &inout WaveMemberEntity)
{
    FEcosimAIV2Utils::AddMemberToWaveEntity(WaveEntity, WaveMemberEntity);
    return;
}
UFUNCTION()
void Level_SetIndicatorOnlyShowForPlayerEntity(const FECSEntity &inout Entity, const FECSEntity &inout PlayerEntity)
{
    FEcosimAIV2Utils::SetIndicatorOnlyShowForPlayerEntity(Entity, PlayerEntity);
    return;
}
UFUNCTION()
void Level_SetEcologyKnowledgeBool(const FECSEntity &inout Entity, const FGameplayTag &inout Tag, const bool bMoveWithRoadGraph)
{
    FString local_8 = Tag.ToString();
    FString local_12;
    FString local_16;
    local_8.Split(".", local_16, local_12, ESearchCase(1), ESearchDir(1));
    ModifyOrAdd local_24;
    FC_EcologyKnowledge& local_26 = local_24.opCall();
    if (local_26)
    {
        local_26.SetBool(FEcologyKnowledgeKey(FName(local_12)), bMoveWithRoadGraph);
    }
    return;
}
UFUNCTION()
bool Level_GetNearestPlayerPawnEntityByTargetLocation(const FVector &inout TargetLocation, FECSEntity &out PlayerPawnEntity, float32 &out Distance)
{
    FECSEntity local_4;
    int local_136 = 0;
    PlayerPawnEntity = local_4;
    Distance = 0.0f;
    FECSRuntimeView local_46 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
    Include local_50;
    local_50.opCall();
    float local_52 = 3.4028234663852886e38;
    FECSEntity local_58;
    FECSRuntimeViewIterator local_92 = local_46.Iterator();
    for (; local_92.CanProceed;)
    {
        local_92.Proceed();
        GetDefaulted local_146;
        float local_54 = TargetLocation.Distance(FVector(local_146.opCall().GetPosition()));
        if (local_54 < local_52)
        {
            local_52 = local_54;
            local_58 = local_136.GetPlayerPawnEntity();
        }
    }
    PlayerPawnEntity = local_58;
    Distance = float32(local_52);
    return PlayerPawnEntity.IsValid();
}
UFUNCTION()
void Level_TriggerInteractDrop(const FECSEntity &inout PlayerEntity, const FECSEntity &inout Entity)
{
    DropItemsUtils::TryTriggerDropItems(EDropTriggerType(1), Entity, PlayerEntity);
    return;
}
UFUNCTION()
void Level_TriggerInteractToTarget(const FECSEntity &inout SourceEntity, const FECSEntity &inout TargetEntity, const TSubclassOf<UInteractionBehaviorBase> &inout InteractBehaviorClass, const int PointIndex = 0, const int BehaviorIndex = 0, const bool bIsSecondaryInteract = false)
{
    if (!(SourceEntity.IsValid()) || !(TargetEntity.IsValid()))
    {
        return;
    }
    int local_3 = PointIndex;
    int local_4 = BehaviorIndex;
    if (InteractBehaviorClass.IsValid())
    {
        FInteractionPointAndBehaviorIndex local_6;
        if (FInteractUtils::GetInteractionPointAndBehaviorIndexByBehaviorClass(TargetEntity, InteractBehaviorClass, local_6, true))
        {
            local_3 = local_6.GetPointIndex();
            local_4 = local_6.GetBehaviorIndex();
        }
    }
    FInteractionPointAndBehaviorIndex local_6;
    local_6.SetPointIndex(local_3);
    local_6.SetBehaviorIndex(local_4);
    FFPTime local_14 = FFPTime(-1);
    FCE_ServerTriggerBeginInteractEvent local_16;
    local_16.bIsSecondaryInteract = bIsSecondaryInteract;
    local_16.TargetEntity = TargetEntity;
    local_16.InteractTargetPointAndBehaviorIndex = local_6;
    return;
}
UFUNCTION()
void Level_GetOrCreateTeamEntityForTarget(const FECSEntity &inout Entity, FECSEntity &out TeamEntity)
{
    FECSEntity local_4;
    TeamEntity = local_4;
    TeamEntity = FEcosimAIV2Utils::GetOrCreateTeamEntityForTarget(Entity);
    return;
}
UFUNCTION()
void Level_SetLevelControlMoveToSpecifiedTransform(const FECSEntity &inout Entity, const FName &inout MoveToKeyName, const FVector &inout SpecifiedLocation)
{
    FEcosimAIV2Utils::SetLevelControlMoveToSpecifiedTransform(Entity, MoveToKeyName, SpecifiedLocation, false, FVector::ZeroVector);
    return;
}
UFUNCTION()
void Level_SetEntityPublicSpeakByDistance(const FECSEntity &inout Entity, const TDataObjectPtr<FEcosimAIV2LLMPublicSpeakData> &inout SpeakData, const float32 SpeakTriggerDistance = 2000, const float32 TriggerMinInterval = 20)
{
    FEcosimAIV2Utils::SetEntityPublicSpeakByDistance(Entity, SpeakData, SpeakTriggerDistance, TriggerMinInterval);
    return;
}
UFUNCTION()
void Level_RemoveEntityPublicSpeakByDistance(const FECSEntity &inout Entity)
{
    FEcosimAIV2Utils::RemoveEntityPublicSpeakByDistance(Entity);
    return;
}
UFUNCTION()
void SetNPCMainPose(const FECSEntity &inout Entity, const EEcosimAIHumanityMainPose Pose)
{
    FEcosimAIV2Utils::SetNPCMainPose(Entity, EEcosimAIHumanityMainPose(Pose));
    return;
}
UFUNCTION()
void Level_SetNPCMainStance(const FECSEntity &inout Entity, const EEcosimAIHumanityMainStance Stance)
{
    FEcosimAIV2Utils::SetNPCMainStance(Entity, EEcosimAIHumanityMainStance(Stance));
    return;
}
UFUNCTION()
void Level_AddEntityDialogueSpeakToContent(const FECSEntity &inout Entity, const TDataObjectPtr<FInteractSimpleSpeakToAndOption> &inout DialogueData)
{
    FEcosimAIV2Utils::AddEntityDialogueSpeakToContent(Entity, DialogueData);
    return;
}
UFUNCTION()
void Level_ClearEntityDialogueSpeakToContent(const FECSEntity &inout Entity)
{
    FEcosimAIV2Utils::ClearEntityDialogueSpeakToContent(Entity);
    return;
}
UFUNCTION()
void Level_EntityPublicSpeakBySimpleLLM(const FString &inout PromptFileName, const FString &inout AdditionalContext, const FECSEntity &inout Entity)
{
    FEcosimAIV2Utils::EntityPublicSpeakBySimpleLLM(PromptFileName, AdditionalContext, Entity);
    return;
}
UFUNCTION()
void Level_EntityPublicSpeakByLLMPublicSpeakData(const FECSEntity &inout Entity, TDataObjectPtr<FEcosimAIV2LLMPublicSpeakData> &inout LLMPublicSpeakData)
{
    FEcosimAIV2Utils::EntityPublicSpeakByLLMPublicSpeakData(Entity, LLMPublicSpeakData);
    return;
}
UFUNCTION()
void Level_EntityRequestMoveInTeam(const FECSEntity &inout Entity)
{
    FEcosimAIV2Utils::EntityRequestMoveInTeam(Entity);
    return;
}
UFUNCTION()
FECSEntity Level_CreateUnitEntity(const FName &inout UnitName, const FVector &inout Location, const FRotator &inout Rotation)
{
    return FEcosimAIV2Utils::CreateEntity(UnitName, Location, Rotation);
}
UFUNCTION()
FECSEntity Level_CreateUnitEntityByData(const TDataObjectPtr<FEcosimAIV2UnitData> &inout Data, const FVector &inout Location, const FRotator &inout Rotation)
{
    return FEcosimAIV2Utils::CreateEntityByData(Data, Location, Rotation);
}
UFUNCTION()
void Level_AddEntityToTeamEntity(const FECSEntity &inout Entity, const FECSEntity &inout TeamEntity)
{
    FEcosimAIV2Utils::AddEntityToTeamEntity(Entity, TeamEntity);
    return;
}
UFUNCTION()
void Level_EntityPublicSpeak(const FECSEntity &inout Entity, const FString &inout Content, const float32 Duration)
{
    FEcosimAIV2Utils::EntityPublicSpeak(Entity, Content, Duration);
    return;
}
UFUNCTION()
void Level_InitEcosimAIV2()
{
    FEcosimAIV2Utils::InitEcosimAIV2();
    return;
}
UFUNCTION()
void Level_EcosimAIV2CreateTeamEntity(FECSEntity &out TeamEntity)
{
    FECSEntity local_4;
    TeamEntity = local_4;
    TeamEntity = FEcosimAIV2Utils::CreateTeamEntity();
    return;
}
UFUNCTION()
void Level_EcosimAIV2MetaEntityRequestMove(const FECSEntity &inout MetaEntity)
{
    FEcosimAIV2Utils::MetaEntityRequestMove(MetaEntity);
    return;
}
UFUNCTION()
void Level_EcosimAIV2SetTeamEntityTargetTransform(const FECSEntity &inout TeamEntity, const FTransform &inout TargetTransform)
{
    FEcosimAIV2Utils::SetTeamEntityTargetTransform(TeamEntity, TargetTransform);
    return;
}
UFUNCTION()
void Level_EcosimAIV2SetTeamSideBalanceTolerance(const FECSEntity &inout TeamEntity, const int SideBalanceTolerance)
{
    FEcosimAIV2Utils::SetTeamSideBalanceTolerance(TeamEntity, SideBalanceTolerance);
    return;
}
UFUNCTION()
void Level_EcosimAIV2CreateNewMetaEntityToTeamEntityAtTargetPointEntity(const FECSEntity &inout TeamEntity, const FECSEntity &inout TargetPointEntity, const FVector2D &inout EntitySize, const bool bIsHighPriority, FECSEntity &out MetaEntity)
{
    FECSEntity local_4;
    MetaEntity = local_4;
    MetaEntity = FEcosimAIV2Utils::CreateNewMetaEntityToTeamEntityAtTargetPointEntity(TeamEntity, TargetPointEntity, EntitySize, bIsHighPriority);
    return;
}
UFUNCTION()
void Level_EcosimAIV2PrecreateConvoyTeam(const TArray<TSubclassOf<AECSPrefab>> &inout OrderedPrefabs, const float32 LengthOffset, const float32 WidthOffset, FECSEntity &out TeamEntity)
{
    FECSEntity local_4;
    TeamEntity = local_4;
    TeamEntity = FEcosimAIV2Utils::PrecreateConvoyTeam(OrderedPrefabs, LengthOffset, WidthOffset);
    return;
}
UFUNCTION()
int Level_EcosimAIV2GetTeamSlotCount(const FECSEntity &inout TeamEntity)
{
    return FEcosimAIV2Utils::GetTeamSlotCount(TeamEntity);
}
UFUNCTION()
void Level_EcosimAIV2GetSlotWorldTransform(const FECSEntity &inout TeamEntity, const int SlotIndex, const FTransform &inout AnchorTransform, FTransform &out OutTransform)
{
    FTransform local_24;
    OutTransform = local_24;
    OutTransform = FEcosimAIV2Utils::GetSlotWorldTransform(TeamEntity, SlotIndex, AnchorTransform);
    return;
}
UFUNCTION()
void Level_EcosimAIV2BindEntityToSlot(const FECSEntity &inout TeamEntity, const int SlotIndex, const FECSEntity &inout Entity)
{
    FEcosimAIV2Utils::BindEntityToSlot(TeamEntity, SlotIndex, Entity);
    return;
}
UFUNCTION()
void Level_OverrideExitLevel(const bool bCanExitLevel)
{
    if (ECS::GetECSWorld().IsValid())
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        ModifyOrAdd local_8;
        FCS_ExitLevelOverride& local_10 = local_8.opCall();
        if (local_10)
        {
            local_10.SetbCanExitLevel(bCanExitLevel);
        }
    }
    return;
}
UFUNCTION()
void Level_AddInventoryItemToPlayerOrEntity(const FECSEntityAdapter &inout PlayerOrEntity, const FItemTableRowRef &inout Item, const int Number = 1)
{
    InventoryUtils::AddInventoryItem(PlayerOrEntity.opImplConv(), TDataObjectPtr<FItemConfig>(), Number);
    return;
}
UFUNCTION()
void Level_RemoveInventoryItemFromPlayerOrEntity(const FECSEntityAdapter &inout PlayerOrEntity, const FItemTableRowRef &inout Item, const int Number = 1)
{
    InventoryUtils::RemoveInventoryItem(PlayerOrEntity.opImplConv(), TDataObjectPtr<FItemConfig>(), Number);
    return;
}
UFUNCTION()
bool Level_HasItemInInventory(const FECSEntityAdapter &inout PlayerOrEntity, const FItemTableRowRef &inout Item)
{
    return InventoryUtils::HasItemInInventory(PlayerOrEntity.opImplConv(), TDataObjectPtr<FItemConfig>());
}
UFUNCTION()
int Level_GetInventoryItemNum(const FECSEntityAdapter &inout PlayerOrEntity, const FItemTableRowRef &inout Item)
{
    return InventoryUtils::GetInventoryItemNumber(PlayerOrEntity.opImplConv(), TDataObjectPtr<FItemConfig>());
}
UFUNCTION()
void LevelSpawnCollectItem(const TSubclassOf<ACollectionPrefab> &inout Prefab, const FVector &inout Location, const float32 RandomRange, FECSEntity &out PropEntity)
{
    FECSEntity local_4;
    PropEntity = local_4;
    float32 local_11 = -RandomRange;
    float local_24 = FMath::RandRange(local_11, RandomRange);
    float32 local_11_2 = -RandomRange;
    FVector local_32 = (Location + FVector((FMath::RandRange(local_11_2, RandomRange)), local_24, 100.0));
    FVector local_38;
    bool local_45 = UNavigationSystemV1::ProjectPointToNavigation(__GetWorldContext(), local_32, local_38, nullptr, TSubclassOf<UNavigationQueryFilter>(nullptr), FVector());
    if (local_45)
    {
        PropEntity = ECS::RequestEntityByPrefabDeferred(Prefab, local_38, FRotator::ZeroRotator, EPrefabCollisionAlignment(2), EECSRegType(0), false);
        return;
    }
    XError(ELog(0), "LevelSpawnCollectItem can't find valid position, spawn random");
    PropEntity = ECS::RequestEntityByPrefabDeferred(Prefab, local_32, FRotator::ZeroRotator, EPrefabCollisionAlignment(2), EECSRegType(0), false);
    return;
}
UFUNCTION()
void Level_TriggerAbilitySignal(const FECSEntityAdapter &inout Entity, const FName &inout SignalName, const TSoftClassPtr<UEASAbility> &inout AbilityBP)
{
    int local_14 = 0;
    int local_9 = FAbilityUtils::GetAbilityIndexByClass(Entity.opImplConv(), AbilityBP.Get());
    if (local_9 < 0)
    {
        return;
    }
    bool local_11 = false;
    FAbilityUtils::GetAbilityInstance(Entity.opImplConv(), local_9, local_11);
    if (!(!(local_11)) && local_14)
    {
        FAbilityUtils::InvokeSignal(local_14, Entity.opImplConv(), SignalName, FFPTime(-1), true);
    }
    return;
}
UFUNCTION()
void Level_SoundSetStateByConfig(const FECSEntityAdapter &inout Entity, const TSoftObjectPtr<UAkStateValue> &inout StateValue)
{
    int local_46 = 0;
    if (StateValue.IsNull())
    {
        XWarning(ELog(0), "Level_SFX::SoundSetStateByConfig, StateValue is null.");
        return;
    }
    if (!(Entity.IsValid()))
    {
        XWarning(ELog(0), "Entity is not valid, Please check Entity pin on the Level_SFX::SoundSetStateByConfig Node.");
        return;
    }
    FECSEntity local_6 = Entity.opImplConv();
    Has local_14;
    bool local_1 = local_14.opCall();
    if (local_1)
    {
        Get local_18;
        local_6 = local_18.opCall().GetPlayerPawnEntity();
    }
    if (!(local_6.IsValid()))
    {
        XWarning(ELog(0), "Resolved entity is not valid, Please check Entity pin on the Level_SFX::SoundSetStateByConfig Node.");
        return;
    }
    local_46.SetState(StateValue);
    return;
}
UFUNCTION()
void Level_SoundPlayAudioEvent(const FECSEntityAdapter &inout Entity, const TSoftObjectPtr<UAkAudioEvent> &inout Event, const ESfxSourceType SourceType = ESfxSourceType::SourceType_Root, const bool bFollow = false, const EGameAudioEmitterPartType PartType = EGameAudioEmitterPartType::Root, const FName &inout Socket = n"None", const FVector &inout LocationOffset = FVector::ZeroVector, const FRotator &inout RotationOffset = FRotator::ZeroRotator, const bool bLocalSpace = true, const bool bIsLoop = false, const bool bLoopEnd = false)
{
    if (!(Entity.IsValid()))
    {
        XWarning(ELog(1), "Level_SoundPlayAudioEvent: Entity is not valid");
        return;
    }
    if (Event.IsNull())
    {
        XWarning(ELog(1), "Level_SoundPlayAudioEvent: Event is null");
        return;
    }
    if (!(Entity.GetWorld().IsValid()))
    {
        XWarning(ELog(1), "Level_SoundPlayAudioEvent: Entity world is invalid");
        return;
    }
    if (ECS::GetRuntimeInfo().IsServer)
    {
        FCE_LevelServerToClientAudioPlayRequest local_20;
        FFPTime local_12 = FFPTime(-1);
        FECSEntity local_18 = Entity.opImplConv();
        local_20.AudioEventName = FName(Event.GetAssetName());
        local_20.SourceType = SourceType;
        local_20.bFollow = bFollow;
        local_20.PartType = PartType;
        local_20.Socket = Socket;
        local_20.LocationOffset = LocationOffset;
        local_20.RotationOffset = RotationOffset;
        local_20.bLocalSpace = bLocalSpace;
        local_20.bIsLoop = bIsLoop;
        local_20.bLoopEnd = bLoopEnd;
        return;
    }
    FFPTime local_12_2 = FFPTime(-1);
    FECSEntity local_18_2 = Entity.opImplConv();
    FCE_LevelClientAudioPlayRequest local_32;
    local_32.AudioEventName = FName(Event.GetAssetName());
    local_32.SourceType = SourceType;
    local_32.bFollow = bFollow;
    local_32.PartType = PartType;
    local_32.Socket = Socket;
    local_32.LocationOffset = LocationOffset;
    local_32.RotationOffset = RotationOffset;
    local_32.bLocalSpace = bLocalSpace;
    local_32.bIsLoop = bIsLoop;
    local_32.bLoopEnd = bLoopEnd;
    return;
}
UFUNCTION()
void Level_SoundPlayAudioEventByName(const FECSEntityAdapter &inout Entity, const FName &inout EventName, const ESfxSourceType SourceType = ESfxSourceType::SourceType_Root, const bool bFollow = false, const EGameAudioEmitterPartType PartType = EGameAudioEmitterPartType::Root, const FName &inout Socket = n"None", const FVector &inout LocationOffset = FVector::ZeroVector, const FRotator &inout RotationOffset = FRotator::ZeroRotator, const bool bLocalSpace = true, const bool bIsLoop = false, const bool bLoopEnd = false)
{
    if (!(Entity.IsValid()))
    {
        XWarning(ELog(1), "Level_SoundPlayAudioEventByName: Entity is not valid");
        return;
    }
    if (EventName.IsNone())
    {
        XWarning(ELog(1), "Level_SoundPlayAudioEventByName: EventName is none");
        return;
    }
    FECSEntity local_6 = Entity.opImplConv();
    return;
}
UFUNCTION()
void Level_StartVengeance(const FECSEntityAdapter &inout Target, const FECSEntity &inout Killer)
{
    int local_14 = 0;
    ECS::GetContextTime();
    FECSEntity local_12 = Target.opImplConv();
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    local_14.Killer = Killer;
    local_14.SetbPredictable(false);
    return;
}
UFUNCTION()
FString Level_GetVengeanceVictimNames(const FECSEntityAdapter &inout Killer)
{
    FString local_4;
    int local_10 = 0;
    if (((Killer == ENTITY_NULL) || !(local_10)))
    {
        return "";
    }
    for (auto& local_30 : local_10.KillDataMap)
    {
        local_30;
        FECSEntityAdapter local_36;
        FString local_40 = BlueprintFunctions_Level::GetEntityPlayerName(local_36);
        FString local_44 = (local_40 + " ");
        FString local_44_2 = (local_40 + "000\n");
        local_4 += local_44_2;
    }
    return local_4;
}
UFUNCTION()
int Level_GetVengeanceVictimCount(const FECSEntityAdapter &inout Killer)
{
    return 0.GetTotalKillCount();
}
UFUNCTION()
void Level_SetMinimapIconVisible(const FECSEntityAdapter &inout Target, const bool bIsVisible)
{
    XError(ELog(0), "Level_SetMinimapIconVisible is not deprecated, use level spot instead");
    return;
}
UFUNCTION()
void Level_SetGuidingPathTargetToEntity(const FECSEntityAdapter &inout Target, const FECSEntity &inout Player)
{
    if (Target.IsValid())
    {
        FECSEntity local_10 = FASCommonUtils::GetUniquePlayerEntity(Player);
        if (ECS::GetRuntimeInfo().IsServer)
        {
            FGuidingPathUtils::ServerSetGuidingPathTargetEntity(Target.opImplConv(), local_10, true);
        }
        else
        {
            FC_GuidingPathManualUpdateTag local_16;
            Assign local_14;
            local_14.opCall(local_16);
        }
    }
    return;
}
UFUNCTION()
void Level_CancelGuidingPath(const FECSEntityAdapter &inout Player)
{
    if (ECS::GetRuntimeInfo().IsServer)
    {
        FASCommonUtils::GetUniquePlayerEntity(Player.opImplConv());
        Remove local_18;
        local_18.opCall();
        Remove local_22;
        local_22.opCall();
    }
    return;
}
UFUNCTION()
void Level_MarkEntity(const FECSEntityAdapter &inout RequesterPlayer, const FECSEntity &inout TargetEntity, const TDataObjectPtr<FMarkConfig> &inout MarkConfig)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    FECSEntity local_14 = FASCommonUtils::GetUniquePlayerEntity(RequesterPlayer.opImplConv());
    if (!(MarkUtil::IsEntityMarkedBySelf(local_14, TargetEntity.GetId())))
    {
        if (!(MarkConfig))
        {
            XError(ELog(53), "MarkConfig is invalid");
            return;
        }
        if (!(local_14.IsValid()))
        {
            XError(ELog(53), "RequesterPlayer is invalid");
            return;
        }
        if (!(TargetEntity.IsValid()))
        {
            XError(ELog(53), "TargetEntity is invalid");
            return;
        }
        if (!(MarkUtil::CanMarkEntity(local_14, TargetEntity)))
        {
            XError(ELog(53), FString().Append("Player ").Append(local_14).Append(" can't mark entity ").Append(TargetEntity));
            return;
        }
        FECSEntity local_6 = MarkUtil::MarkEntity(local_14, TargetEntity, MarkConfig);
    }
    return;
}
UFUNCTION()
void Level_CancelMarkAndGuidingPathOnEntity(const FECSEntityAdapter &inout Target)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    FECSEntity local_6 = Target.opImplConv();
    if (!(local_6.IsValid()))
    {
        return;
    }
    Get local_14;
    const FC_Marked& local_16 = local_14.opCall();
    if (local_16)
    {
        TArray<FECSEntity> local_20 = local_16.MarkPlayers;
        for (auto& local_34 : local_20)
        {
            MarkUtil::RemoveMark(local_34, local_6);
        }
    }
    Get local_38;
    const FC_GuidingPathTarget& local_40 = local_38.opCall();
    GetDefaulted local_44;
    if (local_40)
    {
        TArray<FECSEntity> local_20 = local_40.GuidingPlayers;
        for (auto& local_34 : local_20)
        {
            if ((FECSEntity(local_44.opCall().GetTargetEntity()) == local_6))
            {
                FGuidingPathUtils::ServerCancelGuidingPath(local_34);
            }
        }
    }
    return;
}
UFUNCTION()
void Level_SetHUDIndicatorDefaultShow(const FECSEntityAdapter &inout Entity, const bool bShow)
{
    XWarning(ELog(22), "Level_SetHUDIndicatorDefaultShow е·Іеєџејѓдё”дёЌе†Ќз”џж•€пјљHUDIndicatorSystem е·Іиў«еџєдєЋ Spot зљ„ Indicator / HeadsUpDisplay дЅ“зі»еЏ–д»ЈгЂ‚");
    return;
}
UFUNCTION()
void Level_SendMessageHint(const FECSEntityAdapter &inout Entity, const TDataObjectPtr<FMessageHintConfig> &inout MessageHintConfig, const TArray<FTextArgument> &inout CustomArguments = TArray<FTextArgument>())
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    if (!(Entity.IsValid()))
    {
        XError(ELog(0), "Entity is invalid");
        return;
    }
    if (!(MessageHintConfig))
    {
        XError(ELog(0), "MessageHintConfig is invalid");
        return;
    }
    MessageHintUtils::ShowMessageHint(Entity.opImplConv(), MessageHintConfig, CustomArguments);
    return;
}
UFUNCTION()
void Level_SendMessageHintToTeam(const FECSEntityAdapter &inout Entity, const TDataObjectPtr<FMessageHintConfig> &inout MessageHintConfig, const TArray<FTextArgument> &inout CustomArguments = TArray<FTextArgument>())
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    if (!(Entity.IsValid()))
    {
        XError(ELog(0), "Entity is invalid");
        return;
    }
    if (!(MessageHintConfig))
    {
        XError(ELog(0), "MessageHintConfig is invalid");
        return;
    }
    TArray<FECSEntity> local_10 = FTeamUtils::GetTeammates(Entity.opImplConv());
    if (local_10.IsEmpty())
    {
        local_10.Add(Entity.opImplConv());
    }
    for (auto& local_30 : local_10)
    {
        MessageHintUtils::ShowMessageHint(local_30, MessageHintConfig, CustomArguments);
    }
    return;
}
UFUNCTION()
void Level_SendMessageHintToArea(const FVector &inout Center, const TDataObjectPtr<FMessageHintConfig> &inout MessageHintConfig, const TArray<FTextArgument> &inout CustomArguments = TArray<FTextArgument>(), const float32 Range = 2000.0f)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    if (!(MessageHintConfig))
    {
        XError(ELog(0), "MessageHintConfig is invalid");
        return;
    }
    TArray<FECSEntity> local_6 = BlueprintFunctions_Common::GetAllPlayerEntitiesInRangeAS(Center, Range, false);
    for (auto& local_24 : local_6)
    {
        MessageHintUtils::ShowMessageHint(local_24, MessageHintConfig, CustomArguments);
    }
    return;
}
UFUNCTION()
void Level_SendMessageHintToRegionVolumn(const AECSRegionVolume RegionVolume, const TDataObjectPtr<FMessageHintConfig> &inout MessageHintConfig, const TArray<FTextArgument> &inout CustomArguments = TArray<FTextArgument>())
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    if (!(IsValid(RegionVolume)))
    {
        XError(ELog(0), "RegionVolumn is invalid");
        return;
    }
    if (!(MessageHintConfig))
    {
        XError(ELog(0), "MessageHintConfig is invalid");
        return;
    }
    TArray<FECSEntity> local_6;
    BlueprintFunctions_Level::GetAllPlayerProxys(local_6);
    FECSEntity local_10 = FECSRegionVolumeUtils::GetRegionVolumeEntity(RegionVolume);
    for (auto& local_28 : local_6)
    {
        FASCommonUtils::GetUniqueAvatarPawnEntity(local_28);
        Get local_36;
        const FC_Overlapping& local_38 = local_36.opCall();
        if (local_38)
        {
            if (local_38.OverlappingEntities.Contains(local_10))
            {
                MessageHintUtils::ShowMessageHint(local_28, MessageHintConfig, CustomArguments);
            }
        }
    }
    return;
}
UFUNCTION()
void Level_SetHUDIndicatorShow(const FECSEntityAdapter &inout Entity, const bool bShow)
{
    XWarning(ELog(22), "Level_SetHUDIndicatorShow е·Іеєџејѓдё”дёЌе†Ќз”џж•€пјљHUDIndicatorSystem е·Іиў«еџєдєЋ Spot зљ„ Indicator / HeadsUpDisplay дЅ“зі»еЏ–д»ЈгЂ‚");
    return;
}
UFUNCTION()
void Level_SetHUDIndicatorConfig(const FECSEntityAdapter &inout Entity, const float32 ZOffset = 0)
{
    XWarning(ELog(22), "Level_SetHUDIndicatorConfig е·Іеєџејѓдё”дёЌе†Ќз”џж•€пјљHUDIndicatorSystem е·Іиў«еџєдєЋ Spot зљ„ Indicator / HeadsUpDisplay дЅ“зі»еЏ–д»ЈгЂ‚");
    return;
}
UFUNCTION()
void Level_ActivateCommissionObjective(const TDataObjectPtr<FObjectiveConfig> &inout ObjectiveConfig, const bool bActivateGuide = true, const FObjectiveFinishDelegate &inout ObjectiveFinishCallback = FObjectiveFinishDelegate())
{
    if (!(ObjectiveConfig.IsSet()))
    {
        XError(ELog(0), "ObjectiveConfig is invalid");
        return;
    }
    int local_4 = CommissionUtils::ServerActivateCommissionObjective(ObjectiveConfig, bActivateGuide);
    if (ObjectiveFinishCallback.IsBound())
    {
        ULevelEventManager::Get().RegisterObjectiveFinishCallback(local_4, ObjectiveFinishCallback);
    }
    return;
}
UFUNCTION()
void Level_DeactivateCommissionObjective(const TDataObjectPtr<FObjectiveConfig> &inout ObjectiveConfig)
{
    if (!(ObjectiveConfig.IsSet()))
    {
        XError(ELog(0), "ObjectiveConfig is invalid");
        return;
    }
    CommissionUtils::ServerDeactivateCommissionObjective(ObjectiveConfig);
    return;
}
UFUNCTION()
void Level_ActivateAdditionalCommissionObjective(const TDataObjectPtr<FObjectiveSingleConfig> &inout ChildObjectiveConfig, const FObjectiveFinishDelegate &inout ObjectiveFinishCallback = FObjectiveFinishDelegate())
{
    if (!(ChildObjectiveConfig.IsSet()))
    {
        XError(ELog(0), "ChildObjectiveConfig is invalid");
        return;
    }
    int local_4 = CommissionUtils::ServerActivateAdditionalCommissionObjective(ChildObjectiveConfig);
    if (ObjectiveFinishCallback.IsBound() && (local_4 > 0))
    {
        ULevelEventManager::Get().RegisterObjectiveFinishCallback(local_4, ObjectiveFinishCallback);
    }
    return;
}
UFUNCTION()
TDataObjectPtr<FWorldAreaConfig> Level_GetCommissionStartArea()
{
    return CommissionUtils::GetCommissionStartArea();
}
UFUNCTION()
TArray<FECSEntity> Level_DropItemFromConfig(const TDataObjectPtr<FDropItemConfigBase> &inout DropBaseConfig, const FECSEntity &inout DropSourceEntity, const FECSEntity &inout DropTriggerBy, const bool bHasOverridePosition, const FVector &inout OverridePosition)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return TArray<FECSEntity>();
    }
    FDropMovementConfigData local_30;
    return DropItemsUtils::DropItemsFromBPCaller(DropBaseConfig, local_30, DropSourceEntity, DropTriggerBy, bHasOverridePosition, OverridePosition);
}
UFUNCTION()
bool Level_IsCommissionFinished()
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Has local_6;
    if (local_6.opCall())
    {
        return true;
    }
    return false;
}
UFUNCTION()
bool Level_IsCommissionSuccess()
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Has local_6;
    bool local_7 = local_6.opCall();
    if (local_7)
    {
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        Get local_12;
        return local_12.opCall().GetbSuccess();
    }
    return false;
}
UFUNCTION()
float32 Level_GetCommissionRemainingTimeSeconds()
{
    int local_12 = 0;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if (!(local_2.IsValid()))
    {
        return -1.0f;
    }
    if (!(local_12))
    {
        return -1.0f;
    }
    FFPTime local_14 = local_12.CommissionTimeoutTime;
    if (local_14.opCmp(0.0) <= 0)
    {
        return -1.0f;
    }
    GetDefaulted local_24;
    FFPTime local_20 = FFPTime(local_24.opCall().Time);
    FFPTime local_14_2 = local_12.CommissionTimeoutTime;
    return FMath::Max(float32(((local_14_2 - local_20).ToSeconds())), 0.0f);
}
UFUNCTION()
void Level_UnloadAllRandomEvents()
{
    LevelRandomEventUtils::DeactivateAllRandomEventDatalayers();
    return;
}
UFUNCTION()
TSet<EKLDataLayerFilterTags> Level_GetCurrentLoadFilterTags()
{
    TSet<EKLDataLayerFilterTags> __return;
    if (FLevelUtils::GetCurrentLevelInfoConfig(nullptr))
    {
    }
    else
    {
        __return = TSet<EKLDataLayerFilterTags>();
    }
    return __return;
}
UFUNCTION()
void Level_SendCustomLevelValueEvent(const FName &inout CustomName, const int Count)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    FLevelUtils::SendCustomLevelValueEvent(CustomName, Count);
    return;
}
UFUNCTION()
void Level_SetVegenfulSpirit(const FECSEntity &inout VegenfulSpiritEntity, const FString &inout DisplayName)
{
    int local_8 = 0;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    local_8.SetVegenfulSpiritEntity(VegenfulSpiritEntity);
    local_8.SetDisplayName(DisplayName);
    XLog(ELog(22), FString().Append("Level_SetVegenfulSpirit: Set VegenfulSpiritEntity=").Append(VegenfulSpiritEntity).Append(", DisplayName=").Append(DisplayName));
    return;
}
UFUNCTION()
bool Level_LoadSingleUnit(const FLevelUnitReference &inout UnitRef)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    bool __r; return __r;
}
UFUNCTION()
bool Level_UnloadSingleUnit(const FLevelUnitReference &inout UnitRef)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    bool __r; return __r;
}
UFUNCTION()
bool Level_IsUnitLoaded(const FLevelUnitReference &inout UnitRef)
{
    if (!(UnitRef.IsValid()))
    {
        return false;
    }
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    Has local_8;
    if (!(local_8.opCall()))
    {
        return false;
    }
    FECSWorldPtr local_4_2 = ECS::GetECSWorld();
    FECSEntityId local_16;
    return (!((local_16 == ENTITY_ID_NULL)));
}
UFUNCTION()
FLevelUnitReference Level_GetUnitReferenceFromPrefab(const AIdentifiableECSPrefab PrefabActor)
{
    FLevelUnitReference local_2;
    if (PrefabActor == nullptr)
    {
        return local_2;
    }
    local_2.GUID = PrefabActor.GetConfigGUID();
    return local_2;
}
UFUNCTION()
void Level_DisableSystemControl(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FSystemControlConfig> &inout SystemControlConfig)
{
    int local_13 = 0;
    if (!(PlayerEntity.IsValid()))
    {
        XError(ELog(73), "Level_DisableSystemControl: PlayerEntity is invalid!");
        return;
    }
    if (!(SystemControlConfig.IsSet()))
    {
        XError(ELog(73), "Level_DisableSystemControl: SystemControlConfig is not set!");
        return;
    }
    FFPTime local_8 = FFPTime(-1);
    FCE_LBPDisableSystemControl local_12;
    local_12.SystemDataId = local_13;
    FString local_18;
    local_12.ForbiddenTips = local_18;
    XLog(ELog(73), local_18.Append("Level_DisableSystemControl: Sent disable event for SystemDataId=").Append(local_12.SystemDataId).Append(" to Player=").Append(PlayerEntity.GetIdValue()));
    return;
}
UFUNCTION()
void Level_EnableSystemControl(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FSystemControlConfig> &inout SystemControlConfig)
{
    int local_13 = 0;
    if (!(PlayerEntity.IsValid()))
    {
        XError(ELog(73), "Level_EnableSystemControl: PlayerEntity is invalid!");
        return;
    }
    if (!(SystemControlConfig.IsSet()))
    {
        XError(ELog(73), "Level_EnableSystemControl: SystemControlConfig is not set!");
        return;
    }
    FFPTime local_8 = FFPTime(-1);
    FCE_LBPEnableSystemControl local_12;
    local_12.SystemDataId = local_13;
    XLog(ELog(73), FString().Append("Level_EnableSystemControl: Sent enable event for SystemDataId=").Append(local_12.SystemDataId).Append(" to Player=").Append(PlayerEntity.GetIdValue()));
    return;
}
UFUNCTION()
void Level_ShowBornLevelExitBtn()
{
    int local_16 = 0;
    if (!(ECS::GetECSWorld().IsValid()))
    {
        XError(ELog(22), "Level_ShowBornLevelExitBtn: ECSWorld is invalid!");
        return;
    }
    Has local_10;
    if (!(local_10.opCall()))
    {
        XError(ELog(22), "Level_ShowBornLevelExitBtn: FCS_GameMode is not found!");
        return;
    }
    local_16.SetbHiddenExitLevel(false);
    return;
}
UFUNCTION()
TSubclassOf<AKLLevelScriptActor> Level_GetTrainingLBPClass()
{
    bool local_5;
    if (!(ECS::GetECSWorld().IsValid()))
    {
        local_5 = false;
    }
    else
    {
        Has local_10;
        local_5 = local_10.opCall();
    }
    if (local_5)
    {
        return TSubclassOf<AKLLevelScriptActor>();
    }
    XError(ELog(22), "Level_GetTrainingLBPClass: FCS_TrainingInfo is not found!");
    return (TSubclassOf<AKLLevelScriptActor>(nullptr));
}
UFUNCTION()
void Level_FinishTraining()
{
    UGameDSConnectionSubsystem local_2 = UGameDSConnectionSubsystem::Get();
    if (local_2 == nullptr || !(local_2.IsConnectedToGameServer()))
    {
        XWarning(ELog(22), "Level_FinishTraining: not connected to game server, skip FinishTrainingReq");
        return;
    }
    FECSWorldPtr local_10 = ECS::GetECSWorld();
    if (!(local_10.IsValid()))
    {
        XError(ELog(22), "Level_FinishTraining: ECSWorld is invalid!");
        return;
    }
    int local_13 = 0;
    FPbDsGlobalInfo local_24 = local_2.GetDSGlobalInfo();
    if (local_24.GetTrainingGlobalInfo().IsValid())
    {
        local_13 = local_24.GetTrainingGlobalInfo().GetTrainingInfoId();
    }
    if (local_13 == 0)
    {
        XError(ELog(22), "Level_FinishTraining: TrainingDataId is 0!");
        return;
    }
    FECSRuntimeView local_82 = local_10.GetRuntimeView(EECSRuntimeViewType(2));
    Include local_86;
    local_86.opCall();
    FECSRuntimeViewIterator local_120 = local_82.Iterator();
    for (; local_120.CanProceed;)
    {
        const FECSEntity& local_156 = local_120.Proceed();
        local_2.SendFinishTrainingReq(local_156, local_13);
    }
    return;
}
UFUNCTION()
void Level_SendNpcChatDialogue(const FECSEntity &inout NpcEntity, const TDataObjectPtr<FDialogueLineConfig> &inout DialogueLineConfig, const bool bUseSpotName = false)
{
    if (!(NpcEntity.IsValid()))
    {
        XError(ELog(22), "Level_SendNpcChatDialogue: NpcEntity is invalid!");
        return;
    }
    if (!(DialogueLineConfig.IsSet()))
    {
        XError(ELog(22), "Level_SendNpcChatDialogue: DialogueLineConfig is invalid!");
        return;
    }
    if (!(ECS::GetECSWorld().IsValid()))
    {
        XError(ELog(22), "Level_SendNpcChatDialogue: ECSWorld is invalid!");
        return;
    }
    FCE_DSDispatchChat local_12;
    local_12.DispatchKind = EChatDSDispatchKind(1);
    local_12.DialogueLineConfig = DialogueLineConfig;
    local_12.bUseSpotName = bUseSpotName;
    return;
}
UFUNCTION()
void Level_RequestRandomFriendName(const FECSEntityAdapter &inout PlayerEntity, const bool bFallbackToSelfName = true, const FRandomFriendNameDelegate &inout Callback = FRandomFriendNameDelegate())
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        XWarning(ELog(22), "Level_RequestRandomFriendName should only be called on server");
        return;
    }
    FECSEntity local_14 = FASCommonUtils::GetUniquePlayerEntity(PlayerEntity.opImplConv());
    if (!(local_14.IsValid()))
    {
        XError(ELog(22), "Level_RequestRandomFriendName: invalid PlayerEntity");
        return;
    }
    if (Callback.IsBound())
    {
        FRandomFriendNameRequestContext local_20;
        local_20.Callback = Callback;
        local_20.bFallbackToSelfName = bFallbackToSelfName;
        ULevelEventManager::Get().RegisterRandomFriendNameCallback(local_14, local_20);
    }
    UGameDSConnectionSubsystem local_24 = UGameDSConnectionSubsystem::Get();
    if (local_24 == nullptr || !(local_24.IsConnectedToGameServer()))
    {
        ULevelEventManager::Get().NotifyRandomFriendNameResult(local_14, "");
    }
    else
    {
        local_24.SendGetRandomFriendNameReq(local_14);
    }
    return;
}
UFUNCTION()
void ServerRestockItemToInventory(const FECSEntityAdapter &inout PawnOrPlayerEntity)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    FECSEntity local_14 = FASCommonUtils::GetUniquePlayerEntity(PawnOrPlayerEntity.opImplConv());
    if (local_14.IsValid())
    {
        GameplayItemBankUtils::RestockItemToInventory(local_14);
    }
    return;
}
UFUNCTION()
void Level_OverrideCharacterLOD(const FECSEntity &inout PlayerEntity, const bool bOtherPlayerUseBetterLOD)
{
    int local_16 = 0;
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    if (FASCommonUtils::GetUniquePlayerEntity(PlayerEntity).IsValid())
    {
        local_16.SetbOtherPlayerUseBetterLOD(bOtherPlayerUseBetterLOD);
    }
    return;
}
}

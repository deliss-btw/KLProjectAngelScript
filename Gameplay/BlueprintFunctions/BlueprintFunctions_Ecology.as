
namespace NPCDailyRouteRuntimeLibrary
{
FName GetEffectiveRouteSourceId(const ANPCPathRouteActor RouteActor)
{
    if (RouteActor == nullptr)
    {
        return NAME_None;
    }
    if (!(RouteActor.RouteSourceId.IsNone()))
    {
        return RouteActor.RouteSourceId;
    }
    return RouteActor.RouteName;
}
FName GetEffectivePointId(const UNPCPathRoutePointComponent PointComponent)
{
    if (PointComponent == nullptr)
    {
        return NAME_None;
    }
    if (!(PointComponent.PointId.IsNone()))
    {
        return PointComponent.PointId;
    }
    return PointComponent.PointName;
}
ANPCPathRouteActor FindRouteActor(const FName &inout RouteSourceId)
{
    ANPCPathRouteActor local_4;
    ANPCPathRouteActor local_26;
    if (RouteSourceId.IsNone())
    {
        return nullptr;
    }
    TArray<AActor> local_8;
    Gameplay::GetAllActorsOfClass(__GetWorldContext(), ANPCPathRouteActor, local_8);
    for (auto local_24 : local_8)
    {
        local_4 = Cast<ANPCPathRouteActor>(local_24);
        local_26 = local_4;
        if (local_26 != nullptr && (NPCDailyRouteRuntimeLibrary::GetEffectiveRouteSourceId(local_26) == RouteSourceId))
        {
            return local_26;
        }
    }
    return local_4;
}
UNPCPathRoutePointComponent FindRoutePoint(const ANPCPathRouteActor RouteActor, const FName &inout PointId)
{
    if (RouteActor == nullptr || PointId.IsNone())
    {
        return nullptr;
    }
    TArray<UNPCPathRoutePointComponent> local_14 = RouteActor.GetComponentsByClass(UNPCPathRoutePointComponent);
    for (auto local_28 : local_14)
    {
        if (local_28 != nullptr && (NPCDailyRouteRuntimeLibrary::GetEffectivePointId(local_28) == PointId))
        {
            return local_28;
        }
    }
    UNPCPathRoutePointComponent local_6;
    return local_6;
}
bool GetRoutePointInfo(const UObject WorldContextObject, const FName &inout RouteSourceId, const FName &inout PointId, FNPCDailyRouteRuntimePointInfo &out OutInfo)
{
    FNPCDailyRouteRuntimePointInfo local_10;
    OutInfo = local_10;
    OutInfo = local_10;
    ANPCPathRouteActor local_22 = NPCDailyRouteRuntimeLibrary::FindRouteActor(RouteSourceId);
    UNPCPathRoutePointComponent local_26 = NPCDailyRouteRuntimeLibrary::FindRoutePoint(local_22, PointId);
    if (local_26 == nullptr)
    {
        return false;
    }
    OutInfo.PointId = NPCDailyRouteRuntimeLibrary::GetEffectivePointId(local_26);
    OutInfo.Location = local_26.GetWorldLocation();
    return true;
}
bool GetRouteConnectionInfo(const UObject WorldContextObject, const FName &inout RouteSourceId, const FName &inout FromPointId, const FName &inout ToPointId, FNPCDailyRouteRuntimeConnectionInfo &out OutInfo)
{
    UNPCPathRouteComponent local_22;
    bool local_23;
    int local_100;
    FNPCDailyRouteRuntimeConnectionInfo local_6;
    OutInfo = local_6;
    OutInfo = local_6;
    ANPCPathRouteActor local_14 = NPCDailyRouteRuntimeLibrary::FindRouteActor(RouteSourceId);
    if (local_14 != nullptr)
    {
        local_22 = local_14.RouteComponent;
    }
    else
    {
    }
    UNPCPathRouteComponent local_18 = local_22;
    if (local_18 == nullptr || FromPointId.IsNone() || ToPointId.IsNone())
    {
        return false;
    }
    for (auto& local_38 : local_18.Connections)
    {
        local_23 = (FName(local_38.FromPointName) == FromPointId) && (FName(local_38.ToPointName) == ToPointId);
        bool local_39 = (FName(local_38.FromPointName) == ToPointId) && (FName(local_38.ToPointName) == FromPointId);
        if (!(local_23) && !(local_39))
        {
            continue;
        }
        if (!(local_38.bGenerateSpline) || !(local_38.bValid) || (local_38.LocalSplinePoints.Num() < 2) || (local_38.Length <= 0.0001f))
        {
            return false;
        }
        OutInfo.bValid = true;
        FTransform local_96 = local_18.GetWorldTransform();
        int local_97 = 0;
        for (; local_97 < local_38.LocalSplinePoints.Num(); )
        {
            if (local_39)
            {
                local_100 = (local_38.LocalSplinePoints.Num() - 1) - local_97;
            }
            else
            {
                local_100 = local_97;
            }
            OutInfo.WorldPathPoints.Add(local_96.TransformPosition(local_38.LocalSplinePoints[local_100]));
            ++local_97;
        }
        return true;
    }
    return false;
}
}
namespace BlueprintFunctions_Ecology
{
UFUNCTION()
void AddFlockChangeAreaRequest(const FECSEntity &inout Entity, const FResourceRequestFilterConfig &inout SearchRequest, const FGameplayTag &inout ReasonTag, const bool bNeedChangeAreaMessage, const FChangeAreaMessageInfo &inout MessageInfo, const int Priority = 0, const bool bForceUpdateTargetResource = true)
{
    FECSEntity local_4 = Entity;
    Get local_8;
    const FC_FlockMember& local_10 = local_8.opCall();
    if (local_10)
    {
        local_4 = FECSEntity(local_10.FlockProxyEntity);
    }
    if (!(local_4.IsValid()))
    {
        return;
    }
    FGameplayTag local_20;
    if (ReasonTag.IsValid())
    {
        local_20 = ReasonTag;
    }
    else
    {
        local_20 = FEcologyGameplayTagDefine::Ecology_LBPChangeAreaReasonDefaultTag;
    }
    FEcologyBehaviorUtils::AddFlockChangeAreaRequest(local_4, SearchRequest, local_20, FEcologyGameplayTagDefine::Ecology_LBPChangeAreaSourceDefaultTag, false, MessageInfo, 25000.0f, 50000.0f, Priority, bNeedChangeAreaMessage, bForceUpdateTargetResource);
    return;
}
UFUNCTION()
void MuteBossAutoChangeArea(const FECSEntity &inout Entity, const bool ReleaseMute, const FName &inout Key)
{
    if ((Key == NAME_None))
    {
        XWarning(ELog(30), FString().Append("MuteBossAutoChangeArea: Key is NAME_None, Entity=").Append(Entity.GetIdValue()).Append(", ReleaseMute=").Append(ReleaseMute));
    }
    FECSEntity local_12 = Entity;
    Get local_16;
    const FC_FlockMember& local_18 = local_16.opCall();
    if (local_18)
    {
        local_12 = FECSEntity(local_18.FlockProxyEntity);
    }
    if (!(local_12.IsValid()))
    {
        return;
    }
    if (!(ReleaseMute))
    {
        FC_MuteBossAutoChangeAreaKeys& local_28;
        if (local_28.ActiveKeys.Contains(Key))
        {
            XWarning(ELog(30), FString().Append("MuteBossAutoChangeArea: duplicate Mute Key '").Append(Key).Append("', Flock=").Append(local_12.GetIdValue()));
        }
        local_28.ActiveKeys.Add(Key);
    }
    else
    {
        FC_MuteBossAutoChangeAreaKeys& local_28;
        Modify local_32;
        local_28 = local_32.opCall();
        if (local_28)
        {
            if (!(local_28.ActiveKeys.Contains(Key)))
            {
                int local_7 = local_12.GetIdValue();
                XWarning(ELog(30), FString().Append("MuteBossAutoChangeArea: Release non-existent Key '").Append(Key).Append("', Flock=").Append(local_7));
            }
            else
            {
            }
            if (local_28.ActiveKeys.Num() == 0)
            {
                Remove local_38;
                local_38.opCall();
            }
        }
        else
        {
            XWarning(ELog(30), FString().Append("MuteBossAutoChangeArea: Release Key '").Append(Key).Append("' but no mute exists, Flock=").Append(local_12.GetIdValue()));
        }
    }
    return;
}
UFUNCTION()
void RestraintLockSpecialControl(const FECSEntity &inout Entity, const FECSEntityId &inout ResourceId)
{
    int local_32 = 0;
    AECSRegionVolume local_34;
    int local_40 = 0;
    FECSEntity local_4 = Entity;
    Get local_8;
    const FC_FlockMember& local_10 = local_8.opCall();
    if (local_10)
    {
        local_4 = FECSEntity(local_10.FlockProxyEntity);
    }
    if (!(local_4.IsValid()))
    {
        return;
    }
    if (!(FECSEntity(ResourceId).IsValid()))
    {
        return;
    }
    bool local_17 = false;
    EFlockBehaviorState local_18 = EFlockBehaviorState(0);
    FEcologyBehaviorUtils::GetFlockMainState(local_4, local_17, local_18);
    if (!(local_17))
    {
        return;
    }
    if (int(local_18) == 2)
    {
        FEcologyBehaviorUtils::FlockClaimNewResource(local_4, FECSEntity(ResourceId), true);
        FEcologyBehaviorUtils::ModifyFlockEmergencyState(local_4, false);
        FEcologySceneInfoUtils::FindFlockTargetCombatRegion(local_4);
        if (!(local_32))
        {
            return;
        }
        if (!(local_40))
        {
            return;
        }
        AActor local_42;
        local_34 = (Cast<AECSRegionVolume>(local_42));
        if (local_34 == nullptr)
        {
            return;
        }
        if (local_34.QuickEncompassesPoint(local_32.GetPosition()))
        {
            FEcologyBehaviorUtils::ModifyFlockState(local_4, EFlockBehaviorState(0));
        }
    }
    return;
}
UFUNCTION()
void GetEntityCombatTime(const FECSEntity &inout Entity, bool &out IsInCombat, float32 &out CombatTime)
{
    IsInCombat = false;
    CombatTime = 0.0f;
    if (!(Entity.IsValid()))
    {
        CombatTime = -1.0f;
        IsInCombat = false;
        return;
    }
    bool local_3 = FECSEntity::Has<FC_AICombatTag>(Entity).opCall();
    if (local_3)
    {
        Get local_12;
        const FC_CombatState& local_14 = local_12.opCall();
        if (local_14)
        {
            CombatTime = float32(((FFPTime(Entity.GetWorld().GetFixedTime().Time) - local_14.SelfCombatSession.EnterCombatTime).ToSeconds()));
            IsInCombat = true;
            return;
        }
    }
    CombatTime = -1.0f;
    IsInCombat = false;
    return;
}
UFUNCTION()
TArray<FECSEntity> SearchFlock(const FCreatureSearchRequest &inout Request, const FECSEntity &inout Requester = FECSEntity(ENTITY_ID_NULL))
{
    TArray<FEntitySearchResult> local_4;
    int local_7 = FEcologySceneInfoUtils::RequestCreature(Requester, Request, local_4, false);
    TSet<FECSEntityId> local_28;
    for (auto& local_42 : local_4)
    {
        FECSEntity local_46 = FECSEntity(local_42.EntityId);
        Get local_54;
        const FC_FlockMember& local_56 = local_54.opCall();
        if (local_56)
        {
            local_28.Add(local_56.FlockProxyEntity);
        }
    }
    TArray<FECSEntity> local_60;
    for (auto& local_78 : local_28)
    {
        FECSEntity local_50 = FECSEntity(local_78);
        if (local_50)
        {
            local_60.Add(local_50);
        }
    }
    return local_60;
}
UFUNCTION()
TArray<FECSEntity> SearchCreature(const FCreatureSearchRequest &inout Request, const FECSEntity &inout Requester = FECSEntity(ENTITY_ID_NULL))
{
    TArray<FEntitySearchResult> local_4;
    int local_7 = FEcologySceneInfoUtils::RequestCreature(Requester, Request, local_4, false);
    TArray<FECSEntity> local_12;
    for (auto& local_26 : local_4)
    {
        FECSEntity local_30 = FECSEntity(local_26.EntityId);
        if (local_30)
        {
            local_12.Add(local_30);
        }
    }
    return local_12;
}
UFUNCTION()
FECSEntity SearchFirstCreature(const FCreatureSearchRequest &inout Request, const FECSEntity &inout Requester = FECSEntity(ENTITY_ID_NULL))
{
    TArray<FEntitySearchResult> local_4;
    if (FEcologySceneInfoUtils::RequestCreature(Requester, Request, local_4, true) > 0)
    {
        return local_4[0].GetEntity();
    }
    return ENTITY_NULL;
}
UFUNCTION()
void TeleportEcologyCreatureToTransform(const FECSEntityAdapter &inout Entity, const FVector &inout TargetLocation, const FRotator &inout TargetRotation, const bool KeepESM = false)
{
    FEcologyUtils::TeleportEcologyCreatureToTransform(Entity.opImplConv(), TargetLocation, TargetRotation, KeepESM);
    return;
}
UFUNCTION()
bool IsExperimentalDebug()
{
    return FEcologyMisc::CVar_Ecology_Experimental.GetBool();
}
UFUNCTION()
void MakeCorpseWaitDestroy(const FECSEntity &inout CorpseEntity)
{
    if (!(CorpseEntity))
    {
        return;
    }
    Has local_6;
    if (!(local_6.opCall()))
    {
        return;
    }
    FEcologyLifeCycleUtils::MarkEntityWaitDestroy(CorpseEntity, ECS::GetECSWorld().GetLocalTime().Time);
    return;
}
FECSEntity SpawnMonsterByMonsterId(const TDataObjectPtr<FMonsterMainConfig> &inout MonsterConfig, const FVector &inout Position, const FQuat &inout Rotation, const UDataTable DifficultyLevelConfigOverride = nullptr, const FName &inout SpawnInitEntryName = NAME_None, const bool bMuteDrop = false)
{
    if (MonsterConfig)
    {
        FEcologyCreatureSpawnerContext local_64;
        local_64.TargetLocation = Position;
        local_64.TargetRotation = Rotation;
        local_64.SpawnInitEntryName = SpawnInitEntryName;
        local_64.MuteDropItemMask = bMuteDrop ? 3 : 0;
        FECSEntity local_100 = FEcologySpawnerUtils::SpawnCreatureByContext(local_64);
        if ((local_100 && (DifficultyLevelConfigOverride != nullptr)))
        {
        }
        return local_100;
    }
    return FECSEntity();
}
UFUNCTION()
FECSEntity SpawnNPCByNPCConfig(const TDataObjectPtr<FNPCMainConfig> &inout NPCConfig, const FVector &inout Position, const FQuat &inout Rotation, const UDataTable DifficultyLevelConfigOverride = nullptr, const FName &inout SpawnInitEntryName = NAME_None)
{
    if (NPCConfig)
    {
        FEcologyCreatureSpawnerContext local_64;
        local_64.TargetLocation = Position;
        local_64.TargetRotation = Rotation;
        local_64.SpawnInitEntryName = SpawnInitEntryName;
        FECSEntity local_98 = FEcologySpawnerUtils::SpawnCreatureByContext(local_64);
        if ((local_98 && (DifficultyLevelConfigOverride != nullptr)))
        {
        }
        return local_98;
    }
    return FECSEntity();
}
UFUNCTION()
FECSEntity BP_SpawnNPCInValidPos(const TDataObjectPtr<FNPCMainConfig> &inout NPCConfig, const FVector &inout Location, const FRotator &inout Rotation, const FEntityCreateFinishDelegate &inout OnCreateFinish, const float32 MaxNearbyRadius = 500.0f, const float32 StepLength = 50.0f, const bool bEnableNoValidPos = true, const UDataTable DifficultyLevelConfigOverride = nullptr, const FName &inout SpawnInitEntryName = NAME_None)
{
    FECSEntity local_8 = BlueprintFunctions_Ecology::SpawnNPCInValidPos(NPCConfig, Location, Rotation, MaxNearbyRadius, StepLength, bEnableNoValidPos, DifficultyLevelConfigOverride, SpawnInitEntryName);
    if (!((local_8 == ENTITY_NULL)) && OnCreateFinish.IsBound())
    {
        ULevelEventManager::Get().RegisterCreatureCreateFinishCallback(local_8, OnCreateFinish);
    }
    return local_8;
}
FECSEntity SpawnNPCInValidPos(const TDataObjectPtr<FNPCMainConfig> &inout NPCConfig, const FVector &inout Location, const FRotator &inout Rotation, const float32 MaxNearbyRadius = 500.0f, const float32 StepLength = 50.0f, const bool bEnableNoValidPos = true, const UDataTable DifficultyLevelConfigOverride = nullptr, const FName &inout SpawnInitEntryName = NAME_None)
{
    bool local_1 = !(ECS::GetRuntimeInfo().IsServer);
    if (local_1)
    {
        return ENTITY_NULL;
    }
    if (!(NPCConfig))
    {
        local_1 = false;
    }
    else
    {
        local_1 = GetCombatConfig();
    }
    if (local_1)
    {
        bool local_61;
        const FNPCMainConfig& local_4;
        bool local_2;
        TSubclassOf<ACharacterPrefab> local_6;
        TDataObjectPtr<FNPCSkinOverride> local_30;
        local_30 = local_4.GetSkinOverride();
        local_2 = !((local_30 == nullptr));
        if (!(local_2))
        {
            local_2 = false;
        }
        else
        {
            local_1 = !local_1;
            local_2 = local_1;
        }
        TSubclassOf<ACharacterPrefab> local_56;
        local_6 = local_2 ? local_56 : local_4.GetCombatPrefab();
        if ((local_6 == nullptr))
        {
            return FECSEntity();
        }
        local_61 = false;
        FECSEntityAdapter local_68;
        FVector local_94 = FASCommonUtils::FindLegalLocationByPrefab(local_61, local_68.opImplConv(), local_6.GetDefaultObject(), Location, Rotation.Quaternion(), MaxNearbyRadius, StepLength, 8, true);
        if (local_61 || bEnableNoValidPos)
        {
            return BlueprintFunctions_Ecology::SpawnNPCByNPCConfig(NPCConfig, local_94, Rotation.Quaternion(), DifficultyLevelConfigOverride, SpawnInitEntryName);
        }
    }
    return FECSEntity();
}
UFUNCTION()
FECSEntity SpawnNPCByDailyRouteConfig(const TDataObjectPtr<FNPCMainConfig> &inout NPCConfig, const TDataObjectPtr<FNPCDailyRouteConfig> &inout RouteConfig, const FRotator &inout Rotation = FRotator::ZeroRotator, const float32 MaxNearbyRadius = 500.0f, const float32 StepLength = 50.0f, const bool bEnableNoValidPos = true, const UDataTable DifficultyLevelConfigOverride = nullptr, const FName &inout SpawnInitEntryName = NAME_None)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return ENTITY_NULL;
    }
    if (!(NPCConfig.IsSet()))
    {
        XWarning(ELog(30), "SpawnNPCByDailyRouteConfig: NPC config is not set.");
        return FECSEntity();
    }
    FString local_10;
    bool local_1 = !(BlueprintFunctions_Ecology::ValidateNPCDailyRouteConfig(RouteConfig, local_10));
    if (local_1)
    {
        XWarning(ELog(30), FString().Append("SpawnNPCByDailyRouteConfig: invalid daily route config. ").Append(local_10));
        return FECSEntity();
    }
    FNPCDailyRouteRuntimePointInfo local_24;
    FName local_26;
    local_26.GetStartPointId();
    ECS::GetUEWorld();
    local_1 = !local_1;
    if (local_1)
    {
        local_26.GetStartPointId();
        FString local_14 = FString();
        return FECSEntity();
    }
    FECSEntity local_6 = BlueprintFunctions_Ecology::SpawnNPCInValidPos(NPCConfig, local_24.Location, Rotation, MaxNearbyRadius, StepLength, bEnableNoValidPos, DifficultyLevelConfigOverride, SpawnInitEntryName);
    if (local_6.IsValid())
    {
        Has local_38;
        bool local_1_2 = local_38.opCall();
        if (local_1_2)
        {
            FECSEntity::Get<FC_Transform> local_48;
            FVector local_44 = local_48.opCall().GetPosition();
            float32 local_53 = float32(local_44.Distance(local_24.Location));
            if (local_53 > FMath::Max(1.0f, local_24.AcceptRadius))
            {
                XWarning(ELog(30), FString().Append("SpawnNPCByDailyRouteConfig: spawned entity ").Append(local_6.GetIdValue()).Append(" at ").Append(local_44).Append(", route start is ").Append(local_24.Location).Append(", offset=").Append(FString::ApplyFormat(local_53, ".2f")).Append(", acceptRadius=").Append(FString::ApplyFormat(local_24.AcceptRadius, ".2f")).Append("; route will move to start point first."));
            }
            else
            {
                FString local_60 = FString::ApplyFormat(local_53, ".2f");
                local_26.GetStartPointId();
                XLog(ELog(30), FString().Append("SpawnNPCByDailyRouteConfig: spawned entity ").Append(local_6.GetIdValue()).Append(" near route start ").Append(local_26).Append(", location=").Append(local_44).Append(", offset=").Append(local_60).Append("; route will finish the start node stay before moving to the next node."));
            }
        }
        FNPCDailyRouteUtils::InitializeRouteState(local_6, RouteConfig, -1);
    }
    return local_6;
}
UFUNCTION()
FECSEntity SpawnNPCByDailyRoute(const TDataObjectPtr<FNPCMainConfig> &inout NPCConfig, const FRotator &inout Rotation = FRotator::ZeroRotator, const float32 MaxNearbyRadius = 500.0f, const float32 StepLength = 50.0f, const bool bEnableNoValidPos = true, const UDataTable DifficultyLevelConfigOverride = nullptr, const FName &inout SpawnInitEntryName = NAME_None)
{
    if (!(NPCConfig.IsSet()) || !(GetDailyRouteConfig().IsSet()))
    {
        XWarning(ELog(30), "SpawnNPCByDailyRoute: NPC config has no daily route config.");
        return FECSEntity();
    }
    return BlueprintFunctions_Ecology::SpawnNPCByDailyRouteConfig(NPCConfig, GetDailyRouteConfig(), Rotation, MaxNearbyRadius, StepLength, bEnableNoValidPos, DifficultyLevelConfigOverride, SpawnInitEntryName);
}
UFUNCTION()
FECSEntity BP_SpawnNPCByDailyRouteConfig(const TDataObjectPtr<FNPCMainConfig> &inout NPCConfig, const TDataObjectPtr<FNPCDailyRouteConfig> &inout RouteConfig, const FEntityCreateFinishDelegate &inout OnCreateFinish, const FRotator &inout Rotation = FRotator::ZeroRotator, const float32 MaxNearbyRadius = 500.0f, const float32 StepLength = 50.0f, const bool bEnableNoValidPos = true, const UDataTable DifficultyLevelConfigOverride = nullptr, const FName &inout SpawnInitEntryName = NAME_None)
{
    FECSEntity local_8 = BlueprintFunctions_Ecology::SpawnNPCByDailyRouteConfig(NPCConfig, RouteConfig, Rotation, MaxNearbyRadius, StepLength, bEnableNoValidPos, DifficultyLevelConfigOverride, SpawnInitEntryName);
    if (local_8.IsValid() && OnCreateFinish.IsBound())
    {
        ULevelEventManager::Get().RegisterCreatureCreateFinishCallback(local_8, OnCreateFinish);
    }
    return local_8;
}
UFUNCTION()
FECSEntity BP_SpawnNPCByDailyRoute(const TDataObjectPtr<FNPCMainConfig> &inout NPCConfig, const FEntityCreateFinishDelegate &inout OnCreateFinish, const FRotator &inout Rotation = FRotator::ZeroRotator, const float32 MaxNearbyRadius = 500.0f, const float32 StepLength = 50.0f, const bool bEnableNoValidPos = true, const UDataTable DifficultyLevelConfigOverride = nullptr, const FName &inout SpawnInitEntryName = NAME_None)
{
    FECSEntity local_8 = BlueprintFunctions_Ecology::SpawnNPCByDailyRoute(NPCConfig, Rotation, MaxNearbyRadius, StepLength, bEnableNoValidPos, DifficultyLevelConfigOverride, SpawnInitEntryName);
    if (local_8.IsValid() && OnCreateFinish.IsBound())
    {
        ULevelEventManager::Get().RegisterCreatureCreateFinishCallback(local_8, OnCreateFinish);
    }
    return local_8;
}
UFUNCTION()
bool SetNPCDailyRouteConfig(const FECSEntity &inout Entity, const TDataObjectPtr<FNPCDailyRouteConfig> &inout RouteConfig, const int CurrentNodeIndex, FString &out ErrorMessage)
{
    FName local_14;
    FString local_4;
    ErrorMessage = local_4;
    ErrorMessage = "";
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        ErrorMessage = "SetNPCDailyRouteConfig must run on server.";
        return false;
    }
    if (!(Entity.IsValid()))
    {
        ErrorMessage = "invalid NPC entity.";
        return false;
    }
    if (!(BlueprintFunctions_Ecology::ValidateNPCDailyRouteConfig(RouteConfig, ErrorMessage)))
    {
        return false;
    }
    if ((CurrentNodeIndex < -1 || (CurrentNodeIndex >= 0)))
    {
        local_14.GetDataName();
        ErrorMessage = FString().Append("invalid CurrentNodeIndex ").Append(CurrentNodeIndex).Append(" for route ").Append(local_14).Append(".");
        return false;
    }
    FNPCDailyRouteUtils::InitializeRouteState(Entity, RouteConfig, CurrentNodeIndex);
    local_14.GetDataName();
    ErrorMessage = FString().Append("OK Entity=").Append(Entity.GetIdValue()).Append(", Route=").Append(local_14).Append(", CurrentNodeIndex=").Append(CurrentNodeIndex).Append(".");
    return true;
}
UFUNCTION()
bool SetNPCDailyRouteByNPCConfig(const FECSEntity &inout Entity, const TDataObjectPtr<FNPCMainConfig> &inout NPCConfig, const int CurrentNodeIndex, FString &out ErrorMessage)
{
    FString local_4;
    ErrorMessage = local_4;
    ErrorMessage = "";
    if (!(NPCConfig.IsSet()))
    {
        ErrorMessage = "NPC config is not set.";
        return false;
    }
    if (!(GetDailyRouteConfig().IsSet()))
    {
        FName local_12;
        local_12.GetDataName();
        ErrorMessage = local_4.Append("NPC config ").Append(local_12).Append(" has no DailyRouteConfig.");
        return false;
    }
    return BlueprintFunctions_Ecology::SetNPCDailyRouteConfig(Entity, GetDailyRouteConfig(), CurrentNodeIndex, ErrorMessage);
}
UFUNCTION()
bool ClearNPCDailyRoute(const FECSEntity &inout Entity, FString &out ErrorMessage)
{
    FString local_4;
    ErrorMessage = local_4;
    ErrorMessage = "";
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        ErrorMessage = "ClearNPCDailyRoute must run on server.";
        return false;
    }
    if (!(Entity.IsValid()))
    {
        ErrorMessage = "invalid NPC entity.";
        return false;
    }
    Has local_10;
    bool local_5 = local_10.opCall();
    if (local_5)
    {
        Remove local_14;
        local_14.opCall();
    }
    FAIInputUtils::SimulateMoveInputLocal(Entity, FVector::ZeroVector, EAIMoveSimulateType(0), false);
    ErrorMessage = local_4.Append("OK Entity=").Append(Entity.GetIdValue()).Append(".");
    return true;
}
UFUNCTION()
bool ValidateNPCDailyRouteConfig(const TDataObjectPtr<FNPCDailyRouteConfig> &inout RouteConfig, FString &out ErrorMessage)
{
    FString local_4;
    int local_39 = 0;
    FName local_41;
    FName local_43;
    ErrorMessage = local_4;
    ErrorMessage = "";
    if (!(RouteConfig.IsSet()))
    {
        ErrorMessage = "daily route config is not set.";
        return false;
    }
    if (!(HasRouteNodes()))
    {
        ErrorMessage = "daily route config needs at least two nodes.";
        return false;
    }
    if (unresolved.RouteSourceId.IsNone())
    {
        ErrorMessage = "daily route config has empty RouteSourceId.";
        return false;
    }
    bool local_5 = !(IsLoopStartIndexValid());
    if (local_5)
    {
        FString local_10 = FString();
        return false;
    }
    int local_11 = 0;
    for (; local_11 < 0; ++local_11)
    {
        FNPCDailyRouteNodeConfig local_20;
        FNPCDailyRouteNodeConfig local_26;
        local_20 = local_26;
        if (local_20.PointId.IsNone())
        {
            FString local_10_2 = FString();
            return false;
        }
        local_5 = !(local_20.StayTime.IsValid());
        if (local_5)
        {
            FString local_10_3 = FString();
            return false;
        }
        ECS::GetUEWorld();
        local_5 = !local_5;
        if (local_5)
        {
            FString local_10_4 = FString();
            return false;
        }
    }
    int local_11_2 = 0;
    for (; (local_11_2 + 1) < local_39; ++local_11_2)
    {
        int local_12 = local_11_2 + 1;
        if ((local_41 == local_43))
        {
            local_39 = local_11_2 + 1;
            FString local_10_5 = FString();
            return false;
        }
        ECS::GetUEWorld();
        local_5 = !local_5;
        if (local_5)
        {
            FString local_10_6 = FString();
            return false;
        }
    }
    if ((local_43 == local_41))
    {
        FString local_10_7 = FString();
        return false;
    }
    ECS::GetUEWorld();
    local_5 = !local_5;
    if (local_5)
    {
        FString local_10_8 = FString();
        return false;
    }
    FString local_10_9 = FString();
    return true;
}
UFUNCTION()
void GetNPCDailyRouteRuntimeDebugInfo(const FECSEntity &inout Entity, bool &out bHasRuntime, FName &out RouteSourceId, int &out CurrentNodeIndex, FName &out CurrentPointId, int &out PendingTargetNodeIndex, FName &out TargetPointId, int &out ActivePathPointIndex, int &out ActivePathPointCount, FVector &out CurrentPathPointLocation, FVector &out TargetPathPointLocation, float32 &out TargetAcceptRadius, float32 &out SelectedStayTime, bool &out bHasPreparedTarget, FString &out Summary)
{
    FC_NPCDailyRouteRuntime local_38;
    bHasRuntime = false;
    FName local_4;
    RouteSourceId = local_4;
    CurrentNodeIndex = 0;
    CurrentPointId = FName();
    PendingTargetNodeIndex = 0;
    TargetPointId = FName();
    ActivePathPointIndex = 0;
    ActivePathPointCount = 0;
    CurrentPathPointLocation = FVector();
    TargetPathPointLocation = FVector();
    TargetAcceptRadius = 0.0f;
    SelectedStayTime = 0.0f;
    bHasPreparedTarget = false;
    Summary = FString();
    bHasRuntime = false;
    RouteSourceId = NAME_None;
    CurrentNodeIndex = -1;
    CurrentPointId = NAME_None;
    PendingTargetNodeIndex = -1;
    TargetPointId = NAME_None;
    ActivePathPointIndex = 0;
    ActivePathPointCount = 0;
    CurrentPathPointLocation = FVector::ZeroVector;
    TargetPathPointLocation = FVector::ZeroVector;
    TargetAcceptRadius = 0.0f;
    SelectedStayTime = 0.0f;
    bHasPreparedTarget = false;
    Summary = "No daily route runtime";
    if (!(Entity.IsValid()))
    {
        Summary = "Invalid entity";
        return;
    }
    Has local_32;
    if (!(local_32.opCall()))
    {
        return;
    }
    bHasRuntime = true;
    if (local_38.RouteConfig.IsSet())
    {
    }
    CurrentNodeIndex = int(local_38.CurrentNodeIndex);
    CurrentPointId = local_38.CurrentPointId;
    PendingTargetNodeIndex = int(local_38.PendingTargetNodeIndex);
    TargetPointId = local_38.TargetPointId;
    ActivePathPointIndex = int(local_38.ActivePathPointIndex);
    ActivePathPointCount = local_38.ActivePathPoints.Num();
    if (local_38.ActivePathPoints.IsValidIndex(ActivePathPointIndex))
    {
        CurrentPathPointLocation = local_38.ActivePathPoints[ActivePathPointIndex];
    }
    if (local_38.ActivePathPoints.Num() > 0)
    {
        TargetPathPointLocation = local_38.ActivePathPoints.Last(0);
    }
    TargetAcceptRadius = local_38.TargetAcceptRadius;
    SelectedStayTime = local_38.SelectedStayTime;
    bHasPreparedTarget = local_38.bHasPreparedTarget;
    Summary = FString().Append("RouteSource=").Append(RouteSourceId).Append(", Current[").Append(CurrentNodeIndex).Append("]=").Append(CurrentPointId).Append(", Target[").Append(PendingTargetNodeIndex).Append("]=").Append(TargetPointId).Append(", Path=").Append(ActivePathPointIndex).Append("/").Append(ActivePathPointCount).Append(", CurrentPathPoint=").Append(CurrentPathPointLocation).Append(", TargetPathPoint=").Append(TargetPathPointLocation).Append(", AcceptRadius=").Append(TargetAcceptRadius).Append(", Stay=").Append(SelectedStayTime);
    return;
}
UFUNCTION()
void GetNPCDailyRouteNextStepPreview(const FECSEntity &inout Entity, bool &out bHasPreview, FName &out RouteSourceId, int &out FromNodeIndex, FName &out FromPointId, int &out ToNodeIndex, FName &out ToPointId, int &out PathPointCount, FVector &out TargetLocation, float32 &out TargetAcceptRadius, FString &out Summary)
{
    bool local_47 = false;
    bHasPreview = false;
    FName local_4;
    RouteSourceId = local_4;
    FromNodeIndex = 0;
    FromPointId = FName();
    ToNodeIndex = 0;
    ToPointId = FName();
    PathPointCount = 0;
    TargetLocation = FVector();
    TargetAcceptRadius = 0.0f;
    Summary = FString();
    bHasPreview = false;
    RouteSourceId = NAME_None;
    FromNodeIndex = -1;
    FromPointId = NAME_None;
    ToNodeIndex = -1;
    ToPointId = NAME_None;
    PathPointCount = 0;
    TargetLocation = FVector::ZeroVector;
    TargetAcceptRadius = 0.0f;
    Summary = "No next step preview";
    if (!(Entity.IsValid()))
    {
        Summary = "Invalid entity";
        return;
    }
    TDataObjectPtr<FNPCDailyRouteConfig> local_46;
    if (!(FNPCDailyRouteUtils::TryGetRouteConfig(Entity, local_46)) || !(HasRouteNodes()))
    {
        Summary = "Entity has no usable daily route config";
        return;
    }
    if (unresolved.RouteSourceId.IsNone())
    {
        Summary = "Daily route has empty RouteSourceId";
        return;
    }
    bool local_19 = !(IsLoopStartIndexValid());
    if (local_19)
    {
        FString local_52 = FString();
        return;
    }
    Get local_56;
    const FC_NPCDailyRouteRuntime& local_58 = local_56.opCall();
    if (local_58)
    {
        FromNodeIndex = int(local_58.CurrentNodeIndex);
        FromPointId = local_58.CurrentPointId;
        local_19 = local_58.bHasPreparedTarget;
        if (!(local_19))
        {
            local_19 = false;
        }
        else
        {
            int local_20_4 = int(local_58.PendingTargetNodeIndex);
            local_19 = local_47;
        }
        local_19 = local_19 && !(local_58.TargetPointId.IsNone());
        if (local_19)
        {
            FNPCDailyRouteRuntimePointInfo local_68;
            if (!(NPCDailyRouteRuntimeLibrary::GetRoutePointInfo(ECS::GetUEWorld(), RouteSourceId, local_58.TargetPointId, local_68)))
            {
                Summary = FString().Append("Prepared target point ").Append(local_58.TargetPointId).Append(" is missing in route source ").Append(RouteSourceId);
                return;
            }
            local_47 = true;
            bHasPreview = local_47;
            ToNodeIndex = int(local_58.PendingTargetNodeIndex);
            ToPointId = local_58.TargetPointId;
            PathPointCount = local_58.ActivePathPoints.Num();
            TargetLocation = local_68.Location;
            TargetAcceptRadius = local_58.TargetAcceptRadius;
            Summary = FString().Append("Prepared From[").Append(FromNodeIndex).Append("]=").Append(FromPointId).Append(" -> To[").Append(ToNodeIndex).Append("]=").Append(ToPointId).Append(", PathPointCount=").Append(PathPointCount).Append(", Target=").Append(TargetLocation).Append(", AcceptRadius=").Append(TargetAcceptRadius);
            return;
        }
    }
    int local_71 = FromNodeIndex;
    ToNodeIndex = local_71 < 0 ? 0 : local_71.GetNextNodeIndex();
    int local_73 = ToNodeIndex;
    local_19 = !local_19;
    if (local_19)
    {
        Summary = FString().Append("Next node index ").Append(ToNodeIndex).Append(" is invalid");
        return;
    }
    FNPCDailyRouteNodeConfig local_80;
    FNPCDailyRouteNodeConfig local_86;
    int local_20_5 = ToNodeIndex;
    local_80 = local_86;
    FNPCDailyRouteRuntimePointInfo local_68;
    if (!(NPCDailyRouteRuntimeLibrary::GetRoutePointInfo(ECS::GetUEWorld(), RouteSourceId, local_80.PointId, local_68)))
    {
        Summary = FString().Append("Target point ").Append(local_80.PointId).Append(" is missing in route source ").Append(RouteSourceId);
        return;
    }
    ToPointId = local_80.PointId;
    TargetLocation = local_68.Location;
    TargetAcceptRadius = local_68.AcceptRadius;
    if (unresolved.Nodes.IsValidIndex(local_71))
    {
        if ((FromPointId == ToPointId))
        {
            Summary = FString().Append("Next route segment cannot use the same point twice ").Append(FromPointId);
            return;
        }
        FNPCDailyRouteRuntimeConnectionInfo local_92;
        if (!(NPCDailyRouteRuntimeLibrary::GetRouteConnectionInfo(ECS::GetUEWorld(), RouteSourceId, FromPointId, ToPointId, local_92)))
        {
            Summary = FString().Append("Missing generated path ").Append(FromPointId).Append(" -> ").Append(ToPointId).Append(" in route source ").Append(RouteSourceId);
            return;
        }
        PathPointCount = local_92.WorldPathPoints.Num();
    }
    else
    {
        PathPointCount = 1;
    }
    local_47 = true;
    bHasPreview = local_47;
    Summary = FString().Append("Next From[").Append(FromNodeIndex).Append("]=").Append(FromPointId).Append(" -> To[").Append(ToNodeIndex).Append("]=").Append(ToPointId).Append(", PathPointCount=").Append(PathPointCount).Append(", Target=").Append(TargetLocation).Append(", AcceptRadius=").Append(TargetAcceptRadius);
    return;
}
UFUNCTION()
void GetNPCDailyRouteConfigStartPreview(const TDataObjectPtr<FNPCDailyRouteConfig> &inout RouteConfig, bool &out bHasPreview, FName &out RouteSourceId, FName &out StartPointId, FVector &out StartLocation, int &out FirstTargetNodeIndex, FName &out FirstTargetPointId, int &out FirstPathPointCount, FVector &out FirstTargetLocation, float32 &out FirstTargetAcceptRadius, FString &out Summary)
{
    bHasPreview = false;
    FName local_4;
    RouteSourceId = local_4;
    StartPointId = FName();
    StartLocation = FVector();
    FirstTargetNodeIndex = 0;
    FirstTargetPointId = FName();
    FirstPathPointCount = 0;
    FirstTargetLocation = FVector();
    FirstTargetAcceptRadius = 0.0f;
    Summary = FString();
    bHasPreview = false;
    RouteSourceId = NAME_None;
    StartPointId = NAME_None;
    StartLocation = FVector::ZeroVector;
    FirstTargetNodeIndex = -1;
    FirstTargetPointId = NAME_None;
    FirstPathPointCount = 0;
    FirstTargetLocation = FVector::ZeroVector;
    FirstTargetAcceptRadius = 0.0f;
    Summary = "No route config start preview";
    if (!(RouteConfig.IsSet()))
    {
        Summary = "daily route config is not set";
        return;
    }
    if (!(HasRouteNodes()))
    {
        Summary = "daily route config needs at least two nodes";
        return;
    }
    if (unresolved.RouteSourceId.IsNone())
    {
        Summary = "daily route config has empty RouteSourceId";
        return;
    }
    FName local_29;
    local_29.GetStartPointId();
    StartPointId = local_29;
    FNPCDailyRouteRuntimePointInfo local_40;
    bool local_25 = !(NPCDailyRouteRuntimeLibrary::GetRoutePointInfo(ECS::GetUEWorld(), RouteSourceId, StartPointId, local_40));
    if (local_25)
    {
        Summary = FString().Append("cannot find start point ").Append(StartPointId).Append(" in route source ").Append(RouteSourceId);
        return;
    }
    StartLocation = local_40.Location;
    FirstTargetNodeIndex = 0.GetNextNodeIndex();
    int local_26 = FirstTargetNodeIndex;
    local_25 = !local_25;
    if (local_25)
    {
        Summary = FString().Append("first target node index ").Append(FirstTargetNodeIndex).Append(" is invalid");
        return;
    }
    FNPCDailyRouteNodeConfig local_60;
    int local_47 = FirstTargetNodeIndex;
    FirstTargetPointId = local_60.PointId;
    if ((StartPointId == FirstTargetPointId))
    {
        Summary = FString().Append("start point and first target point are both ").Append(StartPointId);
        return;
    }
    FNPCDailyRouteRuntimePointInfo local_70;
    if (!(NPCDailyRouteRuntimeLibrary::GetRoutePointInfo(ECS::GetUEWorld(), RouteSourceId, FirstTargetPointId, local_70)))
    {
        Summary = FString().Append("cannot find first target point ").Append(FirstTargetPointId).Append(" in route source ").Append(RouteSourceId);
        return;
    }
    FNPCDailyRouteRuntimeConnectionInfo local_76;
    if (!(NPCDailyRouteRuntimeLibrary::GetRouteConnectionInfo(ECS::GetUEWorld(), RouteSourceId, StartPointId, FirstTargetPointId, local_76)))
    {
        Summary = FString().Append("missing generated first path ").Append(StartPointId).Append(" -> ").Append(FirstTargetPointId).Append(" in route source ").Append(RouteSourceId);
        return;
    }
    bHasPreview = true;
    FirstPathPointCount = local_76.WorldPathPoints.Num();
    FirstTargetLocation = local_70.Location;
    FirstTargetAcceptRadius = int(local_70.AcceptRadius);
    Summary = FString().Append("Start[").Append(StartPointId).Append("]=").Append(StartLocation).Append(", FirstTarget[").Append(FirstTargetNodeIndex).Append("]=").Append(FirstTargetPointId).Append(", PathPointCount=").Append(FirstPathPointCount).Append(", Target=").Append(FirstTargetLocation).Append(", AcceptRadius=").Append(FirstTargetAcceptRadius);
    return;
}
UFUNCTION()
FECSEntity BP_SpawnMonsterByMonsterIdInValidPos(const FECSEntityAdapter &inout Entity, const TDataObjectPtr<FMonsterMainConfig> &inout MonsterConfig, const FVector &inout Location, const FRotator &inout Rotation, const FEntityCreateFinishDelegate &inout OnCreateFinish, const float32 MaxNearbyRadius = 500.0f, const float32 StepLength = 50.0f, const bool bEnableNoValidPos = true, const FName &inout SpawnInitEntryName = NAME_None, const bool bMuteDrop = false)
{
    UDataTable local_2;
    int local_12 = 0;
    int local_3 = 0;
    if (Entity.IsValid())
    {
        if (local_12)
        {
            local_3 = local_12.GetMonsterLevel();
            Get local_16;
            const FC_DifficultyConfigOverride& local_18 = local_16.opCall();
            if (local_18)
            {
                local_2 = local_18.DifficultyLevelConfig;
            }
        }
    }
    FECSEntity local_26 = BlueprintFunctions_Ecology::SpawnMonsterByMonsterIdInValidPos(Entity, MonsterConfig, Location, Rotation, MaxNearbyRadius, StepLength, bEnableNoValidPos, local_2, local_3, SpawnInitEntryName, bMuteDrop);
    if (OnCreateFinish.IsBound())
    {
        ULevelEventManager::Get().RegisterCreatureCreateFinishCallback(local_26, OnCreateFinish);
    }
    return local_26;
}
FECSEntity SpawnMonsterByMonsterIdInValidPos(const FECSEntityAdapter &inout Entity, const TDataObjectPtr<FMonsterMainConfig> &inout MonsterConfig, const FVector &inout Location, const FRotator &inout Rotation, const float32 MaxNearbyRadius = 500.0f, const float32 StepLength = 50.0f, const bool bEnableNoValidPos = true, const UDataTable DifficultyLevelConfigOverride = nullptr, const int MonsterLevel = 0, const FName &inout SpawnInitEntryName = NAME_None, const bool bMuteDrop = false)
{
    int local_4 = 0;
    bool local_48 = false;
    int local_49 = 0;
    int local_56 = 0;
    bool local_207;
    bool local_208 = false;
    int local_270 = 0;
    int local_294 = 0;
    int local_302 = 0;
    FECSEntity __return;
    bool local_1 = !(ECS::GetRuntimeInfo().IsServer);
    if (local_1)
    {
        return ENTITY_NULL;
    }
    if (!(MonsterConfig))
    {
        local_1 = false;
    }
    else
    {
        local_1 = GetCombatConfig();
    }
    FECSEntity local_214;
    if (local_1)
    {
        TSubclassOf<ACharacterPrefab> local_8;
        bool local_5;
        int local_3;
        local_3 = local_4;
        local_5 = false;
        local_8.GetCombatPrefab();
        if ((local_8 == nullptr))
        {
            FECSEntity local_18 = Entity.GetEntity();
            XWarning(ELog(30), FString().Append("[MonsterGroundDebug] SpawnMonsterByMonsterIdInValidPos PrefabNull MonsterId=").Append(local_3).Append(" SourceEntity=").Append(local_18.GetIdValue()).Append(" InputLocation=").Append(Location).Append(" Rotation=").Append(Rotation));
            return local_18;
        }
        FVector local_44 = FASCommonUtils::FindLegalLocationByPrefab(local_5, Entity.opImplConv(), local_8.GetDefaultObject(), Location, Rotation.Quaternion(), MaxNearbyRadius, StepLength, 8, true);
        if (local_5 || bEnableNoValidPos)
        {
            bool local_52;
            bool local_51;
            bool local_47;
            float32 local_45;
            local_45 = 0.0f;
            local_47 = false;
            local_48 = false;
            local_49 = EECSCollisionShapeType(0);
            local_51 = false;
            bool local_1_2 = false;
            local_52 = local_1_2;
            ACharacterPrefab local_54 = local_8.GetDefaultObject();
            if (local_54 == nullptr)
            {
                local_1_2 = false;
            }
            else
            {
                local_1_2 = local_54.Physics.bTraitEnable;
            }
            if (local_1_2)
            {
                local_48 = true;
                local_49 = local_56.GetShapeType();
                local_51 = (int(local_56.GetShapeType()) != 0);
                local_52 = local_56.GetMoveCollisionOptions().IsActive();
                local_47 = local_51 && (local_52 || !(local_5));
                if (local_51)
                {
                    local_45 = local_56.GetScaledHalfHeight();
                }
            }
            if (local_47)
            {
                FHitResult local_124;
                int local_125 = 1148846080;
                int local_126 = 1176256512;
                int local_127 = 1203982208;
                int local_128 = 1203982336;
                int local_129 = 1028443341;
                FVector local_148 = (local_44 + FVector(0.0, 0.0, 1000.0));
                FVector local_136 = (local_44 - FVector(0.0, 0.0, 10000.0));
                FCollisionQueryParams local_192;
                local_192.bTraceComplex = false;
                if (Entity.IsValid())
                {
                    FCollisionResponseParams local_201;
                    local_207 = FPhysicsUtils::LineTraceSingle(Entity.GetEntity(), false, EPhysicsTraceTag(34), local_124, local_148, local_136, ECollisionChannel(18), local_192, local_201);
                }
                else
                {
                    FCollisionResponseParams local_201;
                    local_207 = FPhysicsUtils::LineTraceSingle(ECS::GetUEWorld(), EPhysicsTraceTag(34), local_124, local_148, local_136, ECollisionChannel(18), local_192, local_201);
                }
                bool local_1_3 = false;
                local_208 = local_1_3;
                if (!(local_207))
                {
                    local_148 = (local_44 + FVector(0.0, 0.0, 99999.0));
                    local_136 = (local_44 - FVector(0.0, 0.0, 100000.0));
                    local_208 = true;
                    if (Entity.IsValid())
                    {
                        FCollisionResponseParams local_201;
                        local_1_3 = FPhysicsUtils::LineTraceSingle(Entity.GetEntity(), false, EPhysicsTraceTag(34), local_124, local_148, local_136, ECollisionChannel(18), local_192, local_201);
                    }
                    else
                    {
                        FCollisionResponseParams local_201;
                        local_1_3 = FPhysicsUtils::LineTraceSingle(ECS::GetUEWorld(), EPhysicsTraceTag(34), local_124, local_148, local_136, ECollisionChannel(18), local_192, local_201);
                    }
                    local_207 = local_1_3;
                }
                if (local_207)
                {
                    local_44 = local_44.NewZ((local_124.ImpactPoint.Z + local_45) + 0.05000000074505806);
                }
            }
            FECSEntity local_18_2 = BlueprintFunctions_Ecology::SpawnMonsterByMonsterId(MonsterConfig, local_44, Rotation.Quaternion(), DifficultyLevelConfigOverride, SpawnInitEntryName, bMuteDrop);
            if (!(local_18_2))
            {
                return local_18_2;
            }
            if (MonsterLevel > 0)
            {
                FC_CreatureMeta local_220;
                local_220.Level = MonsterLevel;
            }
            TDataObjectPtr<FGameAttributeInherit> local_244;
            local_244 = GetAttributeInheritConfig();
            if (!((local_244 == nullptr)))
            {
                local_270.SetInheritOwner(Entity.GetEntity());
                local_270.SetGameAttributeInheritConfig(GetAttributeInheritConfig());
                ModifyOrAdd local_278;
                local_278.opCall().AddInheritEntity(local_18_2);
            }
            FECSWorldPtr local_280 = ECS::GetECSWorld();
            Get local_288;
            FFPTime local_292 = (FFPTime(local_288.opCall().Time) + FECSWorld::FixedFrameInterval);
            FFPTime local_290 = (local_292 + FECSWorld::FixedFrameInterval);
            local_214 = Entity.opImplConv();
            FECSWorldPtr local_280_2 = ECS::GetECSWorld();
            local_294.BeSummonedEntity = local_18_2;
            Get local_298;
            const FC_AttackerHitPresentationConfig& local_300 = local_298.opCall();
            if (local_300)
            {
                if (local_300.bShowDamageNumToOwner)
                {
                    local_214 = Entity.opImplConv();
                    local_302.SetAttackerHitOwner(local_214);
                }
            }
            __return = local_18_2;
        }
        else
        {
        }
    }
    __return = local_214;
    return __return;
}
UFUNCTION()
FECSEntity SpawnDynamicResource(const FECSEntity &inout Outer, const FSingleResourceConfig &inout ResourceConfig, const FVector &inout Position, const FVector &inout Rotation, const float32 Duration = -1.0f)
{
    FFPTime local_4 = FFPTime(ECS::GetECSWorld().GetFixedTime().Time);
    return FEcologyResourceUtils::SpawnDynamicResource(Outer, ResourceConfig, Position, Rotation, local_4, Duration);
}
UFUNCTION()
void AddFlockChangeAreaRequestSpecified(const FECSEntity &inout Entity, const FECSEntityId &inout TargetResourceId, const FGameplayTag &inout ReasonTag, const bool bNeedChangeAreaMessage, const FChangeAreaMessageInfo &inout MessageInfo, const int Priority = 100, const bool bForceUpdateTargetResource = true)
{
    FECSEntity local_4 = Entity;
    Get local_8;
    const FC_FlockMember& local_10 = local_8.opCall();
    if (local_10)
    {
        local_4 = FECSEntity(local_10.FlockProxyEntity);
    }
    if (!(local_4.IsValid()))
    {
        return;
    }
    if (!(FECSEntity(TargetResourceId).IsValid()))
    {
        return;
    }
    FGameplayTag local_20;
    if (ReasonTag.IsValid())
    {
        local_20 = ReasonTag;
    }
    else
    {
        local_20 = FEcologyGameplayTagDefine::Ecology_LBPChangeAreaReasonDefaultTag;
    }
    FEcologyBehaviorUtils::AddFlockChangeAreaRequestSpecified(local_4, TargetResourceId, local_20, FEcologyGameplayTagDefine::Ecology_LBPChangeAreaSourceDefaultTag, false, MessageInfo, 25000.0f, 50000.0f, Priority, bNeedChangeAreaMessage, bForceUpdateTargetResource);
    return;
}
UFUNCTION()
void AddCreaturePreferActivityData(const FECSEntityAdapter &inout Entity, const TDataObjectPtr<FEcologyActivityDefinitionRow> &inout ActivityData)
{
    if (!(ActivityData.IsSet()))
    {
        return;
    }
    Modify local_6;
    FC_CreatureEcologyState& local_8 = local_6.opCall();
    if (local_8)
    {
        local_8.ActivityData.PreferActivityList.AddUnique(ActivityData);
    }
    return;
}
UFUNCTION()
void RemoveCreaturePreferActivityData(const FECSEntityAdapter &inout Entity, const TDataObjectPtr<FEcologyActivityDefinitionRow> &inout ActivityData)
{
    if (!(ActivityData.IsSet()))
    {
        return;
    }
    Modify local_6;
    if (local_6.opCall())
    {
    }
    return;
}
UFUNCTION()
void ClearCreaturePreferActivityData(const FECSEntityAdapter &inout Entity)
{
    Modify local_4;
    FC_CreatureEcologyState& local_6 = local_4.opCall();
    if (local_6)
    {
        local_6.ActivityData.PreferActivityList.Empty(0);
    }
    return;
}
UFUNCTION()
void SetPauseGlobalAI(const FGameplayTag &inout Reason, const bool bPause)
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Modify local_6;
    FCS_AIControlGlobalContext& local_8 = local_6.opCall();
    if (local_8)
    {
        local_8.SetPauseAI(Reason, bPause, true);
    }
    return;
}
UFUNCTION()
void EcologyDemoMuteCombat(const FECSEntityAdapter &inout Entity, const bool ReleaseMute)
{
    if (!(Entity.IsValid()))
    {
        return;
    }
    if (!(ReleaseMute))
    {
        FAIKnowledgeUtils::AddMuteCombat(Entity.opImplConv(), n"BPMuteCombat", false);
        return;
    }
    FAIKnowledgeUtils::RemoveMuteCombat(Entity.opImplConv(), n"BPMuteCombat");
    return;
}
UFUNCTION()
void EcologyDemoMuteBeAITarget(const FECSEntityAdapter &inout Entity, const bool ReleaseMute)
{
    if (!(Entity.IsValid()))
    {
        return;
    }
    if (!(ReleaseMute))
    {
        FAIKnowledgeUtils::AddMuteBeAITarget(Entity.opImplConv(), n"BPMuteBeAITarget");
        return;
    }
    FAIKnowledgeUtils::RemoveMuteBeAITarget(Entity.opImplConv(), n"BPMuteBeAITarget");
    return;
}
UFUNCTION()
void EcologyDemoMuteInvolvedFight(const FECSEntityAdapter &inout Entity, const bool ReleaseMute)
{
    if (!(Entity.IsValid()))
    {
        return;
    }
    if (!(ReleaseMute))
    {
        FAIKnowledgeUtils::AddMuteCombat(Entity.opImplConv(), n"BPMuteInvolvedFight", false);
        FAIKnowledgeUtils::AddMuteBeAITarget(Entity.opImplConv(), n"BPMuteInvolvedFight");
        return;
    }
    FAIKnowledgeUtils::RemoveMuteCombat(Entity.opImplConv(), n"BPMuteInvolvedFight");
    FAIKnowledgeUtils::RemoveMuteBeAITarget(Entity.opImplConv(), n"BPMuteInvolvedFight");
    return;
}
UFUNCTION()
TDataObjectPtr<FMonsterMainConfig> GetTargetCreatureConfigId(const FECSEntityAdapter &inout Target)
{
    Get local_4;
    const FC_CreatureMeta& local_6 = local_4.opCall();
    if (local_6)
    {
        return local_6.CreatureConfigProxy.GetMonsterConfig();
    }
    return TDataObjectPtr<FMonsterMainConfig>();
}
UFUNCTION()
void RegisterDOTSensor(const FECSEntityAdapter &inout Entity, const FName &inout SensorName, const FEcologyDOTSensorConfig &inout Config)
{
    int local_8 = 0;
    if (!(Entity.IsValid()))
    {
        return;
    }
    if (SensorName.IsNone())
    {
        XError(ELog(30), "BlueprintFunctions_Ecology.RegisterDOTSensor: SensorName is None");
        return;
    }
    FEcologySensorUtils::RegisterDOTSensor(Entity.opImplConv(), local_8, SensorName, Config);
    return;
}
UFUNCTION()
void UnRegisterDOTSensor(const FECSEntityAdapter &inout Entity, const FName &inout SensorName, const bool bWithEvent = false)
{
    int local_16 = 0;
    if (!(Entity.IsValid()))
    {
        return;
    }
    if (SensorName.IsNone())
    {
        XWarning(ELog(30), "BlueprintFunctions_Ecology.UnRegisterDOTSensor: SensorName is None");
        return;
    }
    Has local_6;
    if (!(local_6.opCall()))
    {
        XWarning(ELog(30), FString().Append("BlueprintFunctions_Ecology.UnRegisterDOTSensor: Entity does not have FC_EcologyDOTSensor component"));
        return;
    }
    FEcologySensorUtils::UnRegister(Entity.opImplConv(), local_16, SensorName, bWithEvent);
    return;
}
UFUNCTION()
void EnableLevelControlByEntityId(const FECSEntity &inout Entity, const bool bEnable)
{
    ModifyOrAdd local_4;
    FC_EcologyKnowledge& local_6 = local_4.opCall();
    if (local_6)
    {
        local_6.SetBool(FEcologyKnowledgeKey(FName("bUnderLevelControl")), bEnable);
    }
    return;
}
UFUNCTION()
void FindNearestResourceByRequest(const FECSEntity &inout Requester, const FResourceRequestFilterConfig &inout Request, bool &out bFound, FECSEntityId &out ResourceId)
{
    int local_10 = 0;
    int local_148 = 0;
    bFound = false;
    FECSEntityId local_3;
    ResourceId = local_3;
    bFound = false;
    ResourceId = ENTITY_ID_NULL;
    if (!(Requester.IsValid()))
    {
        return;
    }
    if (!(local_10))
    {
        return;
    }
    FResourceSearchRequest local_100;
    Request.MakeRequest(Requester, local_100);
    TArray<FEntitySearchResult> local_104 = FEcologySceneInfoUtils::RequestResource(local_100);
    if (local_104.Num() <= 0)
    {
        return;
    }
    float local_112 = 1.7976931348623157e308;
    FECSEntity local_118;
    FVector local_124 = local_10.GetPosition();
    for (auto& local_138 : local_104)
    {
        FECSEntity local_146 = FECSEntity(local_138.EntityId);
        if (!(local_146.IsValid()))
        {
            continue;
        }
        if (!(local_148))
        {
            continue;
        }
        float local_114 = local_124.DistSquared2D(local_148.GetPosition());
        if (local_114 < local_112)
        {
            local_112 = local_114;
            local_118 = local_146;
        }
    }
    if (local_118.IsValid())
    {
        bFound = true;
        ResourceId = local_118.GetId();
    }
    return;
}
UFUNCTION()
void GetQuitCombatHomeLocation(const FECSEntity &inout Entity, bool &out bHasHomeLocation, FVector &out HomeLocation)
{
    FC_AIQuitCombatInfo local_16;
    bHasHomeLocation = false;
    FVector local_8;
    HomeLocation = local_8;
    bHasHomeLocation = false;
    HomeLocation = FVector::ZeroVector;
    if (!(Entity.IsValid()))
    {
        return;
    }
    if (!(local_16))
    {
        return;
    }
    if (!(local_16.bHasHomeLocation))
    {
        return;
    }
    bHasHomeLocation = true;
    if (FECSEntity(local_16.HomeResource).IsValid())
    {
        Get local_24;
        const FC_Transform& local_26 = local_24.opCall();
        if (local_26)
        {
            HomeLocation = local_26.GetPosition();
            return;
        }
    }
    HomeLocation = local_16.HomeLocation;
    return;
}
UFUNCTION()
void GetCreatureMetaInfo(const FECSEntity &inout Entity, const FECSEntityId &inout EntityId, bool &out bValid, TDataObjectPtr<FEcologyCreatureDefinitionRow> &out CreatureDataConfig, ECreatureConfigType &out ConfigType, TDataObjectPtr<FCreatureUnitConfig> &out MainDataConfig)
{
    bValid = false;
    ConfigType = ECreatureConfigType(0);
    TDataObjectPtr<FCreatureUnitConfig> local_98 = TDataObjectPtr<FCreatureUnitConfig>();
    bValid = false;
    ConfigType = ECreatureConfigType(0);
    CreatureDataConfig = TDataObjectPtr<FEcologyCreatureDefinitionRow>();
    MainDataConfig = TDataObjectPtr<FCreatureUnitConfig>();
    FECSEntity local_200;
    FECSEntity local_208 = FECSEntity(EntityId);
    if (local_208.IsValid())
    {
        local_200 = local_208;
    }
    if (Entity.IsValid())
    {
        local_200 = Entity;
    }
    if (!(local_200.IsValid()))
    {
        XLog(ELog(30), FString().Append("[LBP Node][GetCreatureMetaInfo] TargetEntity Invalid, Entity = ").Append(Entity).Append(", EntityId = ").Append(EntityId));
        bValid = false;
        return;
    }
    Get local_218;
    const FC_CreatureMeta& local_220 = local_218.opCall();
    if (local_220)
    {
        bValid = true;
        CreatureDataConfig = local_220.CreatureType;
        ConfigType = local_220.CreatureConfigProxy.Type;
        MainDataConfig = TDataObjectPtr<FCreatureUnitConfig>(local_220.CreatureConfigProxy.GetCreatureUnitConfig());
    }
    return;
}
UFUNCTION()
TSet<FECSEntityId> GetLevelGroupPointsByGroupId(const FVector &inout Center, const FConfigGUID &inout GroupGuid, const FKLGameplayTagQuery &inout DomainTagQuery, const float32 SearchDistance = 10000.0f)
{
    FEcologyPointQueryResult local_20;
    int local_22 = 0;
    FECSWorldPtr local_24 = ECS::GetECSWorld();
    FEcologyPointQuery local_62;
    local_62.Bounds.SphereRadius = SearchDistance;
    local_62.OwnerGroup = GroupGuid;
    local_62.DomainTagQuery = DomainTagQuery;
    FEcologyPointUtils::QueryPoints(Center, local_22, local_62);
    return local_20.ActivatePoint;
}
UFUNCTION()
void GetNearestLevelGroupPointByGroupIdInRadius(const FVector &inout Center, const FConfigGUID &inout GroupGuid, const FKLGameplayTagQuery &inout DomainTagQuery, FECSEntityId &out PointEntityId, FVector &out PointLocation, FVector &out PointDirection, const float32 SearchDistance = 10000.0f)
{
    FECSEntityId local_1;
    int local_36 = 0;
    PointEntityId = local_1;
    PointLocation = FVector();
    PointDirection = FVector();
    FEcologyPointQueryResult local_34;
    FECSWorldPtr local_38 = ECS::GetECSWorld();
    FEcologyPointQuery local_76;
    local_76.Bounds.SphereRadius = SearchDistance;
    local_76.OwnerGroup = GroupGuid;
    local_76.DomainTagQuery = DomainTagQuery;
    FEcologyPointUtils::QueryNearestPoint(Center, local_36, local_76);
    FECSEntityId local_99 = FECSEntityId(ENTITY_ID_NULL);
    FVector local_106(FVector::ZeroVector);
    FVector local_112(FVector::ZeroVector);
    for (auto& local_132 : local_34.ActivatePoint)
    {
        local_99 = local_132;
        FECSEntity local_140 = FECSEntity(local_132);
        Get local_144;
        const FC_Transform& local_146 = local_144.opCall();
        if (local_146)
        {
            local_106 = local_146.GetPosition();
            local_112 = local_146.GetRotation().GetForwardVector();
        }
        break;
    }
    PointEntityId = local_99;
    PointLocation = local_106;
    PointDirection = local_112;
    return;
}
UFUNCTION()
void GetSpawnerStats(const FECSEntity &inout SpawnerEntity, bool &out bValid, int &out TotalSpawned, int &out CurrentAlive, int &out TotalDeath, int &out TotalDestroyed, int &out ExpectedConfiguredTotal)
{
    bValid = false;
    TotalSpawned = 0;
    CurrentAlive = 0;
    TotalDeath = 0;
    TotalDestroyed = 0;
    ExpectedConfiguredTotal = 0;
    bValid = false;
    TotalSpawned = 0;
    CurrentAlive = 0;
    TotalDeath = 0;
    TotalDestroyed = 0;
    ExpectedConfiguredTotal = -1;
    if (!(SpawnerEntity.IsValid()))
    {
        return;
    }
    ExpectedConfiguredTotal = FEcologySpawnerUtils::GetSpawnerExpectedConfiguredEntityCount(SpawnerEntity);
    Get local_8;
    const FC_EcologySpawnerStats& local_10 = local_8.opCall();
    if (local_10)
    {
        bValid = true;
        TotalSpawned = int(local_10.TotalSpawned);
        CurrentAlive = int(local_10.CurrentAlive);
        TotalDeath = int(local_10.TotalDeath);
        TotalDestroyed = int(local_10.TotalDestroyed);
    }
    return;
}
UFUNCTION()
void RequestRefreshSpawner(const FECSEntity &inout TargetEntity)
{
    bool local_6;
    int local_16 = 0;
    if (!(TargetEntity))
    {
        local_6 = false;
    }
    else
    {
        Has local_4;
        local_6 = local_4.opCall();
    }
    if (local_6)
    {
        FFPTime local_12 = FFPTime(-1);
        local_16.Spawners.Add(TargetEntity.GetId());
    }
    return;
}
}

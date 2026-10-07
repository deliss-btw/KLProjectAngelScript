
namespace TeleporterUtils
{
    const float32 OccupancyCheckRadius = 150f;
    const int MaxRandomAttempts = 5;
    const FVector DefaultNavMeshQueryExtent = FVector();

TArray<TDataObjectPtr<FTeleporterConfig>> GetAllTeleportersInLevel(const TDataObjectPtr<FLevelInfoConfig> &inout LevelInfoConfig)
{
    const UTeleporterSettings local_2;
    GetGameplaySettings<UTeleporterSettings> local_4;
    local_2 = local_4;
    return local_2.GetTeleportersInLevel(LevelInfoConfig);
}
bool TryGetValidFloorLocation(const FECSEntity &inout PawnEntity, FVector &inout Location)
{
    FVector local_6;
    int local_12 = 0;
    FVector local_40;
    if (local_12)
    {
        local_40 = FVector(local_12.GetScaledRadius(), local_12.GetScaledRadius(), (local_12.GetScaledHeight() * 2.0f));
    }
    else
    {
        local_40 = TeleporterUtils::DefaultNavMeshQueryExtent;
    }
    if (!(UNavigationSystemV1::ProjectPointToNavigation(__GetWorldContext(), Location, local_6, nullptr, TSubclassOf<UNavigationQueryFilter>(nullptr), local_40)))
    {
        return false;
    }
    FHitResult local_110;
    FVector local_28 = (FVector(FVector::UpVector) * 100.0);
    FVector local_18 = (local_6 + local_28);
    FVector local_28_2 = FVector(FVector::DownVector);
    FVector local_28_3 = (local_6 + (local_28_2 * 100.0));
    TArray<AActor> local_126;
    if (!(System::LineTraceSingle(__GetWorldContext(), local_18, local_28_3, ETraceTypeQuery(5), false, local_126, EDrawDebugTrace(0), local_110, true, FLinearColor(1.0f, 0.0f, 0.0f, 1.0f), FLinearColor(0.0f, 1.0f, 0.0f, 1.0f), 5.0f)))
    {
        return false;
    }
    float32 local_20_2 = local_110.Distance;
    FKMCFloorInfo local_194 = FKinematicMoveCollisionUtils::FindFloorFromEntity(PawnEntity, local_18, local_20_2);
    if (local_194.GetbValid() && local_194.GetbHasFloor())
    {
        Location = local_194.GetFloorPoint();
    }
    else
    {
        Location = local_110.Location;
        Location.Z = (Location.Z + 1.0);
    }
    return true;
}
bool GetTeleportLocationAndRotation(const FECSEntity &inout TeleporterEntity, const FECSEntity &inout PawnEntity, FVector &inout Location, FRotator &inout Rotation)
{
    int local_6 = 0;
    bool local_179;
    if (!(local_6))
    {
        return false;
    }
    FTransform local_56 = FTransform(local_6.GetRotation(), local_6.GetPosition(), FVector::OneVector);
    Get local_60;
    if (local_60.opCall())
    {
        TArray<FTeleportSlot> local_64;
        if (local_64.Num() > 0)
        {
            const FTeleportSlot& local_70 = local_64[FMath::RandRange(0, (local_64.Num() - 1))];
            FTransform local_32 = local_70.SlotTransform;
            FTransform local_120 = (local_32 * local_56);
            FVector local_132 = local_120.GetLocation();
            Rotation = FRotator(0.0, local_120.GetRotation().Rotator().Yaw, 0.0);
            float32 local_162 = FMath::Max(0.0f, local_70.SlotRadius);
            float32 local_161 = FMath::Clamp(local_70.SlotInnerRadius, 0.0f, local_162);
            if (local_162 > 0.0f)
            {
                TArray<FECSEntity> local_168;
                FPlayerUtils::GetAllPlayerPawnEntitiesInRange(local_168, ECS::GetECSWorld(), local_132, local_162 + 150.0f, false);
                int local_171 = 0;
                for (; local_171 < 5; ++local_171)
                {
                    FVector local_126 = TeleporterUtils::RandomLocationInRadius(local_120, local_161, local_162);
                    Location = local_126;
                    local_179 = false;
                    for (auto& local_194 : local_168)
                    {
                        local_194;
                        Get local_4;
                        const FC_Transform& local_196 = local_4.opCall();
                        if (local_196)
                        {
                            if (local_196.GetPosition().DistSquared(local_126) <= 22500.0)
                            {
                                local_179 = true;
                                break;
                            }
                        }
                    }
                    if (!(local_179) && TeleporterUtils::TryGetValidFloorLocation(PawnEntity, Location))
                    {
                        return true;
                    }
                }
            }
            Location = TeleporterUtils::ApplySmallJitter(local_132);
            TeleporterUtils::TryGetValidFloorLocation(PawnEntity, Location);
            return true;
        }
    }
    Location = TeleporterUtils::ApplySmallJitter(local_56.GetLocation());
    Rotation = FRotator(0.0, local_56.GetRotation().Rotator().Yaw, 0.0);
    TeleporterUtils::TryGetValidFloorLocation(PawnEntity, Location);
    return true;
}
FVector RandomLocationInRadius(const FTransform &inout CenterTransform, const float32 InnerRadius, const float32 OuterRadius)
{
    float32 local_2 = FMath::DegreesToRadians(FMath::RandRange(0.0f, 360.0f));
    float32 local_3 = FMath::Sqrt(FMath::RandRange(InnerRadius * InnerRadius, (OuterRadius * OuterRadius)));
    return CenterTransform.TransformPosition(FVector((FMath::Cos(local_2) * local_3), (FMath::Sin(local_2) * local_3), 0.0));
}
FVector ApplySmallJitter(const FVector &inout Location)
{
    return (Location + FVector((FMath::RandRange(-1.0f, 1.0f)), (FMath::RandRange(-1.0f, 1.0f)), 0.0));
}
bool IsTeleportAllowed(const FECSEntity &inout Entity)
{
    UCharacterGlobalSetting local_4 = UCharacterGlobalSetting::Get();
    if ((!((local_4 != nullptr))))
    {
        return true;
    }
    return local_4.TeleportCondition.Evaluate(Entity);
}
void SetTeleportVisualHidden(const FECSEntity &inout Entity, const TArray<FName> &inout MeshNames, const bool bHidden)
{
    if (!(Entity.IsValid()))
    {
        return;
    }
    for (auto& local_16 : MeshNames)
    {
        if ((local_16 == NAME_None))
        {
            continue;
        }
        FVisibilityUtils::SetEntityMeshHidden(Entity, local_16, bHidden);
    }
    bool local_1 = !(bHidden);
    BlueprintFunctions_Common::SetWeaponVisibility(FECSEntityAdapter(Entity), local_1);
    return;
}
void ApplyTeleportVisualHide(const FECSEntity &inout Entity)
{
    FC_TeleportHideVisual local_16;
    TArray<FName> local_4;
    ULevelGlobalSettings local_8 = ULevelGlobalSettings::Get();
    if (local_8 != nullptr)
    {
        local_4 = local_8.TeleportHideMeshNames;
    }
    if (!(local_16.bHidden))
    {
        TeleporterUtils::SetTeleportVisualHidden(Entity, local_4, true);
        local_16.bHidden = true;
        local_16.HiddenMeshNames = local_4;
        if (local_4.Num() == 0)
        {
            XWarning(ELog(22), FString().Append("дј йЂЃйљђи—ЏпјљULevelGlobalSettings.TeleportHideMeshNames жњЄй…ЌзЅ®пјЊдј йЂЃжњџй—ґдёЌдјљйљђи—Џи§’и‰Іиє«дЅ“ Meshпј€еЏЄйљђи—Џж­¦е™Ёпј‰пјЊиЇ·еЎ«е…Ґи§’и‰І Mesh з»„д»¶еђЌгЂ‚"));
        }
    }
    local_16.TransactionSerial = 0;
    local_16.PlayerEntity = Entity;
    return;
}
void ApplySameDSTeleportVisualHide(const FECSEntity &inout Entity, const uint64 TransactionSerial)
{
    FC_TeleportHideVisual local_20;
    if (!(Entity.IsValid()) || (TransactionSerial == 0))
    {
        return;
    }
    TArray<FName> local_10;
    ULevelGlobalSettings local_14 = ULevelGlobalSettings::Get();
    if (local_14 != nullptr)
    {
        local_10 = local_14.TeleportHideMeshNames;
    }
    if (!(local_20.bHidden))
    {
        TeleporterUtils::SetTeleportVisualHidden(Entity, local_10, true);
        local_20.bHidden = true;
        local_20.HiddenMeshNames = local_10;
    }
    local_20.TransactionSerial = TransactionSerial;
    local_20.PlayerEntity = Entity;
    return;
}
void RestoreTeleportVisualHide(const FECSEntity &inout Entity)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    FC_TeleportHideVisual local_8;
    if ((!(local_8) || (local_8.TransactionSerial != 0)))
    {
        return;
    }
    if (local_8.bHidden)
    {
        TeleporterUtils::SetTeleportVisualHidden(local_8.PlayerEntity, local_8.HiddenMeshNames, false);
        local_8.bHidden = false;
    }
    Remove local_18;
    local_18.opCall();
    return;
}
void RestoreSameDSTeleportVisualHide(const FECSEntity &inout Entity, const uint64 TransactionSerial)
{
    FC_TeleportHideVisual local_12;
    if (!(ECS::GetRuntimeInfo().IsServer) || (TransactionSerial == 0))
    {
        return;
    }
    if (!(local_12) || (local_12.TransactionSerial != TransactionSerial))
    {
        return;
    }
    if (local_12.bHidden)
    {
        TeleporterUtils::SetTeleportVisualHidden(local_12.PlayerEntity, local_12.HiddenMeshNames, false);
        local_12.bHidden = false;
    }
    Remove local_16;
    local_16.opCall();
    return;
}
FECSEntity GetTeleportRequestPawnEntity(const FECSEntity &inout RequestEntity)
{
    FECSEntity local_8 = FASCommonUtils::GetUniqueAvatarPawnEntity(RequestEntity);
    if (local_8.IsValid())
    {
        return local_8;
    }
    return FASCommonUtils::GetPlayerPawnOrMountEntity(RequestEntity, true);
}
bool IsTeleporterActive(const FECSEntity &inout InPlayerEntity, const uint TeleporterDataId, const FECSEntity &inout TeleporterEntity)
{
    ETeleporterState local_1 = ETeleporterState(0);
    if (TeleporterUtils::GetTeleporterState(InPlayerEntity, TeleporterDataId, TeleporterEntity, local_1))
    {
        return (int(local_1) == 2);
    }
    return false;
}
TArray<FECSEntity> GetActiveTeleporterEntities(const FECSEntity &inout InPlayerEntity)
{
    TArray<FECSEntity> local_4;
    int local_12 = 0;
    int local_39 = 0;
    FECSWorldPtr local_6 = ECS::GetECSWorld();
    if (!(local_12))
    {
        return local_4;
    }
    for (auto& local_32 : local_12.GetTeleporters())
    {
        FECSEntity local_36 = local_32.GetKey();
        if (!(local_36.IsValid()) || !(IsSet()))
        {
            continue;
        }
        if (TeleporterUtils::IsTeleporterActive(InPlayerEntity, local_39, local_36))
        {
            local_4.Add(local_36);
        }
    }
    return local_4;
}
bool IsTeleporterUnlocked(const FECSEntity &inout InPlayerEntity, const uint TeleporterDataId, const FECSEntity &inout TeleporterEntity)
{
    ETeleporterState local_1 = ETeleporterState(0);
    if (TeleporterUtils::GetTeleporterState(InPlayerEntity, TeleporterDataId, TeleporterEntity, local_1))
    {
        return (int(local_1) == 1);
    }
    return false;
}
bool UnlockTeleporter(const FECSEntity &inout InPlayerEntity, const uint TeleporterDataId, const FECSEntity &inout TeleporterEntity)
{
    int local_22 = 0;
    if (TeleporterUtils::IsTeleporterUnlocked(InPlayerEntity, TeleporterDataId, TeleporterEntity) || TeleporterUtils::IsTeleporterActive(InPlayerEntity, TeleporterDataId, TeleporterEntity))
    {
        XError(ELog(22), FString().Append("Trying to unlock teleporter ").Append(TeleporterDataId).Append(" that is already unlocked or active"));
        return false;
    }
    FECSEntity local_12 = FASCommonUtils::GetUniquePlayerEntity(InPlayerEntity);
    if (!(local_12.IsValid()))
    {
        return false;
    }
    local_22.GetModify_UnlockedTeleporterDataIds().AddUnique(TeleporterDataId);
    return true;
}
bool ActivateTeleporter(const FECSEntity &inout InPlayerEntity, const uint TeleporterDataId, const FECSEntity &inout TeleporterEntity)
{
    int local_22 = 0;
    if (TeleporterUtils::IsTeleporterActive(InPlayerEntity, TeleporterDataId, TeleporterEntity))
    {
        XError(ELog(22), FString().Append("Trying to activate teleporter ").Append(TeleporterDataId).Append(" that is already active"));
        return false;
    }
    if (!(TeleporterUtils::IsTeleporterUnlocked(InPlayerEntity, TeleporterDataId, TeleporterEntity)))
    {
        XError(ELog(22), FString().Append("Trying to activate teleporter ").Append(TeleporterDataId).Append(" that is not unlocked"));
        return false;
    }
    FECSEntity local_12 = FASCommonUtils::GetUniquePlayerEntity(InPlayerEntity);
    if (!(local_12.IsValid()))
    {
        return false;
    }
    local_22.GetModify_TeleporterDataIds().AddUnique(TeleporterDataId);
    FFPTime local_30 = FFPTime(-1);
    SendEvent local_28;
    FCE_NofityTeleporterActivated& local_32 = local_28.opCall(local_30);
    if (local_32)
    {
        local_32.TeleporterDataId = TeleporterDataId;
    }
    return true;
}
bool TeleportPawnToEntity(const FECSEntity &inout PawnEntity, const FECSEntity &inout TargetEntity, const ELoadingScreenAction Action = ELoadingScreenAction::None, const bool bTeleportCamera = true)
{
    bool local_13;
    FVector local_6;
    int local_78 = 0;
    FRotator local_12;
    bool local_14 = TeleporterUtils::GetTeleportLocationAndRotation(TargetEntity, PawnEntity, local_6, local_12);
    if (!(local_14))
    {
        return false;
    }
    FECSEntity local_18;
    Get local_22;
    const FC_Collision& local_24 = local_22.opCall();
    if (local_24)
    {
        float32 local_25 = local_24.GetScaledHalfHeight();
        local_6.Z += local_25;
    }
    Get local_34;
    const FC_RuntimeMountSeatInfo& local_36 = local_34.opCall();
    if (local_36)
    {
        int local_37 = 1;
        for (; local_37 < local_36.GetRiddenByEntities().Num(); ++local_37)
        {
            FECSEntity local_44 = FECSEntity(local_36.GetRiddenByEntities()[local_37]);
            if (local_44.IsValid())
            {
                FMountUtils::EndMountAsPassenger(local_44, ECS::GetContextTime());
            }
        }
    }
    Get local_50;
    const FC_PawnRiddingMount& local_52 = local_50.opCall();
    if (local_52)
    {
        if (local_52.IsDriver())
        {
            FESMExternalTransitHandle local_60 = PawnEntity.ESMExternalTransitMainSM(n"Ride_Off", n"TeleportEndMount");
        }
        else
        {
            FMountUtils::EndMountAsPassenger(PawnEntity, ECS::GetContextTime());
        }
    }
    if (ECS::GetRuntimeInfo().IsServer && FASCommonUtils::GetUniquePlayerEntity(PawnEntity).IsValid())
    {
        FECSEntity local_64 = FASCommonUtils::GetRiderEntity(PawnEntity);
        if (local_64.IsValid())
        {
            bool local_66;
            local_66 = false;
            Get local_70;
            const FC_InteractionInfoForESM& local_72 = local_70.opCall();
            if (local_72)
            {
                if (local_72.GetTargetEntity().IsValid())
                {
                    local_66 = true;
                    local_18 = local_72.GetTargetEntity();
                    FFPTime local_46 = FFPTime(-1);
                    local_78.TargetEntity = local_72.GetTargetEntity();
                    local_78.InteractTargetPointAndBehaviorIndex = local_72.GetTargetPointAndBehaviorIndex();
                }
            }
            FName local_80 = ULevelGlobalSettings::GetTeleportKeepStateExitState(FESMUtils::GetCurrentMainSMStateName(local_64));
            local_13 = !(local_80.IsNone());
            if (local_66 || local_13)
            {
                FName local_89 = local_13 ? local_80 : ULevelGlobalSettings::GetTeleportLandStateName();
                bool local_65 = FESMUtils::MainSMHasState(local_64, local_89);
                if (local_65)
                {
                    FESMExternalTransitHandle local_60_2 = local_64.ESMExternalTransitMainSM(local_89, NAME_None);
                }
                FESMExternalTransitHandle local_60_3 = local_64.ESMExternalTransit(n"UpperSM", n"UB_Empty", n"TeleportUpperReset");
            }
        }
    }
    FFPTime local_46_2 = FFPTime(-1);
    FCE_TeleportToLocationRequest local_96;
    local_96.Location = local_6;
    local_96.Rotation = local_12;
    local_96.bSetCameraRotation = true;
    local_96.CameraRotation = local_12;
    local_96.bTeleportCamera = bTeleportCamera;
    local_96.bShowBlackScreen = true;
    local_96.Action = Action;
    local_96.bBlockInput = true;
    local_96.bWaitSelfDetached = true;
    local_96.WaitDetachChild = local_18;
    return true;
}
bool GetTeleporterState(const FECSEntity &inout InPlayerEntity, const uint TeleporterDataId, const FECSEntity &inout TeleporterEntity, ETeleporterState &inout OutTeleporterState)
{
    int local_16 = 0;
    int local_17 = 0;
    FECSEntity local_4 = FASCommonUtils::GetUniquePlayerEntity(InPlayerEntity);
    if (!(local_4.IsValid()))
    {
        return false;
    }
    if (!(local_16))
    {
        OutTeleporterState = ETeleporterState(1);
        return true;
    }
    bool local_9 = local_16.GetUnlockedTeleporterDataIds().Contains(TeleporterDataId);
    bool local_18 = local_16.GetTeleporterDataIds().Contains(TeleporterDataId);
    if (local_9)
    {
        OutTeleporterState = ETeleporterState(1);
        return true;
    }
    if (local_18)
    {
        local_17 = 2;
        OutTeleporterState = ETeleporterState(local_17);
        return true;
    }
    FECSWorldPtr local_22 = ECS::GetECSWorld();
    Get local_26;
    const FCS_Teleporters& local_28 = local_26.opCall();
    if (local_28)
    {
        if (local_28.GetTeleporters().Contains(TeleporterEntity))
        {
            if (local_28.GetTeleporters()[TeleporterEntity].IsSet())
            {
                OutTeleporterState = ETeleporterState(local_17);
                return true;
            }
        }
    }
    XError(ELog(22), FString().Append("Failed to get teleporter state for teleporter ").Append(TeleporterDataId).Append("."));
    return false;
}
FECSEntity FindNearestActiveTeleporter(const FECSEntity &inout InPlayerEntity, const FVector &inout ReferenceLocation)
{
    FECSEntity local_4;
    int local_12 = 0;
    int local_42;
    int local_43 = 0;
    int local_50 = 0;
    FECSWorldPtr local_6 = ECS::GetECSWorld();
    if (!(local_12))
    {
        return local_4;
    }
    float local_16 = -1.0;
    for (auto& local_36 : local_12.GetTeleporters())
    {
        FECSEntity local_40 = local_36.GetKey();
        if (!(local_40.IsValid()) || !(IsSet()))
        {
            continue;
        }
        local_42 = local_43;
        if (!(TeleporterUtils::IsTeleporterActive(InPlayerEntity, local_42, local_40)))
        {
            continue;
        }
        if (!(local_50))
        {
            continue;
        }
        float local_18 = local_50.GetPosition().DistSquared(ReferenceLocation);
        if ((local_16 < 0.0 || (local_18 < local_16)))
        {
            local_16 = local_18;
            local_4 = local_40;
        }
    }
    return local_4;
}
bool AreAllMapVisibleTeleportersActive(const FECSEntity &inout InPlayerEntity)
{
    int local_16 = 0;
    FECSEntity local_4 = FASCommonUtils::GetUniquePlayerEntity(InPlayerEntity);
    if (!(local_4.IsValid()))
    {
        return false;
    }
    TDataObjectIterator<FTeleporterConfig> local_32;
    for (; local_32; )
    {
        const FTeleporterConfig& local_34 = local_32.GetData();
        if (local_34.bDynamicTeleporter)
        {
        }
        else
        {
            if (!(local_34.bShowOnWorldMap) && !(local_34.bShowOnRegionMap))
            {
            }
            else
            {
                bool local_38;
                int local_36;
                local_36 = int(local_34.DataId);
                local_38 = false;
                if (local_16)
                {
                    local_38 = local_16.GetTeleporterDataIds().Contains(local_36) || (!(local_16.GetUnlockedTeleporterDataIds().Contains(local_36)) && (int(local_34.DefaultState) == 2));
                }
                else
                {
                    local_38 = (int(local_34.DefaultState) == 2);
                }
                if (!(local_38))
                {
                    return false;
                }
            }
        }
        local_32.Next();
    }
    return true;
}
}

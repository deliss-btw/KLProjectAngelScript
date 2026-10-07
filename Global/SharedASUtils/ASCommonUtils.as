
namespace FASCommonUtils
{
UFUNCTION()
void DestroyEntity(const FECSEntity &inout Entity)
{
    if ((!((Entity == ENTITY_NULL))))
    {
        Entity.DestroyDeferred();
    }
    return;
}
UFUNCTION()
FString GetEntityDisplayName(const FECSEntity &inout Entity)
{
    return FASCommonUtils::GetEntityDisplayNameText(Entity).ToString();
}
UFUNCTION()
FText GetEntityDisplayNameText(const FECSEntity &inout Entity)
{
    TDataObjectPtr<FBasePrefabConfig> local_24 = GetPrefabConfigPtr(Entity);
    if (local_24)
    {
        return local_24.opArrow().DisplayName;
    }
    return FText();
}
UFUNCTION()
FText GetPlayerName(const FECSEntity &inout Entity)
{
    int local_46 = 0;
    FText __return;
    if (FASCommonUtils::GetUniquePlayerEntity(Entity))
    {
        Get local_14;
        const FC_PlayerController& local_16 = local_14.opCall();
        if (local_16)
        {
            FString local_22 = FSocialTeamUtils::ClientGetSocialTeamMemberNameByUid(local_16.GetPlayerId());
            if (!(local_22.IsEmpty()))
            {
                return FText::FromString(local_22);
            }
            Get local_34;
            const FC_DSPlayerInfo& local_36 = local_34.opCall();
            if (local_36)
            {
                if (!(local_36.GetNickName().IsEmpty()))
                {
                    return FText::FromString(local_36.GetNickName());
                }
            }
            __return = FText::AsNumber(local_16.GetPlayerId(), FNumberFormattingOptions::DefaultNoGrouping());
        }
        else
        {
        }
    }
    Has local_40;
    bool local_9 = local_40.opCall();
    if (local_9)
    {
        Get local_44;
        FECSEntity local_8 = FECSEntity(local_44.opCall().GetPawnEntity());
        return local_46.DisplayName;
    }
    __return = FASCommonUtils::GetEntityDisplayNameText(Entity);
    return __return;
}
UFUNCTION()
EGenderType GetPlayerGender(const FECSEntity &inout Entity)
{
    if (FASCommonUtils::GetUniquePlayerEntity(Entity))
    {
        Get local_14;
        const FC_DSPlayerInfo& local_16 = local_14.opCall();
        if (local_16)
        {
            return local_16.GetGender();
        }
    }
    return EGenderType(0);
}
UFUNCTION()
FECSEntity GetUniquePlayerEntity(const FECSEntity &inout Entity)
{
    int local_22 = 0;
    Has local_4;
    bool local_5 = local_4.opCall();
    if (local_5)
    {
        return Entity;
    }
    FECSEntity local_10 = Entity;
    Get local_14;
    const FC_MountIsDrivenBy& local_16 = local_14.opCall();
    if (local_16)
    {
        local_10 = local_16.GetDriverEntity();
    }
    if (!(local_22))
    {
        return Entity;
    }
    return FECSEntity(local_22.GetPlayerEntity());
}
UFUNCTION()
FECSEntity GetUniqueAvatarPawnEntity(const FECSEntity &inout Entity)
{
    FASCommonUtils::GetUniquePlayerEntity(Entity);
    Has local_12;
    if (local_12.opCall() == false)
    {
        return ENTITY_NULL;
    }
    Get local_22;
    return FECSEntity(local_22.opCall().GetPlayerPawnEntity());
}
UFUNCTION()
FECSEntity GetUniquePawnEntityFromAIController(const FECSEntity &inout AIControllerEntity)
{
    Has local_4;
    bool local_6;
    if (!(local_4.opCall()) == !(false))
    {
        return ENTITY_NULL;
    }
    Get local_14;
    FECSEntity local_18 = FECSEntity(local_14.opCall().GetPawnEntity());
    if (!(local_18.IsValid()))
    {
        local_6 = false;
    }
    else
    {
        Has local_22;
        local_6 = local_22.opCall();
    }
    if (local_6)
    {
        Get local_26;
        local_18 = local_26.opCall().GetDriverEntity();
    }
    return local_18;
}
UFUNCTION()
FECSEntity GetPlayerPawnOrMountEntity(const FECSEntity &inout Entity, const bool bOnlyForDriver = true)
{
    Has local_4;
    bool local_5 = local_4.opCall();
    if (local_5)
    {
        return Entity;
    }
    FECSEntity local_10 = FECSEntity(ENTITY_NULL);
    Has local_14;
    bool local_5_2 = local_14.opCall();
    if (local_5_2)
    {
        Get local_18;
        local_10 = local_18.opCall().GetPlayerPawnEntity();
    }
    Has local_22;
    bool local_5_3 = local_22.opCall();
    if (local_5_3)
    {
        Get local_26;
        local_10 = FECSEntity(local_26.opCall().GetPawnEntity());
    }
    Get local_34;
    if (local_34.opCall())
    {
        GetDefaulted local_40;
        local_10 = local_40.opCall().GetPlayerPawnEntity();
    }
    Get local_44;
    const FC_ControlledByAI& local_46 = local_44.opCall();
    if (local_46)
    {
        FECSEntity local_30 = FECSEntity(local_46.GetControllerEntity());
        GetDefaulted local_50;
        local_10 = FECSEntity(local_50.opCall().GetPawnEntity());
    }
    if (local_10.IsValid())
    {
        Get local_54;
        const FC_PawnRiddingMount& local_56 = local_54.opCall();
        if (local_56)
        {
            if (bOnlyForDriver)
            {
                return local_56.IsDriver() ? local_56.GetMountEntity() : local_10;
            }
            return local_56.GetMountEntity();
        }
        return local_10;
    }
    return ENTITY_NULL;
}
FECSEntity GetRidingMountEntity(const FECSEntity &inout ControllerOrPawnEntity, const bool bOnlyForDriver = true)
{
    FECSEntity __return;
    FECSEntity local_4 = FECSEntity(ENTITY_NULL);
    Get local_8;
    const FC_PlayerController& local_10 = local_8.opCall();
    if (local_10)
    {
        local_4 = local_10.GetPlayerPawnEntity();
    }
    Get local_16;
    const FC_AIController& local_18 = local_16.opCall();
    if (local_18)
    {
        local_4 = FECSEntity(local_18.GetPawnEntity());
    }
    Get local_26;
    if (local_26.opCall())
    {
        GetDefaulted local_32;
        local_4 = local_32.opCall().GetPlayerPawnEntity();
    }
    Get local_36;
    const FC_ControlledByAI& local_38 = local_36.opCall();
    if (local_38)
    {
        FECSEntity local_22 = FECSEntity(local_38.GetControllerEntity());
        GetDefaulted local_42;
        local_4 = FECSEntity(local_42.opCall().GetPawnEntity());
    }
    if (local_4.IsValid())
    {
        FECSEntity local_22;
        Get local_46;
        const FC_PawnRiddingMount& local_48 = local_46.opCall();
        if (local_48)
        {
            if (bOnlyForDriver)
            {
                if (local_48.IsDriver())
                {
                    local_22 = local_48.GetMountEntity();
                }
                else
                {
                    local_22 = ENTITY_NULL;
                }
                return local_22;
            }
            __return = local_48.GetMountEntity();
        }
        else
        {
        }
    }
    return ENTITY_NULL;
}
UFUNCTION()
FAvatarPrefabConfig GetAvatarConfigData(const FECSEntity &inout Entity)
{
    FAvatarPrefabConfig __r;
    if ((GetAvatarConfig(Entity) == nullptr))
    {
        XError(ELog(0), "Not Found!!");
    }
    return __r;
}
UFUNCTION()
bool IsInCombat(const FECSEntity &inout Entity)
{
    bool local_1 = !((Entity == ENTITY_NULL));
    if (!(local_1))
    {
        local_1 = false;
    }
    else
    {
        FNameHandle_EntityBBVar local_6;
        local_6;
        local_1 = Entity.HasEntityBB(local_6);
    }
    if (local_1)
    {
        FNameHandle_EntityBBVarBool local_12;
        local_12;
        return Entity.GetBB_Bool(local_12);
    }
    return false;
}
UFUNCTION()
EDamageType GetAvatarDamageType(const FECSEntity &inout Entity)
{
    int local_51 = 0;
    if ((GetAvatarConfig(Entity) == nullptr))
    {
        XError(ELog(0), "Not Found!!");
    }
    return EDamageType(local_51);
}
UFUNCTION()
FMonsterPrefabConfig GetMonsterConfigData(const FECSEntity &inout Entity)
{
    FMonsterPrefabConfig __r;
    if ((GetMonsterConfig(Entity) == nullptr))
    {
        XError(ELog(0), "Not Found!!");
    }
    return __r;
}
UFUNCTION()
FPropPrefabConfig GetPropConfigData(const FECSEntity &inout Entity)
{
    FPropPrefabConfig __r;
    if ((GetPropConfig(Entity) == nullptr))
    {
        XError(ELog(0), "Not Found Prop Config!!");
    }
    return __r;
}
TDataObjectPtr<FPropPrefabConfig> GetPropConfigDataPtr(const FECSEntity &inout Entity)
{
    TDataObjectPtr<FPropPrefabConfig> local_48 = GetPropConfig(Entity);
    if ((local_48 == nullptr))
    {
        XError(ELog(0), "Not Found Prop Config!!");
    }
    return local_48;
}
TDataObjectPtr<FCombatUnitBaseConfig> GetCombatUnitBaseConfig(const FECSEntity &inout Entity)
{
    Get local_4;
    const FC_CreatureMeta& local_6 = local_4.opCall();
    if (local_6)
    {
        if (local_6.CreatureConfigProxy.GetMonsterConfig())
        {
            return GetCombatConfig();
        }
        if (local_6.CreatureConfigProxy.GetNPCConfig())
        {
            return GetCombatConfig();
        }
    }
    return TDataObjectPtr<FCombatUnitBaseConfig>(nullptr);
}
UFUNCTION()
bool IsAvatarPrefab(const FECSEntity &inout Entity)
{
    return (int(GetPrefabType(Entity)) == 1);
}
UFUNCTION()
bool IsMonsterPrefab(const FECSEntity &inout Entity)
{
    return (int(GetPrefabType(Entity)) == 2);
}
UFUNCTION()
EMonsterRank GetMonsterRank(const FECSEntity &inout Entity)
{
    int local_9 = 0;
    if ((!((Entity == ENTITY_NULL))))
    {
        Get local_6;
        const FC_MonsterInfo& local_8 = local_6.opCall();
        if (local_8)
        {
            local_9 = int(local_8.GetMonsterRank());
            return EMonsterRank(local_9);
        }
        if ((int(GetPrefabType(Entity))) == 2)
        {
            if (GetMonsterConfig(Entity))
            {
                return EMonsterRank(local_9);
            }
        }
    }
    return EMonsterRank(0);
}
UFUNCTION()
bool IsBossPrefab(const FECSEntity &inout Entity)
{
    EMonsterRank local_9 = EMonsterRank(0);
    if ((!((Entity == ENTITY_NULL))))
    {
        Get local_6;
        const FC_MonsterInfo& local_8 = local_6.opCall();
        if (local_8)
        {
            local_9 = local_8.GetMonsterRank();
            return (int(local_9) == 2);
        }
        if ((int(GetPrefabType(Entity))) == 2)
        {
            if (GetMonsterConfig(Entity))
            {
                return (int(local_9) == 2);
            }
        }
    }
    return false;
}
UFUNCTION()
bool IsPropPrefab(const FECSEntity &inout Entity)
{
    return (int(GetPrefabType(Entity)) == 3);
}
bool IsNPC(const FECSEntity &inout Entity)
{
    return Entity.MatchGameplayTag(GameplayTags::Character_NPC);
}
UFUNCTION()
FECSEntity GetLocalPlayerProxy()
{
    if (ECS::GetECSWorld().IsValid())
    {
        Get local_12;
        const FCS_LocalPlayer& local_8 = local_12.opCall();
        if (local_8)
        {
            return local_8.PlayerEntity;
        }
    }
    return UECSFunctionLibraryExtension::GetLocalPlayerEntity(__GetWorldContext());
}
UFUNCTION()
EGenderType GetLocalPlayerGender()
{
    FECSEntity local_4 = FASCommonUtils::GetLocalPlayerProxy();
    if (local_4)
    {
        return FASCommonUtils::GetPlayerGender(local_4);
    }
    return EGenderType(0);
}
FECSEntity GetAvatarEntity()
{
    FECSEntity local_4;
    int local_138 = 0;
    FECSEntity __return;
    FECSWorldPtr local_6 = FECSWorldPtr(ECS::GetECSWorld());
    if (!(local_6.IsValid()))
    {
        return local_4;
    }
    Has local_124;
    if (ECS::GetRuntimeInfo().IsServer)
    {
        FECSRuntimeView local_28 = local_6.GetRuntimeView(EECSRuntimeViewType(2));
        Include local_50;
        local_50.opCall();
        FECSRuntimeViewIterator local_84 = local_28.Iterator();
        for (; local_84.CanProceed;)
        {
            const FECSEntity& local_120 = local_84.Proceed();
            if (local_124.opCall() && local_120.IsActive())
            {
                Get local_130;
                const FC_MountIsDrivenBy& local_132 = local_130.opCall();
                if (local_132)
                {
                    return local_132.GetDriverEntity();
                }
                return local_120;
            }
        }
    }
    else
    {
        if (ECS::GetRuntimeInfo().IsClient)
        {
            if (!(local_138))
            {
                return local_4;
            }
            FECSEntity local_142 = FECSEntity(local_138.GetPlayerPawnEntity());
            if (!(local_142.IsValid()))
            {
                return local_4;
            }
            __return = local_142;
        }
        else
        {
        }
    }
    __return = local_4;
    return __return;
}
UFUNCTION()
FECSEntity GetLocalUniquePlayerEntity()
{
    FECSEntity local_8 = FASCommonUtils::GetLocalPlayerPawnEntity();
    if ((local_8 == ENTITY_NULL))
    {
        return local_8;
    }
    return FASCommonUtils::GetUniquePlayerEntity(local_8);
}
UFUNCTION()
FECSEntity GetControlledPawnEntity(const FECSEntity &inout PlayerEntity)
{
    Has local_4;
    bool local_5 = local_4.opCall();
    if (local_5)
    {
        Get local_10;
        return local_10.opCall().GetPlayerPawnEntity();
    }
    else
    {
        Has local_14;
        bool local_5_2 = local_14.opCall();
        if (local_5_2)
        {
            Get local_18;
            return FECSEntity(local_18.opCall().GetPawnEntity());
        }
        else
        {
            return PlayerEntity;
        }
    }
}
UFUNCTION()
FVector FindLegalLocationExt(const FECSEntity &inout PawnEntity, const FVector &inout CenterLocation, const float32 MaxRadius, const float32 StepSize, const int NumRays, const FVector &inout Extent, const bool bSampleCenterPoint)
{
    return FAIPathFollowUtils::FindLegalLocationExt(PawnEntity, CenterLocation, MaxRadius, StepSize, NumRays, Extent, bSampleCenterPoint, true, false, true, false);
}
UFUNCTION()
FVector FindLegalLocationByPrefab(bool &inout bOutHasLegalPos, const FECSEntity &inout ContextEntity, const AECSPrefab Prefab, const FVector &inout CenterLocation, const FQuat &inout Rotation, const float32 MaxRadius, const float32 StepSize, const int NumRays, const bool bSampleCenterPoint)
{
    return FAIPathFollowUtils::FindLegalLocationByPrefab(bOutHasLegalPos, ContextEntity, Prefab, CenterLocation, Rotation, MaxRadius, StepSize, NumRays, bSampleCenterPoint, true, true);
}
APlayerController GetLocalPlayerController()
{
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    if (local_4.IsValid())
    {
        Get local_12;
        const FCS_LocalPlayer& local_8 = local_12.opCall();
        if (local_8)
        {
            return local_8.UEPlayerController;
        }
    }
    return UECSFunctionLibraryExtension::GetLocalPlayerController(__GetWorldContext());
}
UFUNCTION()
FECSEntity GetLocalPlayerPawnEntity()
{
    return UECSFunctionLibraryExtension::GetLocalPlayerPawnEntity(__GetWorldContext());
}
UFUNCTION()
FECSEntity GetLocalPlayerPawnEntityByWorld(const UObject WorldContextObject)
{
    UWorld local_10;
    if (WorldContextObject != nullptr)
    {
        local_10 = WorldContextObject.GetWorld();
    }
    else
    {
    }
    return UECSFunctionLibraryExtension::GetLocalPlayerPawnEntityByUEWorld(local_10);
}
FECSEntity GetLocalPlayerBackGroundPawnEntity()
{
    int local_10 = 0;
    FASCommonUtils::GetLocalUniquePlayerEntity();
    if (!(local_10))
    {
        return ENTITY_NULL;
    }
    for (auto& local_26 : local_10.GetAllPlayerPawnEntities())
    {
        if (!((local_26 == local_10.GetPlayerPawnEntity())))
        {
            return local_26;
        }
    }
    XError(ELog(0), "Can't Find BackGround Entity!");
    return ENTITY_NULL;
}
FECSEntity GetRiderEntity(const FECSEntity &inout ControlledEntity)
{
    bool local_1;
    if (!((!((ControlledEntity == ENTITY_NULL)))))
    {
        local_1 = false;
    }
    else
    {
        Has local_6;
        local_1 = local_6.opCall();
    }
    if (local_1)
    {
        Get local_12;
        return local_12.opCall().GetDriverEntity();
    }
    return ControlledEntity;
}
void GetEntityAllPlayerPawnEntities(const FECSEntity &inout Entity, TArray<FECSEntity> &inout OutEntities)
{
    int local_10 = 0;
    FASCommonUtils::GetUniquePlayerEntity(Entity);
    if (!(local_10))
    {
        OutEntities.Add(Entity);
        return;
    }
    for (auto& local_26 : local_10.GetAllPlayerPawnEntities())
    {
        OutEntities.Add(local_26);
    }
    return;
}
TArray<FECSEntity> GetAllPlayerPawnEntitiesInRange(const FVector &inout Location, const float32 Range, const bool bIncludeBackGround = true)
{
    Get local_130;
    TArray<FECSEntity> local_4;
    FECSWorldPtr local_8 = ECS::GetECSWorld();
    FECSRuntimeView local_46 = local_8.GetRuntimeView(EECSRuntimeViewType(2));
    Include local_50;
    local_50.opCall();
    FECSRuntimeViewIterator local_84 = local_46.Iterator();
    for (; local_84.CanProceed;)
    {
        local_84.Proceed();
        FECSEntity local_126 = local_130.opCall().GetPlayerPawnEntity();
        Get local_134;
        const FC_Transform& local_136 = local_134.opCall();
        if (local_136)
        {
            if (local_136.GetPosition().Distance(Location) <= Range)
            {
                if (bIncludeBackGround)
                {
                    for (auto& local_154 : local_130.opCall().GetAllPlayerPawnEntities())
                    {
                        local_4.Add(local_154);
                    }
                }
                else
                {
                    local_4.Add(local_126);
                }
            }
        }
    }
    return local_4;
}
int GetTargetLockPointIndex(const FECSEntity &inout SourceEntity, const FECSEntity &inout TargetEntity)
{
    int local_1 = -1;
    Has local_6;
    bool local_7 = local_6.opCall();
    if (local_7)
    {
        local_1 = FLockTargetUtils::GetBestAILockPointIndexWithOverride(SourceEntity, TargetEntity);
    }
    return local_1;
}
UFUNCTION()
AAS_ECSPlayerController GetASECSProxyPlayerController()
{
    return Cast<AAS_ECSPlayerController>(FASCommonUtils::GetLocalPlayerController());
}
FString GetPlatformUserName()
{
    return System::GetPlatformUserName();
}
EFactionRelation PickFactionRelationBetween(const EFactionRelation RelationA, const EFactionRelation RelationB)
{
    if ((int(RelationA) == 2 || (int(RelationB) == 2)))
    {
        return EFactionRelation(2);
    }
    if ((int(RelationA) == 1 || (int(RelationB) == 1)))
    {
        return EFactionRelation(1);
    }
    return EFactionRelation(4);
}
EFactionRelation GetDefaultFactionRelation(const EFaction FactionA, const EFaction FactionB)
{
    UDataTable local_2;
    TArray<EFactionRelation> local_36;
    if (local_2 != nullptr)
    {
        FDamageFactionRelationConfig local_30;
        EFactionRelation local_8;
        EFactionRelation local_6;
        local_6 = EFactionRelation(1);
        local_8 = EFactionRelation(1);
        if (local_2.FindRow(FName(UEnum::GetEnumType(n"EFaction").GetNameStringByValue(int(FactionA))), local_30))
        {
            int local_38 = int(FactionB);
            local_36 = local_30.ToRelationArray();
            local_6 = local_36[local_38];
        }
        if (local_2.FindRow(FName(UEnum::GetEnumType(n"EFaction").GetNameStringByValue(int(FactionB))), local_30))
        {
            int local_9 = int(FactionB);
            local_36 = local_30.ToRelationArray();
            local_8 = local_36[local_9];
        }
        return FASCommonUtils::PickFactionRelationBetween(EFactionRelation(local_6), EFactionRelation(local_8));
    }
    return EFactionRelation(1);
}
EFactionRelation GetEntityFactionRelation(const FECSEntity &inout EntityA, const FECSEntity &inout EntityB)
{
    int local_60 = 0;
    int local_62 = 0;
    int local_68 = 0;
    bool local_1 = (EntityA == ENTITY_NULL) || (EntityB == ENTITY_NULL);
    if (local_1)
    {
        XWarning(ELog(2), "[GetEntityFactionRelation] EntityA or EntityB is NULL");
        return EFactionRelation(1);
    }
    FECSWorldPtr local_6 = EntityA.GetWorld();
    GetDefaulted local_10;
    if (int(local_10.opCall().GetGameModeType()) != 0)
    {
        Has local_18;
        if (!(local_18.opCall()))
        {
            local_1 = false;
        }
        else
        {
            local_1 = local_18.opCall();
        }
        if (local_1)
        {
            Get local_22;
            FECSEntity local_26 = local_22.opCall().GetPlayerEntity();
            FECSEntity local_30 = local_22.opCall().GetPlayerEntity();
            Get local_42;
            Get local_38;
            if (local_38.opCall().GetTeam() != local_42.opCall().GetTeam())
            {
                return EFactionRelation(2);
            }
        }
    }
    Get local_48;
    const FC_EcosimAIV2DamageRelationOverride& local_50 = local_48.opCall();
    if (local_50)
    {
        FEcosimAIV2DamageRelationOverrideData local_52;
        if (local_50.GetDamageRelationOverrideMap().Find(FTargetEntity(EntityB), local_52))
        {
            return local_52.GetDamageRelation();
        }
    }
    EFactionRelation local_69 = EFactionRelation(1);
    if (!(!(local_60)) && local_62)
    {
        if (local_68)
        {
            if (local_68.GetRelations().IsValidIndex(int(local_62.GetFactionId())))
            {
                local_69 = local_68.GetRelations()[int(local_62.GetFactionId())];
            }
        }
        else
        {
            FString local_78 = ((FString("EntityA ") + EntityA.ToString()) + " do not have FC_DamageFactionRelation");
            XWarning(ELog(0), local_78);
        }
    }
    return local_69;
}
EFactionRelationSplitSelf GetEntityFactionRelationSplitSelf(const FECSEntity &inout EntityA, const FECSEntity &inout EntityB)
{
    if ((EntityA == EntityB))
    {
        return EFactionRelationSplitSelf(8);
    }
    return EFactionRelationSplitSelf((int((FASCommonUtils::GetEntityFactionRelation(EntityA, EntityB)))));
}
FFactionBitMask GetFactionBitMaskByRelation(const EFaction SourceFaction, const EFactionRelation Relation)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    FFactionBitMask __r; return __r;
}
bool IsTargetEntityEnemy(const FECSEntity &inout SelfEntity, const FECSEntity &inout TargetEntity)
{
    return (int((FASCommonUtils::GetEntityFactionRelation(SelfEntity, TargetEntity))) == 2);
}
bool IsTargetEntityNetural(const FECSEntity &inout SelfEntity, const FECSEntity &inout TargetEntity)
{
    return (int((FASCommonUtils::GetEntityFactionRelation(SelfEntity, TargetEntity))) == 1);
}
bool IsTargetEntityFriend(const FECSEntity &inout SelfEntity, const FECSEntity &inout TargetEntity)
{
    return (int((FASCommonUtils::GetEntityFactionRelation(SelfEntity, TargetEntity))) == 4);
}
bool RandomSuccess(const float32 Rate)
{
    int local_1 = 100000;
    return ((FMath::RandRange(0, local_1)) <= (local_1 * Rate));
}
UFUNCTION()
FString GetEntityLowerName(const FECSEntity &inout Entity)
{
    if ((!((Entity == ENTITY_NULL))))
    {
        return Entity.GetEntityName().ToString().ToLower();
    }
    return "";
}
UFUNCTION()
bool IsCharacterEntityAlive(const FECSEntity &inout Entity)
{
    if (!(Entity.IsValid()))
    {
        return false;
    }
    Has local_6;
    if (local_6.opCall())
    {
        return false;
    }
    return true;
}
UFUNCTION()
bool IsEntityActiveAndAlive(const FECSEntity &inout Entity)
{
    if (!(Entity.IsValid()) || !(Entity.IsActive()))
    {
        return false;
    }
    Has local_6;
    bool local_1 = local_6.opCall();
    if (local_1)
    {
        return false;
    }
    return true;
}
UFUNCTION()
bool IsEntityDeath(const FECSEntity &inout Entity)
{
    if (!(Entity.IsValid()))
    {
        return true;
    }
    Has local_6;
    if (local_6.opCall())
    {
        return true;
    }
    return false;
}
FVector GetEntityLocation(const FECSEntity &inout Entity)
{
    Has local_4;
    bool local_5 = local_4.opCall();
    if (local_5)
    {
        Get local_10;
        return local_10.opCall().GetPosition();
    }
    XError(ELog(0), "No Transform!");
    return FVector::ZeroVector;
}
float32 CalculateEntityDistanceZ(const FECSEntity &inout Entity1, const FECSEntity &inout Entity2, const bool bSigned = true, const bool bIgnoreHalfHeight = true)
{
    float32 local_15;
    int local_28 = 0;
    int local_30 = 0;
    Get local_4;
    const FC_Transform& local_6 = local_4.opCall();
    if (local_6)
    {
        Get local_12;
        const FC_Transform& local_14 = local_12.opCall();
        if (local_14)
        {
            float32 local_21 = float32((local_14.GetPosition().Z - local_6.GetPosition().Z));
            if (bIgnoreHalfHeight)
            {
                if (!(!(local_28)) && local_30)
                {
                    local_15 = local_30.GetScaledHalfHeight();
                    local_15 = local_21 - local_15;
                    local_21 = local_15 + local_28.GetScaledHalfHeight();
                }
            }
            if (bSigned)
            {
                local_15 = local_21;
            }
            else
            {
                local_15 = FMath::Abs(local_21);
            }
            return local_15;
        }
    }
    return 0.0f;
}
float32 CalculateEntityDistance2D(const FECSEntity &inout Entity1, const FECSEntity &inout Entity2, const bool bIncludeSelfAndTargetRadius = true)
{
    Get local_4;
    const FC_Transform& local_6 = local_4.opCall();
    if (local_6)
    {
        Get local_12;
        const FC_Transform& local_14 = local_12.opCall();
        if (local_14)
        {
            float32 local_19 = float32(local_6.GetPosition().Dist2D(local_14.GetPosition()));
            if (bIncludeSelfAndTargetRadius)
            {
                Get local_24;
                const FC_Collision& local_26 = local_24.opCall();
                if (local_26)
                {
                    local_19 = local_19 - local_26.GetScaledRadius();
                }
                const FC_Collision& local_26_2 = local_24.opCall();
                if (local_26_2)
                {
                    local_19 = local_19 - local_26_2.GetScaledRadius();
                }
            }
            return float32((FMath::Max(0.0, local_19)));
        }
    }
    return 0.0f;
}
float32 CalculateEntityDistance3D(const FECSEntity &inout Entity1, const FECSEntity &inout Entity2)
{
    Get local_4;
    const FC_Transform& local_6 = local_4.opCall();
    if (local_6)
    {
        Get local_12;
        const FC_Transform& local_14 = local_12.opCall();
        if (local_14)
        {
            Get local_24;
            float32 local_19 = float32(local_6.GetPosition().Distance(local_14.GetPosition()));
            const FC_Collision& local_26 = local_24.opCall();
            if (local_26)
            {
                local_19 = local_19 - local_26.GetScaledRadius();
            }
            const FC_Collision& local_26_2 = local_24.opCall();
            if (local_26_2)
            {
                local_19 = local_19 - local_26_2.GetScaledRadius();
            }
            return float32((FMath::Max(0.0, local_19)));
        }
    }
    return 0.0f;
}
float GetPointDistToLine(const FVector &inout BasePoint, const FVector &inout LinePointA, const FVector &inout LinePointB)
{
    FVector local_12 = (LinePointA - LinePointB);
    local_12.Normalize(9.99999993922529e-9);
    FVector local_6 = (BasePoint - LinePointB);
    local_6.Normalize(9.99999993922529e-9);
    float local_26 = FMath::Sin(FMath::Acos(local_6.DotProduct(local_12)));
    return local_6.Size() * local_26;
}
FVector GetEntitiesCenterLocation(const TArray<FECSEntity> &inout Entities)
{
    FVector local_6(FVector::ZeroVector);
    for (auto& local_22 : Entities)
    {
        local_22;
        GetDefaulted local_32;
        local_6 += FVector(local_32.opCall().GetPosition());
    }
    if (Entities.Num() > 0)
    {
        local_6 /= Entities.Num();
    }
    return local_6;
}
bool IsEntitySyncToPlayer(const FECSEntity &inout Entity, const FECSEntity &inout PlayerEntity)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return false;
    }
    Get local_6;
    const FC_NetRelevancePolicy& local_8 = local_6.opCall();
    if (local_8)
    {
        switch (int(local_8.RelevancePolicyType))
        {
        case 0:
        case 2:
        case 5:
        {
            return true;
        }
        case 1:
        {
            return false;
        }
        case 3:
        {
            Get local_16;
            const FC_Owner& local_18 = local_16.opCall();
            if (local_18)
            {
                return FASCommonUtils::IsEntitySyncToPlayer(local_18.GetOwnerEntity(), PlayerEntity);
            }
            return false;
        }
        case 4:
        {
            Get local_26;
            const FC_NetPredict& local_28 = local_26.opCall();
            if (local_28)
            {
                if (FASCommonUtils::GetUniquePlayerEntity(PlayerEntity))
                {
                    Get local_36;
                    const FC_PlayerController& local_38 = local_36.opCall();
                    if (local_38)
                    {
                        return local_28.GetMask().GetBit(local_38.GetPlayerIndex());
                    }
                }
            }
            return false;
        }
        default:
        {
            return false;
        }
        }
    }
    else
    {
    }
    return true;
}
FRandomGenerator CreateRandomGenerator(const FECSEntity &inout Entity, const uint InSeed = 0)
{
    FFPTime local_4 = FFPTime(ECS::GetECSWorld().GetFixedTime().Time);
    return FASCommonUtils::CreateRandomGenerator(Entity, local_4, InSeed);
}
FRandomGenerator CreateRandomGenerator(const FECSEntity &inout Entity, const FFPTime &inout CurrentTime, const uint InSeed = 0)
{
    int local_12 = 0;
    int local_26 = 0;
    Has local_4;
    bool local_5 = local_4.opCall();
    if (local_5)
    {
        return local_12.CreateGenerator(0, FFPTime(CurrentTime.GetTicks()), InSeed);
    }
    else
    {
        FECSWorldPtr local_20 = ECS::GetECSWorld();
        return local_26.CreateGenerator(0, CurrentTime, InSeed);
    }
}
FText GetWeaponTypeDisplayName(const EWeaponType WeaponType)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    FText __r; return __r;
}
FSoftBrush GetWeaponTypeDisplayBrush(const EWeaponType WeaponType)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    FSoftBrush __r; return __r;
}
int64 GetTimestamp()
{
    return FDateTime::UtcNow().ToUnixTimestamp();
}
bool IsConnectedToGameServer()
{
    if (ECS::GetRuntimeInfo().IsServer)
    {
        UGameDSConnectionSubsystem local_6 = UGameDSConnectionSubsystem::Get();
        if (local_6 != nullptr)
        {
            return local_6.IsConnectedToGameServer();
        }
        return false;
    }
    UGameClientConnectionSubsystem local_10 = UGameClientConnectionSubsystem::Get();
    if (local_10 != nullptr)
    {
        return local_10.IsConnectedToGameServer();
    }
    return false;
}
void SetEntityBehaviorTreeRunState(const FECSEntity &inout Entity, const bool bShouldRun)
{
    int local_6 = 0;
    int local_22 = 0;
    if (local_6)
    {
        FECSEntity local_16 = FECSEntity(local_6.GetControllerEntity());
        if (!(!(local_22)) && (!(local_22.GetbShouldRun()) != !(bShouldRun)))
        {
            local_22.SetbShouldRun(bShouldRun);
        }
    }
    return;
}
bool IsEntityOnGround(const FECSEntity &inout Entity)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    bool __r; return __r;
}
bool IsLocationUnderSky(const FVector &inout Location, const FECSEntity &inout CheckByEntity)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    bool __r; return __r;
}
bool IsEntityUnderSky(const FECSEntity &inout Entity, const bool bIncludeCollisionRadius = false, const float32 SpecifiedCollisionRadius = -1)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    bool __r; return __r;
}
FString GetEntityShowName(const FECSEntity &inout Entity)
{
    return FASCommonUtils::GetMonsterConfigData(Entity).DisplayName.ToString();
}
void TeleportEntityToTransform(const FECSEntity &inout Entity, const FVector &inout TargetLocation, const FRotator &inout TargetRotation)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
uint GetPlayerUidFromPlayerEntity(const FECSEntity &inout PlayerEntity)
{
    Get local_4;
    const FC_PlayerController& local_6 = local_4.opCall();
    if (local_6)
    {
        return FASCommonUtils::GetPlayerUidFromPlayerEntityInternal(PlayerEntity, local_6);
    }
    return 0;
}
uint GetPlayerUidFromPlayerEntityInternal(const FECSEntity &inout PlayerEntity, const FC_PlayerController &inout C_PlayerController)
{
    return C_PlayerController.GetPlayerId();
}
FECSEntity FindPlayerEntityByUid(const uint TargetPlayerUid)
{
    TArray<FECSEntity> local_10 = FGameUtils::GetAllPlayerControllerEntities(true);
    for (auto& local_24 : local_10)
    {
        if (FASCommonUtils::GetPlayerUidFromPlayerEntity(local_24) == TargetPlayerUid)
        {
            return local_24;
        }
    }
    return FECSEntity();
}
EAvatarIllustrate TalentDivisionToIllustrate(const ETalentDivision TalentDivision)
{
    switch (int(TalentDivision))
    {
    case 1:
    {
        return EAvatarIllustrate(0);
    }
    case 2:
    {
        return EAvatarIllustrate(1);
    }
    case 3:
    {
        return EAvatarIllustrate(2);
    }
    default:
    {
    }
    }
    return EAvatarIllustrate(0);
}
}

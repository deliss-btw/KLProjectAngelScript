
namespace FGameModeUtils
{
    const FConsoleVariable CVar_GameMode_UseUniversalSystem = FConsoleVariable();
    const FName TacticalSlotName_Attack1 = n"ConsumableItem_Attack_1";
    const FName TacticalSlotName_Attack2 = n"ConsumableItem_Attack_2";

EFCS_GameStageType GetGameStageType()
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    return 0.GetStageType();
}
bool IsInitialLoadingComplete()
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Has local_6;
    return !(local_6.opCall());
}
int GetCombatRestrictionPotionMaxCount()
{
    int local_14 = 0;
    int local_26 = 0;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Has local_6;
    if (!(local_6.opCall()))
    {
        return -1;
    }
    FECSWorldPtr local_2_2 = ECS::GetECSWorld();
    if (!(local_14.HasCombatRestriction(ECombatRestrictionFlags(2))))
    {
        return -1;
    }
    FECSWorldPtr local_2_3 = ECS::GetECSWorld();
    Has local_20;
    if (!(local_20.opCall()))
    {
        return -1;
    }
    FECSWorldPtr local_2_4 = ECS::GetECSWorld();
    if (!(local_26.GameModeFlowSettings.IsValid()))
    {
        return -1;
    }
    FGameModeFlowSettings local_78;
    return local_78.CombatRestriction.PotionMaxCount;
}
FName GetCombatRestrictionDivineSkillFilterTag()
{
    int local_14 = 0;
    int local_26 = 0;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Has local_6;
    if (!(local_6.opCall()))
    {
        return NAME_None;
    }
    FECSWorldPtr local_2_2 = ECS::GetECSWorld();
    if (!(local_14.HasCombatRestriction(ECombatRestrictionFlags(8))))
    {
        return NAME_None;
    }
    FECSWorldPtr local_2_3 = ECS::GetECSWorld();
    Has local_20;
    if (!(local_20.opCall()))
    {
        return NAME_None;
    }
    FECSWorldPtr local_2_4 = ECS::GetECSWorld();
    if (!(local_26.GameModeFlowSettings.IsValid()))
    {
        return NAME_None;
    }
    FGameModeFlowSettings local_78;
    return local_78.CombatRestriction.DivineSkillFilterTag;
}
FName GetDivineSkillDisplayTag()
{
    FName local_2(NAME_None);
    if ((local_2 == NAME_None))
    {
        TDataObjectPtr<FLevelInfoConfig> local_28 = FLevelUtils::GetCurrentLevelInfoConfig(nullptr);
        if (local_28)
        {
            TDataObjectPtr<FGameRuleConfig> local_76 = local_28.opArrow().GetGameRuleConfig();
            if (local_76)
            {
                local_2 = local_76.opArrow().DivineSkillDisplayTag;
            }
        }
    }
    return local_2;
}
bool IsTacticalItemDisabled()
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Get local_6;
    const FCS_GameMode& local_8 = local_6.opCall();
    if (local_8)
    {
        return local_8.HasCombatRestriction(ECombatRestrictionFlags(4));
    }
    return false;
}
bool IsTacticalSlotRestricted(const TDataObjectPtr<FItemQuickSlotConfig> &inout SlotConfig)
{
    if (!(SlotConfig))
    {
        return false;
    }
    FName local_3(SlotConfig.GetDataName());
    if ((!((local_3 == FGameModeUtils::TacticalSlotName_Attack1)) && !((local_3 == FGameModeUtils::TacticalSlotName_Attack2))))
    {
        return false;
    }
    return FGameModeUtils::IsTacticalItemDisabled();
}
UFUNCTION()
void GameModeFinish(const TArray<int> &inout WinnerTeamIds, const TArray<int> &inout LoserTeamIds)
{
    int local_12 = 0;
    FFPTime local_8 = FFPTime(-1);
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    local_12.WinnerTeamIds = WinnerTeamIds;
    local_12.LoserTeamIds = LoserTeamIds;
    return;
}
void InitTeamSpawner(const FECSWorldPtr &inout ECSWorld)
{
    int local_6 = 0;
    int local_12 = 0;
    int local_146 = 0;
    UKLGameModeSettings local_14 = (Cast<UKLGameModeSettings>(UECSGameModeSettingsBase::Get(ECS::GetUEWorld())));
    FECSRuntimeView local_60 = ECSWorld.GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
    Include local_64;
    local_64.opCall();
    Exclude(local_60).opCall();
    FECSRuntimeViewIterator local_102 = local_60.Iterator();
    for (; local_102.CanProceed;)
    {
        const FECSEntity& local_138 = local_102.Proceed();
        local_12.Spawners.Add(local_138);
        if (!(local_146.SupportGameModes.Contains(TSoftClassPtr<UKLGameModeSettings>(local_14.GetClass()))))
        {
            continue;
        }
        for (auto local_171 : local_146.Team)
        {
            local_6.GetModify_TeamSpawners().FindOrAdd(local_171).GetSpawners().Add(local_138.GetId());
        }
    }
    Remove local_180;
    local_180.opCall();
    Remove local_184;
    local_184.opCall();
    return;
}
void InitAttributeScale(const FECSWorldPtr &inout ECSWorld)
{
    int local_20 = 0;
    local_20.SetAttributeScaleConfig(UGameplayConfigsManager::GetAttributeScaleConfig());
    local_20.SetCurScalePlayerNum(1);
    return;
}
void AddMetaBuffToPlayer(const FPbDsPlayerInfo &inout PlayerInfo, const FECSEntity &inout PlayerEntity)
{
    TArray<FPbUint32Pair> local_4;
    PlayerInfo.GetBuffList(local_4);
    for (auto& local_20 : local_4)
    {
        TDataObjectPtr<FMetaBuffConfig> local_46 = FMetaBuffConfig::GetByDataId(local_20.GetFirst());
        if (local_46)
        {
            FName local_182;
            int local_115;
            int local_75;
            TArray<TDataObjectPtr<FGameplayModifierConfig>> local_74;
            local_75 = 0;
            for (; local_75 < PlayerInfo.GetNewBuffList_Num(); ++local_75)
            {
                if (PlayerInfo.GetNewBuffList_Index(local_75).GetKey() == local_20.GetFirst())
                {
                    FPbUint32ListPair local_86 = PlayerInfo.GetNewBuffList_Index(local_75);
                    TArray<uint> local_102;
                    local_86.GetValues(local_102);
                    auto local_108 = local_102.Iterator();
                    for (; local_108.CanProceed;)
                    {
                        local_74.Add(FGameplayModifier::GetByDataId(local_108.Proceed()));
                    }
                    break;
                }
            }
            TArray<TDataObjectPtr<FMetaBuffCapabilityConfig>> local_146;
            local_115 = 0;
            for (; local_115 < PlayerInfo.GetMetaBuffCapList_Num(); ++local_115)
            {
                if (PlayerInfo.GetMetaBuffCapList_Index(local_115).GetKey() == local_20.GetFirst())
                {
                    FPbUint32ListPair local_98 = PlayerInfo.GetMetaBuffCapList_Index(local_115);
                    TArray<uint> local_102;
                    local_98.GetValues(local_102);
                    auto local_114 = local_102.Iterator();
                    for (; local_114.CanProceed;)
                    {
                        local_146.Add(FMetaBuffCapabilityConfig::GetByDataId(local_114.Proceed()));
                    }
                    break;
                }
            }
            bool local_17 = FMetaBuffUtils::AddMetaBuffWithStartTime(PlayerEntity, local_46, local_74, local_146, local_20.GetSecond());
            int local_21 = local_20.GetSecond();
            local_182.GetDataName();
            Get local_180;
            XLog(ELog(26), FString().Append("AddMetaBuffToPlayer: PlayerId=").Append(local_180.opCall().GetPlayerId()).Append(", BuffId=").Append(local_20.GetFirst()).Append(", BuffName=").Append(local_182).Append(", StartTime=").Append(local_21).Append(", bAdded=").Append(local_17));
            continue;
        }
        XError(ELog(26), FString().Append("AddMetaBuffToPlayer failed: MetaBuffConfig is invalid, BuffId=").Append(local_20.GetFirst()));
    }
    return;
}
bool IsWaitingForStartUpPlayers(const FECSWorldPtr &inout ECSWorld)
{
    int local_22 = 0;
    int local_1 = 1084227584;
    AKLGameModeMP local_10 = (Cast<AKLGameModeMP>(Gameplay::GetGameMode(__GetWorldContext())));
    if (local_10 != nullptr)
    {
        if (local_10.bSkipDSGlobalInfo)
        {
            return false;
        }
    }
    if (FGameModeUtils::HasReceivedAllStartPlayersFromGS())
    {
        return false;
    }
    Has local_16;
    if (!(local_16.opCall()))
    {
        return true;
    }
    FFPTime local_24 = local_22.WaitStartTime;
    if (local_24.opCmp(0.0) <= 0)
    {
        local_22.WaitStartTime = ECS::GetContextTime();
    }
    float32 local_2 = float32(((ECS::GetContextTime() - local_22.WaitStartTime).ToSeconds()));
    if (local_2 < 5.0f)
    {
        return true;
    }
    XLog(ELog(33), FString().Append("WaitingForStartUpPlayers timed out after ").Append(local_2).Append("s, proceeding without all players"));
    return false;
}
void HandleClientJoin()
{
    AKLGameModeMP local_8 = (Cast<AKLGameModeMP>(Gameplay::GetGameMode(__GetWorldContext())));
    if (local_8 != nullptr)
    {
        local_8.HandlePendingClientConnections();
    }
    return;
}
void SpawnAvatarsForPlayer(const FECSEntity &inout PlayerProxy, FC_PlayerController &inout PlayerController, const FCS_PlayerSpawnerIndex &inout SpawnerIndex)
{
    FVector local_6(FVector::ZeroVector);
    FQuat local_16 = FQuat(FQuat::Identity);
    TDataObjectPtr<FLevelInfoConfig> local_64 = FLevelUtils::GetCurrentLevelInfoConfig(nullptr);
    bool local_65 = false;
    if (!(FGameModeUtils::GetSpawnLocationForPlayer(PlayerProxy, PlayerController, SpawnerIndex, local_64, local_6, local_16, local_65)))
    {
        XError(ELog(33), FString().Append("Cannot find Spawn Location  for player ").Append(PlayerController.GetPlayerId()).Append(", Team: ").Append(PlayerController.GetTeam()));
    }
    float32 local_76 = FMath::RandRange(0.1f, 1.0f);
    local_6.X += local_76;
    float32 local_76_2 = FMath::RandRange(0.1f, 1.0f);
    local_6.Y += local_76_2;
    FGameModeUtils::SpwanAvatarAt(PlayerProxy, PlayerController, local_6, local_16, local_64, local_65);
    return;
}
bool GetSpawnLocationForPlayer(const FECSEntity &inout PlayerProxy, FC_PlayerController &inout PlayerController, const FCS_PlayerSpawnerIndex &inout SpawnerIndex, const TDataObjectPtr<FLevelInfoConfig> &inout LevelInfoConfig, FVector &inout Position, FQuat &inout Rotation, bool &inout bSpawnFromTeleportKey)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    bool __r; return __r;
}
FECSEntity CreateAvatarEntity(const FECSEntity &inout PlayerProxy, FC_PlayerController &inout PlayerController, const FVector &inout Position, const FQuat &inout Rotation, const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig, const TSubclassOf<AECSPrefab> &inout CharacterPrototypeOverride, const FName &inout EntityName, const bool bActive, const bool bAddToAllPlayerPawnEntities = true)
{
    FECSSpawnCharacterParam local_8;
    int local_64 = 0;
    local_8.PlayerEntity = PlayerProxy.GetId();
    local_8.AIControllerPrototype = nullptr;
    local_8.Name = EntityName;
    local_8.bActive = bActive;
    if ((!((CharacterPrototypeOverride == nullptr))))
    {
        local_8.CharacterPrototype = CharacterPrototypeOverride;
    }
    else
    {
        if (AvatarConfig)
        {
            local_8.CharacterPrototype = (TSubclassOf<AECSPrefab>((Cast<UClass>(FAvatarPrefabConfig::GetEffectiveCharacterPrefab(PlayerProxy.GetWorld(), AvatarConfig).ToSoftObjectPath().TryLoad()))));
        }
    }
    FECSEntity local_52;
    if ((local_8.CharacterPrototype == nullptr))
    {
        XError(ELog(33), "CreateAvatarEntity: need CharacterPrototypeOverride or valid AvatarConfig");
        return local_52;
    }
    local_52 = US_ECSScriptGameModeSystemBase::SpawnCharacter(PlayerProxy.GetWorld(), local_8, Position, Rotation);
    if (bAddToAllPlayerPawnEntities)
    {
        PlayerController.GetModify_AllPlayerPawnEntities().Add(local_52);
    }
    if (AvatarConfig)
    {
        local_64.SetConfigPtr(TDataObjectPtr<FBasePrefabConfig>());
        local_64.SetPrefabType(EPrefabType(1));
    }
    XLog(ELog(33), FString().Append("Created Pawn: ").Append(local_52).Append(" at ").Append(Position).Append(" for player ").Append(PlayerProxy));
    return local_52;
}
bool ShouldUseModeWeapon(const bool bLegacyOverrideEquipment)
{
    if (bLegacyOverrideEquipment)
    {
        return true;
    }
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    Get local_8;
    const FCS_GameMode& local_10 = local_8.opCall();
    if (local_10)
    {
        return local_10.HasFairModeFlag(EFairModeFlags(2));
    }
    return false;
}
bool ShouldDisableTalent(const bool bLegacyDisableTalent)
{
    if (bLegacyDisableTalent)
    {
        return true;
    }
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    Get local_8;
    const FCS_GameMode& local_10 = local_8.opCall();
    if (local_10)
    {
        return local_10.HasFairModeFlag(EFairModeFlags(4));
    }
    return false;
}
bool ShouldDisableLevelGrowth(const bool bLegacyDisableLevelGrowth)
{
    if (bLegacyDisableLevelGrowth)
    {
        return true;
    }
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    Get local_8;
    const FCS_GameMode& local_10 = local_8.opCall();
    if (local_10)
    {
        return local_10.HasFairModeFlag(EFairModeFlags(8));
    }
    return false;
}
bool ShouldDisableStigmata()
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Get local_6;
    const FCS_GameMode& local_8 = local_6.opCall();
    if (local_8)
    {
        return local_8.HasFairModeFlag(EFairModeFlags(32));
    }
    return false;
}
bool ShouldUseModeAttribute()
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Get local_6;
    const FCS_GameMode& local_8 = local_6.opCall();
    if (local_8)
    {
        if ((int(local_8.GetGameModeType())) != 0)
        {
            return true;
        }
        return local_8.HasFairModeFlag(EFairModeFlags(1));
    }
    return false;
}
bool ShouldDisableDivineSkillPassive()
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Get local_6;
    const FCS_GameMode& local_8 = local_6.opCall();
    if (local_8)
    {
        if ((int(local_8.GetGameModeType())) != 0)
        {
            return true;
        }
        return local_8.HasFairModeFlag(EFairModeFlags(16));
    }
    return false;
}
void ReplaceInitAttribute(const FECSEntity &inout Entity, const int Level)
{
    int local_16 = 0;
    int local_90 = 0;
    int local_100 = 0;
    if (!(FGameModeUtils::ShouldUseModeAttribute()))
    {
        return;
    }
    if (!(Entity.GetWorld().IsValid()))
    {
        return;
    }
    Has local_10;
    if (!(local_10.opCall()))
    {
        if ((int(local_16.GetGameModeType())) == 2)
        {
            PVXUtil::ReplacePVPInitAttribute(Entity, Level);
        }
        else
        {
            if ((int(local_16.GetGameModeType())) == 1)
            {
                PVXUtil::ReplaceInitAttribute(Entity, Level);
            }
        }
        return;
    }
    Get local_24;
    UGameModeFlow local_28 = local_24.opCall().GetGameModeFlow();
    if (local_28 == nullptr)
    {
        return;
    }
    FDataObjectPtr local_76 = local_28.GetOverrideAttributeData(Entity, Level);
    if (!(local_76.IsValid()))
    {
        return;
    }
    ModifyOrAdd local_80;
    local_80.opCall().InitValues = local_76;
    Has local_84;
    bool local_1 = local_84.opCall();
    if (local_1)
    {
        FECSWorldPtr local_6 = ECS::GetECSWorld();
        Has local_94;
        bool local_1_2 = local_94.opCall();
        if (local_1_2)
        {
            FECSWorldPtr local_6_2 = ECS::GetECSWorld();
            if (local_100.GetPlayerProgressMap().Contains(local_90))
            {
                local_100.GetModify_PlayerProgressMap()[local_90].SetLastOverrideAttributeData(local_76);
            }
        }
    }
    return;
}
void OverrideGameAttribute(const FECSEntity &inout Entity, const int NewLevel)
{
    int local_80 = 0;
    int local_90 = 0;
    if (!(FGameModeUtils::ShouldUseModeAttribute()))
    {
        return;
    }
    Has local_10;
    if (!(Entity.GetWorld().IsValid()) || !(local_10.opCall()))
    {
        return;
    }
    Get local_16;
    UGameModeFlow local_20 = local_16.opCall().GetGameModeFlow();
    if (local_20 == nullptr)
    {
        return;
    }
    FDataObjectPtr local_68 = local_20.GetOverrideAttributeData(Entity, NewLevel);
    if (!(local_68.IsValid()))
    {
        return;
    }
    FFPTime local_70 = FFPTime(ECS::GetECSWorld().GetFixedTime().Time);
    FGameAttributeUtils::ApplyAttributeDeltaBySingleDataObject(Entity, local_68, local_70, true);
    Has local_74;
    bool local_11 = local_74.opCall();
    if (local_11)
    {
        FECSWorldPtr local_6 = ECS::GetECSWorld();
        Has local_84;
        bool local_1 = local_84.opCall();
        if (local_1)
        {
            FECSWorldPtr local_6_2 = ECS::GetECSWorld();
            if (local_90.GetPlayerProgressMap().Contains(local_80))
            {
                local_90.GetModify_PlayerProgressMap()[local_80].SetLastOverrideAttributeData(local_68);
            }
        }
    }
    return;
}
void OverrideGameAttributeByDelta(const FECSEntity &inout Entity, const int NewLevel)
{
    int local_102 = 0;
    int local_112 = 0;
    if (!(FGameModeUtils::ShouldUseModeAttribute()))
    {
        return;
    }
    Has local_10;
    if (!(Entity.GetWorld().IsValid()) || !(local_10.opCall()))
    {
        return;
    }
    Get local_16;
    UGameModeFlow local_20 = local_16.opCall().GetGameModeFlow();
    if (local_20 == nullptr)
    {
        return;
    }
    FDataObjectPtr local_68 = local_20.GetOverrideAttributeData(Entity, NewLevel);
    if (!(local_68.IsValid()))
    {
        return;
    }
    FDataObjectPtr local_92;
    Has local_96;
    bool local_11 = local_96.opCall();
    if (local_11)
    {
        FECSWorldPtr local_6 = ECS::GetECSWorld();
        Has local_106;
        bool local_1 = local_106.opCall();
        if (local_1)
        {
            FECSWorldPtr local_6_2 = ECS::GetECSWorld();
            if (local_112.GetPlayerProgressMap().Contains(local_102))
            {
                FPVX_PlayerProgressData& local_114 = local_112.GetModify_PlayerProgressMap()[local_102];
                local_92 = local_114.GetLastOverrideAttributeData();
                local_114.SetLastOverrideAttributeData(local_68);
            }
        }
    }
    FFPTime local_116 = FFPTime(ECS::GetECSWorld().GetFixedTime().Time);
    FGameAttributeUtils::ApplyAttributeDeltaByTwoDataObjects(Entity, local_92, local_68, local_116, true);
    return;
}
bool GetSpawnLocationForPlayerBySpawnPointRule(const FECSEntity &inout PlayerProxy, const uint8 PlayerTeamId, const FCS_PlayerSpawnerIndex &inout SpawnerIndex, const ESpawnPointSelectionRule SpawnPointRule, FVector &inout Position, FQuat &inout Rotation)
{
    int local_3;
    TArray<FECSEntityId> local_8;
    TArray<FECSEntityId> local_12;
    int local_14;
    int local_32 = 0;
    int local_62 = 0;
    FECSEntityId local_1 = FECSEntityId(ENTITY_ID_NULL);
    switch (int(SpawnPointRule))
    {
    case 0:
    {
        local_3 = PlayerTeamId;
        local_8 = SpawnerIndex.GetTeamSpawners(local_3);
        if (local_8.Num() > 0)
        {
            local_1 = local_8[FMath::RandRange(0, (local_8.Num() - 1))];
        }
        break;
    }
    case 1:
    {
        FECSWorldPtr local_16 = ECS::GetECSWorld();
        Get local_20;
        const FCS_TeamLastSpawnPoint& local_22 = local_20.opCall();
        if (local_22)
        {
            if (local_22.LastSpawnPoint.Contains(PlayerTeamId))
            {
                local_1 = local_22.LastSpawnPoint[PlayerTeamId];
            }
        }
        if ((local_1 == ENTITY_ID_NULL))
        {
            local_3 = PlayerTeamId;
            local_12 = SpawnerIndex.GetTeamSpawners(local_3);
            local_3 = local_12.Num();
            if (local_3 > 0)
            {
                local_3 = local_12.Num() - 1;
                local_1 = local_12[FMath::RandRange(0, local_3)];
                bool local_13 = !((local_1 == ENTITY_ID_NULL));
                int local_2_3 = PlayerTeamId;
                FECSWorldPtr local_16_2 = ECS::GetECSWorld();
                ModifyOrAdd local_26;
                local_26.opCall().LastSpawnPoint.Add(local_2_3, local_1);
            }
        }
        break;
    }
    case 2:
    {
        local_8 = SpawnerIndex.GetAllSpawners();
        if (local_8.Num() > 0)
        {
            int local_2_4 = local_8.Num() - 1;
            local_1 = local_8[FMath::RandRange(0, local_2_4)];
        }
        break;
    }
    case 3:
    {
        int local_2_5 = PlayerTeamId;
        local_12 = SpawnerIndex.GetTeamSpawners(local_2_5);
        if (local_12.Num() == 0)
        {
            break;
        }
        else
        {
            FECSWorldPtr local_16_3 = ECS::GetECSWorld();
            int local_33 = 2147483647;
            TArray<FECSEntityId> local_38;
            int local_39 = 0;
            for (; local_39 < local_12.Num(); ++local_39)
            {
                FECSEntityId local_40 = local_12[local_39];
                local_2_5 = PlayerTeamId;
                int64 local_44 = (local_2_5 << 32) | local_40;
                if (local_32.TeamSpawnerPickCount.Contains(local_44))
                {
                    local_3 = local_32.TeamSpawnerPickCount[local_44];
                }
                else
                {
                    local_3 = 0;
                }
                if (local_3 < local_33)
                {
                    local_33 = local_3;
                    local_38.Reset(0);
                    local_38.Add(local_40);
                    continue;
                }
                if (local_3 == local_33)
                {
                    local_38.Add(local_40);
                }
            }
            if (local_38.Num() > 0)
            {
                local_1 = local_38[FMath::RandRange(0, (local_38.Num() - 1))];
                int64 local_48 = (PlayerTeamId << 32) | local_1;
                if (local_32.TeamSpawnerPickCount.Contains(local_48))
                {
                    local_14 = local_32.TeamSpawnerPickCount[local_48];
                }
                else
                {
                    local_14 = 0;
                }
                local_32.TeamSpawnerPickCount.Add(local_48, local_14 + 1);
            }
            break;
        }
    }
    }
    if ((!((local_1 == ENTITY_ID_NULL))))
    {
        FECSEntity local_54 = FECSEntity(local_1);
        Get local_58;
        if (local_58.opCall())
        {
            Position = local_62.GetPosition();
            Rotation = local_62.GetRotation();
            return true;
        }
    }
    return false;
}
void SpwanAvatarAt(const FECSEntity &inout PlayerProxy, FC_PlayerController &inout PlayerController, const FVector &inout Position, const FQuat &inout Rotation, const TDataObjectPtr<FLevelInfoConfig> &inout LevelInfoConfig, const bool bSpawnFromTeleportKey = false)
{
    bool local_55;
    int local_144 = 0;
    UDataTable local_190;
    UClass local_880;
    UClass local_882;
    int local_1036 = 0;
    int local_1054 = 0;
    UKLGameModeSettings local_2 = (Cast<UKLGameModeSettings>(UECSGameModeSettingsBase::Get(ECS::GetUEWorld())));
    FGameModeOverrideAvatarAndTeam local_22;
    bool local_9 = local_2.OverridePlayerWithPlayerId.Find(PlayerController.GetPlayerId(), local_22);
    bool local_25 = false;
    if (local_2 != nullptr)
    {
        int local_26 = int(local_22.Team);
        PlayerController.SetTeam(uint8(local_26));
        local_25 = !(local_22.bOnlyOverrideTeam);
    }
    bool local_27 = false;
    if (local_25)
    {
        UClass local_42;
        local_42 = Cast<UClass>(local_22.Avatar.ToSoftObjectPath().TryLoad());
        TSubclassOf<AECSPrefab> local_44 = TSubclassOf<AECSPrefab>(local_42);
        if (!((local_44 == nullptr)))
        {
            FName local_54 = FName(FString().Append("Pawn_").Append(PlayerController.GetPlayerId()).Append("_0"));
            FECSEntity local_84 = FGameModeUtils::CreateAvatarEntity(PlayerProxy, PlayerController, Position, Rotation, TDataObjectPtr<FAvatarPrefabConfig>(nullptr), local_44, local_54, true, true);
            local_84.IsValid();
            local_27 = true;
        }
    }
    FPbDsPlayerInfo local_106 = UGameDSConnectionSubsystem::Get().GetPlayerInfo(PlayerController.GetPlayerId());
    if (!(local_27) && local_106.IsValid() && local_106.GetAvatarCompInfo().IsValid())
    {
        int local_118 = local_106.GetAvatarCompInfo().GetCurAvatarId();
        if (local_118 > 0)
        {
            TDataObjectPtr<FAvatarPrefabConfig> local_80 = FAvatarPrefabConfig::GetByDataId(local_118);
            if (local_80)
            {
                FName local_54_2 = FName(FString().Append("Pawn_").Append(PlayerController.GetPlayerId()).Append("_0"));
                FGameModeUtils::CreateAvatarEntity(PlayerProxy, PlayerController, Position, Rotation, local_80, TSubclassOf<AECSPrefab>(nullptr), local_54_2, true, true).IsValid();
                local_27 = true;
            }
            else
            {
                XError(ELog(33), FString().Append("Cannot find AvatarConfig for player ").Append(PlayerController.GetPlayerId()).Append(", CurAvatarId: ").Append(local_118));
            }
        }
        int local_117 = local_106.GetAvatarCompInfo().GetSwitchAvatarId();
        if (local_27 && (local_117 > 0))
        {
            TDataObjectPtr<FAvatarPrefabConfig> local_142 = FAvatarPrefabConfig::GetByDataId(local_117);
            if (local_142)
            {
                FName local_54_3 = FName(FString().Append("Pawn_").Append(PlayerController.GetPlayerId()).Append("_1"));
                FECSEntity local_84_2 = FGameModeUtils::CreateAvatarEntity(PlayerProxy, PlayerController, Position, Rotation, local_142, TSubclassOf<AECSPrefab>(nullptr), local_54_3, false, true);
                local_84_2.IsValid();
            }
            else
            {
                XError(ELog(33), FString().Append("Cannot find AvatarConfig for player ").Append(PlayerController.GetPlayerId()).Append(", SwitchAvatarId: ").Append(local_117));
            }
        }
    }
    Has local_890;
    if (!(local_27))
    {
        bool local_151;
        UClass local_42;
        bool local_23;
        int local_24 = local_2.DefaultAvatars.Num();
        if (local_24 > 0)
        {
            if (LevelInfoConfig.IsSet() && GetGameRuleConfig().IsSet())
            {
                local_24 = local_144;
            }
            int local_146 = 0;
            for (; local_146 < local_24; ++local_146)
            {
                const FDefaultAvatarData& local_150 = local_2.DefaultAvatars[local_146];
                local_42 = Cast<UClass>(local_150.Avatar.ToSoftObjectPath().TryLoad());
                TSubclassOf<AECSPrefab> local_30 = TSubclassOf<AECSPrefab>(local_42);
                if ((local_30 == nullptr))
                {
                    XError(ELog(33), FString().Append("Cannot find Avatar for player ").Append(PlayerController.GetPlayerId()).Append(", DefaultAvatarId: ").Append(local_150.Avatar));
                    continue;
                }
                FECSWorldPtr local_154 = PlayerProxy.GetWorld();
                Has local_158;
                local_55 = local_158.opCall();
                if (!(local_55))
                {
                    local_55 = false;
                }
                else
                {
                    FECSWorldPtr local_154_2 = PlayerProxy.GetWorld();
                    Get local_162;
                    local_55 = (int(local_162.opCall().GetGameModeType()) != 0);
                }
                TDataObjectPtr<FAvatarPrefabConfig> local_142_2 = (TDataObjectPtr<FAvatarPrefabConfig>(nullptr));
                if (local_55)
                {
                    local_142_2 = FAvatarPrefabConfig::GetByDataId(1);
                    if ((!((local_142_2 == nullptr))))
                    {
                        local_190 = Cast<UDataTable>(local_142_2.GetRoot());
                        if (local_190 != nullptr)
                        {
                            TArray<FName> local_200 = local_190.GetRowNames();
                            int local_201 = 0;
                            for (; local_201 < local_200.Num(); ++local_201)
                            {
                                FAvatarPrefabConfig local_868;
                                if (!(local_190.FindRow(local_200[local_201], local_868)))
                                {
                                    continue;
                                }
                                TSoftClassPtr<ACharacterPrefab> local_878 = local_868.CharacterPrefab;
                                if (local_878.IsNull())
                                {
                                }
                                else
                                {
                                    local_882 = Cast<UClass>(local_878.ToSoftObjectPath().TryLoad());
                                }
                                local_880 = local_882;
                                if ((local_880 != nullptr && (local_30 == local_880)))
                                {
                                    local_142_2 = FAvatarPrefabConfig::GetByDataId(int(local_868.DataId));
                                    break;
                                }
                            }
                        }
                    }
                }
                local_23 = !((local_142_2 == nullptr));
                local_151 = true;
                bool local_883 = (local_146 == 0);
                FName local_54_4 = FName(FString().Append("Pawn_").Append(PlayerController.GetPlayerId()).Append("_").Append(local_146));
                TSubclassOf<AECSPrefab> local_886;
                if (local_23)
                {
                    local_886 = (TSubclassOf<AECSPrefab>(nullptr));
                }
                else
                {
                    local_886 = local_30;
                }
                FECSEntity local_48 = FGameModeUtils::CreateAvatarEntity(PlayerProxy, PlayerController, Position, Rotation, local_142_2, local_886);
                if (!(local_890.opCall()))
                {
                    Assign local_894;
                    FC_Input local_1006;
                    local_894.opCall(local_1006);
                }
                FEquipmentUtils::AddInitEquipmentWithoutGS(local_48);
            }
        }
    }
    int local_147 = PlayerController.GetAllPlayerPawnEntities().Num();
    PlayerController.SetPlayerPawnEntity(PlayerController.GetAllPlayerPawnEntities()[0]);
    FGameModeUtils::AddMetaBuffToPlayer(local_106, PlayerProxy);
    Has local_1010;
    bool local_883_2 = local_1010.opCall();
    if (local_147 > 0)
    {
        Remove local_1014;
        local_1014.opCall();
        FFPTime local_1020 = FFPTime(-1);
        SendEvent local_1018;
        local_1018.opCall(local_1020);
    }
    if (bSpawnFromTeleportKey)
    {
        FECSEntity local_48_2 = FECSEntity(PlayerController.GetPlayerPawnEntity());
        FName local_54_5 = ULevelGlobalSettings::GetTeleportLoopStateName();
        FName local_1022 = ULevelGlobalSettings::GetTeleportLandStateName();
        bool local_151 = local_48_2.IsValid() && FESMUtils::MainSMHasState(local_48_2, local_54_5);
        bool local_23 = local_48_2.IsValid() && FESMUtils::MainSMHasState(local_48_2, local_1022);
        if (local_151 && local_23)
        {
            int local_145 = FESMUtils::GetMainStateMachineIndex(local_48_2);
            if (local_145 >= 0)
            {
                BlueprintFunctions_Common::InitEntityESMEntryState(FECSEntityAdapter(local_48_2), local_54_5, uint8(local_145));
                FECSWorldPtr local_154_3 = ECS::GetECSWorld();
                Get local_1040;
                FFPTime local_1046 = FFPTime(local_1040.opCall().Time);
                local_1036.SetDeadlineTime((local_1046 + FFPTime(ULevelGlobalSettings::GetTeleportCrossDSLandMaxWaitTime())));
                TeleporterUtils::ApplyTeleportVisualHide(local_48_2);
                local_1054.SetTransactionSerial(0);
                local_1054.SetbReleaseRequested(false);
                local_1054.SetReleaseRequestTime(local_1046);
                local_1054.SetForceReleaseTime((FFPTime(local_1036.GetDeadlineTime()) + FFPTime(ULevelGlobalSettings::GetTeleportCrossDSLandMaxWaitTime())));
                XLog(ELog(22), FString().Append("[TeleportViewHide][Begin] Entity=").Append(local_48_2));
            }
        }
        else
        {
            XWarning(ELog(22), FString().Append("[TeleportViewHide][SkipInvalidESM] Entity=").Append(local_48_2).Append(" HasLoop=").Append(local_151).Append(" HasLand=").Append(local_23));
        }
    }
    if (local_106.GetDsMiscInfo().GetTeleportKey() > 0)
    {
        local_106.GetDsMiscInfo().SetTeleportKey(0);
    }
    if (local_106.GetAssemblerUid() > 0)
    {
        local_106.SetAssemblerUid(0);
    }
    return;
}
void RefreshSpawnerMapIcon(const FC_PlayerSpawner &inout Spawner, const FC_Actor &inout Actor, const int SelectedTeamID)
{
    return;
}
void TryInitStartPlayerUids()
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Has local_6;
    bool local_7 = local_6.opCall();
    if (local_7)
    {
        return;
    }
    else
    {
        if (!(FLevelUtils::GetCurrentLevelInfoConfig(nullptr).IsSet()))
        {
            return;
        }
        else
        {
            ELevelType local_58;
            int local_59 = int(local_58);
            if (local_59 <= 3)
            {
                if (local_59 != 3)
                {
                    return;
                }
                else
                {
                    FGameModeUtils::InitStartPlayerUidsFromTeamMembers();
                    return;
                }
            }
        }
    }
}
void InitStartPlayerUidsFromTeamMembers()
{
    int local_84 = 0;
    UGameDSConnectionSubsystem local_4 = UGameDSConnectionSubsystem::Get();
    if (local_4 == nullptr)
    {
        return;
    }
    TMap<uint, uint> local_26 = local_4.GetPlayerUidToEntityMap();
    if (local_26.Num() == 0)
    {
        return;
    }
    int local_29 = 0;
    for (auto& local_48 : local_26)
    {
        local_29 = local_48.GetKey();
        break;
    }
    FPbDsPlayerInfo local_68 = local_4.GetPlayerInfo(local_29);
    bool local_5 = !(local_68.IsValid());
    if (local_5)
    {
        local_5 = true;
    }
    else
    {
        int local_30 = local_68.GetUid();
        local_5 = (local_30 == 0);
    }
    if (local_5)
    {
        return;
    }
    FECSWorldPtr local_72 = ECS::GetECSWorld();
    local_68.GetTeamMemberUid(local_84.PlayerUids);
    return;
}
bool HasReceivedAllStartPlayersFromGS()
{
    bool local_6;
    UGameDSConnectionSubsystem local_4 = UGameDSConnectionSubsystem::Get();
    if (local_4 == nullptr)
    {
        return false;
    }
    if (local_4.IsConnectingToGameServer() || local_4.IsConnectedToGameServer())
    {
        int local_20;
        if (local_4.GetNumPlayerInfos() == 0)
        {
            return false;
        }
        FGameModeUtils::TryInitStartPlayerUids();
        FECSWorldPtr local_10 = ECS::GetECSWorld();
        Has local_14;
        if (!(local_14.opCall()))
        {
            return true;
        }
        FECSWorldPtr local_10_2 = ECS::GetECSWorld();
        for (auto local_33 : local_20.PlayerUids)
        {
            FPbDsPlayerInfo local_44 = local_4.GetPlayerInfo(local_33);
            local_6 = !(local_44.IsValid());
            if (local_6)
            {
                local_6 = true;
            }
            else
            {
                int local_34 = local_44.GetUid();
                local_6 = (local_34 == 0);
            }
            if (local_6)
            {
                return false;
            }
        }
        return true;
    }
    return true;
}
TArray<FECSEntity> ResolveRevivePoints(const FECSEntity &inout TeleportEntity, FCE_Event_ReviveTeleport &inout Event)
{
    if (int(Event.ReviveType) == 2 && (Event.SpecificPrefabClass.Num() == 0))
    {
        return TeleporterUtils::GetActiveTeleporterEntities(TeleportEntity);
    }
    return FGameModeUtils::QueryRevivePointsByPrefabClass(TeleportEntity, Event.SpecificPrefabClass);
}
TArray<FECSEntity> QueryRevivePointsByPrefabClass(const FECSEntity &inout TeleportEntity, const TArray<TSubclassOf<AECSPrefab>> &inout PrefabClasses)
{
    FECSQueryParam local_12;
    local_12.bExcludeDeath = true;
    FVector local_20(FVector::ZeroVector);
    Has local_24;
    bool local_13 = local_24.opCall();
    if (local_13)
    {
        Get local_28;
        local_20 = local_28.opCall().GetPosition();
    }
    float32 local_29 = 500000.0f;
    float32 local_31 = 20000.0f;
    bool local_32 = false;
    int local_34 = 3;
    int local_33 = local_34;
    bool local_35 = false;
    TArray<FECSEntity> local_40;
    auto local_46 = PrefabClasses.Iterator();
    for (; local_46.CanProceed;)
    {
        local_12.SpecificPrefabClass = local_46.Proceed();
        FECSRuntimeQuery local_96 = FECSRuntimeQueryHelper::RuntimeQueryInCylinder(TeleportEntity, local_20, local_29, local_31, local_32, EECSQueryRegsitryType(local_33), local_35);
        ECSQueryUtils::AddQueryFilterByParams(local_96, TeleportEntity, local_12);
        local_40.Append(local_96.GetAllEntities());
    }
    return local_40;
}
TArray<FECSEntity> GetTeleporterEntities()
{
    TArray<FECSEntity> local_4;
    FECSWorldPtr local_6 = ECS::GetECSWorld();
    Get local_10;
    const FCS_Teleporters& local_12 = local_10.opCall();
    if (local_12)
    {
        for (auto& local_32 : local_12.GetTeleporters())
        {
            if (local_32.GetKey().IsValid())
            {
                local_4.Add(local_32.GetKey());
            }
        }
    }
    return local_4;
}
void DefaultReviveTeleport(FCE_Event_ReviveTeleport &inout Event)
{
    if (!(Event.Sender.IsValid()))
    {
        return;
    }
    FECSEntity local_6 = FECSEntity(Event.Sender);
    FVector local_12(FVector::ZeroVector);
    Has local_16;
    bool local_1 = local_16.opCall();
    if (local_1)
    {
        Get local_20;
        local_12 = local_20.opCall().GetPosition();
    }
    TArray<FECSEntity> local_28 = FEntityUtils::SortEntitiesByDistance((FGameModeUtils::ResolveRevivePoints(local_6, Event)), local_12);
    FBorderUtils::FilterEntitiesOutsideBorder(local_28);
    int local_33 = FMath::Clamp(int(Event.SkipNearestCount), 0, FMath::Max(0, (local_28.Num() - 1)));
    if (local_28.Num() > 0)
    {
        FECSEntity local_38 = local_28[local_33];
        TeleporterUtils::TeleportPawnToEntity(local_6, local_38, ELoadingScreenAction(0), true);
    }
    else
    {
        bool local_47;
        FVector local_46(FVector::ZeroVector);
        local_47 = false;
        Get local_52;
        const FC_LastValidNavGround& local_54 = local_52.opCall();
        if (local_54)
        {
            local_46 = local_54.GetLastNavGroundPosition();
            local_47 = true;
        }
        else
        {
            Get local_58;
            const FC_LastValidGround& local_60 = local_58.opCall();
            if (local_60)
            {
                local_46 = local_60.GetLastGroundPosition();
                local_47 = true;
            }
        }
        if (local_47)
        {
            GetDefaulted local_64;
            BlueprintFunctions_Common::TeleportEntityToLocation(FECSEntityAdapter(local_6), local_46, local_64.opCall().GetRotation().Rotator(), false, FRotator::ZeroRotator, false, true, ELoadingScreenAction(0), true);
        }
    }
    return;
}
void InitOfflineDSGlobalInfo()
{
    return;
}
}

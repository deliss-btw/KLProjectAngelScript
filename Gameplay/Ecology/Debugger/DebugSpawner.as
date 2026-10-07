

// NOTE: class defaults are not authored in this module: FSingleMonsterSpawnerConfig (body was stubbed).
// They are carried over byte-exact when this module is recompiled.

struct FSingleMonsterSpawnerConfig : FEcologyConfig
{
    FEcologyConfig _base_FEcologyConfig;
    UPROPERTY()
    TDataObjectPtr<FMonsterMainConfig> MonsterConfig;
    UPROPERTY()
    TSoftClassPtr<ACharacterPrefab> OverridePrefab;
    UPROPERTY()
    int MonsterLevel;
    UPROPERTY()
    UDataTable DifficultyLevelConfig;
    UPROPERTY()
    TArray<FBuffConfigRef> InitBuffs;
    UPROPERTY()
    bool bDisableAI;
    UPROPERTY()
    bool bMuteDrop;
    UPROPERTY()
    bool bCreateFlock;
    UPROPERTY()
    TSoftObjectPtr<UBaseEcologyPlanerDefine> PlanerDefine;
    UPROPERTY()
    bool bCreateResource;
    UPROPERTY()
    TDataObjectPtr<FEcologyResourceDefinitionRow> ResourceType;

    FSingleMonsterSpawnerConfig()
    {
        this.DifficultyLevelConfig = nullptr;
        this.MonsterLevel = 0;
        this.bDisableAI = false;
        this.bMuteDrop = false;
        this.bCreateFlock = true;
        this.bCreateResource = false;
        this.__InitDefaults();
        return;
    }
    FECSEntity GenerateRuntimeEntity_Implementation(const FEcologyConfigGenerateContext &inout Context) const
    {
        return FECSEntity();
    }
}

class ASingleMonsterSpawnPrefab : AEcologyUnitECSPrefab
{
    UPROPERTY()
    FSingleMonsterSpawnerConfig Config;

    ASingleMonsterSpawnPrefab()
    {
        super();
        return;
    }
}

namespace FSingleMonsterSpawnHelper
{
FECSEntity SpawnSingleMonster(const FSingleMonsterSpawnerConfig &inout Config, const FVector &inout Location, const FQuat &inout Rotation, const FECSEntityId &inout ConfigEntityId)
{
    bool local_1;
    UBaseEcologyPlanerDefine local_22;
    int local_340 = 0;
    int local_354 = 0;
    int local_360 = 0;
    int local_386 = 0;
    if (!(Config.MonsterConfig))
    {
        return FECSEntity();
    }
    FECSEntity local_10;
    if (Config.bCreateFlock)
    {
        TSoftObjectPtr<UBaseEcologyPlanerDefine> local_20 = Config.PlanerDefine;
        if (!((local_22 != nullptr)))
        {
            if (FCreatureConfigProxy(Config.MonsterConfig).GetCreatureType())
            {
                UBaseEcologyPlanerDefine local_98;
                local_20 = local_98;
            }
        }
        FEcologyFlockSpawnParam local_146;
        local_146.bSkipChangeAreaTrigger = true;
        local_146.bSkipDelayActivation = true;
        local_146.SpawnNum = 0;
        local_146.DefaultPosition = Location;
        FCreatureConfigProxy local_48 = FCreatureConfigProxy(Config.MonsterConfig);
        local_146.PlanerDefine = local_20;
        FECSEntity local_152;
        local_1 = Config.bCreateResource;
        if (!(local_1))
        {
            local_1 = false;
        }
        else
        {
            local_1 = Config.ResourceType;
        }
        if (local_1)
        {
            FSingleResourceConfig local_220;
            local_220.ResourceType = Config.ResourceType;
            local_152 = FEcologyResourceUtils::SpawnDynamicResource(FECSEntity(ConfigEntityId), local_220, Location, Rotation.Euler(), ECS::GetECSWorld().GetFixedTime().Time, -1.0f);
        }
        if (local_152.IsValid())
        {
            local_146.SpawnFEcologyFlockActivityTarget.MainTargetResource = local_152.GetId();
        }
        FRuntimeSpawnerReference local_262;
        local_262.SpawnerEntity = ConfigEntityId;
        TArray<TSoftObjectPtr<AECSRegionVolume>> local_266;
        local_10 = FEcologySpawnerUtils::SpawnEcologyFlockEntity(local_146, local_262, local_266);
        if (local_152.IsValid() && local_10.IsValid())
        {
            FC_NeedCheckResourceTag local_272;
            Assign local_270;
            local_270.opCall(local_272);
        }
    }
    FEcologyCreatureSpawnerContext local_332;
    FCreatureConfigProxy local_48_2 = FCreatureConfigProxy(Config.MonsterConfig);
    local_332.SpawnerConfigRef = ConfigEntityId;
    local_332.RuntimeSpawnerEntity = ConfigEntityId;
    FECSEntityId local_333;
    if (local_10.IsValid())
    {
        local_333 = local_10.GetId();
    }
    else
    {
        local_333 = ENTITY_ID_NULL;
    }
    local_332.FlockEntity = local_333;
    local_332.TargetLocation = Location;
    local_332.TargetRotation = Rotation;
    local_332.MuteDropItemMask = Config.bMuteDrop ? 3 : 0;
    if (Config.OverridePrefab.IsValid())
    {
        local_332.bForceOverridePrefab = true;
        local_332.CreaturePrefab = Config.OverridePrefab;
    }
    FECSEntity local_6 = FEcologySpawnerUtils::SpawnCreatureByContext(local_332);
    if (local_6.IsValid())
    {
        if (local_10.IsValid())
        {
            local_340.CreatureEntities.Add(local_6.GetId());
        }
        if (int(Config.MonsterLevel) > 0)
        {
            FC_CreatureMeta local_346;
            if (local_346)
            {
                local_346.Level = int(Config.MonsterLevel);
            }
        }
        if (Config.DifficultyLevelConfig != nullptr)
        {
            local_354.DifficultyLevelConfig = Config.DifficultyLevelConfig;
        }
        if (Config.InitBuffs.Num() > 0)
        {
            for (auto& local_374 : Config.InitBuffs)
            {
                local_360.GetModify_InitBuffs().Add(local_374);
            }
        }
        if (Config.bDisableAI)
        {
            FC_CreatureInitModifier local_380;
            local_380.bDisableAI = true;
        }
    }
    if (local_10.IsValid())
    {
    }
    else
    {
    }
    FECSEntity local_384;
    if (local_384.IsValid() && !((ConfigEntityId == ENTITY_ID_NULL)))
    {
        local_386.ConfigRef = ConfigEntityId;
        local_386.ConfigType = FSingleMonsterSpawnerConfig;
    }
    return local_384;
}
FECSEntity SpawnAtLocation(const FSingleMonsterSpawnerConfig &inout Config, const FVector &inout Location, const FQuat &inout Rotation = FQuat::Identity)
{
    return FSingleMonsterSpawnHelper::SpawnSingleMonster(Config, Location, Rotation, ENTITY_ID_NULL);
}
}

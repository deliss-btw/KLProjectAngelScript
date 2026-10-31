enum ECreatureConfigType
{
    Legacy,
    Monster,
    NPC,
}

struct FCreatureConfigProxy
{
    UPROPERTY()
    ECreatureConfigType Type;
    UPROPERTY()
    FDataObjectPtr Config;

    FCreatureConfigProxy(const TDataObjectPtr<FEcologyCreatureDefinitionRow> &inout CreatureType)
    {
        this.Type = ECreatureConfigType(0);
        this.Config = CreatureType.opImplConv();
        return;
    }
    FCreatureConfigProxy(const TDataObjectPtr<FMonsterMainConfig> &inout MonsterConfig)
    {
        this.Type = ECreatureConfigType(1);
        this.Config = MonsterConfig.opImplConv();
        return;
    }
    FCreatureConfigProxy(const TDataObjectPtr<FNPCMainConfig> &inout NPCConfig)
    {
        this.Type = ECreatureConfigType(2);
        this.Config = NPCConfig.opImplConv();
        return;
    }
    TDataObjectPtr<FEcologyCreatureDefinitionRow> GetCreatureType() const
    {
        TDataObjectPtr<FEcologyCreatureDefinitionRow> local_28;
        switch (int(this.Type))
        {
        case 0:
        {
            return TDataObjectPtr<FEcologyCreatureDefinitionRow>(this.Config);
        }
        case 2:
        {
            TDataObjectPtr<FNPCMainConfig> local_76 = TDataObjectPtr<FNPCMainConfig>(this.Config);
            if (local_76)
            {
                return local_76.Get().GetCreature();
            }
            return local_28;
        }
        case 1:
        {
            TDataObjectPtr<FMonsterMainConfig> local_126 = TDataObjectPtr<FMonsterMainConfig>(this.Config);
            if (local_126)
            {
                return local_126.Get().GetCreature();
            }
            return local_28;
        }
        }
        return local_28;
    }
    FDataObjectPtr GetCreatureUnitConfig() const
    {
        switch (int(this.Type))
        {
        case 0:
        {
            return FDataObjectPtr();
        }
        case 2:
        {
            TDataObjectPtr<FNPCMainConfig> local_52 = TDataObjectPtr<FNPCMainConfig>(this.Config);
            if (local_52)
            {
                return local_52.opImplConv();
            }
            return FDataObjectPtr();
        }
        case 1:
        {
            TDataObjectPtr<FMonsterMainConfig> local_102 = TDataObjectPtr<FMonsterMainConfig>(this.Config);
            if (local_102)
            {
                return local_102.opImplConv();
            }
            return FDataObjectPtr();
        }
        }
        return FDataObjectPtr();
    }
    TSoftClassPtr<AECSPrefab> GetCreaturePrefab() const
    {
        switch (this.Type)
        {
        case ECreatureConfigType::Legacy:
        {
            TDataObjectPtr<FEcologyCreatureDefinitionRow> local_28 = TDataObjectPtr<FEcologyCreatureDefinitionRow>(this.Config);
            if (local_28)
            {
                return local_28.Get().CreaturePrefab;
            }
            break;
        }
        case ECreatureConfigType::NPC:
        {
            TDataObjectPtr<FNPCMainConfig> local_78 = TDataObjectPtr<FNPCMainConfig>(this.Config);
            if (local_78)
            {
                const FNPCMainConfig& local_104 = local_78.Get();
                TDataObjectPtr<FNPCSkinOverride> local_128;
                local_128 = local_104.GetSkinOverride();
                if (!((local_128 == nullptr)) && !(local_104.GetSkinOverride().Get().PrefabOverride.IsNull()))
                {
                    return TSoftClassPtr<AECSPrefab>(local_104.GetSkinOverride().Get().PrefabOverride.Get().Get());
                }
                return TSoftClassPtr<AECSPrefab>(local_104.GetCombatPrefab().Get());
            }
            break;
        }
        case ECreatureConfigType::Monster:
        {
            TDataObjectPtr<FMonsterMainConfig> local_192 = TDataObjectPtr<FMonsterMainConfig>(this.Config);
            if (!(!(local_192)) && local_192.Get().GetCombatConfig())
            {
                return TSoftClassPtr<AECSPrefab>(local_192.Get().GetCombatPrefab().Get());
            }
            break;
        }
        }
        return TSoftClassPtr<AECSPrefab>(nullptr);
    }
    TDataObjectPtr<FNPCMainConfig> GetNPCConfig() const
    {
        if (int(this.Type) == 2)
        {
            return TDataObjectPtr<FNPCMainConfig>(this.Config);
        }
        return TDataObjectPtr<FNPCMainConfig>();
    }
    TDataObjectPtr<FMonsterMainConfig> GetMonsterConfig() const
    {
        if (int(this.Type) == 1)
        {
            return TDataObjectPtr<FMonsterMainConfig>(this.Config);
        }
        return TDataObjectPtr<FMonsterMainConfig>();
    }
    EMonsterRank GetMonsterRank() const
    {
        if (int(this.Type) == 1)
        {
            TDataObjectPtr<FMonsterMainConfig> local_28 = TDataObjectPtr<FMonsterMainConfig>(this.Config);
            if (local_28)
            {
                TDataObjectPtr<FCombatUnitBaseConfig> local_76 = local_28.Get().GetCombatConfig();
                if (local_76)
                {
                    return EMonsterRank(local_76.Get().Rank);
                }
            }
        }
        return EMonsterRank(0);
    }
}

struct FClassicEcologIsomorphicConfig
{
    UPROPERTY()
    TDataObjectPtr<FEcologyCreatureDefinitionRow> CreatureType;
    UPROPERTY()
    TDataObjectPtr<FMonsterMainConfig> MonsterConfig;
    UPROPERTY()
    int MinCount;
    UPROPERTY()
    int MaxCount;

    bool ShouldShowMonster(const FMonsterMainConfig &inout Config) const
    {
        if (Config.GetCombatConfig())
        {
            if (int(Config.GetCombatConfig().Get().Rank) == 2)
            {
                return false;
            }
        }
        return Config.bAvailableForLevelPlacement;
    }
    FCreatureConfigProxy GetCreatureProxy() const
    {
        FCreatureConfigProxy __r;
        if (this.MonsterConfig)
        {
            if (this.MonsterConfig.Get().GetCreature())
            {
                FCreatureConfigProxy local_28 = FCreatureConfigProxy(this.MonsterConfig);
            }
            else
            {
                XError(ELog(30), "Monster Config Without Creature Info");
            }
        }
        FCreatureConfigProxy local_28_2 = FCreatureConfigProxy(this.CreatureType);
        return __r;
    }
    TDataObjectPtr<FEcologyCreatureDefinitionRow> GetCreatureType() const
    {
        if (this.MonsterConfig)
        {
            const FMonsterMainConfig& local_4 = this.MonsterConfig.Get();
            if (local_4.GetCreature())
            {
                return local_4.GetCreature();
            }
        }
        return this.CreatureType;
    }
}

struct FClassicEcologyTeamConfig
{
    UPROPERTY()
    FClassicEcologIsomorphicConfig CreatureConfig;
    UPROPERTY()
    int MaxTeamCount;
    UPROPERTY()
    bool bAcceptSpawnRatio = true;

}

struct FFClassicEcologyTeamConfigArray
{
    UPROPERTY()
    TArray<FClassicEcologyTeamConfig> ConfigArray;

    FFClassicEcologyTeamConfigArray()
    {
        return;
    }
}

struct FSpawnerConfig : FEcologyConfig
{
    FEcologyConfig _base_FEcologyConfig;
    UPROPERTY()
    TArray<TDataObjectPtr<FBuffAttachRuleConfig>> BuffAttachRules;

    FSpawnerConfig()
    {
        return;
    }
}

struct FClassicSpawnerConfig : FSpawnerConfig
{
    FSpawnerConfig _base_FSpawnerConfig;
    UPROPERTY()
    TMap<FName, FFClassicEcologyTeamConfigArray> Teams;
    UPROPERTY()
    TSoftObjectPtr<AECSRegionVolume> Region;
    UPROPERTY()
    TSoftObjectPtr<AECSRegionVolume> WeatherSource;

    default _base_FSpawnerConfig = Cast<UASStruct>(FClassicSpawnerConfig.Get());

    FClassicSpawnerConfig()
    {
        this.__InitDefaults();
        return;
    }
    FECSEntity GenerateRuntimeEntity_Implementation(const FEcologyConfigGenerateContext &inout Context) const
    {
        int local_22 = 0;
        int local_32 = 0;
        if (FEcologyMisc::CVar_EcosimAI_LOD.GetInt() > 0)
        {
            return ENTITY_NULL;
        }
        FECSEntity local_8 = FECSEntity(Context.OuterEntity);
        FECSEntity local_12 = ECS::GetECSWorld().Create(EECSRegType(2), EEntityType(10), n"EcologySpawnerProvider");
        local_22.ConfigRef = Context.OuterEntity.GetId();
        local_22.ConfigType = FClassicSpawnerConfig;
        for (auto& local_54 : this.Teams)
        {
            const FFClassicEcologyTeamConfigArray& local_56 = local_54.GetValue();
            for (auto& local_70 : local_56.ConfigArray)
            {
                FFlockSpawnerData local_182;
                FCreatureConfigProxy local_208 = local_70.CreatureConfig.GetCreatureProxy();
                local_182.MaxCount = local_70.CreatureConfig.MaxCount;
                local_182.MinCount = local_70.CreatureConfig.MinCount;
                local_182.MaxBatch = int(local_70.MaxTeamCount);
                local_182.bAcceptSpawnRatio = local_70.bAcceptSpawnRatio;
                local_32.SpawnerData.Add(local_182);
            }
        }
        local_32.Region = this.Region;
        local_32.WeatherSource = this.WeatherSource;
        FC_EcologySpawnerStats local_244;
        Assign local_212;
        local_212.opCall(local_244);
        FC_EcologyRuntimeSpanwerTag local_250;
        Assign local_248;
        local_248.opCall(local_250);
        const FTransform& local_252 = Context.GetDefaultedTransform();
        local_12.InitTransform(local_252.GetLocation(), local_252.GetRotation());
        return local_12;
    }
}

struct FBossSpawnInfoConfig
{
    UPROPERTY()
    TDataObjectPtr<FEcologyCreatureDefinitionRow> Creature;
    UPROPERTY()
    TDataObjectPtr<FMonsterMainConfig> MonsterConfig;
    UPROPERTY()
    FGameplayTagContainer AttachGameplayTag;
    UPROPERTY()
    TArray<TSoftObjectPtr<AECSRegionVolume>> ActivityVolumes;
    UPROPERTY()
    TArray<TObjectPtr<UCommonChangeAreaTriggerDefinitionAsset>> ChangeAreaTriggerDefinitionCollection;

    FBossSpawnInfoConfig()
    {
        return;
    }
    TDataObjectPtr<FEcologyCreatureDefinitionRow> GetCreatureType() const
    {
        if (this.MonsterConfig)
        {
            const FMonsterMainConfig& local_4 = this.MonsterConfig.Get();
            if (local_4.GetCreature())
            {
                return local_4.GetCreature();
            }
        }
        return this.Creature;
    }
    FCreatureConfigProxy GetCreatureProxy() const
    {
        FCreatureConfigProxy __r;
        if (this.MonsterConfig)
        {
            if (this.MonsterConfig.Get().GetCreature())
            {
                FCreatureConfigProxy local_30 = FCreatureConfigProxy(this.MonsterConfig);
            }
            else
            {
                XError(ELog(30), "Monster Config Without Creature Info");
            }
        }
        FCreatureConfigProxy local_30_2 = FCreatureConfigProxy(this.Creature);
        return __r;
    }
    bool CheckPositionInVolumes(const FVector &inout Position) const
    {
        for (auto& local_16 : this.ActivityVolumes)
        {
            if (local_16.Get().QuickEncompassesPoint(Position))
            {
                return true;
            }
        }
        return false;
    }
    bool CheckAllVolumeIsValid() const
    {
        for (auto& local_16 : this.ActivityVolumes)
        {
            if ((!((local_16.Get() != nullptr))))
            {
                return false;
            }
        }
        return true;
    }
}

struct FRandomBossSpawnInfoConfig : FBossSpawnInfoConfig
{
    FBossSpawnInfoConfig _base_FBossSpawnInfoConfig;
    UPROPERTY()
    int Weight = 1;

}

struct FRandomBossSpawnInfoPoolConfig
{
    UPROPERTY()
    TArray<FRandomBossSpawnInfoConfig> BossInfo;
    UPROPERTY()
    FIntVector2 CountScope;

    FRandomBossSpawnInfoPoolConfig()
    {
        return;
    }
}

struct FMixedRandomBossSpawnerConfig : FSpawnerConfig
{
    FSpawnerConfig _base_FSpawnerConfig;
    UPROPERTY()
    TArray<FRandomBossSpawnInfoPoolConfig> SpawnPool;

    default _base_FSpawnerConfig = Cast<UASStruct>(FMixedRandomBossSpawnerConfig.Get());

    FMixedRandomBossSpawnerConfig()
    {
        this.__InitDefaults();
        return;
    }
    FECSEntity GenerateRuntimeEntity_Implementation(const FEcologyConfigGenerateContext &inout Context) const
    {
        int local_16 = 0;
        int local_46 = 0;
        int local_50 = 0;
        int local_140 = 0;
        if (FEcologyMisc::CVar_EcosimAI_LOD.GetInt() >= 2)
        {
            return ENTITY_NULL;
        }
        FECSEntity local_8 = FECSEntity(Context.OuterEntity);
        FECSWorldPtr local_14 = ECS::GetECSWorld();
        FECSEntity local_12 = ECS::GetECSWorld().Create(EECSRegType(2), EEntityType(10), n"EcologySpawnerProvider");
        const FTransform& local_24 = Context.GetDefaultedTransform();
        local_12.InitTransform(local_24.GetLocation(), local_24.GetRotation());
        local_46.RandomGenerator = int(local_16.EcologyGlobalRandom.CurrentSeed);
        local_50.ConfigRef = Context.OuterEntity.GetId();
        local_50.ConfigType = FMixedRandomBossSpawnerConfig;
        FC_EcologySpawnerStats local_124;
        Assign local_92;
        local_92.opCall(local_124);
        FC_EcologyRuntimeSpanwerTag local_130;
        Assign local_128;
        local_128.opCall(local_130);
        local_140.LevelUnitEntity = Context.OuterEntity.GetId();
        return local_12;
    }
}

struct FConstMonsterSpawner : FEcologyConfig
{
    FEcologyConfig _base_FEcologyConfig;

    FConstMonsterSpawner()
    {
        return;
    }
}

struct FBaseMonsterSpawnerConfig : FConstMonsterSpawner
{
    FConstMonsterSpawner _base_FConstMonsterSpawner;
    UPROPERTY()
    TArray<TDataObjectPtr<FBuffAttachRuleConfig>> BuffAttachRules;
    UPROPERTY()
    TDataObjectPtr<FMonsterMainConfig> MonsterConfig;
    UPROPERTY()
    int MonsterId;
    UPROPERTY()
    bool bCreateFlock;

    default _base_FConstMonsterSpawner = Cast<UASStruct>(FBaseMonsterSpawnerConfig.Get());

    FBaseMonsterSpawnerConfig()
    {
        this.MonsterId = 0;
        this.bCreateFlock = true;
        this.__InitDefaults();
        return;
    }
    FECSEntity GenerateRuntimeEntity_Implementation(const FEcologyConfigGenerateContext &inout OuterContext) const
    {
        if (this.MonsterConfig)
        {
            const FTransform& local_4 = OuterContext.GetDefaultedTransform();
            const FMonsterMainConfig& local_6 = this.MonsterConfig.Get();
            FEcologyCreatureSpawnerContext local_68;
            FCreatureConfigProxy local_94 = FCreatureConfigProxy(this.MonsterConfig);
            local_68.SpawnerConfigRef = OuterContext.OuterEntity.GetId();
            local_68.TargetLocation = local_4.GetLocation();
            local_68.TargetRotation = local_4.GetRotation();
            return ::FEcologySpawnerUtils::SpawnCreatureByContext(local_68);
        }
        return FECSEntity();
    }
}

struct FConstNPCSpawnerConfig : FSpawnerConfig
{
    FSpawnerConfig _base_FSpawnerConfig;
    UPROPERTY()
    TDataObjectPtr<FNPCMainConfig> NPCConfig;
    UPROPERTY()
    int NPCId;

    default _base_FSpawnerConfig = Cast<UASStruct>(FConstNPCSpawnerConfig.Get());

    FConstNPCSpawnerConfig()
    {
        this.NPCId = 0;
        this.__InitDefaults();
        return;
    }
    bool ShouldShowNPC(const FNPCMainConfig &inout Config) const
    {
        return Config.bAvailableForLevelPlacement;
    }
    FECSEntity GenerateRuntimeEntity_Implementation(const FEcologyConfigGenerateContext &inout OuterContext) const
    {
        int local_84 = 0;
        int local_106 = 0;
        FECSEntity local_6;
        if (!(this.NPCConfig))
        {
            return local_6;
        }
        local_6 = ECS::GetECSWorld().Create(EECSRegType(2), EEntityType(10), n"ConstNPCSpawner");
        FC_EcologyRuntimeConstNPCSpawner local_22;
        Assign local_20;
        local_20.opCall(local_22);
        FC_EcologyRuntimeSpanwerTag local_28;
        Assign local_26;
        local_26.opCall(local_28);
        FC_EcologySpawnerStats local_64;
        Assign local_32;
        local_32.opCall(local_64);
        const FTransform& local_66 = OuterContext.GetDefaultedTransform();
        local_6.InitTransform(local_66.GetLocation(), local_66.GetRotation());
        local_84.ConfigRef = OuterContext.OuterEntity.GetId();
        local_84.ConfigType = FConstNPCSpawnerConfig;
        local_106.LevelUnitEntity = OuterContext.OuterEntity.GetId();
        FC_EcologyForceRefreshSpawnerTag local_112;
        Assign local_110;
        local_110.opCall(local_112);
        return local_6;
    }
}



enum EChangeAreaResourceSearchType
{
    Request,
    Specified,
}


struct FChangeAreaMessageInfo
{
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> MessageConfig;
    UPROPERTY()
    float32 Radius = 8000.0f;
    UPROPERTY()
    float32 HalfHeight = 9999.0f;


}

struct FEcologyFlockActivityTarget
{
    UPROPERTY()
    FECSEntityId MainTargetResource;
    UPROPERTY()
    FECSEntityId LastResource = ENTITY_ID_NULL;

    FEcologyFlockActivityTarget()
    {
        return;
    }
}

struct FEcologyFlockSpawnParam
{
    UPROPERTY()
    FCreatureConfigProxy CreatureConfig;
    UPROPERTY()
    TSoftObjectPtr<UBaseEcologyPlanerDefine> PlanerDefine;
    UPROPERTY()
    FEcologyFlockActivityTarget SpawnFEcologyFlockActivityTarget;
    UPROPERTY()
    int SpawnNum;
    UPROPERTY()
    bool bAcceptSpawnRatio = true;
    UPROPERTY()
    FVector DefaultPosition;
    UPROPERTY()
    bool bSkipChangeAreaTrigger = false;
    UPROPERTY()
    bool bSkipDelayActivation = false;


}

struct FEcologyCreatureSpawnerContext
{
    UPROPERTY()
    FECSEntityId SpawnerConfigRef;
    UPROPERTY()
    FECSEntityId RuntimeSpawnerEntity;
    UPROPERTY()
    FCreatureConfigProxy CreatureConfigProxy;
    UPROPERTY()
    TSoftClassPtr<AECSPrefab> CreaturePrefab;
    UPROPERTY()
    bool bForceOverridePrefab = false;
    UPROPERTY()
    FECSEntityId FlockEntity;
    UPROPERTY()
    FGameplayTag AdditionalSpawnTag;
    UPROPERTY()
    FName SpawnInitEntryName;
    UPROPERTY()
    int MuteDropItemMask = 0;
    UPROPERTY()
    FVector TargetLocation;
    UPROPERTY()
    FQuat TargetRotation;


    TSoftClassPtr<ACharacterPrefab> GetMonsterPrefab() const
    {
        bool local_1 = false;
        bool local_2;
        TSoftClassPtr<ACharacterPrefab> local_20;
        if (this.bForceOverridePrefab && this.CreaturePrefab.IsValid())
        {
            return TSoftClassPtr<ACharacterPrefab>(this.CreaturePrefab.ToSoftObjectPath());
        }
        if (this.CreatureConfigProxy.GetMonsterConfig())
        {
            if (GetCombatConfig())
            {
                local_20.GetSoftCombatPrefab();
                return local_20;
            }
        }
        if (this.CreatureConfigProxy.GetNPCConfig())
        {
            const FNPCMainConfig& local_118;
            TDataObjectPtr<FNPCSkinOverride> local_142;
            local_142 = local_118.GetSkinOverride();
            local_2 = !((local_142 == nullptr));
            if (!(local_2))
            {
                local_2 = false;
            }
            else
            {
                local_1 = !local_1;
                local_2 = local_1;
            }
            if (local_2)
            {
            }
            else
            {
                local_20 = local_118.GetSoftCombatPrefab();
                if ((!((local_20 == nullptr))))
                {
                    return local_118.GetSoftCombatPrefab();
                }
            }
        }
        return TSoftClassPtr<ACharacterPrefab>(this.CreaturePrefab.ToSoftObjectPath());
    }
    TSubclassOf<ACharacterPrefab> LoadMonsterPrefab() const
    {
        TSoftClassPtr<ACharacterPrefab> local_10 = this.GetMonsterPrefab();
        Ecology::SyncLoadObject(local_10.ToSoftObjectPath());
        return local_10.Get();
    }
    TDataObjectPtr<FEcologyCreatureDefinitionRow> GetCreatureType() const
    {
        return this.CreatureConfigProxy.GetCreatureType();
    }
}

struct FEcologyFlockSpawnEQSContext
{
    UPROPERTY()
    FEcologyCreatureSpawnerContext SpawnParam;

    FEcologyFlockSpawnEQSContext()
    {
        return;
    }
}

struct FSetupCreaturePositionEQSContext
{
    UPROPERTY()
    FECSEntityId TargetEntity;

    FSetupCreaturePositionEQSContext()
    {
        return;
    }
}

struct FFlockBehaviorRequest
{
    UPROPERTY()
    int Priority;


}

struct FFlockChangeAreaRequest : FFlockBehaviorRequest
{
    FFlockBehaviorRequest _base_FFlockBehaviorRequest;
    UPROPERTY()
    FECSEntityId SpecifiedResourceId;
    UPROPERTY()
    FResourceSearchRequest SearchRequest;
    UPROPERTY()
    bool bUseNearestCombatRegionPolicy = false;
    UPROPERTY()
    float32 CombatRegionPolicyRadiusLayer1 = 25000.0f;
    UPROPERTY()
    float32 CombatRegionPolicyRadiusLayer2 = 50000.0f;
    UPROPERTY()
    FGameplayTag ReasonTag;
    UPROPERTY()
    FGameplayTag SourceTag;
    UPROPERTY()
    bool bForceUpdateTargetResource = false;
    UPROPERTY()
    bool bNeedChangeAreaMessage;
    UPROPERTY()
    FChangeAreaMessageInfo MessageInfo;


    EChangeAreaResourceSearchType GetSearchType() const
    {
        if ((!((this.SpecifiedResourceId == ENTITY_ID_NULL))))
        {
            return EChangeAreaResourceSearchType(1);
        }
        return EChangeAreaResourceSearchType(0);
    }
}


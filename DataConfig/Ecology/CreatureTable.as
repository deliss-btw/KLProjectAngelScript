
enum ECreatureMoveStance
{
    None,
    Run,
    Walk,
    Sprint,
}


struct FCreatureDefinitionRow : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FName CreatureName;
    UPROPERTY()
    FDataObjectPtr m_BaseCreature;

    FCreatureDefinitionRow()
    {
        return;
    }
    const TDataObjectPtr<FCreatureDefinitionRow> GetBaseCreature() const property
    {
        const TDataObjectPtr<FCreatureDefinitionRow> __r;
        return __r;
    }
    void SetBaseCreature(const TDataObjectPtr<FCreatureDefinitionRow> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FCreatureDefinitionRow>> local_2;
        this.m_BaseCreature = local_2;
        return;
    }
}

struct FEcologyBossBattleForAreaInfo
{
    UPROPERTY()
    float32 TimeLimit;
    UPROPERTY()
    float32 HPLimit;
    UPROPERTY()
    TSoftObjectPtr<UResourceRequestFilterConfigAsset> ChangeAreaRequestFilter;
    UPROPERTY()
    FChangeAreaMessageInfo BattleStartMessageInfo;
    UPROPERTY()
    FChangeAreaMessageInfo BattleEndMessageInfo;


}

struct FEcologyCreatureDefinitionRow : FCreatureDefinitionRow
{
    FCreatureDefinitionRow _base_FCreatureDefinitionRow;
    UPROPERTY()
    TSoftClassPtr<AECSPrefab> CreaturePrefab;
    UPROPERTY()
    bool bCanFly;
    UPROPERTY()
    bool bEnableCorpse;
    UPROPERTY()
    ECreatureMoveStance ForceMoveStanceWithoutEmergency = ECreatureMoveStance(2);
    UPROPERTY()
    float32 RunMoveStanceDistanceWithoutEmergency = 2000.0f;
    UPROPERTY()
    ECreatureMoveStance ForceMoveStanceEmergency = ECreatureMoveStance(1);
    UPROPERTY()
    float32 RunMoveStanceDistanceWithEmergency = 2000.0f;
    UPROPERTY()
    bool bCanMove;
    UPROPERTY()
    float32 OverSlotWanderInnerRadius;
    UPROPERTY()
    float32 OverSlotWanderOuterRadius;
    UPROPERTY()
    TArray<TObjectPtr<UCommonChangeAreaTriggerDefinitionAsset>> CommonChangeAreaTriggerDefinitionCollection;
    UPROPERTY()
    bool ForceMuteCombatInChangeArea = false;
    UPROPERTY()
    TSubclassOf<UNavigationQueryFilter> NavFilter;
    UPROPERTY()
    TObjectPtr<UBaseEcologyPlanerDefine> DefaultPlanerDefine;
    UPROPERTY()
    FGameplayTagContainer CreatureTags;
    UPROPERTY()
    FGameplayTagContainer FlockTags;
    UPROPERTY()
    bool bEnableBossBattleForArea;
    UPROPERTY()
    FEcologyBossBattleForAreaInfo BossBattleForAreaInfo;

    FEcologyCreatureDefinitionRow()
    {
        super();
        this.OverSlotWanderInnerRadius = 600.0f;
        this.OverSlotWanderOuterRadius = 1000.0f;
        return;
    }
}

struct FEcoCollectableCreatureDefinitionRow : FCreatureDefinitionRow
{
    FCreatureDefinitionRow _base_FCreatureDefinitionRow;
    UPROPERTY()
    TSoftClassPtr<AEcoCollectablePrefabBase> EcoCollectablePrefab;
    UPROPERTY()
    bool bRandomizeLocalRotationZOnSpawn = false;
    UPROPERTY()
    bool bSnapPerpendicularlyToGround = false;
    UPROPERTY()
    FVector PrefabSpawnLocationOffset;
    UPROPERTY()
    bool bApplyRandomSpawnScaleUniformFactor = true;
    UPROPERTY()
    FVector2D SpawnScaleUniformFactorRandomRange = FVector2D(0.9, 1.1);


    float32 GetSpawnScaleUniformFactor() const
    {
        float32 local_8;
        if (this.bApplyRandomSpawnScaleUniformFactor)
        {
            local_8 = FMath::RandRange(float32(this.SpawnScaleUniformFactorRandomRange.X), float32(this.SpawnScaleUniformFactorRandomRange.Y));
        }
        else
        {
            local_8 = 1.0f;
        }
        return local_8;
    }
    FDataObjectValidationResult IsDataValidImpl_Implementation() const
    {
        FDataObjectValidationResult local_16;
        if (!(this.EcoCollectablePrefab.IsValid()))
        {
            local_16.Error = FString("EcoCollectablePrefabдёЌиѓЅдёєз©єпјЃ");
            return local_16;
        }
        if (this.bApplyRandomSpawnScaleUniformFactor && (this.SpawnScaleUniformFactorRandomRange.X > this.SpawnScaleUniformFactorRandomRange.Y || (this.SpawnScaleUniformFactorRandomRange.X <= 0.0)))
        {
            local_16.Error = FString("зЎ®дїќSpawnScaleRandomRangeзљ„зі»ж•°е¤§дєЋ0пјЊдё”Min <= Max!");
        }
        return local_16;
    }
}


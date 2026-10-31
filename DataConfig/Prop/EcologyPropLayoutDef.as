struct FEcologyPropLayoutDef : FCreatureDefinitionRow
{
    FCreatureDefinitionRow _base_FCreatureDefinitionRow;
    UPROPERTY()
    TSoftClassPtr<APropPrefabScriptBase> PropPrefabDef;
    UPROPERTY()
    bool bRandomizeLocalRotationZOnSpawn;
    UPROPERTY()
    bool bSnapPerpendicularlyToGround;
    UPROPERTY()
    FVector PrefabSpawnLocationOffset;
    UPROPERTY()
    bool bApplyRandomSpawnScaleUniformFactor;
    UPROPERTY()
    FVector2D SpawnScaleUniformFactorRandomRange;

    default m_ScriptOverrideMeta = Cast<UASStruct>(FEcologyPropLayoutDef.Get());

    FEcologyPropLayoutDef()
    {
        this.bRandomizeLocalRotationZOnSpawn = false;
        this.bSnapPerpendicularlyToGround = false;
        this.bApplyRandomSpawnScaleUniformFactor = true;
        this.SpawnScaleUniformFactorRandomRange = FVector2D(0.9, 1.1);
        this.__InitDefaults();
        return;
    }
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
        if (!(this.PropPrefabDef.IsValid()))
        {
            local_16.Error = FString("PropPrefab不能为空！");
            return local_16;
        }
        if (this.bApplyRandomSpawnScaleUniformFactor && (this.SpawnScaleUniformFactorRandomRange.X > this.SpawnScaleUniformFactorRandomRange.Y || (this.SpawnScaleUniformFactorRandomRange.X <= 0.0)))
        {
            local_16.Error = FString("确保SpawnScaleRandomRange的系数大于0，且Min <= Max!");
        }
        return local_16;
    }
}


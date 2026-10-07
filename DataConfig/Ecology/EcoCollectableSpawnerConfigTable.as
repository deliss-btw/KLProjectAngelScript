

struct FEcoCollectableSpawnerConfigDefinitionRow : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FGuid SpawnerGUID;
    UPROPERTY()
    TArray<EcoCollectable::FEcoCollectableCreatureAndCountRangeDef> EcoCollectableCreatureAndCountRanges;

    FEcoCollectableSpawnerConfigDefinitionRow()
    {
        return;
    }
}


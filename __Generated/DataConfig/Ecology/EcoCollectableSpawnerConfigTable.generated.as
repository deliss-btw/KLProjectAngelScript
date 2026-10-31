namespace __FEcoCollectableSpawnerConfigDefinitionRowFunctions
{
UFUNCTION()
FGuid __FEcoCollectableSpawnerConfigDefinitionRow_GetSpawnerGUID(const TDataObjectPtr<FEcoCollectableSpawnerConfigDefinitionRow> &inout DataObject)
{
    FGuid __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SpawnerGUID' from a null 'FEcoCollectableSpawnerConfigDefinitionRow' DataObject!");
        }
        FEcoCollectableSpawnerConfigDefinitionRow local_22;
        return local_22.SpawnerGUID;
    }
    return __r;
}
UFUNCTION()
TArray<EcoCollectable::FEcoCollectableCreatureAndCountRangeDef> __FEcoCollectableSpawnerConfigDefinitionRow_GetEcoCollectableCreatureAndCountRanges(const TDataObjectPtr<FEcoCollectableSpawnerConfigDefinitionRow> &inout DataObject)
{
    TArray<EcoCollectable::FEcoCollectableCreatureAndCountRangeDef> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EcoCollectableCreatureAndCountRanges' from a null 'FEcoCollectableSpawnerConfigDefinitionRow' DataObject!");
        }
        FEcoCollectableSpawnerConfigDefinitionRow local_22;
        return local_22.EcoCollectableCreatureAndCountRanges;
    }
    return __r;
}
UFUNCTION()
FEcoCollectableSpawnerConfigDefinitionRow CastToFEcoCollectableSpawnerConfigDefinitionRow(const TDataObjectPtr<FEcoCollectableSpawnerConfigDefinitionRow> &inout DataObject)
{
    FEcoCollectableSpawnerConfigDefinitionRow __r;
    return __r;
}
}

namespace __FEcologyPropLayoutDefFunctions
{
UFUNCTION()
TSoftClassPtr<APropPrefabScriptBase> __FEcologyPropLayoutDef_GetPropPrefabDef(const TDataObjectPtr<FEcologyPropLayoutDef> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PropPrefabDef' from a null 'FEcologyPropLayoutDef' DataObject!");
        }
        FEcologyPropLayoutDef local_64;
        return local_64.PropPrefabDef;
    }
    return DataObject.Get().PropPrefabDef;
}
UFUNCTION()
bool __FEcologyPropLayoutDef_GetbRandomizeLocalRotationZOnSpawn(const TDataObjectPtr<FEcologyPropLayoutDef> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bRandomizeLocalRotationZOnSpawn' from a null 'FEcologyPropLayoutDef' DataObject!");
        }
        FEcologyPropLayoutDef local_64;
        return local_64.bRandomizeLocalRotationZOnSpawn;
    }
    return DataObject.Get().bRandomizeLocalRotationZOnSpawn;
}
UFUNCTION()
bool __FEcologyPropLayoutDef_GetbSnapPerpendicularlyToGround(const TDataObjectPtr<FEcologyPropLayoutDef> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bSnapPerpendicularlyToGround' from a null 'FEcologyPropLayoutDef' DataObject!");
        }
        FEcologyPropLayoutDef local_64;
        return local_64.bSnapPerpendicularlyToGround;
    }
    return DataObject.Get().bSnapPerpendicularlyToGround;
}
UFUNCTION()
FVector __FEcologyPropLayoutDef_GetPrefabSpawnLocationOffset(const TDataObjectPtr<FEcologyPropLayoutDef> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PrefabSpawnLocationOffset' from a null 'FEcologyPropLayoutDef' DataObject!");
        }
        FEcologyPropLayoutDef local_64;
        return local_64.PrefabSpawnLocationOffset;
    }
    return DataObject.Get().PrefabSpawnLocationOffset;
}
UFUNCTION()
bool __FEcologyPropLayoutDef_GetbApplyRandomSpawnScaleUniformFactor(const TDataObjectPtr<FEcologyPropLayoutDef> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bApplyRandomSpawnScaleUniformFactor' from a null 'FEcologyPropLayoutDef' DataObject!");
        }
        FEcologyPropLayoutDef local_64;
        return local_64.bApplyRandomSpawnScaleUniformFactor;
    }
    return DataObject.Get().bApplyRandomSpawnScaleUniformFactor;
}
UFUNCTION()
FVector2D __FEcologyPropLayoutDef_GetSpawnScaleUniformFactorRandomRange(const TDataObjectPtr<FEcologyPropLayoutDef> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SpawnScaleUniformFactorRandomRange' from a null 'FEcologyPropLayoutDef' DataObject!");
        }
        FEcologyPropLayoutDef local_64;
        return local_64.SpawnScaleUniformFactorRandomRange;
    }
    return DataObject.Get().SpawnScaleUniformFactorRandomRange;
}
UFUNCTION()
FEcologyPropLayoutDef CastToFEcologyPropLayoutDef(const TDataObjectPtr<FEcologyPropLayoutDef> &inout DataObject)
{
    FEcologyPropLayoutDef __r;
    return __r;
}
}

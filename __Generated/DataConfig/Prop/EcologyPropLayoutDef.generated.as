namespace __FEcologyPropLayoutDefFunctions
{
UFUNCTION()
TSoftClassPtr<APropPrefabScriptBase> __FEcologyPropLayoutDef_GetPropPrefabDef(const TDataObjectPtr<FEcologyPropLayoutDef> &inout DataObject)
{
    TSoftClassPtr<APropPrefabScriptBase> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PropPrefabDef' from a null 'FEcologyPropLayoutDef' DataObject!");
        }
        FEcologyPropLayoutDef local_64;
        return local_64.PropPrefabDef;
    }
    return __r;
}
UFUNCTION()
bool __FEcologyPropLayoutDef_GetbRandomizeLocalRotationZOnSpawn(const TDataObjectPtr<FEcologyPropLayoutDef> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bRandomizeLocalRotationZOnSpawn' from a null 'FEcologyPropLayoutDef' DataObject!");
        }
        FEcologyPropLayoutDef local_64;
        return local_64.bRandomizeLocalRotationZOnSpawn;
    }
    return local_1;
}
UFUNCTION()
bool __FEcologyPropLayoutDef_GetbSnapPerpendicularlyToGround(const TDataObjectPtr<FEcologyPropLayoutDef> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bSnapPerpendicularlyToGround' from a null 'FEcologyPropLayoutDef' DataObject!");
        }
        FEcologyPropLayoutDef local_64;
        return local_64.bSnapPerpendicularlyToGround;
    }
    return local_1;
}
UFUNCTION()
FVector __FEcologyPropLayoutDef_GetPrefabSpawnLocationOffset(const TDataObjectPtr<FEcologyPropLayoutDef> &inout DataObject)
{
    FVector __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PrefabSpawnLocationOffset' from a null 'FEcologyPropLayoutDef' DataObject!");
        }
        FEcologyPropLayoutDef local_64;
        return local_64.PrefabSpawnLocationOffset;
    }
    return __r;
}
UFUNCTION()
bool __FEcologyPropLayoutDef_GetbApplyRandomSpawnScaleUniformFactor(const TDataObjectPtr<FEcologyPropLayoutDef> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bApplyRandomSpawnScaleUniformFactor' from a null 'FEcologyPropLayoutDef' DataObject!");
        }
        FEcologyPropLayoutDef local_64;
        return local_64.bApplyRandomSpawnScaleUniformFactor;
    }
    return local_1;
}
UFUNCTION()
FVector2D __FEcologyPropLayoutDef_GetSpawnScaleUniformFactorRandomRange(const TDataObjectPtr<FEcologyPropLayoutDef> &inout DataObject)
{
    FVector2D __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SpawnScaleUniformFactorRandomRange' from a null 'FEcologyPropLayoutDef' DataObject!");
        }
        FEcologyPropLayoutDef local_64;
        return local_64.SpawnScaleUniformFactorRandomRange;
    }
    return __r;
}
UFUNCTION()
FEcologyPropLayoutDef CastToFEcologyPropLayoutDef(const TDataObjectPtr<FEcologyPropLayoutDef> &inout DataObject)
{
    FEcologyPropLayoutDef __r;
    return __r;
}
}

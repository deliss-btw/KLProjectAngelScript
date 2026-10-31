namespace __FEcologyLevelDataObjectFunctions
{
UFUNCTION()
TSoftObjectPtr<UEnvQuery> __FEcologyLevelDataObject_GetSpawnEntityEnvQueryTemplate(const TDataObjectPtr<FEcologyLevelDataObject> &inout DataObject)
{
    TSoftObjectPtr<UEnvQuery> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SpawnEntityEnvQueryTemplate' from a null 'FEcologyLevelDataObject' DataObject!");
        }
        FEcologyLevelDataObject local_24;
        return local_24.SpawnEntityEnvQueryTemplate;
    }
    return __r;
}
UFUNCTION()
FEcologyLevelDataObject CastToFEcologyLevelDataObject(const TDataObjectPtr<FEcologyLevelDataObject> &inout DataObject)
{
    FEcologyLevelDataObject __r;
    return __r;
}
}

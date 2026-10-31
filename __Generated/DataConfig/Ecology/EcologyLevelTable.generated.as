namespace __FEcologyLevelDataObjectFunctions
{
UFUNCTION()
TSoftObjectPtr<UEnvQuery> __FEcologyLevelDataObject_GetSpawnEntityEnvQueryTemplate(const TDataObjectPtr<FEcologyLevelDataObject> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SpawnEntityEnvQueryTemplate' from a null 'FEcologyLevelDataObject' DataObject!");
        }
        FEcologyLevelDataObject local_24;
        return local_24.SpawnEntityEnvQueryTemplate;
    }
    return DataObject.Get().SpawnEntityEnvQueryTemplate;
}
UFUNCTION()
FEcologyLevelDataObject CastToFEcologyLevelDataObject(const TDataObjectPtr<FEcologyLevelDataObject> &inout DataObject)
{
    FEcologyLevelDataObject __r;
    return __r;
}
}

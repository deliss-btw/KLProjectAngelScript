namespace __FMountItemConfigFunctions
{
UFUNCTION()
TSoftClassPtr<AECSPrefab> __FMountItemConfig_GetMountPrefab(const TDataObjectPtr<FMountItemConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MountPrefab' from a null 'FMountItemConfig' DataObject!");
        }
        FMountItemConfig local_196;
        return local_196.MountPrefab;
    }
    return DataObject.Get().MountPrefab;
}
UFUNCTION()
FMountItemConfig CastToFMountItemConfig(const TDataObjectPtr<FMountItemConfig> &inout DataObject)
{
    FMountItemConfig __r;
    return __r;
}
}

namespace __FPermissionItemConfigFunctions
{
UFUNCTION()
EPermissionItemType __FPermissionItemConfig_GetPermissionType(const TDataObjectPtr<FPermissionItemConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PermissionType' from a null 'FPermissionItemConfig' DataObject!");
        }
        FPermissionItemConfig local_212;
        return local_212.PermissionType;
    }
    return DataObject.Get().PermissionType;
}
UFUNCTION()
TDataObjectPtr<FDataObject> __FPermissionItemConfig_GetUnlockData(const TDataObjectPtr<FPermissionItemConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UnlockData' from a null 'FPermissionItemConfig' DataObject!");
        }
        FPermissionItemConfig local_212;
        return local_212.GetUnlockData();
    }
    return DataObject.Get().GetUnlockData();
}
UFUNCTION()
FPermissionItemConfig CastToFPermissionItemConfig(const TDataObjectPtr<FPermissionItemConfig> &inout DataObject)
{
    FPermissionItemConfig __r;
    return __r;
}
}

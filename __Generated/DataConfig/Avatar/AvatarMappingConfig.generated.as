namespace __FAvatarMappingConfigFunctions
{
UFUNCTION()
FText __FAvatarMappingConfig_GetName(const TDataObjectPtr<FAvatarMappingConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Name' from a null 'FAvatarMappingConfig' DataObject!");
        }
        FAvatarMappingConfig local_24;
        return local_24.Name;
    }
    return __r;
}
UFUNCTION()
TArray<TDataObjectPtr<FAvatarPrefabConfig>> __FAvatarMappingConfig_GetAvatar(const TDataObjectPtr<FAvatarMappingConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Avatar' from a null 'FAvatarMappingConfig' DataObject!");
        }
        FAvatarMappingConfig local_24;
        return local_24.GetAvatar();
    }
    return GetAvatar();
}
UFUNCTION()
FAvatarMappingConfig CastToFAvatarMappingConfig(const TDataObjectPtr<FAvatarMappingConfig> &inout DataObject)
{
    FAvatarMappingConfig __r;
    return __r;
}
}

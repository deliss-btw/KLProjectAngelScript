namespace __FCustomVolumeAudioConfigFunctions
{
UFUNCTION()
FName __FCustomVolumeAudioConfig_GetAreaTypeName(const TDataObjectPtr<FCustomVolumeAudioConfig> &inout DataObject)
{
    FName __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AreaTypeName' from a null 'FCustomVolumeAudioConfig' DataObject!");
        }
        FCustomVolumeAudioConfig local_74;
        return local_74.AreaTypeName;
    }
    return __r;
}
UFUNCTION()
FSimpleAudioSet __FCustomVolumeAudioConfig_GetAudioSet(const TDataObjectPtr<FCustomVolumeAudioConfig> &inout DataObject)
{
    FSimpleAudioSet __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AudioSet' from a null 'FCustomVolumeAudioConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
FText __FCustomVolumeAudioConfig_GetDescription(const TDataObjectPtr<FCustomVolumeAudioConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Description' from a null 'FCustomVolumeAudioConfig' DataObject!");
        }
        FCustomVolumeAudioConfig local_74;
        return local_74.Description;
    }
    return __r;
}
UFUNCTION()
FText __FCustomVolumeAudioConfig_GetDisplayName(const TDataObjectPtr<FCustomVolumeAudioConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayName' from a null 'FCustomVolumeAudioConfig' DataObject!");
        }
        FCustomVolumeAudioConfig local_74;
        return local_74.DisplayName;
    }
    return __r;
}
UFUNCTION()
FCustomVolumeAudioConfig CastToFCustomVolumeAudioConfig(const TDataObjectPtr<FCustomVolumeAudioConfig> &inout DataObject)
{
    FCustomVolumeAudioConfig __r;
    return __r;
}
}

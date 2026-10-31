namespace __FMailSettingsConfigFunctions
{
UFUNCTION()
int __FMailSettingsConfig_GetCapacity(const TDataObjectPtr<FMailSettingsConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Capacity' from a null 'FMailSettingsConfig' DataObject!");
        }
        FMailSettingsConfig defaultValue;
        return defaultValue.Capacity;
    }
    return DataObject.Get().Capacity;
}
UFUNCTION()
int __FMailSettingsConfig_GetDefaultExpireDays(const TDataObjectPtr<FMailSettingsConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultExpireDays' from a null 'FMailSettingsConfig' DataObject!");
        }
        FMailSettingsConfig defaultValue;
        return defaultValue.DefaultExpireDays;
    }
    return DataObject.Get().DefaultExpireDays;
}
UFUNCTION()
TDataObjectPtr<FMailConfig> __FMailSettingsConfig_GetItemExceedLimitMail(const TDataObjectPtr<FMailSettingsConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ItemExceedLimitMail' from a null 'FMailSettingsConfig' DataObject!");
        }
        FMailSettingsConfig local_42;
        return local_42.GetItemExceedLimitMail();
    }
    return DataObject.Get().GetItemExceedLimitMail();
}
UFUNCTION()
FMailSettingsConfig CastToFMailSettingsConfig(const TDataObjectPtr<FMailSettingsConfig> &inout DataObject)
{
    FMailSettingsConfig __r;
    return __r;
}
}

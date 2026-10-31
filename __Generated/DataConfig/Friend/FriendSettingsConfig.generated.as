namespace __FFriendSettingsConfigFunctions
{
UFUNCTION()
int __FFriendSettingsConfig_GetFriendMaxCount(const TDataObjectPtr<FFriendSettingsConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FriendMaxCount' from a null 'FFriendSettingsConfig' DataObject!");
        }
        FFriendSettingsConfig defaultValue;
        return defaultValue.FriendMaxCount;
    }
    return DataObject.Get().FriendMaxCount;
}
UFUNCTION()
int __FFriendSettingsConfig_GetFriendApplyCoolDown(const TDataObjectPtr<FFriendSettingsConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FriendApplyCoolDown' from a null 'FFriendSettingsConfig' DataObject!");
        }
        FFriendSettingsConfig defaultValue;
        return defaultValue.FriendApplyCoolDown;
    }
    return DataObject.Get().FriendApplyCoolDown;
}
UFUNCTION()
int __FFriendSettingsConfig_GetFriendApplyExpireHours(const TDataObjectPtr<FFriendSettingsConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FriendApplyExpireHours' from a null 'FFriendSettingsConfig' DataObject!");
        }
        FFriendSettingsConfig defaultValue;
        return defaultValue.FriendApplyExpireHours;
    }
    return DataObject.Get().FriendApplyExpireHours;
}
UFUNCTION()
int __FFriendSettingsConfig_GetFriendApplyMaxCount(const TDataObjectPtr<FFriendSettingsConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FriendApplyMaxCount' from a null 'FFriendSettingsConfig' DataObject!");
        }
        FFriendSettingsConfig defaultValue;
        return defaultValue.FriendApplyMaxCount;
    }
    return DataObject.Get().FriendApplyMaxCount;
}
UFUNCTION()
FFriendSettingsConfig CastToFFriendSettingsConfig(const TDataObjectPtr<FFriendSettingsConfig> &inout DataObject)
{
    FFriendSettingsConfig __r;
    return __r;
}
}

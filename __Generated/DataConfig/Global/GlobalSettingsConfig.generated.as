namespace __FGlobalSettingsConfigFunctions
{
UFUNCTION()
FStringCheckerConfig __FGlobalSettingsConfig_GetNicknameChecker(const TDataObjectPtr<FGlobalSettingsConfig> &inout DataObject)
{
    FStringCheckerConfig __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'NicknameChecker' from a null 'FGlobalSettingsConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
TArray<TDataObjectPtr<FMissionCommissionConfig>> __FGlobalSettingsConfig_GetTutorialMissionConfigs(const TDataObjectPtr<FGlobalSettingsConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TutorialMissionConfigs' from a null 'FGlobalSettingsConfig' DataObject!");
        }
        FGlobalSettingsConfig local_66;
        return local_66.GetTutorialMissionConfigs();
    }
    return GetTutorialMissionConfigs();
}
UFUNCTION()
int __FGlobalSettingsConfig_GetNicknameChangeCDHours(const TDataObjectPtr<FGlobalSettingsConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'NicknameChangeCDHours' from a null 'FGlobalSettingsConfig' DataObject!");
        }
        FGlobalSettingsConfig defaultValue;
        return defaultValue.NicknameChangeCDHours;
    }
    return DataObject.Get().NicknameChangeCDHours;
}
UFUNCTION()
FGlobalSettingsConfig CastToFGlobalSettingsConfig(const TDataObjectPtr<FGlobalSettingsConfig> &inout DataObject)
{
    FGlobalSettingsConfig __r;
    return __r;
}
}

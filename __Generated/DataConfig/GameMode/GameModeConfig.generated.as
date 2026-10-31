namespace __FGameModeProfileConfigFunctions
{
UFUNCTION()
FInstancedStruct __FGameModeProfileConfig_GetGameModeFlowSettings(const TDataObjectPtr<FGameModeProfileConfig> &inout DataObject)
{
    FInstancedStruct __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GameModeFlowSettings' from a null 'FGameModeProfileConfig' DataObject!");
        }
        FGameModeProfileConfig local_22;
        return local_22.GameModeFlowSettings;
    }
    return __r;
}
UFUNCTION()
TArray<FInstancedStruct> __FGameModeProfileConfig_GetGameModeBehaviorSettings(const TDataObjectPtr<FGameModeProfileConfig> &inout DataObject)
{
    TArray<FInstancedStruct> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GameModeBehaviorSettings' from a null 'FGameModeProfileConfig' DataObject!");
        }
        FGameModeProfileConfig local_22;
        return local_22.GameModeBehaviorSettings;
    }
    return __r;
}
UFUNCTION()
FGameModeProfileConfig CastToFGameModeProfileConfig(const TDataObjectPtr<FGameModeProfileConfig> &inout DataObject)
{
    FGameModeProfileConfig __r;
    return __r;
}
}

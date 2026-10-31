namespace __FLevelGroupLoadingPassConfigFunctions
{
UFUNCTION()
ELevelType __FLevelGroupLoadingPassConfig_GetLevelType(const TDataObjectPtr<FLevelGroupLoadingPassConfig> &inout DataObject)
{
    int local_21 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LevelType' from a null 'FLevelGroupLoadingPassConfig' DataObject!");
        }
        FLevelGroupLoadingPassConfig local_20;
        local_21 = int(local_20.LevelType);
        return ELevelType(local_21);
    }
    return ELevelType(local_21);
}
UFUNCTION()
TArray<FName> __FLevelGroupLoadingPassConfig_GetLoadingPassOrder(const TDataObjectPtr<FLevelGroupLoadingPassConfig> &inout DataObject)
{
    TArray<FName> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LoadingPassOrder' from a null 'FLevelGroupLoadingPassConfig' DataObject!");
        }
        FLevelGroupLoadingPassConfig local_20;
        return local_20.LoadingPassOrder;
    }
    return __r;
}
UFUNCTION()
FLevelGroupLoadingPassConfig CastToFLevelGroupLoadingPassConfig(const TDataObjectPtr<FLevelGroupLoadingPassConfig> &inout DataObject)
{
    FLevelGroupLoadingPassConfig __r;
    return __r;
}
}

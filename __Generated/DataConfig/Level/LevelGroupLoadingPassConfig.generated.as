namespace __FLevelGroupLoadingPassConfigFunctions
{
UFUNCTION()
ELevelType __FLevelGroupLoadingPassConfig_GetLevelType(const TDataObjectPtr<FLevelGroupLoadingPassConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LevelType' from a null 'FLevelGroupLoadingPassConfig' DataObject!");
        }
        FLevelGroupLoadingPassConfig local_20;
        return local_20.LevelType;
    }
    return DataObject.Get().LevelType;
}
UFUNCTION()
TArray<FName> __FLevelGroupLoadingPassConfig_GetLoadingPassOrder(const TDataObjectPtr<FLevelGroupLoadingPassConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LoadingPassOrder' from a null 'FLevelGroupLoadingPassConfig' DataObject!");
        }
        FLevelGroupLoadingPassConfig local_20;
        return local_20.LoadingPassOrder;
    }
    return DataObject.Get().LoadingPassOrder;
}
UFUNCTION()
FLevelGroupLoadingPassConfig CastToFLevelGroupLoadingPassConfig(const TDataObjectPtr<FLevelGroupLoadingPassConfig> &inout DataObject)
{
    FLevelGroupLoadingPassConfig __r;
    return __r;
}
}

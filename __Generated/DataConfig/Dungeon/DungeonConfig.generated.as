namespace __FDungeonConfigFunctions
{
UFUNCTION()
EDungeonType __FDungeonConfig_GetDungeonType(const TDataObjectPtr<FDungeonConfig> &inout DataObject)
{
    int local_121 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DungeonType' from a null 'FDungeonConfig' DataObject!");
        }
        FDungeonConfig local_120;
        local_121 = int(local_120.DungeonType);
        return EDungeonType(local_121);
    }
    return EDungeonType(local_121);
}
UFUNCTION()
TDataObjectPtr<FLevelInfoConfig> __FDungeonConfig_GetLevelConfig(const TDataObjectPtr<FDungeonConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LevelConfig' from a null 'FDungeonConfig' DataObject!");
        }
        FDungeonConfig local_120;
        return local_120.GetLevelConfig();
    }
    return GetLevelConfig();
}
UFUNCTION()
FSoftBrush __FDungeonConfig_GetDungeonIcon(const TDataObjectPtr<FDungeonConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DungeonIcon' from a null 'FDungeonConfig' DataObject!");
        }
        FDungeonConfig local_120;
        return local_120.DungeonIcon;
    }
    return __r;
}
UFUNCTION()
FText __FDungeonConfig_GetDungeonName(const TDataObjectPtr<FDungeonConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DungeonName' from a null 'FDungeonConfig' DataObject!");
        }
        FDungeonConfig local_120;
        return local_120.DungeonName;
    }
    return __r;
}
UFUNCTION()
FText __FDungeonConfig_GetDungeonDesc(const TDataObjectPtr<FDungeonConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DungeonDesc' from a null 'FDungeonConfig' DataObject!");
        }
        FDungeonConfig local_120;
        return local_120.DungeonDesc;
    }
    return __r;
}
UFUNCTION()
TDataObjectPtr<FDropItemConfigBase> __FDungeonConfig_GetTempRewardView(const TDataObjectPtr<FDungeonConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TempRewardView' from a null 'FDungeonConfig' DataObject!");
        }
        FDungeonConfig local_120;
        return local_120.GetTempRewardView();
    }
    return GetTempRewardView();
}
UFUNCTION()
FDungeonConfig CastToFDungeonConfig(const TDataObjectPtr<FDungeonConfig> &inout DataObject)
{
    FDungeonConfig __r;
    return __r;
}
}

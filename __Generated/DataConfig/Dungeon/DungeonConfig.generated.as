namespace __FDungeonConfigFunctions
{
UFUNCTION()
EDungeonType __FDungeonConfig_GetDungeonType(const TDataObjectPtr<FDungeonConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DungeonType' from a null 'FDungeonConfig' DataObject!");
        }
        FDungeonConfig local_120;
        return local_120.DungeonType;
    }
    return DataObject.Get().DungeonType;
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
    return DataObject.Get().GetLevelConfig();
}
UFUNCTION()
FSoftBrush __FDungeonConfig_GetDungeonIcon(const TDataObjectPtr<FDungeonConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DungeonIcon' from a null 'FDungeonConfig' DataObject!");
        }
        FDungeonConfig local_120;
        return local_120.DungeonIcon;
    }
    return DataObject.Get().DungeonIcon;
}
UFUNCTION()
FText __FDungeonConfig_GetDungeonName(const TDataObjectPtr<FDungeonConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DungeonName' from a null 'FDungeonConfig' DataObject!");
        }
        FDungeonConfig local_120;
        return local_120.DungeonName;
    }
    return DataObject.Get().DungeonName;
}
UFUNCTION()
FText __FDungeonConfig_GetDungeonDesc(const TDataObjectPtr<FDungeonConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DungeonDesc' from a null 'FDungeonConfig' DataObject!");
        }
        FDungeonConfig local_120;
        return local_120.DungeonDesc;
    }
    return DataObject.Get().DungeonDesc;
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
    return DataObject.Get().GetTempRewardView();
}
UFUNCTION()
FDungeonConfig CastToFDungeonConfig(const TDataObjectPtr<FDungeonConfig> &inout DataObject)
{
    FDungeonConfig __r;
    return __r;
}
}

namespace __FTeleporterConfigFunctions
{
UFUNCTION()
FText __FTeleporterConfig_GetDisplayName(const TDataObjectPtr<FTeleporterConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayName' from a null 'FTeleporterConfig' DataObject!");
        }
        FTeleporterConfig local_200;
        return local_200.DisplayName;
    }
    return __r;
}
UFUNCTION()
FText __FTeleporterConfig_GetDescription(const TDataObjectPtr<FTeleporterConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Description' from a null 'FTeleporterConfig' DataObject!");
        }
        FTeleporterConfig local_200;
        return local_200.Description;
    }
    return __r;
}
UFUNCTION()
TDataObjectPtr<FPresentationConfig> __FTeleporterConfig_GetPresentationConfig(const TDataObjectPtr<FTeleporterConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PresentationConfig' from a null 'FTeleporterConfig' DataObject!");
        }
        FTeleporterConfig local_200;
        return local_200.GetPresentationConfig();
    }
    return GetPresentationConfig();
}
UFUNCTION()
TDataObjectPtr<FPresentationConfig> __FTeleporterConfig_GetInactivePresentationConfig(const TDataObjectPtr<FTeleporterConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InactivePresentationConfig' from a null 'FTeleporterConfig' DataObject!");
        }
        FTeleporterConfig local_200;
        return local_200.GetInactivePresentationConfig();
    }
    return GetInactivePresentationConfig();
}
UFUNCTION()
FSoftBrush __FTeleporterConfig_GetPreviewHeaderImage(const TDataObjectPtr<FTeleporterConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PreviewHeaderImage' from a null 'FTeleporterConfig' DataObject!");
        }
        FTeleporterConfig local_200;
        return local_200.PreviewHeaderImage;
    }
    return __r;
}
UFUNCTION()
ETeleporterState __FTeleporterConfig_GetDefaultState(const TDataObjectPtr<FTeleporterConfig> &inout DataObject)
{
    int local_201 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultState' from a null 'FTeleporterConfig' DataObject!");
        }
        FTeleporterConfig local_200;
        local_201 = int(local_200.DefaultState);
        return ETeleporterState(local_201);
    }
    return ETeleporterState(local_201);
}
UFUNCTION()
bool __FTeleporterConfig_GetbShowOnWorldMap(const TDataObjectPtr<FTeleporterConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bShowOnWorldMap' from a null 'FTeleporterConfig' DataObject!");
        }
        FTeleporterConfig local_200;
        return local_200.bShowOnWorldMap;
    }
    return local_1;
}
UFUNCTION()
bool __FTeleporterConfig_GetbShowOnRegionMap(const TDataObjectPtr<FTeleporterConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bShowOnRegionMap' from a null 'FTeleporterConfig' DataObject!");
        }
        FTeleporterConfig local_200;
        return local_200.bShowOnRegionMap;
    }
    return local_1;
}
UFUNCTION()
bool __FTeleporterConfig_GetbDynamicTeleporter(const TDataObjectPtr<FTeleporterConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bDynamicTeleporter' from a null 'FTeleporterConfig' DataObject!");
        }
        FTeleporterConfig local_200;
        return local_200.bDynamicTeleporter;
    }
    return local_1;
}
UFUNCTION()
int __FTeleporterConfig_GetDisplayPriority(const TDataObjectPtr<FTeleporterConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayPriority' from a null 'FTeleporterConfig' DataObject!");
        }
        FTeleporterConfig defaultValue;
        return defaultValue.DisplayPriority;
    }
    return DataObject.Get().DisplayPriority;
}
UFUNCTION()
TDataObjectPtr<FDropItemConfigBase> __FTeleporterConfig_GetActivationReward(const TDataObjectPtr<FTeleporterConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ActivationReward' from a null 'FTeleporterConfig' DataObject!");
        }
        FTeleporterConfig local_200;
        return local_200.GetActivationReward();
    }
    return GetActivationReward();
}
UFUNCTION()
TDataObjectPtr<FLevelInfoConfig> __FTeleporterConfig_GetLevelInfoConfig(const TDataObjectPtr<FTeleporterConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LevelInfoConfig' from a null 'FTeleporterConfig' DataObject!");
        }
        FTeleporterConfig local_200;
        return local_200.GetLevelInfoConfig();
    }
    return GetLevelInfoConfig();
}
UFUNCTION()
FVector2D __FTeleporterConfig_GetWorldLocation(const TDataObjectPtr<FTeleporterConfig> &inout DataObject)
{
    FVector2D __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WorldLocation' from a null 'FTeleporterConfig' DataObject!");
        }
        FTeleporterConfig local_200;
        return local_200.WorldLocation;
    }
    return __r;
}
UFUNCTION()
TDataObjectPtr<FDungeonConfig> __FTeleporterConfig_GetTargetDungeonInfoConfig(const TDataObjectPtr<FTeleporterConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TargetDungeonInfoConfig' from a null 'FTeleporterConfig' DataObject!");
        }
        FTeleporterConfig local_200;
        return local_200.GetTargetDungeonInfoConfig();
    }
    return GetTargetDungeonInfoConfig();
}
UFUNCTION()
FTeleporterConfig CastToFTeleporterConfig(const TDataObjectPtr<FTeleporterConfig> &inout DataObject)
{
    FTeleporterConfig __r;
    return __r;
}
}

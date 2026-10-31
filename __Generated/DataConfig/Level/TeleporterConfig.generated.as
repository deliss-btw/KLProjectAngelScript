namespace __FTeleporterConfigFunctions
{
UFUNCTION()
FText __FTeleporterConfig_GetDisplayName(const TDataObjectPtr<FTeleporterConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayName' from a null 'FTeleporterConfig' DataObject!");
        }
        FTeleporterConfig local_200;
        return local_200.DisplayName;
    }
    return DataObject.Get().DisplayName;
}
UFUNCTION()
FText __FTeleporterConfig_GetDescription(const TDataObjectPtr<FTeleporterConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Description' from a null 'FTeleporterConfig' DataObject!");
        }
        FTeleporterConfig local_200;
        return local_200.Description;
    }
    return DataObject.Get().Description;
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
    return DataObject.Get().GetPresentationConfig();
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
    return DataObject.Get().GetInactivePresentationConfig();
}
UFUNCTION()
FSoftBrush __FTeleporterConfig_GetPreviewHeaderImage(const TDataObjectPtr<FTeleporterConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PreviewHeaderImage' from a null 'FTeleporterConfig' DataObject!");
        }
        FTeleporterConfig local_200;
        return local_200.PreviewHeaderImage;
    }
    return DataObject.Get().PreviewHeaderImage;
}
UFUNCTION()
ETeleporterState __FTeleporterConfig_GetDefaultState(const TDataObjectPtr<FTeleporterConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultState' from a null 'FTeleporterConfig' DataObject!");
        }
        FTeleporterConfig local_200;
        return local_200.DefaultState;
    }
    return DataObject.Get().DefaultState;
}
UFUNCTION()
bool __FTeleporterConfig_GetbShowOnWorldMap(const TDataObjectPtr<FTeleporterConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bShowOnWorldMap' from a null 'FTeleporterConfig' DataObject!");
        }
        FTeleporterConfig local_200;
        return local_200.bShowOnWorldMap;
    }
    return DataObject.Get().bShowOnWorldMap;
}
UFUNCTION()
bool __FTeleporterConfig_GetbShowOnRegionMap(const TDataObjectPtr<FTeleporterConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bShowOnRegionMap' from a null 'FTeleporterConfig' DataObject!");
        }
        FTeleporterConfig local_200;
        return local_200.bShowOnRegionMap;
    }
    return DataObject.Get().bShowOnRegionMap;
}
UFUNCTION()
bool __FTeleporterConfig_GetbDynamicTeleporter(const TDataObjectPtr<FTeleporterConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bDynamicTeleporter' from a null 'FTeleporterConfig' DataObject!");
        }
        FTeleporterConfig local_200;
        return local_200.bDynamicTeleporter;
    }
    return DataObject.Get().bDynamicTeleporter;
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
    return DataObject.Get().GetActivationReward();
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
    return DataObject.Get().GetLevelInfoConfig();
}
UFUNCTION()
FVector2D __FTeleporterConfig_GetWorldLocation(const TDataObjectPtr<FTeleporterConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WorldLocation' from a null 'FTeleporterConfig' DataObject!");
        }
        FTeleporterConfig local_200;
        return local_200.WorldLocation;
    }
    return DataObject.Get().WorldLocation;
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
    return DataObject.Get().GetTargetDungeonInfoConfig();
}
UFUNCTION()
FTeleporterConfig CastToFTeleporterConfig(const TDataObjectPtr<FTeleporterConfig> &inout DataObject)
{
    FTeleporterConfig __r;
    return __r;
}
}

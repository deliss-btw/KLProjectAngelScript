namespace __FNPCRoleConfigFunctions
{
UFUNCTION()
FNPCRoleConfig CastToFNPCRoleConfig(const TDataObjectPtr<FNPCRoleConfig> &inout DataObject)
{
    FNPCRoleConfig __r;
    return __r;
}
}
namespace __FNPCPresentationConfigFunctions
{
UFUNCTION()
FNPCPresentationConfig CastToFNPCPresentationConfig(const TDataObjectPtr<FNPCPresentationConfig> &inout DataObject)
{
    FNPCPresentationConfig __r;
    return __r;
}
}
namespace __FNPCSkinOverrideFunctions
{
UFUNCTION()
FText __FNPCSkinOverride_GetDisplayName(const TDataObjectPtr<FNPCSkinOverride> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayName' from a null 'FNPCSkinOverride' DataObject!");
        }
        FNPCSkinOverride local_28;
        return local_28.DisplayName;
    }
    return DataObject.Get().DisplayName;
}
UFUNCTION()
TSoftClassPtr<ACharacterPrefab> __FNPCSkinOverride_GetPrefabOverride(const TDataObjectPtr<FNPCSkinOverride> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PrefabOverride' from a null 'FNPCSkinOverride' DataObject!");
        }
        FNPCSkinOverride local_28;
        return local_28.PrefabOverride;
    }
    return DataObject.Get().PrefabOverride;
}
UFUNCTION()
FNPCSkinOverride CastToFNPCSkinOverride(const TDataObjectPtr<FNPCSkinOverride> &inout DataObject)
{
    FNPCSkinOverride __r;
    return __r;
}
}
namespace __FNPCMainConfigFunctions
{
UFUNCTION()
TDataObjectPtr<FNPCRoleConfig> __FNPCMainConfig_GetRole(const TDataObjectPtr<FNPCMainConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Role' from a null 'FNPCMainConfig' DataObject!");
        }
        FNPCMainConfig local_286;
        return local_286.GetRole();
    }
    return DataObject.Get().GetRole();
}
UFUNCTION()
TDataObjectPtr<FNPCPresentationConfig> __FNPCMainConfig_GetPresentationConfig(const TDataObjectPtr<FNPCMainConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PresentationConfig' from a null 'FNPCMainConfig' DataObject!");
        }
        FNPCMainConfig local_286;
        return local_286.GetPresentationConfig();
    }
    return DataObject.Get().GetPresentationConfig();
}
UFUNCTION()
TDataObjectPtr<FNPCSkinOverride> __FNPCMainConfig_GetSkinOverride(const TDataObjectPtr<FNPCMainConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SkinOverride' from a null 'FNPCMainConfig' DataObject!");
        }
        FNPCMainConfig local_286;
        return local_286.GetSkinOverride();
    }
    return DataObject.Get().GetSkinOverride();
}
UFUNCTION()
TDataObjectPtr<FNPCDailyRouteConfig> __FNPCMainConfig_GetDailyRouteConfig(const TDataObjectPtr<FNPCMainConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DailyRouteConfig' from a null 'FNPCMainConfig' DataObject!");
        }
        FNPCMainConfig local_286;
        return local_286.GetDailyRouteConfig();
    }
    return DataObject.Get().GetDailyRouteConfig();
}
UFUNCTION()
ENPCCombatPriority __FNPCMainConfig_GetCombatPriority(const TDataObjectPtr<FNPCMainConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CombatPriority' from a null 'FNPCMainConfig' DataObject!");
        }
        FNPCMainConfig local_286;
        return local_286.CombatPriority;
    }
    return DataObject.Get().CombatPriority;
}
UFUNCTION()
bool __FNPCMainConfig_GetbShowInWorldMap(const TDataObjectPtr<FNPCMainConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bShowInWorldMap' from a null 'FNPCMainConfig' DataObject!");
        }
        FNPCMainConfig local_286;
        return local_286.bShowInWorldMap;
    }
    return DataObject.Get().bShowInWorldMap;
}
UFUNCTION()
FVector2D __FNPCMainConfig_GetWorldMapFixedPosition(const TDataObjectPtr<FNPCMainConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WorldMapFixedPosition' from a null 'FNPCMainConfig' DataObject!");
        }
        FNPCMainConfig local_286;
        return local_286.WorldMapFixedPosition;
    }
    return DataObject.Get().WorldMapFixedPosition;
}
UFUNCTION()
TDataObjectPtr<FLevelInfoConfig> __FNPCMainConfig_GetWorldMapRegion(const TDataObjectPtr<FNPCMainConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WorldMapRegion' from a null 'FNPCMainConfig' DataObject!");
        }
        FNPCMainConfig local_286;
        return local_286.GetWorldMapRegion();
    }
    return DataObject.Get().GetWorldMapRegion();
}
UFUNCTION()
TArray<FNPCComponentSwitchOverride> __FNPCMainConfig_GetComponentSwitchOverrides(const TDataObjectPtr<FNPCMainConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ComponentSwitchOverrides' from a null 'FNPCMainConfig' DataObject!");
        }
        FNPCMainConfig local_286;
        return local_286.ComponentSwitchOverrides;
    }
    return DataObject.Get().ComponentSwitchOverrides;
}
UFUNCTION()
FNPCMainConfig CastToFNPCMainConfig(const TDataObjectPtr<FNPCMainConfig> &inout DataObject)
{
    FNPCMainConfig __r;
    return __r;
}
}

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
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayName' from a null 'FNPCSkinOverride' DataObject!");
        }
        FNPCSkinOverride local_28;
        return local_28.DisplayName;
    }
    return __r;
}
UFUNCTION()
TSoftClassPtr<ACharacterPrefab> __FNPCSkinOverride_GetPrefabOverride(const TDataObjectPtr<FNPCSkinOverride> &inout DataObject)
{
    TSoftClassPtr<ACharacterPrefab> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PrefabOverride' from a null 'FNPCSkinOverride' DataObject!");
        }
        FNPCSkinOverride local_28;
        return local_28.PrefabOverride;
    }
    return __r;
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
    return GetRole();
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
    return GetPresentationConfig();
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
    return GetSkinOverride();
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
    return GetDailyRouteConfig();
}
UFUNCTION()
ENPCCombatPriority __FNPCMainConfig_GetCombatPriority(const TDataObjectPtr<FNPCMainConfig> &inout DataObject)
{
    int local_287 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CombatPriority' from a null 'FNPCMainConfig' DataObject!");
        }
        FNPCMainConfig local_286;
        local_287 = int(local_286.CombatPriority);
        return ENPCCombatPriority(local_287);
    }
    return ENPCCombatPriority(local_287);
}
UFUNCTION()
bool __FNPCMainConfig_GetbShowInWorldMap(const TDataObjectPtr<FNPCMainConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bShowInWorldMap' from a null 'FNPCMainConfig' DataObject!");
        }
        FNPCMainConfig local_286;
        return local_286.bShowInWorldMap;
    }
    return local_1;
}
UFUNCTION()
FVector2D __FNPCMainConfig_GetWorldMapFixedPosition(const TDataObjectPtr<FNPCMainConfig> &inout DataObject)
{
    FVector2D __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WorldMapFixedPosition' from a null 'FNPCMainConfig' DataObject!");
        }
        FNPCMainConfig local_286;
        return local_286.WorldMapFixedPosition;
    }
    return __r;
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
    return GetWorldMapRegion();
}
UFUNCTION()
TArray<FNPCComponentSwitchOverride> __FNPCMainConfig_GetComponentSwitchOverrides(const TDataObjectPtr<FNPCMainConfig> &inout DataObject)
{
    TArray<FNPCComponentSwitchOverride> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ComponentSwitchOverrides' from a null 'FNPCMainConfig' DataObject!");
        }
        FNPCMainConfig local_286;
        return local_286.ComponentSwitchOverrides;
    }
    return __r;
}
UFUNCTION()
FNPCMainConfig CastToFNPCMainConfig(const TDataObjectPtr<FNPCMainConfig> &inout DataObject)
{
    FNPCMainConfig __r;
    return __r;
}
}

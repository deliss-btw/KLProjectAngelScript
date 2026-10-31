namespace __FPropDisplayConfigFunctions
{
UFUNCTION()
FPropDisplayConfig CastToFPropDisplayConfig(const TDataObjectPtr<FPropDisplayConfig> &inout DataObject)
{
    FPropDisplayConfig __r;
    return __r;
}
}
namespace __FPropPrefabConfigFunctions
{
UFUNCTION()
EPropType __FPropPrefabConfig_GetPropType(const TDataObjectPtr<FPropPrefabConfig> &inout DataObject)
{
    int local_81 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PropType' from a null 'FPropPrefabConfig' DataObject!");
        }
        FPropPrefabConfig local_80;
        local_81 = int(local_80.PropType);
        return EPropType(local_81);
    }
    return EPropType(local_81);
}
UFUNCTION()
ECombatPropType __FPropPrefabConfig_GetCombatPropType(const TDataObjectPtr<FPropPrefabConfig> &inout DataObject)
{
    int local_81 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CombatPropType' from a null 'FPropPrefabConfig' DataObject!");
        }
        FPropPrefabConfig local_80;
        local_81 = int(local_80.CombatPropType);
        return ECombatPropType(local_81);
    }
    return ECombatPropType(local_81);
}
UFUNCTION()
FPropPrefabConfig CastToFPropPrefabConfig(const TDataObjectPtr<FPropPrefabConfig> &inout DataObject)
{
    FPropPrefabConfig __r;
    return __r;
}
}

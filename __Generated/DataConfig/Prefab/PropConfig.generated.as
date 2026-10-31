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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PropType' from a null 'FPropPrefabConfig' DataObject!");
        }
        FPropPrefabConfig local_80;
        return local_80.PropType;
    }
    return DataObject.Get().PropType;
}
UFUNCTION()
ECombatPropType __FPropPrefabConfig_GetCombatPropType(const TDataObjectPtr<FPropPrefabConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CombatPropType' from a null 'FPropPrefabConfig' DataObject!");
        }
        FPropPrefabConfig local_80;
        return local_80.CombatPropType;
    }
    return DataObject.Get().CombatPropType;
}
UFUNCTION()
FPropPrefabConfig CastToFPropPrefabConfig(const TDataObjectPtr<FPropPrefabConfig> &inout DataObject)
{
    FPropPrefabConfig __r;
    return __r;
}
}

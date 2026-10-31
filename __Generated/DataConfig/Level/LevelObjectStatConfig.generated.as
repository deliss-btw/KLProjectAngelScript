namespace __FLevelObjectStatConfigFunctions
{
UFUNCTION()
TDataObjectPtr<FMapConfig> __FLevelObjectStatConfig_GetMapConfig(const TDataObjectPtr<FLevelObjectStatConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MapConfig' from a null 'FLevelObjectStatConfig' DataObject!");
        }
        FLevelObjectStatConfig local_42;
        return local_42.GetMapConfig();
    }
    return DataObject.Get().GetMapConfig();
}
UFUNCTION()
ELevelObjectStatType __FLevelObjectStatConfig_GetObjectType(const TDataObjectPtr<FLevelObjectStatConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ObjectType' from a null 'FLevelObjectStatConfig' DataObject!");
        }
        FLevelObjectStatConfig local_42;
        return local_42.ObjectType;
    }
    return DataObject.Get().ObjectType;
}
UFUNCTION()
int __FLevelObjectStatConfig_GetCooldownDuration(const TDataObjectPtr<FLevelObjectStatConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CooldownDuration' from a null 'FLevelObjectStatConfig' DataObject!");
        }
        FLevelObjectStatConfig defaultValue;
        return defaultValue.CooldownDuration;
    }
    return DataObject.Get().CooldownDuration;
}
UFUNCTION()
FLevelObjectStatConfig CastToFLevelObjectStatConfig(const TDataObjectPtr<FLevelObjectStatConfig> &inout DataObject)
{
    FLevelObjectStatConfig __r;
    return __r;
}
}

namespace __FForgeNodeConfigFunctions
{
UFUNCTION()
FString __FForgeNodeConfig_GetForgeName(const TDataObjectPtr<FForgeNodeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ForgeName' from a null 'FForgeNodeConfig' DataObject!");
        }
        FForgeNodeConfig local_54;
        return local_54.ForgeName;
    }
    return DataObject.Get().ForgeName;
}
UFUNCTION()
int __FForgeNodeConfig_GetForgeLv(const TDataObjectPtr<FForgeNodeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ForgeLv' from a null 'FForgeNodeConfig' DataObject!");
        }
        FForgeNodeConfig defaultValue;
        return defaultValue.ForgeLv;
    }
    return DataObject.Get().ForgeLv;
}
UFUNCTION()
TArray<TDataObjectPtr<FConditionConfig>> __FForgeNodeConfig_GetUnlockCondition(const TDataObjectPtr<FForgeNodeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UnlockCondition' from a null 'FForgeNodeConfig' DataObject!");
        }
        FForgeNodeConfig local_54;
        return local_54.GetUnlockCondition();
    }
    return DataObject.Get().GetUnlockCondition();
}
UFUNCTION()
TArray<FItemParamConfig> __FForgeNodeConfig_GetCost(const TDataObjectPtr<FForgeNodeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Cost' from a null 'FForgeNodeConfig' DataObject!");
        }
        FForgeNodeConfig local_54;
        return local_54.Cost;
    }
    return DataObject.Get().Cost;
}
UFUNCTION()
TDataObjectPtr<FCraftConfig> __FForgeNodeConfig_GetCraft(const TDataObjectPtr<FForgeNodeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Craft' from a null 'FForgeNodeConfig' DataObject!");
        }
        FForgeNodeConfig local_54;
        return local_54.GetCraft();
    }
    return DataObject.Get().GetCraft();
}
UFUNCTION()
FForgeNodeConfig CastToFForgeNodeConfig(const TDataObjectPtr<FForgeNodeConfig> &inout DataObject)
{
    FForgeNodeConfig __r;
    return __r;
}
}

namespace __FForgeTreeLevelConfigFunctions
{
UFUNCTION()
int __FForgeTreeLevelConfig_GetForgeLv(const TDataObjectPtr<FForgeTreeLevelConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ForgeLv' from a null 'FForgeTreeLevelConfig' DataObject!");
        }
        FForgeTreeLevelConfig defaultValue;
        return defaultValue.ForgeLv;
    }
    return DataObject.Get().ForgeLv;
}
UFUNCTION()
TArray<TDataObjectPtr<FConditionConfig>> __FForgeTreeLevelConfig_GetShowCondition(const TDataObjectPtr<FForgeTreeLevelConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ShowCondition' from a null 'FForgeTreeLevelConfig' DataObject!");
        }
        FForgeTreeLevelConfig local_20;
        return local_20.GetShowCondition();
    }
    return DataObject.Get().GetShowCondition();
}
UFUNCTION()
FForgeTreeLevelConfig CastToFForgeTreeLevelConfig(const TDataObjectPtr<FForgeTreeLevelConfig> &inout DataObject)
{
    FForgeTreeLevelConfig __r;
    return __r;
}
}

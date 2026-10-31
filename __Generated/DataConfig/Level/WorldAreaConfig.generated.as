namespace __FWorldAreaConfigFunctions
{
UFUNCTION()
FText __FWorldAreaConfig_GetAreaName(const TDataObjectPtr<FWorldAreaConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AreaName' from a null 'FWorldAreaConfig' DataObject!");
        }
        FWorldAreaConfig local_68;
        return local_68.AreaName;
    }
    return DataObject.Get().AreaName;
}
UFUNCTION()
FText __FWorldAreaConfig_GetDescription(const TDataObjectPtr<FWorldAreaConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Description' from a null 'FWorldAreaConfig' DataObject!");
        }
        FWorldAreaConfig local_68;
        return local_68.Description;
    }
    return DataObject.Get().Description;
}
UFUNCTION()
TSet<TSoftClassPtr<AKLLevelScriptActor>> __FWorldAreaConfig_GetCommissionExtraLoadDatalayers(const TDataObjectPtr<FWorldAreaConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionExtraLoadDatalayers' from a null 'FWorldAreaConfig' DataObject!");
        }
        FWorldAreaConfig local_68;
        return local_68.CommissionExtraLoadDatalayers;
    }
    return DataObject.Get().CommissionExtraLoadDatalayers;
}
UFUNCTION()
TSet<EKLDataLayerFilterTags> __FWorldAreaConfig_GetCommissionExtraLoadFilterTags(const TDataObjectPtr<FWorldAreaConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionExtraLoadFilterTags' from a null 'FWorldAreaConfig' DataObject!");
        }
        FWorldAreaConfig local_68;
        return local_68.CommissionExtraLoadFilterTags;
    }
    return DataObject.Get().CommissionExtraLoadFilterTags;
}
UFUNCTION()
UDataTable __FWorldAreaConfig_GetDifficultyLevelConfig(const TDataObjectPtr<FWorldAreaConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DifficultyLevelConfig' from a null 'FWorldAreaConfig' DataObject!");
        }
        FWorldAreaConfig local_68;
        return local_68.DifficultyLevelConfig;
    }
    UDataTable local_70;
    return local_70;
}
UFUNCTION()
int __FWorldAreaConfig_GetMonsterDifficultyLevel(const TDataObjectPtr<FWorldAreaConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MonsterDifficultyLevel' from a null 'FWorldAreaConfig' DataObject!");
        }
        FWorldAreaConfig defaultValue;
        return defaultValue.MonsterDifficultyLevel;
    }
    return DataObject.Get().MonsterDifficultyLevel;
}
UFUNCTION()
FWorldAreaConfig CastToFWorldAreaConfig(const TDataObjectPtr<FWorldAreaConfig> &inout DataObject)
{
    FWorldAreaConfig __r;
    return __r;
}
}

namespace __FDifficultyLevelAttributeConfigFunctions
{
UFUNCTION()
int __FDifficultyLevelAttributeConfig_GetLevel(const TDataObjectPtr<FDifficultyLevelAttributeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Level' from a null 'FDifficultyLevelAttributeConfig' DataObject!");
        }
        FDifficultyLevelAttributeConfig defaultValue;
        return defaultValue.Level;
    }
    return DataObject.Get().Level;
}
UFUNCTION()
TMap<EDifficultyRank, FDifficultyAttributeScale> __FDifficultyLevelAttributeConfig_GetAttributeByRank(const TDataObjectPtr<FDifficultyLevelAttributeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AttributeByRank' from a null 'FDifficultyLevelAttributeConfig' DataObject!");
        }
        FDifficultyLevelAttributeConfig local_36;
        return local_36.AttributeByRank;
    }
    return DataObject.Get().AttributeByRank;
}
UFUNCTION()
FDifficultyLevelAttributeConfig CastToFDifficultyLevelAttributeConfig(const TDataObjectPtr<FDifficultyLevelAttributeConfig> &inout DataObject)
{
    FDifficultyLevelAttributeConfig __r;
    return __r;
}
}

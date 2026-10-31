namespace __FAISpecialCombatTokenConfigFunctions
{
UFUNCTION()
FString __FAISpecialCombatTokenConfig_GetComments(const TDataObjectPtr<FAISpecialCombatTokenConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Comments' from a null 'FAISpecialCombatTokenConfig' DataObject!");
        }
        FAISpecialCombatTokenConfig local_46;
        return local_46.Comments;
    }
    return DataObject.Get().Comments;
}
UFUNCTION()
float32 __FAISpecialCombatTokenConfig_GetValidDuration(const TDataObjectPtr<FAISpecialCombatTokenConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ValidDuration' from a null 'FAISpecialCombatTokenConfig' DataObject!");
        }
        FAISpecialCombatTokenConfig defaultValue;
        return defaultValue.ValidDuration;
    }
    return DataObject.Get().ValidDuration;
}
UFUNCTION()
FAISpecialCombatTokenGenNum __FAISpecialCombatTokenConfig_GetGenerateTokenNum(const TDataObjectPtr<FAISpecialCombatTokenConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GenerateTokenNum' from a null 'FAISpecialCombatTokenConfig' DataObject!");
        }
        FAISpecialCombatTokenConfig local_46;
        return local_46.GenerateTokenNum;
    }
    return DataObject.Get().GenerateTokenNum;
}
UFUNCTION()
TArray<FAISmartValuePackItem> __FAISpecialCombatTokenConfig_GetParams(const TDataObjectPtr<FAISpecialCombatTokenConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Params' from a null 'FAISpecialCombatTokenConfig' DataObject!");
        }
        FAISpecialCombatTokenConfig local_46;
        return local_46.Params;
    }
    return DataObject.Get().Params;
}
UFUNCTION()
EESMBlackboardConditionTagQueryType __FAISpecialCombatTokenConfig_GetFilterByTagType(const TDataObjectPtr<FAISpecialCombatTokenConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FilterByTagType' from a null 'FAISpecialCombatTokenConfig' DataObject!");
        }
        FAISpecialCombatTokenConfig local_46;
        return local_46.FilterByTagType;
    }
    return DataObject.Get().FilterByTagType;
}
UFUNCTION()
FGameplayTagContainer __FAISpecialCombatTokenConfig_GetFilterByTags(const TDataObjectPtr<FAISpecialCombatTokenConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FilterByTags' from a null 'FAISpecialCombatTokenConfig' DataObject!");
        }
        FAISpecialCombatTokenConfig local_46;
        return local_46.FilterByTags;
    }
    return DataObject.Get().FilterByTags;
}
UFUNCTION()
EAISpecialCombatTokenFilterByTokenType __FAISpecialCombatTokenConfig_GetFilterByTokenType(const TDataObjectPtr<FAISpecialCombatTokenConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FilterByTokenType' from a null 'FAISpecialCombatTokenConfig' DataObject!");
        }
        FAISpecialCombatTokenConfig local_46;
        return local_46.FilterByTokenType;
    }
    return DataObject.Get().FilterByTokenType;
}
UFUNCTION()
TArray<TDataObjectPtr<FAISpecialCombatTokenConfig>> __FAISpecialCombatTokenConfig_GetFilterByTokens(const TDataObjectPtr<FAISpecialCombatTokenConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FilterByTokens' from a null 'FAISpecialCombatTokenConfig' DataObject!");
        }
        FAISpecialCombatTokenConfig local_46;
        return local_46.GetFilterByTokens();
    }
    return DataObject.Get().GetFilterByTokens();
}
UFUNCTION()
FAISpecialCombatTokenConfig CastToFAISpecialCombatTokenConfig(const TDataObjectPtr<FAISpecialCombatTokenConfig> &inout DataObject)
{
    FAISpecialCombatTokenConfig __r;
    return __r;
}
}

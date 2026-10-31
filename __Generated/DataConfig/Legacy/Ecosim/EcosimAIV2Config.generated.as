namespace __FEcosimAIV2UnitDataFunctions
{
UFUNCTION()
FString __FEcosimAIV2UnitData_GetComment(const TDataObjectPtr<FEcosimAIV2UnitData> &inout DataObject)
{
    FString __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Comment' from a null 'FEcosimAIV2UnitData' DataObject!");
        }
        FEcosimAIV2UnitData local_28;
        return local_28.Comment;
    }
    return __r;
}
UFUNCTION()
TSoftClassPtr<AECSPrefab> __FEcosimAIV2UnitData_GetRealWorldEntityPrefab(const TDataObjectPtr<FEcosimAIV2UnitData> &inout DataObject)
{
    TSoftClassPtr<AECSPrefab> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RealWorldEntityPrefab' from a null 'FEcosimAIV2UnitData' DataObject!");
        }
        FEcosimAIV2UnitData local_28;
        return local_28.RealWorldEntityPrefab;
    }
    return __r;
}
UFUNCTION()
FEcosimAIV2UnitData CastToFEcosimAIV2UnitData(const TDataObjectPtr<FEcosimAIV2UnitData> &inout DataObject)
{
    FEcosimAIV2UnitData __r;
    return __r;
}
}
namespace __FInteractSimpleSpeakToAndOptionFunctions
{
UFUNCTION()
TArray<FInstancedStruct> __FInteractSimpleSpeakToAndOption_GetConditionList(const TDataObjectPtr<FInteractSimpleSpeakToAndOption> &inout DataObject)
{
    TArray<FInstancedStruct> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ConditionList' from a null 'FInteractSimpleSpeakToAndOption' DataObject!");
        }
        FInteractSimpleSpeakToAndOption local_34;
        return local_34.ConditionList;
    }
    return __r;
}
UFUNCTION()
FString __FInteractSimpleSpeakToAndOption_GetSpeakToContent(const TDataObjectPtr<FInteractSimpleSpeakToAndOption> &inout DataObject)
{
    FString __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SpeakToContent' from a null 'FInteractSimpleSpeakToAndOption' DataObject!");
        }
        FInteractSimpleSpeakToAndOption local_34;
        return local_34.SpeakToContent;
    }
    return __r;
}
UFUNCTION()
TArray<FString> __FInteractSimpleSpeakToAndOption_GetAdditionalSpeakToContentList(const TDataObjectPtr<FInteractSimpleSpeakToAndOption> &inout DataObject)
{
    TArray<FString> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AdditionalSpeakToContentList' from a null 'FInteractSimpleSpeakToAndOption' DataObject!");
        }
        FInteractSimpleSpeakToAndOption local_34;
        return local_34.AdditionalSpeakToContentList;
    }
    return __r;
}
UFUNCTION()
TArray<FName> __FInteractSimpleSpeakToAndOption_GetCustomContextKeyList(const TDataObjectPtr<FInteractSimpleSpeakToAndOption> &inout DataObject)
{
    TArray<FName> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CustomContextKeyList' from a null 'FInteractSimpleSpeakToAndOption' DataObject!");
        }
        FInteractSimpleSpeakToAndOption local_34;
        return local_34.CustomContextKeyList;
    }
    return __r;
}
UFUNCTION()
TArray<FEcosimAIV2DialogueOption> __FInteractSimpleSpeakToAndOption_GetOptionList(const TDataObjectPtr<FInteractSimpleSpeakToAndOption> &inout DataObject)
{
    TArray<FEcosimAIV2DialogueOption> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'OptionList' from a null 'FInteractSimpleSpeakToAndOption' DataObject!");
        }
        FInteractSimpleSpeakToAndOption local_34;
        return local_34.OptionList;
    }
    return __r;
}
UFUNCTION()
FInteractSimpleSpeakToAndOption CastToFInteractSimpleSpeakToAndOption(const TDataObjectPtr<FInteractSimpleSpeakToAndOption> &inout DataObject)
{
    FInteractSimpleSpeakToAndOption __r;
    return __r;
}
}
namespace __FEcosimAIV2LLMPublicSpeakDataFunctions
{
UFUNCTION()
FString __FEcosimAIV2LLMPublicSpeakData_GetComment(const TDataObjectPtr<FEcosimAIV2LLMPublicSpeakData> &inout DataObject)
{
    FString __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Comment' from a null 'FEcosimAIV2LLMPublicSpeakData' DataObject!");
        }
        FEcosimAIV2LLMPublicSpeakData local_36;
        return local_36.Comment;
    }
    return __r;
}
UFUNCTION()
FString __FEcosimAIV2LLMPublicSpeakData_GetConstContent(const TDataObjectPtr<FEcosimAIV2LLMPublicSpeakData> &inout DataObject)
{
    FString __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ConstContent' from a null 'FEcosimAIV2LLMPublicSpeakData' DataObject!");
        }
        FEcosimAIV2LLMPublicSpeakData local_36;
        return local_36.ConstContent;
    }
    return __r;
}
UFUNCTION()
float32 __FEcosimAIV2LLMPublicSpeakData_GetConstDuration(const TDataObjectPtr<FEcosimAIV2LLMPublicSpeakData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ConstDuration' from a null 'FEcosimAIV2LLMPublicSpeakData' DataObject!");
        }
        FEcosimAIV2LLMPublicSpeakData defaultValue;
        return defaultValue.ConstDuration;
    }
    return DataObject.Get().ConstDuration;
}
UFUNCTION()
FString __FEcosimAIV2LLMPublicSpeakData_GetPromptFileName(const TDataObjectPtr<FEcosimAIV2LLMPublicSpeakData> &inout DataObject)
{
    FString __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PromptFileName' from a null 'FEcosimAIV2LLMPublicSpeakData' DataObject!");
        }
        FEcosimAIV2LLMPublicSpeakData local_36;
        return local_36.PromptFileName;
    }
    return __r;
}
UFUNCTION()
FString __FEcosimAIV2LLMPublicSpeakData_GetAdditionalContext(const TDataObjectPtr<FEcosimAIV2LLMPublicSpeakData> &inout DataObject)
{
    FString __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AdditionalContext' from a null 'FEcosimAIV2LLMPublicSpeakData' DataObject!");
        }
        FEcosimAIV2LLMPublicSpeakData local_36;
        return local_36.AdditionalContext;
    }
    return __r;
}
UFUNCTION()
FGameplayTag __FEcosimAIV2LLMPublicSpeakData_GetSpeakKeyTag(const TDataObjectPtr<FEcosimAIV2LLMPublicSpeakData> &inout DataObject)
{
    FGameplayTag __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SpeakKeyTag' from a null 'FEcosimAIV2LLMPublicSpeakData' DataObject!");
        }
        FEcosimAIV2LLMPublicSpeakData local_36;
        return local_36.SpeakKeyTag;
    }
    return __r;
}
UFUNCTION()
float32 __FEcosimAIV2LLMPublicSpeakData_GetMinSpeakInterval(const TDataObjectPtr<FEcosimAIV2LLMPublicSpeakData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MinSpeakInterval' from a null 'FEcosimAIV2LLMPublicSpeakData' DataObject!");
        }
        FEcosimAIV2LLMPublicSpeakData defaultValue;
        return defaultValue.MinSpeakInterval;
    }
    return DataObject.Get().MinSpeakInterval;
}
UFUNCTION()
FEcosimAIV2LLMPublicSpeakData CastToFEcosimAIV2LLMPublicSpeakData(const TDataObjectPtr<FEcosimAIV2LLMPublicSpeakData> &inout DataObject)
{
    FEcosimAIV2LLMPublicSpeakData __r;
    return __r;
}
}
namespace __FAITokenByTargetConfigFunctions
{
UFUNCTION()
float32 __FAITokenByTargetConfig_GetMinInteraval(const TDataObjectPtr<FAITokenByTargetConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MinInteraval' from a null 'FAITokenByTargetConfig' DataObject!");
        }
        FAITokenByTargetConfig defaultValue;
        return defaultValue.MinInteraval;
    }
    return DataObject.Get().MinInteraval;
}
UFUNCTION()
int __FAITokenByTargetConfig_GetMaxTokenNum(const TDataObjectPtr<FAITokenByTargetConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaxTokenNum' from a null 'FAITokenByTargetConfig' DataObject!");
        }
        FAITokenByTargetConfig defaultValue;
        return defaultValue.MaxTokenNum;
    }
    return DataObject.Get().MaxTokenNum;
}
UFUNCTION()
float32 __FAITokenByTargetConfig_GetTokenRecoverTime(const TDataObjectPtr<FAITokenByTargetConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TokenRecoverTime' from a null 'FAITokenByTargetConfig' DataObject!");
        }
        FAITokenByTargetConfig defaultValue;
        return defaultValue.TokenRecoverTime;
    }
    return DataObject.Get().TokenRecoverTime;
}
UFUNCTION()
EAITokenRecoverMode __FAITokenByTargetConfig_GetRecoverMode(const TDataObjectPtr<FAITokenByTargetConfig> &inout DataObject)
{
    int local_19 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RecoverMode' from a null 'FAITokenByTargetConfig' DataObject!");
        }
        FAITokenByTargetConfig local_18;
        local_19 = int(local_18.RecoverMode);
        return EAITokenRecoverMode(local_19);
    }
    return EAITokenRecoverMode(local_19);
}
UFUNCTION()
FAITokenByTargetConfig CastToFAITokenByTargetConfig(const TDataObjectPtr<FAITokenByTargetConfig> &inout DataObject)
{
    FAITokenByTargetConfig __r;
    return __r;
}
}

namespace __FScriptControlESMSkillConfigFunctions
{
UFUNCTION()
TSoftObjectPtr<UBehaviorTree> __FScriptControlESMSkillConfig_GetBehaviorTreeAsset(const TDataObjectPtr<FScriptControlESMSkillConfig> &inout DataObject)
{
    TSoftObjectPtr<UBehaviorTree> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BehaviorTreeAsset' from a null 'FScriptControlESMSkillConfig' DataObject!");
        }
        FScriptControlESMSkillConfig local_24;
        return local_24.BehaviorTreeAsset;
    }
    return __r;
}
UFUNCTION()
FScriptControlESMSkillConfig CastToFScriptControlESMSkillConfig(const TDataObjectPtr<FScriptControlESMSkillConfig> &inout DataObject)
{
    FScriptControlESMSkillConfig __r;
    return __r;
}
}

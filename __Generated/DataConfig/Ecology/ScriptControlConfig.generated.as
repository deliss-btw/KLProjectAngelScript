namespace __FScriptControlESMSkillConfigFunctions
{
UFUNCTION()
TSoftObjectPtr<UBehaviorTree> __FScriptControlESMSkillConfig_GetBehaviorTreeAsset(const TDataObjectPtr<FScriptControlESMSkillConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BehaviorTreeAsset' from a null 'FScriptControlESMSkillConfig' DataObject!");
        }
        FScriptControlESMSkillConfig local_24;
        return local_24.BehaviorTreeAsset;
    }
    return DataObject.Get().BehaviorTreeAsset;
}
UFUNCTION()
FScriptControlESMSkillConfig CastToFScriptControlESMSkillConfig(const TDataObjectPtr<FScriptControlESMSkillConfig> &inout DataObject)
{
    FScriptControlESMSkillConfig __r;
    return __r;
}
}

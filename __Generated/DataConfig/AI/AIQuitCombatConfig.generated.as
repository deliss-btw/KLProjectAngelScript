namespace __FAIQuitCombatConfigFunctions
{
UFUNCTION()
float32 __FAIQuitCombatConfig_GetQuitCombatDelay(const TDataObjectPtr<FAIQuitCombatConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'QuitCombatDelay' from a null 'FAIQuitCombatConfig' DataObject!");
        }
        FAIQuitCombatConfig defaultValue;
        return defaultValue.QuitCombatDelay;
    }
    return DataObject.Get().QuitCombatDelay;
}
UFUNCTION()
float32 __FAIQuitCombatConfig_GetQuitCombatDistance(const TDataObjectPtr<FAIQuitCombatConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'QuitCombatDistance' from a null 'FAIQuitCombatConfig' DataObject!");
        }
        FAIQuitCombatConfig defaultValue;
        return defaultValue.QuitCombatDistance;
    }
    return DataObject.Get().QuitCombatDistance;
}
UFUNCTION()
float32 __FAIQuitCombatConfig_GetResumeCombatDelay(const TDataObjectPtr<FAIQuitCombatConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ResumeCombatDelay' from a null 'FAIQuitCombatConfig' DataObject!");
        }
        FAIQuitCombatConfig defaultValue;
        return defaultValue.ResumeCombatDelay;
    }
    return DataObject.Get().ResumeCombatDelay;
}
UFUNCTION()
float32 __FAIQuitCombatConfig_GetReturnToHomeAcceptRadius(const TDataObjectPtr<FAIQuitCombatConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ReturnToHomeAcceptRadius' from a null 'FAIQuitCombatConfig' DataObject!");
        }
        FAIQuitCombatConfig defaultValue;
        return defaultValue.ReturnToHomeAcceptRadius;
    }
    return DataObject.Get().ReturnToHomeAcceptRadius;
}
UFUNCTION()
float32 __FAIQuitCombatConfig_GetCombatRadius(const TDataObjectPtr<FAIQuitCombatConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CombatRadius' from a null 'FAIQuitCombatConfig' DataObject!");
        }
        FAIQuitCombatConfig defaultValue;
        return defaultValue.CombatRadius;
    }
    return DataObject.Get().CombatRadius;
}
UFUNCTION()
EAIQuitCombatRule __FAIQuitCombatConfig_GetQuitCombatRule(const TDataObjectPtr<FAIQuitCombatConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'QuitCombatRule' from a null 'FAIQuitCombatConfig' DataObject!");
        }
        FAIQuitCombatConfig local_20;
        return local_20.QuitCombatRule;
    }
    return DataObject.Get().QuitCombatRule;
}
UFUNCTION()
EAIBackHomeWay __FAIQuitCombatConfig_GetBackHomeWay(const TDataObjectPtr<FAIQuitCombatConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BackHomeWay' from a null 'FAIQuitCombatConfig' DataObject!");
        }
        FAIQuitCombatConfig local_20;
        return local_20.BackHomeWay;
    }
    return DataObject.Get().BackHomeWay;
}
UFUNCTION()
FAIQuitCombatConfig CastToFAIQuitCombatConfig(const TDataObjectPtr<FAIQuitCombatConfig> &inout DataObject)
{
    FAIQuitCombatConfig __r;
    return __r;
}
}

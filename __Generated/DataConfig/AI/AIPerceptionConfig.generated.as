namespace __FAIPerceptionConfigFunctions
{
UFUNCTION()
FSightPerceptionConfig __FAIPerceptionConfig_GetDefaultSightConfig(const TDataObjectPtr<FAIPerceptionConfig> &inout DataObject)
{
    FSightPerceptionConfig __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultSightConfig' from a null 'FAIPerceptionConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
TMap<FName, FSightPerceptionConfig> __FAIPerceptionConfig_GetOverrideSightConfigMap(const TDataObjectPtr<FAIPerceptionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'OverrideSightConfigMap' from a null 'FAIPerceptionConfig' DataObject!");
        }
        FAIPerceptionConfig local_70;
        return local_70.OverrideSightConfigMap;
    }
    return DataObject.Get().OverrideSightConfigMap;
}
UFUNCTION()
float32 __FAIPerceptionConfig_GetOutOfCombatDelay(const TDataObjectPtr<FAIPerceptionConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'OutOfCombatDelay' from a null 'FAIPerceptionConfig' DataObject!");
        }
        FAIPerceptionConfig defaultValue;
        return defaultValue.OutOfCombatDelay;
    }
    return DataObject.Get().OutOfCombatDelay;
}
UFUNCTION()
float32 __FAIPerceptionConfig_GetOutOfCombatDistance(const TDataObjectPtr<FAIPerceptionConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'OutOfCombatDistance' from a null 'FAIPerceptionConfig' DataObject!");
        }
        FAIPerceptionConfig defaultValue;
        return defaultValue.OutOfCombatDistance;
    }
    return DataObject.Get().OutOfCombatDistance;
}
UFUNCTION()
float32 __FAIPerceptionConfig_GetOutOfCombatMaxDistance(const TDataObjectPtr<FAIPerceptionConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'OutOfCombatMaxDistance' from a null 'FAIPerceptionConfig' DataObject!");
        }
        FAIPerceptionConfig defaultValue;
        return defaultValue.OutOfCombatMaxDistance;
    }
    return DataObject.Get().OutOfCombatMaxDistance;
}
UFUNCTION()
UAIAlertnessConfigDataAsset __FAIPerceptionConfig_GetAIAlertnessConfigOverride(const TDataObjectPtr<FAIPerceptionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AIAlertnessConfigOverride' from a null 'FAIPerceptionConfig' DataObject!");
        }
        FAIPerceptionConfig local_70;
        return local_70.AIAlertnessConfigOverride;
    }
    UAIAlertnessConfigDataAsset local_72;
    return local_72;
}
UFUNCTION()
TMap<FName, UAIAlertnessConfigDataAsset> __FAIPerceptionConfig_GetOverrideAlertConfigMap(const TDataObjectPtr<FAIPerceptionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'OverrideAlertConfigMap' from a null 'FAIPerceptionConfig' DataObject!");
        }
        FAIPerceptionConfig local_70;
        return local_70.OverrideAlertConfigMap;
    }
    return DataObject.Get().OverrideAlertConfigMap;
}
UFUNCTION()
float32 __FAIPerceptionConfig_GetMeleeRange(const TDataObjectPtr<FAIPerceptionConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MeleeRange' from a null 'FAIPerceptionConfig' DataObject!");
        }
        FAIPerceptionConfig defaultValue;
        return defaultValue.MeleeRange;
    }
    return DataObject.Get().MeleeRange;
}
UFUNCTION()
float32 __FAIPerceptionConfig_GetHostilityAccumulationTime(const TDataObjectPtr<FAIPerceptionConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HostilityAccumulationTime' from a null 'FAIPerceptionConfig' DataObject!");
        }
        FAIPerceptionConfig defaultValue;
        return defaultValue.HostilityAccumulationTime;
    }
    return DataObject.Get().HostilityAccumulationTime;
}
UFUNCTION()
float32 __FAIPerceptionConfig_GetHostilityRemainTime(const TDataObjectPtr<FAIPerceptionConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HostilityRemainTime' from a null 'FAIPerceptionConfig' DataObject!");
        }
        FAIPerceptionConfig defaultValue;
        return defaultValue.HostilityRemainTime;
    }
    return DataObject.Get().HostilityRemainTime;
}
UFUNCTION()
FAIPerceptionConfig CastToFAIPerceptionConfig(const TDataObjectPtr<FAIPerceptionConfig> &inout DataObject)
{
    FAIPerceptionConfig __r;
    return __r;
}
}

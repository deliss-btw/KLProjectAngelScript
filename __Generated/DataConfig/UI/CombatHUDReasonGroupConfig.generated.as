namespace __FCombatHUDReasonGroupConfigFunctions
{
UFUNCTION()
TArray<ECombatHUDReason> __FCombatHUDReasonGroupConfig_GetReasons(const TDataObjectPtr<FCombatHUDReasonGroupConfig> &inout DataObject)
{
    TArray<ECombatHUDReason> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Reasons' from a null 'FCombatHUDReasonGroupConfig' DataObject!");
        }
        FCombatHUDReasonGroupConfig local_26;
        return local_26.Reasons;
    }
    return __r;
}
UFUNCTION()
EWidgetHideRuleType __FCombatHUDReasonGroupConfig_GetRuleType(const TDataObjectPtr<FCombatHUDReasonGroupConfig> &inout DataObject)
{
    int local_27 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RuleType' from a null 'FCombatHUDReasonGroupConfig' DataObject!");
        }
        FCombatHUDReasonGroupConfig local_26;
        local_27 = int(local_26.RuleType);
        return EWidgetHideRuleType(local_27);
    }
    return EWidgetHideRuleType(local_27);
}
UFUNCTION()
TArray<TDataObjectPtr<FWidgetHiddenConfig>> __FCombatHUDReasonGroupConfig_GetHideConfigs(const TDataObjectPtr<FCombatHUDReasonGroupConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HideConfigs' from a null 'FCombatHUDReasonGroupConfig' DataObject!");
        }
        FCombatHUDReasonGroupConfig local_26;
        return local_26.GetHideConfigs();
    }
    return GetHideConfigs();
}
UFUNCTION()
float32 __FCombatHUDReasonGroupConfig_GetDelaySec(const TDataObjectPtr<FCombatHUDReasonGroupConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DelaySec' from a null 'FCombatHUDReasonGroupConfig' DataObject!");
        }
        FCombatHUDReasonGroupConfig defaultValue;
        return defaultValue.DelaySec;
    }
    return DataObject.Get().DelaySec;
}
UFUNCTION()
FCombatHUDReasonGroupConfig CastToFCombatHUDReasonGroupConfig(const TDataObjectPtr<FCombatHUDReasonGroupConfig> &inout DataObject)
{
    FCombatHUDReasonGroupConfig __r;
    return __r;
}
}

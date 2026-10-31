namespace __FCommissionEntryRuleConfigFunctions
{
UFUNCTION()
FText __FCommissionEntryRuleConfig_GetDescription(const TDataObjectPtr<FCommissionEntryRuleConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Description' from a null 'FCommissionEntryRuleConfig' DataObject!");
        }
        FCommissionEntryRuleConfig local_92;
        return local_92.Description;
    }
    return __r;
}
UFUNCTION()
ECommissionEntryRuleType __FCommissionEntryRuleConfig_GetRuleType(const TDataObjectPtr<FCommissionEntryRuleConfig> &inout DataObject)
{
    int local_93 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RuleType' from a null 'FCommissionEntryRuleConfig' DataObject!");
        }
        FCommissionEntryRuleConfig local_92;
        local_93 = int(local_92.RuleType);
        return ECommissionEntryRuleType(local_93);
    }
    return ECommissionEntryRuleType(local_93);
}
UFUNCTION()
FText __FCommissionEntryRuleConfig_GetRuleName(const TDataObjectPtr<FCommissionEntryRuleConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RuleName' from a null 'FCommissionEntryRuleConfig' DataObject!");
        }
        FCommissionEntryRuleConfig local_92;
        return local_92.RuleName;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FCommissionEntryRuleConfig_GetRuleIcon(const TDataObjectPtr<FCommissionEntryRuleConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RuleIcon' from a null 'FCommissionEntryRuleConfig' DataObject!");
        }
        FCommissionEntryRuleConfig local_92;
        return local_92.RuleIcon;
    }
    return __r;
}
UFUNCTION()
TSet<TSoftClassPtr<AKLLevelScriptActor>> __FCommissionEntryRuleConfig_GetExtraLoadDatalayerClasses(const TDataObjectPtr<FCommissionEntryRuleConfig> &inout DataObject)
{
    TSet<TSoftClassPtr<AKLLevelScriptActor>> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExtraLoadDatalayerClasses' from a null 'FCommissionEntryRuleConfig' DataObject!");
        }
        FCommissionEntryRuleConfig local_92;
        return local_92.ExtraLoadDatalayerClasses;
    }
    return __r;
}
UFUNCTION()
FCommissionEntryRuleConfig CastToFCommissionEntryRuleConfig(const TDataObjectPtr<FCommissionEntryRuleConfig> &inout DataObject)
{
    FCommissionEntryRuleConfig __r;
    return __r;
}
}

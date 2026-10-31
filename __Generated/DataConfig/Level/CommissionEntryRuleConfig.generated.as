namespace __FCommissionEntryRuleConfigFunctions
{
UFUNCTION()
FText __FCommissionEntryRuleConfig_GetDescription(const TDataObjectPtr<FCommissionEntryRuleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Description' from a null 'FCommissionEntryRuleConfig' DataObject!");
        }
        FCommissionEntryRuleConfig local_92;
        return local_92.Description;
    }
    return DataObject.Get().Description;
}
UFUNCTION()
ECommissionEntryRuleType __FCommissionEntryRuleConfig_GetRuleType(const TDataObjectPtr<FCommissionEntryRuleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RuleType' from a null 'FCommissionEntryRuleConfig' DataObject!");
        }
        FCommissionEntryRuleConfig local_92;
        return local_92.RuleType;
    }
    return DataObject.Get().RuleType;
}
UFUNCTION()
FText __FCommissionEntryRuleConfig_GetRuleName(const TDataObjectPtr<FCommissionEntryRuleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RuleName' from a null 'FCommissionEntryRuleConfig' DataObject!");
        }
        FCommissionEntryRuleConfig local_92;
        return local_92.RuleName;
    }
    return DataObject.Get().RuleName;
}
UFUNCTION()
FSoftBrush __FCommissionEntryRuleConfig_GetRuleIcon(const TDataObjectPtr<FCommissionEntryRuleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RuleIcon' from a null 'FCommissionEntryRuleConfig' DataObject!");
        }
        FCommissionEntryRuleConfig local_92;
        return local_92.RuleIcon;
    }
    return DataObject.Get().RuleIcon;
}
UFUNCTION()
TSet<TSoftClassPtr<AKLLevelScriptActor>> __FCommissionEntryRuleConfig_GetExtraLoadDatalayerClasses(const TDataObjectPtr<FCommissionEntryRuleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExtraLoadDatalayerClasses' from a null 'FCommissionEntryRuleConfig' DataObject!");
        }
        FCommissionEntryRuleConfig local_92;
        return local_92.ExtraLoadDatalayerClasses;
    }
    return DataObject.Get().ExtraLoadDatalayerClasses;
}
UFUNCTION()
FCommissionEntryRuleConfig CastToFCommissionEntryRuleConfig(const TDataObjectPtr<FCommissionEntryRuleConfig> &inout DataObject)
{
    FCommissionEntryRuleConfig __r;
    return __r;
}
}

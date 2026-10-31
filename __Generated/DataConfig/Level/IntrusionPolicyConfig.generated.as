namespace __FIntrusionPolicyConfigFunctions
{
UFUNCTION()
FText __FIntrusionPolicyConfig_GetIntrusionName(const TDataObjectPtr<FIntrusionPolicyConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IntrusionName' from a null 'FIntrusionPolicyConfig' DataObject!");
        }
        FIntrusionPolicyConfig local_96;
        return local_96.IntrusionName;
    }
    return __r;
}
UFUNCTION()
FText __FIntrusionPolicyConfig_GetIntrusionTips(const TDataObjectPtr<FIntrusionPolicyConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IntrusionTips' from a null 'FIntrusionPolicyConfig' DataObject!");
        }
        FIntrusionPolicyConfig local_96;
        return local_96.IntrusionTips;
    }
    return __r;
}
UFUNCTION()
FText __FIntrusionPolicyConfig_GetIntrusionDescription(const TDataObjectPtr<FIntrusionPolicyConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IntrusionDescription' from a null 'FIntrusionPolicyConfig' DataObject!");
        }
        FIntrusionPolicyConfig local_96;
        return local_96.IntrusionDescription;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FIntrusionPolicyConfig_GetIntrusionIcon(const TDataObjectPtr<FIntrusionPolicyConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IntrusionIcon' from a null 'FIntrusionPolicyConfig' DataObject!");
        }
        FIntrusionPolicyConfig local_96;
        return local_96.IntrusionIcon;
    }
    return __r;
}
UFUNCTION()
TSet<TSoftClassPtr<AKLLevelScriptActor>> __FIntrusionPolicyConfig_GetExtraLoadDatalayerClasses(const TDataObjectPtr<FIntrusionPolicyConfig> &inout DataObject)
{
    TSet<TSoftClassPtr<AKLLevelScriptActor>> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExtraLoadDatalayerClasses' from a null 'FIntrusionPolicyConfig' DataObject!");
        }
        FIntrusionPolicyConfig local_96;
        return local_96.ExtraLoadDatalayerClasses;
    }
    return __r;
}
UFUNCTION()
FIntrusionPolicyConfig CastToFIntrusionPolicyConfig(const TDataObjectPtr<FIntrusionPolicyConfig> &inout DataObject)
{
    FIntrusionPolicyConfig __r;
    return __r;
}
}

namespace __FIntrusionPolicyConfigFunctions
{
UFUNCTION()
FText __FIntrusionPolicyConfig_GetIntrusionName(const TDataObjectPtr<FIntrusionPolicyConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IntrusionName' from a null 'FIntrusionPolicyConfig' DataObject!");
        }
        FIntrusionPolicyConfig local_96;
        return local_96.IntrusionName;
    }
    return DataObject.Get().IntrusionName;
}
UFUNCTION()
FText __FIntrusionPolicyConfig_GetIntrusionTips(const TDataObjectPtr<FIntrusionPolicyConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IntrusionTips' from a null 'FIntrusionPolicyConfig' DataObject!");
        }
        FIntrusionPolicyConfig local_96;
        return local_96.IntrusionTips;
    }
    return DataObject.Get().IntrusionTips;
}
UFUNCTION()
FText __FIntrusionPolicyConfig_GetIntrusionDescription(const TDataObjectPtr<FIntrusionPolicyConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IntrusionDescription' from a null 'FIntrusionPolicyConfig' DataObject!");
        }
        FIntrusionPolicyConfig local_96;
        return local_96.IntrusionDescription;
    }
    return DataObject.Get().IntrusionDescription;
}
UFUNCTION()
FSoftBrush __FIntrusionPolicyConfig_GetIntrusionIcon(const TDataObjectPtr<FIntrusionPolicyConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IntrusionIcon' from a null 'FIntrusionPolicyConfig' DataObject!");
        }
        FIntrusionPolicyConfig local_96;
        return local_96.IntrusionIcon;
    }
    return DataObject.Get().IntrusionIcon;
}
UFUNCTION()
TSet<TSoftClassPtr<AKLLevelScriptActor>> __FIntrusionPolicyConfig_GetExtraLoadDatalayerClasses(const TDataObjectPtr<FIntrusionPolicyConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExtraLoadDatalayerClasses' from a null 'FIntrusionPolicyConfig' DataObject!");
        }
        FIntrusionPolicyConfig local_96;
        return local_96.ExtraLoadDatalayerClasses;
    }
    return DataObject.Get().ExtraLoadDatalayerClasses;
}
UFUNCTION()
FIntrusionPolicyConfig CastToFIntrusionPolicyConfig(const TDataObjectPtr<FIntrusionPolicyConfig> &inout DataObject)
{
    FIntrusionPolicyConfig __r;
    return __r;
}
}

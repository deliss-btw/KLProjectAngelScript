namespace __FDivineSkillConfigFunctions
{
UFUNCTION()
bool __FDivineSkillConfig_GetbDefaultUnlock(const TDataObjectPtr<FDivineSkillConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bDefaultUnlock' from a null 'FDivineSkillConfig' DataObject!");
        }
        FDivineSkillConfig local_192;
        return local_192.bDefaultUnlock;
    }
    return DataObject.Get().bDefaultUnlock;
}
UFUNCTION()
EDivineSkillType __FDivineSkillConfig_GetDivineSkillType(const TDataObjectPtr<FDivineSkillConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DivineSkillType' from a null 'FDivineSkillConfig' DataObject!");
        }
        FDivineSkillConfig local_192;
        return local_192.DivineSkillType;
    }
    return DataObject.Get().DivineSkillType;
}
UFUNCTION()
TDataObjectPtr<FDivineSkillConfig> __FDivineSkillConfig_GetUpgradeSkill(const TDataObjectPtr<FDivineSkillConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UpgradeSkill' from a null 'FDivineSkillConfig' DataObject!");
        }
        FDivineSkillConfig local_192;
        return local_192.GetUpgradeSkill();
    }
    return DataObject.Get().GetUpgradeSkill();
}
UFUNCTION()
FText __FDivineSkillConfig_GetDisplayName(const TDataObjectPtr<FDivineSkillConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayName' from a null 'FDivineSkillConfig' DataObject!");
        }
        FDivineSkillConfig local_192;
        return local_192.DisplayName;
    }
    return DataObject.Get().DisplayName;
}
UFUNCTION()
FText __FDivineSkillConfig_GetCostDescription(const TDataObjectPtr<FDivineSkillConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CostDescription' from a null 'FDivineSkillConfig' DataObject!");
        }
        FDivineSkillConfig local_192;
        return local_192.CostDescription;
    }
    return DataObject.Get().CostDescription;
}
UFUNCTION()
FText __FDivineSkillConfig_GetAttributeDescription(const TDataObjectPtr<FDivineSkillConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AttributeDescription' from a null 'FDivineSkillConfig' DataObject!");
        }
        FDivineSkillConfig local_192;
        return local_192.AttributeDescription;
    }
    return DataObject.Get().AttributeDescription;
}
UFUNCTION()
FText __FDivineSkillConfig_GetDescription(const TDataObjectPtr<FDivineSkillConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Description' from a null 'FDivineSkillConfig' DataObject!");
        }
        FDivineSkillConfig local_192;
        return local_192.Description;
    }
    return DataObject.Get().Description;
}
UFUNCTION()
FText __FDivineSkillConfig_GetBackgroundDescription(const TDataObjectPtr<FDivineSkillConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BackgroundDescription' from a null 'FDivineSkillConfig' DataObject!");
        }
        FDivineSkillConfig local_192;
        return local_192.BackgroundDescription;
    }
    return DataObject.Get().BackgroundDescription;
}
UFUNCTION()
FSoftBrush __FDivineSkillConfig_GetDisplayIcon(const TDataObjectPtr<FDivineSkillConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayIcon' from a null 'FDivineSkillConfig' DataObject!");
        }
        FDivineSkillConfig local_192;
        return local_192.DisplayIcon;
    }
    return DataObject.Get().DisplayIcon;
}
UFUNCTION()
TDataObjectPtr<FDivineSkillTypeConfig> __FDivineSkillConfig_GetTypeConfig(const TDataObjectPtr<FDivineSkillConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TypeConfig' from a null 'FDivineSkillConfig' DataObject!");
        }
        FDivineSkillConfig local_192;
        return local_192.GetTypeConfig();
    }
    return DataObject.Get().GetTypeConfig();
}
UFUNCTION()
TDataObjectPtr<FDivineLiteraryTypeConfig> __FDivineSkillConfig_GetLiteraryTypeConfig(const TDataObjectPtr<FDivineSkillConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LiteraryTypeConfig' from a null 'FDivineSkillConfig' DataObject!");
        }
        FDivineSkillConfig local_192;
        return local_192.GetLiteraryTypeConfig();
    }
    return DataObject.Get().GetLiteraryTypeConfig();
}
UFUNCTION()
USkillConfig __FDivineSkillConfig_GetSkillConfig(const TDataObjectPtr<FDivineSkillConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SkillConfig' from a null 'FDivineSkillConfig' DataObject!");
        }
        FDivineSkillConfig local_192;
        return local_192.SkillConfig;
    }
    USkillConfig local_194;
    return local_194;
}
UFUNCTION()
FBuffConfigRef __FDivineSkillConfig_GetBuffConfig(const TDataObjectPtr<FDivineSkillConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BuffConfig' from a null 'FDivineSkillConfig' DataObject!");
        }
        FDivineSkillConfig local_192;
        return local_192.BuffConfig;
    }
    return DataObject.Get().BuffConfig;
}
UFUNCTION()
TArray<FGameplayModifierConfigRefWithArgs> __FDivineSkillConfig_GetModifiers(const TDataObjectPtr<FDivineSkillConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Modifiers' from a null 'FDivineSkillConfig' DataObject!");
        }
        FDivineSkillConfig local_192;
        return local_192.Modifiers;
    }
    return DataObject.Get().Modifiers;
}
UFUNCTION()
TArray<FCapabilityConfigWithLevel> __FDivineSkillConfig_GetCapabilities(const TDataObjectPtr<FDivineSkillConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Capabilities' from a null 'FDivineSkillConfig' DataObject!");
        }
        FDivineSkillConfig local_192;
        return local_192.Capabilities;
    }
    return DataObject.Get().Capabilities;
}
UFUNCTION()
UMediaSource __FDivineSkillConfig_GetPreviewMovie(const TDataObjectPtr<FDivineSkillConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PreviewMovie' from a null 'FDivineSkillConfig' DataObject!");
        }
        FDivineSkillConfig local_192;
        return local_192.PreviewMovie;
    }
    UMediaSource local_194;
    return local_194;
}
UFUNCTION()
FDivineSkillConfig CastToFDivineSkillConfig(const TDataObjectPtr<FDivineSkillConfig> &inout DataObject)
{
    FDivineSkillConfig __r;
    return __r;
}
}

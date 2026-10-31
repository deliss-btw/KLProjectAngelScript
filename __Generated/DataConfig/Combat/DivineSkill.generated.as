namespace __FDivineSkillConfigFunctions
{
UFUNCTION()
bool __FDivineSkillConfig_GetbDefaultUnlock(const TDataObjectPtr<FDivineSkillConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bDefaultUnlock' from a null 'FDivineSkillConfig' DataObject!");
        }
        FDivineSkillConfig local_192;
        return local_192.bDefaultUnlock;
    }
    return local_1;
}
UFUNCTION()
EDivineSkillType __FDivineSkillConfig_GetDivineSkillType(const TDataObjectPtr<FDivineSkillConfig> &inout DataObject)
{
    int local_193 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DivineSkillType' from a null 'FDivineSkillConfig' DataObject!");
        }
        FDivineSkillConfig local_192;
        local_193 = int(local_192.DivineSkillType);
        return EDivineSkillType(local_193);
    }
    return EDivineSkillType(local_193);
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
    return GetUpgradeSkill();
}
UFUNCTION()
FText __FDivineSkillConfig_GetDisplayName(const TDataObjectPtr<FDivineSkillConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayName' from a null 'FDivineSkillConfig' DataObject!");
        }
        FDivineSkillConfig local_192;
        return local_192.DisplayName;
    }
    return __r;
}
UFUNCTION()
FText __FDivineSkillConfig_GetCostDescription(const TDataObjectPtr<FDivineSkillConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CostDescription' from a null 'FDivineSkillConfig' DataObject!");
        }
        FDivineSkillConfig local_192;
        return local_192.CostDescription;
    }
    return __r;
}
UFUNCTION()
FText __FDivineSkillConfig_GetAttributeDescription(const TDataObjectPtr<FDivineSkillConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AttributeDescription' from a null 'FDivineSkillConfig' DataObject!");
        }
        FDivineSkillConfig local_192;
        return local_192.AttributeDescription;
    }
    return __r;
}
UFUNCTION()
FText __FDivineSkillConfig_GetDescription(const TDataObjectPtr<FDivineSkillConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Description' from a null 'FDivineSkillConfig' DataObject!");
        }
        FDivineSkillConfig local_192;
        return local_192.Description;
    }
    return __r;
}
UFUNCTION()
FText __FDivineSkillConfig_GetBackgroundDescription(const TDataObjectPtr<FDivineSkillConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BackgroundDescription' from a null 'FDivineSkillConfig' DataObject!");
        }
        FDivineSkillConfig local_192;
        return local_192.BackgroundDescription;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FDivineSkillConfig_GetDisplayIcon(const TDataObjectPtr<FDivineSkillConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayIcon' from a null 'FDivineSkillConfig' DataObject!");
        }
        FDivineSkillConfig local_192;
        return local_192.DisplayIcon;
    }
    return __r;
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
    return GetTypeConfig();
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
    return GetLiteraryTypeConfig();
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
    FBuffConfigRef __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BuffConfig' from a null 'FDivineSkillConfig' DataObject!");
        }
        FDivineSkillConfig local_192;
        return local_192.BuffConfig;
    }
    return __r;
}
UFUNCTION()
TArray<FGameplayModifierConfigRefWithArgs> __FDivineSkillConfig_GetModifiers(const TDataObjectPtr<FDivineSkillConfig> &inout DataObject)
{
    TArray<FGameplayModifierConfigRefWithArgs> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Modifiers' from a null 'FDivineSkillConfig' DataObject!");
        }
        FDivineSkillConfig local_192;
        return local_192.Modifiers;
    }
    return __r;
}
UFUNCTION()
TArray<FCapabilityConfigWithLevel> __FDivineSkillConfig_GetCapabilities(const TDataObjectPtr<FDivineSkillConfig> &inout DataObject)
{
    TArray<FCapabilityConfigWithLevel> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Capabilities' from a null 'FDivineSkillConfig' DataObject!");
        }
        FDivineSkillConfig local_192;
        return local_192.Capabilities;
    }
    return __r;
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

namespace __FAvatarBuildOverrideConfigFunctions
{
UFUNCTION()
TDataObjectPtr<FAvatarMappingConfig> __FAvatarBuildOverrideConfig_GetAvatarMappingConfig(const TDataObjectPtr<FAvatarBuildOverrideConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AvatarMappingConfig' from a null 'FAvatarBuildOverrideConfig' DataObject!");
        }
        FAvatarBuildOverrideConfig local_168;
        return local_168.GetAvatarMappingConfig();
    }
    return GetAvatarMappingConfig();
}
UFUNCTION()
TDataObjectPtr<FGameAttributeInitConfig_Avatar> __FAvatarBuildOverrideConfig_GetAttributeInitConfig(const TDataObjectPtr<FAvatarBuildOverrideConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AttributeInitConfig' from a null 'FAvatarBuildOverrideConfig' DataObject!");
        }
        FAvatarBuildOverrideConfig local_168;
        return local_168.GetAttributeInitConfig();
    }
    return GetAttributeInitConfig();
}
UFUNCTION()
int __FAvatarBuildOverrideConfig_GetLevel(const TDataObjectPtr<FAvatarBuildOverrideConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Level' from a null 'FAvatarBuildOverrideConfig' DataObject!");
        }
        FAvatarBuildOverrideConfig defaultValue;
        return defaultValue.Level;
    }
    return DataObject.Get().Level;
}
UFUNCTION()
TDataObjectPtr<FWeaponConfig> __FAvatarBuildOverrideConfig_GetWeaponConfig(const TDataObjectPtr<FAvatarBuildOverrideConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeaponConfig' from a null 'FAvatarBuildOverrideConfig' DataObject!");
        }
        FAvatarBuildOverrideConfig local_168;
        return local_168.GetWeaponConfig();
    }
    return GetWeaponConfig();
}
UFUNCTION()
bool __FAvatarBuildOverrideConfig_GetbOverrideTalisman(const TDataObjectPtr<FAvatarBuildOverrideConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bOverrideTalisman' from a null 'FAvatarBuildOverrideConfig' DataObject!");
        }
        FAvatarBuildOverrideConfig local_168;
        return local_168.bOverrideTalisman;
    }
    return local_1;
}
UFUNCTION()
TArray<TDataObjectPtr<FTalismanConfig>> __FAvatarBuildOverrideConfig_GetTalismans(const TDataObjectPtr<FAvatarBuildOverrideConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Talismans' from a null 'FAvatarBuildOverrideConfig' DataObject!");
        }
        FAvatarBuildOverrideConfig local_168;
        return local_168.GetTalismans();
    }
    return GetTalismans();
}
UFUNCTION()
TArray<TDataObjectPtr<FTalentConfig>> __FAvatarBuildOverrideConfig_GetUnlockTalents(const TDataObjectPtr<FAvatarBuildOverrideConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UnlockTalents' from a null 'FAvatarBuildOverrideConfig' DataObject!");
        }
        FAvatarBuildOverrideConfig local_168;
        return local_168.GetUnlockTalents();
    }
    return GetUnlockTalents();
}
UFUNCTION()
TDataObjectPtr<FTalentConfig> __FAvatarBuildOverrideConfig_GetFoundationTalent(const TDataObjectPtr<FAvatarBuildOverrideConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FoundationTalent' from a null 'FAvatarBuildOverrideConfig' DataObject!");
        }
        FAvatarBuildOverrideConfig local_168;
        return local_168.GetFoundationTalent();
    }
    return GetFoundationTalent();
}
UFUNCTION()
TMap<ESkillSlot, TDataObjectPtr<FTalentConfig>> __FAvatarBuildOverrideConfig_GetReplaceSkillSlotTalents(const TDataObjectPtr<FAvatarBuildOverrideConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ReplaceSkillSlotTalents' from a null 'FAvatarBuildOverrideConfig' DataObject!");
        }
        FAvatarBuildOverrideConfig local_168;
        return local_168.GetReplaceSkillSlotTalents();
    }
    return GetReplaceSkillSlotTalents();
}
UFUNCTION()
TDataObjectPtr<FDivineSkillConfig> __FAvatarBuildOverrideConfig_GetDivineSkill(const TDataObjectPtr<FAvatarBuildOverrideConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DivineSkill' from a null 'FAvatarBuildOverrideConfig' DataObject!");
        }
        FAvatarBuildOverrideConfig local_168;
        return local_168.GetDivineSkill();
    }
    return GetDivineSkill();
}
UFUNCTION()
FAvatarBuildOverrideConfig CastToFAvatarBuildOverrideConfig(const TDataObjectPtr<FAvatarBuildOverrideConfig> &inout DataObject)
{
    FAvatarBuildOverrideConfig __r;
    return __r;
}
}

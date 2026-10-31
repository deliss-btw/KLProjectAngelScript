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
    return DataObject.Get().GetAvatarMappingConfig();
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
    return DataObject.Get().GetAttributeInitConfig();
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
    return DataObject.Get().GetWeaponConfig();
}
UFUNCTION()
bool __FAvatarBuildOverrideConfig_GetbOverrideTalisman(const TDataObjectPtr<FAvatarBuildOverrideConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bOverrideTalisman' from a null 'FAvatarBuildOverrideConfig' DataObject!");
        }
        FAvatarBuildOverrideConfig local_168;
        return local_168.bOverrideTalisman;
    }
    return DataObject.Get().bOverrideTalisman;
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
    return DataObject.Get().GetTalismans();
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
    return DataObject.Get().GetUnlockTalents();
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
    return DataObject.Get().GetFoundationTalent();
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
    return DataObject.Get().GetReplaceSkillSlotTalents();
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
    return DataObject.Get().GetDivineSkill();
}
UFUNCTION()
FAvatarBuildOverrideConfig CastToFAvatarBuildOverrideConfig(const TDataObjectPtr<FAvatarBuildOverrideConfig> &inout DataObject)
{
    FAvatarBuildOverrideConfig __r;
    return __r;
}
}

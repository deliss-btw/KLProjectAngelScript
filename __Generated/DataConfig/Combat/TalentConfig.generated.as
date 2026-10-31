namespace __FTalentConfigFunctions
{
UFUNCTION()
TDataObjectPtr<FAvatarMappingConfig> __FTalentConfig_GetAvatar(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Avatar' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.GetAvatar();
    }
    return DataObject.Get().GetAvatar();
}
UFUNCTION()
TDataObjectPtr<FSkillInitConfig> __FTalentConfig_GetSkillConfig(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SkillConfig' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.GetSkillConfig();
    }
    return DataObject.Get().GetSkillConfig();
}
UFUNCTION()
int __FTalentConfig_GetSkillCapabilityLevel(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SkillCapabilityLevel' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig defaultValue;
        return defaultValue.SkillCapabilityLevel;
    }
    return DataObject.Get().SkillCapabilityLevel;
}
UFUNCTION()
ESkillType __FTalentConfig_GetTalentSkillType(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TalentSkillType' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.TalentSkillType;
    }
    return DataObject.Get().TalentSkillType;
}
UFUNCTION()
float32 __FTalentConfig_GetTalentSkillCDSeconds(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TalentSkillCDSeconds' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig defaultValue;
        return defaultValue.TalentSkillCDSeconds;
    }
    return DataObject.Get().TalentSkillCDSeconds;
}
UFUNCTION()
TDataObjectPtr<FCapabilityConfig> __FTalentConfig_GetCapabilityConfig(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CapabilityConfig' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.GetCapabilityConfig();
    }
    return DataObject.Get().GetCapabilityConfig();
}
UFUNCTION()
int __FTalentConfig_GetCapabilityLevel(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CapabilityLevel' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig defaultValue;
        return defaultValue.CapabilityLevel;
    }
    return DataObject.Get().CapabilityLevel;
}
UFUNCTION()
TArray<FCapabilityParamModifier> __FTalentConfig_GetCapabilityParamModifiers(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CapabilityParamModifiers' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.CapabilityParamModifiers;
    }
    return DataObject.Get().CapabilityParamModifiers;
}
UFUNCTION()
ETalentType __FTalentConfig_GetTalentType(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TalentType' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.TalentType;
    }
    return DataObject.Get().TalentType;
}
UFUNCTION()
FNameHandle_EntityBBVarInt __FTalentConfig_GetFoundationTalentBBKey(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FoundationTalentBBKey' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.FoundationTalentBBKey;
    }
    return DataObject.Get().FoundationTalentBBKey;
}
UFUNCTION()
int __FTalentConfig_GetFoundationTalentBBValue(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FoundationTalentBBValue' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig defaultValue;
        return defaultValue.FoundationTalentBBValue;
    }
    return DataObject.Get().FoundationTalentBBValue;
}
UFUNCTION()
TDataObjectPtr<FTalentConfig> __FTalentConfig_GetFoundationTalent(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FoundationTalent' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.GetFoundationTalent();
    }
    return DataObject.Get().GetFoundationTalent();
}
UFUNCTION()
ETalentDivision __FTalentConfig_GetTalentDivision(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TalentDivision' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.TalentDivision;
    }
    return DataObject.Get().TalentDivision;
}
UFUNCTION()
TArray<TDataObjectPtr<FServerConditionConfigBase>> __FTalentConfig_GetUnlockCondition(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UnlockCondition' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.GetUnlockCondition();
    }
    return DataObject.Get().GetUnlockCondition();
}
UFUNCTION()
TArray<FItemParamConfig> __FTalentConfig_GetUnlockCost(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UnlockCost' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.UnlockCost;
    }
    return DataObject.Get().UnlockCost;
}
UFUNCTION()
TArray<TDataObjectPtr<FTalentConfig>> __FTalentConfig_GetUnlockFrontTalent(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UnlockFrontTalent' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.GetUnlockFrontTalent();
    }
    return DataObject.Get().GetUnlockFrontTalent();
}
UFUNCTION()
EUnlockType __FTalentConfig_GetUnlockType(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UnlockType' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.UnlockType;
    }
    return DataObject.Get().UnlockType;
}
UFUNCTION()
TDataObjectPtr<FTalentConfig> __FTalentConfig_GetBaseTalent(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BaseTalent' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.GetBaseTalent();
    }
    return DataObject.Get().GetBaseTalent();
}
UFUNCTION()
TDataObjectPtr<FTalentConfig> __FTalentConfig_GetChooseTalent(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ChooseTalent' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.GetChooseTalent();
    }
    return DataObject.Get().GetChooseTalent();
}
UFUNCTION()
TDataObjectPtr<FTalentConfig> __FTalentConfig_GetDoubleFormTalent(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DoubleFormTalent' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.GetDoubleFormTalent();
    }
    return DataObject.Get().GetDoubleFormTalent();
}
UFUNCTION()
FText __FTalentConfig_GetTalentName(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TalentName' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.TalentName;
    }
    return DataObject.Get().TalentName;
}
UFUNCTION()
FText __FTalentConfig_GetShotDesc(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ShotDesc' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.ShotDesc;
    }
    return DataObject.Get().ShotDesc;
}
UFUNCTION()
FText __FTalentConfig_GetTalentDesc(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TalentDesc' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.TalentDesc;
    }
    return DataObject.Get().TalentDesc;
}
UFUNCTION()
FText __FTalentConfig_GetTalentUpgradeDesc(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TalentUpgradeDesc' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.TalentUpgradeDesc;
    }
    return DataObject.Get().TalentUpgradeDesc;
}
UFUNCTION()
FSoftBrush __FTalentConfig_GetIcon(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Icon' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.Icon;
    }
    return DataObject.Get().Icon;
}
UFUNCTION()
UMediaSource __FTalentConfig_GetPreviewMovie(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PreviewMovie' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.PreviewMovie;
    }
    UMediaSource local_366;
    return local_366;
}
UFUNCTION()
FSoftBrush __FTalentConfig_GetPreviewImage(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PreviewImage' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.PreviewImage;
    }
    return DataObject.Get().PreviewImage;
}
UFUNCTION()
TDataObjectPtr<FTalentConfig> __FTalentConfig_GetFoundationTalentUnlockTalent(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FoundationTalentUnlockTalent' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.GetFoundationTalentUnlockTalent();
    }
    return DataObject.Get().GetFoundationTalentUnlockTalent();
}
UFUNCTION()
TArray<TDataObjectPtr<FTalentConfig>> __FTalentConfig_GetPassiveLinkedTalentArray(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PassiveLinkedTalentArray' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.GetPassiveLinkedTalentArray();
    }
    return DataObject.Get().GetPassiveLinkedTalentArray();
}
UFUNCTION()
bool __FTalentConfig_GetbHide(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bHide' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.bHide;
    }
    return DataObject.Get().bHide;
}
UFUNCTION()
FTalentConfig CastToFTalentConfig(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    FTalentConfig __r;
    return __r;
}
}

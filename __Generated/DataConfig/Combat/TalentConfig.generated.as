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
    return GetAvatar();
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
    return GetSkillConfig();
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
    int local_365 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TalentSkillType' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        local_365 = int(local_364.TalentSkillType);
        return ESkillType(local_365);
    }
    return ESkillType(local_365);
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
    return GetCapabilityConfig();
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
    TArray<FCapabilityParamModifier> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CapabilityParamModifiers' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.CapabilityParamModifiers;
    }
    return __r;
}
UFUNCTION()
ETalentType __FTalentConfig_GetTalentType(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    int local_365 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TalentType' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        local_365 = int(local_364.TalentType);
        return ETalentType(local_365);
    }
    return ETalentType(local_365);
}
UFUNCTION()
FNameHandle_EntityBBVarInt __FTalentConfig_GetFoundationTalentBBKey(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    FNameHandle_EntityBBVarInt __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FoundationTalentBBKey' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.FoundationTalentBBKey;
    }
    return __r;
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
    return GetFoundationTalent();
}
UFUNCTION()
ETalentDivision __FTalentConfig_GetTalentDivision(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    int local_365 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TalentDivision' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        local_365 = int(local_364.TalentDivision);
        return ETalentDivision(local_365);
    }
    return ETalentDivision(local_365);
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
    return GetUnlockCondition();
}
UFUNCTION()
TArray<FItemParamConfig> __FTalentConfig_GetUnlockCost(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    TArray<FItemParamConfig> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UnlockCost' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.UnlockCost;
    }
    return __r;
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
    return GetUnlockFrontTalent();
}
UFUNCTION()
EUnlockType __FTalentConfig_GetUnlockType(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    int local_365 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UnlockType' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        local_365 = int(local_364.UnlockType);
        return EUnlockType(local_365);
    }
    return EUnlockType(local_365);
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
    return GetBaseTalent();
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
    return GetChooseTalent();
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
    return GetDoubleFormTalent();
}
UFUNCTION()
FText __FTalentConfig_GetTalentName(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TalentName' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.TalentName;
    }
    return __r;
}
UFUNCTION()
FText __FTalentConfig_GetShotDesc(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ShotDesc' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.ShotDesc;
    }
    return __r;
}
UFUNCTION()
FText __FTalentConfig_GetTalentDesc(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TalentDesc' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.TalentDesc;
    }
    return __r;
}
UFUNCTION()
FText __FTalentConfig_GetTalentUpgradeDesc(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TalentUpgradeDesc' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.TalentUpgradeDesc;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FTalentConfig_GetIcon(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Icon' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.Icon;
    }
    return __r;
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
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PreviewImage' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.PreviewImage;
    }
    return __r;
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
    return GetFoundationTalentUnlockTalent();
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
    return GetPassiveLinkedTalentArray();
}
UFUNCTION()
bool __FTalentConfig_GetbHide(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bHide' from a null 'FTalentConfig' DataObject!");
        }
        FTalentConfig local_364;
        return local_364.bHide;
    }
    return local_1;
}
UFUNCTION()
FTalentConfig CastToFTalentConfig(const TDataObjectPtr<FTalentConfig> &inout DataObject)
{
    FTalentConfig __r;
    return __r;
}
}

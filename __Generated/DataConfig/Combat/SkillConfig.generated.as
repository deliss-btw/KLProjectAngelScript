namespace __FSkillBtnInputActionConfigFunctions
{
UFUNCTION()
FSkillBtnInputActionConfig CastToFSkillBtnInputActionConfig(const TDataObjectPtr<FSkillBtnInputActionConfig> &inout DataObject)
{
    FSkillBtnInputActionConfig __r;
    return __r;
}
}
namespace __FSkillBtnConfigFunctions
{
UFUNCTION()
TDataObjectPtr<FAvatarMappingConfig> __FSkillBtnConfig_GetAvatarMapping(const TDataObjectPtr<FSkillBtnConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AvatarMapping' from a null 'FSkillBtnConfig' DataObject!");
        }
        FSkillBtnConfig local_240;
        return local_240.GetAvatarMapping();
    }
    return GetAvatarMapping();
}
UFUNCTION()
FName __FSkillBtnConfig_GetAvatarName(const TDataObjectPtr<FSkillBtnConfig> &inout DataObject)
{
    FName __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AvatarName' from a null 'FSkillBtnConfig' DataObject!");
        }
        FSkillBtnConfig local_240;
        return local_240.AvatarName;
    }
    return __r;
}
UFUNCTION()
bool __FSkillBtnConfig_GetbEnableExclusiveSkill(const TDataObjectPtr<FSkillBtnConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bEnableExclusiveSkill' from a null 'FSkillBtnConfig' DataObject!");
        }
        FSkillBtnConfig local_240;
        return local_240.bEnableExclusiveSkill;
    }
    return local_1;
}
UFUNCTION()
bool __FSkillBtnConfig_GetbEnableGamepadRightShoulderAnim(const TDataObjectPtr<FSkillBtnConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bEnableGamepadRightShoulderAnim' from a null 'FSkillBtnConfig' DataObject!");
        }
        FSkillBtnConfig local_240;
        return local_240.bEnableGamepadRightShoulderAnim;
    }
    return local_1;
}
UFUNCTION()
bool __FSkillBtnConfig_GetbRebuildSkillResourceWidgetOnExit(const TDataObjectPtr<FSkillBtnConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bRebuildSkillResourceWidgetOnExit' from a null 'FSkillBtnConfig' DataObject!");
        }
        FSkillBtnConfig local_240;
        return local_240.bRebuildSkillResourceWidgetOnExit;
    }
    return local_1;
}
UFUNCTION()
TArray<FName> __FSkillBtnConfig_GetBanInputNames(const TDataObjectPtr<FSkillBtnConfig> &inout DataObject)
{
    TArray<FName> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BanInputNames' from a null 'FSkillBtnConfig' DataObject!");
        }
        FSkillBtnConfig local_240;
        return local_240.BanInputNames;
    }
    return __r;
}
UFUNCTION()
TSoftClassPtr<UEUIUserWidget> __FSkillBtnConfig_GetExclusiveSkillWidget(const TDataObjectPtr<FSkillBtnConfig> &inout DataObject)
{
    TSoftClassPtr<UEUIUserWidget> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExclusiveSkillWidget' from a null 'FSkillBtnConfig' DataObject!");
        }
        FSkillBtnConfig local_240;
        return local_240.ExclusiveSkillWidget;
    }
    return __r;
}
UFUNCTION()
TSubclassOf<UExclusiveSkillModelAdapterBase> __FSkillBtnConfig_GetExclusiveSkillModelAdapter(const TDataObjectPtr<FSkillBtnConfig> &inout DataObject)
{
    TSubclassOf<UExclusiveSkillModelAdapterBase> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExclusiveSkillModelAdapter' from a null 'FSkillBtnConfig' DataObject!");
        }
        FSkillBtnConfig local_240;
        return local_240.ExclusiveSkillModelAdapter;
    }
    return __r;
}
UFUNCTION()
bool __FSkillBtnConfig_GetbHasUltraSkill(const TDataObjectPtr<FSkillBtnConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bHasUltraSkill' from a null 'FSkillBtnConfig' DataObject!");
        }
        FSkillBtnConfig local_240;
        return local_240.bHasUltraSkill;
    }
    return local_1;
}
UFUNCTION()
FNormalSkillBtnConfig __FSkillBtnConfig_GetUltraSkillBtnConfig(const TDataObjectPtr<FSkillBtnConfig> &inout DataObject)
{
    FNormalSkillBtnConfig __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UltraSkillBtnConfig' from a null 'FSkillBtnConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
bool __FSkillBtnConfig_GetbHasSpecialAttack(const TDataObjectPtr<FSkillBtnConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bHasSpecialAttack' from a null 'FSkillBtnConfig' DataObject!");
        }
        FSkillBtnConfig local_240;
        return local_240.bHasSpecialAttack;
    }
    return local_1;
}
UFUNCTION()
FNormalSkillBtnConfig __FSkillBtnConfig_GetSpecialAttackSkillBtnConfig(const TDataObjectPtr<FSkillBtnConfig> &inout DataObject)
{
    FNormalSkillBtnConfig __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SpecialAttackSkillBtnConfig' from a null 'FSkillBtnConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
bool __FSkillBtnConfig_GetbHasSimpleSkill1(const TDataObjectPtr<FSkillBtnConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bHasSimpleSkill1' from a null 'FSkillBtnConfig' DataObject!");
        }
        FSkillBtnConfig local_240;
        return local_240.bHasSimpleSkill1;
    }
    return local_1;
}
UFUNCTION()
FNormalSkillBtnConfig __FSkillBtnConfig_GetSimpleSkill1BtnConfig(const TDataObjectPtr<FSkillBtnConfig> &inout DataObject)
{
    FNormalSkillBtnConfig __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SimpleSkill1BtnConfig' from a null 'FSkillBtnConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
bool __FSkillBtnConfig_GetbHasSimpleSkill2(const TDataObjectPtr<FSkillBtnConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bHasSimpleSkill2' from a null 'FSkillBtnConfig' DataObject!");
        }
        FSkillBtnConfig local_240;
        return local_240.bHasSimpleSkill2;
    }
    return local_1;
}
UFUNCTION()
FNormalSkillBtnConfig __FSkillBtnConfig_GetSimpleSkill2BtnConfig(const TDataObjectPtr<FSkillBtnConfig> &inout DataObject)
{
    FNormalSkillBtnConfig __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SimpleSkill2BtnConfig' from a null 'FSkillBtnConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
bool __FSkillBtnConfig_GetbHasSimpleSkill3(const TDataObjectPtr<FSkillBtnConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bHasSimpleSkill3' from a null 'FSkillBtnConfig' DataObject!");
        }
        FSkillBtnConfig local_240;
        return local_240.bHasSimpleSkill3;
    }
    return local_1;
}
UFUNCTION()
FNormalSkillBtnConfig __FSkillBtnConfig_GetSimpleSkill3BtnConfig(const TDataObjectPtr<FSkillBtnConfig> &inout DataObject)
{
    FNormalSkillBtnConfig __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SimpleSkill3BtnConfig' from a null 'FSkillBtnConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
bool __FSkillBtnConfig_GetbHasDivineSkill(const TDataObjectPtr<FSkillBtnConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bHasDivineSkill' from a null 'FSkillBtnConfig' DataObject!");
        }
        FSkillBtnConfig local_240;
        return local_240.bHasDivineSkill;
    }
    return local_1;
}
UFUNCTION()
FNormalSkillBtnConfig __FSkillBtnConfig_GetDivineSkillBtnConfig(const TDataObjectPtr<FSkillBtnConfig> &inout DataObject)
{
    FNormalSkillBtnConfig __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DivineSkillBtnConfig' from a null 'FSkillBtnConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
FSkillBtnConfig CastToFSkillBtnConfig(const TDataObjectPtr<FSkillBtnConfig> &inout DataObject)
{
    FSkillBtnConfig __r;
    return __r;
}
}
namespace __FAddTemporarySkillConfigFunctions
{
UFUNCTION()
USkillConfig __FAddTemporarySkillConfig_GetSkillConfig(const TDataObjectPtr<FAddTemporarySkillConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SkillConfig' from a null 'FAddTemporarySkillConfig' DataObject!");
        }
        FAddTemporarySkillConfig local_42;
        return local_42.SkillConfig;
    }
    USkillConfig local_44;
    return local_44;
}
UFUNCTION()
int __FAddTemporarySkillConfig_GetMaxUsableTime(const TDataObjectPtr<FAddTemporarySkillConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaxUsableTime' from a null 'FAddTemporarySkillConfig' DataObject!");
        }
        FAddTemporarySkillConfig defaultValue;
        return defaultValue.MaxUsableTime;
    }
    return DataObject.Get().MaxUsableTime;
}
UFUNCTION()
TDataObjectPtr<FMessageHintConfig_LargeHint> __FAddTemporarySkillConfig_GetHint(const TDataObjectPtr<FAddTemporarySkillConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Hint' from a null 'FAddTemporarySkillConfig' DataObject!");
        }
        FAddTemporarySkillConfig local_42;
        return local_42.GetHint();
    }
    return GetHint();
}
UFUNCTION()
FAddTemporarySkillConfig CastToFAddTemporarySkillConfig(const TDataObjectPtr<FAddTemporarySkillConfig> &inout DataObject)
{
    FAddTemporarySkillConfig __r;
    return __r;
}
}
namespace __FSkillInitConfigFunctions
{
UFUNCTION()
USkillConfig __FSkillInitConfig_GetSkillConfig(const TDataObjectPtr<FSkillInitConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SkillConfig' from a null 'FSkillInitConfig' DataObject!");
        }
        FSkillInitConfig local_128;
        return local_128.SkillConfig;
    }
    USkillConfig local_130;
    return local_130;
}
UFUNCTION()
FText __FSkillInitConfig_GetName(const TDataObjectPtr<FSkillInitConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Name' from a null 'FSkillInitConfig' DataObject!");
        }
        FSkillInitConfig local_128;
        return local_128.Name;
    }
    return __r;
}
UFUNCTION()
FText __FSkillInitConfig_GetTypeDesc(const TDataObjectPtr<FSkillInitConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TypeDesc' from a null 'FSkillInitConfig' DataObject!");
        }
        FSkillInitConfig local_128;
        return local_128.TypeDesc;
    }
    return __r;
}
UFUNCTION()
ESkillType __FSkillInitConfig_GetSkillType(const TDataObjectPtr<FSkillInitConfig> &inout DataObject)
{
    int local_129 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SkillType' from a null 'FSkillInitConfig' DataObject!");
        }
        FSkillInitConfig local_128;
        local_129 = int(local_128.SkillType);
        return ESkillType(local_129);
    }
    return ESkillType(local_129);
}
UFUNCTION()
bool __FSkillInitConfig_GetbIsDefault(const TDataObjectPtr<FSkillInitConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bIsDefault' from a null 'FSkillInitConfig' DataObject!");
        }
        FSkillInitConfig local_128;
        return local_128.bIsDefault;
    }
    return local_1;
}
UFUNCTION()
ESkillSlot __FSkillInitConfig_GetDefaultSkillSlot(const TDataObjectPtr<FSkillInitConfig> &inout DataObject)
{
    int local_129 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultSkillSlot' from a null 'FSkillInitConfig' DataObject!");
        }
        FSkillInitConfig local_128;
        local_129 = int(local_128.DefaultSkillSlot);
        return ESkillSlot(local_129);
    }
    return ESkillSlot(local_129);
}
UFUNCTION()
FSoftBrush __FSkillInitConfig_GetIcon(const TDataObjectPtr<FSkillInitConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Icon' from a null 'FSkillInitConfig' DataObject!");
        }
        FSkillInitConfig local_128;
        return local_128.Icon;
    }
    return __r;
}
UFUNCTION()
FText __FSkillInitConfig_GetDescription(const TDataObjectPtr<FSkillInitConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Description' from a null 'FSkillInitConfig' DataObject!");
        }
        FSkillInitConfig local_128;
        return local_128.Description;
    }
    return __r;
}
UFUNCTION()
UMediaSource __FSkillInitConfig_GetPreviewMovie(const TDataObjectPtr<FSkillInitConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PreviewMovie' from a null 'FSkillInitConfig' DataObject!");
        }
        FSkillInitConfig local_128;
        return local_128.PreviewMovie;
    }
    UMediaSource local_130;
    return local_130;
}
UFUNCTION()
FSoftBrush __FSkillInitConfig_GetPreviewPicture(const TDataObjectPtr<FSkillInitConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PreviewPicture' from a null 'FSkillInitConfig' DataObject!");
        }
        FSkillInitConfig local_128;
        return local_128.PreviewPicture;
    }
    return __r;
}
UFUNCTION()
FSkillInitConfig CastToFSkillInitConfig(const TDataObjectPtr<FSkillInitConfig> &inout DataObject)
{
    FSkillInitConfig __r;
    return __r;
}
}
namespace __FAvatarSkillConfigFunctions
{
UFUNCTION()
TArray<FAvatarSkillSlotConfig> __FAvatarSkillConfig_GetSkillInitConfigs(const TDataObjectPtr<FAvatarSkillConfig> &inout DataObject)
{
    TArray<FAvatarSkillSlotConfig> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SkillInitConfigs' from a null 'FAvatarSkillConfig' DataObject!");
        }
        FAvatarSkillConfig local_20;
        return local_20.SkillInitConfigs;
    }
    return __r;
}
UFUNCTION()
FAvatarSkillConfig CastToFAvatarSkillConfig(const TDataObjectPtr<FAvatarSkillConfig> &inout DataObject)
{
    FAvatarSkillConfig __r;
    return __r;
}
}
namespace __FSkillEffectNounsConfigFunctions
{
UFUNCTION()
FText __FSkillEffectNounsConfig_GetName(const TDataObjectPtr<FSkillEffectNounsConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Name' from a null 'FSkillEffectNounsConfig' DataObject!");
        }
        FSkillEffectNounsConfig local_22;
        return local_22.Name;
    }
    return __r;
}
UFUNCTION()
FText __FSkillEffectNounsConfig_GetDescription(const TDataObjectPtr<FSkillEffectNounsConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Description' from a null 'FSkillEffectNounsConfig' DataObject!");
        }
        FSkillEffectNounsConfig local_22;
        return local_22.Description;
    }
    return __r;
}
UFUNCTION()
FSkillEffectNounsConfig CastToFSkillEffectNounsConfig(const TDataObjectPtr<FSkillEffectNounsConfig> &inout DataObject)
{
    FSkillEffectNounsConfig __r;
    return __r;
}
}
namespace __FSkillPresentationOverrideConfigFunctions
{
UFUNCTION()
int __FSkillPresentationOverrideConfig_GetPriority(const TDataObjectPtr<FSkillPresentationOverrideConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Priority' from a null 'FSkillPresentationOverrideConfig' DataObject!");
        }
        FSkillPresentationOverrideConfig defaultValue;
        return defaultValue.Priority;
    }
    return DataObject.Get().Priority;
}
UFUNCTION()
bool __FSkillPresentationOverrideConfig_GetbEnableChangeSkillPanel(const TDataObjectPtr<FSkillPresentationOverrideConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bEnableChangeSkillPanel' from a null 'FSkillPresentationOverrideConfig' DataObject!");
        }
        FSkillPresentationOverrideConfig local_48;
        return local_48.bEnableChangeSkillPanel;
    }
    return local_1;
}
UFUNCTION()
TDataObjectPtr<FSkillBtnConfig> __FSkillPresentationOverrideConfig_GetSkillBtnConfig(const TDataObjectPtr<FSkillPresentationOverrideConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SkillBtnConfig' from a null 'FSkillPresentationOverrideConfig' DataObject!");
        }
        FSkillPresentationOverrideConfig local_48;
        return local_48.GetSkillBtnConfig();
    }
    return GetSkillBtnConfig();
}
UFUNCTION()
bool __FSkillPresentationOverrideConfig_GetbEnableReplaceSkill(const TDataObjectPtr<FSkillPresentationOverrideConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bEnableReplaceSkill' from a null 'FSkillPresentationOverrideConfig' DataObject!");
        }
        FSkillPresentationOverrideConfig local_48;
        return local_48.bEnableReplaceSkill;
    }
    return local_1;
}
UFUNCTION()
TArray<FSkillReplaceEntry> __FSkillPresentationOverrideConfig_GetReplaceSkills(const TDataObjectPtr<FSkillPresentationOverrideConfig> &inout DataObject)
{
    TArray<FSkillReplaceEntry> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ReplaceSkills' from a null 'FSkillPresentationOverrideConfig' DataObject!");
        }
        FSkillPresentationOverrideConfig local_48;
        return local_48.ReplaceSkills;
    }
    return __r;
}
UFUNCTION()
FSkillPresentationOverrideConfig CastToFSkillPresentationOverrideConfig(const TDataObjectPtr<FSkillPresentationOverrideConfig> &inout DataObject)
{
    FSkillPresentationOverrideConfig __r;
    return __r;
}
}

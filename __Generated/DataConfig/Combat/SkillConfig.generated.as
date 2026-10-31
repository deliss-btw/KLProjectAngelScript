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
    return DataObject.Get().GetAvatarMapping();
}
UFUNCTION()
FName __FSkillBtnConfig_GetAvatarName(const TDataObjectPtr<FSkillBtnConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AvatarName' from a null 'FSkillBtnConfig' DataObject!");
        }
        FSkillBtnConfig local_240;
        return local_240.AvatarName;
    }
    return DataObject.Get().AvatarName;
}
UFUNCTION()
bool __FSkillBtnConfig_GetbEnableExclusiveSkill(const TDataObjectPtr<FSkillBtnConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bEnableExclusiveSkill' from a null 'FSkillBtnConfig' DataObject!");
        }
        FSkillBtnConfig local_240;
        return local_240.bEnableExclusiveSkill;
    }
    return DataObject.Get().bEnableExclusiveSkill;
}
UFUNCTION()
bool __FSkillBtnConfig_GetbEnableGamepadRightShoulderAnim(const TDataObjectPtr<FSkillBtnConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bEnableGamepadRightShoulderAnim' from a null 'FSkillBtnConfig' DataObject!");
        }
        FSkillBtnConfig local_240;
        return local_240.bEnableGamepadRightShoulderAnim;
    }
    return DataObject.Get().bEnableGamepadRightShoulderAnim;
}
UFUNCTION()
bool __FSkillBtnConfig_GetbRebuildSkillResourceWidgetOnExit(const TDataObjectPtr<FSkillBtnConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bRebuildSkillResourceWidgetOnExit' from a null 'FSkillBtnConfig' DataObject!");
        }
        FSkillBtnConfig local_240;
        return local_240.bRebuildSkillResourceWidgetOnExit;
    }
    return DataObject.Get().bRebuildSkillResourceWidgetOnExit;
}
UFUNCTION()
TArray<FName> __FSkillBtnConfig_GetBanInputNames(const TDataObjectPtr<FSkillBtnConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BanInputNames' from a null 'FSkillBtnConfig' DataObject!");
        }
        FSkillBtnConfig local_240;
        return local_240.BanInputNames;
    }
    return DataObject.Get().BanInputNames;
}
UFUNCTION()
TSoftClassPtr<UEUIUserWidget> __FSkillBtnConfig_GetExclusiveSkillWidget(const TDataObjectPtr<FSkillBtnConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExclusiveSkillWidget' from a null 'FSkillBtnConfig' DataObject!");
        }
        FSkillBtnConfig local_240;
        return local_240.ExclusiveSkillWidget;
    }
    return DataObject.Get().ExclusiveSkillWidget;
}
UFUNCTION()
TSubclassOf<UExclusiveSkillModelAdapterBase> __FSkillBtnConfig_GetExclusiveSkillModelAdapter(const TDataObjectPtr<FSkillBtnConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExclusiveSkillModelAdapter' from a null 'FSkillBtnConfig' DataObject!");
        }
        FSkillBtnConfig local_240;
        return local_240.ExclusiveSkillModelAdapter;
    }
    return DataObject.Get().ExclusiveSkillModelAdapter;
}
UFUNCTION()
bool __FSkillBtnConfig_GetbHasUltraSkill(const TDataObjectPtr<FSkillBtnConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bHasUltraSkill' from a null 'FSkillBtnConfig' DataObject!");
        }
        FSkillBtnConfig local_240;
        return local_240.bHasUltraSkill;
    }
    return DataObject.Get().bHasUltraSkill;
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bHasSpecialAttack' from a null 'FSkillBtnConfig' DataObject!");
        }
        FSkillBtnConfig local_240;
        return local_240.bHasSpecialAttack;
    }
    return DataObject.Get().bHasSpecialAttack;
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bHasSimpleSkill1' from a null 'FSkillBtnConfig' DataObject!");
        }
        FSkillBtnConfig local_240;
        return local_240.bHasSimpleSkill1;
    }
    return DataObject.Get().bHasSimpleSkill1;
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bHasSimpleSkill2' from a null 'FSkillBtnConfig' DataObject!");
        }
        FSkillBtnConfig local_240;
        return local_240.bHasSimpleSkill2;
    }
    return DataObject.Get().bHasSimpleSkill2;
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bHasSimpleSkill3' from a null 'FSkillBtnConfig' DataObject!");
        }
        FSkillBtnConfig local_240;
        return local_240.bHasSimpleSkill3;
    }
    return DataObject.Get().bHasSimpleSkill3;
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bHasDivineSkill' from a null 'FSkillBtnConfig' DataObject!");
        }
        FSkillBtnConfig local_240;
        return local_240.bHasDivineSkill;
    }
    return DataObject.Get().bHasDivineSkill;
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
    return DataObject.Get().GetHint();
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Name' from a null 'FSkillInitConfig' DataObject!");
        }
        FSkillInitConfig local_128;
        return local_128.Name;
    }
    return DataObject.Get().Name;
}
UFUNCTION()
FText __FSkillInitConfig_GetTypeDesc(const TDataObjectPtr<FSkillInitConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TypeDesc' from a null 'FSkillInitConfig' DataObject!");
        }
        FSkillInitConfig local_128;
        return local_128.TypeDesc;
    }
    return DataObject.Get().TypeDesc;
}
UFUNCTION()
ESkillType __FSkillInitConfig_GetSkillType(const TDataObjectPtr<FSkillInitConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SkillType' from a null 'FSkillInitConfig' DataObject!");
        }
        FSkillInitConfig local_128;
        return local_128.SkillType;
    }
    return DataObject.Get().SkillType;
}
UFUNCTION()
bool __FSkillInitConfig_GetbIsDefault(const TDataObjectPtr<FSkillInitConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bIsDefault' from a null 'FSkillInitConfig' DataObject!");
        }
        FSkillInitConfig local_128;
        return local_128.bIsDefault;
    }
    return DataObject.Get().bIsDefault;
}
UFUNCTION()
ESkillSlot __FSkillInitConfig_GetDefaultSkillSlot(const TDataObjectPtr<FSkillInitConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultSkillSlot' from a null 'FSkillInitConfig' DataObject!");
        }
        FSkillInitConfig local_128;
        return local_128.DefaultSkillSlot;
    }
    return DataObject.Get().DefaultSkillSlot;
}
UFUNCTION()
FSoftBrush __FSkillInitConfig_GetIcon(const TDataObjectPtr<FSkillInitConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Icon' from a null 'FSkillInitConfig' DataObject!");
        }
        FSkillInitConfig local_128;
        return local_128.Icon;
    }
    return DataObject.Get().Icon;
}
UFUNCTION()
FText __FSkillInitConfig_GetDescription(const TDataObjectPtr<FSkillInitConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Description' from a null 'FSkillInitConfig' DataObject!");
        }
        FSkillInitConfig local_128;
        return local_128.Description;
    }
    return DataObject.Get().Description;
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PreviewPicture' from a null 'FSkillInitConfig' DataObject!");
        }
        FSkillInitConfig local_128;
        return local_128.PreviewPicture;
    }
    return DataObject.Get().PreviewPicture;
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SkillInitConfigs' from a null 'FAvatarSkillConfig' DataObject!");
        }
        FAvatarSkillConfig local_20;
        return local_20.SkillInitConfigs;
    }
    return DataObject.Get().SkillInitConfigs;
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Name' from a null 'FSkillEffectNounsConfig' DataObject!");
        }
        FSkillEffectNounsConfig local_22;
        return local_22.Name;
    }
    return DataObject.Get().Name;
}
UFUNCTION()
FText __FSkillEffectNounsConfig_GetDescription(const TDataObjectPtr<FSkillEffectNounsConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Description' from a null 'FSkillEffectNounsConfig' DataObject!");
        }
        FSkillEffectNounsConfig local_22;
        return local_22.Description;
    }
    return DataObject.Get().Description;
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bEnableChangeSkillPanel' from a null 'FSkillPresentationOverrideConfig' DataObject!");
        }
        FSkillPresentationOverrideConfig local_48;
        return local_48.bEnableChangeSkillPanel;
    }
    return DataObject.Get().bEnableChangeSkillPanel;
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
    return DataObject.Get().GetSkillBtnConfig();
}
UFUNCTION()
bool __FSkillPresentationOverrideConfig_GetbEnableReplaceSkill(const TDataObjectPtr<FSkillPresentationOverrideConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bEnableReplaceSkill' from a null 'FSkillPresentationOverrideConfig' DataObject!");
        }
        FSkillPresentationOverrideConfig local_48;
        return local_48.bEnableReplaceSkill;
    }
    return DataObject.Get().bEnableReplaceSkill;
}
UFUNCTION()
TArray<FSkillReplaceEntry> __FSkillPresentationOverrideConfig_GetReplaceSkills(const TDataObjectPtr<FSkillPresentationOverrideConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ReplaceSkills' from a null 'FSkillPresentationOverrideConfig' DataObject!");
        }
        FSkillPresentationOverrideConfig local_48;
        return local_48.ReplaceSkills;
    }
    return DataObject.Get().ReplaceSkills;
}
UFUNCTION()
FSkillPresentationOverrideConfig CastToFSkillPresentationOverrideConfig(const TDataObjectPtr<FSkillPresentationOverrideConfig> &inout DataObject)
{
    FSkillPresentationOverrideConfig __r;
    return __r;
}
}

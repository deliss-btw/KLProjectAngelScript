namespace __FTODStageConfigFunctions
{
UFUNCTION()
FText __FTODStageConfig_GetDisplayName(const TDataObjectPtr<FTODStageConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayName' from a null 'FTODStageConfig' DataObject!");
        }
        FTODStageConfig local_68;
        return local_68.DisplayName;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FTODStageConfig_GetDisplayIcon(const TDataObjectPtr<FTODStageConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayIcon' from a null 'FTODStageConfig' DataObject!");
        }
        FTODStageConfig local_68;
        return local_68.DisplayIcon;
    }
    return __r;
}
UFUNCTION()
FText __FTODStageConfig_GetDisplayHintText(const TDataObjectPtr<FTODStageConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayHintText' from a null 'FTODStageConfig' DataObject!");
        }
        FTODStageConfig local_68;
        return local_68.DisplayHintText;
    }
    return __r;
}
UFUNCTION()
FTODStageConfig CastToFTODStageConfig(const TDataObjectPtr<FTODStageConfig> &inout DataObject)
{
    FTODStageConfig __r;
    return __r;
}
}
namespace __FArtWeatherRegionConfigFunctions
{
UFUNCTION()
FArtWeatherConfig __FArtWeatherRegionConfig_GetDefaultArtWeather(const TDataObjectPtr<FArtWeatherRegionConfig> &inout DataObject)
{
    FArtWeatherConfig __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultArtWeather' from a null 'FArtWeatherRegionConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
TMap<TDataObjectPtr<FWorldAreaConfig>, FArtWeatherConfig> __FArtWeatherRegionConfig_GetArtWeatherByRegion(const TDataObjectPtr<FArtWeatherRegionConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ArtWeatherByRegion' from a null 'FArtWeatherRegionConfig' DataObject!");
        }
        FArtWeatherRegionConfig local_38;
        return local_38.GetArtWeatherByRegion();
    }
    return GetArtWeatherByRegion();
}
UFUNCTION()
FArtWeatherRegionConfig CastToFArtWeatherRegionConfig(const TDataObjectPtr<FArtWeatherRegionConfig> &inout DataObject)
{
    FArtWeatherRegionConfig __r;
    return __r;
}
}
namespace __FBadWeatherDropItemRateUpRuleFunctions
{
UFUNCTION()
float32 __FBadWeatherDropItemRateUpRule_GetExtraDropRateUpPercentage(const TDataObjectPtr<FBadWeatherDropItemRateUpRule> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExtraDropRateUpPercentage' from a null 'FBadWeatherDropItemRateUpRule' DataObject!");
        }
        FBadWeatherDropItemRateUpRule defaultValue;
        return defaultValue.ExtraDropRateUpPercentage;
    }
    return DataObject.Get().ExtraDropRateUpPercentage;
}
UFUNCTION()
int __FBadWeatherDropItemRateUpRule_GetExtraDropRateCountUp(const TDataObjectPtr<FBadWeatherDropItemRateUpRule> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExtraDropRateCountUp' from a null 'FBadWeatherDropItemRateUpRule' DataObject!");
        }
        FBadWeatherDropItemRateUpRule defaultValue;
        return defaultValue.ExtraDropRateCountUp;
    }
    return DataObject.Get().ExtraDropRateCountUp;
}
UFUNCTION()
float32 __FBadWeatherDropItemRateUpRule_GetBaseDropRateUpPercentage(const TDataObjectPtr<FBadWeatherDropItemRateUpRule> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BaseDropRateUpPercentage' from a null 'FBadWeatherDropItemRateUpRule' DataObject!");
        }
        FBadWeatherDropItemRateUpRule defaultValue;
        return defaultValue.BaseDropRateUpPercentage;
    }
    return DataObject.Get().BaseDropRateUpPercentage;
}
UFUNCTION()
TArray<TDataObjectPtr<FItemConfig>> __FBadWeatherDropItemRateUpRule_GetBaseDropItems(const TDataObjectPtr<FBadWeatherDropItemRateUpRule> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BaseDropItems' from a null 'FBadWeatherDropItemRateUpRule' DataObject!");
        }
        FBadWeatherDropItemRateUpRule local_22;
        return local_22.GetBaseDropItems();
    }
    return GetBaseDropItems();
}
UFUNCTION()
FBadWeatherDropItemRateUpRule CastToFBadWeatherDropItemRateUpRule(const TDataObjectPtr<FBadWeatherDropItemRateUpRule> &inout DataObject)
{
    FBadWeatherDropItemRateUpRule __r;
    return __r;
}
}
namespace __FWeatherConfigFunctions
{
UFUNCTION()
TSoftClassPtr<AECSPrefab> __FWeatherConfig_GetPrefab(const TDataObjectPtr<FWeatherConfig> &inout DataObject)
{
    TSoftClassPtr<AECSPrefab> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Prefab' from a null 'FWeatherConfig' DataObject!");
        }
        FWeatherConfig local_276;
        return local_276.Prefab;
    }
    return __r;
}
UFUNCTION()
TSoftClassPtr<UEASAbility> __FWeatherConfig_GetAbility(const TDataObjectPtr<FWeatherConfig> &inout DataObject)
{
    TSoftClassPtr<UEASAbility> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Ability' from a null 'FWeatherConfig' DataObject!");
        }
        FWeatherConfig local_276;
        return local_276.Ability;
    }
    return __r;
}
UFUNCTION()
FBuffConfigRef __FWeatherConfig_GetBuffConfig(const TDataObjectPtr<FWeatherConfig> &inout DataObject)
{
    FBuffConfigRef __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BuffConfig' from a null 'FWeatherConfig' DataObject!");
        }
        FWeatherConfig local_276;
        return local_276.BuffConfig;
    }
    return __r;
}
UFUNCTION()
TDataObjectPtr<FMessageHintConfig> __FWeatherConfig_GetBuffMessageHintConfig(const TDataObjectPtr<FWeatherConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BuffMessageHintConfig' from a null 'FWeatherConfig' DataObject!");
        }
        FWeatherConfig local_276;
        return local_276.GetBuffMessageHintConfig();
    }
    return GetBuffMessageHintConfig();
}
UFUNCTION()
float32 __FWeatherConfig_GetBuffConfigAddDelay(const TDataObjectPtr<FWeatherConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BuffConfigAddDelay' from a null 'FWeatherConfig' DataObject!");
        }
        FWeatherConfig defaultValue;
        return defaultValue.BuffConfigAddDelay;
    }
    return DataObject.Get().BuffConfigAddDelay;
}
UFUNCTION()
FText __FWeatherConfig_GetDisplayName(const TDataObjectPtr<FWeatherConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayName' from a null 'FWeatherConfig' DataObject!");
        }
        FWeatherConfig local_276;
        return local_276.DisplayName;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FWeatherConfig_GetDisplayIcon(const TDataObjectPtr<FWeatherConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayIcon' from a null 'FWeatherConfig' DataObject!");
        }
        FWeatherConfig local_276;
        return local_276.DisplayIcon;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FWeatherConfig_GetLargeIcon(const TDataObjectPtr<FWeatherConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LargeIcon' from a null 'FWeatherConfig' DataObject!");
        }
        FWeatherConfig local_276;
        return local_276.LargeIcon;
    }
    return __r;
}
UFUNCTION()
FText __FWeatherConfig_GetDisplayHintContent(const TDataObjectPtr<FWeatherConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayHintContent' from a null 'FWeatherConfig' DataObject!");
        }
        FWeatherConfig local_276;
        return local_276.DisplayHintContent;
    }
    return __r;
}
UFUNCTION()
FText __FWeatherConfig_GetWeatherAbilityDescription(const TDataObjectPtr<FWeatherConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeatherAbilityDescription' from a null 'FWeatherConfig' DataObject!");
        }
        FWeatherConfig local_276;
        return local_276.WeatherAbilityDescription;
    }
    return __r;
}
UFUNCTION()
FText __FWeatherConfig_GetWeatherChangeText(const TDataObjectPtr<FWeatherConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeatherChangeText' from a null 'FWeatherConfig' DataObject!");
        }
        FWeatherConfig local_276;
        return local_276.WeatherChangeText;
    }
    return __r;
}
UFUNCTION()
bool __FWeatherConfig_GetbBadWeather(const TDataObjectPtr<FWeatherConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bBadWeather' from a null 'FWeatherConfig' DataObject!");
        }
        FWeatherConfig local_276;
        return local_276.bBadWeather;
    }
    return local_1;
}
UFUNCTION()
bool __FWeatherConfig_GetbCommissionRewardUp(const TDataObjectPtr<FWeatherConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bCommissionRewardUp' from a null 'FWeatherConfig' DataObject!");
        }
        FWeatherConfig local_276;
        return local_276.bCommissionRewardUp;
    }
    return local_1;
}
UFUNCTION()
TDataObjectPtr<FBadWeatherDropItemRateUpRule> __FWeatherConfig_GetBadWeatherUpRule(const TDataObjectPtr<FWeatherConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BadWeatherUpRule' from a null 'FWeatherConfig' DataObject!");
        }
        FWeatherConfig local_276;
        return local_276.GetBadWeatherUpRule();
    }
    return GetBadWeatherUpRule();
}
UFUNCTION()
TMap<EGlobalEnvEffectWeatherType, FGlobalEnvEffectWeatherConfig> __FWeatherConfig_GetWeatherEffect(const TDataObjectPtr<FWeatherConfig> &inout DataObject)
{
    TMap<EGlobalEnvEffectWeatherType, FGlobalEnvEffectWeatherConfig> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeatherEffect' from a null 'FWeatherConfig' DataObject!");
        }
        FWeatherConfig local_276;
        return local_276.WeatherEffect;
    }
    return __r;
}
UFUNCTION()
FGameplayTagContainer __FWeatherConfig_GetWeatherElements(const TDataObjectPtr<FWeatherConfig> &inout DataObject)
{
    FGameplayTagContainer __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeatherElements' from a null 'FWeatherConfig' DataObject!");
        }
        FWeatherConfig local_276;
        return local_276.WeatherElements;
    }
    return __r;
}
UFUNCTION()
TDataObjectPtr<FArtWeatherRegionConfig> __FWeatherConfig_GetArtWeatherConfig(const TDataObjectPtr<FWeatherConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ArtWeatherConfig' from a null 'FWeatherConfig' DataObject!");
        }
        FWeatherConfig local_276;
        return local_276.GetArtWeatherConfig();
    }
    return GetArtWeatherConfig();
}
UFUNCTION()
FWeatherConfig CastToFWeatherConfig(const TDataObjectPtr<FWeatherConfig> &inout DataObject)
{
    FWeatherConfig __r;
    return __r;
}
}
namespace __FWeatherGenerateTemplateFunctions
{
UFUNCTION()
TArray<FWeatherChanceConfig> __FWeatherGenerateTemplate_GetWeatherChances(const TDataObjectPtr<FWeatherGenerateTemplate> &inout DataObject)
{
    TArray<FWeatherChanceConfig> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeatherChances' from a null 'FWeatherGenerateTemplate' DataObject!");
        }
        FWeatherGenerateTemplate local_20;
        return local_20.WeatherChances;
    }
    return __r;
}
UFUNCTION()
FWeatherGenerateTemplate CastToFWeatherGenerateTemplate(const TDataObjectPtr<FWeatherGenerateTemplate> &inout DataObject)
{
    FWeatherGenerateTemplate __r;
    return __r;
}
}
namespace __FAreaWeatherTemplateConfigFunctions
{
UFUNCTION()
TMap<TDataObjectPtr<FWorldAreaConfig>, FWeatherGenerateTemplateWrapper> __FAreaWeatherTemplateConfig_GetWeatherTemplateByRegion(const TDataObjectPtr<FAreaWeatherTemplateConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeatherTemplateByRegion' from a null 'FAreaWeatherTemplateConfig' DataObject!");
        }
        FAreaWeatherTemplateConfig local_34;
        return local_34.GetWeatherTemplateByRegion();
    }
    return GetWeatherTemplateByRegion();
}
UFUNCTION()
FAreaWeatherTemplateConfig CastToFAreaWeatherTemplateConfig(const TDataObjectPtr<FAreaWeatherTemplateConfig> &inout DataObject)
{
    FAreaWeatherTemplateConfig __r;
    return __r;
}
}

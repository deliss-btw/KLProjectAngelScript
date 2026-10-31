namespace __FTODStageConfigFunctions
{
UFUNCTION()
FText __FTODStageConfig_GetDisplayName(const TDataObjectPtr<FTODStageConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayName' from a null 'FTODStageConfig' DataObject!");
        }
        FTODStageConfig local_68;
        return local_68.DisplayName;
    }
    return DataObject.Get().DisplayName;
}
UFUNCTION()
FSoftBrush __FTODStageConfig_GetDisplayIcon(const TDataObjectPtr<FTODStageConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayIcon' from a null 'FTODStageConfig' DataObject!");
        }
        FTODStageConfig local_68;
        return local_68.DisplayIcon;
    }
    return DataObject.Get().DisplayIcon;
}
UFUNCTION()
FText __FTODStageConfig_GetDisplayHintText(const TDataObjectPtr<FTODStageConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayHintText' from a null 'FTODStageConfig' DataObject!");
        }
        FTODStageConfig local_68;
        return local_68.DisplayHintText;
    }
    return DataObject.Get().DisplayHintText;
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
    return DataObject.Get().GetArtWeatherByRegion();
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
    return DataObject.Get().GetBaseDropItems();
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Prefab' from a null 'FWeatherConfig' DataObject!");
        }
        FWeatherConfig local_276;
        return local_276.Prefab;
    }
    return DataObject.Get().Prefab;
}
UFUNCTION()
TSoftClassPtr<UEASAbility> __FWeatherConfig_GetAbility(const TDataObjectPtr<FWeatherConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Ability' from a null 'FWeatherConfig' DataObject!");
        }
        FWeatherConfig local_276;
        return local_276.Ability;
    }
    return DataObject.Get().Ability;
}
UFUNCTION()
FBuffConfigRef __FWeatherConfig_GetBuffConfig(const TDataObjectPtr<FWeatherConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BuffConfig' from a null 'FWeatherConfig' DataObject!");
        }
        FWeatherConfig local_276;
        return local_276.BuffConfig;
    }
    return DataObject.Get().BuffConfig;
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
    return DataObject.Get().GetBuffMessageHintConfig();
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayName' from a null 'FWeatherConfig' DataObject!");
        }
        FWeatherConfig local_276;
        return local_276.DisplayName;
    }
    return DataObject.Get().DisplayName;
}
UFUNCTION()
FSoftBrush __FWeatherConfig_GetDisplayIcon(const TDataObjectPtr<FWeatherConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayIcon' from a null 'FWeatherConfig' DataObject!");
        }
        FWeatherConfig local_276;
        return local_276.DisplayIcon;
    }
    return DataObject.Get().DisplayIcon;
}
UFUNCTION()
FSoftBrush __FWeatherConfig_GetLargeIcon(const TDataObjectPtr<FWeatherConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LargeIcon' from a null 'FWeatherConfig' DataObject!");
        }
        FWeatherConfig local_276;
        return local_276.LargeIcon;
    }
    return DataObject.Get().LargeIcon;
}
UFUNCTION()
FText __FWeatherConfig_GetDisplayHintContent(const TDataObjectPtr<FWeatherConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayHintContent' from a null 'FWeatherConfig' DataObject!");
        }
        FWeatherConfig local_276;
        return local_276.DisplayHintContent;
    }
    return DataObject.Get().DisplayHintContent;
}
UFUNCTION()
FText __FWeatherConfig_GetWeatherAbilityDescription(const TDataObjectPtr<FWeatherConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeatherAbilityDescription' from a null 'FWeatherConfig' DataObject!");
        }
        FWeatherConfig local_276;
        return local_276.WeatherAbilityDescription;
    }
    return DataObject.Get().WeatherAbilityDescription;
}
UFUNCTION()
FText __FWeatherConfig_GetWeatherChangeText(const TDataObjectPtr<FWeatherConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeatherChangeText' from a null 'FWeatherConfig' DataObject!");
        }
        FWeatherConfig local_276;
        return local_276.WeatherChangeText;
    }
    return DataObject.Get().WeatherChangeText;
}
UFUNCTION()
bool __FWeatherConfig_GetbBadWeather(const TDataObjectPtr<FWeatherConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bBadWeather' from a null 'FWeatherConfig' DataObject!");
        }
        FWeatherConfig local_276;
        return local_276.bBadWeather;
    }
    return DataObject.Get().bBadWeather;
}
UFUNCTION()
bool __FWeatherConfig_GetbCommissionRewardUp(const TDataObjectPtr<FWeatherConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bCommissionRewardUp' from a null 'FWeatherConfig' DataObject!");
        }
        FWeatherConfig local_276;
        return local_276.bCommissionRewardUp;
    }
    return DataObject.Get().bCommissionRewardUp;
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
    return DataObject.Get().GetBadWeatherUpRule();
}
UFUNCTION()
TMap<EGlobalEnvEffectWeatherType, FGlobalEnvEffectWeatherConfig> __FWeatherConfig_GetWeatherEffect(const TDataObjectPtr<FWeatherConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeatherEffect' from a null 'FWeatherConfig' DataObject!");
        }
        FWeatherConfig local_276;
        return local_276.WeatherEffect;
    }
    return DataObject.Get().WeatherEffect;
}
UFUNCTION()
FGameplayTagContainer __FWeatherConfig_GetWeatherElements(const TDataObjectPtr<FWeatherConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeatherElements' from a null 'FWeatherConfig' DataObject!");
        }
        FWeatherConfig local_276;
        return local_276.WeatherElements;
    }
    return DataObject.Get().WeatherElements;
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
    return DataObject.Get().GetArtWeatherConfig();
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeatherChances' from a null 'FWeatherGenerateTemplate' DataObject!");
        }
        FWeatherGenerateTemplate local_20;
        return local_20.WeatherChances;
    }
    return DataObject.Get().WeatherChances;
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
    return DataObject.Get().GetWeatherTemplateByRegion();
}
UFUNCTION()
FAreaWeatherTemplateConfig CastToFAreaWeatherTemplateConfig(const TDataObjectPtr<FAreaWeatherTemplateConfig> &inout DataObject)
{
    FAreaWeatherTemplateConfig __r;
    return __r;
}
}

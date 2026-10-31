namespace __FSpawnAreaPoolConfigFunctions
{
UFUNCTION()
FText __FSpawnAreaPoolConfig_GetDescription(const TDataObjectPtr<FSpawnAreaPoolConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Description' from a null 'FSpawnAreaPoolConfig' DataObject!");
        }
        FSpawnAreaPoolConfig local_24;
        return local_24.Description;
    }
    return DataObject.Get().Description;
}
UFUNCTION()
TArray<FSpawnAreaRandomFactor> __FSpawnAreaPoolConfig_GetTargetRandomPool(const TDataObjectPtr<FSpawnAreaPoolConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TargetRandomPool' from a null 'FSpawnAreaPoolConfig' DataObject!");
        }
        FSpawnAreaPoolConfig local_24;
        return local_24.TargetRandomPool;
    }
    return DataObject.Get().TargetRandomPool;
}
UFUNCTION()
FSpawnAreaPoolConfig CastToFSpawnAreaPoolConfig(const TDataObjectPtr<FSpawnAreaPoolConfig> &inout DataObject)
{
    FSpawnAreaPoolConfig __r;
    return __r;
}
}
namespace __FWeatherAreaTemplateFactorConfigFunctions
{
UFUNCTION()
TDataObjectPtr<FWorldAreaConfig> __FWeatherAreaTemplateFactorConfig_GetAreaConfig(const TDataObjectPtr<FWeatherAreaTemplateFactorConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AreaConfig' from a null 'FWeatherAreaTemplateFactorConfig' DataObject!");
        }
        FWeatherAreaTemplateFactorConfig local_44;
        return local_44.GetAreaConfig();
    }
    return DataObject.Get().GetAreaConfig();
}
UFUNCTION()
TArray<FWeatherTemplateRandomFactor> __FWeatherAreaTemplateFactorConfig_GetWeatherTemplateTargetRandomPool(const TDataObjectPtr<FWeatherAreaTemplateFactorConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeatherTemplateTargetRandomPool' from a null 'FWeatherAreaTemplateFactorConfig' DataObject!");
        }
        FWeatherAreaTemplateFactorConfig local_44;
        return local_44.WeatherTemplateTargetRandomPool;
    }
    return DataObject.Get().WeatherTemplateTargetRandomPool;
}
UFUNCTION()
FWeatherAreaTemplateFactorConfig CastToFWeatherAreaTemplateFactorConfig(const TDataObjectPtr<FWeatherAreaTemplateFactorConfig> &inout DataObject)
{
    FWeatherAreaTemplateFactorConfig __r;
    return __r;
}
}
namespace __FCommissionWeatherPoolConfigFunctions
{
UFUNCTION()
FText __FCommissionWeatherPoolConfig_GetDescription(const TDataObjectPtr<FCommissionWeatherPoolConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Description' from a null 'FCommissionWeatherPoolConfig' DataObject!");
        }
        FCommissionWeatherPoolConfig local_28;
        return local_28.Description;
    }
    return DataObject.Get().Description;
}
UFUNCTION()
TArray<FWeatherRandomFactor> __FCommissionWeatherPoolConfig_GetWeatherRandomPool(const TDataObjectPtr<FCommissionWeatherPoolConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeatherRandomPool' from a null 'FCommissionWeatherPoolConfig' DataObject!");
        }
        FCommissionWeatherPoolConfig local_28;
        return local_28.WeatherRandomPool;
    }
    return DataObject.Get().WeatherRandomPool;
}
UFUNCTION()
TArray<TDataObjectPtr<FWeatherAreaTemplateFactorConfig>> __FCommissionWeatherPoolConfig_GetWeatherAreaTemplateFactors(const TDataObjectPtr<FCommissionWeatherPoolConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeatherAreaTemplateFactors' from a null 'FCommissionWeatherPoolConfig' DataObject!");
        }
        FCommissionWeatherPoolConfig local_28;
        return local_28.GetWeatherAreaTemplateFactors();
    }
    return DataObject.Get().GetWeatherAreaTemplateFactors();
}
UFUNCTION()
FCommissionWeatherPoolConfig CastToFCommissionWeatherPoolConfig(const TDataObjectPtr<FCommissionWeatherPoolConfig> &inout DataObject)
{
    FCommissionWeatherPoolConfig __r;
    return __r;
}
}
namespace __FIntrusionPolicyPoolConfigFunctions
{
UFUNCTION()
FText __FIntrusionPolicyPoolConfig_GetDescription(const TDataObjectPtr<FIntrusionPolicyPoolConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Description' from a null 'FIntrusionPolicyPoolConfig' DataObject!");
        }
        FIntrusionPolicyPoolConfig local_24;
        return local_24.Description;
    }
    return DataObject.Get().Description;
}
UFUNCTION()
TArray<FIntrusionPolicyRandomFactor> __FIntrusionPolicyPoolConfig_GetTargetRandomPool(const TDataObjectPtr<FIntrusionPolicyPoolConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TargetRandomPool' from a null 'FIntrusionPolicyPoolConfig' DataObject!");
        }
        FIntrusionPolicyPoolConfig local_24;
        return local_24.TargetRandomPool;
    }
    return DataObject.Get().TargetRandomPool;
}
UFUNCTION()
FIntrusionPolicyPoolConfig CastToFIntrusionPolicyPoolConfig(const TDataObjectPtr<FIntrusionPolicyPoolConfig> &inout DataObject)
{
    FIntrusionPolicyPoolConfig __r;
    return __r;
}
}
namespace __FCommissionSubTargetPoolConfigFunctions
{
UFUNCTION()
FText __FCommissionSubTargetPoolConfig_GetDescription(const TDataObjectPtr<FCommissionSubTargetPoolConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Description' from a null 'FCommissionSubTargetPoolConfig' DataObject!");
        }
        FCommissionSubTargetPoolConfig local_24;
        return local_24.Description;
    }
    return DataObject.Get().Description;
}
UFUNCTION()
TArray<FCommissionSubTargetRandomFactor> __FCommissionSubTargetPoolConfig_GetTargetRandomPool(const TDataObjectPtr<FCommissionSubTargetPoolConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TargetRandomPool' from a null 'FCommissionSubTargetPoolConfig' DataObject!");
        }
        FCommissionSubTargetPoolConfig local_24;
        return local_24.TargetRandomPool;
    }
    return DataObject.Get().TargetRandomPool;
}
UFUNCTION()
FCommissionSubTargetPoolConfig CastToFCommissionSubTargetPoolConfig(const TDataObjectPtr<FCommissionSubTargetPoolConfig> &inout DataObject)
{
    FCommissionSubTargetPoolConfig __r;
    return __r;
}
}
namespace __FCommissionTimePoolConfigFunctions
{
UFUNCTION()
FText __FCommissionTimePoolConfig_GetDescription(const TDataObjectPtr<FCommissionTimePoolConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Description' from a null 'FCommissionTimePoolConfig' DataObject!");
        }
        FCommissionTimePoolConfig local_24;
        return local_24.Description;
    }
    return DataObject.Get().Description;
}
UFUNCTION()
TArray<FCommissionTimeRandomFactor> __FCommissionTimePoolConfig_GetTargetRandomPool(const TDataObjectPtr<FCommissionTimePoolConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TargetRandomPool' from a null 'FCommissionTimePoolConfig' DataObject!");
        }
        FCommissionTimePoolConfig local_24;
        return local_24.TargetRandomPool;
    }
    return DataObject.Get().TargetRandomPool;
}
UFUNCTION()
FCommissionTimePoolConfig CastToFCommissionTimePoolConfig(const TDataObjectPtr<FCommissionTimePoolConfig> &inout DataObject)
{
    FCommissionTimePoolConfig __r;
    return __r;
}
}
namespace __FCommissionEntryRulePoolConfigFunctions
{
UFUNCTION()
FText __FCommissionEntryRulePoolConfig_GetDescription(const TDataObjectPtr<FCommissionEntryRulePoolConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Description' from a null 'FCommissionEntryRulePoolConfig' DataObject!");
        }
        FCommissionEntryRulePoolConfig local_24;
        return local_24.Description;
    }
    return DataObject.Get().Description;
}
UFUNCTION()
TArray<FCommissionEntryRuleRandomFactor> __FCommissionEntryRulePoolConfig_GetTargetRandomPool(const TDataObjectPtr<FCommissionEntryRulePoolConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TargetRandomPool' from a null 'FCommissionEntryRulePoolConfig' DataObject!");
        }
        FCommissionEntryRulePoolConfig local_24;
        return local_24.TargetRandomPool;
    }
    return DataObject.Get().TargetRandomPool;
}
UFUNCTION()
FCommissionEntryRulePoolConfig CastToFCommissionEntryRulePoolConfig(const TDataObjectPtr<FCommissionEntryRulePoolConfig> &inout DataObject)
{
    FCommissionEntryRulePoolConfig __r;
    return __r;
}
}
namespace __FRandomPolicyConfigFunctions
{
UFUNCTION()
TArray<FRandomFactorConfig> __FRandomPolicyConfig_GetRandomFactorConfig(const TDataObjectPtr<FRandomPolicyConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RandomFactorConfig' from a null 'FRandomPolicyConfig' DataObject!");
        }
        FRandomPolicyConfig local_22;
        return local_22.RandomFactorConfig;
    }
    return DataObject.Get().RandomFactorConfig;
}
UFUNCTION()
FRandomPolicyConfig CastToFRandomPolicyConfig(const TDataObjectPtr<FRandomPolicyConfig> &inout DataObject)
{
    FRandomPolicyConfig __r;
    return __r;
}
}
namespace __FRandomSeedConfigFunctions
{
UFUNCTION()
FText __FRandomSeedConfig_GetRandomSeedName(const TDataObjectPtr<FRandomSeedConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RandomSeedName' from a null 'FRandomSeedConfig' DataObject!");
        }
        FRandomSeedConfig local_24;
        return local_24.RandomSeedName;
    }
    return DataObject.Get().RandomSeedName;
}
UFUNCTION()
TArray<TDataObjectPtr<FRandomPolicyConfig>> __FRandomSeedConfig_GetRandomPolicyConfig(const TDataObjectPtr<FRandomSeedConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RandomPolicyConfig' from a null 'FRandomSeedConfig' DataObject!");
        }
        FRandomSeedConfig local_24;
        return local_24.GetRandomPolicyConfig();
    }
    return DataObject.Get().GetRandomPolicyConfig();
}
UFUNCTION()
FRandomSeedConfig CastToFRandomSeedConfig(const TDataObjectPtr<FRandomSeedConfig> &inout DataObject)
{
    FRandomSeedConfig __r;
    return __r;
}
}
namespace __FRandomPolicyBlacklistConfigBaseFunctions
{
UFUNCTION()
FRandomPolicyBlacklistConfigBase CastToFRandomPolicyBlacklistConfigBase(const TDataObjectPtr<FRandomPolicyBlacklistConfigBase> &inout DataObject)
{
    FRandomPolicyBlacklistConfigBase __r;
    return __r;
}
}
namespace __FRandomPolicyBlacklistSingleConfigFunctions
{
UFUNCTION()
TArray<FRandomFactorBlacklistConfig> __FRandomPolicyBlacklistSingleConfig_GetRandomFactorBlacklistConfig(const TDataObjectPtr<FRandomPolicyBlacklistSingleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RandomFactorBlacklistConfig' from a null 'FRandomPolicyBlacklistSingleConfig' DataObject!");
        }
        FRandomPolicyBlacklistSingleConfig local_20;
        return local_20.RandomFactorBlacklistConfig;
    }
    return DataObject.Get().RandomFactorBlacklistConfig;
}
UFUNCTION()
FRandomPolicyBlacklistSingleConfig CastToFRandomPolicyBlacklistSingleConfig(const TDataObjectPtr<FRandomPolicyBlacklistSingleConfig> &inout DataObject)
{
    FRandomPolicyBlacklistSingleConfig __r;
    return __r;
}
}
namespace __FRandomPolicyBlacklistGroupConfigFunctions
{
UFUNCTION()
TArray<TDataObjectPtr<FRandomPolicyBlacklistSingleConfig>> __FRandomPolicyBlacklistGroupConfig_GetBlacklistSingleConfigs(const TDataObjectPtr<FRandomPolicyBlacklistGroupConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BlacklistSingleConfigs' from a null 'FRandomPolicyBlacklistGroupConfig' DataObject!");
        }
        FRandomPolicyBlacklistGroupConfig local_20;
        return local_20.GetBlacklistSingleConfigs();
    }
    return DataObject.Get().GetBlacklistSingleConfigs();
}
UFUNCTION()
FRandomPolicyBlacklistGroupConfig CastToFRandomPolicyBlacklistGroupConfig(const TDataObjectPtr<FRandomPolicyBlacklistGroupConfig> &inout DataObject)
{
    FRandomPolicyBlacklistGroupConfig __r;
    return __r;
}
}
namespace __FRandomConstraintConfigFunctions
{
UFUNCTION()
ECommissionType __FRandomConstraintConfig_GetCommissionType(const TDataObjectPtr<FRandomConstraintConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionType' from a null 'FRandomConstraintConfig' DataObject!");
        }
        FRandomConstraintConfig local_22;
        return local_22.CommissionType;
    }
    return DataObject.Get().CommissionType;
}
UFUNCTION()
ERandomFactorType __FRandomConstraintConfig_GetRandomFactorType(const TDataObjectPtr<FRandomConstraintConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RandomFactorType' from a null 'FRandomConstraintConfig' DataObject!");
        }
        FRandomConstraintConfig local_22;
        return local_22.RandomFactorType;
    }
    return DataObject.Get().RandomFactorType;
}
UFUNCTION()
TArray<TDataObjectPtr<FDataObject>> __FRandomConstraintConfig_GetRandomFactor(const TDataObjectPtr<FRandomConstraintConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RandomFactor' from a null 'FRandomConstraintConfig' DataObject!");
        }
        FRandomConstraintConfig local_22;
        return local_22.GetRandomFactor();
    }
    return DataObject.Get().GetRandomFactor();
}
UFUNCTION()
FRandomConstraintConfig CastToFRandomConstraintConfig(const TDataObjectPtr<FRandomConstraintConfig> &inout DataObject)
{
    FRandomConstraintConfig __r;
    return __r;
}
}
namespace __FRandomConstraintHardConfigFunctions
{
UFUNCTION()
FRandomConstraintHardConfig CastToFRandomConstraintHardConfig(const TDataObjectPtr<FRandomConstraintHardConfig> &inout DataObject)
{
    FRandomConstraintHardConfig __r;
    return __r;
}
}
namespace __FRandomConstraintExtremeConfigFunctions
{
UFUNCTION()
FRandomConstraintExtremeConfig CastToFRandomConstraintExtremeConfig(const TDataObjectPtr<FRandomConstraintExtremeConfig> &inout DataObject)
{
    FRandomConstraintExtremeConfig __r;
    return __r;
}
}

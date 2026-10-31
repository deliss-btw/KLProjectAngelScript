namespace __FSpecialDamageTextConfigFunctions
{
UFUNCTION()
float32 __FSpecialDamageTextConfig_GetFontScale(const TDataObjectPtr<FSpecialDamageTextConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FontScale' from a null 'FSpecialDamageTextConfig' DataObject!");
        }
        FSpecialDamageTextConfig defaultValue;
        return defaultValue.FontScale;
    }
    return DataObject.Get().FontScale;
}
UFUNCTION()
float32 __FSpecialDamageTextConfig_GetDuration(const TDataObjectPtr<FSpecialDamageTextConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Duration' from a null 'FSpecialDamageTextConfig' DataObject!");
        }
        FSpecialDamageTextConfig defaultValue;
        return defaultValue.Duration;
    }
    return DataObject.Get().Duration;
}
UFUNCTION()
FSpecialDamageTextConfig CastToFSpecialDamageTextConfig(const TDataObjectPtr<FSpecialDamageTextConfig> &inout DataObject)
{
    FSpecialDamageTextConfig __r;
    return __r;
}
}

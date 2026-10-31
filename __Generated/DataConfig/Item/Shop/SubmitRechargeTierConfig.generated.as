namespace __FSubmitRechargeTierConfigFunctions
{
UFUNCTION()
int __FSubmitRechargeTierConfig_GetTierId(const TDataObjectPtr<FSubmitRechargeTierConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TierId' from a null 'FSubmitRechargeTierConfig' DataObject!");
        }
        FSubmitRechargeTierConfig defaultValue;
        return defaultValue.TierId;
    }
    return DataObject.Get().TierId;
}
UFUNCTION()
int __FSubmitRechargeTierConfig_GetCurrencyAmount(const TDataObjectPtr<FSubmitRechargeTierConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CurrencyAmount' from a null 'FSubmitRechargeTierConfig' DataObject!");
        }
        FSubmitRechargeTierConfig defaultValue;
        return defaultValue.CurrencyAmount;
    }
    return DataObject.Get().CurrencyAmount;
}
UFUNCTION()
int __FSubmitRechargeTierConfig_GetPriceAmount(const TDataObjectPtr<FSubmitRechargeTierConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PriceAmount' from a null 'FSubmitRechargeTierConfig' DataObject!");
        }
        FSubmitRechargeTierConfig defaultValue;
        return defaultValue.PriceAmount;
    }
    return DataObject.Get().PriceAmount;
}
UFUNCTION()
FSoftBrush __FSubmitRechargeTierConfig_GetIcon(const TDataObjectPtr<FSubmitRechargeTierConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Icon' from a null 'FSubmitRechargeTierConfig' DataObject!");
        }
        FSubmitRechargeTierConfig local_64;
        return local_64.Icon;
    }
    return DataObject.Get().Icon;
}
UFUNCTION()
FSubmitRechargeTierConfig CastToFSubmitRechargeTierConfig(const TDataObjectPtr<FSubmitRechargeTierConfig> &inout DataObject)
{
    FSubmitRechargeTierConfig __r;
    return __r;
}
}

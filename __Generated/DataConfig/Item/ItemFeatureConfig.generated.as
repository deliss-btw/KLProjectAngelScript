namespace __FItemFeatureConfigFunctions
{
UFUNCTION()
TDataObjectPtr<FItemConfig> __FItemFeatureConfig_GetItemConfig(const TDataObjectPtr<FItemFeatureConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ItemConfig' from a null 'FItemFeatureConfig' DataObject!");
        }
        FItemFeatureConfig local_88;
        return local_88.GetItemConfig();
    }
    return DataObject.Get().GetItemConfig();
}
UFUNCTION()
bool __FItemFeatureConfig_GetbSpecialProps(const TDataObjectPtr<FItemFeatureConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bSpecialProps' from a null 'FItemFeatureConfig' DataObject!");
        }
        FItemFeatureConfig local_88;
        return local_88.bSpecialProps;
    }
    return DataObject.Get().bSpecialProps;
}
UFUNCTION()
bool __FItemFeatureConfig_GetbSpecialBg(const TDataObjectPtr<FItemFeatureConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bSpecialBg' from a null 'FItemFeatureConfig' DataObject!");
        }
        FItemFeatureConfig local_88;
        return local_88.bSpecialBg;
    }
    return DataObject.Get().bSpecialBg;
}
UFUNCTION()
FSoftBrush __FItemFeatureConfig_GetSpecialBgImage(const TDataObjectPtr<FItemFeatureConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SpecialBgImage' from a null 'FItemFeatureConfig' DataObject!");
        }
        FItemFeatureConfig local_88;
        return local_88.SpecialBgImage;
    }
    return DataObject.Get().SpecialBgImage;
}
UFUNCTION()
FItemFeatureConfig CastToFItemFeatureConfig(const TDataObjectPtr<FItemFeatureConfig> &inout DataObject)
{
    FItemFeatureConfig __r;
    return __r;
}
}

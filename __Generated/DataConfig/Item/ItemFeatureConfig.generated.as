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
    return GetItemConfig();
}
UFUNCTION()
bool __FItemFeatureConfig_GetbSpecialProps(const TDataObjectPtr<FItemFeatureConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bSpecialProps' from a null 'FItemFeatureConfig' DataObject!");
        }
        FItemFeatureConfig local_88;
        return local_88.bSpecialProps;
    }
    return local_1;
}
UFUNCTION()
bool __FItemFeatureConfig_GetbSpecialBg(const TDataObjectPtr<FItemFeatureConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bSpecialBg' from a null 'FItemFeatureConfig' DataObject!");
        }
        FItemFeatureConfig local_88;
        return local_88.bSpecialBg;
    }
    return local_1;
}
UFUNCTION()
FSoftBrush __FItemFeatureConfig_GetSpecialBgImage(const TDataObjectPtr<FItemFeatureConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SpecialBgImage' from a null 'FItemFeatureConfig' DataObject!");
        }
        FItemFeatureConfig local_88;
        return local_88.SpecialBgImage;
    }
    return __r;
}
UFUNCTION()
FItemFeatureConfig CastToFItemFeatureConfig(const TDataObjectPtr<FItemFeatureConfig> &inout DataObject)
{
    FItemFeatureConfig __r;
    return __r;
}
}

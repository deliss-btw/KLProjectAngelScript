namespace __FCommonItemConfigFunctions
{
UFUNCTION()
TArray<FInstancedStruct> __FCommonItemConfig_GetGSUseEffects(const TDataObjectPtr<FCommonItemConfig> &inout DataObject)
{
    TArray<FInstancedStruct> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GSUseEffects' from a null 'FCommonItemConfig' DataObject!");
        }
        FCommonItemConfig local_192;
        return local_192.GSUseEffects;
    }
    return __r;
}
UFUNCTION()
FCommonItemConfig CastToFCommonItemConfig(const TDataObjectPtr<FCommonItemConfig> &inout DataObject)
{
    FCommonItemConfig __r;
    return __r;
}
}

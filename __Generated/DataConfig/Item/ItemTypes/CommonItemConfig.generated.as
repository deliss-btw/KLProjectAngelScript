namespace __FCommonItemConfigFunctions
{
UFUNCTION()
TArray<FInstancedStruct> __FCommonItemConfig_GetGSUseEffects(const TDataObjectPtr<FCommonItemConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GSUseEffects' from a null 'FCommonItemConfig' DataObject!");
        }
        FCommonItemConfig local_192;
        return local_192.GSUseEffects;
    }
    return DataObject.Get().GSUseEffects;
}
UFUNCTION()
FCommonItemConfig CastToFCommonItemConfig(const TDataObjectPtr<FCommonItemConfig> &inout DataObject)
{
    FCommonItemConfig __r;
    return __r;
}
}

namespace __FFashionGlobalConfigFunctions
{
UFUNCTION()
TDataObjectPtr<FMountFashionConfig> __FFashionGlobalConfig_GetDefaultMount(const TDataObjectPtr<FFashionGlobalConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultMount' from a null 'FFashionGlobalConfig' DataObject!");
        }
        FFashionGlobalConfig local_40;
        return local_40.GetDefaultMount();
    }
    return GetDefaultMount();
}
UFUNCTION()
FFashionGlobalConfig CastToFFashionGlobalConfig(const TDataObjectPtr<FFashionGlobalConfig> &inout DataObject)
{
    FFashionGlobalConfig __r;
    return __r;
}
}

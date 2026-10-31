namespace __FCGConfigFunctions
{
UFUNCTION()
TArray<FCGContextConfig> __FCGConfig_GetPages(const TDataObjectPtr<FCGConfig> &inout DataObject)
{
    TArray<FCGContextConfig> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Pages' from a null 'FCGConfig' DataObject!");
        }
        FCGConfig local_18;
        return local_18.Pages;
    }
    return __r;
}
UFUNCTION()
FCGConfig CastToFCGConfig(const TDataObjectPtr<FCGConfig> &inout DataObject)
{
    FCGConfig __r;
    return __r;
}
}

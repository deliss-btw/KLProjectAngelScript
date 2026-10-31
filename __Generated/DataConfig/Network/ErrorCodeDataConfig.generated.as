namespace __FErrorCodeConfigFunctions
{
UFUNCTION()
FString __FErrorCodeConfig_GetErrorCodeCategory(const TDataObjectPtr<FErrorCodeConfig> &inout DataObject)
{
    FString __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ErrorCodeCategory' from a null 'FErrorCodeConfig' DataObject!");
        }
        FErrorCodeConfig local_26;
        return local_26.ErrorCodeCategory;
    }
    return __r;
}
UFUNCTION()
FString __FErrorCodeConfig_GetErrorCodeComment(const TDataObjectPtr<FErrorCodeConfig> &inout DataObject)
{
    FString __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ErrorCodeComment' from a null 'FErrorCodeConfig' DataObject!");
        }
        FErrorCodeConfig local_26;
        return local_26.ErrorCodeComment;
    }
    return __r;
}
UFUNCTION()
FText __FErrorCodeConfig_GetErrorCodeText(const TDataObjectPtr<FErrorCodeConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ErrorCodeText' from a null 'FErrorCodeConfig' DataObject!");
        }
        FErrorCodeConfig local_26;
        return local_26.ErrorCodeText;
    }
    return __r;
}
UFUNCTION()
FErrorCodeConfig CastToFErrorCodeConfig(const TDataObjectPtr<FErrorCodeConfig> &inout DataObject)
{
    FErrorCodeConfig __r;
    return __r;
}
}

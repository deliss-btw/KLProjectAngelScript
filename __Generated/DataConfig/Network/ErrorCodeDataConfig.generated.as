namespace __FErrorCodeConfigFunctions
{
UFUNCTION()
FString __FErrorCodeConfig_GetErrorCodeCategory(const TDataObjectPtr<FErrorCodeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ErrorCodeCategory' from a null 'FErrorCodeConfig' DataObject!");
        }
        FErrorCodeConfig local_26;
        return local_26.ErrorCodeCategory;
    }
    return DataObject.Get().ErrorCodeCategory;
}
UFUNCTION()
FString __FErrorCodeConfig_GetErrorCodeComment(const TDataObjectPtr<FErrorCodeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ErrorCodeComment' from a null 'FErrorCodeConfig' DataObject!");
        }
        FErrorCodeConfig local_26;
        return local_26.ErrorCodeComment;
    }
    return DataObject.Get().ErrorCodeComment;
}
UFUNCTION()
FText __FErrorCodeConfig_GetErrorCodeText(const TDataObjectPtr<FErrorCodeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ErrorCodeText' from a null 'FErrorCodeConfig' DataObject!");
        }
        FErrorCodeConfig local_26;
        return local_26.ErrorCodeText;
    }
    return DataObject.Get().ErrorCodeText;
}
UFUNCTION()
FErrorCodeConfig CastToFErrorCodeConfig(const TDataObjectPtr<FErrorCodeConfig> &inout DataObject)
{
    FErrorCodeConfig __r;
    return __r;
}
}

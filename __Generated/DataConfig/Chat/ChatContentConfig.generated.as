namespace __FChatContentConfigFunctions
{
UFUNCTION()
EChatSystemContentType __FChatContentConfig_GetContentType(const TDataObjectPtr<FChatContentConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ContentType' from a null 'FChatContentConfig' DataObject!");
        }
        FChatContentConfig local_26;
        return local_26.ContentType;
    }
    return DataObject.Get().ContentType;
}
UFUNCTION()
FArgText __FChatContentConfig_GetContent(const TDataObjectPtr<FChatContentConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Content' from a null 'FChatContentConfig' DataObject!");
        }
        FChatContentConfig local_26;
        return local_26.Content;
    }
    return DataObject.Get().Content;
}
UFUNCTION()
bool __FChatContentConfig_GetbIsShowInMiddle(const TDataObjectPtr<FChatContentConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bIsShowInMiddle' from a null 'FChatContentConfig' DataObject!");
        }
        FChatContentConfig local_26;
        return local_26.bIsShowInMiddle;
    }
    return DataObject.Get().bIsShowInMiddle;
}
UFUNCTION()
FChatContentConfig CastToFChatContentConfig(const TDataObjectPtr<FChatContentConfig> &inout DataObject)
{
    FChatContentConfig __r;
    return __r;
}
}

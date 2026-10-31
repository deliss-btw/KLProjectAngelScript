namespace __FChatContentConfigFunctions
{
UFUNCTION()
EChatSystemContentType __FChatContentConfig_GetContentType(const TDataObjectPtr<FChatContentConfig> &inout DataObject)
{
    int local_27 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ContentType' from a null 'FChatContentConfig' DataObject!");
        }
        FChatContentConfig local_26;
        local_27 = int(local_26.ContentType);
        return EChatSystemContentType(local_27);
    }
    return EChatSystemContentType(local_27);
}
UFUNCTION()
FArgText __FChatContentConfig_GetContent(const TDataObjectPtr<FChatContentConfig> &inout DataObject)
{
    FArgText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Content' from a null 'FChatContentConfig' DataObject!");
        }
        FChatContentConfig local_26;
        return local_26.Content;
    }
    return __r;
}
UFUNCTION()
bool __FChatContentConfig_GetbIsShowInMiddle(const TDataObjectPtr<FChatContentConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bIsShowInMiddle' from a null 'FChatContentConfig' DataObject!");
        }
        FChatContentConfig local_26;
        return local_26.bIsShowInMiddle;
    }
    return local_1;
}
UFUNCTION()
FChatContentConfig CastToFChatContentConfig(const TDataObjectPtr<FChatContentConfig> &inout DataObject)
{
    FChatContentConfig __r;
    return __r;
}
}

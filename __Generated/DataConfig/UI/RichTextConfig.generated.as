namespace __FRichTextImageDataFunctions
{
UFUNCTION()
FSoftBrush __FRichTextImageData_GetImage(const TDataObjectPtr<FRichTextImageData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Image' from a null 'FRichTextImageData' DataObject!");
        }
        FRichTextImageData local_60;
        return local_60.Image;
    }
    return DataObject.Get().Image;
}
UFUNCTION()
FRichTextImageData CastToFRichTextImageData(const TDataObjectPtr<FRichTextImageData> &inout DataObject)
{
    FRichTextImageData __r;
    return __r;
}
}

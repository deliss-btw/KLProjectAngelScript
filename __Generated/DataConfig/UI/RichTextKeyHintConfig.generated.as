namespace __FRichTextKeyHintDataFunctions
{
UFUNCTION()
FEUIInputAction __FRichTextKeyHintData_GetInputAction(const TDataObjectPtr<FRichTextKeyHintData> &inout DataObject)
{
    FEUIInputAction __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InputAction' from a null 'FRichTextKeyHintData' DataObject!");
        }
        FRichTextKeyHintData local_20;
        return local_20.InputAction;
    }
    return __r;
}
UFUNCTION()
FRichTextKeyHintData CastToFRichTextKeyHintData(const TDataObjectPtr<FRichTextKeyHintData> &inout DataObject)
{
    FRichTextKeyHintData __r;
    return __r;
}
}

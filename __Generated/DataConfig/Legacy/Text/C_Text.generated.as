namespace __FAttributeTextDataFunctions
{
UFUNCTION()
FGameAttributeRef __FAttributeTextData_GetAttribute(const TDataObjectPtr<FAttributeTextData> &inout DataObject)
{
    FGameAttributeRef __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Attribute' from a null 'FAttributeTextData' DataObject!");
        }
        FAttributeTextData local_32;
        return local_32.Attribute;
    }
    return __r;
}
UFUNCTION()
FText __FAttributeTextData_GetText(const TDataObjectPtr<FAttributeTextData> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Text' from a null 'FAttributeTextData' DataObject!");
        }
        FAttributeTextData local_32;
        return local_32.Text;
    }
    return __r;
}
UFUNCTION()
FAttributeTextData CastToFAttributeTextData(const TDataObjectPtr<FAttributeTextData> &inout DataObject)
{
    FAttributeTextData __r;
    return __r;
}
}
namespace __FKLTextDataFunctions
{
UFUNCTION()
FText __FKLTextData_GetText(const TDataObjectPtr<FKLTextData> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Text' from a null 'FKLTextData' DataObject!");
        }
        FKLTextData local_18;
        return local_18.Text;
    }
    return __r;
}
UFUNCTION()
FKLTextData CastToFKLTextData(const TDataObjectPtr<FKLTextData> &inout DataObject)
{
    FKLTextData __r;
    return __r;
}
}

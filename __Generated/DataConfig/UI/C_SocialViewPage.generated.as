namespace __FSocialViewPageButtonConfigFunctions
{
UFUNCTION()
FText __FSocialViewPageButtonConfig_GetName(const TDataObjectPtr<FSocialViewPageButtonConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Name' from a null 'FSocialViewPageButtonConfig' DataObject!");
        }
        FSocialViewPageButtonConfig local_84;
        return local_84.Name;
    }
    return DataObject.Get().Name;
}
UFUNCTION()
FSoftBrush __FSocialViewPageButtonConfig_GetIcon(const TDataObjectPtr<FSocialViewPageButtonConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Icon' from a null 'FSocialViewPageButtonConfig' DataObject!");
        }
        FSocialViewPageButtonConfig local_84;
        return local_84.Icon;
    }
    return DataObject.Get().Icon;
}
UFUNCTION()
UInputAction __FSocialViewPageButtonConfig_GetInputAction(const TDataObjectPtr<FSocialViewPageButtonConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InputAction' from a null 'FSocialViewPageButtonConfig' DataObject!");
        }
        FSocialViewPageButtonConfig local_84;
        return local_84.InputAction;
    }
    UInputAction local_86;
    return local_86;
}
UFUNCTION()
ESocialViewPageOperatorType __FSocialViewPageButtonConfig_GetOperatorType(const TDataObjectPtr<FSocialViewPageButtonConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'OperatorType' from a null 'FSocialViewPageButtonConfig' DataObject!");
        }
        FSocialViewPageButtonConfig local_84;
        return local_84.OperatorType;
    }
    return DataObject.Get().OperatorType;
}
UFUNCTION()
TSoftClassPtr<UEUIUserWidget> __FSocialViewPageButtonConfig_GetPageWidget(const TDataObjectPtr<FSocialViewPageButtonConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PageWidget' from a null 'FSocialViewPageButtonConfig' DataObject!");
        }
        FSocialViewPageButtonConfig local_84;
        return local_84.PageWidget;
    }
    return DataObject.Get().PageWidget;
}
UFUNCTION()
FSocialViewPageButtonConfig CastToFSocialViewPageButtonConfig(const TDataObjectPtr<FSocialViewPageButtonConfig> &inout DataObject)
{
    FSocialViewPageButtonConfig __r;
    return __r;
}
}
namespace __FSocialViewPageDataFunctions
{
UFUNCTION()
ESocialViewPageOpenType __FSocialViewPageData_GetEnterPageType(const TDataObjectPtr<FSocialViewPageData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EnterPageType' from a null 'FSocialViewPageData' DataObject!");
        }
        FSocialViewPageData local_28;
        return local_28.EnterPageType;
    }
    return DataObject.Get().EnterPageType;
}
UFUNCTION()
TArray<TDataObjectPtr<FSocialViewPageButtonConfig>> __FSocialViewPageData_GetBigButtons(const TDataObjectPtr<FSocialViewPageData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BigButtons' from a null 'FSocialViewPageData' DataObject!");
        }
        FSocialViewPageData local_28;
        return local_28.GetBigButtons();
    }
    return DataObject.Get().GetBigButtons();
}
UFUNCTION()
TArray<TDataObjectPtr<FSocialViewPageButtonConfig>> __FSocialViewPageData_GetSmallButtons(const TDataObjectPtr<FSocialViewPageData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SmallButtons' from a null 'FSocialViewPageData' DataObject!");
        }
        FSocialViewPageData local_28;
        return local_28.GetSmallButtons();
    }
    return DataObject.Get().GetSmallButtons();
}
UFUNCTION()
TArray<TDataObjectPtr<FSocialViewPageButtonConfig>> __FSocialViewPageData_GetHiddenSmallButtons(const TDataObjectPtr<FSocialViewPageData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HiddenSmallButtons' from a null 'FSocialViewPageData' DataObject!");
        }
        FSocialViewPageData local_28;
        return local_28.GetHiddenSmallButtons();
    }
    return DataObject.Get().GetHiddenSmallButtons();
}
UFUNCTION()
FSocialViewPageData CastToFSocialViewPageData(const TDataObjectPtr<FSocialViewPageData> &inout DataObject)
{
    FSocialViewPageData __r;
    return __r;
}
}

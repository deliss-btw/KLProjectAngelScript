namespace __FSocialViewPageButtonConfigFunctions
{
UFUNCTION()
FText __FSocialViewPageButtonConfig_GetName(const TDataObjectPtr<FSocialViewPageButtonConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Name' from a null 'FSocialViewPageButtonConfig' DataObject!");
        }
        FSocialViewPageButtonConfig local_84;
        return local_84.Name;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FSocialViewPageButtonConfig_GetIcon(const TDataObjectPtr<FSocialViewPageButtonConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Icon' from a null 'FSocialViewPageButtonConfig' DataObject!");
        }
        FSocialViewPageButtonConfig local_84;
        return local_84.Icon;
    }
    return __r;
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
    int local_85 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'OperatorType' from a null 'FSocialViewPageButtonConfig' DataObject!");
        }
        FSocialViewPageButtonConfig local_84;
        local_85 = int(local_84.OperatorType);
        return ESocialViewPageOperatorType(local_85);
    }
    return ESocialViewPageOperatorType(local_85);
}
UFUNCTION()
TSoftClassPtr<UEUIUserWidget> __FSocialViewPageButtonConfig_GetPageWidget(const TDataObjectPtr<FSocialViewPageButtonConfig> &inout DataObject)
{
    TSoftClassPtr<UEUIUserWidget> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PageWidget' from a null 'FSocialViewPageButtonConfig' DataObject!");
        }
        FSocialViewPageButtonConfig local_84;
        return local_84.PageWidget;
    }
    return __r;
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
    int local_29 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EnterPageType' from a null 'FSocialViewPageData' DataObject!");
        }
        FSocialViewPageData local_28;
        local_29 = int(local_28.EnterPageType);
        return ESocialViewPageOpenType(local_29);
    }
    return ESocialViewPageOpenType(local_29);
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
    return GetBigButtons();
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
    return GetSmallButtons();
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
    return GetHiddenSmallButtons();
}
UFUNCTION()
FSocialViewPageData CastToFSocialViewPageData(const TDataObjectPtr<FSocialViewPageData> &inout DataObject)
{
    FSocialViewPageData __r;
    return __r;
}
}

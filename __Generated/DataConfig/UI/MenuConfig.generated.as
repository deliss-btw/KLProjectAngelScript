namespace __FMenuConfigFunctions
{
UFUNCTION()
FText __FMenuConfig_GetMenuName(const TDataObjectPtr<FMenuConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MenuName' from a null 'FMenuConfig' DataObject!");
        }
        FMenuConfig local_100;
        return local_100.MenuName;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FMenuConfig_GetMenuIcon(const TDataObjectPtr<FMenuConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MenuIcon' from a null 'FMenuConfig' DataObject!");
        }
        FMenuConfig local_100;
        return local_100.MenuIcon;
    }
    return __r;
}
UFUNCTION()
TDataObjectPtr<FSystemControlConfig> __FMenuConfig_GetSystemControlConfig(const TDataObjectPtr<FMenuConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SystemControlConfig' from a null 'FMenuConfig' DataObject!");
        }
        FMenuConfig local_100;
        return local_100.GetSystemControlConfig();
    }
    return GetSystemControlConfig();
}
UFUNCTION()
FEUIWidgetTag __FMenuConfig_GetMenuWidget(const TDataObjectPtr<FMenuConfig> &inout DataObject)
{
    FEUIWidgetTag __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MenuWidget' from a null 'FMenuConfig' DataObject!");
        }
        FMenuConfig local_100;
        return local_100.MenuWidget;
    }
    return __r;
}
UFUNCTION()
FRedDotNodeData __FMenuConfig_GetEntranceRedDot(const TDataObjectPtr<FMenuConfig> &inout DataObject)
{
    FRedDotNodeData __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EntranceRedDot' from a null 'FMenuConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
FEUIInputAction __FMenuConfig_GetEntryAction(const TDataObjectPtr<FMenuConfig> &inout DataObject)
{
    FEUIInputAction __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EntryAction' from a null 'FMenuConfig' DataObject!");
        }
        FMenuConfig local_100;
        return local_100.EntryAction;
    }
    return __r;
}
UFUNCTION()
FMenuConfig CastToFMenuConfig(const TDataObjectPtr<FMenuConfig> &inout DataObject)
{
    FMenuConfig __r;
    return __r;
}
}

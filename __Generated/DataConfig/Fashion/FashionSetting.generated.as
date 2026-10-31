namespace __FFashionSlotConfigFunctions
{
UFUNCTION()
FSoftBrush __FFashionSlotConfig_GetSlotIcon(const TDataObjectPtr<FFashionSlotConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SlotIcon' from a null 'FFashionSlotConfig' DataObject!");
        }
        FFashionSlotConfig local_92;
        return local_92.SlotIcon;
    }
    return DataObject.Get().SlotIcon;
}
UFUNCTION()
FText __FFashionSlotConfig_GetSlotName(const TDataObjectPtr<FFashionSlotConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SlotName' from a null 'FFashionSlotConfig' DataObject!");
        }
        FFashionSlotConfig local_92;
        return local_92.SlotName;
    }
    return DataObject.Get().SlotName;
}
UFUNCTION()
EFashionSlotMainTab __FFashionSlotConfig_GetMainTab(const TDataObjectPtr<FFashionSlotConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MainTab' from a null 'FFashionSlotConfig' DataObject!");
        }
        FFashionSlotConfig local_92;
        return local_92.MainTab;
    }
    return DataObject.Get().MainTab;
}
UFUNCTION()
EFashionSlotSubTab __FFashionSlotConfig_GetSubTab(const TDataObjectPtr<FFashionSlotConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SubTab' from a null 'FFashionSlotConfig' DataObject!");
        }
        FFashionSlotConfig local_92;
        return local_92.SubTab;
    }
    return DataObject.Get().SubTab;
}
UFUNCTION()
int __FFashionSlotConfig_GetPriority(const TDataObjectPtr<FFashionSlotConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Priority' from a null 'FFashionSlotConfig' DataObject!");
        }
        FFashionSlotConfig defaultValue;
        return defaultValue.Priority;
    }
    return DataObject.Get().Priority;
}
UFUNCTION()
bool __FFashionSlotConfig_GetbAllowUnequip(const TDataObjectPtr<FFashionSlotConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bAllowUnequip' from a null 'FFashionSlotConfig' DataObject!");
        }
        FFashionSlotConfig local_92;
        return local_92.bAllowUnequip;
    }
    return DataObject.Get().bAllowUnequip;
}
UFUNCTION()
TDataObjectPtr<FUIShowcaseConfig> __FFashionSlotConfig_GetShowcaseConfig(const TDataObjectPtr<FFashionSlotConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ShowcaseConfig' from a null 'FFashionSlotConfig' DataObject!");
        }
        FFashionSlotConfig local_92;
        return local_92.GetShowcaseConfig();
    }
    return DataObject.Get().GetShowcaseConfig();
}
UFUNCTION()
FFashionSlotConfig CastToFFashionSlotConfig(const TDataObjectPtr<FFashionSlotConfig> &inout DataObject)
{
    FFashionSlotConfig __r;
    return __r;
}
}

namespace __FFashionSlotConfigFunctions
{
UFUNCTION()
FSoftBrush __FFashionSlotConfig_GetSlotIcon(const TDataObjectPtr<FFashionSlotConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SlotIcon' from a null 'FFashionSlotConfig' DataObject!");
        }
        FFashionSlotConfig local_92;
        return local_92.SlotIcon;
    }
    return __r;
}
UFUNCTION()
FText __FFashionSlotConfig_GetSlotName(const TDataObjectPtr<FFashionSlotConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SlotName' from a null 'FFashionSlotConfig' DataObject!");
        }
        FFashionSlotConfig local_92;
        return local_92.SlotName;
    }
    return __r;
}
UFUNCTION()
EFashionSlotMainTab __FFashionSlotConfig_GetMainTab(const TDataObjectPtr<FFashionSlotConfig> &inout DataObject)
{
    int local_93 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MainTab' from a null 'FFashionSlotConfig' DataObject!");
        }
        FFashionSlotConfig local_92;
        local_93 = int(local_92.MainTab);
        return EFashionSlotMainTab(local_93);
    }
    return EFashionSlotMainTab(local_93);
}
UFUNCTION()
EFashionSlotSubTab __FFashionSlotConfig_GetSubTab(const TDataObjectPtr<FFashionSlotConfig> &inout DataObject)
{
    int local_93 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SubTab' from a null 'FFashionSlotConfig' DataObject!");
        }
        FFashionSlotConfig local_92;
        local_93 = int(local_92.SubTab);
        return EFashionSlotSubTab(local_93);
    }
    return EFashionSlotSubTab(local_93);
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
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bAllowUnequip' from a null 'FFashionSlotConfig' DataObject!");
        }
        FFashionSlotConfig local_92;
        return local_92.bAllowUnequip;
    }
    return local_1;
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
    return GetShowcaseConfig();
}
UFUNCTION()
FFashionSlotConfig CastToFFashionSlotConfig(const TDataObjectPtr<FFashionSlotConfig> &inout DataObject)
{
    FFashionSlotConfig __r;
    return __r;
}
}

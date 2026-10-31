namespace __FItemQuickSlotConfigFunctions
{
UFUNCTION()
FText __FItemQuickSlotConfig_GetDisplayName(const TDataObjectPtr<FItemQuickSlotConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayName' from a null 'FItemQuickSlotConfig' DataObject!");
        }
        FItemQuickSlotConfig local_92;
        return local_92.DisplayName;
    }
    return DataObject.Get().DisplayName;
}
UFUNCTION()
FItemQuickSlotFilter __FItemQuickSlotConfig_GetItemFilter(const TDataObjectPtr<FItemQuickSlotConfig> &inout DataObject)
{
    FItemQuickSlotFilter __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ItemFilter' from a null 'FItemQuickSlotConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
FItemSpecifier __FItemQuickSlotConfig_GetItemSpecifier(const TDataObjectPtr<FItemQuickSlotConfig> &inout DataObject)
{
    FItemSpecifier __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ItemSpecifier' from a null 'FItemQuickSlotConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
TDataObjectPtr<FItemConfig> __FItemQuickSlotConfig_GetDefaultItem(const TDataObjectPtr<FItemQuickSlotConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultItem' from a null 'FItemQuickSlotConfig' DataObject!");
        }
        FItemQuickSlotConfig local_92;
        return local_92.GetDefaultItem();
    }
    return DataObject.Get().GetDefaultItem();
}
UFUNCTION()
EItemQuickSlotMutuallyExclusiveCondition __FItemQuickSlotConfig_GetMutuallyExclusiveCondition(const TDataObjectPtr<FItemQuickSlotConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MutuallyExclusiveCondition' from a null 'FItemQuickSlotConfig' DataObject!");
        }
        FItemQuickSlotConfig local_92;
        return local_92.MutuallyExclusiveCondition;
    }
    return DataObject.Get().MutuallyExclusiveCondition;
}
UFUNCTION()
bool __FItemQuickSlotConfig_GetbAllowEmpty(const TDataObjectPtr<FItemQuickSlotConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bAllowEmpty' from a null 'FItemQuickSlotConfig' DataObject!");
        }
        FItemQuickSlotConfig local_92;
        return local_92.bAllowEmpty;
    }
    return DataObject.Get().bAllowEmpty;
}
UFUNCTION()
bool __FItemQuickSlotConfig_GetbAllowUnownedItem(const TDataObjectPtr<FItemQuickSlotConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bAllowUnownedItem' from a null 'FItemQuickSlotConfig' DataObject!");
        }
        FItemQuickSlotConfig local_92;
        return local_92.bAllowUnownedItem;
    }
    return DataObject.Get().bAllowUnownedItem;
}
UFUNCTION()
EESMTriggerInputSlot __FItemQuickSlotConfig_GetInputSlot(const TDataObjectPtr<FItemQuickSlotConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InputSlot' from a null 'FItemQuickSlotConfig' DataObject!");
        }
        FItemQuickSlotConfig local_92;
        return local_92.InputSlot;
    }
    return DataObject.Get().InputSlot;
}
UFUNCTION()
FItemQuickSlotConfig CastToFItemQuickSlotConfig(const TDataObjectPtr<FItemQuickSlotConfig> &inout DataObject)
{
    FItemQuickSlotConfig __r;
    return __r;
}
}

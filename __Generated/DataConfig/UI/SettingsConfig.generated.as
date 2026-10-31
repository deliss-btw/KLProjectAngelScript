namespace __FSettingCategoryConfigFunctions
{
UFUNCTION()
FText __FSettingCategoryConfig_GetName(const TDataObjectPtr<FSettingCategoryConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Name' from a null 'FSettingCategoryConfig' DataObject!");
        }
        FSettingCategoryConfig local_72;
        return local_72.Name;
    }
    return __r;
}
UFUNCTION()
FText __FSettingCategoryConfig_GetDesc(const TDataObjectPtr<FSettingCategoryConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Desc' from a null 'FSettingCategoryConfig' DataObject!");
        }
        FSettingCategoryConfig local_72;
        return local_72.Desc;
    }
    return __r;
}
UFUNCTION()
FFilteredGameplayTag __FSettingCategoryConfig_GetCategoryTag(const TDataObjectPtr<FSettingCategoryConfig> &inout DataObject)
{
    FFilteredGameplayTag __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CategoryTag' from a null 'FSettingCategoryConfig' DataObject!");
        }
        FSettingCategoryConfig local_72;
        return local_72.CategoryTag;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FSettingCategoryConfig_GetItemIcon(const TDataObjectPtr<FSettingCategoryConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ItemIcon' from a null 'FSettingCategoryConfig' DataObject!");
        }
        FSettingCategoryConfig local_72;
        return local_72.ItemIcon;
    }
    return __r;
}
UFUNCTION()
FSettingCategoryConfig CastToFSettingCategoryConfig(const TDataObjectPtr<FSettingCategoryConfig> &inout DataObject)
{
    FSettingCategoryConfig __r;
    return __r;
}
}
namespace __FSettingComponentWidgetClassFunctions
{
UFUNCTION()
TSoftClassPtr<UEUIUserWidget> __FSettingComponentWidgetClass_GetSettingSubTitleWidgetClass(const TDataObjectPtr<FSettingComponentWidgetClass> &inout DataObject)
{
    TSoftClassPtr<UEUIUserWidget> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SettingSubTitleWidgetClass' from a null 'FSettingComponentWidgetClass' DataObject!");
        }
        FSettingComponentWidgetClass local_94;
        return local_94.SettingSubTitleWidgetClass;
    }
    return __r;
}
UFUNCTION()
TSoftClassPtr<UEUIUserWidget> __FSettingComponentWidgetClass_GetSettingItemWidgetClass(const TDataObjectPtr<FSettingComponentWidgetClass> &inout DataObject)
{
    TSoftClassPtr<UEUIUserWidget> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SettingItemWidgetClass' from a null 'FSettingComponentWidgetClass' DataObject!");
        }
        FSettingComponentWidgetClass local_94;
        return local_94.SettingItemWidgetClass;
    }
    return __r;
}
UFUNCTION()
TSoftClassPtr<UEUIUserWidget> __FSettingComponentWidgetClass_GetDropDownWidgetClass(const TDataObjectPtr<FSettingComponentWidgetClass> &inout DataObject)
{
    TSoftClassPtr<UEUIUserWidget> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DropDownWidgetClass' from a null 'FSettingComponentWidgetClass' DataObject!");
        }
        FSettingComponentWidgetClass local_94;
        return local_94.DropDownWidgetClass;
    }
    return __r;
}
UFUNCTION()
TSoftClassPtr<UEUIUserWidget> __FSettingComponentWidgetClass_GetSliderWidgetClass(const TDataObjectPtr<FSettingComponentWidgetClass> &inout DataObject)
{
    TSoftClassPtr<UEUIUserWidget> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SliderWidgetClass' from a null 'FSettingComponentWidgetClass' DataObject!");
        }
        FSettingComponentWidgetClass local_94;
        return local_94.SliderWidgetClass;
    }
    return __r;
}
UFUNCTION()
TSoftClassPtr<UEUIUserWidget> __FSettingComponentWidgetClass_GetLinkWidgetClass(const TDataObjectPtr<FSettingComponentWidgetClass> &inout DataObject)
{
    TSoftClassPtr<UEUIUserWidget> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LinkWidgetClass' from a null 'FSettingComponentWidgetClass' DataObject!");
        }
        FSettingComponentWidgetClass local_94;
        return local_94.LinkWidgetClass;
    }
    return __r;
}
UFUNCTION()
TSoftClassPtr<UEUIUserWidget> __FSettingComponentWidgetClass_GetToggleWidgetClass(const TDataObjectPtr<FSettingComponentWidgetClass> &inout DataObject)
{
    TSoftClassPtr<UEUIUserWidget> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ToggleWidgetClass' from a null 'FSettingComponentWidgetClass' DataObject!");
        }
        FSettingComponentWidgetClass local_94;
        return local_94.ToggleWidgetClass;
    }
    return __r;
}
UFUNCTION()
TSoftClassPtr<UEUIUserWidget> __FSettingComponentWidgetClass_GetKeyboardWidgetClass(const TDataObjectPtr<FSettingComponentWidgetClass> &inout DataObject)
{
    TSoftClassPtr<UEUIUserWidget> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'KeyboardWidgetClass' from a null 'FSettingComponentWidgetClass' DataObject!");
        }
        FSettingComponentWidgetClass local_94;
        return local_94.KeyboardWidgetClass;
    }
    return __r;
}
UFUNCTION()
TSoftClassPtr<UEUIUserWidget> __FSettingComponentWidgetClass_GetGamepadWidgetClass(const TDataObjectPtr<FSettingComponentWidgetClass> &inout DataObject)
{
    TSoftClassPtr<UEUIUserWidget> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GamepadWidgetClass' from a null 'FSettingComponentWidgetClass' DataObject!");
        }
        FSettingComponentWidgetClass local_94;
        return local_94.GamepadWidgetClass;
    }
    return __r;
}
UFUNCTION()
FSettingComponentWidgetClass CastToFSettingComponentWidgetClass(const TDataObjectPtr<FSettingComponentWidgetClass> &inout DataObject)
{
    FSettingComponentWidgetClass __r;
    return __r;
}
}
namespace __FSettingSubTitleConfigFunctions
{
UFUNCTION()
FText __FSettingSubTitleConfig_GetName(const TDataObjectPtr<FSettingSubTitleConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Name' from a null 'FSettingSubTitleConfig' DataObject!");
        }
        FSettingSubTitleConfig local_24;
        return local_24.Name;
    }
    return __r;
}
UFUNCTION()
FText __FSettingSubTitleConfig_GetDesc(const TDataObjectPtr<FSettingSubTitleConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Desc' from a null 'FSettingSubTitleConfig' DataObject!");
        }
        FSettingSubTitleConfig local_24;
        return local_24.Desc;
    }
    return __r;
}
UFUNCTION()
FFilteredGameplayTag __FSettingSubTitleConfig_GetSubTitleTag(const TDataObjectPtr<FSettingSubTitleConfig> &inout DataObject)
{
    FFilteredGameplayTag __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SubTitleTag' from a null 'FSettingSubTitleConfig' DataObject!");
        }
        FSettingSubTitleConfig local_24;
        return local_24.SubTitleTag;
    }
    return __r;
}
UFUNCTION()
FSettingSubTitleConfig CastToFSettingSubTitleConfig(const TDataObjectPtr<FSettingSubTitleConfig> &inout DataObject)
{
    FSettingSubTitleConfig __r;
    return __r;
}
}
namespace __FSettingItemConfigFunctions
{
UFUNCTION()
FText __FSettingItemConfig_GetName(const TDataObjectPtr<FSettingItemConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Name' from a null 'FSettingItemConfig' DataObject!");
        }
        FSettingItemConfig local_36;
        return local_36.Name;
    }
    return __r;
}
UFUNCTION()
FText __FSettingItemConfig_GetDesc(const TDataObjectPtr<FSettingItemConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Desc' from a null 'FSettingItemConfig' DataObject!");
        }
        FSettingItemConfig local_36;
        return local_36.Desc;
    }
    return __r;
}
UFUNCTION()
FFilteredGameplayTag __FSettingItemConfig_GetItemTag(const TDataObjectPtr<FSettingItemConfig> &inout DataObject)
{
    FFilteredGameplayTag __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ItemTag' from a null 'FSettingItemConfig' DataObject!");
        }
        FSettingItemConfig local_36;
        return local_36.ItemTag;
    }
    return __r;
}
UFUNCTION()
float32 __FSettingItemConfig_GetDefaultValue(const TDataObjectPtr<FSettingItemConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultValue' from a null 'FSettingItemConfig' DataObject!");
        }
        FSettingItemConfig defaultValue;
        return defaultValue.DefaultValue;
    }
    return DataObject.Get().DefaultValue;
}
UFUNCTION()
ESettingApplyType __FSettingItemConfig_GetApplyType(const TDataObjectPtr<FSettingItemConfig> &inout DataObject)
{
    int local_37 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ApplyType' from a null 'FSettingItemConfig' DataObject!");
        }
        FSettingItemConfig local_36;
        local_37 = int(local_36.ApplyType);
        return ESettingApplyType(local_37);
    }
    return ESettingApplyType(local_37);
}
UFUNCTION()
FInstancedStruct __FSettingItemConfig_GetVisualConfig(const TDataObjectPtr<FSettingItemConfig> &inout DataObject)
{
    FInstancedStruct __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'VisualConfig' from a null 'FSettingItemConfig' DataObject!");
        }
        FSettingItemConfig local_36;
        return local_36.VisualConfig;
    }
    return __r;
}
UFUNCTION()
FInstancedStruct __FSettingItemConfig_GetApplyEffect(const TDataObjectPtr<FSettingItemConfig> &inout DataObject)
{
    FInstancedStruct __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ApplyEffect' from a null 'FSettingItemConfig' DataObject!");
        }
        FSettingItemConfig local_36;
        return local_36.ApplyEffect;
    }
    return __r;
}
UFUNCTION()
bool __FSettingItemConfig_GetbIsResolutionOption(const TDataObjectPtr<FSettingItemConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bIsResolutionOption' from a null 'FSettingItemConfig' DataObject!");
        }
        FSettingItemConfig local_36;
        return local_36.bIsResolutionOption;
    }
    return local_1;
}
UFUNCTION()
bool __FSettingItemConfig_GetbToHide(const TDataObjectPtr<FSettingItemConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bToHide' from a null 'FSettingItemConfig' DataObject!");
        }
        FSettingItemConfig local_36;
        return local_36.bToHide;
    }
    return local_1;
}
UFUNCTION()
FSettingItemConfig CastToFSettingItemConfig(const TDataObjectPtr<FSettingItemConfig> &inout DataObject)
{
    FSettingItemConfig __r;
    return __r;
}
}

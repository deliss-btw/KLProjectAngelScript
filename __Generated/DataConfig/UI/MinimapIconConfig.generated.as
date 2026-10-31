namespace __FMinimapIconSimplifiedDisplayRuleFunctions
{
UFUNCTION()
float32 __FMinimapIconSimplifiedDisplayRule_GetDisplayMapScale(const TDataObjectPtr<FMinimapIconSimplifiedDisplayRule> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayMapScale' from a null 'FMinimapIconSimplifiedDisplayRule' DataObject!");
        }
        FMinimapIconSimplifiedDisplayRule defaultValue;
        return defaultValue.DisplayMapScale;
    }
    return DataObject.Get().DisplayMapScale;
}
UFUNCTION()
FSoftBrush __FMinimapIconSimplifiedDisplayRule_GetDisplayIcon(const TDataObjectPtr<FMinimapIconSimplifiedDisplayRule> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayIcon' from a null 'FMinimapIconSimplifiedDisplayRule' DataObject!");
        }
        FMinimapIconSimplifiedDisplayRule local_68;
        return local_68.DisplayIcon;
    }
    return __r;
}
UFUNCTION()
EStretch __FMinimapIconSimplifiedDisplayRule_GetScaleType(const TDataObjectPtr<FMinimapIconSimplifiedDisplayRule> &inout DataObject)
{
    int local_69 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ScaleType' from a null 'FMinimapIconSimplifiedDisplayRule' DataObject!");
        }
        FMinimapIconSimplifiedDisplayRule local_68;
        local_69 = int(local_68.ScaleType);
        return EStretch(local_69);
    }
    return EStretch(local_69);
}
UFUNCTION()
EStretchDirection __FMinimapIconSimplifiedDisplayRule_GetStretchDirection(const TDataObjectPtr<FMinimapIconSimplifiedDisplayRule> &inout DataObject)
{
    int local_69 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'StretchDirection' from a null 'FMinimapIconSimplifiedDisplayRule' DataObject!");
        }
        FMinimapIconSimplifiedDisplayRule local_68;
        local_69 = int(local_68.StretchDirection);
        return EStretchDirection(local_69);
    }
    return EStretchDirection(local_69);
}
UFUNCTION()
UCurveFloat __FMinimapIconSimplifiedDisplayRule_GetUserSpecifiedScaleByMapScale(const TDataObjectPtr<FMinimapIconSimplifiedDisplayRule> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UserSpecifiedScaleByMapScale' from a null 'FMinimapIconSimplifiedDisplayRule' DataObject!");
        }
        FMinimapIconSimplifiedDisplayRule local_68;
        return local_68.UserSpecifiedScaleByMapScale;
    }
    UCurveFloat local_70;
    return local_70;
}
UFUNCTION()
FMinimapIconSimplifiedDisplayRule CastToFMinimapIconSimplifiedDisplayRule(const TDataObjectPtr<FMinimapIconSimplifiedDisplayRule> &inout DataObject)
{
    FMinimapIconSimplifiedDisplayRule __r;
    return __r;
}
}
namespace __FMinimapIconConfigFunctions
{
UFUNCTION()
EEntityMinimapIconType __FMinimapIconConfig_GetIconType(const TDataObjectPtr<FMinimapIconConfig> &inout DataObject)
{
    int local_65 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IconType' from a null 'FMinimapIconConfig' DataObject!");
        }
        FMinimapIconConfig local_64;
        local_65 = int(local_64.IconType);
        return EEntityMinimapIconType(local_65);
    }
    return EEntityMinimapIconType(local_65);
}
UFUNCTION()
FVector2D __FMinimapIconConfig_GetIconSize(const TDataObjectPtr<FMinimapIconConfig> &inout DataObject)
{
    FVector2D __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IconSize' from a null 'FMinimapIconConfig' DataObject!");
        }
        FMinimapIconConfig local_64;
        return local_64.IconSize;
    }
    return __r;
}
UFUNCTION()
FMinimapIconDisplaySettings __FMinimapIconConfig_GetDisplaySettings(const TDataObjectPtr<FMinimapIconConfig> &inout DataObject)
{
    FMinimapIconDisplaySettings __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplaySettings' from a null 'FMinimapIconConfig' DataObject!");
        }
        FMinimapIconConfig local_64;
        return local_64.DisplaySettings;
    }
    return __r;
}
UFUNCTION()
int __FMinimapIconConfig_GetZOrder(const TDataObjectPtr<FMinimapIconConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ZOrder' from a null 'FMinimapIconConfig' DataObject!");
        }
        FMinimapIconConfig defaultValue;
        return defaultValue.ZOrder;
    }
    return DataObject.Get().ZOrder;
}
UFUNCTION()
bool __FMinimapIconConfig_GetbEnableSimplifiedDisplay(const TDataObjectPtr<FMinimapIconConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bEnableSimplifiedDisplay' from a null 'FMinimapIconConfig' DataObject!");
        }
        FMinimapIconConfig local_64;
        return local_64.bEnableSimplifiedDisplay;
    }
    return local_1;
}
UFUNCTION()
TDataObjectPtr<FMinimapIconSimplifiedDisplayRule> __FMinimapIconConfig_GetCustomSimplifiedDisplayRule(const TDataObjectPtr<FMinimapIconConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CustomSimplifiedDisplayRule' from a null 'FMinimapIconConfig' DataObject!");
        }
        FMinimapIconConfig local_64;
        return local_64.GetCustomSimplifiedDisplayRule();
    }
    return GetCustomSimplifiedDisplayRule();
}
UFUNCTION()
FMinimapIconConfig CastToFMinimapIconConfig(const TDataObjectPtr<FMinimapIconConfig> &inout DataObject)
{
    FMinimapIconConfig __r;
    return __r;
}
}
namespace __FMinimapIconConfig_CommonFunctions
{
UFUNCTION()
FPresentationIcon __FMinimapIconConfig_Common_GetIcon(const TDataObjectPtr<FMinimapIconConfig_Common> &inout DataObject)
{
    FPresentationIcon __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Icon' from a null 'FMinimapIconConfig_Common' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
bool __FMinimapIconConfig_Common_GetbCanSetGuideTarget(const TDataObjectPtr<FMinimapIconConfig_Common> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bCanSetGuideTarget' from a null 'FMinimapIconConfig_Common' DataObject!");
        }
        FMinimapIconConfig_Common local_132;
        return local_132.bCanSetGuideTarget;
    }
    return local_1;
}
UFUNCTION()
bool __FMinimapIconConfig_Common_GetbShowTooltip(const TDataObjectPtr<FMinimapIconConfig_Common> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bShowTooltip' from a null 'FMinimapIconConfig_Common' DataObject!");
        }
        FMinimapIconConfig_Common local_132;
        return local_132.bShowTooltip;
    }
    return local_1;
}
UFUNCTION()
TSoftClassPtr<UEUIUserWidget> __FMinimapIconConfig_Common_GetCustomTooltipWidget(const TDataObjectPtr<FMinimapIconConfig_Common> &inout DataObject)
{
    TSoftClassPtr<UEUIUserWidget> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CustomTooltipWidget' from a null 'FMinimapIconConfig_Common' DataObject!");
        }
        FMinimapIconConfig_Common local_132;
        return local_132.CustomTooltipWidget;
    }
    return __r;
}
UFUNCTION()
bool __FMinimapIconConfig_Common_GetbNeverHittestable(const TDataObjectPtr<FMinimapIconConfig_Common> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bNeverHittestable' from a null 'FMinimapIconConfig_Common' DataObject!");
        }
        FMinimapIconConfig_Common local_132;
        return local_132.bNeverHittestable;
    }
    return local_1;
}
UFUNCTION()
FMinimapIconConfig_Common CastToFMinimapIconConfig_Common(const TDataObjectPtr<FMinimapIconConfig_Common> &inout DataObject)
{
    FMinimapIconConfig_Common __r;
    return __r;
}
}
namespace __FMinimapIconConfig_PlayerFunctions
{
UFUNCTION()
FLinearColor __FMinimapIconConfig_Player_GetIconColor(const TDataObjectPtr<FMinimapIconConfig_Player> &inout DataObject)
{
    FLinearColor __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IconColor' from a null 'FMinimapIconConfig_Player' DataObject!");
        }
        FMinimapIconConfig_Player local_68;
        return local_68.IconColor;
    }
    return __r;
}
UFUNCTION()
FMinimapIconConfig_Player CastToFMinimapIconConfig_Player(const TDataObjectPtr<FMinimapIconConfig_Player> &inout DataObject)
{
    FMinimapIconConfig_Player __r;
    return __r;
}
}
namespace __FMinimapIconConfig_CustomFunctions
{
UFUNCTION()
TSoftClassPtr<UUserWidget> __FMinimapIconConfig_Custom_GetIconWidget(const TDataObjectPtr<FMinimapIconConfig_Custom> &inout DataObject)
{
    TSoftClassPtr<UUserWidget> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IconWidget' from a null 'FMinimapIconConfig_Custom' DataObject!");
        }
        FMinimapIconConfig_Custom local_74;
        return local_74.IconWidget;
    }
    return __r;
}
UFUNCTION()
FMinimapIconConfig_Custom CastToFMinimapIconConfig_Custom(const TDataObjectPtr<FMinimapIconConfig_Custom> &inout DataObject)
{
    FMinimapIconConfig_Custom __r;
    return __r;
}
}

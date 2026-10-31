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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplayIcon' from a null 'FMinimapIconSimplifiedDisplayRule' DataObject!");
        }
        FMinimapIconSimplifiedDisplayRule local_68;
        return local_68.DisplayIcon;
    }
    return DataObject.Get().DisplayIcon;
}
UFUNCTION()
EStretch __FMinimapIconSimplifiedDisplayRule_GetScaleType(const TDataObjectPtr<FMinimapIconSimplifiedDisplayRule> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ScaleType' from a null 'FMinimapIconSimplifiedDisplayRule' DataObject!");
        }
        FMinimapIconSimplifiedDisplayRule local_68;
        return local_68.ScaleType;
    }
    return DataObject.Get().ScaleType;
}
UFUNCTION()
EStretchDirection __FMinimapIconSimplifiedDisplayRule_GetStretchDirection(const TDataObjectPtr<FMinimapIconSimplifiedDisplayRule> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'StretchDirection' from a null 'FMinimapIconSimplifiedDisplayRule' DataObject!");
        }
        FMinimapIconSimplifiedDisplayRule local_68;
        return local_68.StretchDirection;
    }
    return DataObject.Get().StretchDirection;
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IconType' from a null 'FMinimapIconConfig' DataObject!");
        }
        FMinimapIconConfig local_64;
        return local_64.IconType;
    }
    return DataObject.Get().IconType;
}
UFUNCTION()
FVector2D __FMinimapIconConfig_GetIconSize(const TDataObjectPtr<FMinimapIconConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IconSize' from a null 'FMinimapIconConfig' DataObject!");
        }
        FMinimapIconConfig local_64;
        return local_64.IconSize;
    }
    return DataObject.Get().IconSize;
}
UFUNCTION()
FMinimapIconDisplaySettings __FMinimapIconConfig_GetDisplaySettings(const TDataObjectPtr<FMinimapIconConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisplaySettings' from a null 'FMinimapIconConfig' DataObject!");
        }
        FMinimapIconConfig local_64;
        return local_64.DisplaySettings;
    }
    return DataObject.Get().DisplaySettings;
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bEnableSimplifiedDisplay' from a null 'FMinimapIconConfig' DataObject!");
        }
        FMinimapIconConfig local_64;
        return local_64.bEnableSimplifiedDisplay;
    }
    return DataObject.Get().bEnableSimplifiedDisplay;
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
    return DataObject.Get().GetCustomSimplifiedDisplayRule();
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bCanSetGuideTarget' from a null 'FMinimapIconConfig_Common' DataObject!");
        }
        FMinimapIconConfig_Common local_132;
        return local_132.bCanSetGuideTarget;
    }
    return DataObject.Get().bCanSetGuideTarget;
}
UFUNCTION()
bool __FMinimapIconConfig_Common_GetbShowTooltip(const TDataObjectPtr<FMinimapIconConfig_Common> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bShowTooltip' from a null 'FMinimapIconConfig_Common' DataObject!");
        }
        FMinimapIconConfig_Common local_132;
        return local_132.bShowTooltip;
    }
    return DataObject.Get().bShowTooltip;
}
UFUNCTION()
TSoftClassPtr<UEUIUserWidget> __FMinimapIconConfig_Common_GetCustomTooltipWidget(const TDataObjectPtr<FMinimapIconConfig_Common> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CustomTooltipWidget' from a null 'FMinimapIconConfig_Common' DataObject!");
        }
        FMinimapIconConfig_Common local_132;
        return local_132.CustomTooltipWidget;
    }
    return DataObject.Get().CustomTooltipWidget;
}
UFUNCTION()
bool __FMinimapIconConfig_Common_GetbNeverHittestable(const TDataObjectPtr<FMinimapIconConfig_Common> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bNeverHittestable' from a null 'FMinimapIconConfig_Common' DataObject!");
        }
        FMinimapIconConfig_Common local_132;
        return local_132.bNeverHittestable;
    }
    return DataObject.Get().bNeverHittestable;
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IconColor' from a null 'FMinimapIconConfig_Player' DataObject!");
        }
        FMinimapIconConfig_Player local_68;
        return local_68.IconColor;
    }
    return DataObject.Get().IconColor;
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IconWidget' from a null 'FMinimapIconConfig_Custom' DataObject!");
        }
        FMinimapIconConfig_Custom local_74;
        return local_74.IconWidget;
    }
    return DataObject.Get().IconWidget;
}
UFUNCTION()
FMinimapIconConfig_Custom CastToFMinimapIconConfig_Custom(const TDataObjectPtr<FMinimapIconConfig_Custom> &inout DataObject)
{
    FMinimapIconConfig_Custom __r;
    return __r;
}
}

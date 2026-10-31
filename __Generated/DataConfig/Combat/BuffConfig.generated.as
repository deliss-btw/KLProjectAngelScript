namespace __FBuffPresentationConfigFunctions
{
UFUNCTION()
FSoftBrush __FBuffPresentationConfig_GetIconBrush(const TDataObjectPtr<FBuffPresentationConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IconBrush' from a null 'FBuffPresentationConfig' DataObject!");
        }
        FBuffPresentationConfig local_152;
        return local_152.IconBrush;
    }
    return __r;
}
UFUNCTION()
FText __FBuffPresentationConfig_GetBuffName(const TDataObjectPtr<FBuffPresentationConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BuffName' from a null 'FBuffPresentationConfig' DataObject!");
        }
        FBuffPresentationConfig local_152;
        return local_152.BuffName;
    }
    return __r;
}
UFUNCTION()
EBuffGoodOrBad __FBuffPresentationConfig_GetBuffGoodOrBad(const TDataObjectPtr<FBuffPresentationConfig> &inout DataObject)
{
    int local_153 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BuffGoodOrBad' from a null 'FBuffPresentationConfig' DataObject!");
        }
        FBuffPresentationConfig local_152;
        local_153 = int(local_152.BuffGoodOrBad);
        return EBuffGoodOrBad(local_153);
    }
    return EBuffGoodOrBad(local_153);
}
UFUNCTION()
bool __FBuffPresentationConfig_GetbLargeSideHint(const TDataObjectPtr<FBuffPresentationConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bLargeSideHint' from a null 'FBuffPresentationConfig' DataObject!");
        }
        FBuffPresentationConfig local_152;
        return local_152.bLargeSideHint;
    }
    return local_1;
}
UFUNCTION()
bool __FBuffPresentationConfig_GetbSmallSideHint(const TDataObjectPtr<FBuffPresentationConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bSmallSideHint' from a null 'FBuffPresentationConfig' DataObject!");
        }
        FBuffPresentationConfig local_152;
        return local_152.bSmallSideHint;
    }
    return local_1;
}
UFUNCTION()
bool __FBuffPresentationConfig_GetbTipsHint(const TDataObjectPtr<FBuffPresentationConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bTipsHint' from a null 'FBuffPresentationConfig' DataObject!");
        }
        FBuffPresentationConfig local_152;
        return local_152.bTipsHint;
    }
    return local_1;
}
UFUNCTION()
bool __FBuffPresentationConfig_GetbNeedHover(const TDataObjectPtr<FBuffPresentationConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bNeedHover' from a null 'FBuffPresentationConfig' DataObject!");
        }
        FBuffPresentationConfig local_152;
        return local_152.bNeedHover;
    }
    return local_1;
}
UFUNCTION()
bool __FBuffPresentationConfig_GetbNeedIcon(const TDataObjectPtr<FBuffPresentationConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bNeedIcon' from a null 'FBuffPresentationConfig' DataObject!");
        }
        FBuffPresentationConfig local_152;
        return local_152.bNeedIcon;
    }
    return local_1;
}
UFUNCTION()
FText __FBuffPresentationConfig_GetHintDescAdditional(const TDataObjectPtr<FBuffPresentationConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HintDescAdditional' from a null 'FBuffPresentationConfig' DataObject!");
        }
        FBuffPresentationConfig local_152;
        return local_152.HintDescAdditional;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FBuffPresentationConfig_GetHintDescAdditionalIcon(const TDataObjectPtr<FBuffPresentationConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HintDescAdditionalIcon' from a null 'FBuffPresentationConfig' DataObject!");
        }
        FBuffPresentationConfig local_152;
        return local_152.HintDescAdditionalIcon;
    }
    return __r;
}
UFUNCTION()
FArgText __FBuffPresentationConfig_GetDefaultAttributeDesc(const TDataObjectPtr<FBuffPresentationConfig> &inout DataObject)
{
    FArgText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultAttributeDesc' from a null 'FBuffPresentationConfig' DataObject!");
        }
        FBuffPresentationConfig local_152;
        return local_152.DefaultAttributeDesc;
    }
    return __r;
}
UFUNCTION()
FArgText __FBuffPresentationConfig_GetShortAttributeDesc(const TDataObjectPtr<FBuffPresentationConfig> &inout DataObject)
{
    FArgText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ShortAttributeDesc' from a null 'FBuffPresentationConfig' DataObject!");
        }
        FBuffPresentationConfig local_152;
        return local_152.ShortAttributeDesc;
    }
    return __r;
}
UFUNCTION()
FArgText __FBuffPresentationConfig_GetDefaultLargeHintTile(const TDataObjectPtr<FBuffPresentationConfig> &inout DataObject)
{
    FArgText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultLargeHintTile' from a null 'FBuffPresentationConfig' DataObject!");
        }
        FBuffPresentationConfig local_152;
        return local_152.DefaultLargeHintTile;
    }
    return __r;
}
UFUNCTION()
FArgText __FBuffPresentationConfig_GetDefaultSmallHintTile(const TDataObjectPtr<FBuffPresentationConfig> &inout DataObject)
{
    FArgText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultSmallHintTile' from a null 'FBuffPresentationConfig' DataObject!");
        }
        FBuffPresentationConfig local_152;
        return local_152.DefaultSmallHintTile;
    }
    return __r;
}
UFUNCTION()
float32 __FBuffPresentationConfig_GetHintLifeTimeOverride(const TDataObjectPtr<FBuffPresentationConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HintLifeTimeOverride' from a null 'FBuffPresentationConfig' DataObject!");
        }
        FBuffPresentationConfig defaultValue;
        return defaultValue.HintLifeTimeOverride;
    }
    return DataObject.Get().HintLifeTimeOverride;
}
UFUNCTION()
FBuffPresentationConfig CastToFBuffPresentationConfig(const TDataObjectPtr<FBuffPresentationConfig> &inout DataObject)
{
    FBuffPresentationConfig __r;
    return __r;
}
}

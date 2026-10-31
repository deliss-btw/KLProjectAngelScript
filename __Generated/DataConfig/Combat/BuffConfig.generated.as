namespace __FBuffPresentationConfigFunctions
{
UFUNCTION()
FSoftBrush __FBuffPresentationConfig_GetIconBrush(const TDataObjectPtr<FBuffPresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IconBrush' from a null 'FBuffPresentationConfig' DataObject!");
        }
        FBuffPresentationConfig local_152;
        return local_152.IconBrush;
    }
    return DataObject.Get().IconBrush;
}
UFUNCTION()
FText __FBuffPresentationConfig_GetBuffName(const TDataObjectPtr<FBuffPresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BuffName' from a null 'FBuffPresentationConfig' DataObject!");
        }
        FBuffPresentationConfig local_152;
        return local_152.BuffName;
    }
    return DataObject.Get().BuffName;
}
UFUNCTION()
EBuffGoodOrBad __FBuffPresentationConfig_GetBuffGoodOrBad(const TDataObjectPtr<FBuffPresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BuffGoodOrBad' from a null 'FBuffPresentationConfig' DataObject!");
        }
        FBuffPresentationConfig local_152;
        return local_152.BuffGoodOrBad;
    }
    return DataObject.Get().BuffGoodOrBad;
}
UFUNCTION()
bool __FBuffPresentationConfig_GetbLargeSideHint(const TDataObjectPtr<FBuffPresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bLargeSideHint' from a null 'FBuffPresentationConfig' DataObject!");
        }
        FBuffPresentationConfig local_152;
        return local_152.bLargeSideHint;
    }
    return DataObject.Get().bLargeSideHint;
}
UFUNCTION()
bool __FBuffPresentationConfig_GetbSmallSideHint(const TDataObjectPtr<FBuffPresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bSmallSideHint' from a null 'FBuffPresentationConfig' DataObject!");
        }
        FBuffPresentationConfig local_152;
        return local_152.bSmallSideHint;
    }
    return DataObject.Get().bSmallSideHint;
}
UFUNCTION()
bool __FBuffPresentationConfig_GetbTipsHint(const TDataObjectPtr<FBuffPresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bTipsHint' from a null 'FBuffPresentationConfig' DataObject!");
        }
        FBuffPresentationConfig local_152;
        return local_152.bTipsHint;
    }
    return DataObject.Get().bTipsHint;
}
UFUNCTION()
bool __FBuffPresentationConfig_GetbNeedHover(const TDataObjectPtr<FBuffPresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bNeedHover' from a null 'FBuffPresentationConfig' DataObject!");
        }
        FBuffPresentationConfig local_152;
        return local_152.bNeedHover;
    }
    return DataObject.Get().bNeedHover;
}
UFUNCTION()
bool __FBuffPresentationConfig_GetbNeedIcon(const TDataObjectPtr<FBuffPresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bNeedIcon' from a null 'FBuffPresentationConfig' DataObject!");
        }
        FBuffPresentationConfig local_152;
        return local_152.bNeedIcon;
    }
    return DataObject.Get().bNeedIcon;
}
UFUNCTION()
FText __FBuffPresentationConfig_GetHintDescAdditional(const TDataObjectPtr<FBuffPresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HintDescAdditional' from a null 'FBuffPresentationConfig' DataObject!");
        }
        FBuffPresentationConfig local_152;
        return local_152.HintDescAdditional;
    }
    return DataObject.Get().HintDescAdditional;
}
UFUNCTION()
FSoftBrush __FBuffPresentationConfig_GetHintDescAdditionalIcon(const TDataObjectPtr<FBuffPresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HintDescAdditionalIcon' from a null 'FBuffPresentationConfig' DataObject!");
        }
        FBuffPresentationConfig local_152;
        return local_152.HintDescAdditionalIcon;
    }
    return DataObject.Get().HintDescAdditionalIcon;
}
UFUNCTION()
FArgText __FBuffPresentationConfig_GetDefaultAttributeDesc(const TDataObjectPtr<FBuffPresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultAttributeDesc' from a null 'FBuffPresentationConfig' DataObject!");
        }
        FBuffPresentationConfig local_152;
        return local_152.DefaultAttributeDesc;
    }
    return DataObject.Get().DefaultAttributeDesc;
}
UFUNCTION()
FArgText __FBuffPresentationConfig_GetShortAttributeDesc(const TDataObjectPtr<FBuffPresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ShortAttributeDesc' from a null 'FBuffPresentationConfig' DataObject!");
        }
        FBuffPresentationConfig local_152;
        return local_152.ShortAttributeDesc;
    }
    return DataObject.Get().ShortAttributeDesc;
}
UFUNCTION()
FArgText __FBuffPresentationConfig_GetDefaultLargeHintTile(const TDataObjectPtr<FBuffPresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultLargeHintTile' from a null 'FBuffPresentationConfig' DataObject!");
        }
        FBuffPresentationConfig local_152;
        return local_152.DefaultLargeHintTile;
    }
    return DataObject.Get().DefaultLargeHintTile;
}
UFUNCTION()
FArgText __FBuffPresentationConfig_GetDefaultSmallHintTile(const TDataObjectPtr<FBuffPresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultSmallHintTile' from a null 'FBuffPresentationConfig' DataObject!");
        }
        FBuffPresentationConfig local_152;
        return local_152.DefaultSmallHintTile;
    }
    return DataObject.Get().DefaultSmallHintTile;
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

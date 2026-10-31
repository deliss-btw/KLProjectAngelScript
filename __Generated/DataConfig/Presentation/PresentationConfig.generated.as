namespace __FPresentationConfigFunctions
{
UFUNCTION()
FText __FPresentationConfig_GetName(const TDataObjectPtr<FPresentationConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Name' from a null 'FPresentationConfig' DataObject!");
        }
        FPresentationConfig local_102;
        return local_102.Name;
    }
    return __r;
}
UFUNCTION()
FGameplayTag __FPresentationConfig_GetSpotType(const TDataObjectPtr<FPresentationConfig> &inout DataObject)
{
    FGameplayTag __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SpotType' from a null 'FPresentationConfig' DataObject!");
        }
        FPresentationConfig local_102;
        return local_102.SpotType;
    }
    return __r;
}
UFUNCTION()
TMap<EPresentationIconType, FSoftBrush> __FPresentationConfig_GetIcons(const TDataObjectPtr<FPresentationConfig> &inout DataObject)
{
    TMap<EPresentationIconType, FSoftBrush> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Icons' from a null 'FPresentationConfig' DataObject!");
        }
        FPresentationConfig local_102;
        return local_102.Icons;
    }
    return __r;
}
UFUNCTION()
FText __FPresentationConfig_GetDescription(const TDataObjectPtr<FPresentationConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Description' from a null 'FPresentationConfig' DataObject!");
        }
        FPresentationConfig local_102;
        return local_102.Description;
    }
    return __r;
}
UFUNCTION()
FPresentationSpotOffset __FPresentationConfig_GetSpotOffset(const TDataObjectPtr<FPresentationConfig> &inout DataObject)
{
    FPresentationSpotOffset __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SpotOffset' from a null 'FPresentationConfig' DataObject!");
        }
        FPresentationConfig local_102;
        return local_102.SpotOffset;
    }
    return __r;
}
UFUNCTION()
bool __FPresentationConfig_GetbSupportMark(const TDataObjectPtr<FPresentationConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bSupportMark' from a null 'FPresentationConfig' DataObject!");
        }
        FPresentationConfig local_102;
        return local_102.bSupportMark;
    }
    return local_1;
}
UFUNCTION()
TMap<EPresentationIconType, FMargin> __FPresentationConfig_GetIconsPadding(const TDataObjectPtr<FPresentationConfig> &inout DataObject)
{
    TMap<EPresentationIconType, FMargin> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IconsPadding' from a null 'FPresentationConfig' DataObject!");
        }
        FPresentationConfig local_102;
        return local_102.IconsPadding;
    }
    return __r;
}
UFUNCTION()
TDataObjectPtr<FDropItemConfigBase> __FPresentationConfig_GetDropReward(const TDataObjectPtr<FPresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DropReward' from a null 'FPresentationConfig' DataObject!");
        }
        FPresentationConfig local_102;
        return local_102.GetDropReward();
    }
    return GetDropReward();
}
UFUNCTION()
FText __FPresentationConfig_GetTextReward(const TDataObjectPtr<FPresentationConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TextReward' from a null 'FPresentationConfig' DataObject!");
        }
        FPresentationConfig local_102;
        return local_102.TextReward;
    }
    return __r;
}
UFUNCTION()
FPresentationConfig CastToFPresentationConfig(const TDataObjectPtr<FPresentationConfig> &inout DataObject)
{
    FPresentationConfig __r;
    return __r;
}
}

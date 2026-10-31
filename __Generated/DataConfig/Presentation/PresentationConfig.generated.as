namespace __FPresentationConfigFunctions
{
UFUNCTION()
FText __FPresentationConfig_GetName(const TDataObjectPtr<FPresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Name' from a null 'FPresentationConfig' DataObject!");
        }
        FPresentationConfig local_102;
        return local_102.Name;
    }
    return DataObject.Get().Name;
}
UFUNCTION()
FGameplayTag __FPresentationConfig_GetSpotType(const TDataObjectPtr<FPresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SpotType' from a null 'FPresentationConfig' DataObject!");
        }
        FPresentationConfig local_102;
        return local_102.SpotType;
    }
    return DataObject.Get().SpotType;
}
UFUNCTION()
TMap<EPresentationIconType, FSoftBrush> __FPresentationConfig_GetIcons(const TDataObjectPtr<FPresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Icons' from a null 'FPresentationConfig' DataObject!");
        }
        FPresentationConfig local_102;
        return local_102.Icons;
    }
    return DataObject.Get().Icons;
}
UFUNCTION()
FText __FPresentationConfig_GetDescription(const TDataObjectPtr<FPresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Description' from a null 'FPresentationConfig' DataObject!");
        }
        FPresentationConfig local_102;
        return local_102.Description;
    }
    return DataObject.Get().Description;
}
UFUNCTION()
FPresentationSpotOffset __FPresentationConfig_GetSpotOffset(const TDataObjectPtr<FPresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SpotOffset' from a null 'FPresentationConfig' DataObject!");
        }
        FPresentationConfig local_102;
        return local_102.SpotOffset;
    }
    return DataObject.Get().SpotOffset;
}
UFUNCTION()
bool __FPresentationConfig_GetbSupportMark(const TDataObjectPtr<FPresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bSupportMark' from a null 'FPresentationConfig' DataObject!");
        }
        FPresentationConfig local_102;
        return local_102.bSupportMark;
    }
    return DataObject.Get().bSupportMark;
}
UFUNCTION()
TMap<EPresentationIconType, FMargin> __FPresentationConfig_GetIconsPadding(const TDataObjectPtr<FPresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IconsPadding' from a null 'FPresentationConfig' DataObject!");
        }
        FPresentationConfig local_102;
        return local_102.IconsPadding;
    }
    return DataObject.Get().IconsPadding;
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
    return DataObject.Get().GetDropReward();
}
UFUNCTION()
FText __FPresentationConfig_GetTextReward(const TDataObjectPtr<FPresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TextReward' from a null 'FPresentationConfig' DataObject!");
        }
        FPresentationConfig local_102;
        return local_102.TextReward;
    }
    return DataObject.Get().TextReward;
}
UFUNCTION()
FPresentationConfig CastToFPresentationConfig(const TDataObjectPtr<FPresentationConfig> &inout DataObject)
{
    FPresentationConfig __r;
    return __r;
}
}

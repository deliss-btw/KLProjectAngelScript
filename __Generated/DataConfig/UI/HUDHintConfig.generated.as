namespace __FSideHintConfigFunctions
{
UFUNCTION()
EHUDSideHintType __FSideHintConfig_GetHUDSideHintType(const TDataObjectPtr<FSideHintConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HUDSideHintType' from a null 'FSideHintConfig' DataObject!");
        }
        FSideHintConfig local_28;
        return local_28.HUDSideHintType;
    }
    return DataObject.Get().HUDSideHintType;
}
UFUNCTION()
UTexture2D __FSideHintConfig_GetIcon(const TDataObjectPtr<FSideHintConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Icon' from a null 'FSideHintConfig' DataObject!");
        }
        FSideHintConfig local_28;
        return local_28.Icon;
    }
    UTexture2D local_30;
    return local_30;
}
UFUNCTION()
FText __FSideHintConfig_GetTitle(const TDataObjectPtr<FSideHintConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Title' from a null 'FSideHintConfig' DataObject!");
        }
        FSideHintConfig local_28;
        return local_28.Title;
    }
    return DataObject.Get().Title;
}
UFUNCTION()
TArray<FCombinedText> __FSideHintConfig_GetCombineText(const TDataObjectPtr<FSideHintConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CombineText' from a null 'FSideHintConfig' DataObject!");
        }
        FSideHintConfig local_28;
        return local_28.CombineText;
    }
    return DataObject.Get().CombineText;
}
UFUNCTION()
float32 __FSideHintConfig_GetShowHintTime(const TDataObjectPtr<FSideHintConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ShowHintTime' from a null 'FSideHintConfig' DataObject!");
        }
        FSideHintConfig defaultValue;
        return defaultValue.ShowHintTime;
    }
    return DataObject.Get().ShowHintTime;
}
UFUNCTION()
FSideHintConfig CastToFSideHintConfig(const TDataObjectPtr<FSideHintConfig> &inout DataObject)
{
    FSideHintConfig __r;
    return __r;
}
}

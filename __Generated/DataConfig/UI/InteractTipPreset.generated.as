namespace __FInteractTipPresetFunctions
{
UFUNCTION()
FSoftBrush __FInteractTipPreset_GetInteractTipHUDIcon(const TDataObjectPtr<FInteractTipPreset> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InteractTipHUDIcon' from a null 'FInteractTipPreset' DataObject!");
        }
        FInteractTipPreset local_68;
        return local_68.InteractTipHUDIcon;
    }
    return DataObject.Get().InteractTipHUDIcon;
}
UFUNCTION()
FVector2D __FInteractTipPreset_GetInteractTipHUDIconUIOffset(const TDataObjectPtr<FInteractTipPreset> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InteractTipHUDIconUIOffset' from a null 'FInteractTipPreset' DataObject!");
        }
        FInteractTipPreset local_68;
        return local_68.InteractTipHUDIconUIOffset;
    }
    return DataObject.Get().InteractTipHUDIconUIOffset;
}
UFUNCTION()
FInteractTipParam __FInteractTipPreset_GetInteractTipParam(const TDataObjectPtr<FInteractTipPreset> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InteractTipParam' from a null 'FInteractTipPreset' DataObject!");
        }
        FInteractTipPreset local_68;
        return local_68.InteractTipParam;
    }
    return DataObject.Get().InteractTipParam;
}
UFUNCTION()
FInteractTipPreset CastToFInteractTipPreset(const TDataObjectPtr<FInteractTipPreset> &inout DataObject)
{
    FInteractTipPreset __r;
    return __r;
}
}

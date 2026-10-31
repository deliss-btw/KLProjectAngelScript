namespace __FInteractionPointTypeConfigFunctions
{
UFUNCTION()
TArray<TSubclassOf<UInteractionBehaviorBase>> __FInteractionPointTypeConfig_GetBehaviors(const TDataObjectPtr<FInteractionPointTypeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Behaviors' from a null 'FInteractionPointTypeConfig' DataObject!");
        }
        FInteractionPointTypeConfig local_20;
        return local_20.Behaviors;
    }
    return DataObject.Get().Behaviors;
}
UFUNCTION()
EInteractMode __FInteractionPointTypeConfig_GetInteractMode(const TDataObjectPtr<FInteractionPointTypeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InteractMode' from a null 'FInteractionPointTypeConfig' DataObject!");
        }
        FInteractionPointTypeConfig local_20;
        return local_20.InteractMode;
    }
    return DataObject.Get().InteractMode;
}
UFUNCTION()
FInteractionPointTypeConfig CastToFInteractionPointTypeConfig(const TDataObjectPtr<FInteractionPointTypeConfig> &inout DataObject)
{
    FInteractionPointTypeConfig __r;
    return __r;
}
}

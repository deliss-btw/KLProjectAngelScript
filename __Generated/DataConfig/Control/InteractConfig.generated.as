namespace __FInteractionPointTypeConfigFunctions
{
UFUNCTION()
TArray<TSubclassOf<UInteractionBehaviorBase>> __FInteractionPointTypeConfig_GetBehaviors(const TDataObjectPtr<FInteractionPointTypeConfig> &inout DataObject)
{
    TArray<TSubclassOf<UInteractionBehaviorBase>> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Behaviors' from a null 'FInteractionPointTypeConfig' DataObject!");
        }
        FInteractionPointTypeConfig local_20;
        return local_20.Behaviors;
    }
    return __r;
}
UFUNCTION()
EInteractMode __FInteractionPointTypeConfig_GetInteractMode(const TDataObjectPtr<FInteractionPointTypeConfig> &inout DataObject)
{
    int local_21 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InteractMode' from a null 'FInteractionPointTypeConfig' DataObject!");
        }
        FInteractionPointTypeConfig local_20;
        local_21 = int(local_20.InteractMode);
        return EInteractMode(local_21);
    }
    return EInteractMode(local_21);
}
UFUNCTION()
FInteractionPointTypeConfig CastToFInteractionPointTypeConfig(const TDataObjectPtr<FInteractionPointTypeConfig> &inout DataObject)
{
    FInteractionPointTypeConfig __r;
    return __r;
}
}

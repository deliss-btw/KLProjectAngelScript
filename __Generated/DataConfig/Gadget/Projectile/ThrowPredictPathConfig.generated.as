namespace __FThrowPredictPathConfigFunctions
{
UFUNCTION()
float32 __FThrowPredictPathConfig_GetMaxPredictTime(const TDataObjectPtr<FThrowPredictPathConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaxPredictTime' from a null 'FThrowPredictPathConfig' DataObject!");
        }
        FThrowPredictPathConfig defaultValue;
        return defaultValue.MaxPredictTime;
    }
    return DataObject.Get().MaxPredictTime;
}
UFUNCTION()
FFXConfig __FThrowPredictPathConfig_GetPredictPathFXConfig(const TDataObjectPtr<FThrowPredictPathConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PredictPathFXConfig' from a null 'FThrowPredictPathConfig' DataObject!");
        }
        FThrowPredictPathConfig local_166;
        return local_166.PredictPathFXConfig;
    }
    return DataObject.Get().PredictPathFXConfig;
}
UFUNCTION()
FRuntimeFloatCurve __FThrowPredictPathConfig_GetThrowPitchMappingCurve(const TDataObjectPtr<FThrowPredictPathConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ThrowPitchMappingCurve' from a null 'FThrowPredictPathConfig' DataObject!");
        }
        FThrowPredictPathConfig local_166;
        return local_166.ThrowPitchMappingCurve;
    }
    return DataObject.Get().ThrowPitchMappingCurve;
}
UFUNCTION()
FThrowPredictPathConfig CastToFThrowPredictPathConfig(const TDataObjectPtr<FThrowPredictPathConfig> &inout DataObject)
{
    FThrowPredictPathConfig __r;
    return __r;
}
}

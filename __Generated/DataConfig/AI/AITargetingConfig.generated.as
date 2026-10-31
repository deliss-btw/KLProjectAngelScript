namespace __FAILockPointRatingConfigFunctions
{
UFUNCTION()
float32 __FAILockPointRatingConfig_GetMaxZDistance(const TDataObjectPtr<FAILockPointRatingConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaxZDistance' from a null 'FAILockPointRatingConfig' DataObject!");
        }
        FAILockPointRatingConfig defaultValue;
        return defaultValue.MaxZDistance;
    }
    return DataObject.Get().MaxZDistance;
}
UFUNCTION()
FRuntimeFloatCurve __FAILockPointRatingConfig_GetScoreCurveByDistanceXY(const TDataObjectPtr<FAILockPointRatingConfig> &inout DataObject)
{
    FRuntimeFloatCurve __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ScoreCurveByDistanceXY' from a null 'FAILockPointRatingConfig' DataObject!");
        }
        FAILockPointRatingConfig local_86;
        return local_86.ScoreCurveByDistanceXY;
    }
    return __r;
}
UFUNCTION()
FRuntimeFloatCurve __FAILockPointRatingConfig_GetScoreCurveByDistanceZ(const TDataObjectPtr<FAILockPointRatingConfig> &inout DataObject)
{
    FRuntimeFloatCurve __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ScoreCurveByDistanceZ' from a null 'FAILockPointRatingConfig' DataObject!");
        }
        FAILockPointRatingConfig local_86;
        return local_86.ScoreCurveByDistanceZ;
    }
    return __r;
}
UFUNCTION()
float32 __FAILockPointRatingConfig_GetWeightXY(const TDataObjectPtr<FAILockPointRatingConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeightXY' from a null 'FAILockPointRatingConfig' DataObject!");
        }
        FAILockPointRatingConfig defaultValue;
        return defaultValue.WeightXY;
    }
    return DataObject.Get().WeightXY;
}
UFUNCTION()
float32 __FAILockPointRatingConfig_GetWeightZ(const TDataObjectPtr<FAILockPointRatingConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeightZ' from a null 'FAILockPointRatingConfig' DataObject!");
        }
        FAILockPointRatingConfig defaultValue;
        return defaultValue.WeightZ;
    }
    return DataObject.Get().WeightZ;
}
UFUNCTION()
FAILockPointRatingConfig CastToFAILockPointRatingConfig(const TDataObjectPtr<FAILockPointRatingConfig> &inout DataObject)
{
    FAILockPointRatingConfig __r;
    return __r;
}
}
namespace __FAITargetingConfigFunctions
{
UFUNCTION()
TDataObjectPtr<FAITargetingQueryConfig> __FAITargetingConfig_GetDefaultTargetingQueryConfig(const TDataObjectPtr<FAITargetingConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultTargetingQueryConfig' from a null 'FAITargetingConfig' DataObject!");
        }
        FAITargetingConfig local_62;
        return local_62.GetDefaultTargetingQueryConfig();
    }
    return GetDefaultTargetingQueryConfig();
}
UFUNCTION()
TDataObjectPtr<FAILockPointRatingConfig> __FAITargetingConfig_GetLockPointRatingConfig(const TDataObjectPtr<FAITargetingConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LockPointRatingConfig' from a null 'FAITargetingConfig' DataObject!");
        }
        FAITargetingConfig local_62;
        return local_62.GetLockPointRatingConfig();
    }
    return GetLockPointRatingConfig();
}
UFUNCTION()
FAITargetingConfig CastToFAITargetingConfig(const TDataObjectPtr<FAITargetingConfig> &inout DataObject)
{
    FAITargetingConfig __r;
    return __r;
}
}

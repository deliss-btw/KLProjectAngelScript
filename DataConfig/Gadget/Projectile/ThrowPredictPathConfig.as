

struct FThrowPredictPathConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    float32 MaxPredictTime = 3.0f;
    UPROPERTY()
    FFXConfig PredictPathFXConfig;
    UPROPERTY()
    FRuntimeFloatCurve ThrowPitchMappingCurve = FRuntimeCurveUtils::CreateLinear(-90.0f, -90.0f, 90.0f, 90.0f);


}


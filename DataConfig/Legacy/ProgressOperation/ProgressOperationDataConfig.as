

struct FProgressOperationConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    EProgressOperationBaseType ProgressOperationBaseType = EProgressOperationBaseType(0);
    UPROPERTY()
    TSubclassOf<UProgressOperationBase> Operation = UProgressOperation_SimpleProgress;
    UPROPERTY()
    float32 ProgressMaxValue = 100.0f;
    UPROPERTY()
    bool bAutoSuccessOnProgressDone = true;
    UPROPERTY()
    FFPTime OperationTotalTime = FFPTime(10.0);
    UPROPERTY()
    float32 InitProgressIncreaseSpeed = 10.0f;
    UPROPERTY()
    float32 RangeStartRatio = 0.0f;
    UPROPERTY()
    float32 RangeEndRatio = 1.0f;
    UPROPERTY()
    bool bInputAcceptDetermin = false;
    UPROPERTY()
    FRuntimeFloatCurve InputPushProgressDifficulty = FRuntimeCurveUtils::CreateLinear(0.0f, 0.0f, 1.0f, 1.0f);
    UPROPERTY()
    FRuntimeFloatCurve ReversePushProgressForceByTime = FRuntimeCurveUtils::CreateLinear(0.0f, 0.0f, 10.0f, -100.0f);
    UPROPERTY()
    FRuntimeFloatCurve ReversePushProgressForceByPos = FRuntimeCurveUtils::CreateLinear(0.0f, 0.0f, 1000.0f, -100.0f);
    UPROPERTY()
    float32 InitProgressValue = 0.0f;
    UPROPERTY()
    int MaxOperationMemberNum = 1;
    UPROPERTY()
    TMap<EProgressOperationActionTime, FProgressOperationActionArray> Actions;
    UPROPERTY()
    TArray<FProgressOperationInputAction> InputActions;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> UISoftWidgetClass;


}


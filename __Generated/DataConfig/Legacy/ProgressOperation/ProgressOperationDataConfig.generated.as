namespace __FProgressOperationConfigFunctions
{
UFUNCTION()
EProgressOperationBaseType __FProgressOperationConfig_GetProgressOperationBaseType(const TDataObjectPtr<FProgressOperationConfig> &inout DataObject)
{
    int local_165 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ProgressOperationBaseType' from a null 'FProgressOperationConfig' DataObject!");
        }
        FProgressOperationConfig local_164;
        local_165 = int(local_164.ProgressOperationBaseType);
        return EProgressOperationBaseType(local_165);
    }
    return EProgressOperationBaseType(local_165);
}
UFUNCTION()
TSubclassOf<UProgressOperationBase> __FProgressOperationConfig_GetOperation(const TDataObjectPtr<FProgressOperationConfig> &inout DataObject)
{
    TSubclassOf<UProgressOperationBase> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Operation' from a null 'FProgressOperationConfig' DataObject!");
        }
        FProgressOperationConfig local_164;
        return local_164.Operation;
    }
    return __r;
}
UFUNCTION()
float32 __FProgressOperationConfig_GetProgressMaxValue(const TDataObjectPtr<FProgressOperationConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ProgressMaxValue' from a null 'FProgressOperationConfig' DataObject!");
        }
        FProgressOperationConfig defaultValue;
        return defaultValue.ProgressMaxValue;
    }
    return DataObject.Get().ProgressMaxValue;
}
UFUNCTION()
bool __FProgressOperationConfig_GetbAutoSuccessOnProgressDone(const TDataObjectPtr<FProgressOperationConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bAutoSuccessOnProgressDone' from a null 'FProgressOperationConfig' DataObject!");
        }
        FProgressOperationConfig local_164;
        return local_164.bAutoSuccessOnProgressDone;
    }
    return local_1;
}
UFUNCTION()
FFPTime __FProgressOperationConfig_GetOperationTotalTime(const TDataObjectPtr<FProgressOperationConfig> &inout DataObject)
{
    FFPTime __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'OperationTotalTime' from a null 'FProgressOperationConfig' DataObject!");
        }
        FProgressOperationConfig local_164;
        return local_164.OperationTotalTime;
    }
    return __r;
}
UFUNCTION()
float32 __FProgressOperationConfig_GetInitProgressIncreaseSpeed(const TDataObjectPtr<FProgressOperationConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InitProgressIncreaseSpeed' from a null 'FProgressOperationConfig' DataObject!");
        }
        FProgressOperationConfig defaultValue;
        return defaultValue.InitProgressIncreaseSpeed;
    }
    return DataObject.Get().InitProgressIncreaseSpeed;
}
UFUNCTION()
float32 __FProgressOperationConfig_GetRangeStartRatio(const TDataObjectPtr<FProgressOperationConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RangeStartRatio' from a null 'FProgressOperationConfig' DataObject!");
        }
        FProgressOperationConfig defaultValue;
        return defaultValue.RangeStartRatio;
    }
    return DataObject.Get().RangeStartRatio;
}
UFUNCTION()
float32 __FProgressOperationConfig_GetRangeEndRatio(const TDataObjectPtr<FProgressOperationConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RangeEndRatio' from a null 'FProgressOperationConfig' DataObject!");
        }
        FProgressOperationConfig defaultValue;
        return defaultValue.RangeEndRatio;
    }
    return DataObject.Get().RangeEndRatio;
}
UFUNCTION()
bool __FProgressOperationConfig_GetbInputAcceptDetermin(const TDataObjectPtr<FProgressOperationConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bInputAcceptDetermin' from a null 'FProgressOperationConfig' DataObject!");
        }
        FProgressOperationConfig local_164;
        return local_164.bInputAcceptDetermin;
    }
    return local_1;
}
UFUNCTION()
FRuntimeFloatCurve __FProgressOperationConfig_GetInputPushProgressDifficulty(const TDataObjectPtr<FProgressOperationConfig> &inout DataObject)
{
    FRuntimeFloatCurve __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InputPushProgressDifficulty' from a null 'FProgressOperationConfig' DataObject!");
        }
        FProgressOperationConfig local_164;
        return local_164.InputPushProgressDifficulty;
    }
    return __r;
}
UFUNCTION()
FRuntimeFloatCurve __FProgressOperationConfig_GetReversePushProgressForceByTime(const TDataObjectPtr<FProgressOperationConfig> &inout DataObject)
{
    FRuntimeFloatCurve __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ReversePushProgressForceByTime' from a null 'FProgressOperationConfig' DataObject!");
        }
        FProgressOperationConfig local_164;
        return local_164.ReversePushProgressForceByTime;
    }
    return __r;
}
UFUNCTION()
FRuntimeFloatCurve __FProgressOperationConfig_GetReversePushProgressForceByPos(const TDataObjectPtr<FProgressOperationConfig> &inout DataObject)
{
    FRuntimeFloatCurve __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ReversePushProgressForceByPos' from a null 'FProgressOperationConfig' DataObject!");
        }
        FProgressOperationConfig local_164;
        return local_164.ReversePushProgressForceByPos;
    }
    return __r;
}
UFUNCTION()
float32 __FProgressOperationConfig_GetInitProgressValue(const TDataObjectPtr<FProgressOperationConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InitProgressValue' from a null 'FProgressOperationConfig' DataObject!");
        }
        FProgressOperationConfig defaultValue;
        return defaultValue.InitProgressValue;
    }
    return DataObject.Get().InitProgressValue;
}
UFUNCTION()
int __FProgressOperationConfig_GetMaxOperationMemberNum(const TDataObjectPtr<FProgressOperationConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaxOperationMemberNum' from a null 'FProgressOperationConfig' DataObject!");
        }
        FProgressOperationConfig defaultValue;
        return defaultValue.MaxOperationMemberNum;
    }
    return DataObject.Get().MaxOperationMemberNum;
}
UFUNCTION()
TMap<EProgressOperationActionTime, FProgressOperationActionArray> __FProgressOperationConfig_GetActions(const TDataObjectPtr<FProgressOperationConfig> &inout DataObject)
{
    TMap<EProgressOperationActionTime, FProgressOperationActionArray> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Actions' from a null 'FProgressOperationConfig' DataObject!");
        }
        FProgressOperationConfig local_164;
        return local_164.Actions;
    }
    return __r;
}
UFUNCTION()
TArray<FProgressOperationInputAction> __FProgressOperationConfig_GetInputActions(const TDataObjectPtr<FProgressOperationConfig> &inout DataObject)
{
    TArray<FProgressOperationInputAction> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InputActions' from a null 'FProgressOperationConfig' DataObject!");
        }
        FProgressOperationConfig local_164;
        return local_164.InputActions;
    }
    return __r;
}
UFUNCTION()
TSoftClassPtr<UEUIUserWidget> __FProgressOperationConfig_GetUISoftWidgetClass(const TDataObjectPtr<FProgressOperationConfig> &inout DataObject)
{
    TSoftClassPtr<UEUIUserWidget> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UISoftWidgetClass' from a null 'FProgressOperationConfig' DataObject!");
        }
        FProgressOperationConfig local_164;
        return local_164.UISoftWidgetClass;
    }
    return __r;
}
UFUNCTION()
FProgressOperationConfig CastToFProgressOperationConfig(const TDataObjectPtr<FProgressOperationConfig> &inout DataObject)
{
    FProgressOperationConfig __r;
    return __r;
}
}

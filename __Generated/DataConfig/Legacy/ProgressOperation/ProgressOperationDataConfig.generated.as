namespace __FProgressOperationConfigFunctions
{
UFUNCTION()
EProgressOperationBaseType __FProgressOperationConfig_GetProgressOperationBaseType(const TDataObjectPtr<FProgressOperationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ProgressOperationBaseType' from a null 'FProgressOperationConfig' DataObject!");
        }
        FProgressOperationConfig local_164;
        return local_164.ProgressOperationBaseType;
    }
    return DataObject.Get().ProgressOperationBaseType;
}
UFUNCTION()
TSubclassOf<UProgressOperationBase> __FProgressOperationConfig_GetOperation(const TDataObjectPtr<FProgressOperationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Operation' from a null 'FProgressOperationConfig' DataObject!");
        }
        FProgressOperationConfig local_164;
        return local_164.Operation;
    }
    return DataObject.Get().Operation;
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bAutoSuccessOnProgressDone' from a null 'FProgressOperationConfig' DataObject!");
        }
        FProgressOperationConfig local_164;
        return local_164.bAutoSuccessOnProgressDone;
    }
    return DataObject.Get().bAutoSuccessOnProgressDone;
}
UFUNCTION()
FFPTime __FProgressOperationConfig_GetOperationTotalTime(const TDataObjectPtr<FProgressOperationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'OperationTotalTime' from a null 'FProgressOperationConfig' DataObject!");
        }
        FProgressOperationConfig local_164;
        return local_164.OperationTotalTime;
    }
    return DataObject.Get().OperationTotalTime;
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bInputAcceptDetermin' from a null 'FProgressOperationConfig' DataObject!");
        }
        FProgressOperationConfig local_164;
        return local_164.bInputAcceptDetermin;
    }
    return DataObject.Get().bInputAcceptDetermin;
}
UFUNCTION()
FRuntimeFloatCurve __FProgressOperationConfig_GetInputPushProgressDifficulty(const TDataObjectPtr<FProgressOperationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InputPushProgressDifficulty' from a null 'FProgressOperationConfig' DataObject!");
        }
        FProgressOperationConfig local_164;
        return local_164.InputPushProgressDifficulty;
    }
    return DataObject.Get().InputPushProgressDifficulty;
}
UFUNCTION()
FRuntimeFloatCurve __FProgressOperationConfig_GetReversePushProgressForceByTime(const TDataObjectPtr<FProgressOperationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ReversePushProgressForceByTime' from a null 'FProgressOperationConfig' DataObject!");
        }
        FProgressOperationConfig local_164;
        return local_164.ReversePushProgressForceByTime;
    }
    return DataObject.Get().ReversePushProgressForceByTime;
}
UFUNCTION()
FRuntimeFloatCurve __FProgressOperationConfig_GetReversePushProgressForceByPos(const TDataObjectPtr<FProgressOperationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ReversePushProgressForceByPos' from a null 'FProgressOperationConfig' DataObject!");
        }
        FProgressOperationConfig local_164;
        return local_164.ReversePushProgressForceByPos;
    }
    return DataObject.Get().ReversePushProgressForceByPos;
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Actions' from a null 'FProgressOperationConfig' DataObject!");
        }
        FProgressOperationConfig local_164;
        return local_164.Actions;
    }
    return DataObject.Get().Actions;
}
UFUNCTION()
TArray<FProgressOperationInputAction> __FProgressOperationConfig_GetInputActions(const TDataObjectPtr<FProgressOperationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InputActions' from a null 'FProgressOperationConfig' DataObject!");
        }
        FProgressOperationConfig local_164;
        return local_164.InputActions;
    }
    return DataObject.Get().InputActions;
}
UFUNCTION()
TSoftClassPtr<UEUIUserWidget> __FProgressOperationConfig_GetUISoftWidgetClass(const TDataObjectPtr<FProgressOperationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UISoftWidgetClass' from a null 'FProgressOperationConfig' DataObject!");
        }
        FProgressOperationConfig local_164;
        return local_164.UISoftWidgetClass;
    }
    return DataObject.Get().UISoftWidgetClass;
}
UFUNCTION()
FProgressOperationConfig CastToFProgressOperationConfig(const TDataObjectPtr<FProgressOperationConfig> &inout DataObject)
{
    FProgressOperationConfig __r;
    return __r;
}
}

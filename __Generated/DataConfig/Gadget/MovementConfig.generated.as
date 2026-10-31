namespace __FTrackMovementConfigDataFunctions
{
UFUNCTION()
uint8 __FTrackMovementConfigData_GetTrackMovementAxis(const TDataObjectPtr<FTrackMovementConfigData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TrackMovementAxis' from a null 'FTrackMovementConfigData' DataObject!");
        }
        FTrackMovementConfigData local_96;
        return int(local_96.TrackMovementAxis);
    }
    return DataObject.Get().TrackMovementAxis;
}
UFUNCTION()
ETrackSpeedMode __FTrackMovementConfigData_GetMoveSpeedMode(const TDataObjectPtr<FTrackMovementConfigData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MoveSpeedMode' from a null 'FTrackMovementConfigData' DataObject!");
        }
        FTrackMovementConfigData local_96;
        return local_96.MoveSpeedMode;
    }
    return DataObject.Get().MoveSpeedMode;
}
UFUNCTION()
float32 __FTrackMovementConfigData_GetConstMoveSpeed(const TDataObjectPtr<FTrackMovementConfigData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ConstMoveSpeed' from a null 'FTrackMovementConfigData' DataObject!");
        }
        FTrackMovementConfigData defaultValue;
        return defaultValue.ConstMoveSpeed;
    }
    return DataObject.Get().ConstMoveSpeed;
}
UFUNCTION()
FTrackTwoTurnPointCurve __FTrackMovementConfigData_GetTwoTurnPointMoveSpeedCurve(const TDataObjectPtr<FTrackMovementConfigData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TwoTurnPointMoveSpeedCurve' from a null 'FTrackMovementConfigData' DataObject!");
        }
        FTrackMovementConfigData local_96;
        return local_96.TwoTurnPointMoveSpeedCurve;
    }
    return DataObject.Get().TwoTurnPointMoveSpeedCurve;
}
UFUNCTION()
FRuntimeFloatCurve __FTrackMovementConfigData_GetCustomMoveSpeedCurve(const TDataObjectPtr<FTrackMovementConfigData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CustomMoveSpeedCurve' from a null 'FTrackMovementConfigData' DataObject!");
        }
        FTrackMovementConfigData local_96;
        return local_96.CustomMoveSpeedCurve;
    }
    return DataObject.Get().CustomMoveSpeedCurve;
}
UFUNCTION()
ETrackSpeedMode __FTrackMovementConfigData_GetTurnSpeedMode(const TDataObjectPtr<FTrackMovementConfigData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TurnSpeedMode' from a null 'FTrackMovementConfigData' DataObject!");
        }
        FTrackMovementConfigData local_96;
        return local_96.TurnSpeedMode;
    }
    return DataObject.Get().TurnSpeedMode;
}
UFUNCTION()
float32 __FTrackMovementConfigData_GetConstTurnSpeed(const TDataObjectPtr<FTrackMovementConfigData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ConstTurnSpeed' from a null 'FTrackMovementConfigData' DataObject!");
        }
        FTrackMovementConfigData defaultValue;
        return defaultValue.ConstTurnSpeed;
    }
    return DataObject.Get().ConstTurnSpeed;
}
UFUNCTION()
FTrackTwoTurnPointCurve __FTrackMovementConfigData_GetTwoTurnPointTurnSpeedCurve(const TDataObjectPtr<FTrackMovementConfigData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TwoTurnPointTurnSpeedCurve' from a null 'FTrackMovementConfigData' DataObject!");
        }
        FTrackMovementConfigData local_96;
        return local_96.TwoTurnPointTurnSpeedCurve;
    }
    return DataObject.Get().TwoTurnPointTurnSpeedCurve;
}
UFUNCTION()
FRuntimeFloatCurve __FTrackMovementConfigData_GetCustomTurnSpeedCurve(const TDataObjectPtr<FTrackMovementConfigData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CustomTurnSpeedCurve' from a null 'FTrackMovementConfigData' DataObject!");
        }
        FTrackMovementConfigData local_96;
        return local_96.CustomTurnSpeedCurve;
    }
    return DataObject.Get().CustomTurnSpeedCurve;
}
UFUNCTION()
float32 __FTrackMovementConfigData_GetCloseDistance(const TDataObjectPtr<FTrackMovementConfigData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CloseDistance' from a null 'FTrackMovementConfigData' DataObject!");
        }
        FTrackMovementConfigData defaultValue;
        return defaultValue.CloseDistance;
    }
    return DataObject.Get().CloseDistance;
}
UFUNCTION()
bool __FTrackMovementConfigData_GetbStopMoveAfterApproch(const TDataObjectPtr<FTrackMovementConfigData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bStopMoveAfterApproch' from a null 'FTrackMovementConfigData' DataObject!");
        }
        FTrackMovementConfigData local_96;
        return local_96.bStopMoveAfterApproch;
    }
    return DataObject.Get().bStopMoveAfterApproch;
}
UFUNCTION()
bool __FTrackMovementConfigData_GetbContinueTrackEvenSuccess(const TDataObjectPtr<FTrackMovementConfigData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bContinueTrackEvenSuccess' from a null 'FTrackMovementConfigData' DataObject!");
        }
        FTrackMovementConfigData local_96;
        return local_96.bContinueTrackEvenSuccess;
    }
    return DataObject.Get().bContinueTrackEvenSuccess;
}
UFUNCTION()
bool __FTrackMovementConfigData_GetbKeepTransformRotation(const TDataObjectPtr<FTrackMovementConfigData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bKeepTransformRotation' from a null 'FTrackMovementConfigData' DataObject!");
        }
        FTrackMovementConfigData local_96;
        return local_96.bKeepTransformRotation;
    }
    return DataObject.Get().bKeepTransformRotation;
}
UFUNCTION()
FTrackMovementConfigData CastToFTrackMovementConfigData(const TDataObjectPtr<FTrackMovementConfigData> &inout DataObject)
{
    FTrackMovementConfigData __r;
    return __r;
}
}

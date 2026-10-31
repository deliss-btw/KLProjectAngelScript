namespace __FDTCharacterMovementConfigFunctions
{
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetBaseNaviWalkMoveSpeed(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BaseNaviWalkMoveSpeed' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.BaseNaviWalkMoveSpeed;
    }
    return DataObject.Get().BaseNaviWalkMoveSpeed;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetBaseStrafeWalkMoveSpeed(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BaseStrafeWalkMoveSpeed' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.BaseStrafeWalkMoveSpeed;
    }
    return DataObject.Get().BaseStrafeWalkMoveSpeed;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetBaseStrafeJogMoveSpeed(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BaseStrafeJogMoveSpeed' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.BaseStrafeJogMoveSpeed;
    }
    return DataObject.Get().BaseStrafeJogMoveSpeed;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetBaseNaviRunMoveSpeed(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BaseNaviRunMoveSpeed' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.BaseNaviRunMoveSpeed;
    }
    return DataObject.Get().BaseNaviRunMoveSpeed;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetBaseNaviSprintMoveSpeed(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BaseNaviSprintMoveSpeed' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.BaseNaviSprintMoveSpeed;
    }
    return DataObject.Get().BaseNaviSprintMoveSpeed;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetBaseNearDeathCrawlMoveSpeed(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BaseNearDeathCrawlMoveSpeed' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.BaseNearDeathCrawlMoveSpeed;
    }
    return DataObject.Get().BaseNearDeathCrawlMoveSpeed;
}
UFUNCTION()
TObjectPtr<UCurveFloat> __FDTCharacterMovementConfig_GetNaviWalkMoveSpeedAnimCurve(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{
    TObjectPtr<UCurveFloat> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'NaviWalkMoveSpeedAnimCurve' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig local_142;
        return local_142.NaviWalkMoveSpeedAnimCurve;
    }
    return __r;
}
UFUNCTION()
TObjectPtr<UCurveFloat> __FDTCharacterMovementConfig_GetStrafeWalkMoveSpeedAnimCurve(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{
    TObjectPtr<UCurveFloat> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'StrafeWalkMoveSpeedAnimCurve' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig local_142;
        return local_142.StrafeWalkMoveSpeedAnimCurve;
    }
    return __r;
}
UFUNCTION()
TObjectPtr<UCurveFloat> __FDTCharacterMovementConfig_GetStrafeJogMoveSpeedAnimCurve(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{
    TObjectPtr<UCurveFloat> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'StrafeJogMoveSpeedAnimCurve' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig local_142;
        return local_142.StrafeJogMoveSpeedAnimCurve;
    }
    return __r;
}
UFUNCTION()
TObjectPtr<UCurveFloat> __FDTCharacterMovementConfig_GetNaviRunMoveSpeedAnimCurve(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{
    TObjectPtr<UCurveFloat> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'NaviRunMoveSpeedAnimCurve' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig local_142;
        return local_142.NaviRunMoveSpeedAnimCurve;
    }
    return __r;
}
UFUNCTION()
TObjectPtr<UCurveFloat> __FDTCharacterMovementConfig_GetNaviSprintMoveSpeedAnimCurve(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{
    TObjectPtr<UCurveFloat> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'NaviSprintMoveSpeedAnimCurve' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig local_142;
        return local_142.NaviSprintMoveSpeedAnimCurve;
    }
    return __r;
}
UFUNCTION()
TObjectPtr<UCurveFloat> __FDTCharacterMovementConfig_GetNearDeathCrawlMoveSpeedAnimCurve(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{
    TObjectPtr<UCurveFloat> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'NearDeathCrawlMoveSpeedAnimCurve' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig local_142;
        return local_142.NearDeathCrawlMoveSpeedAnimCurve;
    }
    return __r;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetMoveAcceleration(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MoveAcceleration' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.MoveAcceleration;
    }
    return DataObject.Get().MoveAcceleration;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetMoveStopAccel(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MoveStopAccel' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.MoveStopAccel;
    }
    return DataObject.Get().MoveStopAccel;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetMoveSteerAccel(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MoveSteerAccel' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.MoveSteerAccel;
    }
    return DataObject.Get().MoveSteerAccel;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetTurnSpeed(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TurnSpeed' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.TurnSpeed;
    }
    return DataObject.Get().TurnSpeed;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetTurnMaxAcceleration(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TurnMaxAcceleration' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.TurnMaxAcceleration;
    }
    return DataObject.Get().TurnMaxAcceleration;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetTurnLerpRatio(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TurnLerpRatio' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.TurnLerpRatio;
    }
    return DataObject.Get().TurnLerpRatio;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetMaxTurnSpeed(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaxTurnSpeed' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.MaxTurnSpeed;
    }
    return DataObject.Get().MaxTurnSpeed;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetStepHeight(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'StepHeight' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.StepHeight;
    }
    return DataObject.Get().StepHeight;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetMaxHoverHeight(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaxHoverHeight' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.MaxHoverHeight;
    }
    return DataObject.Get().MaxHoverHeight;
}
UFUNCTION()
bool __FDTCharacterMovementConfig_GetbKeepStepHeightInAir(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bKeepStepHeightInAir' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig local_142;
        return local_142.bKeepStepHeightInAir;
    }
    return local_1;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetWalkableSlopDegree(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WalkableSlopDegree' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.WalkableSlopDegree;
    }
    return DataObject.Get().WalkableSlopDegree;
}
UFUNCTION()
FCharacterMoveSlopeSpeedScaleConfig __FDTCharacterMovementConfig_GetSlopeSpeedScale(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{
    FCharacterMoveSlopeSpeedScaleConfig __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SlopeSpeedScale' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig local_142;
        return local_142.SlopeSpeedScale;
    }
    return __r;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetDitchProtectRadius(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DitchProtectRadius' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.DitchProtectRadius;
    }
    return DataObject.Get().DitchProtectRadius;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetEdgeProtectRadius(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EdgeProtectRadius' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.EdgeProtectRadius;
    }
    return DataObject.Get().EdgeProtectRadius;
}
UFUNCTION()
bool __FDTCharacterMovementConfig_GetbImmovableByPlayer(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bImmovableByPlayer' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig local_142;
        return local_142.bImmovableByPlayer;
    }
    return local_1;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetWallRunSpeed(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WallRunSpeed' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.WallRunSpeed;
    }
    return DataObject.Get().WallRunSpeed;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetWallRunSnapSpeed(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WallRunSnapSpeed' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.WallRunSnapSpeed;
    }
    return DataObject.Get().WallRunSnapSpeed;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetWallRunMinSlopeDegree(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WallRunMinSlopeDegree' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.WallRunMinSlopeDegree;
    }
    return DataObject.Get().WallRunMinSlopeDegree;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetWallRunMaxSlopeDegree(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WallRunMaxSlopeDegree' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.WallRunMaxSlopeDegree;
    }
    return DataObject.Get().WallRunMaxSlopeDegree;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetFlySpeed(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FlySpeed' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.FlySpeed;
    }
    return DataObject.Get().FlySpeed;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetFlyAscendSpeed(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FlyAscendSpeed' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.FlyAscendSpeed;
    }
    return DataObject.Get().FlyAscendSpeed;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetFlyDescendSpeed(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FlyDescendSpeed' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.FlyDescendSpeed;
    }
    return DataObject.Get().FlyDescendSpeed;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetFlyAcceleration(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FlyAcceleration' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.FlyAcceleration;
    }
    return DataObject.Get().FlyAcceleration;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetFlyStopAccel(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FlyStopAccel' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.FlyStopAccel;
    }
    return DataObject.Get().FlyStopAccel;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetFlySteerAccel(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FlySteerAccel' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.FlySteerAccel;
    }
    return DataObject.Get().FlySteerAccel;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetFlyAscendAccel(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FlyAscendAccel' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.FlyAscendAccel;
    }
    return DataObject.Get().FlyAscendAccel;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetFlyDescendAccel(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FlyDescendAccel' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.FlyDescendAccel;
    }
    return DataObject.Get().FlyDescendAccel;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetFlyTurnSpeedYaw(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FlyTurnSpeedYaw' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.FlyTurnSpeedYaw;
    }
    return DataObject.Get().FlyTurnSpeedYaw;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetFlyTurnSpeedPitch(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FlyTurnSpeedPitch' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.FlyTurnSpeedPitch;
    }
    return DataObject.Get().FlyTurnSpeedPitch;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetFlyTurnAccelYaw(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FlyTurnAccelYaw' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.FlyTurnAccelYaw;
    }
    return DataObject.Get().FlyTurnAccelYaw;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetFlyTurnAccelPitch(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FlyTurnAccelPitch' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.FlyTurnAccelPitch;
    }
    return DataObject.Get().FlyTurnAccelPitch;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetFlyPitchMin(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FlyPitchMin' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.FlyPitchMin;
    }
    return DataObject.Get().FlyPitchMin;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetFlyPitchMax(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FlyPitchMax' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.FlyPitchMax;
    }
    return DataObject.Get().FlyPitchMax;
}
UFUNCTION()
FRuntimeFloatCurve __FDTCharacterMovementConfig_GetFlyTurnSpeedScaleCurve(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{
    FRuntimeFloatCurve __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FlyTurnSpeedScaleCurve' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig local_142;
        return local_142.FlyTurnSpeedScaleCurve;
    }
    return __r;
}
UFUNCTION()
FRuntimeFloatCurve __FDTCharacterMovementConfig_GetFlyPitchSpeedCurve(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{
    FRuntimeFloatCurve __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FlyPitchSpeedCurve' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig local_142;
        return local_142.FlyPitchSpeedCurve;
    }
    return __r;
}
UFUNCTION()
float32 __FDTCharacterMovementConfig_GetExternalForceMaxSpeed(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExternalForceMaxSpeed' from a null 'FDTCharacterMovementConfig' DataObject!");
        }
        FDTCharacterMovementConfig defaultValue;
        return defaultValue.ExternalForceMaxSpeed;
    }
    return DataObject.Get().ExternalForceMaxSpeed;
}
UFUNCTION()
FDTCharacterMovementConfig CastToFDTCharacterMovementConfig(const TDataObjectPtr<FDTCharacterMovementConfig> &inout DataObject)
{
    FDTCharacterMovementConfig __r;
    return __r;
}
}

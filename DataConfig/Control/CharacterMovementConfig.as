

struct FDTCharacterMovementConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    float32 BaseNaviWalkMoveSpeed = 150.0f;
    UPROPERTY()
    float32 BaseStrafeWalkMoveSpeed = 150.0f;
    UPROPERTY()
    float32 BaseStrafeJogMoveSpeed = 320.0f;
    UPROPERTY()
    float32 BaseNaviRunMoveSpeed = 400.0f;
    UPROPERTY()
    float32 BaseNaviSprintMoveSpeed = 640.0f;
    UPROPERTY()
    float32 BaseNearDeathCrawlMoveSpeed = 100.0f;
    UPROPERTY()
    TObjectPtr<UCurveFloat> NaviWalkMoveSpeedAnimCurve = nullptr;
    UPROPERTY()
    TObjectPtr<UCurveFloat> StrafeWalkMoveSpeedAnimCurve = nullptr;
    UPROPERTY()
    TObjectPtr<UCurveFloat> StrafeJogMoveSpeedAnimCurve = nullptr;
    UPROPERTY()
    TObjectPtr<UCurveFloat> NaviRunMoveSpeedAnimCurve = nullptr;
    UPROPERTY()
    TObjectPtr<UCurveFloat> NaviSprintMoveSpeedAnimCurve = nullptr;
    UPROPERTY()
    TObjectPtr<UCurveFloat> NearDeathCrawlMoveSpeedAnimCurve = nullptr;
    UPROPERTY()
    float32 MoveAcceleration = 2500.0f;
    UPROPERTY()
    float32 MoveStopAccel = 3000.0f;
    UPROPERTY()
    float32 MoveSteerAccel = 3600.0f;
    UPROPERTY()
    float32 TurnSpeed = 720.0f;
    UPROPERTY()
    float32 TurnMaxAcceleration = 5400.0f;
    UPROPERTY()
    float32 TurnLerpRatio = 0.2f;
    UPROPERTY()
    float32 MaxTurnSpeed = 180.0f;
    UPROPERTY()
    float32 StepHeight = 20.0f;
    UPROPERTY()
    float32 MaxHoverHeight = -1.0f;
    UPROPERTY()
    bool bKeepStepHeightInAir = false;
    UPROPERTY()
    float32 WalkableSlopDegree = 50.0f;
    UPROPERTY()
    FCharacterMoveSlopeSpeedScaleConfig SlopeSpeedScale;
    UPROPERTY()
    float32 DitchProtectRadius = -1.0f;
    UPROPERTY()
    float32 EdgeProtectRadius = -1.0f;
    UPROPERTY()
    bool bImmovableByPlayer = false;
    UPROPERTY()
    float32 WallRunSpeed = 400.0f;
    UPROPERTY()
    float32 WallRunSnapSpeed = 100.0f;
    UPROPERTY()
    float32 WallRunMinSlopeDegree = 45.0f;
    UPROPERTY()
    float32 WallRunMaxSlopeDegree = 120.0f;
    UPROPERTY()
    float32 FlySpeed = 400.0f;
    UPROPERTY()
    float32 FlyAscendSpeed = 300.0f;
    UPROPERTY()
    float32 FlyDescendSpeed = 300.0f;
    UPROPERTY()
    float32 FlyAcceleration = 2500.0f;
    UPROPERTY()
    float32 FlyStopAccel = 3000.0f;
    UPROPERTY()
    float32 FlySteerAccel = 3600.0f;
    UPROPERTY()
    float32 FlyAscendAccel = 1000.0f;
    UPROPERTY()
    float32 FlyDescendAccel = 1000.0f;
    UPROPERTY()
    float32 FlyTurnSpeedYaw = -1.0f;
    UPROPERTY()
    float32 FlyTurnSpeedPitch = -1.0f;
    UPROPERTY()
    float32 FlyTurnAccelYaw = -1.0f;
    UPROPERTY()
    float32 FlyTurnAccelPitch = -1.0f;
    UPROPERTY()
    float32 FlyPitchMin = -45.0f;
    UPROPERTY()
    float32 FlyPitchMax = 45.0f;
    UPROPERTY()
    FRuntimeFloatCurve FlyTurnSpeedScaleCurve = FRuntimeCurveUtils::CreateLinear(0.0f, 0.1f, 0.5f, 1.0f);
    UPROPERTY()
    FRuntimeFloatCurve FlyPitchSpeedCurve = FRuntimeCurveUtils::CreateLinear(0.0f, 0.1f, 1.0f, 1.0f);
    UPROPERTY()
    float32 ExternalForceMaxSpeed = 1000.0f;


}


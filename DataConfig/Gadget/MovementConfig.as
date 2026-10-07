
enum ETrackSpeedMode
{
    Const,
    TwoTurnPointCurve,
    CustomCurve,
}

enum ETrackMovementAxis
{
    X,
    Y,
    Z,
}


struct FTrackTwoTurnPointCurve
{
    UPROPERTY()
    float32 ValueBeforeTurn;
    UPROPERTY()
    float32 ValueAfterTurn;
    UPROPERTY()
    float32 TurnStartTime;
    UPROPERTY()
    float32 TurnEndTime;


}

struct FTrackMovementConfigData : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint8 TrackMovementAxis = (7 != 0);
    UPROPERTY()
    ETrackSpeedMode MoveSpeedMode;
    UPROPERTY()
    float32 ConstMoveSpeed;
    UPROPERTY()
    FTrackTwoTurnPointCurve TwoTurnPointMoveSpeedCurve;
    UPROPERTY()
    FRuntimeFloatCurve CustomMoveSpeedCurve;
    UPROPERTY()
    ETrackSpeedMode TurnSpeedMode;
    UPROPERTY()
    float32 ConstTurnSpeed;
    UPROPERTY()
    FTrackTwoTurnPointCurve TwoTurnPointTurnSpeedCurve;
    UPROPERTY()
    FRuntimeFloatCurve CustomTurnSpeedCurve;
    UPROPERTY()
    float32 CloseDistance = 50.0f;
    UPROPERTY()
    bool bStopMoveAfterApproch = false;
    UPROPERTY()
    bool bContinueTrackEvenSuccess = false;
    UPROPERTY()
    bool bKeepTransformRotation = false;


    float32 GetCurrentMoveSpeed(const float32 InTime) const
    {
        if (int(this.MoveSpeedMode) == 0)
        {
            return this.ConstMoveSpeed;
        }
        if (int(this.MoveSpeedMode) == 1)
        {
            if (InTime <= this.TwoTurnPointMoveSpeedCurve.TurnStartTime)
            {
                return this.TwoTurnPointMoveSpeedCurve.ValueBeforeTurn;
            }
            if (InTime >= this.TwoTurnPointMoveSpeedCurve.TurnEndTime)
            {
                return this.TwoTurnPointMoveSpeedCurve.ValueAfterTurn;
            }
            return this.TwoTurnPointMoveSpeedCurve.ValueBeforeTurn + ((this.TwoTurnPointMoveSpeedCurve.ValueAfterTurn - this.TwoTurnPointMoveSpeedCurve.ValueBeforeTurn) * FMathUtils::InverseLerpUnclamed(InTime, this.TwoTurnPointMoveSpeedCurve.TurnStartTime, this.TwoTurnPointMoveSpeedCurve.TurnEndTime));
        }
        if (int(this.MoveSpeedMode) == 2)
        {
            return this.CustomMoveSpeedCurve.GetFloatValue(InTime, 0.0f);
        }
        return 0.0f;
    }
    float32 GetCurrentTurnSpeed(const float32 InTime) const
    {
        if (int(this.TurnSpeedMode) == 0)
        {
            return this.ConstTurnSpeed;
        }
        if (int(this.TurnSpeedMode) == 1)
        {
            if (InTime <= this.TwoTurnPointTurnSpeedCurve.TurnStartTime)
            {
                return this.TwoTurnPointTurnSpeedCurve.ValueBeforeTurn;
            }
            if (InTime >= this.TwoTurnPointTurnSpeedCurve.TurnEndTime)
            {
                return this.TwoTurnPointTurnSpeedCurve.ValueAfterTurn;
            }
            return this.TwoTurnPointTurnSpeedCurve.ValueBeforeTurn + ((this.TwoTurnPointTurnSpeedCurve.ValueAfterTurn - this.TwoTurnPointTurnSpeedCurve.ValueBeforeTurn) * FMathUtils::InverseLerpUnclamed(InTime, this.TwoTurnPointTurnSpeedCurve.TurnStartTime, this.TwoTurnPointTurnSpeedCurve.TurnEndTime));
        }
        if (int(this.TurnSpeedMode) == 2)
        {
            return this.CustomTurnSpeedCurve.GetFloatValue(InTime, 0.0f);
        }
        return 0.0f;
    }
}


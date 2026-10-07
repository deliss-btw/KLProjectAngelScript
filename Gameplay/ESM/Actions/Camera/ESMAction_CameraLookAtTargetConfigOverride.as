

class UESMAction_CameraLookAtTargetConfigOverride : UESMBPBaseSpanAction
{
    UPROPERTY()
    FDataObjectPtr ConfigRef;

    UESMAction_CameraLookAtTargetConfigOverride()
    {
        return;
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(1);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Camera;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_12 = 0;
        Has local_4;
        if (!(local_4.opCall()))
        {
            return;
        }
        local_12.SetConfigRef(this.ConfigRef);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Has local_4;
        if (!(local_4.opCall()))
        {
            return;
        }
        Remove local_10;
        local_10.opCall();
        return;
    }
}


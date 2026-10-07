

class UESMAction_CameraLookAtTweak : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bSnapToLookAtTarget;
    UPROPERTY()
    bool bOverrideLookAtYawSpeed;
    UPROPERTY()
    bool bOverrideLookAtPitchSpeed;
    UPROPERTY()
    FCameraBlendSpeed LookAtYawSpeed;
    UPROPERTY()
    FCameraBlendSpeed LookAtPitchSpeed;
    UPROPERTY()
    bool bUseCustomLookAtYaw;
    UPROPERTY()
    bool bUseCustomLookAtPitch;
    UPROPERTY()
    bool bCustomLookAtYawAdditive;
    UPROPERTY()
    bool bCustomLookAtPitchAdditive;
    UPROPERTY()
    float32 CustomLookAtYaw;
    UPROPERTY()
    float32 CustomLookAtPitch;
    UPROPERTY()
    bool bDisableLookAtOriginOffset;

    UESMAction_CameraLookAtTweak()
    {
        this.bSnapToLookAtTarget = true;
        this.bOverrideLookAtYawSpeed = true;
        this.bOverrideLookAtPitchSpeed = true;
        this.bUseCustomLookAtYaw = false;
        this.bUseCustomLookAtPitch = false;
        this.bCustomLookAtYawAdditive = false;
        this.bCustomLookAtPitchAdditive = false;
        this.CustomLookAtYaw = 0.0f;
        this.CustomLookAtPitch = 0.0f;
        this.bDisableLookAtOriginOffset = false;
        this.LookAtYawSpeed.Acceleration = 500.0f;
        this.LookAtYawSpeed.InterpSpeed = 0.3f;
        this.LookAtYawSpeed.SpeedMin = -1000.0f;
        this.LookAtYawSpeed.SpeedMax = 1000.0f;
        this.LookAtPitchSpeed.Acceleration = 500.0f;
        this.LookAtPitchSpeed.InterpSpeed = 0.3f;
        this.LookAtPitchSpeed.SpeedMin = -1000.0f;
        this.LookAtPitchSpeed.SpeedMax = 1000.0f;
        return;
    }
    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(3);
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Camera;
    }
    UFUNCTION()
    void GetRestriction_Implementation(FESMNotifyRestriction &inout OutParam) const
    {
        OutParam.IdentifyName = n"CameraLookAtTweak";
        OutParam.bExclusive = true;
        return;
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        FC_TPCameraLookAtTweaks local_6;
        local_6.SetbSnapToLookAtTarget(this.bSnapToLookAtTarget);
        local_6.SetbOverrideLookAtYawSpeed(this.bOverrideLookAtYawSpeed);
        local_6.LookAtYawSpeed = this.LookAtYawSpeed;
        local_6.SetbOverrideLookAtPitchSpeed(this.bOverrideLookAtPitchSpeed);
        local_6.LookAtPitchSpeed = this.LookAtPitchSpeed;
        local_6.SetbUseCustomLookAtYaw(this.bUseCustomLookAtYaw);
        local_6.SetbCustomLookAtYawAdditive(this.bCustomLookAtYawAdditive);
        local_6.SetbUseCustomLookAtPitch(this.bUseCustomLookAtPitch);
        local_6.SetbCustomLookAtPitchAdditive(this.bCustomLookAtPitchAdditive);
        local_6.SetbDisableLookAtOriginOffset(this.bDisableLookAtOriginOffset);
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
}


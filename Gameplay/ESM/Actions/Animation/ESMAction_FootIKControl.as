

class UESMAction_FootIKControl : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FRuntimeFloatCurve BodyPivotControl;
    UPROPERTY()
    FRuntimeFloatCurve LegFollowBodyRotationWeight;

    UESMAction_FootIKControl()
    {
        this.BodyPivotControl = FRuntimeCurveUtils::CreateLinear(0.0f, 1.0f, 1.0f, 1.0f);
        this.LegFollowBodyRotationWeight = FRuntimeCurveUtils::CreateLinear(0.0f, 1.0f, 1.0f, 1.0f);
        this.bAllowTickInLowCost = false;
        return;
    }
    UFUNCTION()
    bool AllowTickInLowCost_Implementation() const
    {
        return false;
    }
    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(6);
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Modify local_4;
        FC_FootIKControl& local_6 = local_4.opCall();
        if (local_6)
        {
            float32 local_13 = float32((Time.ActionLastTime.ToSeconds() / Time.ActionDuration.ToSeconds()));
            local_6.SetWeight(1.0f);
            local_6.SetTargetBodyPivotControl(this.BodyPivotControl.GetFloatValue(local_13, 0.0f));
            local_6.SetTargetLegFollowBodyRotationWeight(this.LegFollowBodyRotationWeight.GetFloatValue(local_13, 0.0f));
            Get local_18;
            const FC_SnapToFloor& local_20 = local_18.opCall();
            if (local_20)
            {
                local_6.SetGroundPlaneLocation(FVector(local_20.GetGroundPlaneLocation()));
                local_6.SetGroundPlaneRotation(FQuat(local_20.GetGroundPlaneRotation()));
            }
        }
        Get local_40;
        const FC_CharacterMovement& local_42 = local_40.opCall();
        if (local_42)
        {
            local_6.SetFloorNormal(local_42.GetFloorInfo().FloorNormal);
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Modify local_4;
        FC_FootIKControl& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetWeight(0.0f);
        }
        return;
    }
}


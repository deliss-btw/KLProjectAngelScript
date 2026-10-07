

class UESMAction_LongNeckIKControl : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FRuntimeFloatCurve Weight = FRuntimeCurveUtils::CreateLinear(0.0f, 1.0f, 1.0f, 1.0f);
    UPROPERTY()
    float32 LookAtTargetLerpSpeed = 0.2f;
    UPROPERTY()
    float32 TangentIntensityLerpSpeed = 0.5f;
    UPROPERTY()
    bool EnableNeckTwist = false;


    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(6);
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        float32 local_8;
        ModifyOrAdd local_4;
        FC_LongNeckIKControl& local_6 = local_4.opCall();
        if (local_6)
        {
            if (this.EnableNeckTwist)
            {
                local_8 = 1.0f;
            }
            else
            {
                local_8 = 0.0f;
            }
            local_6.SetHeadTwistDecoWeight(local_8);
            local_6.SetLookAtTargetLerpSpeed(this.LookAtTargetLerpSpeed);
            local_6.SetTangentIntensityLerpSpeed(this.TangentIntensityLerpSpeed);
        }
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ModifyOrAdd local_4;
        FC_LongNeckIKControl& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetTargetWeight(this.Weight.GetFloatValue(float32((Time.ActionLastTime.ToSeconds() / Time.ActionDuration.ToSeconds())), 0.0f));
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ModifyOrAdd local_4;
        FC_LongNeckIKControl& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetTargetWeight(0.0f);
            local_6.SetHeadTwistDecoWeight(0.0f);
        }
        return;
    }
}


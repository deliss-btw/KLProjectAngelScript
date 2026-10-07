

class UESMAction_CameraLockTargetModifier : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    int LockPointIndex = -1;
    UPROPERTY()
    FLockPointModifyConfig Config;
    UPROPERTY()
    float32 BlendIn = 0.2f;
    UPROPERTY()
    float32 BlendOut = 0.2f;


    UFUNCTION()
    bool NeedTick_Implementation() const
    {
        return (this.BlendIn > 0.0f || (this.BlendOut > 0.0f));
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
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        ModifyOrAdd local_4;
        local_4.opCall().AddOrUpdateModifyItem(this.GetDataPathName(), this.LockPointIndex, this.Config);
        return;
    }
    UFUNCTION()
    void ViewTick_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        FLockPointModifyConfig local_6;
        float32 local_7 = 1.0f;
        float32 local_9 = 1.0f;
        FFPTime local_12 = FFPTime(Time.ActionTime);
        if (local_12.opCmp(this.BlendIn) < 0 && (this.BlendIn > 0.0f))
        {
            local_7 = float32(Time.ActionTime.ToSeconds()) / this.BlendIn;
        }
        FFPTime local_12_2 = FFPTime(Time.ActionDuration);
        if (local_12_2.opCmp(0.0) > 0 && ((((FFPTime(Time.ActionDuration) - Time.ActionTime)).opCmp(this.BlendOut) < 0)) && (this.BlendOut > 0.0f))
        {
            local_9 = (float32(((FFPTime(Time.ActionDuration) - Time.ActionTime).ToSeconds()))) / this.BlendOut;
        }
        local_6.BlendTo(this.Config, FMath::Min(local_7, local_9));
        ModifyOrAdd local_24;
        local_24.opCall().AddOrUpdateModifyItem(this.GetDataPathName(), this.LockPointIndex, local_6);
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        ModifyOrAdd local_4;
        local_4.opCall().RemoveModifyItem(this.GetDataPathName());
        return;
    }
}


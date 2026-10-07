

class UESMAction_RiderHandIKControl : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FRuntimeFloatCurve WeightCurve = FRuntimeCurveUtils::CreateLinear(0.0f, 1.0f, 1.0f, 1.0f);
    UPROPERTY()
    float32 LeftHandWeight = 1.0f;
    UPROPERTY()
    float32 RightHandWeight = 1.0f;
    UPROPERTY()
    bool bEnableWyvernSocket = false;
    UPROPERTY()
    FName WyvernSocketName = NAME_None;
    UPROPERTY()
    FName WyvernRootBoneName = n"Root";


    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(3);
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        local_6.SetTargetWeight(this.WeightCurve.GetFloatValue(0.0f, 0.0f));
        local_6.SetTargetLeftHandWeight(this.LeftHandWeight);
        local_6.SetTargetRightHandWeight(this.RightHandWeight);
        return;
    }
    UFUNCTION()
    void ViewTick_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        if (!(local_6))
        {
            return;
        }
        float32 local_15 = this.WeightCurve.GetFloatValue(float32((Time.ActionLastTime.ToSeconds() / Time.ActionDuration.ToSeconds())), 0.0f);
        local_6.SetWeight(local_15);
        local_6.SetLeftHandWeight(this.LeftHandWeight);
        local_6.SetRightHandWeight(this.RightHandWeight);
        local_6.SetTargetWeight(local_15);
        local_6.SetTargetLeftHandWeight(this.LeftHandWeight);
        local_6.SetTargetRightHandWeight(this.RightHandWeight);
        if (!(this.bEnableWyvernSocket) || this.WyvernSocketName.IsNone())
        {
            return;
        }
        this.UpdateWyvernSocketLocation(Context, local_6);
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        Modify local_4;
        FC_RiderHandIKControl& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetTargetWeight(0.0f);
        }
        return;
    }
    void UpdateWyvernSocketLocation(const FESMViewContext &inout Context, FC_RiderHandIKControl &inout HandIKControl) const
    {
        const AActor local_20;
        FNameHandle_EntityBBVarEntity local_10;
        local_10;
        FECSEntity local_14 = Context.GetEntity().GetBB_Entity(local_10);
        if (!(local_14.IsValid()))
        {
            HandIKControl.SetbHasWyvernSocketLocation(false);
            return;
        }
        local_20 = local_14.GetActor();
        if (local_20 == nullptr)
        {
            HandIKControl.SetbHasWyvernSocketLocation(false);
            return;
        }
        USkeletalMeshComponent local_22 = Cast<USkeletalMeshComponent>(local_20.GetComponentByClass(USkeletalMeshComponent));
        if (local_22 == nullptr)
        {
            HandIKControl.SetbHasWyvernSocketLocation(false);
            return;
        }
        if (local_22.DoesSocketExist(this.WyvernSocketName))
        {
            HandIKControl.SetWyvernSocketWorldLocation(local_22.GetSocketTransform(this.WyvernSocketName, ERelativeTransformSpace(0)).GetLocation());
            HandIKControl.SetbHasWyvernSocketLocation(true);
        }
        else
        {
            HandIKControl.SetbHasWyvernSocketLocation(false);
        }
        return;
    }
}


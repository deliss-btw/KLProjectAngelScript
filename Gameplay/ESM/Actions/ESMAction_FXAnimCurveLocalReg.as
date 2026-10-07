

// NOTE: class defaults are not authored in this module: UESMAction_FXAnimCurveLocalReg (default scalar field UESMAction.ActionFilterType has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

struct FESMFXAnimCurveInterpoLocalRegInstanceData
{
    UPROPERTY()
    FFXAnimCurveInterpoState InterpoState;

    FESMFXAnimCurveInterpoLocalRegInstanceData()
    {
        return;
    }
}

class UESMAction_FXAnimCurveLocalReg : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    bool bUseConfigCurve = true;
    UPROPERTY()
    UFXAnimCurveConfig Config;
    UPROPERTY()
    FFXAnimCurve FxAnimCurve;
    UPROPERTY()
    FName TagName;


    UFUNCTION()
    FESMInstanceDataInfo GetViewInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMFXAnimCurveInterpoLocalRegInstanceData);
    }
    UFUNCTION()
    int GetActionPriority_Implementation() const
    {
        return 1;
    }
    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(1);
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    void ViewTick_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.bUseConfigCurve)
        {
            if (this.Config != nullptr)
            {
                this.UpdateFxCurve(this.Config.AnimCurve, Context, Time);
            }
            return;
        }
        this.UpdateFxCurve(this.FxAnimCurve, Context, Time);
        return;
    }
    const FESMFXAnimCurveInterpoLocalRegInstanceData GetViewInstanceData(const FESMViewContext &inout Context) const
    {
        const FESMFXAnimCurveInterpoLocalRegInstanceData __r;
        return __r;
    }
    FESMFXAnimCurveInterpoLocalRegInstanceData ModifyViewInstanceData(const FESMViewContext &inout Context) const
    {
        FESMFXAnimCurveInterpoLocalRegInstanceData __r;
        return __r;
    }
    void UpdateFxCurve(const FFXAnimCurve &inout AnimCurve, const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        FECSEntity local_4 = FECSEntity(ENTITY_NULL);
        Get local_8;
        const FC_LocalToDefault& local_10 = local_8.opCall();
        if (local_10)
        {
            local_4 = FECSEntity(local_10.DefaultEntityId);
        }
        if (!(local_4.IsValid()))
        {
            return;
        }
        Get local_20;
        const FC_ESMFXCollector& local_22 = local_20.opCall();
        if (local_22)
        {
            FECSEntity local_26;
            if (local_22.FXEntities.Find(this.TagName, local_26) && local_26.IsValid())
            {
                AnimCurve.UpdateFX(local_26, local_4, Time.ActionTime.ToSeconds(), Time.WorldTime, float32(Time.StateDeltaTime.ToSeconds()), this.ModifyViewInstanceData(Context).InterpoState);
            }
        }
        return;
    }
}


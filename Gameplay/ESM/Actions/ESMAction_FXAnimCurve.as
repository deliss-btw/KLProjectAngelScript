

struct FESMFXAnimCurveInterpoInstanceData
{
    UPROPERTY()
    FFXAnimCurveInterpoState InterpoState;

    FESMFXAnimCurveInterpoInstanceData()
    {
        return;
    }
}

class UESMAction_FXAnimCurve : UESMBPBaseSpanTickAction
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
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMFXAnimCurveInterpoInstanceData);
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
    const FESMFXAnimCurveInterpoInstanceData GetViewInstanceData(const FESMViewContext &inout Context) const
    {
        const FESMFXAnimCurveInterpoInstanceData __r;
        return __r;
    }
    FESMFXAnimCurveInterpoInstanceData ModifyViewInstanceData(const FESMViewContext &inout Context) const
    {
        FESMFXAnimCurveInterpoInstanceData __r;
        return __r;
    }
    void UpdateFxCurve(const FFXAnimCurve &inout AnimCurve, const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        Get local_4;
        const FC_ESMFXCollector& local_6 = local_4.opCall();
        if (local_6)
        {
            FECSEntity local_12;
            if (local_6.FXEntities.Find(this.TagName, local_12) && local_12.IsValid())
            {
                AnimCurve.UpdateFX(local_12, Context.GetEntity(), Time.ActionTime.ToSeconds(), Time.WorldTime, float32(Time.StateDeltaTime.ToSeconds()), this.ModifyViewInstanceData(Context).InterpoState);
            }
        }
        return;
    }
}


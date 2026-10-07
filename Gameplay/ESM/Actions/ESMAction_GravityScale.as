

struct FESMActionGravityScaleInstanceData
{
    UPROPERTY()
    float32 OriginGravityScale = 1.0f;


}

class UESMAction_GravityScale : UESMBPBaseSpanAction
{
    UPROPERTY()
    float32 GravityScale = 1.0f;


    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMActionGravityScaleInstanceData);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Movement;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_10 = 0;
        const FECSEntity& local_2 = Context.GetEntity();
        Has local_6;
        if (local_6.opCall() == false)
        {
            return;
        }
        this.ModifyInstanceData(Context).OriginGravityScale = local_10.GetGravityScale();
        local_10.SetGravityScale(this.GravityScale);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_10 = 0;
        float32 local_15 = 0.0f;
        const FECSEntity& local_2 = Context.GetEntity();
        Has local_6;
        if (local_6.opCall() == false)
        {
            return;
        }
        local_10.SetGravityScale(local_15);
        return;
    }
    FESMActionGravityScaleInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FESMActionGravityScaleInstanceData __r;
        return __r;
    }
    FESMActionGravityScaleInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FESMActionGravityScaleInstanceData __r;
        return __r;
    }
}


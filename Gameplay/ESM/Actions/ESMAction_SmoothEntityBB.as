
enum EESMAction_SmoothEntityBBType
{
    Linear,
    Degree,
}


class UESMAction_SmoothEntityBB : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FNameHandle_EntityBBVarFloat SrcNameHandle;
    UPROPERTY()
    FNameHandle_EntityBBVarFloat DestNameHandle;
    UPROPERTY()
    float32 SmoothSpeed = 1.0f;
    UPROPERTY()
    float32 SmoothLerpSpeed = 0.5f;
    UPROPERTY()
    EESMAction_SmoothEntityBBType SmoothType;


    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        float32 local_2 = Context.GetEntity().GetBB_Float(this.SrcNameHandle);
        float32 local_1 = Context.GetEntity().GetBB_Float(this.DestNameHandle);
        if (this.SmoothSpeed <= 0.0f)
        {
            Context.GetEntity().SetBB_Float(this.DestNameHandle, local_2);
            return;
        }
        float32 local_6 = 0.0f;
        int local_8 = int(this.SmoothType);
        if (local_8 <= 1)
        {
            if (local_8 != 0)
            {
                if (local_8 != 1)
                {
                }
            }
            else
            {
                local_6 = FMathUtils::MoveTowards(local_1, local_2, float32(Time.ActionDeltaTime.ToSeconds()), this.SmoothSpeed);
                local_6 = float32(FRotator::NormalizeAxis((FMathUtils::MoveTowardsDegree(local_1, FMathUtils::LerpDegree(local_1, local_2, this.SmoothLerpSpeed), float32(Time.ActionDeltaTime.ToSeconds()), this.SmoothSpeed))));
            }
        }
        Context.GetEntity().SetBB_Float(this.DestNameHandle, local_6);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Context.GetEntity().SetBB_Float(this.DestNameHandle, 0.0f);
        return;
    }
}


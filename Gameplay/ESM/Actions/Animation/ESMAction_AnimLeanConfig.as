

class UESMAction_AnimLeanConfig : UESMBPBaseSpanAction
{
    UPROPERTY()
    float32 SmoothTime = 0.1f;
    UPROPERTY()
    float32 MaxDegree = 90.0f;
    UPROPERTY()
    float32 TargetAlpha = 1.0f;
    UPROPERTY()
    float32 FadeInTime = 0.2f;
    UPROPERTY()
    float32 FadeOutTime = 0.2f;
    UPROPERTY()
    bool bEnableLeanBlend = true;


    UFUNCTION()
    bool IsNotifyTypeAllowed_Implementation(const EESMNotifyType InType) const
    {
        return (int(InType) == 1 || (int(InType) == 2));
    }
    UFUNCTION()
    void GetRestriction_Implementation(FESMNotifyRestriction &inout OutParam) const
    {
        OutParam.bExclusive = true;
        OutParam.IdentifyName = n"AnimLeanConfig";
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        float32 local_10;
        local_6.SetSmoothTime(this.SmoothTime);
        local_6.SetMaxDegree(this.MaxDegree);
        local_6.SetTargetAlpha(this.TargetAlpha);
        local_6.SetFadeToTarget(this.TargetAlpha);
        if (this.FadeInTime > 0.0f)
        {
            local_10 = this.TargetAlpha / this.FadeInTime;
        }
        else
        {
            local_10 = 0.0f;
        }
        local_6.SetFadeToSpeed(local_10);
        local_6.SetbEnableLeanBlend(this.bEnableLeanBlend);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        float32 local_10;
        Modify local_4;
        FC_AnimLeanRelatedParamSmoothConfig& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetFadeToTarget(0.0f);
            if (this.FadeOutTime > 0.0f)
            {
                local_10 = this.TargetAlpha / this.FadeOutTime;
            }
            else
            {
                local_10 = 0.0f;
            }
            local_6.SetFadeToSpeed(local_10);
        }
        return;
    }
}




class UESMAction_AnimFootPhase : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    float32 FootPhaseStart = 0.0f;
    UPROPERTY()
    float32 FootPhaseEnd = 1.0f;


    UFUNCTION()
    bool IsNotifyTypeAllowed_Implementation(const EESMNotifyType InType) const
    {
        return (int(InType) == 1);
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_28 = 0;
        Get local_4;
        const FC_CharacterAnimData& local_6 = local_4.opCall();
        if (local_6)
        {
            float32 local_13 = float32((FFPTime(Time.ActionLastTime) / Time.ActionDuration));
            FFPTime local_16 = FFPTime(Time.WorldLastTime);
            float32 local_8 = FMath::Lerp(this.FootPhaseStart, this.FootPhaseEnd, local_13);
            float32 local_19 = ((this.FootPhaseEnd - this.FootPhaseStart) / Time.ActionDuration) * Time.PlaySpeed;
            if (FMath::Abs((local_6.SampleFootPhase(local_16) - local_8)) > 0.01f)
            {
                local_28.SetFootPhaseBaseTime(Time.WorldLastTime);
                local_28.SetFootPhaseBase(local_8);
                local_28.SetFootPhaseSpeed(local_19);
            }
        }
        return;
    }
}


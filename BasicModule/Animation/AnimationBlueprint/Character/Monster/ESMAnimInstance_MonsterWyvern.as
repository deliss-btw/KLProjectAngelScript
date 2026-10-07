

class UESMAnimInstance_MonsterWyvern : UESMAnimInstance_MonsterBase
{
    UPROPERTY()
    FC_LongNeckIKControl LongNeckIKControl;
    UPROPERTY()
    FC_RelativeDesiredRotation RelativeDesiredRotation;
    UPROPERTY()
    FC_FlyLeanControl FlyLeanControl;
    UPROPERTY()
    float32 NeckDynamicAlpha = 0.0f;
    UPROPERTY()
    float32 WingDynamicAlpha = 0.0f;
    UPROPERTY()
    float32 TailDynamicAlpha = 0.0f;


    UFUNCTION()
    void EntitySync_SyncHistory_Implementation(const FFPTime &inout SampleTime)
    {
        int local_6 = 0;
        int local_34 = 0;
        int local_44 = 0;
        Super::EntitySync_SyncHistory_Implementation(SampleTime);
        if (!(local_6) || !(local_6.GetInterpoValue(SampleTime, this.LongNeckIKControl)))
        {
            FC_LongNeckIKControl local_28;
            this.LongNeckIKControl = local_28;
        }
        if (!(local_34) || !(local_34.GetInterpoValue(SampleTime, this.RelativeDesiredRotation)))
        {
            FC_RelativeDesiredRotation local_38;
            this.RelativeDesiredRotation = local_38;
        }
        if (!(local_44) || !(local_44.GetInterpoValue(SampleTime, this.FlyLeanControl)))
        {
            FC_FlyLeanControl local_46;
            this.FlyLeanControl = local_46;
        }
        return;
    }
    UFUNCTION()
    void EntitySync_SyncView_Implementation()
    {
        Super::EntitySync_SyncView_Implementation();
        return;
    }
    UFUNCTION()
    void EntitySync_SyncLogic_Implementation()
    {
        Super::EntitySync_SyncLogic_Implementation();
        return;
    }
    UFUNCTION()
    float32 GetRelativeDesiredRotationYaw1()
    {
        if (this.Entity.IsValid())
        {
            FFPTime local_6 = this.GetContextSampleTime();
            FFPTime local_4 = (local_6 - 0.5);
            FECSEntity::SampleHistory(this.Entity);
            FFPTime local_14;
            return FMath::Lerp(this.RelativeDesiredRotation.GetYaw(), local_14.GetYaw(), 0.5f);
        }
        else
        {
            return this.RelativeDesiredRotation.GetYaw();
        }
    }
    UFUNCTION()
    float32 GetRelativeDesiredRotationYaw2()
    {
        if (this.Entity.IsValid())
        {
            FFPTime local_6 = this.GetContextSampleTime();
            FFPTime local_4 = (local_6 - 0.5);
            FECSEntity::SampleHistory(this.Entity);
            FFPTime local_14;
            return FMath::Lerp(this.RelativeDesiredRotation.GetYaw(), local_14.GetYaw(), 0.5f);
        }
        else
        {
            return this.RelativeDesiredRotation.GetYaw();
        }
    }
}


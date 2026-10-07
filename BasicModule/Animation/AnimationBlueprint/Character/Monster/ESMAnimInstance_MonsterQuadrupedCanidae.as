

class UESMAnimInstance_MonsterQuadrupedCanidae : UESMAnimInstance_MonsterQuadruped
{
    UPROPERTY()
    FC_RelativeDesiredRotation RelativeDesiredRotation;
    UPROPERTY()
    FC_GlimmeringWolfTailGroom GlimmeringWolfTailGroom;

    UESMAnimInstance_MonsterQuadrupedCanidae()
    {
        super();
        return;
    }
    UFUNCTION()
    void WhenUpdateMainAnimInstance_Implementation(const float32 DeltaTimeX)
    {
        Super::WhenUpdateMainAnimInstance_Implementation(DeltaTimeX);
        return;
    }
    UFUNCTION()
    void EntitySync_SyncHistory_Implementation(const FFPTime &inout SampleTime)
    {
        int local_6 = 0;
        int local_18 = 0;
        Super::EntitySync_SyncHistory_Implementation(SampleTime);
        if (!(local_6) || !(local_6.GetInterpoValue(SampleTime, this.RelativeDesiredRotation)))
        {
            FC_RelativeDesiredRotation local_12;
            this.RelativeDesiredRotation = local_12;
        }
        if (!(local_18) || !(local_18.GetInterpoValue(SampleTime, this.GlimmeringWolfTailGroom)))
        {
            FC_GlimmeringWolfTailGroom local_20;
            this.GlimmeringWolfTailGroom = local_20;
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
    float32 GetRelativeDesiredRotationYaw()
    {
        return this.RelativeDesiredRotation.GetYaw();
    }
    UFUNCTION()
    float32 GetHRelativeDesiredRotationYaw()
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


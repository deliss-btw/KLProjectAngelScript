

class UESMAnimInstance_CreatureBase : UESMAnimInstance_Base
{
    UPROPERTY()
    FC_RelativeDesiredRotation RelativeDesiredRotation;
    UPROPERTY()
    FC_AniParamSampleTrajectory SampleTrajectoryClientOnly;
    UPROPERTY()
    FC_AniParamSampleTrajectory SampleTrajectory;
    UPROPERTY()
    FC_AnimSampleTrajectoryDeltaMoveRecorder SampleTrajectoryRecorder;

    UESMAnimInstance_CreatureBase()
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
        if (!(local_18) || !(local_18.GetInterpoValue(SampleTime, this.SampleTrajectoryClientOnly)))
        {
            FC_AniParamSampleTrajectory local_54;
            this.SampleTrajectoryClientOnly = local_54;
        }
        if (!(local_18) || !(local_18.GetInterpoValue(SampleTime, this.SampleTrajectory)))
        {
            FC_AniParamSampleTrajectory local_54;
            this.SampleTrajectory = local_54;
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
        GetDefaulted local_4;
        this.SampleTrajectoryRecorder = local_4.opCall();
        return;
    }
    UFUNCTION()
    bool IsEditorPreview() const
    {
        bool local_7;
        if (this.GetWorld() == nullptr)
        {
            local_7 = true;
        }
        else
        {
            bool local_6 = (!(this.GetWorld().IsGameWorld()) == !(false));
            local_7 = local_6;
        }
        return local_7 && (!(this.Entity.IsValid()) == !(false));
    }
    UFUNCTION()
    bool IsESMEditorPreview() const
    {
        bool local_7;
        bool local_2 = !(false);
        if (!(this.Entity.IsValid()) == local_2)
        {
            local_7 = true;
        }
        else
        {
            Has local_6;
            local_7 = (!(local_6.opCall()) == !(false));
        }
        return local_7;
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
    UFUNCTION()
    float32 GetHRelativeDesiredRotationYawForWalk()
    {
        if (this.Entity.IsValid())
        {
            FFPTime local_8 = FFPTime();
            FFPTime local_4 = (this.GetContextSampleTime() - 1);
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


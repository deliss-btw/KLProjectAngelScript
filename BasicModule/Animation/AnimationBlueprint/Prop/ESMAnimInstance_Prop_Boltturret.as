

class UESMAnimInstance_Prop_Boltturret : UESMAnimInstance_Prop
{
    UPROPERTY()
    FC_LookResolved LookResolved;
    UPROPERTY()
    FC_AnimAimPoseOutput AnimAimPoseOutput;
    UPROPERTY()
    FC_AimPoseConfig AimPoseConfig;

    UESMAnimInstance_Prop_Boltturret()
    {
        super();
        return;
    }
    UFUNCTION()
    void EntitySync_SyncHistory_Implementation(const FFPTime &inout SampleTime)
    {
        int local_6 = 0;
        int local_48 = 0;
        if (!(local_6) || !(local_6.GetInterpoValue(SampleTime, this.AnimAimPoseOutput)))
        {
            FC_AnimAimPoseOutput local_42;
            this.AnimAimPoseOutput = local_42;
        }
        if (!(local_48) || !(local_48.GetInterpoValue(SampleTime, this.AimPoseConfig)))
        {
            FC_AimPoseConfig local_74;
            this.AimPoseConfig = local_74;
        }
        return;
    }
    UFUNCTION()
    void EntitySync_SyncView_Implementation()
    {
        return;
    }
}


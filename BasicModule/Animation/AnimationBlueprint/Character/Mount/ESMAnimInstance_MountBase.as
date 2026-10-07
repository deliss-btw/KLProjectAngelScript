

class UESMAnimInstance_MountBase : UESMAnimInstance_Base
{
    UPROPERTY()
    FC_AniParamSampleTrajectory AniParamSampleTrajectory;
    UPROPERTY()
    FC_AnimSampleTrajectoryDeltaMoveRecorder SampleTrajectoryRecorder;
    UPROPERTY()
    FC_AnimParamMountRopeControl AnimParamMountRopeControl;
    UPROPERTY()
    FC_AnimMoveParamsTemp AnimMoveParamsTemp;
    UPROPERTY()
    FC_AnimParamRandomFootstep AnimParamRandomFootstep;

    UESMAnimInstance_MountBase()
    {
        super();
        return;
    }
    UFUNCTION()
    void WhenUpdateMainAnimInstance_Implementation(const float32 DeltaTimeX)
    {
        Super::WhenUpdateMainAnimInstance_Implementation(DeltaTimeX);
        if (this.GetbLogicUpdate())
        {
            return;
        }
        if (this.AnimParamMountRopeControl.bIsEnabled)
        {
            Get local_6;
            if (!(local_6.opCall()))
            {
                this.AnimParamMountRopeControl.bIsEnabled = false;
                this.AnimParamMountRopeControl.Alpha = 0.0f;
                return;
            }
            this.UpdateRopeControlFromRider(this.AnimParamMountRopeControl);
        }
        return;
    }
    UFUNCTION()
    void EntitySync_SyncHistory_Implementation(const FFPTime &inout SampleTime)
    {
        int local_6 = 0;
        int local_50 = 0;
        Super::EntitySync_SyncHistory_Implementation(SampleTime);
        if (!(local_6) || !(local_6.GetInterpoValue(SampleTime, this.AniParamSampleTrajectory)))
        {
            FC_AniParamSampleTrajectory local_44;
            this.AniParamSampleTrajectory = local_44;
        }
        if (!(local_50) || !(local_50.GetInterpoValue(SampleTime, this.AnimMoveParamsTemp)))
        {
            FC_AnimMoveParamsTemp local_52;
            this.AnimMoveParamsTemp = local_52;
        }
        return;
    }
    UFUNCTION()
    void EntitySync_SyncView_Implementation()
    {
        Super::EntitySync_SyncView_Implementation();
        GetDefaulted local_4;
        this.AnimParamMountRopeControl = local_4.opCall();
        GetDefaulted local_8;
        this.AnimParamRandomFootstep = local_8.opCall();
        return;
    }
    UFUNCTION()
    void EntitySync_SyncLogic_Implementation()
    {
        GetDefaulted local_4;
        this.SampleTrajectoryRecorder = local_4.opCall();
        return;
    }
    void UpdateRopeControlFromRider(const FC_AnimParamMountRopeControl &inout RopeConfig)
    {
        int local_6 = 0;
        const AActor local_16;
        if (!(local_6))
        {
            return;
        }
        FECSEntity local_12 = FECSEntity(local_6.GetDriverEntity());
        if (!(local_12.IsValid()))
        {
            return;
        }
        local_16 = local_12.GetActor();
        if ((!((local_16 != nullptr))))
        {
            return;
        }
        AGameCharacter local_20 = (Cast<AGameCharacter>(local_16));
        if (local_20 == nullptr)
        {
            return;
        }
        USkeletalMeshComponent local_22 = local_20.ViewMesh;
        if (local_22 == nullptr)
        {
            return;
        }
        USkeletalMeshComponent local_24 = this.GetOwningComponent();
        if (local_24 == nullptr)
        {
            return;
        }
        FTransform local_76 = local_24.GetWorldTransform();
        FVector local_90 = local_22.GetSocketLocation(n"S_L_CatchPoint");
        FVector local_82 = local_22.GetSocketLocation(n"S_R_CatchPoint");
        FTransform local_52 = local_22.GetSocketTransform(n"S_L_StepPoint", ERelativeTransformSpace(0));
        FTransform local_120 = local_22.GetSocketTransform(n"S_R_StepPoint", ERelativeTransformSpace(0));
        this.AnimParamMountRopeControl.C_LHandLocation = local_76.InverseTransformPosition(local_90);
        this.AnimParamMountRopeControl.C_RHandLocation = local_76.InverseTransformPosition(local_82);
        this.AnimParamMountRopeControl.C_LFootLocation = local_76.InverseTransformPosition(local_52.GetLocation());
        this.AnimParamMountRopeControl.C_RFootLocation = local_76.InverseTransformPosition(local_120.GetLocation());
        this.AnimParamMountRopeControl.C_LFootRotation = local_76.InverseTransformRotation(local_52.GetRotation());
        this.AnimParamMountRopeControl.C_RFootRotation = local_76.InverseTransformRotation(local_120.GetRotation());
        return;
    }
}


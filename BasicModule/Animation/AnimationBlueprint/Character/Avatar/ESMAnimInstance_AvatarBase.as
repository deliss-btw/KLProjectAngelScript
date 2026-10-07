

class UESMAnimInstance_AvatarBase : UESMAnimInstance_Base
{
    UPROPERTY()
    float32 FootPhase = 0.0f;
    UPROPERTY()
    FC_PelvisAngleControl PelvisAngleControl;
    UPROPERTY()
    FC_AnimIdleHeadControl IdleHeadControl;
    UPROPERTY()
    FC_BipedAimOffset BipedAimOffset;
    UPROPERTY()
    FC_CharacterGroundMovementInfo CharacterGroundMovementInfo;
    UPROPERTY()
    FC_AnimPostProcessEnable AnimPostProcessEnable;
    UPROPERTY()
    FC_CharacterFootLockInfo CharacterFootLockInfo;
    UPROPERTY()
    FC_AnimParamRiderSwayControl AnimParamRiderSwayControl;
    UPROPERTY()
    FRiderSwayControlSetting RiderSwayControlSetting;
    UPROPERTY()
    FRiderSwayParams RiderSwayParams;
    UPROPERTY()
    float32 SlopeAdaptAlpha = 0.0f;
    UPROPERTY()
    float32 SlopeAdaptBlendInSpeed = 5.0f;
    UPROPERTY()
    float32 SlopeAdaptBlendOutSpeed = 5.0f;


    UFUNCTION()
    void BlueprintInitializeAnimation_Implementation()
    {
        Super::BlueprintInitializeAnimation_Implementation();
        ::FPhysicsRiderSwayUtils::InitializeRiderSway(this.RiderSwayControlSetting, this.RiderSwayParams);
        return;
    }
    void HandleFootPhase(const FC_CharacterAnimData &inout InterpolatedAnimData, const FFPTime &inout WorldTime)
    {
        this.FootPhase = InterpolatedAnimData.SampleFootPhase(WorldTime);
        this.FootPhase = FMath::Clamp(this.FootPhase, 0.0f, 1.0f);
        return;
    }
    UFUNCTION()
    void WhenUpdateMainAnimInstance_Implementation(const float32 DeltaTimeX)
    {
        float32 local_3;
        Super::WhenUpdateMainAnimInstance_Implementation(DeltaTimeX);
        if (this.Entity.IsValid())
        {
            float32 local_2;
            local_2 = 0.0f;
            Get local_8;
            const FC_SlopeAdaptControl& local_10 = local_8.opCall();
            if (local_10)
            {
                if (local_10.GetRefCount() > 0)
                {
                    local_3 = 1.0f;
                }
                else
                {
                    local_3 = 0.0f;
                }
                local_2 = local_3;
            }
            float32 local_13 = this.SlopeAdaptAlpha;
            if (local_2 > local_13)
            {
            }
            else
            {
            }
            this.SlopeAdaptAlpha = FMath::FInterpTo(this.SlopeAdaptAlpha, local_2, DeltaTimeX, local_13);
            if (FMath::IsNearlyEqual(this.SlopeAdaptAlpha, local_2, 0.001f))
            {
                this.SlopeAdaptAlpha = local_2;
            }
        }
        if (this.AnimParamRiderSwayControl.GetbIsEnabled())
        {
            this.UpdateRiderSway(DeltaTimeX);
            return;
        }
        this.RiderSwayParams.bHasPrevLocation = false;
        this.RiderSwayParams.SmoothedVelocity = FVector::ZeroVector;
        this.RiderSwayParams.PrevSmoothedVelocity = FVector::ZeroVector;
        this.RiderSwayParams.SmoothedAccel = FVector::ZeroVector;
        this.RiderSwayParams.bHasPrevYaw = false;
        local_3 = 0.0f;
        this.RiderSwayParams.SmoothedAngularSpeed = 0.0f;
        this.RiderSwayParams.CurrentMultiplier = 1.0f;
        return;
    }
    UFUNCTION()
    void EntitySync_SyncHistory_Implementation(const FFPTime &inout SampleTime)
    {
        int local_6 = 0;
        int local_16 = 0;
        int local_30 = 0;
        int local_52 = 0;
        int local_98 = 0;
        int local_116 = 0;
        int local_162 = 0;
        Super::EntitySync_SyncHistory_Implementation(SampleTime);
        if (!(local_6) || !(local_6.GetInterpoValue(SampleTime, this.PelvisAngleControl)))
        {
            FC_PelvisAngleControl local_10;
            this.PelvisAngleControl = local_10;
        }
        if (!(local_16) || !(local_16.GetInterpoValue(SampleTime, this.IdleHeadControl)))
        {
            FC_AnimIdleHeadControl local_24;
            this.IdleHeadControl = local_24;
        }
        if (!(local_30) || !(local_30.GetInterpoValue(SampleTime, this.BipedAimOffset)))
        {
            FC_BipedAimOffset local_46;
            this.BipedAimOffset = local_46;
        }
        if (!(local_52) || !(local_52.GetInterpoValue(SampleTime, this.CharacterGroundMovementInfo)))
        {
            FC_CharacterGroundMovementInfo local_92;
            this.CharacterGroundMovementInfo = local_92;
        }
        if (!(local_98) || !(local_98.GetInterpoValue(SampleTime, this.AnimPostProcessEnable)))
        {
            FC_AnimPostProcessEnable local_110;
            this.AnimPostProcessEnable = local_110;
        }
        if (!(local_116) || !(local_116.GetInterpoValue(SampleTime, this.CharacterFootLockInfo)))
        {
            FC_CharacterFootLockInfo local_156;
            this.CharacterFootLockInfo = local_156;
        }
        if (!(local_162) || !(local_162.GetInterpoValue(SampleTime, this.AnimParamRiderSwayControl)))
        {
            FC_AnimParamRiderSwayControl local_168;
            this.AnimParamRiderSwayControl = local_168;
        }
        return;
    }
    UFUNCTION()
    void EntitySync_SyncView_Implementation()
    {
        Super::EntitySync_SyncView_Implementation();
        return;
    }
    void UpdateRiderSway(const float32 DeltaTime)
    {
        AActor local_2 = this.GetOwningActor();
        if (local_2 == nullptr)
        {
            return;
        }
        ::FPhysicsRiderSwayUtils::UpdateRiderSway(DeltaTime, local_2.GetActorLocation(), float32(local_2.GetActorRotation().Yaw), this.RiderSwayParams, this.RiderSwayControlSetting);
        return;
    }
}


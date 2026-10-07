

class UESMAnimInstance_MonsterBase : UESMAnimInstance_Base
{
    UPROPERTY()
    int Phase = 0;
    UPROPERTY()
    TArray<FShakeBoneChainConfig> ShakeBoneChainConfigs;
    UPROPERTY()
    FShakeControlSetting ShakeControlSetting;
    UPROPERTY()
    FShakeDynamicParam ShakeDynamicParam;
    UPROPERTY()
    FC_AniParamSampleTrajectory SampleTrajectory;
    UPROPERTY()
    FC_AnimSampleTrajectoryDeltaMoveRecorder SampleTrajectoryRecorder;
    UPROPERTY()
    FC_PelvisAngleControl PelvisAngleControl;
    UPROPERTY()
    FRiderSwayControlSetting RiderSwayControlSetting;
    UPROPERTY()
    FRiderSwayParams RiderSwayParams;
    UPROPERTY()
    float32 RiderSwayPhysicsControlAlpha = 0.0f;
    UPROPERTY()
    float32 RiderSwayAlphaInterpSpeed = 6.0f;


    void UpdataCharacterEntityBBData(const FFPTime &inout LocalTime)
    {
        Super::UpdataCharacterEntityBBData(LocalTime);
        FNameHandle_EntityBBVar local_6;
        local_6;
        if (this.Entity.HasEntityBB(local_6))
        {
            FNameHandle_EntityBBVarInt local_12;
            local_12;
            this.Phase = this.Entity.GetBB_Int(local_12);
        }
        return;
    }
    UFUNCTION()
    void BlueprintInitializeAnimation_Implementation()
    {
        Super::BlueprintInitializeAnimation_Implementation();
        ::FPhysicsShakeUtils::InitializeShakeBoneChainConfigs(this.Entity, this.ShakeBoneChainConfigs, this.ShakeControlSetting);
        ::FPhysicsRiderSwayUtils::InitializeRiderSway(this.RiderSwayControlSetting, this.RiderSwayParams);
        return;
    }
    UFUNCTION()
    void WhenUpdateMainAnimInstance_Implementation(const float32 DeltaTimeX)
    {
        Super::WhenUpdateMainAnimInstance_Implementation(DeltaTimeX);
        FFPTime local_4 = this.GetContextSampleTime();
        if (this.bDebugTrigger)
        {
            this.ShakeDynamicParam.DynamicShakeStrengthScale = 1.0f;
            this.ShakeDynamicParam.DynamicShakeTimeScale = 1.0f;
            this.ShakeDynamicParam.PauseStartPercent = 0.01f;
            local_6 = 0.1f;
            this.ShakeDynamicParam.PauseDuration = 0.1f;
            this.ShakeDynamicParam.AttackerTransform = FTransform::Identity;
            this.ShakeDynamicParam.AttackerForwardVector = FVector(1.0, 0.0, 0.0);
            this.ShakeDynamicParam.AttackDirectionVector = FVector(0.0, 1.0, 0.0);
            ::FPhysicsShakeUtils::TriggerShake(this.Entity, local_4, FMath::RandRange(0, 5), this.ShakeBoneChainConfigs, this.ShakeControlSetting, this.ShakeDynamicParam, NAME_None);
        }
        ::FPhysicsShakeUtils::UpdateShakeState(this.Entity, local_4, this.ShakeBoneChainConfigs, this.ShakeControlSetting, this.ShakeDynamicParam);
        if (this.RiderSwayPhysicsControlAlpha > 0.01f)
        {
            this.UpdateRiderSway(DeltaTimeX);
        }
        else
        {
            this.RiderSwayParams.bHasPrevLocation = false;
            this.RiderSwayParams.SmoothedVelocity = FVector::ZeroVector;
            this.RiderSwayParams.PrevSmoothedVelocity = FVector::ZeroVector;
            this.RiderSwayParams.SmoothedAccel = FVector::ZeroVector;
            this.RiderSwayParams.CurrentMultiplier = 1.0f;
        }
        return;
    }
    void HandleHitShake(const FC_AnimBeHitShake &inout AnimBeHitShake)
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void EntitySync_SyncHistory_Implementation(const FFPTime &inout SampleTime)
    {
        int local_6 = 0;
        int local_50 = 0;
        Super::EntitySync_SyncHistory_Implementation(SampleTime);
        if (!(local_6) || !(local_6.GetInterpoValue(SampleTime, this.SampleTrajectory)))
        {
            FC_AniParamSampleTrajectory local_44;
            this.SampleTrajectory = local_44;
        }
        if (!(local_50) || !(local_50.GetInterpoValue(SampleTime, this.PelvisAngleControl)))
        {
            FC_PelvisAngleControl local_52;
            this.PelvisAngleControl = local_52;
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


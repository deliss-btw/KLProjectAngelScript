

class US_WizardIceStreamProducerSystemAS : UECSScriptSystem
{
    US_WizardIceStreamProducerSystemAS()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    UFUNCTION()
    void ClientJob_PushWizardIceStreamRequest(const FECSEntity &inout Entity, const FC_AnimAimPoseOutput &inout AimPoseOutput, const FCS_FixedTime &inout FixedTime, FC_LookRequestViewLocal &inout ViewLocal) const
    {
        if (FMath::IsNearlyZero(AimPoseOutput.GetTargetWeight(), 1e-8f))
        {
            return;
        }
        float32 local_4 = 0.0f;
        Get local_8;
        const FC_CharacterMovementControl& local_10 = local_8.opCall();
        if (local_10)
        {
            local_4 = local_10.GetRelativeDesiredRotationYaw();
        }
        float32 local_11 = 0.0f;
        Get local_16;
        const FC_AimTargetControl& local_18 = local_16.opCall();
        if (local_18)
        {
            local_11 = local_18.GetAimTargetPitch();
        }
        ::FC_LookRequest::PushOrUpdateViewBySource(Entity, EAnimLookSource(65), 60, uint8(::FAnimSnapshot::MakeSnapshotTypeMask(EAnimSnapshotType(1))), nullptr, FVector::ZeroVector, 0.2f, FRotator(local_11, local_4, 0.0));
        return;
    }
    UFUNCTION()
    void Run_ClientJob_PushWizardIceStreamRequest() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_184 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.ClientJob_PushWizardIceStreamRequest(local_40, local_42, local_6, local_48);
                FECSEntity::MarkModifiedIfDirty<FC_LookRequestViewLocal> local_56;
                local_56.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Exclude(local_94).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_112 = 0;
        FECSRuntimeViewIterator local_146 = local_94.Iterator();
        for (; local_146.CanProceed;)
        {
            local_40 = local_146.Proceed();
            ++local_112;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ClientJob_PushWizardIceStreamRequest(local_184, local_42, local_6, local_48);
            FECSEntity::MarkModifiedIfDirty<FC_LookRequestViewLocal>(local_40).opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_112);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
}


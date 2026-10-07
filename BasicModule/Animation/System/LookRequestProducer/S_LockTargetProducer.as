

class US_LookRequestLockTargetProducerSystemAS : UECSScriptSystem
{
    US_LookRequestLockTargetProducerSystemAS()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    UFUNCTION()
    void Job_PushLockTargetLookRequest(const FECSEntity &inout Entity, const FC_AnimAimPoseOutput &inout AimPoseOutput, const FC_LockTarget &inout LockTarget, FC_LookRequestLocal &inout LookRequestLocal) const
    {
        int local_2 = 55;
        int local_1 = local_2;
        if (FMath::IsNearlyZero(AimPoseOutput.GetTargetWeight(), 1e-8f))
        {
            return;
        }
        if (!(LockTarget.GetbCachedValidLockTargetPosition()))
        {
            return;
        }
        FVector local_36 = (FVector(LockTarget.GetLogicLockTargetPosition()) + FVector(0.0, 0.0, 60.0));
        ::FC_LookRequest::PushOrUpdateBySource(Entity, EAnimLookSource(local_1), 50, uint8(::FAnimSnapshot::MakeSnapshotTypeMask(EAnimSnapshotType(0))), nullptr, local_36, 0.2f, FRotator::ZeroRotator);
        return;
    }
    UFUNCTION()
    void Run_Job_PushLockTargetLookRequest() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_50 = 0;
        MarkModifiedIfDirty local_58;
        int local_198 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_PushLockTargetLookRequest(local_36, local_38, local_44, local_50);
                local_58.opCall(local_50);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_96 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Exclude(local_96).opCall();
        Exclude(local_96).opCall();
        Exclude(local_96).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_126 = 0;
        FECSRuntimeViewIterator local_160 = local_96.Iterator();
        for (; local_160.CanProceed;)
        {
            local_36 = local_160.Proceed();
            ++local_126;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_PushLockTargetLookRequest(local_198, local_38, local_44, local_50);
            local_58.opCall(local_50);
        }
        local_2.UpdateCachedEntityCount(local_126);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}


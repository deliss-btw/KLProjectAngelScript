

class US_LookRequestTrajectorySystemAS : UECSScriptSystem
{
    US_LookRequestTrajectorySystemAS()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    UFUNCTION()
    void Job_PushSampleTrajectoryLookRequest(const FECSEntity &inout Entity, const FC_AnimAimPoseOutput &inout AimPoseOutput, const FC_AniParamSampleTrajectory &inout Trajectory, const FCS_FixedTime &inout FixedTime, FC_LookRequestLocal &inout LookRequestLocal) const
    {
        if (FMath::IsNearlyZero(AimPoseOutput.GetTargetWeight(), 1e-8f))
        {
            return;
        }
        if (FMath::IsNearlyZero(Trajectory.GetWeight(), 1e-8f))
        {
            return;
        }
        FVector local_10(Trajectory.GetData().GetLookAtPoint());
        ::FC_LookRequest::PushOrUpdateBySource(Entity, EAnimLookSource(25), 25, uint8(::FAnimSnapshot::MakeSnapshotTypeMask(EAnimSnapshotType(0))), nullptr, local_10, 0.2f, FRotator::ZeroRotator);
        return;
    }
    UFUNCTION()
    void Job_PushLongNeckSampleTrajectoryLookRequest(const FECSEntity &inout Entity, const FC_AimPoseConfig &inout AimPoseConfig, const FC_AnimAimPoseOutput &inout AimPoseOutput, const FC_AniParamSampleTrajectory &inout Trajectory, const FCS_FixedTime &inout FixedTime, FC_LookRequestLocal &inout LookRequestLocal, const FC_Transform &inout Transform, const FC_Collision &inout Collision) const
    {
        if (FMath::IsNearlyZero(AimPoseOutput.GetTargetWeight(), 1e-8f))
        {
            return;
        }
        if (FMath::IsNearlyZero(Trajectory.GetWeight(), 1e-8f))
        {
            return;
        }
        FVector local_10(Trajectory.GetData().GetLookAtPoint());
        ::LookRequestLongNeck::ApplyLongNeckLimit(Transform, Collision, AimPoseConfig, local_10, 0.0f, 1000.0f);
        ::FC_LookRequest::PushOrUpdateBySource(Entity, EAnimLookSource(25), 25, uint8(::FAnimSnapshot::MakeSnapshotTypeMask(EAnimSnapshotType(0))), nullptr, local_10, 0.2f, FRotator::ZeroRotator);
        return;
    }
    UFUNCTION()
    void Run_Job_PushSampleTrajectoryLookRequest() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        MarkModifiedIfDirty local_62;
        int local_198 = 0;
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
                this.Job_PushSampleTrajectoryLookRequest(local_40, local_42, local_48, local_6, local_54);
                local_62.opCall(local_54);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_100 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Include local_116;
        local_116.opCall();
        Exclude(local_100).opCall();
        Exclude(local_100).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_126 = 0;
        FECSRuntimeViewIterator local_160 = local_100.Iterator();
        for (; local_160.CanProceed;)
        {
            local_40 = local_160.Proceed();
            ++local_126;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_PushSampleTrajectoryLookRequest(local_198, local_42, local_48, local_6, local_54);
            local_62.opCall(local_54);
        }
        local_4.UpdateCachedEntityCount(local_126);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_PushLongNeckSampleTrajectoryLookRequest() const
    {
        int local_6 = 0;
        int local_160 = 0;
        int local_162 = 0;
        int local_168 = 0;
        int local_174 = 0;
        int local_180 = 0;
        int local_186 = 0;
        int local_192 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        FECSRuntimeView local_48 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_52;
        local_52.opCall();
        FECSRuntimeView::Include<FC_AnimAimPoseOutput>(local_48).opCall();
        Include local_60;
        local_60.opCall();
        Include local_64;
        local_64.opCall();
        Include local_68;
        local_68.opCall();
        Include local_72;
        local_72.opCall();
        Include local_76;
        local_76.opCall();
        Include local_80;
        local_80.opCall();
        Exclude(local_48).opCall();
        FECSRuntimeViewIterator local_118 = local_48.Iterator();
        for (; local_118.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_157 = FECSEntityScopeCycleCounter(local_118.Proceed());
            this.Job_PushLongNeckSampleTrajectoryLookRequest(local_160, local_162, local_168, local_174, local_6, local_180, local_186, local_192);
            MarkModifiedIfDirty local_200;
            local_200.opCall(local_180);
        }
        return;
    }
}


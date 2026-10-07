

class US_AnimSampleTrajectorySystem : UECSScriptSystem
{
    US_AnimSampleTrajectorySystem()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    UFUNCTION()
    void Job_SampleTrajectoryRecordMoveInfo(const FECSEntity &inout Entity, FC_AniParamSampleTrajectory &inout Trajectory) const
    {
        Trajectory.GetData().RecordMoveInfo(Entity, Trajectory.GetTimeOffset());
        return;
    }
    UFUNCTION()
    void Job_UpdateSampleTrajectory(const FECSEntity &inout Entity, FC_AniParamSampleTrajectory &inout Trajectory) const
    {
        if (Trajectory.GetTimeOffset() > 0.0f)
        {
            Trajectory.GetData().SampleTrajectory(Entity, Trajectory.GetTimeOffset());
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateSampleTrajectoryWeight(const FECSEntity &inout Entity, FC_AniParamSampleTrajectory &inout Trajectory, FC_AnimSampleTrajectoryWeightBlending &inout WeightBlending, const FCS_FixedTime &inout FixedTime) const
    {
        float32 local_8;
        Has local_6;
        bool local_7 = local_6.opCall();
        if (local_7)
        {
            local_8 = 0.0f;
        }
        else
        {
            local_8 = 1.0f;
        }
        if (WeightBlending.GetWeightBlendRate() <= 0.0f)
        {
            Trajectory.SetWeight(local_8);
            return;
        }
        Trajectory.SetWeight(FMath::FInterpConstantTo(Trajectory.GetWeight(), local_8, float32(FixedTime.DeltaTime.ToSeconds()), WeightBlending.GetWeightBlendRate()));
        return;
    }
    UFUNCTION()
    void Job_BlendOutSampleTrajectory(const FECSEntity &inout Entity, FC_AniParamSampleTrajectory &inout Trajectory) const
    {
        bool local_2 = Trajectory.GetData().EraseMoveInfo(Entity);
        Has local_8;
        bool local_1 = !(local_8.opCall()) || (Trajectory.GetWeight() <= 0.0f);
        bool local_11 = !(local_2);
        if ((local_11 && local_1))
        {
            Remove local_16;
            local_16.opCall();
            Remove local_20;
            local_20.opCall();
            Remove local_24;
            local_24.opCall();
        }
        return;
    }
    UFUNCTION()
    void Job_SampleTrajectoryFromCurve(const FECSEntity &inout Entity, FC_AnimSampleTrajectoryFromCurve &inout SampleTrajectoryFromCurve) const
    {
        if (SampleTrajectoryFromCurve.GetbDoSample())
        {
            ModifyOrAdd local_6;
            FC_AniParamSampleTrajectory& local_8 = local_6.opCall();
            if (local_8)
            {
                local_8.GetData().SampleTrajectoryFromCurve(Entity, SampleTrajectoryFromCurve.GetRearCurvatureCurve(), SampleTrajectoryFromCurve.GetFrontCurvatureCurve(), SampleTrajectoryFromCurve.GetbExpired());
            }
            SampleTrajectoryFromCurve.SetbDoSample(false);
        }
        if (SampleTrajectoryFromCurve.GetbExpired())
        {
            Remove local_16;
            local_16.opCall();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_SampleTrajectoryRecordMoveInfo() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_174 = 0;
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
                this.Job_SampleTrajectoryRecordMoveInfo(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_84.Iterator();
        for (; local_136.CanProceed;)
        {
            local_36 = local_136.Proceed();
            ++local_102;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_SampleTrajectoryRecordMoveInfo(local_174, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_102);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateSampleTrajectory() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_174 = 0;
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
                this.Job_UpdateSampleTrajectory(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_84.Iterator();
        for (; local_136.CanProceed;)
        {
            local_36 = local_136.Proceed();
            ++local_102;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_UpdateSampleTrajectory(local_174, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_102);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateSampleTrajectoryWeight() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        MarkModifiedIfDirty local_60;
        int local_188 = 0;
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
                this.Job_UpdateSampleTrajectoryWeight(local_40, local_42, local_48, local_6);
                FECSEntity::MarkModifiedIfDirty<FC_AniParamSampleTrajectory> local_56;
                local_56.opCall(local_42);
                local_60.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Exclude(local_98).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_116 = 0;
        FECSRuntimeViewIterator local_150 = local_98.Iterator();
        for (; local_150.CanProceed;)
        {
            local_40 = local_150.Proceed();
            ++local_116;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_UpdateSampleTrajectoryWeight(local_188, local_42, local_48, local_6);
            FECSEntity::MarkModifiedIfDirty<FC_AniParamSampleTrajectory>(local_40).opCall(local_42);
            local_60.opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_116);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_BlendOutSampleTrajectory() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_174 = 0;
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
                this.Job_BlendOutSampleTrajectory(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_84.Iterator();
        for (; local_136.CanProceed;)
        {
            local_36 = local_136.Proceed();
            ++local_102;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_BlendOutSampleTrajectory(local_174, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_102);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_SampleTrajectoryFromCurve() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_170 = 0;
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
                this.Job_SampleTrajectoryFromCurve(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_SampleTrajectoryFromCurve(local_170, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}


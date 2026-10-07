

class US_AnimAimPoseSystemAS : UECSScriptSystem
{
    US_AnimAimPoseSystemAS()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    UFUNCTION()
    void Job_WriteAimPoseOutput(const FECSEntity &inout Entity, FC_AnimAimPoseOutput &inout Output, const FCS_FixedTime &inout FixedTime) const
    {
        float32 local_1;
        local_1 = Output.GetTargetWeight();
        if (FMath::IsNearlyZero(Output.GetWeight(), 1e-8f) && FMath::IsNearlyZero(local_1, 1e-8f))
        {
            return;
        }
        float32 local_3 = FixedTime.DeltaTime;
        if (FMath::IsNearlyZero(Output.GetWeight() - local_1, 0.01f))
        {
            Output.SetWeight(local_1);
            return;
        }
        Output.SetWeight(FMath::FInterpTo(Output.GetWeight(), local_1, local_3, Output.GetWeightLerpSpeed()));
        return;
    }
    UFUNCTION()
    void Run_Job_WriteAimPoseOutput() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_178 = 0;
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
                this.Job_WriteAimPoseOutput(local_40, local_42, local_6);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_106 = 0;
        FECSRuntimeViewIterator local_140 = local_88.Iterator();
        for (; local_140.CanProceed;)
        {
            local_40 = local_140.Proceed();
            ++local_106;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_WriteAimPoseOutput(local_178, local_42, local_6);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_106);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
}




class US_GOAPSystem : UECSScriptSystem
{
    US_GOAPSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_TickAction(FC_GOAP &inout GOAP) const
    {
        if (GOAP.Instance != nullptr)
        {
            GOAP.Instance.Tick(float32(ECS::GetContextDeltaTime().ToSeconds()));
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickAction() const
    {
        int local_36 = 0;
        MarkModifiedIfDirty local_44;
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
                this.Job_TickAction(local_36);
                local_44.opCall(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_82 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_86;
        local_86.opCall();
        Exclude(local_82).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_92 = 0;
        FECSRuntimeViewIterator local_126 = local_82.Iterator();
        for (; local_126.CanProceed;)
        {
            const FECSEntity& local_162 = local_126.Proceed();
            ++local_92;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_162.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_162);
            this.Job_TickAction(local_36);
            local_44.opCall(local_36);
        }
        local_2.UpdateCachedEntityCount(local_92);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}


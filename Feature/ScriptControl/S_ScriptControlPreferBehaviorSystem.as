

class US_SCtrlPreferBehaviorSystem : UECSScriptSystem
{
    US_SCtrlPreferBehaviorSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_UpdatePreferBehavior(const FECSEntity &inout Entity, FC_ScriptControl &inout LC) const
    {
        ::ScriptControlUtils::RefreshPreferBehavior(LC);
        return;
    }
    UFUNCTION()
    void Run_Job_UpdatePreferBehavior() const
    {
        const FECSEntity& local_42;
        int local_44 = 0;
        MarkModifiedIfDirty local_52;
        int local_172 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(0.5))))
        {
            return;
        }
        int local_11 = 0;
        int local_10 = local_11;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_14 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_18 = local_4.GetViewCacheEntities();
            int local_19 = 0;
            for (auto& local_34 : local_18)
            {
                local_34;
                FECSEntity local_38;
                if (!(local_38.IsValid()))
                {
                    continue;
                }
                ++local_19;
                FECSEntityScopeCycleCounter local_39 = FECSEntityScopeCycleCounter(local_38);
                this.Job_UpdatePreferBehavior(local_42, local_44);
                local_52.opCall(local_44);
            }
            local_4.UpdateCachedEntityCount(local_19);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Exclude(local_90).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_20 = local_4.GetViewCacheEpoch();
        int local_100 = 0;
        FECSRuntimeViewIterator local_134 = local_90.Iterator();
        for (; local_134.CanProceed;)
        {
            local_42 = local_134.Proceed();
            ++local_100;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_42.GetId());
            }
            FECSEntityScopeCycleCounter local_39_2 = FECSEntityScopeCycleCounter(local_42);
            this.Job_UpdatePreferBehavior(local_172, local_44);
            local_52.opCall(local_44);
        }
        local_4.UpdateCachedEntityCount(local_100);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_20);
        }
        return;
    }
}


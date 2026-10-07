

class US_EcologyStatsSystem : UECSScriptSystem
{
    US_EcologyStatsSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_OnCreatureMarkedDestroy(const FECSEntity &inout Entity) const
    {
        int local_6 = 0;
        int local_26 = 0;
        int local_40 = 0;
        if (!(local_6))
        {
            return;
        }
        if (!(FECSEntity(local_6.RuntimeSpawnerEntity)))
        {
            return;
        }
        Has local_20;
        if (!(local_20.opCall()))
        {
            return;
        }
        Has local_32;
        bool local_7 = local_32.opCall();
        FECSWorldPtr local_34 = ECS::GetECSWorld();
        local_26.RecordDestroy(Entity.GetId(), local_40.Time, local_7);
        return;
    }
    UFUNCTION()
    void Job_OnSpawnerRefresh(const FECSEntity &inout Entity, FC_EcologySpawnerStats &inout Stats) const
    {
        ++Stats.RefreshCount;
        return;
    }
    UFUNCTION()
    void Run_Job_OnCreatureMarkedDestroy_StaticReg() const
    {
        const FECSEntity& local_38;
        int local_158 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 1;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_OnCreatureMarkedDestroy(local_38);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_76 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_80;
        local_80.opCall();
        Exclude(local_76).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_86 = 0;
        FECSRuntimeViewIterator local_120 = local_76.Iterator();
        for (; local_120.CanProceed;)
        {
            local_38 = local_120.Proceed();
            ++local_86;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_OnCreatureMarkedDestroy(local_158);
        }
        local_4.UpdateCachedEntityCount(local_86);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_OnCreatureMarkedDestroy_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_158 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_6 = 0;
        int local_5 = local_6;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_OnCreatureMarkedDestroy(local_38);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_76 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_80;
        local_80.opCall();
        Exclude(local_76).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_86 = 0;
        FECSRuntimeViewIterator local_120 = local_76.Iterator();
        for (; local_120.CanProceed;)
        {
            local_38 = local_120.Proceed();
            ++local_86;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_OnCreatureMarkedDestroy(local_158);
        }
        local_4.UpdateCachedEntityCount(local_86);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_OnCreatureMarkedDestroy_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_158 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 2;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_OnCreatureMarkedDestroy(local_38);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_76 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_80;
        local_80.opCall();
        Exclude(local_76).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_86 = 0;
        FECSRuntimeViewIterator local_120 = local_76.Iterator();
        for (; local_120.CanProceed;)
        {
            local_38 = local_120.Proceed();
            ++local_86;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_OnCreatureMarkedDestroy(local_158);
        }
        local_4.UpdateCachedEntityCount(local_86);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_OnSpawnerRefresh_StaticReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        MarkModifiedIfDirty local_48;
        int local_172 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 1;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_OnSpawnerRefresh(local_38, local_40);
                local_48.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Exclude(local_86).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_100 = 0;
        FECSRuntimeViewIterator local_134 = local_86.Iterator();
        for (; local_134.CanProceed;)
        {
            local_38 = local_134.Proceed();
            ++local_100;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_OnSpawnerRefresh(local_172, local_40);
            local_48.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_100);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_OnSpawnerRefresh_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        MarkModifiedIfDirty local_48;
        int local_172 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_6 = 0;
        int local_5 = local_6;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_OnSpawnerRefresh(local_38, local_40);
                local_48.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Exclude(local_86).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_100 = 0;
        FECSRuntimeViewIterator local_134 = local_86.Iterator();
        for (; local_134.CanProceed;)
        {
            local_38 = local_134.Proceed();
            ++local_100;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_OnSpawnerRefresh(local_172, local_40);
            local_48.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_100);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_OnSpawnerRefresh_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        MarkModifiedIfDirty local_48;
        int local_172 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 2;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_OnSpawnerRefresh(local_38, local_40);
                local_48.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Exclude(local_86).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_100 = 0;
        FECSRuntimeViewIterator local_134 = local_86.Iterator();
        for (; local_134.CanProceed;)
        {
            local_38 = local_134.Proceed();
            ++local_100;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_OnSpawnerRefresh(local_172, local_40);
            local_48.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_100);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
}


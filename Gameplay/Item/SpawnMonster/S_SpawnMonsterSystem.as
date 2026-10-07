

class US_SpawnMonsterSystem : UECSScriptSystem
{
    US_SpawnMonsterSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_SpawnMonsterOnDeath(const FCE_DeathEvent &inout Event) const
    {
        int local_6 = 0;
        bool local_12;
        if (!(local_6))
        {
            local_12 = false;
        }
        else
        {
            Has local_10;
            local_12 = local_10.opCall();
        }
        if (local_12)
        {
            ::SpawnMonsterUtils::SpawnMonsterByConfig(Event.Sender, local_6.SpawnMonsterConfigs);
        }
        return;
    }
    UFUNCTION()
    void Job_SpawnMonsterOnSpawn(const FECSEntity &inout Entity, const FC_SpawnMonsterConfig &inout Config) const
    {
        ::SpawnMonsterUtils::SpawnMonsterByConfig(Entity, Config.SpawnMonsterConfigs);
        Remove local_4;
        local_4.opCall();
        return;
    }
    UFUNCTION()
    void Run_Job_SpawnMonsterOnDeath() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DeathEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DeathEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_SpawnMonsterOnDeath(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_SpawnMonsterOnSpawn() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_166 = 0;
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
                this.Job_SpawnMonsterOnSpawn(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_80.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_SpawnMonsterOnSpawn(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}




class US_EcosimAIV2LevelSystem : UECSScriptSystem
{
    US_EcosimAIV2LevelSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_HandleWaveMemberDeath(const FCE_DeathEvent &inout Event) const
    {
        Get local_4;
        if (local_4.opCall())
        {
            Modify local_12;
            FC_EcosimAIV2WaveInfo& local_14 = local_12.opCall();
            if (local_14)
            {
                FCE_EcosimAIV2WaveMemberChange local_24;
                local_14.TotalDeathCount = (int(local_14.TotalDeathCount) + 1);
                FFPTime local_22 = FFPTime(-1);
                local_24.CurrentNum = local_14.WaveMemberEntityList.Num();
                local_24.bIsAdd = false;
                local_24.TotalDeathCount = int(local_14.TotalDeathCount);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_InitEcosimAIV2LevelSpawnInit(const FECSEntity &inout Entity, const FC_EcosimAIV2LevelSpawnInitInfo &inout EcosimAIV2LevelSpawnInitInfo) const
    {
        if (!(EcosimAIV2LevelSpawnInitInfo.ToState.IsNone()))
        {
            FESMExternalTransitHandle local_10 = Entity.ESMExternalTransit(NAME_None, EcosimAIV2LevelSpawnInitInfo.ToState, n"EcosimAIV2LevelSpawnInit");
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleWaveMemberDeath() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DeathEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DeathEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleWaveMemberDeath(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_InitEcosimAIV2LevelSpawnInit() const
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
                this.Job_InitEcosimAIV2LevelSpawnInit(local_36, local_38);
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
            this.Job_InitEcosimAIV2LevelSpawnInit(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}


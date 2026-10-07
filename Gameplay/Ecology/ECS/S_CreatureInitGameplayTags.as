

class US_CreatureInitGameplayTagsSystem : UECSScriptSystem
{
    US_CreatureInitGameplayTagsSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_ApplyCreatureInitGameplayTags(const FECSEntity &inout Entity, const FC_CreatureMeta &inout CreatureMeta) const
    {
        FGameplayTagContainer local_12;
        int local_116 = 0;
        if (CreatureMeta.CreatureConfigProxy.GetMonsterConfig())
        {
        }
        else
        {
            if (CreatureMeta.CreatureConfigProxy.GetNPCConfig())
            {
            }
        }
        if (local_12.IsEmpty())
        {
            return;
        }
        local_116.InitGameplayTags.AppendTags(local_12);
        return;
    }
    UFUNCTION()
    void Run_Job_ApplyCreatureInitGameplayTags() const
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
                this.Job_ApplyCreatureInitGameplayTags(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        local_84.opCall();
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
            this.Job_ApplyCreatureInitGameplayTags(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}




class US_MetaBuffSystem : UECSScriptSystem
{
    US_MetaBuffSystem()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_TickMetaBuffLifeTime(const FECSEntity &inout PlayerEntity, FC_PlayerMetaBuffList &inout C_PlayerMetaBuffList) const
    {
        int local_7 = 0;
        int64 local_6 = FDateTime::UtcNow().ToUnixTimestamp();
        int local_10 = C_PlayerMetaBuffList.GetMetaBuffs().Num() - 1;
        for (; local_10 >= 0; --local_10)
        {
            const FPlayerMetaBuff& local_14 = C_PlayerMetaBuffList.GetMetaBuffs()[local_10];
            if (local_14.GetMetaBuffConfig())
            {
                int64 local_16 = local_7;
                if (local_6 >= (local_14.GetStartTime() + local_16))
                {
                    C_PlayerMetaBuffList.GetModify_MetaBuffs().RemoveAt(local_10);
                }
            }
        }
        if (C_PlayerMetaBuffList.GetMetaBuffs().Num() == 0)
        {
            Remove local_24;
            local_24.opCall();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TickMetaBuffLifeTime() const
    {
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_170 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1))))
        {
            return;
        }
        int local_10 = 0;
        int local_9 = local_10;
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
                this.ServerJob_TickMetaBuffLifeTime(local_40, local_42);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Exclude(local_88).opCall();
        bool local_8 = local_4.BeginViewCacheBuild();
        int local_7 = local_4.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_88.Iterator();
        for (; local_132.CanProceed;)
        {
            local_40 = local_132.Proceed();
            ++local_98;
            if (local_8)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_TickMetaBuffLifeTime(local_170, local_42);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_98);
        if (local_8)
        {
            local_4.CommitViewCacheBuild(local_7);
        }
        return;
    }
}


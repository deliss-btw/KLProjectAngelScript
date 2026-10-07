

class US_NumLimitSystem : UECSScriptSystem
{
    US_NumLimitSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_HandleNumLimitedItemEndPlay(const FECSEntity &inout Entity, const FC_NumLimited &inout NumLimited) const
    {
        bool local_9;
        if (!(this.GetManagerEntity(Entity, NumLimited).IsValid()))
        {
            local_9 = false;
        }
        else
        {
            Has local_14;
            local_9 = local_14.opCall();
        }
        if (local_9)
        {
            Modify local_20;
            FC_NumLimitManager& local_22 = local_20.opCall();
            if (local_22)
            {
                int local_26 = local_22.GetManagerItems().Num() - 1;
                for (; local_26 >= 0; --local_26)
                {
                    if ((FECSEntityId(local_22.GetManagerItems()[local_26].GetEntity()) == Entity.GetId()))
                    {
                        local_22.GetModify_ManagerItems().RemoveAt(local_26);
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_HandleNumLimitedItemBeginPlay(const FECSEntity &inout Entity, const FC_NumLimited &inout NumLimited) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    UFUNCTION()
    void Job_DestroyNumLimitedEntity(const FECSEntity &inout Entity, FC_NumLimitManagerChanged &inout ManagerChanged, FC_NumLimitManager &inout Manager) const
    {
        int local_4 = Manager.GetManagerItems().Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            const FNumLimitedItem& local_8 = Manager.GetManagerItems()[local_4];
            int local_1 = -1;
            int local_10 = ManagerChanged.LimitNums.FindOrAdd(local_8.GetIdentifier(), local_1);
            if (int(local_10) == 0)
            {
                FECSEntity local_18 = FECSEntity(local_8.GetEntity());
                Has local_22;
                bool local_5 = local_22.opCall();
                if (local_5)
                {
                    ModifyOrAdd local_26;
                    local_26.opCall().DestroyType = (4 != 0);
                    Has local_32;
                    local_5 = local_32.opCall();
                    if (local_5)
                    {
                        local_5 = this.GetECSRuntime().IsServer;
                        Get local_36;
                        Get local_40;
                        ::FProjectileUtils::DestroyProjectile(local_18, local_40.opCall(), local_36.opCall().GetPosition(), ECS::GetContextTime(), FFPTime(0), local_5);
                    }
                    else
                    {
                        local_18.DestroyDeferred();
                    }
                }
                Manager.GetModify_ManagerItems().RemoveAt(local_4);
                continue;
            }
            if (int(local_10) > 0)
            {
                --local_10;
            }
        }
        Remove local_48;
        local_48.opCall();
        return;
    }
    FECSEntity GetManagerEntity(const FECSEntity &inout Entity, const FC_NumLimited &inout NumLimited) const
    {
        FECSEntity __return;
        int local_2 = int(NumLimited.ManagerType);
        if (local_2 <= 0)
        {
            if (local_2 != 0)
            {
            }
            else
            {
                GetDefaulted local_8;
                __return = local_8.opCall().GetOwnerEntity();
            }
        }
        return ENTITY_NULL;
    }
    UFUNCTION()
    void Run_Job_HandleNumLimitedItemEndPlay() const
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
                this.Job_HandleNumLimitedItemEndPlay(local_36, local_38);
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
            this.Job_HandleNumLimitedItemEndPlay(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleNumLimitedItemBeginPlay() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
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
                this.Job_HandleNumLimitedItemBeginPlay(local_36, local_38);
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
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_80.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_HandleNumLimitedItemBeginPlay(local_170, local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DestroyNumLimitedEntity() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        MarkModifiedIfDirty local_52;
        MarkModifiedIfDirty local_56;
        int local_184 = 0;
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
                this.Job_DestroyNumLimitedEntity(local_36, local_38, local_44);
                local_52.opCall(local_38);
                local_56.opCall(local_44);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Exclude(local_94).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_112 = 0;
        FECSRuntimeViewIterator local_146 = local_94.Iterator();
        for (; local_146.CanProceed;)
        {
            local_36 = local_146.Proceed();
            ++local_112;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_DestroyNumLimitedEntity(local_184, local_38, local_44);
            local_52.opCall(local_38);
            local_56.opCall(local_44);
        }
        local_2.UpdateCachedEntityCount(local_112);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}


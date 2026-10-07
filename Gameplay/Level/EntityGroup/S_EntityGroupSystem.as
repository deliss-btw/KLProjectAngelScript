

class US_EntityGroupSystem : UECSScriptSystem
{
    US_EntityGroupSystem()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_InitEntityGroup(const FECSEntity &inout GroupEntity, const FC_PrefabLoaded &inout PrefabLoaded) const
    {
        AECSPrefab local_36;
        AECSPrefab local_2 = ULevelActorManager::Get().FindPrefabByPath(PrefabLoaded.BPPathName);
        TArray<AActor> local_12;
        TArray<FEntityInGroup> local_16;
        int local_17 = 0;
        bool local_19 = true;
        local_2.GetAttachedActors(local_12, true, true);
        for (auto local_34 : local_12)
        {
            local_36 = Cast<AECSPrefab>(local_34);
            if (local_36 != nullptr)
            {
                FECSEntity local_44 = ECS::GetPrefabEntity(local_36);
                if ((local_44 == ENTITY_NULL))
                {
                    local_19 = false;
                    break;
                }
                FEntityInGroup local_50;
                local_50.EntityPrefab = local_36;
                local_50.Entity = local_44;
                local_16.Add(local_50);
                if (local_50.Entity.IsValid())
                {
                    ++local_17;
                }
            }
        }
        if (local_19)
        {
            ELog local_72;
            FC_EntityGroup local_56;
            local_56.EntityInfoList = local_16;
            local_56.AliveCount = local_17;
            Remove local_60;
            local_60.opCall();
            FString local_68 = "EntityGroupSystem: InitEntityGroup success. ";
            FString local_64 = GroupEntity.ToString();
            FString local_68_2 = (local_72 + " EntityNum:");
            int local_18 = local_16.Num();
            (local_68_2 + int(local_72));
            FString local_64_2 = (local_72 + " ChildActorNum:");
            int local_18_2 = local_12.Num();
            (local_64_2 + int(local_72));
        }
        return;
    }
    UFUNCTION()
    void ServerJob_ListenDeathEvent(const FECSEntity &inout GroupEntity, FC_EntityGroup &inout C_EntityGroup) const
    {
        AEntityGroupPrefab local_2 = (Cast<AEntityGroupPrefab>(ULevelActorManager::Get().GetInLevelPrefabByEntity(GroupEntity)));
        if (local_2 == nullptr)
        {
            return;
        }
        TECSEventConstIterator<FCE_DeathEvent> local_44 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_44.CanProceed;)
        {
            const FCE_DeathEvent& local_66 = local_44.Proceed();
            for (auto& local_80 : C_EntityGroup.EntityInfoList)
            {
                if ((local_80.Entity == local_66.Sender))
                {
                    --C_EntityGroup.AliveCount;
                    local_2.OnEntityDead.Broadcast(local_66, int(C_EntityGroup.AliveCount));
                    if (int(C_EntityGroup.AliveCount) == 0)
                    {
                        local_2.OnEntityAllDead.Broadcast();
                    }
                    break;
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_InitEntityGroup() const
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
                this.ServerJob_InitEntityGroup(local_36, local_38);
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
            this.ServerJob_InitEntityGroup(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_ListenDeathEvent() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
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
                this.ServerJob_ListenDeathEvent(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_84.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ServerJob_ListenDeathEvent(local_166, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}


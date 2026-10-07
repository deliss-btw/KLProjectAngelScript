

class US_LevelEventSystem : UECSScriptSystem
{
    US_LevelEventSystem()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_NotifyLevelEntityCreateFinish() const
    {
        ::ULevelEventManager::Get().NotifyEntityCreateFinish();
        return;
    }
    UFUNCTION()
    void ServerJob_NotifyLevelEntityAttributeChanged(const FECSEntity &inout Entity, const FC_GameAttribute &inout GameAttribute, const FC_GameAttributeChanged &inout GameAttributeChanged, const FC_GameAttributeSnapshot &inout GameAttributeSnapshot) const
    {
        int local_8 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        int local_9 = 0;
        for (; local_9 < GameAttributeChanged.GetChangedAttributeNum(); )
        {
            int local_11 = GameAttributeChanged.GetChangedAttributeLocalIndex(local_9);
            FGameAttributeRef local_28 = GameAttribute.GetAttributeRef(local_11);
            const FGameAttributeDefMeta& local_44 = GameAttribute.GetAttributeMeta(local_28);
            ::ULevelEventManager::Get().NotifyEntityAttributeChanged(Entity, local_28, GameAttributeSnapshot.GetAttributeValue(local_11, local_8.Time), GameAttribute.GetAttributeValue(local_11, local_8.Time));
            ++local_9;
        }
        return;
    }
    UFUNCTION()
    void Monitor_ClientOnAssignLevelScript(const FECSEntity &inout Entity, const FC_LevelScript &inout C_LevelScript) const
    {
        UClass local_22;
        AKLLevelScriptAreaEventBase local_26;
        FECSComponentConfigModifiableScope local_1;
        if (!(C_LevelScript.GetBPClassPath().IsNone()))
        {
            local_22 = (Cast<UClass>(FSoftClassPath(C_LevelScript.GetBPClassPath().ToString()).TryLoad()));
            if (local_22 != nullptr)
            {
                local_26 = (Cast<AKLLevelScriptAreaEventBase>(local_22.GetDefaultObject()));
                if (local_26 != nullptr)
                {
                    local_26.ClientInitEntityByDefaultObject(Entity);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleObjectiveStatusChanged(const FCE_ObjectiveStatusChanged &inout Event) const
    {
        if (int(Event.Status) == 2)
        {
            ::ULevelEventManager::Get().NotifyObjectiveFinish(int(Event.ObjectiveInstanceId));
        }
        return;
    }
    UFUNCTION()
    void ServerJob_PropOnEntityReady(const FCE_EntityOnReady &inout Event) const
    {
        int local_16 = 0;
        FECSEntity local_4 = FECSEntity(Event.EntityId);
        if (!(local_4))
        {
            return;
        }
        if (!(local_16))
        {
            return;
        }
        APropPrefabScriptBase local_22 = (Cast<APropPrefabScriptBase>(local_16.TryGetPrefabActor()));
        if (local_22 != nullptr)
        {
            local_22.OnEntityReady.Broadcast(local_4);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_PropOnEntityDie(const FCE_EntityOnDie &inout Event) const
    {
        int local_16 = 0;
        FECSEntity local_4 = FECSEntity(Event.EntityId);
        if (!(local_4))
        {
            return;
        }
        if (!(local_16))
        {
            return;
        }
        APropPrefabScriptBase local_22 = (Cast<APropPrefabScriptBase>(local_16.TryGetPrefabActor()));
        if (local_22 != nullptr)
        {
            local_22.OnEntityDie.Broadcast(local_4);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_PropOnEntityPendingDestroy(const FCE_EntityOnPendingDestroy &inout Event) const
    {
        int local_16 = 0;
        FECSEntity local_4 = FECSEntity(Event.EntityId);
        if (!(local_4))
        {
            return;
        }
        if (!(local_16))
        {
            return;
        }
        APropPrefabScriptBase local_22 = (Cast<APropPrefabScriptBase>(local_16.TryGetPrefabActor()));
        if (local_22 != nullptr)
        {
            local_22.OnEntityPendingDestroy.Broadcast(local_4);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_NotifyLevelEntityCreateFinish() const
    {
        ECS::GetContextJob();
        this.ServerJob_NotifyLevelEntityCreateFinish();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_NotifyLevelEntityAttributeChanged() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_50 = 0;
        int local_182 = 0;
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
                this.ServerJob_NotifyLevelEntityAttributeChanged(local_36, local_38, local_44, local_50);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_92 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Exclude(local_92).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_110 = 0;
        FECSRuntimeViewIterator local_144 = local_92.Iterator();
        for (; local_144.CanProceed;)
        {
            local_36 = local_144.Proceed();
            ++local_110;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ServerJob_NotifyLevelEntityAttributeChanged(local_182, local_38, local_44, local_50);
        }
        local_2.UpdateCachedEntityCount(local_110);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ClientOnAssignLevelScript() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorLevelScriptOnAssignView(EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ClientOnAssignLevelScript(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleObjectiveStatusChanged() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ObjectiveStatusChanged> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ObjectiveStatusChanged& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleObjectiveStatusChanged(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_PropOnEntityReady() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EntityOnReady> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EntityOnReady& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_PropOnEntityReady(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_PropOnEntityDie() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EntityOnDie> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EntityOnDie& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_PropOnEntityDie(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_PropOnEntityPendingDestroy() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EntityOnPendingDestroy> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EntityOnPendingDestroy& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_PropOnEntityPendingDestroy(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}




class US_EcologyPropSystem : UECSScriptSystem
{
    US_EcologyPropSystem()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_InitEcologyPropSpawner(const FC_PrefabLoaded &inout PrefabLoaded, FC_EcoCollectableSpawnerRuntime &inout SpawnerRuntime) const
    {
        AECSPrefab local_2;
        AEcoCollectableSpawner local_6 = (Cast<AEcoCollectableSpawner>(local_2));
        if (local_6 != nullptr)
        {
            if (local_6.BakedDataArrayEcologyProp.IsEmpty())
            {
                return;
            }
            int local_11 = FMath::RandRange(0, (local_6.BakedDataArrayEcologyProp.Num() - 1));
            for (auto& local_26 : local_6.EcologyPropAndCountRanges)
            {
                if (local_26.EcologyPropDef.IsSet())
                {
                    SpawnerRuntime.EcologyPropDefToCountMap.Add(local_26.EcologyPropDef, FMath::RandRange(int(local_26.MinCount), int(local_26.MaxCount)));
                }
            }
        }
        return;
    }
    void ProcessInitEcologyPropLayoutInfo(const FECSEntity &inout Entity, FC_EcologyPropLayoutInfo &inout LayoutInfoComp) const
    {
        FConfigGUID local_2 = LayoutInfoComp.LayoutInfo.SpawnerGUID;
        FECSEntityId local_5 = ::EcologyConfigUtils::FindConfigByUUID(local_2, ECS::GetECSWorld());
        if ((!((local_5 == ENTITY_ID_NULL))))
        {
            FECSEntity local_16 = FECSEntity(local_5);
            Get local_20;
            const FC_EcoCollectableSpawnerRuntime& local_22 = local_20.opCall();
            if (local_22)
            {
                if (LayoutInfoComp.LayoutInfo.ResourcePointIndex >= 0 && (LayoutInfoComp.LayoutInfo.ResourcePointIndex < local_22.BakedDataEcologyProp.GetPointBakedData().Num()))
                {
                    LayoutInfoComp.LayoutInfo.BakedOrderIndex = local_22.BakedDataEcologyProp.GetPointBakedData()[LayoutInfoComp.LayoutInfo.ResourcePointIndex].GetBakedOrderIndex();
                    LayoutInfoComp.CachedSpawnerEntityId = local_5;
                    Remove local_30;
                    local_30.opCall();
                }
            }
            else
            {
            }
        }
        else
        {
        }
        return;
    }
    UFUNCTION()
    void ServerJob_InitEcologyPropLayoutInfo(const FECSEntity &inout Entity, FC_EcologyPropLayoutInfo &inout LayoutInfoComp) const
    {
        this.ProcessInitEcologyPropLayoutInfo(Entity, LayoutInfoComp);
        return;
    }
    UFUNCTION()
    void ClientJob_InitEcologyPropLayoutInfo(const FECSEntity &inout Entity, FC_EcologyPropLayoutInfo &inout LayoutInfoComp) const
    {
        this.ProcessInitEcologyPropLayoutInfo(Entity, LayoutInfoComp);
        return;
    }
    bool UpdateEcologyPropActivation(const FECSEntity &inout Entity) const
    {
        if (Entity.IsPendingDestroy() || !(Entity.IsValid()))
        {
            return false;
        }
        bool local_3 = false;
        if (::EcologyPropUtils::CalculateActivationState(Entity, local_3))
        {
            Entity.SetActive(local_3, FFPTime(-1));
            return true;
        }
        return false;
    }
    UFUNCTION()
    void ServerJob_InitEcologyPropView(const FECSEntity &inout Entity) const
    {
        if (this.UpdateEcologyPropActivation(Entity))
        {
            Remove local_6;
            local_6.opCall();
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateEcologyPropActivation(const FECSEntity &inout Entity) const
    {
        this.UpdateEcologyPropActivation(Entity);
        return;
    }
    UFUNCTION()
    void ServerJob_HandleTimeSegmentChanged(const FCE_EcologyTimeSegmentsChangedEvent &inout Event) const
    {
        this.Run_Job_UpdateEcologyPropActivation();
        return;
    }
    UFUNCTION()
    void ServerJob_HandleWeatherChanged(const FCE_RegionWeatherChanged &inout Event) const
    {
        this.Run_Job_UpdateEcologyPropActivation();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_InitEcologyPropSpawner() const
    {
        int local_36 = 0;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
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
                this.ServerJob_InitEcologyPropSpawner(local_36, local_42);
                local_50.opCall(local_42);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_88.Iterator();
        for (; local_136.CanProceed;)
        {
            const FECSEntity& local_172 = local_136.Proceed();
            ++local_102;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_172.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_172);
            this.ServerJob_InitEcologyPropSpawner(local_36, local_42);
            local_50.opCall(local_42);
        }
        local_2.UpdateCachedEntityCount(local_102);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_InitEcologyPropLayoutInfo() const
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
                this.ServerJob_InitEcologyPropLayoutInfo(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
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
            this.ServerJob_InitEcologyPropLayoutInfo(local_166, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_InitEcologyPropLayoutInfo() const
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
                this.ClientJob_InitEcologyPropLayoutInfo(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
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
            this.ClientJob_InitEcologyPropLayoutInfo(local_166, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_InitEcologyPropView() const
    {
        const FECSEntity& local_36;
        int local_152 = 0;
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
                this.ServerJob_InitEcologyPropView(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_80 = 0;
        FECSRuntimeViewIterator local_114 = local_74.Iterator();
        for (; local_114.CanProceed;)
        {
            local_36 = local_114.Proceed();
            ++local_80;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ServerJob_InitEcologyPropView(local_152);
        }
        local_2.UpdateCachedEntityCount(local_80);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateEcologyPropActivation() const
    {
        int local_128 = 0;
        FECSManualJobStatScope local_1 = FECSManualJobStatScope(FName("[AS][ManualJob]S_EcologyPropSystem::Job_UpdateEcologyPropActivation"));
        ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        FECSRuntimeView local_48 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_52;
        local_52.opCall();
        FECSRuntimeViewIterator local_86 = local_48.Iterator();
        for (; local_86.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_125 = FECSEntityScopeCycleCounter(local_86.Proceed());
            this.Job_UpdateEcologyPropActivation(local_128);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleTimeSegmentChanged() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EcologyTimeSegmentsChangedEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EcologyTimeSegmentsChangedEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleTimeSegmentChanged(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleWeatherChanged() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_RegionWeatherChanged> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_RegionWeatherChanged& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleWeatherChanged(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}


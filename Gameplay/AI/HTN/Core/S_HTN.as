

class US_HTNSystem : UECSScriptSystem
{
    US_HTNSystem()
    {
        return;
    }
    UFUNCTION()
    void Monitor_OnHTNAssign(const FECSEntity &inout Entity, const FC_HTNInstance &inout HTN) const
    {
        ::FHTNUtils::Internal_InitHTNInstance(Entity, 0);
        if (HTN.bRunAtInitialization)
        {
            FC_HTNNeedRestartTag local_14;
            Assign local_12;
            local_12.opCall(local_14);
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnHTNRemove(const FECSEntity &inout Entity, const FC_HTNInstance &inout HTN) const
    {
        ::FHTNUtils::CleanHTNActor(Entity, HTN);
        return;
    }
    UFUNCTION()
    void Job_CleanUpHTN(const FECSEntity &inout Entity, const FC_HTNInstance &inout HTN) const
    {
        ::FHTNUtils::CleanHTNActor(Entity, HTN);
        return;
    }
    UFUNCTION()
    void Job_OnEndPlay(const FECSEntity &inout Entity, const FC_HTNInstance &inout HTN) const
    {
        ::FHTNUtils::CleanHTNActor(Entity, HTN);
        return;
    }
    UFUNCTION()
    void Job_RestartHTN(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, FC_HTNInstance &inout HTNInstance) const
    {
        if (HTNInstance.HTNComponent.IsValid())
        {
            ::FHTNUtils::Internal_RunHTN(Entity, HTNInstance);
        }
        Remove local_6;
        local_6.opCall();
        return;
    }
    UFUNCTION()
    void Job_HandleInterruptEvent(const FCE_HTNInterrupt &inout Event) const
    {
        if (!(FECSEntity(Event.TargetId).IsValid()))
        {
            return;
        }
        Get local_14;
        const FC_HTNInstance& local_16 = local_14.opCall();
        if (local_16)
        {
            if (local_16.HTNComponent.IsValid())
            {
                UECSHTNComponent local_18;
                local_18.NotifyInterrupt(Event.Tag);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_TickHTN(const FCS_AIControlGlobalContext &inout AIContext, const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, FC_HTNInstance &inout HTNInstance) const
    {
        if (AIContext.PauseWorldAI.IsOn())
        {
            return;
        }
        HTNInstance.PrepareAndStep(FixedTime, Entity);
        return;
    }
    UFUNCTION()
    void Job_ProcessHTN(const FCS_AIControlGlobalContext &inout AIContext, const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, FC_HTNInstance &inout HTNInstance) const
    {
        if (AIContext.PauseWorldAI.IsOn())
        {
            return;
        }
        HTNInstance.PrepareAndStep(FixedTime, Entity);
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnHTNAssign() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorHTNInstanceOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnHTNAssign(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnHTNRemove() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorHTNInstanceOnRemoveView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnHTNRemove(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CleanUpHTN_StaticReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_168 = 0;
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
                this.Job_CleanUpHTN(local_38, local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_82 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_86;
        local_86.opCall();
        Include local_90;
        local_90.opCall();
        Exclude(local_82).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_96 = 0;
        FECSRuntimeViewIterator local_130 = local_82.Iterator();
        for (; local_130.CanProceed;)
        {
            local_38 = local_130.Proceed();
            ++local_96;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_CleanUpHTN(local_168, local_40);
        }
        local_4.UpdateCachedEntityCount(local_96);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CleanUpHTN_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_168 = 0;
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
                this.Job_CleanUpHTN(local_38, local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_82 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_86;
        local_86.opCall();
        Include local_90;
        local_90.opCall();
        Exclude(local_82).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_96 = 0;
        FECSRuntimeViewIterator local_130 = local_82.Iterator();
        for (; local_130.CanProceed;)
        {
            local_38 = local_130.Proceed();
            ++local_96;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_CleanUpHTN(local_168, local_40);
        }
        local_4.UpdateCachedEntityCount(local_96);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CleanUpHTN_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_168 = 0;
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
                this.Job_CleanUpHTN(local_38, local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_82 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_86;
        local_86.opCall();
        Include local_90;
        local_90.opCall();
        Exclude(local_82).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_96 = 0;
        FECSRuntimeViewIterator local_130 = local_82.Iterator();
        for (; local_130.CanProceed;)
        {
            local_38 = local_130.Proceed();
            ++local_96;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_CleanUpHTN(local_168, local_40);
        }
        local_4.UpdateCachedEntityCount(local_96);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_OnEndPlay() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_158 = 0;
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
                this.Job_OnEndPlay(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_86 = 0;
        FECSRuntimeViewIterator local_120 = local_80.Iterator();
        for (; local_120.CanProceed;)
        {
            local_36 = local_120.Proceed();
            ++local_86;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_OnEndPlay(local_158, local_38);
        }
        local_2.UpdateCachedEntityCount(local_86);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_RestartHTN() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_174 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
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
                this.Job_RestartHTN(local_40, local_6, local_42);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_88.Iterator();
        for (; local_136.CanProceed;)
        {
            local_40 = local_136.Proceed();
            ++local_102;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_RestartHTN(local_174, local_6, local_42);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleInterruptEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_HTNInterrupt> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_HTNInterrupt& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleInterruptEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickHTN() const
    {
        int local_14 = 0;
        int local_20 = 0;
        const FECSEntity& local_50;
        int local_52 = 0;
        MarkModifiedIfDirty local_60;
        int local_188 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_6 = this.GetECSWorld();
        Has local_10;
        if (!(local_10.opCall()))
        {
            return;
        }
        FECSWorldPtr local_6_2 = this.GetECSWorld();
        int local_22 = 0;
        int local_21 = local_22;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_6_3 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_26 = local_4.GetViewCacheEntities();
            int local_27 = 0;
            for (auto& local_42 : local_26)
            {
                local_42;
                FECSEntity local_46;
                if (!(local_46.IsValid()))
                {
                    continue;
                }
                ++local_27;
                FECSEntityScopeCycleCounter local_47 = FECSEntityScopeCycleCounter(local_46);
                this.Job_TickHTN(local_14, local_50, local_20, local_52);
                local_60.opCall(local_52);
            }
            local_4.UpdateCachedEntityCount(local_27);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Exclude(local_98).opCall();
        Exclude(local_98).opCall();
        bool local_11 = local_4.BeginViewCacheBuild();
        int local_28 = local_4.GetViewCacheEpoch();
        int local_116 = 0;
        FECSRuntimeViewIterator local_150 = local_98.Iterator();
        for (; local_150.CanProceed;)
        {
            local_50 = local_150.Proceed();
            ++local_116;
            if (local_11)
            {
                local_4.AddViewCacheEntity(local_50.GetId());
            }
            FECSEntityScopeCycleCounter local_47_2 = FECSEntityScopeCycleCounter(local_50);
            FECSEntity::ModifyAndMarkDirtyManually<FC_HTNInstance> local_56 = FECSEntity::ModifyAndMarkDirtyManually<FC_HTNInstance>(local_50);
            this.Job_TickHTN(local_14, local_188, local_20, local_52);
            local_60.opCall(local_52);
        }
        local_4.UpdateCachedEntityCount(local_116);
        if (local_11)
        {
            local_4.CommitViewCacheBuild(local_28);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ProcessHTN() const
    {
        int local_14 = 0;
        int local_20 = 0;
        const FECSEntity& local_50;
        int local_52 = 0;
        MarkModifiedIfDirty local_60;
        int local_188 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_6 = this.GetECSWorld();
        Has local_10;
        if (!(local_10.opCall()))
        {
            return;
        }
        FECSWorldPtr local_6_2 = this.GetECSWorld();
        int local_22 = 0;
        int local_21 = local_22;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_6_3 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_26 = local_4.GetViewCacheEntities();
            int local_27 = 0;
            for (auto& local_42 : local_26)
            {
                local_42;
                FECSEntity local_46;
                if (!(local_46.IsValid()))
                {
                    continue;
                }
                ++local_27;
                FECSEntityScopeCycleCounter local_47 = FECSEntityScopeCycleCounter(local_46);
                this.Job_ProcessHTN(local_14, local_50, local_20, local_52);
                local_60.opCall(local_52);
            }
            local_4.UpdateCachedEntityCount(local_27);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Exclude(local_98).opCall();
        bool local_11 = local_4.BeginViewCacheBuild();
        int local_28 = local_4.GetViewCacheEpoch();
        int local_116 = 0;
        FECSRuntimeViewIterator local_150 = local_98.Iterator();
        for (; local_150.CanProceed;)
        {
            local_50 = local_150.Proceed();
            ++local_116;
            if (local_11)
            {
                local_4.AddViewCacheEntity(local_50.GetId());
            }
            FECSEntityScopeCycleCounter local_47_2 = FECSEntityScopeCycleCounter(local_50);
            FECSEntity::ModifyAndMarkDirtyManually<FC_HTNInstance> local_56 = FECSEntity::ModifyAndMarkDirtyManually<FC_HTNInstance>(local_50);
            this.Job_ProcessHTN(local_14, local_188, local_20, local_52);
            local_60.opCall(local_52);
        }
        local_4.UpdateCachedEntityCount(local_116);
        if (local_11)
        {
            local_4.CommitViewCacheBuild(local_28);
        }
        return;
    }
}


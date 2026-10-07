

class US_VisualComponentToggleScriptSystem : UECSScriptSystem
{
    US_VisualComponentToggleScriptSystem()
    {
        return;
    }
    UFUNCTION()
    void ClientJob_PresentationDelayHideVisualComponent(const FECSEntity &inout Entity, FC_PresentationVisualComponentToggleDelayHidden &inout DelayHidden, const FCS_FixedTime &inout FixedTime) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_LogicDelayHideVisualComponent(const FECSEntity &inout Entity, const FC_LogicVisualComponentToggleDelayHidden &inout DelayHidden, const FCS_FixedTime &inout FixedTime) const
    {
        int local_6 = 0;
        if (FFPTime(FixedTime.Time).opCmp(local_6.GetNextTargetTime()) >= 0)
        {
            bool local_10 = local_6.ExecuteTaskAndUpdateNextTargetTime(local_6.GetNextTargetTime(), Entity, this.GetFName());
            if (local_10)
            {
                Remove local_16;
                local_16.opCall();
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_StartDitherForDelayedHide(const FECSEntity &inout Entity, const FC_LogicVisualComponentToggleDelayHidden &inout DelayHidden) const
    {
        int local_6 = 0;
        int local_34 = 0;
        if (!(local_6))
        {
            return;
        }
        TArray<FName> local_12;
        for (auto& local_26 : DelayHidden.GetDelayTaskItems())
        {
            local_12.AddUnique(local_26.GetLogicName());
        }
        int local_38 = local_34.StartedLogicNames.Num() - 1;
        for (; local_38 >= 0; --local_38)
        {
            if (!(local_12.Contains(local_34.StartedLogicNames[local_38])))
            {
                local_34.StartedLogicNames.RemoveAt(local_38);
            }
        }
        TArray<FName> local_42;
        for (auto& local_56 : local_12)
        {
            if (!(local_34.StartedLogicNames.Contains(local_56)))
            {
                local_42.Add(local_56);
                local_34.StartedLogicNames.Add(local_56);
            }
        }
        if (local_42.Num() > 0)
        {
            FECSWorldPtr local_60 = ECS::GetECSWorld();
            Get local_64;
            ::VisualComponentToggleUtils::ApplyViewToggle(Entity, local_6, local_42, true, FFPTime(local_64.opCall().Time));
        }
        return;
    }
    UFUNCTION()
    void Monitor_CleanupDitherStartedForDelayedHide(const FECSEntity &inout Entity, const FC_LogicVisualComponentToggleDelayHidden &inout DelayHidden) const
    {
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            Remove local_10;
            local_10.opCall();
        }
        return;
    }
    UFUNCTION()
    void ClientJob_HandleStartPresentationVisualComponentToggleDelayHidden(const FCE_StartPresentationVisualComponentToggleDelayHidden &inout Event) const
    {
        int local_6 = 0;
        if (!(local_6))
        {
            return;
        }
        ::VisualComponentToggleUtils::SetVisualComponentHiddenWithPotentialDelay(Event.Sender, local_6, Event.LogicNames, true, Event.Time, Event.InstigatorName, true);
        return;
    }
    UFUNCTION()
    void Monitor_StartDitherForPresentationDelayedHide(const FECSEntity &inout Entity, const FC_PresentationVisualComponentToggleDelayHidden &inout DelayHidden) const
    {
        int local_6 = 0;
        int local_34 = 0;
        if (!(local_6))
        {
            return;
        }
        TArray<FName> local_12;
        for (auto& local_26 : DelayHidden.DelayTaskItems)
        {
            local_12.AddUnique(local_26.GetLogicName());
        }
        int local_38 = local_34.StartedLogicNames.Num() - 1;
        for (; local_38 >= 0; --local_38)
        {
            if (!(local_12.Contains(local_34.StartedLogicNames[local_38])))
            {
                local_34.StartedLogicNames.RemoveAt(local_38);
            }
        }
        TArray<FName> local_42;
        for (auto& local_56 : local_12)
        {
            if (!(local_34.StartedLogicNames.Contains(local_56)))
            {
                local_42.Add(local_56);
                local_34.StartedLogicNames.Add(local_56);
            }
        }
        if (local_42.Num() > 0)
        {
            FECSWorldPtr local_60 = ECS::GetECSWorld();
            Get local_64;
            ::VisualComponentToggleUtils::ApplyViewToggle(Entity, local_6, local_42, true, FFPTime(local_64.opCall().Time));
        }
        return;
    }
    UFUNCTION()
    void Monitor_CleanupDitherStartedForPresentationDelayedHide(const FECSEntity &inout Entity, const FC_PresentationVisualComponentToggleDelayHidden &inout DelayHidden) const
    {
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            Remove local_10;
            local_10.opCall();
        }
        return;
    }
    UFUNCTION()
    void ClientJob_ApplyViewToggleFromDirtyBits(const FECSEntity &inout ViewEntity, const FC_ViewToggleDirtyBits &inout DirtyBits, const FC_ViewEntityActorData &inout ActorData, const FCS_FixedTime &inout FixedTime) const
    {
        int local_10 = 0;
        Remove local_16;
        FECSEntity local_4 = FECSEntity(ActorData.LogicEntity);
        if (!(local_10))
        {
            local_16.opCall();
            return;
        }
        TArray<FName> local_20;
        TArray<FName> local_24;
        int local_25 = 0;
        while (local_25 < 0)
        {
            if (!(local_10.VirtualIndices.IsValidIndex(local_25)))
            {
            }
            else
            {
                int local_28;
                local_28 = local_10.VirtualIndices[local_25];
                if (DirtyBits.ShowBits.GetBit(local_28))
                {
                    local_20.AddUnique(local_10.Names[local_25]);
                }
                if (DirtyBits.HideBits.GetBit(local_28))
                {
                    local_24.AddUnique(local_10.Names[local_25]);
                }
            }
            ++local_25;
        }
        FFPTime local_30 = FFPTime(FixedTime.Time);
        if (local_20.Num() > 0)
        {
            ::VisualComponentToggleUtils::ApplyViewToggle(local_4, local_10, local_20, false, local_30);
        }
        if (local_24.Num() > 0)
        {
            ::VisualComponentToggleUtils::ApplyViewToggle(local_4, local_10, local_24, true, local_30);
        }
        local_16.opCall();
        return;
    }
    UFUNCTION()
    void Run_ClientJob_PresentationDelayHideVisualComponent_LocalReg() const
    {
        int local_12 = 0;
        const FECSEntity& local_44;
        int local_46 = 0;
        MarkModifiedIfDirty local_54;
        int local_174 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(this.GetECSRuntime().IsOnInterval(FFPTime(0.5))))
        {
            return;
        }
        int local_14 = 2;
        int local_13 = local_14;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_16 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_20 = local_4.GetViewCacheEntities();
            int local_21 = 0;
            for (auto& local_36 : local_20)
            {
                local_36;
                FECSEntity local_40;
                if (!(local_40.IsValid()))
                {
                    continue;
                }
                ++local_21;
                FECSEntityScopeCycleCounter local_41 = FECSEntityScopeCycleCounter(local_40);
                this.ClientJob_PresentationDelayHideVisualComponent(local_44, local_46, local_12);
                local_54.opCall(local_46);
            }
            local_4.UpdateCachedEntityCount(local_21);
            return;
        }
        FECSRuntimeView local_92 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_96;
        local_96.opCall();
        Exclude(local_92).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_22 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_92.Iterator();
        for (; local_136.CanProceed;)
        {
            local_44 = local_136.Proceed();
            ++local_102;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_44.GetId());
            }
            FECSEntityScopeCycleCounter local_41_2 = FECSEntityScopeCycleCounter(local_44);
            this.ClientJob_PresentationDelayHideVisualComponent(local_174, local_46, local_12);
            local_54.opCall(local_46);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_22);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_PresentationDelayHideVisualComponent_StaticReg() const
    {
        int local_12 = 0;
        const FECSEntity& local_44;
        int local_46 = 0;
        MarkModifiedIfDirty local_54;
        int local_174 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(this.GetECSRuntime().IsOnInterval(FFPTime(0.5))))
        {
            return;
        }
        int local_14 = 1;
        int local_13 = local_14;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_16 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_20 = local_4.GetViewCacheEntities();
            int local_21 = 0;
            for (auto& local_36 : local_20)
            {
                local_36;
                FECSEntity local_40;
                if (!(local_40.IsValid()))
                {
                    continue;
                }
                ++local_21;
                FECSEntityScopeCycleCounter local_41 = FECSEntityScopeCycleCounter(local_40);
                this.ClientJob_PresentationDelayHideVisualComponent(local_44, local_46, local_12);
                local_54.opCall(local_46);
            }
            local_4.UpdateCachedEntityCount(local_21);
            return;
        }
        FECSRuntimeView local_92 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_96;
        local_96.opCall();
        Exclude(local_92).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_22 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_92.Iterator();
        for (; local_136.CanProceed;)
        {
            local_44 = local_136.Proceed();
            ++local_102;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_44.GetId());
            }
            FECSEntityScopeCycleCounter local_41_2 = FECSEntityScopeCycleCounter(local_44);
            this.ClientJob_PresentationDelayHideVisualComponent(local_174, local_46, local_12);
            local_54.opCall(local_46);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_22);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_PresentationDelayHideVisualComponent_DefaultReg() const
    {
        int local_12 = 0;
        const FECSEntity& local_44;
        int local_46 = 0;
        MarkModifiedIfDirty local_54;
        int local_174 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(this.GetECSRuntime().IsOnInterval(FFPTime(0.5))))
        {
            return;
        }
        int local_14 = 0;
        int local_13 = local_14;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_16 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_20 = local_4.GetViewCacheEntities();
            int local_21 = 0;
            for (auto& local_36 : local_20)
            {
                local_36;
                FECSEntity local_40;
                if (!(local_40.IsValid()))
                {
                    continue;
                }
                ++local_21;
                FECSEntityScopeCycleCounter local_41 = FECSEntityScopeCycleCounter(local_40);
                this.ClientJob_PresentationDelayHideVisualComponent(local_44, local_46, local_12);
                local_54.opCall(local_46);
            }
            local_4.UpdateCachedEntityCount(local_21);
            return;
        }
        FECSRuntimeView local_92 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_96;
        local_96.opCall();
        Exclude(local_92).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_22 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_92.Iterator();
        for (; local_136.CanProceed;)
        {
            local_44 = local_136.Proceed();
            ++local_102;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_44.GetId());
            }
            FECSEntityScopeCycleCounter local_41_2 = FECSEntityScopeCycleCounter(local_44);
            this.ClientJob_PresentationDelayHideVisualComponent(local_174, local_46, local_12);
            local_54.opCall(local_46);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_22);
        }
        return;
    }
    void Monitor___JobTimer_Pre___Job_LogicDelayHideVisualComponent(const FC_LogicVisualComponentToggleDelayHidden &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetNextTargetTime());
        FName local_8 = FName("S_VisualComponentToggleScriptSystem::Job_LogicDelayHideVisualComponent");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___Job_LogicDelayHideVisualComponent(const FC_LogicVisualComponentToggleDelayHidden &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetNextTargetTime());
        FName local_8 = FName("S_VisualComponentToggleScriptSystem::Job_LogicDelayHideVisualComponent");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    void Monitor___JobTimer_OnSync___Job_LogicDelayHideVisualComponent(const FC_LogicVisualComponentToggleDelayHidden &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetNextTargetTime());
        FName local_8 = FName("S_VisualComponentToggleScriptSystem::Job_LogicDelayHideVisualComponent");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___Job_LogicDelayHideVisualComponent() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorLogicVisualComponentToggleDelayHiddenOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___Job_LogicDelayHideVisualComponent(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorLogicVisualComponentToggleDelayHiddenOnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___Job_LogicDelayHideVisualComponent(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___Job_LogicDelayHideVisualComponent() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorLogicVisualComponentToggleDelayHiddenOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___Job_LogicDelayHideVisualComponent(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorLogicVisualComponentToggleDelayHiddenOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___Job_LogicDelayHideVisualComponent(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_OnSync___Job_LogicDelayHideVisualComponent() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorLogicVisualComponentToggleDelayHiddenOnModifyView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_OnSync___Job_LogicDelayHideVisualComponent(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorLogicVisualComponentToggleDelayHiddenOnActiveView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_OnSync___Job_LogicDelayHideVisualComponent(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_LogicDelayHideVisualComponent() const
    {
        int local_6 = 0;
        bool local_34;
        int local_42 = 0;
        int local_68 = 0;
        int local_70 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        local_4.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_14 = local_4.GetExternalEntityList();
        FECSEntity local_32;
        Has local_52;
        for (auto& local_28 : local_14)
        {
            local_28;
            FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
            local_34 = false;
            bool local_35 = !(false);
            if (!(local_32.IsActive()) == local_35)
            {
                continue;
            }
            if (!(local_42))
            {
                continue;
            }
            FFPTime local_44 = FFPTime(local_42.GetNextTargetTime());
            if (local_44.opCmp(0.0) < 0 || (FFPTime(local_42.GetNextTargetTime()) == FPTIME_MAX))
            {
                continue;
            }
            if (!(local_52.opCall()) == !(false))
            {
                FString local_56 = "Timer job error: 'FC_LocalTag' included by job but not exist on ";
                FString local_60 = local_32.ToString();
                local_34 = true;
            }
            if (local_34)
            {
                continue;
            }
            this.Job_LogicDelayHideVisualComponent(local_68, local_70, local_6);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    UFUNCTION()
    void Run_Monitor_StartDitherForDelayedHide() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorLogicVisualComponentToggleDelayHiddenOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_StartDitherForDelayedHide(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorLogicVisualComponentToggleDelayHiddenOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_StartDitherForDelayedHide(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_CleanupDitherStartedForDelayedHide() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorLogicVisualComponentToggleDelayHiddenOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_CleanupDitherStartedForDelayedHide(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleStartPresentationVisualComponentToggleDelayHidden() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_StartPresentationVisualComponentToggleDelayHidden> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_StartPresentationVisualComponentToggleDelayHidden& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleStartPresentationVisualComponentToggleDelayHidden(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_StartDitherForPresentationDelayedHide_LocalReg() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorPresentationVisualComponentToggleDelayHiddenOnAssignView(this.GetECSWorld(), EECSRegType(2), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_StartDitherForPresentationDelayedHide(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorPresentationVisualComponentToggleDelayHiddenOnModifyView(this.GetECSWorld(), EECSRegType(2), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_StartDitherForPresentationDelayedHide(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_StartDitherForPresentationDelayedHide_StaticReg() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorPresentationVisualComponentToggleDelayHiddenOnAssignView(this.GetECSWorld(), EECSRegType(1), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_StartDitherForPresentationDelayedHide(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorPresentationVisualComponentToggleDelayHiddenOnModifyView(this.GetECSWorld(), EECSRegType(1), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_StartDitherForPresentationDelayedHide(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_StartDitherForPresentationDelayedHide_DefaultReg() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorPresentationVisualComponentToggleDelayHiddenOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_StartDitherForPresentationDelayedHide(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorPresentationVisualComponentToggleDelayHiddenOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_StartDitherForPresentationDelayedHide(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_CleanupDitherStartedForPresentationDelayedHide_LocalReg() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorPresentationVisualComponentToggleDelayHiddenOnRemoveView(this.GetECSWorld(), EECSRegType(2), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_CleanupDitherStartedForPresentationDelayedHide(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_CleanupDitherStartedForPresentationDelayedHide_StaticReg() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorPresentationVisualComponentToggleDelayHiddenOnRemoveView(this.GetECSWorld(), EECSRegType(1), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_CleanupDitherStartedForPresentationDelayedHide(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_CleanupDitherStartedForPresentationDelayedHide_DefaultReg() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorPresentationVisualComponentToggleDelayHiddenOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_CleanupDitherStartedForPresentationDelayedHide(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ApplyViewToggleFromDirtyBits_StaticReg() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_176 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 1;
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
                this.ClientJob_ApplyViewToggleFromDirtyBits(local_40, local_42, local_48, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Exclude(local_90).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_104 = 0;
        FECSRuntimeViewIterator local_138 = local_90.Iterator();
        for (; local_138.CanProceed;)
        {
            local_40 = local_138.Proceed();
            ++local_104;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ClientJob_ApplyViewToggleFromDirtyBits(local_176, local_42, local_48, local_6);
        }
        local_4.UpdateCachedEntityCount(local_104);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ApplyViewToggleFromDirtyBits_LocalReg() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_176 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 2;
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
                this.ClientJob_ApplyViewToggleFromDirtyBits(local_40, local_42, local_48, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Exclude(local_90).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_104 = 0;
        FECSRuntimeViewIterator local_138 = local_90.Iterator();
        for (; local_138.CanProceed;)
        {
            local_40 = local_138.Proceed();
            ++local_104;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ClientJob_ApplyViewToggleFromDirtyBits(local_176, local_42, local_48, local_6);
        }
        local_4.UpdateCachedEntityCount(local_104);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ApplyViewToggleFromDirtyBits_DefaultReg() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_176 = 0;
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
                this.ClientJob_ApplyViewToggleFromDirtyBits(local_40, local_42, local_48, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Exclude(local_90).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_104 = 0;
        FECSRuntimeViewIterator local_138 = local_90.Iterator();
        for (; local_138.CanProceed;)
        {
            local_40 = local_138.Proceed();
            ++local_104;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ClientJob_ApplyViewToggleFromDirtyBits(local_176, local_42, local_48, local_6);
        }
        local_4.UpdateCachedEntityCount(local_104);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
}


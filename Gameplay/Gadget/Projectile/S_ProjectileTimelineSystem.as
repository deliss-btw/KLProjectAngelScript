

class US_ProjectileTimelineSystem : UECSScriptSystem
{
    US_ProjectileTimelineSystem()
    {
        return;
    }
    void UpdateProjectileTimelineChange(const FECSEntity &inout Entity, const FC_ProjectileTimelineChange &inout Change, FC_ProjectileTimelineController &inout Controller, const FC_ProjectileTimelineData &inout TimelineData, const FCS_FixedTime &inout FixedTime) const
    {
        int local_8 = 0;
        int local_90 = 0;
        int local_96 = 0;
        UProjectileTimelineAsset local_4;
        bool local_5 = !((local_4 != nullptr));
        if (local_5)
        {
            return;
        }
        for (auto& local_24 : Change.GetPendingActivateTimelineContext())
        {
            FProjectileTimelineRuntimeInfo local_76;
            local_76.SetbIsActive(true);
            local_76.SetIndexInConfig(local_24.GetTimelineConfigIndex());
            FFPTime local_82 = (FFPTime(local_24.GetWorldTime()) - Controller.GetWorldTimeOffset());
            local_76.SetTimeOffset(local_82);
            local_76.SetContextEntity(local_24.GetContextEntity());
            local_76.SetContextPosition(local_24.GetContextPosition());
            local_76.SetContextRotation(local_24.GetContextRotation());
            Controller.GetModify_TimelineInfos().Add(local_76);
            FFPTime local_80 = (FFPTime(FixedTime.Time) - Controller.GetWorldTimeOffset());
            Controller.SetNextTickTime(local_80);
            local_80 = (FFPTime(FixedTime.Time) - local_24.GetWorldTime());
            if (!(local_90))
            {
                local_5 = false;
            }
            else
            {
                local_5 = local_96;
            }
            if (local_5)
            {
                local_80 = (FProjectileTimeUtils::GetProjectileTime(local_90, local_96, FixedTime.Time) - FProjectileTimeUtils::GetProjectileTime(local_90, local_96, local_24.GetWorldTime()));
            }
            ::FProjectileTimelineUtils::AdvanceTimeline(Entity, local_4, Controller, local_8, local_80);
        }
        bool local_5_2 = Change.GetNextStateTimelineIndex() >= 0 && (Change.GetNextStateTimelineIndex() != Controller.GetCurStateConfigTimelineIndex());
        if (local_5_2)
        {
            FProjectileTimelineRuntimeInfo& local_104 = Controller.GetModify_TimelineInfos()[0];
            FProjectileTimelineData& local_106 = local_8.TimelineDatas[Controller.GetCurStateConfigTimelineIndex()];
            for (auto local_119 : local_104.GetActiveActionIndexes())
            {
                ::FProjectileTimelineUtils::EndTimelineAction(Entity, Controller, local_4.GetActionData(local_106.ActionDatas[local_119].Data), Controller.GetCurStateConfigTimelineIndex(), local_119);
            }
            local_90.SetLifeDuration(local_8.TimelineDatas[Change.GetNextStateTimelineIndex()].Duration);
            local_90.SetSpawnTime(Change.GetNextStateStartWorldTime());
            Controller.SetCurStateConfigTimelineIndex(Change.GetNextStateTimelineIndex());
            FFPTime local_84 = (FFPTime(FixedTime.Time) - Controller.GetWorldTimeOffset());
            Controller.SetNextTickTime(local_84);
            local_104.Reset();
            local_104.SetbIsActive(true);
            local_104.SetIndexInConfig(Change.GetNextStateTimelineIndex());
            FFPTime local_84_2 = (FFPTime(Change.GetNextStateStartWorldTime()) - Controller.GetWorldTimeOffset());
            local_104.SetTimeOffset(local_84_2);
            FFPTime local_100 = (FFPTime(FixedTime.Time) - Change.GetNextStateStartWorldTime());
            if (!(local_90))
            {
                local_5_2 = false;
            }
            else
            {
                local_5_2 = local_96;
            }
            if (local_5_2)
            {
                local_100 = (FProjectileTimeUtils::GetProjectileTime(local_90, local_96, FixedTime.Time) - FProjectileTimeUtils::GetProjectileTime(local_90, local_96, FFPTime(Change.GetNextStateTimelineIndex())));
            }
            ::FProjectileTimelineUtils::AdvanceTimeline(Entity, local_4, Controller, local_8, local_100);
        }
        Remove local_128;
        local_128.opCall();
        return;
    }
    UFUNCTION()
    void Job_TickProjectileTimelineChange(const FECSEntity &inout Entity, const FC_ProjectileTimelineChange &inout Change, FC_ProjectileTimelineController &inout Controller, const FC_ProjectileTimelineData &inout TimelineData, const FCS_FixedTime &inout FixedTime) const
    {
        this.UpdateProjectileTimelineChange(Entity, Change, Controller, TimelineData, FixedTime);
        return;
    }
    UFUNCTION()
    void Job_TickProjectileTimelineAction(const FECSEntity &inout Entity, FC_ProjectileTimelineController &inout Controller, const FC_ProjectileTimelineData &inout TimelineData) const
    {
        Has local_4;
        UProjectileTimelineAsset local_10;
        int local_12 = 0;
        if (!(local_4.opCall()))
        {
            return;
        }
        if ((!((local_10 != nullptr))))
        {
            return;
        }
        FFPTime local_20 = Controller.GetNextTickWorldTime();
        while (local_20.opCmp(0.0) >= 0 && (local_20.opCmp(FFPTime(ECS::GetECSWorld().GetFixedTime().Time)) <= 0))
        {
            FFPTime local_26 = (FFPTime(Controller.GetNextTickTime()) - Controller.GetLastTickTime());
            ::FProjectileTimelineUtils::AdvanceTimeline(Entity, local_10, Controller, local_12, local_26);
            FFPTime local_18 = Controller.GetNextTickWorldTime();
            if (local_18.opCmp(local_20) > 0)
            {
                local_20 = local_18;
            }
            else
            {
                break;
            }
        }
        return;
    }
    UFUNCTION()
    void Job_TickProjectileTimelineActionWithTimeTweak(const FECSEntity &inout Entity, const FC_LifeTime &inout LifeTime, const FC_TimeTweak &inout TimeTweak, FC_ProjectileTimelineController &inout Controller, const FC_ProjectileTimelineData &inout TimelineData, const FCS_FixedTime &inout FixedTime) const
    {
        UProjectileTimelineAsset local_4;
        int local_8 = 0;
        if ((!((local_4 != nullptr))))
        {
            return;
        }
        ::FProjectileTimelineUtils::AdvanceTimeline(Entity, local_4, Controller, local_8, (FProjectileTimeUtils::GetProjectileTime(LifeTime, TimeTweak, FixedTime.Time) - FProjectileTimeUtils::GetProjectileTime(LifeTime, TimeTweak, FixedTime.LastTime)));
        return;
    }
    UFUNCTION()
    void Job_TickProjectileTimelineChangeAfterTimelineAction(const FECSEntity &inout Entity, const FC_ProjectileTimelineChange &inout Change, FC_ProjectileTimelineController &inout Controller, const FC_ProjectileTimelineData &inout TimelineData, const FCS_FixedTime &inout FixedTime) const
    {
        this.UpdateProjectileTimelineChange(Entity, Change, Controller, TimelineData, FixedTime);
        return;
    }
    UFUNCTION()
    void Job_TickProjectileTimelineChangePostMovement(const FECSEntity &inout Entity, const FC_ProjectileTimelineChange &inout Change, FC_ProjectileTimelineController &inout Controller, const FC_ProjectileTimelineData &inout TimelineData, const FCS_FixedTime &inout FixedTime) const
    {
        this.UpdateProjectileTimelineChange(Entity, Change, Controller, TimelineData, FixedTime);
        return;
    }
    UFUNCTION()
    void Monitor_UpdateProjectileTimelineWorldTimeOffset(const FECSEntity &inout Entity, const FC_ProjectileInTimeTweakTag &inout ProjectileInTimeTweakTag) const
    {
        int local_8 = 0;
        int local_14 = 0;
        if (!(Entity.IsValid()))
        {
            return;
        }
        if (local_8)
        {
            if (local_14)
            {
                local_8.SetWorldTimeOffset((FFPTime(local_14.GetAlignWorldTime()) - local_14.GetAlignSampleTime()));
            }
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickProjectileTimelineChange() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        MarkModifiedIfDirty local_62;
        int local_194 = 0;
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
                this.Job_TickProjectileTimelineChange(local_40, local_42, local_48, local_54, local_6);
                local_62.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_100 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Include local_116;
        local_116.opCall();
        Exclude(local_100).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_122 = 0;
        FECSRuntimeViewIterator local_156 = local_100.Iterator();
        for (; local_156.CanProceed;)
        {
            local_40 = local_156.Proceed();
            ++local_122;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_TickProjectileTimelineChange(local_194, local_42, local_48, local_54, local_6);
            local_62.opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_122);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    void Monitor___JobTimer_Pre___Job_TickProjectileTimelineAction(const FC_ProjectileTimelineController &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_8 = FFPTime(TimerComp.GetNextTickWorldTime());
        FName local_10 = FName("S_ProjectileTimelineSystem::Job_TickProjectileTimelineAction");
        if (local_8.opCmp(0.0) >= 0 && (local_8.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_10, local_8, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___Job_TickProjectileTimelineAction(const FC_ProjectileTimelineController &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_8 = FFPTime(TimerComp.GetNextTickWorldTime());
        FName local_10 = FName("S_ProjectileTimelineSystem::Job_TickProjectileTimelineAction");
        if (local_8.opCmp(0.0) >= 0 && (local_8.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_10, local_8, Entity.GetId(), false);
        }
        return;
    }
    void Monitor___JobTimer_OnSync___Job_TickProjectileTimelineAction(const FC_ProjectileTimelineController &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_8 = FFPTime(TimerComp.GetNextTickWorldTime());
        FName local_10 = FName("S_ProjectileTimelineSystem::Job_TickProjectileTimelineAction");
        if (local_8.opCmp(0.0) >= 0 && (local_8.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_10, local_8, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___Job_TickProjectileTimelineAction() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorProjectileTimelineControllerOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___Job_TickProjectileTimelineAction(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorProjectileTimelineControllerOnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___Job_TickProjectileTimelineAction(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___Job_TickProjectileTimelineAction() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorProjectileTimelineControllerOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___Job_TickProjectileTimelineAction(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorProjectileTimelineControllerOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___Job_TickProjectileTimelineAction(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_OnSync___Job_TickProjectileTimelineAction() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorProjectileTimelineControllerOnModifyView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_OnSync___Job_TickProjectileTimelineAction(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorProjectileTimelineControllerOnActiveView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_OnSync___Job_TickProjectileTimelineAction(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickProjectileTimelineAction() const
    {
        bool local_30;
        int local_38 = 0;
        int local_68 = 0;
        int local_70 = 0;
        int local_76 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        local_2.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_10 = local_2.GetExternalEntityList();
        FECSEntity local_28;
        Has local_48;
        for (auto& local_24 : local_10)
        {
            local_24;
            FECSEntityScopeCycleCounter local_29 = FECSEntityScopeCycleCounter(local_28);
            local_30 = false;
            bool local_31 = !(false);
            if (!(local_28.IsActive()) == local_31)
            {
                continue;
            }
            if (!(local_38))
            {
                continue;
            }
            FFPTime local_40 = local_38.GetNextTickWorldTime();
            if (local_40.opCmp(0.0) < 0 || (local_38.GetNextTickWorldTime() == FPTIME_MAX))
            {
                continue;
            }
            if (!(local_48.opCall()) == !(false))
            {
                XLog(ELog(2), (FString("Timer job error: 'FC_LocalTag' included by job but not exist on ") + local_28.ToString()));
                local_30 = true;
            }
            Has local_66;
            local_31 = local_66.opCall();
            if (local_31)
            {
                XLog(ELog(2), (FString("Timer job error: 'FC_ProjectileInTimeTweakTag' excluded by job but exist on ") + local_28.ToString()));
                local_30 = true;
            }
            if (local_30)
            {
                continue;
            }
            this.Job_TickProjectileTimelineAction(local_68, local_70, local_76);
            MarkModifiedIfDirty local_84;
            local_84.opCall(local_70);
        }
        local_2.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    UFUNCTION()
    void Run_Job_TickProjectileTimelineActionWithTimeTweak() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        MarkModifiedIfDirty local_68;
        int local_208 = 0;
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
                this.Job_TickProjectileTimelineActionWithTimeTweak(local_40, local_42, local_48, local_54, local_60, local_6);
                local_68.opCall(local_54);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_106 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Include local_126;
        local_126.opCall();
        Include local_130;
        local_130.opCall();
        Exclude(local_106).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_136 = 0;
        FECSRuntimeViewIterator local_170 = local_106.Iterator();
        for (; local_170.CanProceed;)
        {
            local_40 = local_170.Proceed();
            ++local_136;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_TickProjectileTimelineActionWithTimeTweak(local_208, local_42, local_48, local_54, local_60, local_6);
            local_68.opCall(local_54);
        }
        local_4.UpdateCachedEntityCount(local_136);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickProjectileTimelineChangeAfterTimelineAction() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        MarkModifiedIfDirty local_62;
        int local_194 = 0;
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
                this.Job_TickProjectileTimelineChangeAfterTimelineAction(local_40, local_42, local_48, local_54, local_6);
                local_62.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_100 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Include local_116;
        local_116.opCall();
        Exclude(local_100).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_122 = 0;
        FECSRuntimeViewIterator local_156 = local_100.Iterator();
        for (; local_156.CanProceed;)
        {
            local_40 = local_156.Proceed();
            ++local_122;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_TickProjectileTimelineChangeAfterTimelineAction(local_194, local_42, local_48, local_54, local_6);
            local_62.opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_122);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickProjectileTimelineChangePostMovement() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        MarkModifiedIfDirty local_62;
        int local_194 = 0;
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
                this.Job_TickProjectileTimelineChangePostMovement(local_40, local_42, local_48, local_54, local_6);
                local_62.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_100 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Include local_116;
        local_116.opCall();
        Exclude(local_100).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_122 = 0;
        FECSRuntimeViewIterator local_156 = local_100.Iterator();
        for (; local_156.CanProceed;)
        {
            local_40 = local_156.Proceed();
            ++local_122;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_TickProjectileTimelineChangePostMovement(local_194, local_42, local_48, local_54, local_6);
            local_62.opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_122);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_UpdateProjectileTimelineWorldTimeOffset() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorProjectileInTimeTweakTagOnInactiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_UpdateProjectileTimelineWorldTimeOffset(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorProjectileInTimeTweakTagOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_UpdateProjectileTimelineWorldTimeOffset(local_46, local_52);
        }
        return;
    }
}


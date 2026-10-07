

class US_TestECSAccessAnalyzeASSystem : UECSScriptSystem
{
    bool bRunTestAnalyzeAS = false;


    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return !(this.bRunTestAnalyzeAS);
    }
    UFUNCTION()
    void Job_SimpleSingleton(FCS_TestASSingleton &inout S) const
    {
        S.Value = 1;
        return;
    }
    UFUNCTION()
    void Job_Simple(const FECSEntity &inout Entity, FC_TestASData &inout A) const
    {
        A.TestData0 = 0;
        Modify local_6;
        local_6.opCall().Value = 1;
        ::TestAnalyzeASUtils::Level1_CallsLevel2(Entity);
        return;
    }
    UFUNCTION()
    void Job_OverloadAndCycle(const FECSEntity &inout Entity, FC_TestASData &inout A) const
    {
        A.TestData0 = 0;
        ::TestAnalyzeASUtils::Touch(Entity);
        ::TestAnalyzeASUtils::Touch(Entity, 42);
        ::TestAnalyzeASUtils::Touch(Entity, true);
        ::TestAnalyzeASUtils::CycleA(Entity);
        return;
    }
    UFUNCTION()
    void Job_CycleFromB(const FECSEntity &inout Entity, FC_TestASData2 &inout B) const
    {
        B.Value = 0;
        ::TestAnalyzeASUtils::CycleB(Entity);
        return;
    }
    UFUNCTION()
    void Job_MemberObject(const FECSEntity &inout Entity, FC_TestASData2 &inout B, FCS_TestASSingleton &inout S) const
    {
        B.Value = 1;
        S.Value = 2;
        FTestAnalyzeASAccessor local_6;
        local_6.Entity = Entity;
        local_6.ReadA();
        local_6.WriteA(7);
        local_6.EnsureB();
        local_6.HasC();
        return;
    }
    UFUNCTION()
    void Job_CallCppUtils(const FECSEntity &inout Entity) const
    {
        UTestECSAccessAnalyzeCppUtils::TouchRead(Entity);
        UTestECSAccessAnalyzeCppUtils::TouchWrite(Entity, 42);
        UTestECSAccessAnalyzeCppUtils::TouchStructural(Entity);
        UTestECSAccessAnalyzeCppUtils::Level1_CallsLevel2(Entity);
        UTestECSAccessAnalyzeCppUtils::CycleA(Entity);
        UTestECSAccessAnalyzeCppUtils::TouchSingleton();
        UTestECSAccessAnalyzeCppUtils::SendAnalyzeEvent(Entity);
        FTestAnalyzeCppAccessor local_6;
        local_6.Entity = Entity;
        local_6.ReadA();
        local_6.WriteA(7);
        local_6.EnsureB();
        local_6.HasC();
        return;
    }
    UFUNCTION()
    void Monitor_AnalyzeASA(const FECSEntity &inout Entity, const FC_TestASData &inout A) const
    {
        int local_1 = A.TestData0;
        Get local_6;
        local_6.opCall();
        return;
    }
    UFUNCTION()
    void Job_Query(const FECSEntity &inout Entity) const
    {
        Get local_4;
        local_4.opCall();
        return;
    }
    UFUNCTION()
    void Job_TimerOnly() const
    {
        return;
    }
    UFUNCTION()
    void Job_HandleEvent(const FCE_TestASEvent &inout Event) const
    {
        int local_1 = Event.TestData0;
        ModifyOrAdd local_6;
        local_6.opCall().Value = int(Event.TestData0);
        return;
    }
    UFUNCTION()
    void Run_Job_SimpleSingleton() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        this.Job_SimpleSingleton(local_12);
        FECSWorldPtr local_4_3 = this.GetECSWorld();
        MarkModifiedIfDirty local_20;
        local_20.opCall(local_12);
        return;
    }
    UFUNCTION()
    void Run_Job_Simple() const
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
                this.Job_Simple(local_36, local_38);
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
            this.Job_Simple(local_166, local_38);
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
    void Run_Job_OverloadAndCycle() const
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
                this.Job_OverloadAndCycle(local_36, local_38);
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
            this.Job_OverloadAndCycle(local_166, local_38);
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
    void Run_Job_CycleFromB() const
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
                this.Job_CycleFromB(local_36, local_38);
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
            this.Job_CycleFromB(local_166, local_38);
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
    void Run_Job_MemberObject() const
    {
        int local_12 = 0;
        int local_48 = 0;
        int local_176 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        int local_18 = 0;
        int local_17 = local_18;
        if (local_2.IsViewCacheUsable())
        {
            MarkModifiedIfDirty local_56;
            const FECSEntity& local_46;
            FECSWorldPtr local_4_3 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_22 = local_2.GetViewCacheEntities();
            int local_23 = 0;
            for (auto& local_38 : local_22)
            {
                local_38;
                FECSEntity local_42;
                if (!(local_42.IsValid()))
                {
                    continue;
                }
                ++local_23;
                FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42);
                this.Job_MemberObject(local_46, local_48, local_12);
                local_56.opCall(local_48);
            }
            local_2.UpdateCachedEntityCount(local_23);
        }
        else
        {
            MarkModifiedIfDirty local_56;
            const FECSEntity& local_46;
            FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
            Include local_98;
            local_98.opCall();
            Exclude(local_94).opCall();
            bool local_9 = local_2.BeginViewCacheBuild();
            int local_24 = local_2.GetViewCacheEpoch();
            int local_104 = 0;
            FECSRuntimeViewIterator local_138 = local_94.Iterator();
            for (; local_138.CanProceed;)
            {
                local_46 = local_138.Proceed();
                ++local_104;
                if (local_9)
                {
                    local_2.AddViewCacheEntity(local_46.GetId());
                }
                FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
                this.Job_MemberObject(local_176, local_48, local_12);
                local_56.opCall(local_48);
            }
            local_2.UpdateCachedEntityCount(local_104);
            if (local_9)
            {
                local_2.CommitViewCacheBuild(local_24);
            }
        }
        FECSWorldPtr local_20 = this.GetECSWorld();
        MarkModifiedIfDirty local_180;
        local_180.opCall(local_12);
        return;
    }
    UFUNCTION()
    void Run_Job_CallCppUtils() const
    {
        int local_124 = 0;
        ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        FECSRuntimeView local_44 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Exclude(local_44).opCall();
        FECSRuntimeViewIterator local_82 = local_44.Iterator();
        for (; local_82.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_121 = FECSEntityScopeCycleCounter(local_82.Proceed());
            this.Job_CallCppUtils(local_124);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_AnalyzeASA() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorTestASDataOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_AnalyzeASA(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorTestASDataOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_AnalyzeASA(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_Query() const
    {
        const FECSEntity& local_36;
        int local_160 = 0;
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
                this.Job_Query(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Exclude(local_74).opCall();
        Exclude(local_74).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_88 = 0;
        FECSRuntimeViewIterator local_122 = local_74.Iterator();
        for (; local_122.CanProceed;)
        {
            local_36 = local_122.Proceed();
            ++local_88;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_Query(local_160);
        }
        local_2.UpdateCachedEntityCount(local_88);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    void Monitor___JobTimer_Pre___Job_TimerOnly(const FC_TestASTimerOnly &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.TargetTime);
        FName local_12 = FName("S_TestECSAccessAnalyzeASSystem::Job_TimerOnly");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_12, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___Job_TimerOnly(const FC_TestASTimerOnly &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.TargetTime);
        FName local_12 = FName("S_TestECSAccessAnalyzeASSystem::Job_TimerOnly");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_12, local_6, Entity.GetId(), false);
        }
        return;
    }
    void Monitor___JobTimer_OnSync___Job_TimerOnly(const FC_TestASTimerOnly &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.TargetTime);
        FName local_12 = FName("S_TestECSAccessAnalyzeASSystem::Job_TimerOnly");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_12, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___Job_TimerOnly() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorTestASTimerOnlyOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___Job_TimerOnly(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorTestASTimerOnlyOnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___Job_TimerOnly(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___Job_TimerOnly() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorTestASTimerOnlyOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___Job_TimerOnly(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorTestASTimerOnlyOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___Job_TimerOnly(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_OnSync___Job_TimerOnly() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorTestASTimerOnlyOnModifyView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_OnSync___Job_TimerOnly(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorTestASTimerOnlyOnActiveView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_OnSync___Job_TimerOnly(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TimerOnly() const
    {
        ECS::GetContextJob();
        this.Job_TimerOnly();
        return;
    }
    UFUNCTION()
    void Run_Job_HandleEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_TestASEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_TestASEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}


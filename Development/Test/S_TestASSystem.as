

struct FTestInternalStruct
{
    UPROPERTY()
    FFPTime InternalTime;
    UPROPERTY()
    bool bFirstEntity;

    FTestInternalStruct()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

class US_TestASSystem : UECSScriptSystem
{
    FInstancedStruct TestLocalStorage;
    bool bCommonTest = false;
    bool bTimerTest = false;
    bool bTestTimeStampAlignWithInterval = false;
    bool bTestMonitorCheck = false;
    bool bTestDestroySomeEntity = false;
    bool bTestECSAPIPerformance = false;
    bool bTestMonitorDefer = false;
    bool bTestNotifyEvent = false;


    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return (!(this.bCommonTest) && !(this.bTimerTest) && !(this.bTestTimeStampAlignWithInterval) && !(this.bTestMonitorCheck) && !(this.bTestDestroySomeEntity) && !(this.bTestECSAPIPerformance) && !(this.bTestMonitorDefer) && !(this.bTestNotifyEvent));
    }
    UFUNCTION()
    void Init_Implementation()
    {
        return;
    }
    TRawPtr<FTestInternalStruct> GetTestStruct() const
    {
        return FInstancedStruct::GetMutablePtr_Const(this.TestLocalStorage).opCall();
    }
    UFUNCTION()
    void UpdateTest(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, const FC_ESM &inout ESM, FC_ViewEntityManager &inout Actor) const
    {
        Has local_4;
        if (local_4.opCall() == false)
        {
        }
        else
        {
            FC_TestASData local_12;
            local_12.TestData0 = (int(local_12.TestData0) + 10000);
            int local_19 = Entity.GetIdValue();
            XError(ELog(0), FString().Append("Modify Comp ").Append(local_19).Append(" -> ").Append(local_12.TestData0));
        }
        FString local_18 = FString();
        XError(ELog(0), local_18.Append("BatchJob EntityId = ").Append(Entity.GetIdValue()));
        FFPTime local_30 = (FFPTime(FixedTime.Time) + FFPTime(0.05));
        FECSWorldPtr local_34 = this.GetECSWorld();
        int local_19_2 = Entity.GetIdValue();
        FCE_TestASEvent local_32;
        local_32.TestData0 = (local_19_2 * 10);
        float32 local_39 = -Entity.GetIdValue();
        local_32.TestVectorData = FVector(Entity.GetIdValue(), local_39, 0.0);
        XError(ELog(0), FString().Append("Send Event for entity ").Append(Entity.GetIdValue()));
        return;
    }
    UFUNCTION()
    void NonBatchJob() const
    {
        int local_8 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        XWarning(ELog(0), FString().Append("Testing Event Client At [").Append(local_8.Time).Append("]}"));
        TECSEventConstIterator<FCE_TestASEvent> local_46 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_46.CanProceed;)
        {
            const FCE_TestASEvent& local_70 = local_46.Proceed();
            XError(ELog(0), FString().Append("Got Event [Event").Append(local_70.Time).Append("]: ").Append(local_70.Sender.GetIdValue()).Append(", ").Append(local_70.TestData0).Append(", ").Append(local_70.TestVectorData));
        }
        return;
    }
    UFUNCTION()
    void Monitor_ActorActive(const FC_Actor &inout ActorComp) const
    {
        if (ActorComp)
        {
        }
        else
        {
        }
        AActor local_8;
        AActor local_2 = local_8;
        if (local_2 != nullptr)
        {
            XWarning(ELog(0), FString().Append("On Active ").Append(local_2.GetName()));
        }
        return;
    }
    FECSEntity CreateTimerEntity(const FFPTime &inout AlignTime) const
    {
        FECSEntity local_8 = ECS::GetECSWorld().Create(EEntityType(0), NAME_None);
        FC_TimeTweak local_30 = FC_TimeTweak();
        Assign local_16;
        local_16.opCall(local_30).SetAlignWorldTime(AlignTime);
        FECSNetUtils::SetNetPredict(local_8, FNetPlayerMask(-1));
        return local_8;
    }
    UFUNCTION()
    void ServerJob_TestJobTimerInit(const FCS_FixedTime &inout FixedTime) const
    {
        FFPTime local_2 = FFPTime(5.0);
        bool local_5 = FixedTime.IsOnInterval(local_2);
        if (!(local_5))
        {
            local_5 = false;
        }
        else
        {
            TRawPtr<FTestInternalStruct> local_8;
            local_8 = this.GetTestStruct();
            local_5 = (local_2.opCmp(0.0) <= 0);
        }
        if (local_5)
        {
            TRawPtr<FTestInternalStruct> local_8;
            local_8 = this.GetTestStruct();
            XError(ELog(0), FString().Append("TestJobTimerLog:: Assign ").Append(FixedTime.Time).Append(": ").Append((this.CreateTimerEntity((FFPTime(FixedTime.Time) + FFPTime(15)))).GetIdValue()).Append(" ").Append((this.CreateTimerEntity((FFPTime(FixedTime.Time) + FFPTime(15)))).GetIdValue()).Append(" ").Append((this.CreateTimerEntity((FFPTime(FixedTime.Time) + FFPTime(15)))).GetIdValue()).Append(" ").Append((this.CreateTimerEntity((FFPTime(FixedTime.Time) + FFPTime(20)))).GetIdValue()).Append(" "));
        }
        return;
    }
    UFUNCTION()
    void Job_TestJobTimer(const FECSEntity &inout Entity, const FC_TimeTweak &inout SimpleTimeTweak, const FCS_FixedTime &inout FixedTime) const
    {
        Modify local_22;
        bool local_6 = (FFPTime(FixedTime.Time).opCmp(SimpleTimeTweak.GetAlignWorldTime()) >= 0);
        if (local_6)
        {
            TRawPtr<FTestInternalStruct> local_28;
            bool local_13;
            FString local_10 = FString();
            XError(ELog(0), local_10.Append("TestJobTimerLog:: OnTimer ").Append(FixedTime.Time).Append(": ").Append(local_6).Append(". Entity = ").Append(Entity.GetIdValue()));
            local_13 = false;
            bool local_1 = false;
            if (local_13)
            {
                local_22.opCall().SetAlignWorldTime((FFPTime(FixedTime.Time) + FFPTime(10)));
            }
            if (local_1)
            {
                local_22.opCall().SetAlignWorldTime(FFPTime(-1));
                Remove local_26;
                local_26.opCall();
            }
            local_28 = this.GetTestStruct();
            local_1 = !local_1;
            if (local_1 == !(false))
            {
                local_1 = true;
                local_28 = this.GetTestStruct();
                local_22.opCall().SetAlignWorldTime((FFPTime(FixedTime.Time) + FFPTime(1)));
                local_22.opCall().SetAlignWorldTime(FixedTime.Time);
                FString local_10_2 = FString();
                XError(ELog(0), local_10_2.Append("TestJobTimerLog:: Re-schedule to current frame ").Append(SimpleTimeTweak.GetAlignWorldTime()).Append(" at ").Append(FixedTime.Time).Append(", Entity = ").Append(Entity.GetIdValue()));
            }
        }
        return;
    }
    UFUNCTION()
    void Job_TestWorldTimeStampInterval(const FCS_FixedTime &inout FixedTime) const
    {
        FFPTime local_16;
        FFPTime local_4 = ECS::GetContextWorldTimeStampAlign();
        if (ECS::GetRuntimeInfo().IsServer)
        {
            FString local_10 = FString();
            XError(ELog(0), local_10.Append("Server Test WorldTimeStampInterval ").Append(FixedTime.Time).Append(", AlignTime = ").Append(local_4).Append(" (Should Be 0)"));
        }
        else
        {
            if (FixedTime.IsOnInterval(FFPTime(0.3333333333333333)))
            {
                (FFPTime(FixedTime.Time) + local_16);
                FString local_10_2 = FString();
            }
            else
            {
                (FFPTime(FixedTime.Time) + local_16);
                FString local_10_3 = FString();
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_ActorActiveLate(const FC_Actor &inout ActorComp) const
    {
        if (ActorComp)
        {
        }
        else
        {
        }
        AActor local_8;
        AActor local_2 = local_8;
        if (local_2 != nullptr)
        {
            XWarning(ELog(0), FString().Append("On Active ").Append(local_2.GetName()));
        }
        return;
    }
    UFUNCTION()
    void ClientJob_TestActorActive(const FECSEntity &inout Entity, FC_NetPredict &inout NetPredict) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
    UFUNCTION()
    void ServerJob_CreateSomeDummyEntity(const FCS_FixedTime &inout FixedTime) const
    {
        FECSEntity local_8 = ECS::GetECSWorld().Create(EEntityType(0), NAME_None);
        FC_LifeTime local_32 = FC_LifeTime();
        Assign local_24;
        local_24.opCall(local_32).SetSpawnTime((FFPTime(FixedTime.Time) + FFPTime(8)));
        FECSNetUtils::SetNetPredict(local_8, FNetPlayerMask(-1));
        return;
    }
    UFUNCTION()
    void ServerJob_DestroySomeDummyEntity(const FECSEntity &inout Entity, FC_LifeTime &inout LifeTime) const
    {
        Entity.DestroyDeferred();
        XError(ELog(0), FString().Append("Destroy Entity ").Append(Entity.GetIdValue()));
        return;
    }
    UFUNCTION()
    void ServerJob_MakeSomethingDirtyBeforeDestroy(const FECSEntity &inout Entity, FC_LifeTime &inout LifeTime) const
    {
        LifeTime.SetSpawnTime(FFPTime(-1));
        return;
    }
    UFUNCTION()
    void ClientJob_TestECSAPIPerformance(const FECSEntity &inout Entity) const
    {
        return;
    }
    UFUNCTION()
    void ClientJob_TestECSAPIPerformance2(const FECSEntity &inout Entity) const
    {
        bool local_1 = false;
        Has local_6;
        bool local_1_2 = local_6.opCall();
        return;
    }
    UFUNCTION()
    void Monitor_TestMonitorAllowDefer(const FECSEntity &inout Entity, const FC_TimeTweak &inout Sth) const
    {
        XError(ELog(2), FString().Append("On Defer Monitor Trigger ").Append(Entity.GetIdValue()));
        Entity.DestroyDeferred();
        return;
    }
    UFUNCTION()
    void ServerJob_TestTrigger() const
    {
        FECSEntity local_8 = ECS::GetECSWorld().Create(EEntityType(0), NAME_None);
        Assign local_16;
        FC_TimeTweak local_30;
        local_16.opCall(local_30);
        return;
    }
    UFUNCTION()
    void ClientJob_TestUploadNotifyEvent(const FECSEntity &inout Entity, const FC_ESM &inout ESM) const
    {
        if (ECS::GetRuntimeInfo().IsOnInterval(FFPTime(5.0)))
        {
            FCE_TestNotifyUploadEvent local_14;
            FFPTime local_2 = FFPTime(-1);
            local_14.TestEventPayload = int(ECS::GetRuntimeInfo().Frame);
            XLog(ELog(0), FString().Append("NotifyEventTest: Client Send Event at ").Append(ECS::GetRuntimeInfo().Time).Append(": PayLoad ").Append(local_14.TestEventPayload));
        }
        return;
    }
    UFUNCTION()
    void ServerJob_TestReceiveNotifyEvent(const FCE_TestNotifyUploadEvent &inout Event) const
    {
        XWarning(ELog(0), FString().Append("NotifyEventTest: Server Receive Event at ").Append(ECS::GetRuntimeInfo().Time).Append(": PayLoad ").Append(Event.TestEventPayload));
        return;
    }
    UFUNCTION()
    void ServerJob_TestSyncNotifyEvent(const FECSEntity &inout Entity, const FC_ESM &inout ESM) const
    {
        FCE_TestNotifySyncEvent local_14;
        if (ECS::GetRuntimeInfo().IsOnInterval(FFPTime(5.0)))
        {
            int local_6 = 0;
            for (; local_6 < 5; )
            {
                FFPTime local_2 = FFPTime(-1);
                local_14.TestEventPayload = (int(ECS::GetRuntimeInfo().Frame) + local_6);
                XLog(ELog(0), FString().Append("NotifyEventTest: Server Send Event at ").Append(ECS::GetRuntimeInfo().Time).Append(": ").Append(Entity).Append(" = ").Append(local_14.TestEventPayload));
                ++local_6;
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_TestReceiveNotifyEvent(const FCE_TestNotifySyncEvent &inout Event) const
    {
        FString local_4 = FString();
        XWarning(ELog(0), local_4.Append("NotifyEventTest: Client Receive Event at ").Append(ECS::GetRuntimeInfo().Time).Append(": ").Append(Event.Sender).Append(" =  ").Append(Event.TestEventPayload));
        return;
    }
    UFUNCTION()
    void Run_UpdateTest() const
    {
        int local_8 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_192 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(this.bCommonTest) == !(false))
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
                this.UpdateTest(local_40, local_8, local_42, local_48);
                FECSEntity::MarkModifiedIfDirty<FC_ViewEntityManager> local_56;
                local_56.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Exclude(local_94).opCall();
        Exclude(local_94).opCall();
        bool local_5 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_120 = 0;
        FECSRuntimeViewIterator local_154 = local_94.Iterator();
        for (; local_154.CanProceed;)
        {
            local_40 = local_154.Proceed();
            ++local_120;
            if (local_5)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.UpdateTest(local_192, local_8, local_42, local_48);
            FECSEntity::MarkModifiedIfDirty<FC_ViewEntityManager>(local_40).opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_120);
        if (local_5)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_NonBatchJob() const
    {
        ECS::GetContextJob();
        if (this.bCommonTest == false)
        {
            return;
        }
        this.NonBatchJob();
        return;
    }
    UFUNCTION()
    void Run_Monitor_ActorActive() const
    {
        int local_50 = 0;
        ECS::GetContextJob();
        if (this.bCommonTest == false)
        {
            return;
        }
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorActorOnActiveView(EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_48 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ActorActive(local_50);
        }
        FECSMonitorRuntimeView local_16 = this.GetECSWorld().__GetMonitorActorOnInactiveView(EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_48_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_ActorActive(local_50);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TestJobTimerInit() const
    {
        int local_8 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (this.bTimerTest == false)
        {
            return;
        }
        this.ServerJob_TestJobTimerInit(local_8);
        return;
    }
    void Monitor___JobTimer_Pre___Job_TestJobTimer(const FC_TimeTweak &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.GetAlignWorldTime();
        FName local_8 = FName("S_TestASSystem::Job_TestJobTimer");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___Job_TestJobTimer(const FC_TimeTweak &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.GetAlignWorldTime();
        FName local_8 = FName("S_TestASSystem::Job_TestJobTimer");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    void Monitor___JobTimer_OnSync___Job_TestJobTimer(const FC_TimeTweak &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.GetAlignWorldTime();
        FName local_8 = FName("S_TestASSystem::Job_TestJobTimer");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___Job_TestJobTimer() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = this.GetECSWorld().__GetMonitorTimeTweakOnModifyView(EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___Job_TestJobTimer(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = this.GetECSWorld().__GetMonitorTimeTweakOnActiveView(EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___Job_TestJobTimer(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___Job_TestJobTimer() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = this.GetECSWorld().__GetMonitorTimeTweakOnModifyView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___Job_TestJobTimer(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = this.GetECSWorld().__GetMonitorTimeTweakOnActiveView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___Job_TestJobTimer(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_OnSync___Job_TestJobTimer() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = this.GetECSWorld().__GetMonitorTimeTweakOnModifyView(EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_OnSync___Job_TestJobTimer(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = this.GetECSWorld().__GetMonitorTimeTweakOnActiveView(EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_OnSync___Job_TestJobTimer(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TestJobTimer() const
    {
        int local_8 = 0;
        bool local_34;
        int local_40 = 0;
        int local_48 = 0;
        int local_50 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        bool local_6 = !(false);
        if (!(this.bTimerTest) == local_6)
        {
            return;
        }
        FECSWorldPtr local_10 = ECS::GetECSWorld();
        local_4.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_14 = local_4.GetExternalEntityList();
        for (auto& local_28 : local_14)
        {
            local_28;
            FECSEntity local_32;
            FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
            local_34 = false;
            if (!(local_32.IsActive()) == !(false))
            {
                continue;
            }
            if (!(local_40))
            {
                continue;
            }
            FFPTime local_42 = local_40.GetAlignWorldTime();
            if (local_42.opCmp(0.0) < 0 || (FFPTime(local_40.GetAlignWorldTime()) == FPTIME_MAX))
            {
                continue;
            }
            if (local_34)
            {
                continue;
            }
            this.Job_TestJobTimer(local_48, local_50, local_8);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    UFUNCTION()
    void Run_Job_TestWorldTimeStampInterval() const
    {
        int local_12 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (this.bTestTimeStampAlignWithInterval == false)
        {
            return;
        }
        if (!(local_2.IsOnInterval(FFPTime(0.2))))
        {
            return;
        }
        this.Job_TestWorldTimeStampInterval(local_12);
        return;
    }
    UFUNCTION()
    void Run_Monitor_ActorActiveLate() const
    {
        int local_50 = 0;
        ECS::GetContextJob();
        if (this.bTestMonitorCheck == false)
        {
            return;
        }
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorActorOnActiveView(EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_48 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ActorActiveLate(local_50);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestActorActive() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_166 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        if (!(this.bTestMonitorCheck) == !(false))
        {
            return;
        }
        int local_6 = 0;
        int local_5 = local_6;
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
                this.ClientJob_TestActorActive(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Exclude(local_84).opCall();
        bool local_3 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_84.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_3)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_TestActorActive(local_166, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_3)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_CreateSomeDummyEntity() const
    {
        int local_8 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (this.bTestDestroySomeEntity == false)
        {
            return;
        }
        this.ServerJob_CreateSomeDummyEntity(local_8);
        return;
    }
    void Monitor___JobTimer_Pre___ServerJob_DestroySomeDummyEntity(const FC_LifeTime &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.GetSpawnTime();
        FName local_8 = FName("S_TestASSystem::ServerJob_DestroySomeDummyEntity");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___ServerJob_DestroySomeDummyEntity(const FC_LifeTime &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.GetSpawnTime();
        FName local_8 = FName("S_TestASSystem::ServerJob_DestroySomeDummyEntity");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___ServerJob_DestroySomeDummyEntity() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = this.GetECSWorld().__GetMonitorLifeTimeOnModifyView(EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___ServerJob_DestroySomeDummyEntity(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = this.GetECSWorld().__GetMonitorLifeTimeOnActiveView(EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___ServerJob_DestroySomeDummyEntity(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___ServerJob_DestroySomeDummyEntity() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = this.GetECSWorld().__GetMonitorLifeTimeOnModifyView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___ServerJob_DestroySomeDummyEntity(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = this.GetECSWorld().__GetMonitorLifeTimeOnActiveView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___ServerJob_DestroySomeDummyEntity(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DestroySomeDummyEntity() const
    {
        bool local_30;
        int local_36 = 0;
        int local_44 = 0;
        int local_46 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        bool local_4 = !(false);
        if (!(this.bTestDestroySomeEntity) == local_4)
        {
            return;
        }
        FECSWorldPtr local_6 = ECS::GetECSWorld();
        local_2.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_10 = local_2.GetExternalEntityList();
        for (auto& local_24 : local_10)
        {
            local_24;
            FECSEntity local_28;
            FECSEntityScopeCycleCounter local_29 = FECSEntityScopeCycleCounter(local_28);
            local_30 = false;
            if (!(local_28.IsActive()) == !(false))
            {
                continue;
            }
            if (!(local_36))
            {
                continue;
            }
            FFPTime local_38 = local_36.GetSpawnTime();
            if (local_38.opCmp(0.0) < 0 || (FFPTime(local_36.GetSpawnTime()) == FPTIME_MAX))
            {
                continue;
            }
            if (local_30)
            {
                continue;
            }
            this.ServerJob_DestroySomeDummyEntity(local_44, local_46);
            MarkModifiedIfDirty local_54;
            local_54.opCall(local_46);
        }
        local_2.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_MakeSomethingDirtyBeforeDestroy() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_166 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        if (!(this.bTestDestroySomeEntity) == !(false))
        {
            return;
        }
        int local_6 = 0;
        int local_5 = local_6;
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
                this.ServerJob_MakeSomethingDirtyBeforeDestroy(local_36, local_38);
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
        bool local_3 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_84.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_3)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ServerJob_MakeSomethingDirtyBeforeDestroy(local_166, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_3)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestECSAPIPerformance() const
    {
        const FECSEntity& local_36;
        int local_156 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        if (!(this.bTestECSAPIPerformance) == !(false))
        {
            return;
        }
        int local_6 = 0;
        int local_5 = local_6;
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
                this.ClientJob_TestECSAPIPerformance(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Exclude(local_74).opCall();
        bool local_3 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_84 = 0;
        FECSRuntimeViewIterator local_118 = local_74.Iterator();
        for (; local_118.CanProceed;)
        {
            local_36 = local_118.Proceed();
            ++local_84;
            if (local_3)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_TestECSAPIPerformance(local_156);
        }
        local_2.UpdateCachedEntityCount(local_84);
        if (local_3)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestECSAPIPerformance2() const
    {
        const FECSEntity& local_36;
        int local_156 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        if (!(this.bTestECSAPIPerformance) == !(false))
        {
            return;
        }
        int local_6 = 0;
        int local_5 = local_6;
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
                this.ClientJob_TestECSAPIPerformance2(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Exclude(local_74).opCall();
        bool local_3 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_84 = 0;
        FECSRuntimeViewIterator local_118 = local_74.Iterator();
        for (; local_118.CanProceed;)
        {
            local_36 = local_118.Proceed();
            ++local_84;
            if (local_3)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_TestECSAPIPerformance2(local_156);
        }
        local_2.UpdateCachedEntityCount(local_84);
        if (local_3)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    void Monitor___CacheForDefer___Monitor_TestMonitorAllowDefer(const FC_TimeTweak &inout MonitorComp, const FECSEntity &inout Entity) const
    {
        if (Entity.IsValid() == false)
        {
            XError(ELog(2), "Not Supported: monitor defer tag on Entity Destroy FC_NoPredictTag");
            return;
        }
        Has local_8;
        bool local_2 = local_8.opCall();
        if (local_2)
        {
            Remove local_12;
            local_12.opCall();
            return;
        }
        Assign local_16;
        local_16.opCall(FC_NoPredictTag());
        return;
    }
    UFUNCTION()
    void Run_Monitor___CacheForDefer___Monitor_TestMonitorAllowDefer() const
    {
        int local_70 = 0;
        int local_72 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_32 = this.GetECSWorld().__GetMonitorTimeTweakOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_48 = local_32.Iterator();
        for (; local_48.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_62 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_63 = FECSEntityScopeCycleCounter(local_62.Entity);
            GetComponent local_68 = FECSMonitorRuntimeViewItem::GetComponent(local_62);
            this.Monitor___CacheForDefer___Monitor_TestMonitorAllowDefer(local_70, local_72);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_TestMonitorAllowDefer() const
    {
        const FECSEntity& local_120;
        int local_128 = 0;
        int local_130 = 0;
        ECS::GetContextJob();
        if (this.bTestMonitorDefer == false)
        {
            return;
        }
        int local_6 = 0;
        int local_5 = local_6;
        FECSRuntimeView local_46 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_50;
        local_50.opCall();
        FECSRuntimeViewIterator local_84 = local_46.Iterator();
        for (; local_84.CanProceed;)
        {
            local_120 = local_84.Proceed();
            FECSEntityScopeCycleCounter local_121 = FECSEntityScopeCycleCounter(local_120);
            this.Monitor_TestMonitorAllowDefer(local_130, local_128);
        }
        FECSMonitorRuntimeView local_134 = this.GetECSWorld().__GetMonitorTimeTweakOnAssignView(EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_150 = local_134.Iterator();
        for (; local_150.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_164 = local_150.Proceed();
            FECSEntityScopeCycleCounter local_121_2 = FECSEntityScopeCycleCounter(local_164.Entity);
            GetComponent local_168 = FECSMonitorRuntimeViewItem::GetComponent(local_164);
            this.Monitor_TestMonitorAllowDefer(local_120, local_128);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TestTrigger() const
    {
        ECS::GetContextJob();
        if (this.bTestMonitorDefer == false)
        {
            return;
        }
        this.ServerJob_TestTrigger();
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestUploadNotifyEvent() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_166 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        if (!(this.bTestNotifyEvent) == !(false))
        {
            return;
        }
        int local_6 = 0;
        int local_5 = local_6;
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
                this.ClientJob_TestUploadNotifyEvent(local_36, local_38);
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
        bool local_3 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_80.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_3)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_TestUploadNotifyEvent(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_3)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TestReceiveNotifyEvent() const
    {
        ECS::GetContextJob();
        if (!(this.bTestNotifyEvent) == !(false))
        {
            return;
        }
        TECSEventConstIterator<FCE_TestNotifyUploadEvent> local_38 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_38.CanProceed;)
        {
            const FCE_TestNotifyUploadEvent& local_60 = local_38.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (!(local_60.Validate()) == !(false))
            {
                FString local_70 = "Validate Failed: FCE_TestNotifyUploadEvent, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_TestReceiveNotifyEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TestSyncNotifyEvent() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_166 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        if (!(this.bTestNotifyEvent) == !(false))
        {
            return;
        }
        int local_6 = 0;
        int local_5 = local_6;
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
                this.ServerJob_TestSyncNotifyEvent(local_36, local_38);
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
        bool local_3 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_80.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_3)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ServerJob_TestSyncNotifyEvent(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_3)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestReceiveNotifyEvent() const
    {
        ECS::GetContextJob();
        if (this.bTestNotifyEvent == false)
        {
            return;
        }
        TECSEventConstIterator<FCE_TestNotifySyncEvent> local_38 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_38.CanProceed;)
        {
            const FCE_TestNotifySyncEvent& local_60 = local_38.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_TestReceiveNotifyEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}




struct FTestASMultiThreadingStorage
{
    UPROPERTY()
    bool bParallelContextPrepared = false;
    UPROPERTY()
    bool bAccessErrorCheckTriggered = false;
    UPROPERTY()
    FECSEntityId FirstPreparedEntityId = ENTITY_ID_NULL;
    UPROPERTY()
    FECSEntityId LastPreparedEntityId = ENTITY_ID_NULL;
    UPROPERTY()
    int SchedulerThreadId = 0;
    UPROPERTY()
    FString SchedulerThreadName = "None";


}

class US_TestASMultiThreadingSystem : UECSScriptSystem
{
    bool bTestASMultiThreading = false;
    bool bTestAsyncDispatchWaitFinish = false;
    bool bTestAsyncDispatchDependencySerial = false;
    bool bCheckMultiThreadingAccessErrorReport = false;
    FInstancedStruct TestLocalStorage;


    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return (!(this.bTestASMultiThreading) && !(this.bTestAsyncDispatchWaitFinish) && !(this.bTestAsyncDispatchDependencySerial));
    }
    UFUNCTION()
    void Init_Implementation()
    {
        return;
    }
    TRawPtr<FTestASMultiThreadingStorage> GetTestStorage() const
    {
        return FInstancedStruct::GetMutablePtr_Const(this.TestLocalStorage).opCall();
    }
    UFUNCTION()
    void ClientJob_PrepareParallelContext() const
    {
        bool local_3 = false;
        TRawPtr<FTestASMultiThreadingStorage> local_2 = this.GetTestStorage();
        if (local_3)
        {
            return;
        }
        local_3 = true;
        TRawPtr<FTestASMultiThreadingStorage> local_2_2 = this.GetTestStorage();
        int local_4 = 0;
        for (; local_4 < 256; )
        {
            FECSEntity local_14 = ECS::GetECSWorld().Create(EEntityType(0), n"TestASParallelEntity");
            FC_TestASData local_24;
            Assign local_22;
            local_22.opCall(local_24).TestData0 = local_4;
            Assign local_28;
            local_28.opCall(FC_LocalTag());
            TRawPtr<FTestASMultiThreadingStorage> local_2_3 = this.GetTestStorage();
            FECSEntityId local_30;
            if ((local_30 == ENTITY_ID_NULL))
            {
                local_30 = local_14.GetId();
                TRawPtr<FTestASMultiThreadingStorage> local_2_4 = this.GetTestStorage();
            }
            local_30 = local_14.GetId();
            TRawPtr<FTestASMultiThreadingStorage> local_2_5 = this.GetTestStorage();
            ++local_4;
        }
        XLog(ELog(0), "TestASMultiThreading: prepared context entities");
        return;
    }
    UFUNCTION()
    void ClientJob_TestParallelSpecifierSample_SingleThreadForCompare_Before(const FECSEntity &inout Entity, const FC_TestASData &inout TestComp) const
    {
        FFPTime local_2 = FFPTime(ECS::GetRuntimeInfo().Time);
        Modify local_6;
        local_6.opCall().TestData0 = (local_6.opCall().TestData0 + 1);
        XLog(ELog(0), FString().Append("TestASMultiThreading Before: Time=").Append(local_2).Append(" Entity=").Append(Entity.GetIdValue()).Append(" Data=").Append(TestComp.TestData0));
        return;
    }
    UFUNCTION()
    void ClientJob_TestParallelSpecifierSample(const FECSEntity &inout Entity, const FC_TestASData &inout TestComp) const
    {
        FFPTime local_2 = FFPTime(ECS::GetRuntimeInfo().Time);
        Modify local_6;
        local_6.opCall().TestData0 = (local_6.opCall().TestData0 + 1);
        XLog(ELog(0), FString().Append("TestASMultiThreading Parallel: Time=").Append(local_2).Append(" Entity=").Append(Entity.GetIdValue()).Append(" Data=").Append(TestComp.TestData0));
        return;
    }
    UFUNCTION()
    void ClientJob_TestParallelSpecifierSample_SingleThreadForCompare_After(const FECSEntity &inout Entity, const FC_TestASData &inout TestComp) const
    {
        FFPTime local_2 = FFPTime(ECS::GetRuntimeInfo().Time);
        Modify local_6;
        local_6.opCall().TestData0 = (local_6.opCall().TestData0 + 1);
        XLog(ELog(0), FString().Append("TestASMultiThreading After: Time=").Append(local_2).Append(" Entity=").Append(Entity.GetIdValue()).Append(" Data=").Append(TestComp.TestData0));
        return;
    }
    UFUNCTION()
    void ClientJob_TestAsyncDispatchFrameEndWait60ms() const
    {
        int local_2 = FECSThreadPool::GetCurrentThreadId();
        FECSThreadPool::GetCurrentThreadName();
        FDateTime local_14 = FDateTime::Now();
        while (((FDateTime::Now() - local_14).GetTotalMilliseconds()) < 60.0)
        {
        }
        TRawPtr<FTestASMultiThreadingStorage> local_26 = this.GetTestStorage();
        TRawPtr<FTestASMultiThreadingStorage> local_24 = this.GetTestStorage();
        FString local_6 = FString();
        return;
    }
    UFUNCTION()
    void ClientJob_TestAsyncDispatchDependencySerialA(const FCS_FixedTime &inout FixedFrame) const
    {
        int local_2 = int(FixedFrame.Frame);
        int local_2_2 = FECSThreadPool::GetCurrentThreadId();
        FECSThreadPool::GetCurrentThreadName();
        FDateTime local_16 = FDateTime::Now();
        TRawPtr<FTestASMultiThreadingStorage> local_20 = this.GetTestStorage();
        TRawPtr<FTestASMultiThreadingStorage> local_18 = this.GetTestStorage();
        FString local_8 = FString();
        while (((FDateTime::Now() - local_16).GetTotalMilliseconds()) < 3.0)
        {
        }
        TRawPtr<FTestASMultiThreadingStorage> local_18_2 = this.GetTestStorage();
        TRawPtr<FTestASMultiThreadingStorage> local_20_2 = this.GetTestStorage();
        FString local_8_2 = FString();
        return;
    }
    UFUNCTION()
    void ClientJob_TestAsyncDispatchDependencySerialB() const
    {
        int local_2 = FECSThreadPool::GetCurrentThreadId();
        FECSThreadPool::GetCurrentThreadName();
        FDateTime local_14 = FDateTime::Now();
        TRawPtr<FTestASMultiThreadingStorage> local_18 = this.GetTestStorage();
        TRawPtr<FTestASMultiThreadingStorage> local_16 = this.GetTestStorage();
        FString local_6 = FString();
        while (((FDateTime::Now() - local_14).GetTotalMilliseconds()) < 3.0)
        {
        }
        TRawPtr<FTestASMultiThreadingStorage> local_16_2 = this.GetTestStorage();
        TRawPtr<FTestASMultiThreadingStorage> local_18_2 = this.GetTestStorage();
        FString local_6_2 = FString();
        return;
    }
    UFUNCTION()
    void ClientJob_TestAsyncDispatchDependencySerialC(const FCS_FixedTime &inout FixedTime) const
    {
        FCS_FixedTime local_30;
        FCS_FixedTime local_40;
        int local_2 = FECSThreadPool::GetCurrentThreadId();
        FECSThreadPool::GetCurrentThreadName();
        FDateTime local_14 = FDateTime::Now();
        TRawPtr<FTestASMultiThreadingStorage> local_18 = this.GetTestStorage();
        TRawPtr<FTestASMultiThreadingStorage> local_16 = this.GetTestStorage();
        FString local_6 = FString();
        while (((FDateTime::Now() - local_14).GetTotalMilliseconds()) < 3.0)
        {
        }
        FECSWorldPtr local_32 = ECS::GetECSWorld();
        if (int(local_30.Frame) != int(FixedTime.Frame))
        {
            XWarning(ELog(0), FString().Append("TestASMultiThreading AsyncDispatch dependency multi C(Test1) cached FixedTime differs from World get default: CachedFrame=").Append(FixedTime.Frame).Append(" WorldFrame=").Append(local_30.Frame));
        }
        FECSWorldPtr local_32_2 = ECS::GetECSWorld();
        if (int(local_40.Frame) != int(FixedTime.Frame))
        {
            XLog(ELog(0), FString().Append("TestASMultiThreading AsyncDispatch dependency multi C(Test1) cached FixedTime differs from World Modify : CachedFrame=").Append(FixedTime.Frame).Append(" WorldFrame=").Append(local_30.Frame));
        }
        TRawPtr<FTestASMultiThreadingStorage> local_16_2 = this.GetTestStorage();
        TRawPtr<FTestASMultiThreadingStorage> local_18_2 = this.GetTestStorage();
        FString local_6_2 = FString();
        return;
    }
    UFUNCTION()
    void ClientJob_TestAsyncDispatchDependencySerialD() const
    {
        int local_2 = FECSThreadPool::GetCurrentThreadId();
        FECSThreadPool::GetCurrentThreadName();
        FDateTime local_14 = FDateTime::Now();
        TRawPtr<FTestASMultiThreadingStorage> local_18 = this.GetTestStorage();
        TRawPtr<FTestASMultiThreadingStorage> local_16 = this.GetTestStorage();
        FString local_6 = FString();
        while (((FDateTime::Now() - local_14).GetTotalMilliseconds()) < 1.0)
        {
        }
        TRawPtr<FTestASMultiThreadingStorage> local_16_2 = this.GetTestStorage();
        TRawPtr<FTestASMultiThreadingStorage> local_18_2 = this.GetTestStorage();
        FString local_6_2 = FString();
        return;
    }
    UFUNCTION()
    void ClientJob_TestAsyncDispatchDependencySerialE() const
    {
        int local_2 = FECSThreadPool::GetCurrentThreadId();
        FECSThreadPool::GetCurrentThreadName();
        FDateTime local_14 = FDateTime::Now();
        TRawPtr<FTestASMultiThreadingStorage> local_18 = this.GetTestStorage();
        TRawPtr<FTestASMultiThreadingStorage> local_16 = this.GetTestStorage();
        FString local_6 = FString();
        while (((FDateTime::Now() - local_14).GetTotalMilliseconds()) < 1.0)
        {
        }
        TRawPtr<FTestASMultiThreadingStorage> local_16_2 = this.GetTestStorage();
        TRawPtr<FTestASMultiThreadingStorage> local_18_2 = this.GetTestStorage();
        FString local_6_2 = FString();
        return;
    }
    UFUNCTION()
    void ClientJob_TestAsyncDispatchDependencySerialF() const
    {
        int local_2 = FECSThreadPool::GetCurrentThreadId();
        FECSThreadPool::GetCurrentThreadName();
        FDateTime local_14 = FDateTime::Now();
        TRawPtr<FTestASMultiThreadingStorage> local_18 = this.GetTestStorage();
        TRawPtr<FTestASMultiThreadingStorage> local_16 = this.GetTestStorage();
        FString local_6 = FString();
        while (((FDateTime::Now() - local_14).GetTotalMilliseconds()) < 1.0)
        {
        }
        TRawPtr<FTestASMultiThreadingStorage> local_16_2 = this.GetTestStorage();
        TRawPtr<FTestASMultiThreadingStorage> local_18_2 = this.GetTestStorage();
        FString local_6_2 = FString();
        return;
    }
    UFUNCTION()
    void ClientJob_TestWaitAsyncDispatch() const
    {
        int local_1 = FECSThreadPool::GetCurrentThreadId();
        TRawPtr<FTestASMultiThreadingStorage> local_4 = this.GetTestStorage();
        FString local_8 = FECSThreadPool::GetCurrentThreadName();
        TRawPtr<FTestASMultiThreadingStorage> local_4_2 = this.GetTestStorage();
        TRawPtr<FTestASMultiThreadingStorage> local_14 = this.GetTestStorage();
        TRawPtr<FTestASMultiThreadingStorage> local_12 = this.GetTestStorage();
        TRawPtr<FTestASMultiThreadingStorage> local_10 = this.GetTestStorage();
        TRawPtr<FTestASMultiThreadingStorage> local_4_3 = this.GetTestStorage();
        FString local_8_2 = FString();
        return;
    }
    UFUNCTION()
    void ClientJob_TestParallelSpecifierSample_AccessErrorPath(const FECSEntity &inout Entity, const FC_TestASData &inout TestComp) const
    {
        bool local_4 = false;
        FECSEntityId local_3 = Entity.GetId();
        TRawPtr<FTestASMultiThreadingStorage> local_2 = this.GetTestStorage();
        local_4 = !local_4;
        if (local_4)
        {
            return;
        }
        TRawPtr<FTestASMultiThreadingStorage> local_2_2 = this.GetTestStorage();
        FECSEntityId local_5;
        if (!((local_5 == ENTITY_ID_NULL)) && !((local_5 == Entity.GetId())))
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            Modify local_16;
            local_16.opCall().TestData0 = (local_16.opCall().TestData0 + 1);
        }
        ModifyOrAdd local_22;
        local_22.opCall().TestData0 = (local_22.opCall().TestData0 + 1);
        FECSWorldPtr local_12_2 = ECS::GetECSWorld();
        ModifyOrAdd local_26;
        local_26.opCall().Frame = (int(local_26.opCall().Frame) + 1);
        FECSWorldPtr local_12_3 = ECS::GetECSWorld();
        Modify local_30;
        local_30.opCall().Frame = (int(local_30.opCall().Frame) + 1);
        SendEvent local_34;
        local_34.opCall(FFPTime(-1));
        Entity.DestroyDeferred();
        XLog(ELog(0), FString().Append("TestASMultiThreading AccessErrorReport: check points executed Time=").Append(FFPTime(ECS::GetRuntimeInfo().Time)).Append(" Entity=").Append(Entity.GetIdValue()).Append(" Data=").Append(TestComp.TestData0));
        return;
    }
    UFUNCTION()
    void ClientJob_CleanupParallelContext(const FECSEntity &inout Entity) const
    {
        if (!(ECS::GetRuntimeInfo().IsOnInterval(FFPTime(8.0))))
        {
            return;
        }
        TRawPtr<FTestASMultiThreadingStorage> local_8 = this.GetTestStorage();
        TRawPtr<FTestASMultiThreadingStorage> local_8_2 = this.GetTestStorage();
        Entity.DestroyDeferred();
        return;
    }
    UFUNCTION()
    void Run_ClientJob_PrepareParallelContext() const
    {
        ECS::GetContextJob();
        if (this.bTestASMultiThreading == false)
        {
            return;
        }
        this.ClientJob_PrepareParallelContext();
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestParallelSpecifierSample_SingleThreadForCompare_Before() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_162 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        if (!(this.bTestASMultiThreading) == !(false))
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
                this.ClientJob_TestParallelSpecifierSample_SingleThreadForCompare_Before(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Exclude(local_80).opCall();
        bool local_3 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_90 = 0;
        FECSRuntimeViewIterator local_124 = local_80.Iterator();
        for (; local_124.CanProceed;)
        {
            local_36 = local_124.Proceed();
            ++local_90;
            if (local_3)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_TestParallelSpecifierSample_SingleThreadForCompare_Before(local_162, local_38);
        }
        local_2.UpdateCachedEntityCount(local_90);
        if (local_3)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestParallelSpecifierSample() const
    {
        ECS::GetContextJob();
        if (this.bTestASMultiThreading == false)
        {
            return;
        }
        int local_6 = 0;
        int local_5 = local_6;
        FECSRuntimeView local_46 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_50;
        local_50.opCall();
        Exclude(local_46).opCall();
        FECSWorldPtr local_56 = FECSWorldPtr(this.GetECSWorld());
        __ParallelBatchJob_S_TestASMultiThreadingSystem_68 local_64;
        local_46.Parallel(FECSJob::ParallelViewSubJobName, local_64, 0, 0);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestParallelSpecifierSample_SingleThreadForCompare_After() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_162 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        if (!(this.bTestASMultiThreading) == !(false))
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
                this.ClientJob_TestParallelSpecifierSample_SingleThreadForCompare_After(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Exclude(local_80).opCall();
        bool local_3 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_90 = 0;
        FECSRuntimeViewIterator local_124 = local_80.Iterator();
        for (; local_124.CanProceed;)
        {
            local_36 = local_124.Proceed();
            ++local_90;
            if (local_3)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_TestParallelSpecifierSample_SingleThreadForCompare_After(local_162, local_38);
        }
        local_2.UpdateCachedEntityCount(local_90);
        if (local_3)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestAsyncDispatchFrameEndWait60ms() const
    {
        ECS::GetContextJob();
        if (this.bTestAsyncDispatchWaitFinish == false)
        {
            return;
        }
        this.ClientJob_TestAsyncDispatchFrameEndWait60ms();
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestAsyncDispatchDependencySerialA() const
    {
        int local_8 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (this.bTestAsyncDispatchDependencySerial == false)
        {
            return;
        }
        this.ClientJob_TestAsyncDispatchDependencySerialA(local_8);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestAsyncDispatchDependencySerialB() const
    {
        ECS::GetContextJob();
        if (this.bTestAsyncDispatchDependencySerial == false)
        {
            return;
        }
        this.ClientJob_TestAsyncDispatchDependencySerialB();
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestAsyncDispatchDependencySerialC() const
    {
        int local_8 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (this.bTestAsyncDispatchDependencySerial == false)
        {
            return;
        }
        this.ClientJob_TestAsyncDispatchDependencySerialC(local_8);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestAsyncDispatchDependencySerialD() const
    {
        ECS::GetContextJob();
        if (this.bTestAsyncDispatchDependencySerial == false)
        {
            return;
        }
        this.ClientJob_TestAsyncDispatchDependencySerialD();
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestAsyncDispatchDependencySerialE() const
    {
        ECS::GetContextJob();
        if (this.bTestAsyncDispatchDependencySerial == false)
        {
            return;
        }
        this.ClientJob_TestAsyncDispatchDependencySerialE();
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestAsyncDispatchDependencySerialF() const
    {
        ECS::GetContextJob();
        if (this.bTestAsyncDispatchDependencySerial == false)
        {
            return;
        }
        this.ClientJob_TestAsyncDispatchDependencySerialF();
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestWaitAsyncDispatch() const
    {
        ECS::GetContextJob();
        if (this.bTestAsyncDispatchDependencySerial == false)
        {
            return;
        }
        this.ClientJob_TestWaitAsyncDispatch();
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestParallelSpecifierSample_AccessErrorPath() const
    {
        ECS::GetContextJob();
        if (this.bCheckMultiThreadingAccessErrorReport == false)
        {
            return;
        }
        int local_6 = 0;
        int local_5 = local_6;
        FECSRuntimeView local_46 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_50;
        local_50.opCall();
        Exclude(local_46).opCall();
        FECSWorldPtr local_56 = FECSWorldPtr(this.GetECSWorld());
        __ParallelBatchJob_S_TestASMultiThreadingSystem_205 local_64;
        local_46.Parallel(FECSJob::ParallelViewSubJobName, local_64, 0, 0);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_CleanupParallelContext() const
    {
        const FECSEntity& local_36;
        int local_156 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        if (!(this.bTestASMultiThreading) == !(false))
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
                this.ClientJob_CleanupParallelContext(local_36);
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
            this.ClientJob_CleanupParallelContext(local_156);
        }
        local_2.UpdateCachedEntityCount(local_84);
        if (local_3)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}

struct __ParallelBatchJob_S_TestASMultiThreadingSystem_68
{
    UPROPERTY()
    FECSWorldPtr __JobWorld;
    UPROPERTY()
    EECSRegType __JobRegType;
    UPROPERTY()
    const US_TestASMultiThreadingSystem __JobSystem;

    __ParallelBatchJob_S_TestASMultiThreadingSystem_68()
    {
        this.__JobRegType = EECSRegType(0);
        this.__JobSystem = nullptr;
        return;
    }
    __ParallelBatchJob_S_TestASMultiThreadingSystem_68(const FECSWorldPtr &inout InJobWorld, const EECSRegType InJobRegType, const US_TestASMultiThreadingSystem &in InJobSystem)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    void opCall(const TArray<FECSEntityId> &in EntityIds, const int StartIndex, const int EndIndex)
    {
        int local_12 = 0;
        int local_14 = 0;
        int local_1 = StartIndex;
        for (; local_1 < EndIndex; )
        {
            FECSEntity local_6 = FECSEntity(this, EntityIds[local_1]);
            FECSParallelModifyEntityScope local_7 = ECSInternal::FECSParallelModifyEntityScope(this.__JobRegType, local_6.GetId());
            FECSEntityScopeCycleCounter local_10 = FECSEntityScopeCycleCounter(local_6);
            this.__JobSystem.ClientJob_TestParallelSpecifierSample(local_12, local_14);
            ++local_1;
        }
        return;
    }
}

struct __ParallelBatchJob_S_TestASMultiThreadingSystem_205
{
    UPROPERTY()
    FECSWorldPtr __JobWorld;
    UPROPERTY()
    EECSRegType __JobRegType;
    UPROPERTY()
    const US_TestASMultiThreadingSystem __JobSystem;

    __ParallelBatchJob_S_TestASMultiThreadingSystem_205()
    {
        this.__JobRegType = EECSRegType(0);
        this.__JobSystem = nullptr;
        return;
    }
    __ParallelBatchJob_S_TestASMultiThreadingSystem_205(const FECSWorldPtr &inout InJobWorld, const EECSRegType InJobRegType, const US_TestASMultiThreadingSystem &in InJobSystem)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    void opCall(const TArray<FECSEntityId> &in EntityIds, const int StartIndex, const int EndIndex)
    {
        int local_12 = 0;
        int local_14 = 0;
        int local_1 = StartIndex;
        for (; local_1 < EndIndex; )
        {
            FECSEntity local_6 = FECSEntity(this, EntityIds[local_1]);
            FECSParallelModifyEntityScope local_7 = ECSInternal::FECSParallelModifyEntityScope(this.__JobRegType, local_6.GetId());
            FECSEntityScopeCycleCounter local_10 = FECSEntityScopeCycleCounter(local_6);
            this.__JobSystem.ClientJob_TestParallelSpecifierSample_AccessErrorPath(local_12, local_14);
            ++local_1;
        }
        return;
    }
}


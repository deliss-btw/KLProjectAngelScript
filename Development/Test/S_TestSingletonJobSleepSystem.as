
const FConsoleVariable CVar_Test_SingletonJobAssign = FConsoleVariable();
const FConsoleVariable CVar_Test_SingletonJobModify = FConsoleVariable();
const FConsoleVariable CVar_Test_SingletonJobRemove = FConsoleVariable();

class US_SingletonJobTestSystem : UECSScriptSystem
{
    bool bStep1 = false;
    bool bStep2 = false;
    bool bStep3 = false;


    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return true;
    }
    UFUNCTION()
    void Job_TestCommonComponentRelevance(const FECSEntity &inout PointBundleEntity) const
    {
        XLog(ELog(50), "TestCommonComponentRelevance");
        return;
    }
    UFUNCTION()
    void Job_Step1_AssignSingleton() const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        FCS_TestSingletonSleep local_10;
        local_10.Value = 0;
        XLog(ELog(50), "Step1: Assign Singleton");
        return;
    }
    UFUNCTION()
    void Job_Step2_ModifySingletonAgain(FCS_TestSingletonSleep &inout TestSingletonSleep) const
    {
        if (TestSingletonSleep)
        {
            ++TestSingletonSleep.Value;
            XLog(ELog(50), FString().Append("Step2:Singleton Job Executed! Value=").Append(TestSingletonSleep.Value));
        }
        return;
    }
    UFUNCTION()
    void Job_Step3_RemoveSingleton(FCS_TestSingletonSleep &inout TestSingletonSleep) const
    {
        if (TestSingletonSleep)
        {
            FECSWorldPtr local_4 = this.GetECSWorld();
            Remove local_8;
            local_8.opCall();
            XLog(ELog(50), "Step3: Remove Singleton");
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TestCommonComponentRelevance() const
    {
        const FECSEntity& local_40;
        int local_160 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1))))
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
                this.Job_TestCommonComponentRelevance(local_40);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_78 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_82;
        local_82.opCall();
        Exclude(local_78).opCall();
        bool local_8 = local_4.BeginViewCacheBuild();
        int local_7 = local_4.GetViewCacheEpoch();
        int local_88 = 0;
        FECSRuntimeViewIterator local_122 = local_78.Iterator();
        for (; local_122.CanProceed;)
        {
            local_40 = local_122.Proceed();
            ++local_88;
            if (local_8)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_TestCommonComponentRelevance(local_160);
        }
        local_4.UpdateCachedEntityCount(local_88);
        if (local_8)
        {
            local_4.CommitViewCacheBuild(local_7);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_Step1_AssignSingleton() const
    {
        ECS::GetContextJob();
        if (CVar_Test_SingletonJobAssign.GetBool() == false)
        {
            return;
        }
        this.Job_Step1_AssignSingleton();
        return;
    }
    UFUNCTION()
    void Run_Job_Step2_ModifySingletonAgain() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        if (CVar_Test_SingletonJobModify.GetBool() == false)
        {
            return;
        }
        FECSWorldPtr local_6 = this.GetECSWorld();
        Has local_10;
        if (!(local_10.opCall()))
        {
            return;
        }
        FECSWorldPtr local_6_2 = this.GetECSWorld();
        this.Job_Step2_ModifySingletonAgain(local_12);
        FECSWorldPtr local_6_3 = this.GetECSWorld();
        MarkModifiedIfDirty local_20;
        local_20.opCall(local_12);
        return;
    }
    UFUNCTION()
    void Run_Job_Step3_RemoveSingleton() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        if (CVar_Test_SingletonJobRemove.GetBool() == false)
        {
            return;
        }
        FECSWorldPtr local_6 = this.GetECSWorld();
        Has local_10;
        if (!(local_10.opCall()))
        {
            return;
        }
        FECSWorldPtr local_6_2 = this.GetECSWorld();
        this.Job_Step3_RemoveSingleton(local_12);
        FECSWorldPtr local_6_3 = this.GetECSWorld();
        MarkModifiedIfDirty local_20;
        local_20.opCall(local_12);
        return;
    }
}


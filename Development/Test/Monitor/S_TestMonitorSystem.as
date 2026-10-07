

class US_TestMonitorSystem : UECSScriptSystem
{
    US_TestMonitorSystem()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return true;
    }
    UFUNCTION()
    void Server_AssignSingletons() const
    {
        FCS_TestMonitor2NotSync local_8;
        FECSWorldPtr local_2 = this.GetECSWorld();
        Assign local_6;
        local_6.opCall(local_8);
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        FCS_TestMonitor1Tag local_14;
        Assign local_12;
        local_12.opCall(local_14);
        FECSWorldPtr local_2_3 = this.GetECSWorld();
        FCS_TestMonitor0 local_20;
        Assign local_18;
        local_18.opCall(local_20);
        return;
    }
    UFUNCTION()
    void Server_ModifySingletons(FCS_TestMonitor0 &inout Test0, const FCS_FixedTime &inout FixedTime) const
    {
        int local_3 = 0;
        if (FixedTime.IsOnInterval(FFPTime(5)))
        {
            ELog local_12;
            (FString("TestMonitorSystem ModifySingleton Test0 Modify") + int(local_12));
            local_3 = local_3 + 1;
            Test0.SetValue(local_3);
        }
        return;
    }
    UFUNCTION()
    void Client_AssignSingletons() const
    {
        FCS_TestMonitor2NotSync local_8;
        FECSWorldPtr local_2 = this.GetECSWorld();
        Assign local_6;
        local_6.opCall(local_8);
        return;
    }
    UFUNCTION()
    void Monitor_ClientTestMonitor0Assign(const FCS_TestMonitor0 &inout Test0) const
    {
        XLog(ELog(0), "TestMonitorSystem TestMonitor0 Assign");
        return;
    }
    UFUNCTION()
    void Monitor_ClientTestMonitor0Modify(const FCS_TestMonitor0 &inout Test0) const
    {
        ELog local_10;
        (FString("TestMonitorSystem TestMonitor0 Modify") + int(local_10));
        return;
    }
    UFUNCTION()
    void Monitor_TestMonitor2NotSyncAssign(const FCS_TestMonitor2NotSync &inout Test0) const
    {
        ELog local_8;
        (FString("TestMonitorSystem TestMonitor2NotSync ") + local_8);
        return;
    }
    UFUNCTION()
    void Monitor_ServerTestMonitor2NotSyncAssign(const FCS_TestMonitor2NotSync &inout Test0) const
    {
        ELog local_8;
        (FString("TestMonitorSystem TestMonitor2NotSync ") + local_8);
        return;
    }
    UFUNCTION()
    void Run_Server_AssignSingletons() const
    {
        ECS::GetContextJob();
        this.Server_AssignSingletons();
        return;
    }
    UFUNCTION()
    void Run_Server_ModifySingletons() const
    {
        int local_14 = 0;
        int local_20 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        FECSWorldPtr local_6 = this.GetECSWorld();
        Has local_10;
        if (!(local_10.opCall()))
        {
            return;
        }
        FECSWorldPtr local_6_2 = this.GetECSWorld();
        this.Server_ModifySingletons(local_14, local_20);
        FECSWorldPtr local_6_3 = this.GetECSWorld();
        MarkModifiedIfDirty local_24;
        local_24.opCall(local_14);
        return;
    }
    UFUNCTION()
    void Run_Client_AssignSingletons() const
    {
        ECS::GetContextJob();
        this.Client_AssignSingletons();
        return;
    }
    UFUNCTION()
    void Run_Monitor_ClientTestMonitor0Assign() const
    {
        int local_24 = 0;
        ECS::GetContextJob();
        if (ECSInternal::GetMonitorSingletonOnAssign(this.GetECSWorld(), FCS_TestMonitor0, EECSRegType(0), false, true).bIsMonitored)
        {
            this.Monitor_ClientTestMonitor0Assign(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ClientTestMonitor0Modify() const
    {
        int local_24 = 0;
        ECS::GetContextJob();
        if (ECSInternal::GetMonitorSingletonOnModify(this.GetECSWorld(), FCS_TestMonitor0, EECSRegType(0), false, true).bIsMonitored)
        {
            this.Monitor_ClientTestMonitor0Modify(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_TestMonitor2NotSyncAssign() const
    {
        int local_24 = 0;
        ECS::GetContextJob();
        if (ECSInternal::GetMonitorSingletonOnAssign(this.GetECSWorld(), FCS_TestMonitor2NotSync, EECSRegType(0), false, true).bIsMonitored)
        {
            this.Monitor_TestMonitor2NotSyncAssign(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ServerTestMonitor2NotSyncAssign() const
    {
        int local_24 = 0;
        ECS::GetContextJob();
        if (ECSInternal::GetMonitorSingletonOnAssign(this.GetECSWorld(), FCS_TestMonitor2NotSync, EECSRegType(0), true, true).bIsMonitored)
        {
            this.Monitor_ServerTestMonitor2NotSyncAssign(local_24);
        }
        return;
    }
}


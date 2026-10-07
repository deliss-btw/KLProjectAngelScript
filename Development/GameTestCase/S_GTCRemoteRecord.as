

class US_GTCRemoteRecord : UECSScriptSystem
{
    US_GTCRemoteRecord()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_DetectRemoteSession(const FECSEntity &inout Entity, const FC_GTCRemoteSession &inout Session) const
    {
        if (!(UKLGTCTestCaseLoader::IsRemoteRecordingAvailable()))
        {
            return;
        }
        if (Session.SessionID.IsEmpty() || Session.TCPHost.IsEmpty() || (int(Session.TCPPort) <= 0))
        {
            return;
        }
        FString local_8;
        Has local_12;
        bool local_2 = local_12.opCall();
        if (local_2)
        {
            Get local_20;
            FECSEntity local_16 = local_20.opCall().GetPlayerPawnEntity();
            if (local_16.IsValid())
            {
                local_8 = local_16.GetEntityName().ToString();
            }
        }
        bool local_2_2 = UKLGTCTestCaseLoader::ConnectDSToRemoteSession(Session.SessionID, Session.TCPHost, int(Session.TCPPort), Session.APIKey, local_8);
        if (local_2_2)
        {
            FC_GTCRemoteSessionDSConnectedTag local_34;
            Assign local_32;
            local_32.opCall(local_34);
            Print((FString("[GTC Remote DS] Connected to session: ") + Session.SessionID), 5.0f, FLinearColor::LucBlue);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_DetectRemoteSessionRemoved(const FECSEntity &inout Entity) const
    {
        UKLGTCTestCaseLoader::DisconnectAllDSSessions();
        Remove local_4;
        local_4.opCall();
        Print("[GTC Remote DS] Session ended, disconnected", 5.0f, FLinearColor::LucBlue);
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DetectRemoteSession() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
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
                this.ServerJob_DetectRemoteSession(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        local_84.opCall();
        Exclude(local_80).opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_80.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ServerJob_DetectRemoteSession(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DetectRemoteSessionRemoved() const
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
                this.ServerJob_DetectRemoteSessionRemoved(local_36);
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
            this.ServerJob_DetectRemoteSessionRemoved(local_160);
        }
        local_2.UpdateCachedEntityCount(local_88);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}


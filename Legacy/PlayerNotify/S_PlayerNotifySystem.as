

class US_PlayerNotifySystem : UECSScriptSystem
{
    US_PlayerNotifySystem()
    {
        return;
    }
    UFUNCTION()
    void Monitor_HandlePlayerNotify(const FECSEntity &inout Player, const FC_PlayerNotify &inout C_PlayerNotify) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    UFUNCTION()
    void Monitor_SyncNotifyToAllPlayers(const FCS_PlayerNotifyRegistry &inout Registry) const
    {
        this.Run_Job_SyncNotifyToPlayer();
        return;
    }
    UFUNCTION()
    void Job_SyncNotifyToPlayer(const FECSEntity &inout Player, const FC_PlayerController &inout C_PlayerController, const FCS_PlayerNotifyRegistry &inout Registry) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    UFUNCTION()
    void ServerJob_OnPlayerConnected(const FECSEntity &inout Player, const FCS_PlayerNotifyRegistry &inout Registry) const
    {
        0.SetPlayerNotifies(Registry.PlayerNotifies);
        return;
    }
    UFUNCTION()
    void ServerJob_HandlePlayerResponse(const FCE_PlayerNotifyClientResponse &inout Event, FCS_PlayerNotifyRegistry &inout Registry) const
    {
        FBitSet32 local_3 = (Event.Response & Registry.PlayerNotifies);
        Modify local_8;
        FC_PlayerNotify& local_10 = local_8.opCall();
        if (local_10)
        {
            local_10.SetPlayerResponce((local_10.GetPlayerResponce() | local_3));
        }
        return;
    }
    UFUNCTION()
    void ClientJob_SendResponseToServer(const FECSEntity &inout Player, const FC_PlayerNotifyPendingResponse &inout C_PlayerNotifyPendingResponse) const
    {
        FFPTime local_6 = FFPTime(-1);
        SendEvent local_4;
        FCE_PlayerNotifyClientResponse& local_10 = local_4.opCall(local_6);
        if (local_10)
        {
            local_10.Response = C_PlayerNotifyPendingResponse.Responce;
        }
        Remove local_16;
        local_16.opCall();
        return;
    }
    UFUNCTION()
    void Run_Monitor_HandlePlayerNotify() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorPlayerNotifyOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_HandlePlayerNotify(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorPlayerNotifyOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_HandlePlayerNotify(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_SyncNotifyToAllPlayers() const
    {
        int local_24 = 0;
        ECS::GetContextJob();
        if (ECSInternal::GetMonitorSingletonOnAssign(this.GetECSWorld(), FCS_PlayerNotifyRegistry, EECSRegType(0), true, true).bIsMonitored)
        {
            this.Monitor_SyncNotifyToAllPlayers(local_24);
        }
        if (ECSInternal::GetMonitorSingletonOnModify(this.GetECSWorld(), FCS_PlayerNotifyRegistry, EECSRegType(0), true, true).bIsMonitored)
        {
            this.Monitor_SyncNotifyToAllPlayers(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_SyncNotifyToPlayer() const
    {
        int local_16 = 0;
        int local_142 = 0;
        int local_144 = 0;
        FECSManualJobStatScope local_1 = FECSManualJobStatScope(FName("[AS][ManualJob]S_PlayerNotifySystem::Job_SyncNotifyToPlayer"));
        ECS::GetContextJob();
        FECSWorldPtr local_8 = this.GetECSWorld();
        Has local_12;
        if (!(local_12.opCall()))
        {
            return;
        }
        FECSWorldPtr local_8_2 = this.GetECSWorld();
        int local_22 = 0;
        int local_21 = local_22;
        FECSRuntimeView local_60 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_64;
        local_64.opCall();
        Exclude(local_60).opCall();
        FECSRuntimeViewIterator local_102 = local_60.Iterator();
        for (; local_102.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_139 = FECSEntityScopeCycleCounter(local_102.Proceed());
            this.Job_SyncNotifyToPlayer(local_142, local_144, local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_OnPlayerConnected() const
    {
        int local_12 = 0;
        const FECSEntity& local_46;
        int local_170 = 0;
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
                this.ServerJob_OnPlayerConnected(local_46, local_12);
            }
            local_2.UpdateCachedEntityCount(local_23);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Exclude(local_84).opCall();
        Exclude(local_84).opCall();
        bool local_9 = local_2.BeginViewCacheBuild();
        int local_24 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_46 = local_132.Proceed();
            ++local_98;
            if (local_9)
            {
                local_2.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.ServerJob_OnPlayerConnected(local_170, local_12);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_9)
        {
            local_2.CommitViewCacheBuild(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandlePlayerResponse() const
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
        TECSEventConstIterator<FCE_PlayerNotifyClientResponse> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_PlayerNotifyClientResponse& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ServerJob_HandlePlayerResponse(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        FECSWorldPtr local_4_3 = this.GetECSWorld();
        MarkModifiedIfDirty local_78;
        local_78.opCall(local_12);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_SendResponseToServer() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_162 = 0;
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
                this.ClientJob_SendResponseToServer(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_90 = 0;
        FECSRuntimeViewIterator local_124 = local_80.Iterator();
        for (; local_124.CanProceed;)
        {
            local_36 = local_124.Proceed();
            ++local_90;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_SendResponseToServer(local_162, local_38);
        }
        local_2.UpdateCachedEntityCount(local_90);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}


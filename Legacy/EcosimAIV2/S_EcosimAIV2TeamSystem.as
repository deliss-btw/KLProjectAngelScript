

class US_EcosimAIV2TeamSystem : UECSScriptSystem
{
    US_EcosimAIV2TeamSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_HandleTeamMemberDeath(const FCE_DeathEvent &inout Event) const
    {
        FECSEntity local_4 = FECSEntity(Event.Sender);
        Get local_8;
        const FC_EcosimAIV2TeamMember& local_10 = local_8.opCall();
        if (local_10)
        {
            if (!(FECSEntity(local_10.TeamEntity).IsValid()))
            {
                return;
            }
            Modify local_20;
            FC_EcosimAIV2Team& local_22 = local_20.opCall();
            if (local_22)
            {
                local_22.QuitMove(local_4);
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnTeamMemberRemoved(const FECSEntity &inout Entity, const FC_EcosimAIV2TeamMember &inout TeamMember) const
    {
        if (!(FECSEntity(TeamMember.TeamEntity).IsValid()))
        {
            return;
        }
        Modify local_10;
        FC_EcosimAIV2Team& local_12 = local_10.opCall();
        if (local_12)
        {
            FTargetEntity local_14 = FTargetEntity(Entity);
            if ((local_12.LeaderEntity == Entity))
            {
                local_12.LeaderEntity = ENTITY_NULL;
            }
        }
        return;
    }
    UFUNCTION()
    void Job_TickResolveTeamLeader(const FECSEntity &inout TeamEntity, FC_EcosimAIV2Team &inout Team) const
    {
        Team.ResolveLeader();
        return;
    }
    UFUNCTION()
    void Run_Job_HandleTeamMemberDeath() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DeathEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DeathEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleTeamMemberDeath(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnTeamMemberRemoved() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorEcosimAIV2TeamMemberOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnTeamMemberRemoved(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickResolveTeamLeader() const
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
                this.Job_TickResolveTeamLeader(local_36, local_38);
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
            this.Job_TickResolveTeamLeader(local_166, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}


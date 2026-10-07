

class US_PVXPhaseSystem : UECSScriptSystem
{
    US_PVXPhaseSystem()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_ProcessPendingPhase(const FCS_PVXPhaseState &inout PhaseState) const
    {
        if (PhaseState.GetbInitialized() && PhaseState.GetPendingObjective().IsSet())
        {
            ::PVXPhaseTracking::ProcessPending();
        }
        return;
    }
    UFUNCTION()
    void ServerJob_SyncPhaseProgress(const FCE_ObjectiveProgressUpdated &inout Event, const FCS_PVXPhaseState &inout PhaseState) const
    {
        this.SyncSingleObjectiveProgress(Event, PhaseState);
        this.SyncDualFactionProgress(Event, PhaseState);
        return;
    }
    void SyncSingleObjectiveProgress(const FCE_ObjectiveProgressUpdated &inout Event, const FCS_PVXPhaseState &inout PhaseState) const
    {
        int local_12 = 0;
        int local_14 = 0;
        int local_1 = PhaseState.GetActiveObjectiveInstanceId();
        if (local_1 == 0)
        {
            return;
        }
        if (PhaseState.GetbMonitoringHP())
        {
            return;
        }
        FECSWorldPtr local_6 = ECS::GetECSWorld();
        if (!(local_12) || !(local_12.CommissionTargetObjective.IsSet()))
        {
            return;
        }
        int local_15 = local_14;
        if (local_15 == 0)
        {
            if (PhaseState.GetActiveObjectiveInstanceId() == int(Event.ObjectiveInstanceId))
            {
                if (Event.bIsFinishProgress)
                {
                    local_12.Progress.SetSuccessProgressValue(int(Event.NewProgressValue));
                }
                else
                {
                    local_12.Progress.SetFailedProgressValue(int(Event.NewProgressValue));
                }
            }
            return;
        }
        this.SyncGroupChildProgress(Event, PhaseState.GetActiveObjectiveInstanceId(), local_12.ChildProgress);
        return;
    }
    void SyncDualFactionProgress(const FCE_ObjectiveProgressUpdated &inout Event, const FCS_PVXPhaseState &inout PhaseState) const
    {
        bool local_3;
        int local_9 = 0;
        int local_166 = 0;
        int local_1 = PhaseState.GetPlayerObjectiveInstanceId();
        if (local_1 != 0)
        {
            local_3 = false;
        }
        else
        {
            int local_1_2 = PhaseState.GetBossObjectiveInstanceId();
            local_3 = (local_1_2 == 0);
        }
        if (local_3)
        {
            return;
        }
        local_3 = (PhaseState.GetPlayerObjectiveInstanceId() > 0) && PhaseState.GetPlayerObjective().IsSet();
        bool local_5 = (PhaseState.GetBossObjectiveInstanceId() > 0) && PhaseState.GetBossObjective().IsSet();
        bool local_7 = false;
        bool local_8 = false;
        if (local_3)
        {
            FObjectiveInstance local_158;
            int local_10 = local_9;
            if (local_10 == 0)
            {
                local_7 = (PhaseState.GetPlayerObjectiveInstanceId() == int(Event.ObjectiveInstanceId));
            }
            else
            {
                local_7 = ::ObjectiveUtils::TryFindActivetedObjectiveInstance(PhaseState.GetPlayerObjectiveInstanceId(), local_158) && ::ObjectiveUtils::GroupContainsChildInstance(local_158, int(Event.ObjectiveInstanceId));
            }
        }
        if (local_5)
        {
            FObjectiveInstance local_158;
            int local_10_2 = local_9;
            if (local_10_2 == 0)
            {
                local_8 = (PhaseState.GetBossObjectiveInstanceId() == int(Event.ObjectiveInstanceId));
            }
            else
            {
                local_8 = ::ObjectiveUtils::TryFindActivetedObjectiveInstance(PhaseState.GetBossObjectiveInstanceId(), local_158) && ::ObjectiveUtils::GroupContainsChildInstance(local_158, int(Event.ObjectiveInstanceId));
            }
        }
        if (!(local_7) && !(local_8))
        {
            return;
        }
        FECSWorldPtr local_160 = ECS::GetECSWorld();
        if (!(local_166))
        {
            return;
        }
        if (local_7)
        {
            int local_11 = local_9;
            if (local_11 == 0)
            {
                FCommissionTargetProgress local_168;
                FCommissionTargetProgress local_170;
                local_170 = local_166.GetPlayerProgress();
                local_168 = local_170;
                if (Event.bIsFinishProgress)
                {
                    local_168.SetSuccessProgressValue(int(Event.NewProgressValue));
                }
                else
                {
                    local_168.SetFailedProgressValue(int(Event.NewProgressValue));
                }
                local_166.SetPlayerProgress(local_168);
            }
            else
            {
                TMap<uint, FCommissionTargetProgress> local_190 = local_166.GetPlayerChildProgress();
                this.SyncGroupChildProgress(Event, local_166.GetPlayerObjectiveInstanceId(), local_190);
                local_166.SetPlayerChildProgress(local_190);
            }
        }
        if (local_8)
        {
            int local_10_3 = local_9;
            if (local_10_3 == 0)
            {
                FCommissionTargetProgress local_168;
                FCommissionTargetProgress local_170;
                local_168 = local_166.GetBossProgress();
                if (Event.bIsFinishProgress)
                {
                    local_168.SetSuccessProgressValue(int(Event.NewProgressValue));
                }
                else
                {
                    local_168.SetFailedProgressValue(int(Event.NewProgressValue));
                }
                local_166.SetBossProgress(local_168);
                return;
            }
            TMap<uint, FCommissionTargetProgress> local_190 = local_166.GetBossChildProgress();
            this.SyncGroupChildProgress(Event, local_166.GetBossObjectiveInstanceId(), local_190);
            local_166.SetBossChildProgress(local_190);
        }
        return;
    }
    void SyncGroupChildProgress(const FCE_ObjectiveProgressUpdated &inout Event, const uint ParentInstanceId, TMap<uint, FCommissionTargetProgress> &inout ChildProgressMap) const
    {
        FObjectiveInstance local_146;
        int local_167 = 0;
        FObjectiveInstance local_314;
        if (!(::ObjectiveUtils::TryFindActivetedObjectiveInstance(ParentInstanceId, local_146)))
        {
            return;
        }
        int local_148 = int(Event.ObjectiveInstanceId);
        if (!(::ObjectiveUtils::GroupContainsChildInstance(local_146, local_148)))
        {
            return;
        }
        for (auto& local_166 : local_146.ChildObjectiveMap)
        {
            local_166;
            if (local_148 == 0)
            {
                continue;
            }
            if (::ObjectiveUtils::TryFindActivetedObjectiveInstance(local_167, local_314))
            {
                FCommissionTargetProgress local_316;
                local_316.SetSuccessProgressValue(local_314.GetFinishProgressValue());
                local_316.SetFailedProgressValue(local_314.GetFailProgressValue());
                if (ChildProgressMap.Contains(local_314.ObjectiveId))
                {
                    ChildProgressMap[local_314.ObjectiveId] = local_316;
                }
                else
                {
                    ChildProgressMap.Add(local_314.ObjectiveId, local_316);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_CaptureMonsterEntity(const FCE_DamageEvent &inout Event, const FCS_PVXPhaseState &inout PhaseState) const
    {
        int local_12 = 0;
        if (!(PhaseState.GetbMonitoringHP()))
        {
            return;
        }
        if (PhaseState.GetMonitoredMonsterEntity().IsValid())
        {
            return;
        }
        FECSEntity local_6 = Event.Receiver;
        if (!(local_6.IsValid()))
        {
            return;
        }
        if (!(local_12))
        {
            return;
        }
        TDataObjectPtr<FMonsterMainConfig> local_36;
        local_36 = local_12.GetMonsterConfig();
        FDataObjectPtr local_84;
        local_84;
        if ((local_36 == local_84))
        {
            FECSWorldPtr local_86 = ECS::GetECSWorld();
            Modify local_90;
            FCS_PVXPhaseState& local_92 = local_90.opCall();
            if (local_92)
            {
                local_92.SetMonitoredMonsterEntity(local_6);
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_TickMonsterHP(const FCS_PVXPhaseState &inout PhaseState, const FCS_FixedTime &inout FixedTime) const
    {
        int local_12 = 0;
        int local_30 = 0;
        if (!(PhaseState.GetbMonitoringHP()))
        {
            return;
        }
        if (!(FECSEntity(PhaseState.GetMonitoredMonsterEntity()).IsValid()))
        {
            return;
        }
        if (!(local_12))
        {
            return;
        }
        float32 local_14 = local_12.GetAttributeValue(Attribute::HP, FixedTime.Time);
        float32 local_13 = local_12.GetAttributeValue(Attribute::HPMax, FixedTime.Time);
        if (local_13 > 0.0f)
        {
            int local_21;
            local_21 = FMath::Clamp(FMath::RoundToInt(((local_14 * 100.0f) / local_13)), 0, 100);
        }
        else
        {
            int local_21;
            local_21 = 0;
        }
        FECSWorldPtr local_24 = ECS::GetECSWorld();
        if (local_30)
        {
            int local_21;
            local_30.SetHPPercent(local_21);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_ProcessPendingPhase() const
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
        this.ServerJob_ProcessPendingPhase(local_12);
        return;
    }
    UFUNCTION()
    void Run_ServerJob_SyncPhaseProgress() const
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
        TECSEventConstIterator<FCE_ObjectiveProgressUpdated> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_ObjectiveProgressUpdated& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ServerJob_SyncPhaseProgress(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_CaptureMonsterEntity() const
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
        TECSEventConstIterator<FCE_DamageEvent> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_DamageEvent& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ServerJob_CaptureMonsterEntity(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TickMonsterHP() const
    {
        int local_18 = 0;
        int local_24 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(0.2))))
        {
            return;
        }
        FECSWorldPtr local_12 = this.GetECSWorld();
        Has local_16;
        if (!(local_16.opCall()))
        {
            return;
        }
        FECSWorldPtr local_12_2 = this.GetECSWorld();
        this.ServerJob_TickMonsterHP(local_18, local_24);
        return;
    }
}


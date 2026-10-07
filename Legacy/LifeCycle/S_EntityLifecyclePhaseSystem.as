

class US_EntityLifecyclePhaseSystem : UECSScriptSystem
{
    US_EntityLifecyclePhaseSystem()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    UFUNCTION()
    void Monitor_OnBeginPlayAssigned(const FECSEntity &inout Entity, const FC_BeginPlayTag &inout BeginPlay) const
    {
        this.ApplyPhaseRespectingPriority(Entity, EEntityLifecycleUnifiedPhaseType(4));
        return;
    }
    UFUNCTION()
    void Monitor_OnNearDeathAssigned(const FECSEntity &inout Entity, const FC_NearDeathTag &inout NearDeath) const
    {
        this.ApplyPhaseRespectingPriority(Entity, EEntityLifecycleUnifiedPhaseType(6));
        return;
    }
    UFUNCTION()
    void Monitor_OnInactiveAssigned(const FECSEntity &inout Entity, const FC_InactiveTag &inout Inactive) const
    {
        this.ApplyPhaseRespectingPriority(Entity, EEntityLifecycleUnifiedPhaseType(6));
        return;
    }
    UFUNCTION()
    void Monitor_OnDeathAssigned(const FECSEntity &inout Entity, const FC_DeathTag &inout Death) const
    {
        this.ApplyPhaseRespectingPriority(Entity, EEntityLifecycleUnifiedPhaseType(7));
        return;
    }
    UFUNCTION()
    void Monitor_OnPendingDestroyAssigned(const FECSEntity &inout Entity, const FC_PendingDestroyTag &inout PendingDestroy) const
    {
        this.ApplyPhaseRespectingPriority(Entity, EEntityLifecycleUnifiedPhaseType(8));
        return;
    }
    UFUNCTION()
    void Monitor_OnNewlyPendingDestroyAssigned(const FECSEntity &inout Entity, const FC_NewlyPendingDestroyTag &inout NewlyPendingDestroy) const
    {
        this.ApplyPhaseRespectingPriority(Entity, EEntityLifecycleUnifiedPhaseType(8));
        return;
    }
    UFUNCTION()
    void Monitor_OnReadyToDestroyAssigned(const FECSEntity &inout Entity, const FC_ReadyToDestroyTag &inout ReadyToDestroy) const
    {
        this.ApplyPhaseRespectingPriority(Entity, EEntityLifecycleUnifiedPhaseType(8));
        return;
    }
    UFUNCTION()
    void Monitor_OnNeedCheckDestroyAssigned(const FECSEntity &inout Entity, const FC_NeedCheckDestroyTag &inout NeedCheckDestroy) const
    {
        this.ApplyPhaseRespectingPriority(Entity, EEntityLifecycleUnifiedPhaseType(8));
        return;
    }
    UFUNCTION()
    void Monitor_OnBeginDestroyAssigned(const FECSEntity &inout Entity, const FC_BeginDestroyTag &inout BeginDestroy) const
    {
        this.ApplyPhaseRespectingPriority(Entity, EEntityLifecycleUnifiedPhaseType(9));
        return;
    }
    UFUNCTION()
    void Monitor_OnEndPlayAssigned(const FECSEntity &inout Entity, const FC_EndPlayTag &inout EndPlay) const
    {
        this.ApplyPhaseRespectingPriority(Entity, EEntityLifecycleUnifiedPhaseType(9));
        return;
    }
    UFUNCTION()
    void Job_PhaseDefaultProgression(const FECSEntity &inout Entity, FC_EntityLifecyclePhase &inout Phase) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void ApplyPhaseRespectingPriority(const FECSEntity &inout Entity, const EEntityLifecycleUnifiedPhaseType NewPhase) const
    {
        bool local_1;
        int local_50 = 0;
        if (!(Entity.IsValid()))
        {
            return;
        }
        if (!(this.IsValidEntityType(Entity)))
        {
            return;
        }
        if (int(NewPhase) != 9)
        {
            Has local_8;
            local_1 = local_8.opCall();
            if (local_1)
            {
                local_1 = true;
            }
            else
            {
                Has local_12;
                local_1 = local_12.opCall();
            }
            if (local_1)
            {
                return;
            }
        }
        if (int(NewPhase) != 9 && (int(NewPhase) != 8))
        {
            bool local_13;
            Has local_18;
            local_13 = local_18.opCall();
            if (local_13)
            {
                local_13 = true;
            }
            else
            {
                Has local_22;
                local_13 = local_22.opCall();
            }
            if (local_13)
            {
                local_13 = true;
            }
            else
            {
                Has local_26;
                local_13 = local_26.opCall();
            }
            if (local_13)
            {
                local_13 = true;
            }
            else
            {
                Has local_30;
                local_13 = local_30.opCall();
            }
            if (local_13)
            {
                return;
            }
        }
        if (int(NewPhase) != 9 && (int(NewPhase) != 8) && (int(NewPhase) != 7))
        {
            Has local_34;
            local_1 = local_34.opCall();
            if (local_1)
            {
                return;
            }
        }
        if (int(NewPhase) == 4)
        {
            bool local_13;
            Has local_38;
            local_13 = local_38.opCall();
            if (local_13)
            {
                local_13 = true;
            }
            else
            {
                Has local_42;
                local_13 = local_42.opCall();
            }
            if (local_13)
            {
                return;
            }
        }
        this.WritePhase(Entity, local_50, EEntityLifecycleUnifiedPhaseType(NewPhase));
        return;
    }
    void WritePhase(const FECSEntity &inout Entity, FC_EntityLifecyclePhase &inout Phase, const EEntityLifecycleUnifiedPhaseType NewPhase) const
    {
        int local_5;
        if ((int(Phase.GetCurrentPhase())) == (int(NewPhase)))
        {
            return;
        }
        local_5 = Phase.GetCurrentPhase();
        Phase.SetLasetPhase(EEntityLifecycleUnifiedPhaseType(local_5));
        Phase.SetCurrentPhase(EEntityLifecycleUnifiedPhaseType(NewPhase));
        this.SendPhaseEvent(Entity, EEntityLifecycleUnifiedPhaseType(local_5), EEntityLifecycleUnifiedPhaseType(NewPhase));
        return;
    }
    void SendPhaseEvent(const FECSEntity &inout Entity, const EEntityLifecycleUnifiedPhaseType OldPhase, const EEntityLifecycleUnifiedPhaseType NewPhase) const
    {
        int local_14 = 0;
        int local_22 = 0;
        int local_28 = 0;
        if (int(NewPhase) == 4)
        {
            ECS::GetContextTime();
            FECSWorldPtr local_6 = this.GetECSWorld();
            local_14.EntityId = FECSEntityId(Entity.GetIdValue());
        }
        else
        {
            if (int(NewPhase) == 7)
            {
                ECS::GetContextTime();
                FECSWorldPtr local_6_2 = this.GetECSWorld();
                local_22.EntityId = FECSEntityId(Entity.GetIdValue());
            }
            else
            {
                if (int(NewPhase) == 8)
                {
                    ECS::GetContextTime();
                    FECSWorldPtr local_6_3 = this.GetECSWorld();
                    local_28.EntityId = FECSEntityId(Entity.GetIdValue());
                }
            }
        }
        ECS::GetContextTime();
        FECSWorldPtr local_6_4 = this.GetECSWorld();
        FCE_EntityLifecyclePhaseChanged local_34;
        local_34.AffectedEntityId = FECSEntityId(Entity.GetIdValue());
        local_34.PreviousPhase = OldPhase;
        local_34.NewPhase = NewPhase;
        return;
    }
    bool IsValidEntityType(const FECSEntity &inout Entity) const
    {
        Has local_4;
        int local_12 = 0;
        if (!(local_4.opCall()))
        {
            return false;
        }
        int local_15 = local_12.GetEntityType();
        return (local_15 == 3 || (local_15 == 6) || (local_15 == 10));
    }
    UFUNCTION()
    void Run_Monitor_OnBeginPlayAssigned() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorBeginPlayTagOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnBeginPlayAssigned(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnNearDeathAssigned() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorNearDeathTagOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnNearDeathAssigned(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnInactiveAssigned() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorInactiveTagOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnInactiveAssigned(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnDeathAssigned() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorDeathTagOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnDeathAssigned(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnPendingDestroyAssigned() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorPendingDestroyTagOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnPendingDestroyAssigned(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnNewlyPendingDestroyAssigned() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorNewlyPendingDestroyTagOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnNewlyPendingDestroyAssigned(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnReadyToDestroyAssigned() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorReadyToDestroyTagOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnReadyToDestroyAssigned(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnNeedCheckDestroyAssigned() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorNeedCheckDestroyTagOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnNeedCheckDestroyAssigned(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnBeginDestroyAssigned() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorBeginDestroyTagOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnBeginDestroyAssigned(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnEndPlayAssigned() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorEndPlayTagOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnEndPlayAssigned(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_PhaseDefaultProgression() const
    {
        int local_164 = 0;
        int local_166 = 0;
        ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        FECSRuntimeView local_44 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_48;
        local_48.opCall();
        local_48.opCall();
        Exclude(local_44).opCall();
        Exclude(local_44).opCall();
        Exclude(local_44).opCall();
        Exclude(local_44).opCall();
        Exclude(local_44).opCall();
        Exclude(local_44).opCall();
        Exclude(local_44).opCall();
        Exclude(local_44).opCall();
        Exclude(local_44).opCall();
        Exclude(local_44).opCall();
        FECSRuntimeViewIterator local_122 = local_44.Iterator();
        for (; local_122.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_161 = FECSEntityScopeCycleCounter(local_122.Proceed());
            this.Job_PhaseDefaultProgression(local_164, local_166);
            MarkModifiedIfDirty local_174;
            local_174.opCall(local_166);
        }
        return;
    }
}




class US_SignificanceSystemAS : UECSScriptSystem
{
    US_SignificanceSystemAS()
    {
        return;
    }
    void UpdateSignificance(const FECSEntity &inout Entity) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argint]
    }
    UFUNCTION()
    void Monitor_ActorActive(const FECSEntity &inout Entity, const FC_Actor &inout Actor) const
    {
        Get local_4;
        const FC_ViewEntityActorData& local_6 = local_4.opCall();
        if (local_6)
        {
            FECSEntity local_12 = FECSEntity(local_6.LogicEntity);
            if (local_12)
            {
                Get local_16;
                const FC_EntityType& local_18 = local_16.opCall();
                if (local_18)
                {
                    int local_21 = local_18.GetEntityType();
                    if ((local_21 == 9 || (local_21 == 1)))
                    {
                        return;
                    }
                }
                this.UpdateSignificance(local_12);
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_ViewEntityFXData(const FECSEntity &inout Entity, const FC_ViewEntityFXData &inout FXData) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argint]
    }
    UFUNCTION()
    void Monitor_ControlledByAIUpdate(const FECSEntity &inout Entity, const FC_ControlledByAI &inout ControlledByAI) const
    {
        this.UpdateSignificance(Entity);
        return;
    }
    UFUNCTION()
    void Monitor_UpdateTeam(const FECSEntity &inout Entity, const FC_PlayerInTeam &inout PlayerInTeam) const
    {
        this.UpdateSignificance(Entity);
        return;
    }
    UFUNCTION()
    void Monitor_MountDrivenByUpdate(const FECSEntity &inout Entity, const FC_MountIsDrivenBy &inout MountIsDrivenBy) const
    {
        this.UpdateSignificance(Entity);
        return;
    }
    UFUNCTION()
    void Run_Monitor_ActorActive() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorActorOnAssignView(EECSRegType(2), false, false);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ActorActive(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = this.GetECSWorld().__GetMonitorActorOnActiveView(EECSRegType(2), false, false);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_ActorActive(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ViewEntityFXData() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorViewEntityFXDataOnAssignView(EECSRegType(2), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ViewEntityFXData(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ControlledByAIUpdate() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorControlledByAIOnModifyView(EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ControlledByAIUpdate(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_UpdateTeam() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorPlayerInTeamOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_UpdateTeam(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorPlayerInTeamOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_UpdateTeam(local_46, local_52);
        }
        FECSMonitorRuntimeView local_56 = ::__GetMonitorPlayerInTeamOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28_2 = local_56.Iterator();
        for (; local_28_2.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_3 = local_28_2.Proceed();
            FECSEntityScopeCycleCounter local_43_3 = FECSEntityScopeCycleCounter(local_42_3.Entity);
            GetComponent local_50_3 = FECSMonitorRuntimeViewItem::GetComponent(local_42_3);
            this.Monitor_UpdateTeam(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_MountDrivenByUpdate() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorMountIsDrivenByOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_MountDrivenByUpdate(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorMountIsDrivenByOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_MountDrivenByUpdate(local_46, local_52);
        }
        FECSMonitorRuntimeView local_56 = ::__GetMonitorMountIsDrivenByOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28_2 = local_56.Iterator();
        for (; local_28_2.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_3 = local_28_2.Proceed();
            FECSEntityScopeCycleCounter local_43_3 = FECSEntityScopeCycleCounter(local_42_3.Entity);
            GetComponent local_50_3 = FECSMonitorRuntimeViewItem::GetComponent(local_42_3);
            this.Monitor_MountDrivenByUpdate(local_46, local_52);
        }
        return;
    }
}


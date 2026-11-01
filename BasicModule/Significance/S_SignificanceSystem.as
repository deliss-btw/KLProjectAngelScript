class US_SignificanceSystemAS : UECSScriptSystem
{
    US_SignificanceSystemAS()
    {
        return;
    }
    void UpdateSignificance(const FECSEntity &inout Entity) const
    {
        EECSSignificanceType local_7 = ::Significance::GetSignificanceType(Entity);
        FC_Significance local_6;
        local_6.SignificanceType = local_7;
        local_6.SignificanceOffset = ::Significance::GetSignificanceOffset(Entity, local_6.SignificanceType);
        Get local_12;
        const FC_SignificanceConfig& local_14 = local_12.opCall();
        if (local_14)
        {
            TDataObjectPtr<FSignificanceConfig> local_40 = TDataObjectPtr<FSignificanceConfig>(local_14.Config.CastTo(FSignificanceConfig));
            if (!(local_40))
            {
                return;
            }
            local_6.Config = local_40.opImplConv();
            local_6.Significance = ::Significance::GetSignificanceValue(local_40.Get(), local_6.SignificanceType, int(local_6.SignificanceOffset));
        }
        return;
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
        TDataObjectPtr<FSignificanceConfig> local_24 = TDataObjectPtr<FSignificanceConfig>(FXData.BakedData.Significance.CastTo(FSignificanceConfig));
        FECSEntity local_114;
        if (FXData.OwnerEntity)
        {
            local_114 = FXData.OwnerEntity;
        }
        else
        {
            local_114 = FXData.AttachEntity;
        }
        EECSSignificanceType local_115 = ::Significance::GetSignificanceType(local_114);
        FC_Significance local_104;
        local_104.SignificanceType = local_115;
        local_104.SignificanceOffset = ::Significance::GetSignificanceOffset(local_114, local_104.SignificanceType);
        if (!(local_24.IsSet()))
        {
            return;
        }
        local_104.Config = FXData.BakedData.Significance;
        local_104.Significance = ::Significance::GetSignificanceValue(local_24.Get(), local_104.SignificanceType, int(local_104.SignificanceOffset));
        return;
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
        FECSMonitorRuntimeView local_56 = ::__GetMonitorPlayerInTeamOnRemoveView(this.GetECSWorld(), EECSRegType(0), (0 != 0), true);
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
        FECSMonitorRuntimeView local_56 = ::__GetMonitorMountIsDrivenByOnRemoveView(this.GetECSWorld(), EECSRegType(0), (0 != 0), true);
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


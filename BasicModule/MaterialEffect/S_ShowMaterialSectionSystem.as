

class US_ShowMaterialSectionSystem : UECSScriptSystem
{
    US_ShowMaterialSectionSystem()
    {
        return;
    }
    UFUNCTION()
    void Monitor_OnRemoveSyncShowMaterialSectionRequests(const FECSEntity &inout Entity, const FC_SyncShowMaterialSectionRequests &inout ShowMaterialSectionRequests) const
    {
        if (Entity.IsValid())
        {
            FC_UpdateShowMaterialSectionTag local_8;
            Assign local_6;
            local_6.opCall(local_8);
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnAssignSyncShowMaterialSectionRequests(const FECSEntity &inout Entity, const FC_SyncShowMaterialSectionRequests &inout ShowMaterialSectionRequests) const
    {
        if (Entity.IsValid())
        {
            FC_UpdateShowMaterialSectionTag local_8;
            Assign local_6;
            local_6.opCall(local_8);
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnModifySyncShowMaterialSectionRequests(const FECSEntity &inout Entity, const FC_SyncShowMaterialSectionRequests &inout ShowMaterialSectionRequests) const
    {
        if (Entity.IsValid())
        {
            FC_UpdateShowMaterialSectionTag local_8;
            Assign local_6;
            local_6.opCall(local_8);
        }
        return;
    }
    UFUNCTION()
    void ClientJob_UpdateMaterialParams(const FECSEntity &inout Entity) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void RestoreAllMaterialSections(const FECSEntity &inout Entity) const
    {
        int local_6 = 0;
        if (!(local_6))
        {
            return;
        }
        for (auto& local_22 : local_6.Materials)
        {
            FECSActorComponentProxy local_26 = Entity.ModifyActorComponent(local_22.MeshName);
            FECSMeshComponentProxy local_34 = local_26.CastToMeshComponent();
            if (!(local_34))
            {
                continue;
            }
            bool local_7 = !(local_22.bShouldShow);
            local_34.SetSectionHidden(int(local_22.MaterialIdx), local_7);
        }
        Remove local_44;
        local_44.opCall();
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnRemoveSyncShowMaterialSectionRequests() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorSyncShowMaterialSectionRequestsOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnRemoveSyncShowMaterialSectionRequests(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnAssignSyncShowMaterialSectionRequests() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorSyncShowMaterialSectionRequestsOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnAssignSyncShowMaterialSectionRequests(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnModifySyncShowMaterialSectionRequests() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorSyncShowMaterialSectionRequestsOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnModifySyncShowMaterialSectionRequests(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_UpdateMaterialParams() const
    {
        const FECSEntity& local_36;
        int local_156 = 0;
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
                this.ClientJob_UpdateMaterialParams(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Exclude(local_74).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_84 = 0;
        FECSRuntimeViewIterator local_118 = local_74.Iterator();
        for (; local_118.CanProceed;)
        {
            local_36 = local_118.Proceed();
            ++local_84;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_UpdateMaterialParams(local_156);
        }
        local_2.UpdateCachedEntityCount(local_84);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}


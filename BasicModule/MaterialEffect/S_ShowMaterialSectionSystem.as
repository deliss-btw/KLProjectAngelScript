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
        int local_12 = 0;
        int local_18 = 0;
        int local_87;
        Remove local_4;
        local_4.opCall();
        if (!(local_12))
        {
            this.RestoreAllMaterialSections(Entity);
            return;
        }
        TArray<int> local_22;
        for (auto& local_36 : local_12.GetRequests())
        {
            for (auto& local_50 : local_36.GetSections())
            {
                FECSActorComponentProxy local_56 = Entity.ModifyActorComponent(local_50.GetMeshName());
                FECSMeshComponentProxy local_64 = local_56.CastToMeshComponent();
                if (!(local_64))
                {
                    continue;
                }
                const UMeshComponent local_72 = local_64.GetMeshComponent();
                if ((!((local_72 != nullptr))))
                {
                    continue;
                }
                for (auto& local_86 : local_50.GetMaterials())
                {
                    local_87 = local_86.GetbUseSlotName() ? local_72.GetMaterialIndex(local_86.GetMaterialSlotName()) : local_86.GetMaterialIndex();
                    if (local_87 == -1)
                    {
                        XWarning(ELog(55), FString().Append("[ShowMaterialSection] Invalid material index for Entity=").Append(Entity).Append(", Mesh=").Append(local_50.GetMeshName()).Append(", bUseSlotName=").Append(local_86.GetbUseSlotName()).Append(", SlotName=").Append(local_86.GetMaterialSlotName()).Append(", MaterialIndex=").Append(local_86.GetMaterialIndex()));
                        continue;
                    }
                    int local_88 = local_18.GetMaterialBackupIndex(local_50.GetMeshName(), local_87);
                    if (local_88 == -1)
                    {
                        FSingleShowMaterialSection local_100;
                        local_100.MeshName = local_50.GetMeshName();
                        local_100.MaterialIdx = local_87;
                        local_100.bShouldShow = !(local_72.IsSectionHidden(local_87));
                        local_18.Materials.Add(local_100);
                        local_88 = local_18.Materials.Num() - 1;
                    }
                    local_64.SetSectionHidden(local_87, !(local_50.GetbShouldShow()));
                    local_22.AddUnique(local_88);
                }
            }
        }
        int local_102 = local_18.Materials.Num() - 1;
        for (; local_102 >= 0; --local_102)
        {
            if (!(local_22.Contains(local_102)))
            {
                FECSActorComponentProxy local_60 = Entity.ModifyActorComponent(local_18.Materials[local_102].MeshName);
                FECSMeshComponentProxy local_68 = local_60.CastToMeshComponent();
                if (!(local_68))
                {
                    continue;
                }
                bool local_5 = !(local_18.Materials[local_102].bShouldShow);
                int local_88_2 = local_18.Materials[local_102].MaterialIdx;
                local_68.SetSectionHidden(local_88_2, local_5);
                local_18.Materials.RemoveAt(local_102);
            }
        }
        return;
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


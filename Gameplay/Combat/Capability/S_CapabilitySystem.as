

class US_CapabilitySystem : UECSScriptSystem
{
    US_CapabilitySystem()
    {
        return;
    }
    UFUNCTION()
    void Monitor_OnCapabilityChanged(const FECSEntity &inout Entity, const FC_Capability &inout Capability) const
    {
        Assign local_4;
        local_4.opCall(FC_CapabilitySyncedTag());
        return;
    }
    UFUNCTION()
    void Monitor_OnCapabilityModifierChanged(const FECSEntity &inout Entity, const FC_CapabilityModifiers &inout CapabilityModifiers) const
    {
        Assign local_4;
        local_4.opCall(FC_CapabilitySyncedTag());
        return;
    }
    UFUNCTION()
    void ClentJob_RebuildCapabilityParams(const FECSEntity &inout Entity) const
    {
        int local_14 = 0;
        int local_20 = 0;
        Get local_4;
        const FC_Capability& local_6 = local_4.opCall();
        if (local_6)
        {
            FCapabilityUtils::RebuildCapabilityParamStorage(local_20.Storage, local_6.GetCapabilityRuntime(), local_14.GetModifiers());
        }
        Remove local_24;
        local_24.opCall();
        return;
    }
    UFUNCTION()
    void Job_ClearCapabilityBeforeDestroy(const FECSEntity &inout Entity, FC_Capability &inout Capability) const
    {
        for (auto& local_16 : Capability.GetCapabilityRuntime().CapabilityInstances)
        {
            FCapabilityUtils::RemoveCapability(Entity, TDataObjectPtr<FCapabilityConfig>(local_16.Config), int(local_16.Level));
        }
        return;
    }
    UFUNCTION()
    void ServerJob_InitCapabilityConfig(const FECSEntity &inout Entity, const FC_CapabilityInitConfig &inout InitConfig) const
    {
        for (auto& local_16 : InitConfig.InitCapabilities)
        {
            if (local_16.Capability)
            {
                FCapabilityUtils::AddCapability(Entity, TDataObjectPtr<FCapabilityConfig>(local_16.Capability), int(local_16.Level));
            }
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnCapabilityChanged() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorCapabilityOnAssignView(EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnCapabilityChanged(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = this.GetECSWorld().__GetMonitorCapabilityOnModifyView(EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_OnCapabilityChanged(local_46, local_52);
        }
        FECSMonitorRuntimeView local_56 = this.GetECSWorld().__GetMonitorCapabilityOnRemoveView(EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28_2 = local_56.Iterator();
        for (; local_28_2.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_3 = local_28_2.Proceed();
            FECSEntityScopeCycleCounter local_43_3 = FECSEntityScopeCycleCounter(local_42_3.Entity);
            GetComponent local_50_3 = FECSMonitorRuntimeViewItem::GetComponent(local_42_3);
            this.Monitor_OnCapabilityChanged(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnCapabilityModifierChanged() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorCapabilityModifiersOnAssignView(EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnCapabilityModifierChanged(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = this.GetECSWorld().__GetMonitorCapabilityModifiersOnModifyView(EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_OnCapabilityModifierChanged(local_46, local_52);
        }
        FECSMonitorRuntimeView local_56 = this.GetECSWorld().__GetMonitorCapabilityModifiersOnRemoveView(EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28_2 = local_56.Iterator();
        for (; local_28_2.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_3 = local_28_2.Proceed();
            FECSEntityScopeCycleCounter local_43_3 = FECSEntityScopeCycleCounter(local_42_3.Entity);
            GetComponent local_50_3 = FECSMonitorRuntimeViewItem::GetComponent(local_42_3);
            this.Monitor_OnCapabilityModifierChanged(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ClentJob_RebuildCapabilityParams() const
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
                this.ClentJob_RebuildCapabilityParams(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Include local_82;
        local_82.opCall();
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
            this.ClentJob_RebuildCapabilityParams(local_160);
        }
        local_2.UpdateCachedEntityCount(local_88);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearCapabilityBeforeDestroy() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_170 = 0;
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
                this.Job_ClearCapabilityBeforeDestroy(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_ClearCapabilityBeforeDestroy(local_170, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_InitCapabilityConfig() const
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
                this.ServerJob_InitCapabilityConfig(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
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
            this.ServerJob_InitCapabilityConfig(local_162, local_38);
        }
        local_2.UpdateCachedEntityCount(local_90);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}




class US_CompVisibilitySystem : UECSScriptSystem
{
    US_CompVisibilitySystem()
    {
        return;
    }
    UFUNCTION()
    void Monitor_UpdateHiddenLogic(const FECSEntity &inout Entity, const FC_CompHidden &inout CompHidden) const
    {
        int local_6 = 0;
        int local_8 = local_6.HiddenCompName.Num();
        int local_10 = local_8 - 1;
        for (; local_10 >= 0; --local_10)
        {
            FName& local_14 = local_6.HiddenCompName[local_10];
            if (!(CompHidden.GetHiddenCountByName().Contains(local_14)))
            {
                local_6.NewResetDefaultCompName.Add(local_14);
            }
        }
        int local_9 = local_6.UnHiddenCompName.Num() - 1;
        for (; local_9 >= 0; --local_9)
        {
            FName& local_14_2 = local_6.UnHiddenCompName[local_9];
            if (!(CompHidden.GetHiddenCountByName().Contains(local_14_2)))
            {
                local_6.NewResetDefaultCompName.Add(local_14_2);
            }
        }
        for (auto& local_32 : CompHidden.GetHiddenCountByName())
        {
            if (local_10 > 0)
            {
                if (!(local_6.HiddenCompName.Contains(local_32.GetKey())))
                {
                    local_6.NewHiddenCompName.Add(local_32.GetKey());
                }
                continue;
            }
            if (local_8 < 0)
            {
                if (!(local_6.UnHiddenCompName.Contains(local_32.GetKey())))
                {
                    local_6.NewUnHiddenCompName.Add(local_32.GetKey());
                }
                continue;
            }
            local_6.NewResetDefaultCompName.Add(local_32.GetKey());
        }
        FC_PresentationHiddenComponentsUpdateTag local_38;
        Assign local_36;
        local_36.opCall(local_38);
        return;
    }
    UFUNCTION()
    void Monitor_RemoveHiddenLogic(const FECSEntity &inout Entity, const FC_CompHidden &inout CompHidden) const
    {
        int local_31;
        Get local_36;
        Get local_4;
        const FC_PresentationHiddenComponents& local_6 = local_4.opCall();
        if (local_6)
        {
            for (auto& local_22 : local_6.HiddenCompName)
            {
                FECSActorComponentProxy local_26 = Entity.ModifyActorComponent(local_22);
                if (local_26)
                {
                    bool local_7 = true;
                    local_31 = local_7;
                    const FC_ViewEntityActorComponentData& local_38 = local_36.opCall();
                    if (local_38)
                    {
                        local_31 = local_38.bDefaultVisible;
                    }
                    local_26.SetVisible((local_31 != 0));
                }
            }
            for (auto& local_22 : local_6.UnHiddenCompName)
            {
                FECSActorComponentProxy local_30 = Entity.ModifyActorComponent(local_22);
                if (local_30)
                {
                    bool local_7_2 = true;
                    local_31 = local_7_2;
                    const FC_ViewEntityActorComponentData& local_38_2 = local_36.opCall();
                    if (local_38_2)
                    {
                        local_31 = local_38_2.bDefaultVisible;
                    }
                    local_30.SetVisible((local_31 != 0));
                }
            }
            Remove local_42;
            local_42.opCall();
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateHiddenPresentation(const FECSEntity &inout Entity, FC_PresentationHiddenComponents &inout CompHidden) const
    {
        if (!(Entity.ModifyActor()))
        {
            int local_10 = 300;
            if (int(CompHidden.DeferFramesLeft) < 0)
            {
                CompHidden.DeferFramesLeft = 300;
            }
            if (int(CompHidden.DeferFramesLeft) > 0)
            {
                CompHidden.DeferFramesLeft -= 1;
                return;
            }
        }
        CompHidden.DeferFramesLeft = -1;
        for (auto& local_26 : CompHidden.NewHiddenCompName)
        {
            FECSActorComponentProxy local_30 = Entity.ModifyActorComponent(local_26);
            if (local_30)
            {
                local_30.SetVisible(false);
            }
            CompHidden.HiddenCompName.Add(local_26);
        }
        CompHidden.NewHiddenCompName.Reset(0);
        for (auto& local_26 : CompHidden.NewUnHiddenCompName)
        {
            FECSActorComponentProxy local_34 = Entity.ModifyActorComponent(local_26);
            if (local_34)
            {
                local_34.SetVisible(true);
            }
            CompHidden.UnHiddenCompName.Add(local_26);
        }
        CompHidden.NewUnHiddenCompName.Reset(0);
        for (auto& local_26 : CompHidden.NewResetDefaultCompName)
        {
            FECSActorComponentProxy local_30_2 = Entity.ModifyActorComponent(local_26);
            if (local_30_2)
            {
                bool local_35;
                local_35 = true;
                Get local_40;
                const FC_ViewEntityActorComponentData& local_42 = local_40.opCall();
                if (local_42)
                {
                    local_35 = local_42.bDefaultVisible;
                }
                local_30_2.SetVisible(local_35);
            }
        }
        CompHidden.NewResetDefaultCompName.Reset(0);
        Remove local_46;
        local_46.opCall();
        return;
    }
    UFUNCTION()
    void Run_Monitor_UpdateHiddenLogic() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorCompHiddenOnActiveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_UpdateHiddenLogic(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorCompHiddenOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_UpdateHiddenLogic(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_RemoveHiddenLogic() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorCompHiddenOnInactiveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_RemoveHiddenLogic(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorCompHiddenOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_RemoveHiddenLogic(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateHiddenPresentation() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_174 = 0;
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
                this.Job_UpdateHiddenPresentation(local_36, local_38);
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
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_84.Iterator();
        for (; local_136.CanProceed;)
        {
            local_36 = local_136.Proceed();
            ++local_102;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_UpdateHiddenPresentation(local_174, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_102);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}


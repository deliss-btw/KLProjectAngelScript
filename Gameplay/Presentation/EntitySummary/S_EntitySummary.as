
const FConsoleVariable CVar_EntitySummary_Enable = FConsoleVariable();

class US_EntitySummary : UECSScriptSystem
{
    US_EntitySummary()
    {
        return;
    }
    UFUNCTION()
    void Monitor_PlayerEnterGame(const FECSEntity &inout PlayerEntity, const FC_PlayerController &inout C_PlayerController) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        ModifyOrAdd local_6;
        FCS_PlayerEntitySummary& local_8 = local_6.opCall();
        if (local_8)
        {
            int local_10 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(PlayerEntity);
            if (local_10 > 0)
            {
                local_8.GetModify_PlayerEntities().Add(local_10, PlayerEntity);
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_PlayerLeaveGame(const FECSEntity &inout PlayerEntity, const FC_PlayerController &inout C_PlayerController) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        Modify local_6;
        if (local_6.opCall())
        {
            if (::FASCommonUtils::GetPlayerUidFromPlayerEntityInternal(PlayerEntity, C_PlayerController) > 0)
            {
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_EcologyFlockComponentChange(const FECSEntity &inout Entity, const FC_EcologyFlockComponent &inout C_FlockComponent) const
    {
        if (!(this.MayNeedAddToSummaryByFlockComponent(C_FlockComponent)))
        {
            this.ClearCachedFlockEntityFromSummary(Entity);
            return;
        }
        this.MarkFlockEntityNeedUpdate(Entity);
        return;
    }
    UFUNCTION()
    void Monitor_EcologyFlockBehaviorComponentChange(const FECSEntity &inout Entity, const FC_EcologyFlockBehaviorComponent &inout C_FlockBehaviorComponent) const
    {
        if (!(this.MayNeedAddToSummaryByFlockBehaviorComponent(C_FlockBehaviorComponent)))
        {
            this.ClearCachedFlockEntityFromSummary(Entity);
            return;
        }
        this.MarkFlockEntityNeedUpdate(Entity);
        return;
    }
    UFUNCTION()
    void ServerJob_UpdateFlockComponentSummary(FCS_EcologyFlockComponentSummaryServerCache &inout C_EcologyFlockComponentSummaryServerCache) const
    {
        int local_22 = 0;
        int local_28 = 0;
        for (auto& local_16 : C_EcologyFlockComponentSummaryServerCache.FlockEntitiesNeedUpdate)
        {
            this.UpdateFlockComponentSummary(local_16, local_22, local_28);
        }
        C_EcologyFlockComponentSummaryServerCache.FlockEntitiesNeedUpdate.Empty(0);
        FECSWorldPtr local_32 = this.GetECSWorld();
        Remove local_36;
        local_36.opCall();
        return;
    }
    UFUNCTION()
    void Monitor_PrintAllEntityInfo() const
    {
        int local_255;
        if (!(CVar_EntitySummary_Enable.GetBool()))
        {
            return;
        }
        TMap<FString, int> local_22;
        FECSEntity local_32 = ECS::GetECSWorld().Create(EECSRegType(2), EEntityType(9), n"Query");
        FECSRuntimeQuery local_80 = FECSRuntimeQueryHelper::MakeRuntimeQuery(local_32, EECSQueryRegsitryType(1), false);
        Include local_124;
        local_124.opCall();
        FECSRuntimeQueryIterator local_146 = local_80.Iterator();
        for (; local_146.CanProceed;)
        {
            local_146.Proceed();
            FString local_174 = "Unknown";
            Get local_178;
            const FC_PrefabConfig& local_180 = local_178.opCall();
            if (local_180)
            {
                FName local_184 = local_180.GetPrefabAvatarName();
                if ((!((local_184 == NAME_None))))
                {
                    local_174 = local_184.ToString();
                }
                else
                {
                    int local_25 = int(local_180.PrefabType);
                    local_174 = (FString("PrefabType_") + local_25);
                }
            }
            if (local_22.Contains(local_174))
            {
                local_22[local_174];
            }
            else
            {
                local_22.Add(local_174, 1);
            }
        }
        TArray<FString> local_198;
        for (auto& local_216 : local_22)
        {
            local_198.Add(local_216.GetKey());
        }
        XLog(ELog(0), "=== Entity Type Summary ===");
        TMap<FString, int> local_238;
        int local_239 = 0;
        for (auto& local_254 : local_198)
        {
            local_255 = local_22[local_254];
            local_239 = local_239 + local_255;
            FString local_174_2 = "Other";
            int local_259 = local_254.Find("_", ESearchCase(1), ESearchDir(0), -1);
            if (local_259 != -1)
            {
                local_174_2 = local_254.Left(local_259);
            }
            if (local_238.Contains(local_174_2))
            {
                int local_25_2 = local_238[local_174_2];
                int local_256 = local_25_2 + local_255;
            }
            else
            {
                local_238.Add(local_174_2, local_255);
            }
            XLog(ELog(0), FString().Append("  ").Append(local_254).Append(": ").Append(local_255));
        }
        XLog(ELog(0), "--- Category Summary ---");
        XLog(ELog(0), FString().Append("Total Entities: ").Append(local_239));
        XLog(ELog(0), "=========================");
        local_32.DestroyDeferred();
        return;
    }
    void MarkFlockEntityNeedUpdate(const FECSEntity &inout Entity) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        0.FlockEntitiesNeedUpdate.AddUnique(Entity);
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        FCS_EcologyFlockComponentSummaryNeedUpdateTag local_16;
        Assign local_14;
        local_14.opCall(local_16);
        return;
    }
    bool MayNeedAddToSummaryByFlockComponent(const FC_EcologyFlockComponent &inout C_FlockComponent) const
    {
        int local_16;
        if (!(C_FlockComponent))
        {
            return false;
        }
        if ((C_FlockComponent.LeaderEntity == ENTITY_ID_NULL))
        {
            return false;
        }
        if ((C_FlockComponent.ActivityTarget.MainTargetResource == ENTITY_ID_NULL))
        {
            return false;
        }
        if (!(FECSEntity(C_FlockComponent.LeaderEntity).IsActive()))
        {
            return false;
        }
        if (!(local_16))
        {
            return false;
        }
        if (!(local_16.GetMonsterConfig()) || !(local_16.GetMonsterConfig().opArrow().GetPresentationConfig()) || !(local_16.GetMonsterConfig().opArrow().GetPresentationConfig().opArrow().bShowChangeArea))
        {
            return false;
        }
        return true;
    }
    bool MayNeedAddToSummaryByFlockBehaviorComponent(const FC_EcologyFlockBehaviorComponent &inout C_FlockBehaviorComponent) const
    {
        if (!(C_FlockBehaviorComponent))
        {
            return false;
        }
        if (int(C_FlockBehaviorComponent.MainState) != 2)
        {
            return false;
        }
        return true;
    }
    void UpdateFlockComponentSummary(const FECSEntity &inout Entity, const FC_EcologyFlockComponent &inout C_FlockComponent, const FC_EcologyFlockBehaviorComponent &inout C_FlockBehaviorComponent) const
    {
        int local_10 = 0;
        int local_16 = 0;
        int local_30 = 0;
        if (!(this.MayNeedAddToSummaryByFlockComponent(C_FlockComponent)) || !(this.MayNeedAddToSummaryByFlockBehaviorComponent(C_FlockBehaviorComponent)))
        {
            this.ClearCachedFlockEntityFromSummary(Entity);
            return;
        }
        FECSWorldPtr local_4 = this.GetECSWorld();
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        if (!(FECSEntity(C_FlockComponent.ActivityTarget.MainTargetResource)))
        {
            this.ClearCachedFlockEntityFromSummary(Entity);
            return;
        }
        if (!(local_30))
        {
            this.ClearCachedFlockEntityFromSummary(Entity);
            return;
        }
        if (!((FECSEntityId(local_10.RegisteredFlockToLeaderMap.FindOrAdd(Entity)) == C_FlockComponent.LeaderEntity)))
        {
        }
        local_16.GetModify_MonsterTargetLocationMap().Add(C_FlockComponent.LeaderEntity, local_30.GetPosition());
        local_10.RegisteredFlockToLeaderMap.Add(Entity, C_FlockComponent.LeaderEntity);
        return;
    }
    void ClearCachedFlockEntityFromSummary(const FECSEntity &inout Entity) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        Modify local_6;
        FCS_EcologyFlockComponentSummaryServerCache& local_8 = local_6.opCall();
        if (local_8)
        {
            FECSEntityId local_10;
            if (local_8.RegisteredFlockToLeaderMap.RemoveAndCopyValue(Entity, local_10))
            {
                FECSWorldPtr local_12 = this.GetECSWorld();
                Modify local_16;
                if (local_16.opCall())
                {
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_PlayerEnterGame() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorPlayerControllerOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_PlayerEnterGame(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = this.GetECSWorld().__GetMonitorPlayerControllerOnModifyView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_PlayerEnterGame(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_PlayerLeaveGame() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorPlayerControllerOnRemoveView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_PlayerLeaveGame(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_EcologyFlockComponentChange() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorEcologyFlockComponentOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_EcologyFlockComponentChange(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorEcologyFlockComponentOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_EcologyFlockComponentChange(local_46, local_52);
        }
        FECSMonitorRuntimeView local_56 = ::__GetMonitorEcologyFlockComponentOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28_2 = local_56.Iterator();
        for (; local_28_2.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_3 = local_28_2.Proceed();
            FECSEntityScopeCycleCounter local_43_3 = FECSEntityScopeCycleCounter(local_42_3.Entity);
            GetComponent local_50_3 = FECSMonitorRuntimeViewItem::GetComponent(local_42_3);
            this.Monitor_EcologyFlockComponentChange(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_EcologyFlockBehaviorComponentChange() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorEcologyFlockBehaviorComponentOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_EcologyFlockBehaviorComponentChange(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorEcologyFlockBehaviorComponentOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_EcologyFlockBehaviorComponentChange(local_46, local_52);
        }
        FECSMonitorRuntimeView local_56 = ::__GetMonitorEcologyFlockBehaviorComponentOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28_2 = local_56.Iterator();
        for (; local_28_2.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_3 = local_28_2.Proceed();
            FECSEntityScopeCycleCounter local_43_3 = FECSEntityScopeCycleCounter(local_42_3.Entity);
            GetComponent local_50_3 = FECSMonitorRuntimeViewItem::GetComponent(local_42_3);
            this.Monitor_EcologyFlockBehaviorComponentChange(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_UpdateFlockComponentSummary() const
    {
        int local_16 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        Has local_14;
        if (!(local_14.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_3 = this.GetECSWorld();
        this.ServerJob_UpdateFlockComponentSummary(local_16);
        FECSWorldPtr local_4_4 = this.GetECSWorld();
        MarkModifiedIfDirty local_24;
        local_24.opCall(local_16);
        return;
    }
    UFUNCTION()
    void Run_Monitor_PrintAllEntityInfo() const
    {
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(60))))
        {
            return;
        }
        this.Monitor_PrintAllEntityInfo();
        return;
    }
}




class US_LevelSpotSystem : UECSScriptSystem
{
    US_LevelSpotSystem()
    {
        return;
    }
    UFUNCTION()
    void Monitor_SyncEntityLevelSpotToViewers(const FECSEntity &inout Entity, const FC_LevelSpot &inout C_LevelSpot) const
    {
        int local_6 = 0;
        ::LevelSpotViewerUtils::RemoveSpotFromViewers(::EntityLevelSpotUtils::GetMainSpotId(Entity), local_6.HistoryViewers);
        ::LevelSpotViewerUtils::AddEntitySpotToViewers(::EntityLevelSpotUtils::GetMainSpotId(Entity), C_LevelSpot.GetLevelSpotInfo(), Entity);
        FLevelSpotViewers local_32 = C_LevelSpot.GetLevelSpotInfo().GetAllViewers();
        if ((!((local_32 == local_6.HistoryViewers))))
        {
            this.UpdatePropertySample(Entity, local_6.HistoryViewers, local_32);
        }
        TSet<FECSEntity> local_98 = this.BuildZSamplers(C_LevelSpot.GetLevelSpotInfo(), local_32, this.GetMinNetRelevanceDistance());
        this.UpdateZSample(Entity, local_6.HistoryZSamplers, local_98);
        local_6.HistoryZSamplers = local_98;
        return;
    }
    UFUNCTION()
    void Monitor_OnEntityLevelSpotRemoved(const FECSEntity &inout Entity, const FC_LevelSpot &inout C_LevelSpot) const
    {
        ::LevelSpotViewerUtils::RemoveSpotFromViewers(::EntityLevelSpotUtils::GetMainSpotId(Entity), C_LevelSpot.GetLevelSpotInfo().GetAllViewers());
        Remove local_30;
        local_30.opCall();
        ::AttributeSampleUtils::RemoveAllAttributeSamples(Entity, EAttributeSampleRequester(0));
        return;
    }
    UFUNCTION()
    void Monitor_OnNewPlayerEnterGame(const FECSEntity &inout Entity, const FC_PlayerController &inout C_PlayerController) const
    {
        FC_LevelSpotPlayerViewer local_48;
        Assign local_4;
        local_4.opCall(local_48);
        FECSWorldPtr local_50 = this.GetECSWorld();
        ModifyOrAdd local_54;
        this.OnNewViewerEnterGame(Entity, local_54.opCall());
        return;
    }
    UFUNCTION()
    void Monitor_OnNewTeamEnterGame(const FECSEntity &inout Entity, const FC_TeamInfo &inout C_TeamInfo) const
    {
        FC_LevelSpotTeamViewer local_48;
        Assign local_4;
        local_4.opCall(local_48);
        FECSWorldPtr local_50 = this.GetECSWorld();
        ModifyOrAdd local_54;
        this.OnNewViewerEnterGame(Entity, local_54.opCall());
        return;
    }
    UFUNCTION()
    void Monitor_OnPlayerLeaveGame(const FECSEntity &inout Entity, const FC_PlayerController &inout C_PlayerController) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        Modify local_6;
        if (local_6.opCall())
        {
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnTeamLeaveGame(const FECSEntity &inout Entity, const FC_TeamInfo &inout C_TeamInfo) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        Modify local_6;
        if (local_6.opCall())
        {
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnCreatureMetaChanged(const FECSEntity &inout Entity, const FC_CreatureMeta &inout C_CreatureMeta) const
    {
        FC_LevelSpotMonitorCreatureMetaChangedDeferTag local_6;
        Assign local_4;
        local_4.opCall(local_6);
        return;
    }
    UFUNCTION()
    void Monitor_OnCreatureDeathChanged(const FECSEntity &inout Entity, const FC_DeathTag &inout C_DeathTag) const
    {
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            FC_LevelSpotMonitorCreatureMetaChangedDeferTag local_12;
            Assign local_10;
            local_10.opCall(local_12);
        }
        return;
    }
    UFUNCTION()
    void Job_OnCreatureMetaChangedDefer(const FECSEntity &inout Entity) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Monitor_OnEntityWithLevelSpotAdded(const FECSEntity &inout Entity, const FC_LevelSpot &inout C_LevelSpot) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        FFPTime local_14 = FFPTime(-1);
        SendEvent local_12;
        FCE_NotifyNewLevelSpotEntity& local_18 = local_12.opCall(local_14);
        if (local_18)
        {
            local_18.Entity = Entity;
        }
        return;
    }
    UFUNCTION()
    void Job_InitLevelSpotConfig(const FECSEntity &inout Entity, const FC_LevelSpotConfig &inout C_LevelSpotConfig) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_SyncLevelSpotViewersToNetRelevance(const FECSEntity &inout Entity, const FC_LevelSpotConfig &inout C_LevelSpotConfig) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_OnEntityGameplayTagInit(const FECSEntity &inout Entity, const FC_GameplayTags &inout C_GameplayTags) const
    {
        this.UpdateLevelSpotDataFromGameplayTags(Entity, C_GameplayTags);
        FC_LevelSpotMonitorGameplayTagInitTag local_6;
        Assign local_4;
        local_4.opCall(local_6);
        return;
    }
    UFUNCTION()
    void Job_OnEntityGameplayTagChanged(const FECSEntity &inout Entity, const FC_GameplayTags &inout C_GameplayTags, const FC_GameplayTagsChanged &inout C_GameplayTagsChanged) const
    {
        const ULevelSpotSettings local_4;
        bool local_1 = false;
        GetGameplaySettings<ULevelSpotSettings> local_6;
        local_4 = local_6;
        for (auto& local_26 : local_4.AutoApplyRuleConfigByTag)
        {
            if (C_GameplayTagsChanged.ContainsTag(local_26.GetKey()))
            {
                local_1 = true;
                break;
            }
        }
        if (!(local_1))
        {
            return;
        }
        this.UpdateLevelSpotDataFromGameplayTags(Entity, C_GameplayTags);
        return;
    }
    void UpdateLevelSpotDataFromGameplayTags(const FECSEntity &inout Entity, const FC_GameplayTags &inout C_GameplayTags) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void OnNewViewerEnterGame(const FECSEntity &inout Viewer, FCS_LevelSpotViewerSummary &inout C_LevelSpotViewerSummary) const
    {
        C_LevelSpotViewerSummary.AllViewers.Add(Viewer);
        this.Run_Job_InitNewViewer(Viewer.GetId());
        return;
    }
    UFUNCTION()
    void Job_InitNewViewer(const FECSEntity &inout Entity, const FC_LevelSpot &inout C_LevelSpot, const FECSEntityId &inout ViewerEntityId) const
    {
        int local_48 = 0;
        FECSEntity local_52 = FECSEntity(ViewerEntityId);
        if (::LevelSpotViewerUtils::TryAddEntitySpotToSpecifiedViewer(::EntityLevelSpotUtils::GetMainSpotId(Entity), C_LevelSpot.GetLevelSpotInfo(), local_52, Entity))
        {
            FLevelSpotViewers local_78 = C_LevelSpot.GetLevelSpotInfo().GetAllViewers();
            this.UpdatePropertySample(Entity, local_48.HistoryViewers, local_78);
            TSet<FECSEntity> local_142 = this.BuildZSamplers(C_LevelSpot.GetLevelSpotInfo(), local_78, this.GetMinNetRelevanceDistance());
            this.UpdateZSample(Entity, local_48.HistoryZSamplers, local_142);
            local_48.HistoryZSamplers = local_142;
        }
        return;
    }
    FLevelSpotData GetLevelSpotDataFromCreatureMeta(const FC_CreatureMeta &inout C_CreatureMeta) const
    {
        FLevelSpotData __r;
        int local_2 = int(C_CreatureMeta.CreatureConfigProxy.Type);
        if (local_2 <= 2)
        {
            if (local_2 != 1)
            {
                if (local_2 != 2)
                {
                }
            }
            else
            {
                TDataObjectPtr<FMonsterMainConfig> local_28 = C_CreatureMeta.CreatureConfigProxy.GetMonsterConfig();
                if (local_28)
                {
                    CastTo local_58;
                    FLevelSpotData local_208 = FLevelSpotData(local_58.opCall(), local_28.opArrow().GetPresentationRuleConfig());
                }
                else
                {
                    TDataObjectPtr<FNPCMainConfig> local_232 = C_CreatureMeta.CreatureConfigProxy.GetNPCConfig();
                    if (local_232)
                    {
                        CastTo local_260;
                        FLevelSpotData local_208_2 = FLevelSpotData(local_260.opCall(), local_232.opArrow().GetPresentationRuleConfig());
                    }
                    else
                    {
                    }
                }
            }
        }
        return __r;
    }
    void UpdatePropertySample(const FECSEntity &inout Entity, const FLevelSpotViewers &inout HistoryViewers, const FLevelSpotViewers &inout CurrentViewers) const
    {
        TSet<FECSEntity> local_20;
        TSet<FECSEntity> local_40;
        if (CurrentViewers.IsAll())
        {
            local_20.Add(ENTITY_NULL);
        }
        else
        {
            local_20.Append(::LevelSpotViewerUtils::ParseViewersArray(CurrentViewers));
        }
        if (HistoryViewers.IsAll())
        {
            local_40.Add(ENTITY_NULL);
        }
        else
        {
            local_40.Append(::LevelSpotViewerUtils::ParseViewersArray(HistoryViewers));
        }
        for (auto& local_84 : local_20.Difference(local_40))
        {
            ::AttributeSampleUtils::AddAttributeSample(Entity, EAttributeSampleType(1), EAttributeSampleRequester(0), local_84);
        }
        for (auto& local_84 : local_40.Difference(local_20))
        {
            ::AttributeSampleUtils::RemoveAttributeSample(Entity, EAttributeSampleType(1), EAttributeSampleRequester(0), local_84);
        }
        return;
    }
    float32 GetMinNetRelevanceDistance() const
    {
        US_NetRelevanceSystem local_6 = Cast<US_NetRelevanceSystem>(AECSGameManagerActor::GetSystem(ECS::GetUEWorld(), US_NetRelevanceSystem));
        if (local_6 != nullptr)
        {
            return local_6.NetRelevanceDistanceVeryClose;
        }
        return -1.0f;
    }
    bool HeadsUpDisplayRuleExceedsDistance(const FPresentationDisplayRule &inout Rule, const float32 DistanceThreshold) const
    {
        if (Rule.bEnableDisplay && (Rule.MaxDistance <= 0.0f || (Rule.MaxDistance > DistanceThreshold)))
        {
            return true;
        }
        for (auto& local_20 : Rule.ConditionalRules)
        {
            if (local_20.Rule.bEnableDisplay && (local_20.Rule.MaxDistance <= 0.0f || (local_20.Rule.MaxDistance > DistanceThreshold)))
            {
                return true;
            }
        }
        return false;
    }
    bool ViewerNeedsZSample(const FLevelSpotInfo &inout LevelSpotInfo, const FECSEntity &inout Viewer, const float32 MinNetDist) const
    {
        TDataObjectPtr<FHeadsUpDisplayConfig> local_150 = LevelSpotInfo.GetDataForViewer(Viewer).GetHeadsUpDisplayConfig();
        if (!(local_150))
        {
            return false;
        }
        return this.HeadsUpDisplayRuleExceedsDistance(local_150.opArrow().DisplayRule, MinNetDist);
    }
    TSet<FECSEntity> BuildZSamplers(const FLevelSpotInfo &inout LevelSpotInfo, const FLevelSpotViewers &inout CurrentViewers, const float32 MinNetDist) const
    {
        TSet<FECSEntity> local_20;
        if (CurrentViewers.IsAll())
        {
            if (this.ViewerNeedsZSample(LevelSpotInfo, ENTITY_NULL, MinNetDist))
            {
                local_20.Add(ENTITY_NULL);
            }
        }
        else
        {
            for (auto& local_40 : ::LevelSpotViewerUtils::ParseViewersArray(CurrentViewers))
            {
                if (this.ViewerNeedsZSample(LevelSpotInfo, local_40, MinNetDist))
                {
                    local_20.Add(local_40);
                }
            }
        }
        return local_20;
    }
    void UpdateZSample(const FECSEntity &inout Entity, const TSet<FECSEntity> &inout HistoryZSamplers, const TSet<FECSEntity> &inout CurrentZSamplers) const
    {
        for (auto& local_40 : CurrentZSamplers.Difference(HistoryZSamplers))
        {
            ::AttributeSampleUtils::AddAttributeSample(Entity, EAttributeSampleType(2), EAttributeSampleRequester(0), local_40);
        }
        for (auto& local_40 : HistoryZSamplers.Difference(CurrentZSamplers))
        {
            ::AttributeSampleUtils::RemoveAttributeSample(Entity, EAttributeSampleType(2), EAttributeSampleRequester(0), local_40);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_SyncEntityLevelSpotToViewers() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorLevelSpotOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_SyncEntityLevelSpotToViewers(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorLevelSpotOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_SyncEntityLevelSpotToViewers(local_46, local_52);
        }
        FECSMonitorRuntimeView local_56 = ::__GetMonitorLevelSpotOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28_2 = local_56.Iterator();
        for (; local_28_2.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_3 = local_28_2.Proceed();
            FECSEntityScopeCycleCounter local_43_3 = FECSEntityScopeCycleCounter(local_42_3.Entity);
            GetComponent local_50_3 = FECSMonitorRuntimeViewItem::GetComponent(local_42_3);
            this.Monitor_SyncEntityLevelSpotToViewers(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnEntityLevelSpotRemoved() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorLevelSpotOnInactiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnEntityLevelSpotRemoved(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorLevelSpotOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_OnEntityLevelSpotRemoved(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnNewPlayerEnterGame() const
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
            this.Monitor_OnNewPlayerEnterGame(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnNewTeamEnterGame() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorTeamInfoOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnNewTeamEnterGame(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnPlayerLeaveGame() const
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
            this.Monitor_OnPlayerLeaveGame(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnTeamLeaveGame() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorTeamInfoOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnTeamLeaveGame(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnCreatureMetaChanged() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorCreatureMetaOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnCreatureMetaChanged(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorCreatureMetaOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_OnCreatureMetaChanged(local_46, local_52);
        }
        FECSMonitorRuntimeView local_56 = ::__GetMonitorCreatureMetaOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28_2 = local_56.Iterator();
        for (; local_28_2.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_3 = local_28_2.Proceed();
            FECSEntityScopeCycleCounter local_43_3 = FECSEntityScopeCycleCounter(local_42_3.Entity);
            GetComponent local_50_3 = FECSMonitorRuntimeViewItem::GetComponent(local_42_3);
            this.Monitor_OnCreatureMetaChanged(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnCreatureDeathChanged() const
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
            this.Monitor_OnCreatureDeathChanged(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = this.GetECSWorld().__GetMonitorDeathTagOnRemoveView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_OnCreatureDeathChanged(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_OnCreatureMetaChangedDefer() const
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
                this.Job_OnCreatureMetaChangedDefer(local_36);
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
            this.Job_OnCreatureMetaChangedDefer(local_156);
        }
        local_2.UpdateCachedEntityCount(local_84);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnEntityWithLevelSpotAdded() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorLevelSpotOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnEntityWithLevelSpotAdded(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorLevelSpotOnActiveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_OnEntityWithLevelSpotAdded(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_InitLevelSpotConfig_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_172 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_6 = 0;
        int local_5 = local_6;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_InitLevelSpotConfig(local_38, local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_82 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_86;
        local_86.opCall();
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Exclude(local_82).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_100 = 0;
        FECSRuntimeViewIterator local_134 = local_82.Iterator();
        for (; local_134.CanProceed;)
        {
            local_38 = local_134.Proceed();
            ++local_100;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_InitLevelSpotConfig(local_172, local_40);
        }
        local_4.UpdateCachedEntityCount(local_100);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_InitLevelSpotConfig_StaticReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_172 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 1;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_14 = local_4.GetViewCacheEntities();
            int local_15 = 0;
            for (auto& local_30 : local_14)
            {
                local_30;
                FECSEntity local_34;
                if (!(local_34.IsValid()))
                {
                    continue;
                }
                ++local_15;
                FECSEntityScopeCycleCounter local_35 = FECSEntityScopeCycleCounter(local_34);
                this.Job_InitLevelSpotConfig(local_38, local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_82 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_86;
        local_86.opCall();
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Exclude(local_82).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_100 = 0;
        FECSRuntimeViewIterator local_134 = local_82.Iterator();
        for (; local_134.CanProceed;)
        {
            local_38 = local_134.Proceed();
            ++local_100;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_InitLevelSpotConfig(local_172, local_40);
        }
        local_4.UpdateCachedEntityCount(local_100);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_SyncLevelSpotViewersToNetRelevance() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
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
                this.Job_SyncLevelSpotViewersToNetRelevance(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        local_84.opCall();
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_80.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_SyncLevelSpotViewersToNetRelevance(local_170, local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_OnEntityGameplayTagInit() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
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
                this.Job_OnEntityGameplayTagInit(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
        Exclude(local_80).opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_80.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_OnEntityGameplayTagInit(local_170, local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_OnEntityGameplayTagChanged() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_180 = 0;
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
                this.Job_OnEntityGameplayTagChanged(local_36, local_38, local_44);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Exclude(local_86).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_86.Iterator();
        for (; local_142.CanProceed;)
        {
            local_36 = local_142.Proceed();
            ++local_108;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_OnEntityGameplayTagChanged(local_180, local_38, local_44);
        }
        local_2.UpdateCachedEntityCount(local_108);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_InitNewViewer(const FECSEntityId &inout Arg2) const
    {
        int local_132 = 0;
        int local_134 = 0;
        FECSManualJobStatScope local_1 = FECSManualJobStatScope(FName("[AS][ManualJob]S_LevelSpotSystem::Job_InitNewViewer"));
        ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        FECSRuntimeView local_48 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_52;
        local_52.opCall();
        Exclude(local_48).opCall();
        FECSRuntimeViewIterator local_90 = local_48.Iterator();
        for (; local_90.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_129 = FECSEntityScopeCycleCounter(local_90.Proceed());
            this.Job_InitNewViewer(local_132, local_134, Arg2);
        }
        return;
    }
}


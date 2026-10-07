

class US_SimpleDestructible : UECSScriptSystem
{
    US_SimpleDestructible()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_InitSimpleDestructibleRelatedComponent() const
    {
        FCS_SimpleDestructibleManager local_68;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Assign local_6;
        local_6.opCall(local_68);
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        FCS_SimpleDestructibleServerCache local_132;
        Assign local_72;
        local_72.opCall(local_132);
        return;
    }
    UFUNCTION()
    void ClientJob_ReInitClientCache() const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Modify local_6;
        FCS_SimpleDestructibleClientCache& local_8 = local_6.opCall();
        if (local_8)
        {
            ::SimpleDestructibleUtils::ClientRevertAllAppliedStates(local_8);
            local_8.Reset();
        }
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        Modify local_14;
        FCS_SimpleDestructibleStreamingSignal& local_16 = local_14.opCall();
        if (local_16)
        {
            local_16.Reset();
        }
        return;
    }
    UFUNCTION()
    void ClientJob_InitSimpleDestructibleRelatedComponent() const
    {
        FCS_SimpleDestructibleClientCache local_128;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Assign local_6;
        local_6.opCall(local_128);
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        FCS_SimpleDestructibleStreamingSignal local_134;
        Assign local_132;
        local_132.opCall(local_134);
        FECSWorldPtr local_2_3 = ECS::GetECSWorld();
        Modify local_138;
        FCS_SimpleDestructibleClientCache& local_140 = local_138.opCall();
        if (local_140)
        {
            local_140.ActiveUseManagerOnModify = SimpleDestructibleUtils::CVar_SimpleDestructible_UseManagerOnModify.GetBool();
        }
        return;
    }
    UFUNCTION()
    void ClientJob_HandleSimpleDestructibleHitEvent_FoliageISM(const FCE_SimpleDestructibleHitEvent_FoliageISM &inout Event) const
    {
        UHierarchicalInstancedStaticMeshComponent local_6;
        if (::SimpleDestructibleUtils::IsClientManagerOnModifyMode())
        {
            return;
        }
        if (local_6 == nullptr)
        {
            return;
        }
        UStaticMesh local_8 = local_6.GetStaticMesh();
        if (local_8 == nullptr)
        {
            return;
        }
        FTransform local_36;
        if (!(local_6.GetInstanceTransform(int(Event.ItemIndex), local_36, true)))
        {
            return;
        }
        UClass local_40;
        USimpleDestructibleStaticMeshAssetUserData local_48 = (Cast<USimpleDestructibleStaticMeshAssetUserData>(local_8.GetAssetUserData(TSubclassOf<UAssetUserData>(local_40), false)));
        if (local_48 == nullptr)
        {
            return;
        }
        ::SimpleDestructibleUtils::PlayDestructibleInstantFX(local_48, local_36, Event.ImpactType, Event.ImpactStrength, Event.ForceDirection);
        ECS::GetContextTime();
        FECSWorldPtr local_52 = ECS::GetECSWorld();
        FCE_SimpleDestructibleProcessView_FoliageISM local_60;
        local_60.ReceiverComponent = Event.ReceiverComponent;
        local_60.ItemIndex = int(Event.ItemIndex);
        local_60.Transform = local_36;
        local_60.QueuedSourceUniqueId = local_6.GetUniqueID();
        return;
    }
    UFUNCTION()
    void ClientJob_HandleSimpleDestructibleHitEvent_FoliageISkM(const FCE_SimpleDestructibleHitEvent_FoliageISkM &inout Event) const
    {
        UInstancedSkinnedMeshComponent local_6;
        if (::SimpleDestructibleUtils::IsClientManagerOnModifyMode())
        {
            return;
        }
        if (local_6 == nullptr)
        {
            return;
        }
        USkinnedAsset local_10 = local_6.GetSkinnedAsset();
        if (local_10 == nullptr)
        {
            return;
        }
        FTransform local_36;
        if (!(FSimpleDestructibleUtils::GetInstanceSkinnedMeshTransform(local_6, int(Event.ItemIndex), local_36, true)))
        {
            return;
        }
        UClass local_40;
        USimpleDestructibleStaticMeshAssetUserData local_48 = (Cast<USimpleDestructibleStaticMeshAssetUserData>(local_10.GetAssetUserData(TSubclassOf<UAssetUserData>(local_40), false)));
        if (local_48 == nullptr)
        {
            return;
        }
        ::SimpleDestructibleUtils::PlayDestructibleInstantFX(local_48, local_36, Event.ImpactType, Event.ImpactStrength, Event.ForceDirection);
        ECS::GetContextTime();
        FECSWorldPtr local_52 = ECS::GetECSWorld();
        FCE_SimpleDestructibleProcessView_FoliageISkM local_60;
        local_60.ReceiverComponent = Event.ReceiverComponent;
        local_60.ItemIndex = int(Event.ItemIndex);
        local_60.Transform = local_36;
        local_60.QueuedSourceUniqueId = local_6.GetUniqueID();
        return;
    }
    UFUNCTION()
    void ClientJob_HandleSimpleDestructibleHitEvent_StaticMesh(const FCE_SimpleDestructibleHitEvent_StaticMesh &inout Event) const
    {
        UStaticMeshComponent local_6;
        if (::SimpleDestructibleUtils::IsClientManagerOnModifyMode())
        {
            return;
        }
        if (local_6 == nullptr)
        {
            return;
        }
        UStaticMesh local_8 = local_6.GetStaticMesh();
        if (local_8 == nullptr)
        {
            return;
        }
        FTransform local_60 = local_6.GetWorldTransform();
        UClass local_62;
        USimpleDestructibleStaticMeshAssetUserData local_70 = (Cast<USimpleDestructibleStaticMeshAssetUserData>(local_8.GetAssetUserData(TSubclassOf<UAssetUserData>(local_62), false)));
        if (local_70 == nullptr)
        {
            return;
        }
        ::SimpleDestructibleUtils::PlayDestructibleInstantFX(local_70, local_60, Event.ImpactType, Event.ImpactStrength, Event.ForceDirection);
        ECS::GetContextTime();
        FECSWorldPtr local_74 = ECS::GetECSWorld();
        FCE_SimpleDestructibleProcessView_StaticMesh local_82;
        local_82.ReceiverComponent = Event.ReceiverComponent;
        local_82.Transform = local_60;
        local_82.QueuedSourceUniqueId = local_6.GetUniqueID();
        return;
    }
    UFUNCTION()
    void ClientJob_ProcessSimpleDestructibleView_FoliageISM(const FCE_SimpleDestructibleProcessView_FoliageISM &inout Event, FCS_SimpleDestructibleClientCache &inout ClientCache) const
    {
        UHierarchicalInstancedStaticMeshComponent local_4;
        if (local_4 == nullptr)
        {
            return;
        }
        if (local_4.GetUniqueID() != int(Event.QueuedSourceUniqueId))
        {
            return;
        }
        UStaticMesh local_10 = local_4.GetStaticMesh();
        if (local_10 == nullptr)
        {
            return;
        }
        UClass local_14;
        USimpleDestructibleStaticMeshAssetUserData local_22 = (Cast<USimpleDestructibleStaticMeshAssetUserData>(local_10.GetAssetUserData(TSubclassOf<UAssetUserData>(local_14), false)));
        if (local_22 == nullptr)
        {
            return;
        }
        FSimpleDestructibleCacheKey_FoliageISM local_34;
        local_34.SetISM(Event.ReceiverComponent);
        local_34.SetInstanceId(int(Event.ItemIndex));
        ::SimpleDestructibleUtils::ClientApplySimpleDestructible_FoliageISM(local_34, int(Event.QueuedSourceUniqueId), Event.Transform, ClientCache, local_22, local_4);
        return;
    }
    UFUNCTION()
    void ClientJob_ProcessSimpleDestructibleView_FoliageISkM(const FCE_SimpleDestructibleProcessView_FoliageISkM &inout Event, FCS_SimpleDestructibleClientCache &inout ClientCache) const
    {
        UInstancedSkinnedMeshComponent local_4;
        if (local_4 == nullptr)
        {
            return;
        }
        if (local_4.GetUniqueID() != int(Event.QueuedSourceUniqueId))
        {
            return;
        }
        USkinnedAsset local_12 = local_4.GetSkinnedAsset();
        if (local_12 == nullptr)
        {
            return;
        }
        UClass local_14;
        USimpleDestructibleStaticMeshAssetUserData local_22 = (Cast<USimpleDestructibleStaticMeshAssetUserData>(local_12.GetAssetUserData(TSubclassOf<UAssetUserData>(local_14), false)));
        if (local_22 == nullptr)
        {
            return;
        }
        FSimpleDestructibleCacheKey_FoliageISkM local_34;
        local_34.SetISkM(Event.ReceiverComponent);
        local_34.SetInstanceId(int(Event.ItemIndex));
        ::SimpleDestructibleUtils::ClientApplySimpleDestructible_FoliageISkM(local_34, int(Event.QueuedSourceUniqueId), Event.Transform, ClientCache, local_22, local_4);
        return;
    }
    UFUNCTION()
    void ClientJob_ProcessSimpleDestructibleView_StaticMesh(const FCE_SimpleDestructibleProcessView_StaticMesh &inout Event, FCS_SimpleDestructibleClientCache &inout ClientCache) const
    {
        UStaticMeshComponent local_4;
        if (local_4 == nullptr)
        {
            return;
        }
        if (local_4.GetUniqueID() != int(Event.QueuedSourceUniqueId))
        {
            return;
        }
        UStaticMesh local_10 = local_4.GetStaticMesh();
        if (local_10 == nullptr)
        {
            return;
        }
        UClass local_14;
        USimpleDestructibleStaticMeshAssetUserData local_22 = (Cast<USimpleDestructibleStaticMeshAssetUserData>(local_10.GetAssetUserData(TSubclassOf<UAssetUserData>(local_14), false)));
        if (local_22 == nullptr)
        {
            return;
        }
        FSimpleDestructibleCacheKey_StaticMesh local_32;
        local_32.SetSM(Event.ReceiverComponent);
        ::SimpleDestructibleUtils::ClientApplySimpleDestructible_StaticMesh(local_32, int(Event.QueuedSourceUniqueId), ClientCache, local_22, local_4);
        return;
    }
    UFUNCTION()
    void Monitor_ClientConnectUpdateSimpleDestructibleStates(const FCS_SimpleDestructibleManager &inout Manager) const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Modify local_6;
        FCS_SimpleDestructibleClientCache& local_8 = local_6.opCall();
        if (local_8)
        {
            ::SimpleDestructibleUtils::SeedObservedAuthorityKeys(Manager, local_8);
            ::SimpleDestructibleUtils::ClientRestoreAllStates(Manager, local_8);
            local_8.bInitialRestoreDone = true;
        }
        FSimpleDestructibleUtils::MarkSubsystemClientConnectFirstTimeInitilized(ECS::GetUEWorld());
        return;
    }
    UFUNCTION()
    void Monitor_ClientSyncSimpleDestructibleStates(const FCS_SimpleDestructibleManager &inout Manager) const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Modify local_6;
        FCS_SimpleDestructibleClientCache& local_8 = local_6.opCall();
        if (local_8)
        {
            if (!(local_8.ActiveUseManagerOnModify))
            {
                return;
            }
            if (!(local_8.bInitialRestoreDone))
            {
                ::SimpleDestructibleUtils::SeedObservedAuthorityKeys(Manager, local_8);
                ::SimpleDestructibleUtils::ClientRestoreAllStates(Manager, local_8);
                local_8.bInitialRestoreDone = true;
                return;
            }
            ::SimpleDestructibleUtils::ClientSyncNewDestructibleStates(Manager, local_8);
        }
        return;
    }
    UFUNCTION()
    void ClientJob_HandleLevelAddedToWorld(const FCE_SimpleDestructibleLevelAddedToWorld &inout Event) const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Modify local_6;
        FCS_SimpleDestructibleStreamingSignal& local_8 = local_6.opCall();
        if (local_8)
        {
            local_8.Version = (int(local_8.Version) + 1);
        }
        return;
    }
    UFUNCTION()
    void ClientJob_HandleLevelRemovedFromWorld(const FCE_SimpleDestructibleLevelRemovedFromWorld &inout Event) const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Modify local_6;
        FCS_SimpleDestructibleStreamingSignal& local_8 = local_6.opCall();
        if (local_8)
        {
            local_8.Version = (int(local_8.Version) + 1);
        }
        return;
    }
    UFUNCTION()
    void Monitor_ReconcileSimpleDestructibleStreaming(const FCS_SimpleDestructibleStreamingSignal &inout Signal) const
    {
        int local_14 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Has local_6;
        if (!(local_6.opCall()))
        {
            return;
        }
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        FECSWorldPtr local_2_3 = ECS::GetECSWorld();
        Modify local_18;
        FCS_SimpleDestructibleClientCache& local_20 = local_18.opCall();
        if (local_20)
        {
            ::SimpleDestructibleUtils::ClientCleanupUnloadedStates(local_20);
            ::SimpleDestructibleUtils::ClientRestoreAllStates(local_14, local_20);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_InitSimpleDestructibleRelatedComponent() const
    {
        ECS::GetContextJob();
        this.ServerJob_InitSimpleDestructibleRelatedComponent();
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ReInitClientCache() const
    {
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        this.ClientJob_ReInitClientCache();
        return;
    }
    UFUNCTION()
    void Run_ClientJob_InitSimpleDestructibleRelatedComponent() const
    {
        ECS::GetContextJob();
        this.ClientJob_InitSimpleDestructibleRelatedComponent();
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleSimpleDestructibleHitEvent_FoliageISM() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_SimpleDestructibleHitEvent_FoliageISM> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_SimpleDestructibleHitEvent_FoliageISM& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleSimpleDestructibleHitEvent_FoliageISM(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleSimpleDestructibleHitEvent_FoliageISkM() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_SimpleDestructibleHitEvent_FoliageISkM> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_SimpleDestructibleHitEvent_FoliageISkM& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleSimpleDestructibleHitEvent_FoliageISkM(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleSimpleDestructibleHitEvent_StaticMesh() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_SimpleDestructibleHitEvent_StaticMesh> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_SimpleDestructibleHitEvent_StaticMesh& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleSimpleDestructibleHitEvent_StaticMesh(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ProcessSimpleDestructibleView_FoliageISM() const
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
        TECSEventConstIterator<FCE_SimpleDestructibleProcessView_FoliageISM> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_SimpleDestructibleProcessView_FoliageISM& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ClientJob_ProcessSimpleDestructibleView_FoliageISM(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        FECSWorldPtr local_4_3 = this.GetECSWorld();
        MarkModifiedIfDirty local_78;
        local_78.opCall(local_12);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ProcessSimpleDestructibleView_FoliageISkM() const
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
        TECSEventConstIterator<FCE_SimpleDestructibleProcessView_FoliageISkM> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_SimpleDestructibleProcessView_FoliageISkM& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ClientJob_ProcessSimpleDestructibleView_FoliageISkM(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        FECSWorldPtr local_4_3 = this.GetECSWorld();
        MarkModifiedIfDirty local_78;
        local_78.opCall(local_12);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ProcessSimpleDestructibleView_StaticMesh() const
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
        TECSEventConstIterator<FCE_SimpleDestructibleProcessView_StaticMesh> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_SimpleDestructibleProcessView_StaticMesh& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ClientJob_ProcessSimpleDestructibleView_StaticMesh(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        FECSWorldPtr local_4_3 = this.GetECSWorld();
        MarkModifiedIfDirty local_78;
        local_78.opCall(local_12);
        return;
    }
    UFUNCTION()
    void Run_Monitor_ClientConnectUpdateSimpleDestructibleStates() const
    {
        int local_24 = 0;
        ECS::GetContextJob();
        if (ECSInternal::GetMonitorSingletonOnAssign(this.GetECSWorld(), FCS_SimpleDestructibleManager, EECSRegType(0), false, true).bIsMonitored)
        {
            this.Monitor_ClientConnectUpdateSimpleDestructibleStates(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ClientSyncSimpleDestructibleStates() const
    {
        int local_24 = 0;
        ECS::GetContextJob();
        if (ECSInternal::GetMonitorSingletonOnModify(this.GetECSWorld(), FCS_SimpleDestructibleManager, EECSRegType(0), false, true).bIsMonitored)
        {
            this.Monitor_ClientSyncSimpleDestructibleStates(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleLevelAddedToWorld() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_SimpleDestructibleLevelAddedToWorld> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_SimpleDestructibleLevelAddedToWorld& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleLevelAddedToWorld(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleLevelRemovedFromWorld() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_SimpleDestructibleLevelRemovedFromWorld> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_SimpleDestructibleLevelRemovedFromWorld& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleLevelRemovedFromWorld(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ReconcileSimpleDestructibleStreaming() const
    {
        int local_24 = 0;
        ECS::GetContextJob();
        if (ECSInternal::GetMonitorSingletonOnModify(this.GetECSWorld(), FCS_SimpleDestructibleStreamingSignal, EECSRegType(0), false, true).bIsMonitored)
        {
            this.Monitor_ReconcileSimpleDestructibleStreaming(local_24);
        }
        return;
    }
}


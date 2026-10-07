

class US_EcologyBehaviorSystem : UECSScriptSystem
{
    US_EcologyBehaviorSystem()
    {
        return;
    }
    bool CheckChangeAreaTaskCondition(FFlockChangeAreaTaskInstance &inout Instance, const FChangeAreaTaskConditionContext &inout Context) const
    {
        UCommonChangeAreaTriggerDefinitionAsset local_6;
        if (!(Instance.IsValid()))
        {
            return false;
        }
        if ((local_6.bTriggerOnce && (int(Instance.SuccessCount) > 0)))
        {
            return false;
        }
        return local_6.IsConditionalTrue(Context);
    }
    void UpdateChangeAreaTrigger(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, FC_EcologyFlockBehaviorComponent &inout BehaviorComponent, const FC_EcologyFlockComponent &inout FlockComponent) const
    {
        UCommonChangeAreaTriggerDefinitionAsset local_50;
        UCommonChangeAreaTriggerDefinitionAsset local_56;
        if (!(FECSEntity(FlockComponent.LeaderEntity)))
        {
            return;
        }
        if (BehaviorComponent.ChangeAreaTriggers.Num() <= 0)
        {
            XLog(ELog(30), FString().Append("[ChangeArea]: UpdateChangeAreaTrigger Failed --> Entity: ").Append(Entity).Append(" ChangeAreaTriggers <= 0"));
            return;
        }
        FChangeAreaTaskConditionContext local_26;
        local_26.Setup(Entity, FixedTime, BehaviorComponent, FlockComponent);
        for (auto& local_40 : BehaviorComponent.ChangeAreaTriggers)
        {
            if (((FFPTime(FixedTime.Time) - local_40.LastTriggerTime).ToSeconds()) < local_50.TriggerCD)
            {
                continue;
            }
            if (this.CheckChangeAreaTaskCondition(local_40, local_26))
            {
                UResourceRequestFilterConfigAsset local_58;
                ::FEcologyBehaviorUtils::AddFlockChangeAreaRequest(Entity, local_58.Filter, local_56.ReasonTag, FEcologyGameplayTagDefine::Ecology_ChangeAreaSource_Common, local_56.bUseNearestCombatRegionPolicy, local_56.MessageInfo, local_56.CombatRegionPolicyRadiusLayer1, local_56.CombatRegionPolicyRadiusLayer2, int(local_56.Priority), local_56.bNeedChangeAreaMessage, local_56.bForceUpdateTargetResource);
                ++local_40.SuccessCount;
                local_40.LastTriggerTime = FixedTime.Time;
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnInitEcologyPlanerConfig(const FECSEntity &inout Entity, const FC_EcologyHTNPlanerConfig &inout Config) const
    {
        Config.Setup(Entity);
        return;
    }
    UFUNCTION()
    void Job_UpdateFlockSlotData(const FECSEntity &inout Entity, const FC_EcologyFlockComponent &inout FlockComponent, const FC_EcologyFlockBehaviorComponent &inout BehaviorComponent) const
    {
        ::FEcologyBehaviorUtils::AllocateChildSlotData(Entity, false, 1.0f);
        Remove local_6;
        local_6.opCall();
        return;
    }
    UFUNCTION()
    void Job_UpdateFlockSubTask(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, const FC_EcologyFlockBehaviorComponent &inout BehaviorComponent) const
    {
        int local_18 = 0;
        int local_32 = 0;
        FEcologyBehaviorSubTask local_2 = BehaviorComponent.BehaviorSubTask;
        FFPTime local_6 = (FFPTime(FixedTime.Time) - local_2.LastUpdateTime);
        if (local_2.bUpdatePosition)
        {
            ::FEcologyBehaviorUtils::UpdateFlockPosition(Entity);
        }
        if (local_2.bUpdateChangeAreaProgress)
        {
            FFlockChangeAreaData local_12 = BehaviorComponent.ChangeAreaData;
            if (local_18.GetPosition().DistSquared(local_12.TargetPosition) <= (local_12.ArrivalDistance * local_12.ArrivalDistance))
            {
                if (::FEcologyBehaviorUtils::CheckFlockEnableEvent(Entity, FEcologyGameplayTagDefine::Ecology_EnableFlockStateChangeEvent))
                {
                    FFPTime local_4 = FFPTime(-1);
                    local_32.FlockEntity = Entity;
                    Get local_36;
                    const FC_EcologyFlockComponent& local_38 = local_36.opCall();
                    if (local_38)
                    {
                        FECSEntity local_46 = FECSEntity(local_38.LeaderEntity);
                        if (local_46.IsValid())
                        {
                            local_32.LeaderEntity = local_46;
                            Get local_50;
                            const FC_CreatureMeta& local_52 = local_50.opCall();
                            if (local_52)
                            {
                                local_32.LeaderCreatureRowData = local_52.CreatureType;
                            }
                        }
                    }
                }
                ::FEcologyBehaviorUtils::ChangeAreaOverServerTrackHandler(Entity);
                ::FEcologyBehaviorUtils::ModifyFlockState(Entity, EFlockBehaviorState(0));
            }
        }
        return;
    }
    UFUNCTION()
    void Job_CheckCombatInChangeAreaMoveTag(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, const FC_FlockMember &inout FlockMemberComp) const
    {
        FC_EcologyFlockBehaviorComponent local_16;
        int local_26 = 0;
        FC_EcologyFlockBehaviorComponent local_34;
        if (!(FlockMemberComp))
        {
            return;
        }
        if (!(FECSEntity(FlockMemberComp.FlockProxyEntity).IsValid()))
        {
            return;
        }
        if (!(local_16))
        {
            return;
        }
        if (local_16.bIsInEmergency)
        {
            return;
        }
        FECSEntity local_10 = ::FAITargetingUtils::GetCurrentAttackTarget(Entity);
        if (!(local_10.IsValid()))
        {
            return;
        }
        if (!(local_26))
        {
            return;
        }
        if (!(::FEcologyBattleForAreaUtils::CheckTargetMonsterRank(local_10, EMonsterRank(2))))
        {
            return;
        }
        if (!(FECSEntity(local_26.FlockProxyEntity).IsValid()))
        {
            return;
        }
        if (!(local_34))
        {
            return;
        }
        if (int(local_34.MainState) == 1)
        {
            if ((::FEcologySceneInfoUtils::FindCombatRegionByEntity(Entity) == ::FEcologySceneInfoUtils::FindCombatRegionByEntity(local_10)))
            {
                FECSEntity local_46 = FECSEntity(FlockMemberComp.FlockProxyEntity);
                if (local_46.IsValid())
                {
                    XLog(ELog(30), FString().Append("[ChangeArea]: Job_CheckCombatInChangeAreaMoveTag --> Activity, Self: ").Append(Entity).Append(", Target: ").Append(local_10));
                    ::FEcologyBehaviorUtils::ChangeAreaOverServerTrackHandler(local_46);
                    ::FEcologyBehaviorUtils::ModifyFlockState(local_46, EFlockBehaviorState(0));
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateFlockIntoEmergency(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, const FC_EcologyFlockBehaviorComponent &inout BehaviorComponent) const
    {
        FECSEntity local_20 = FECSEntity(0.LeaderEntity);
        float32 local_21 = 0.0f;
        Has local_26;
        if (!(local_26.opCall()))
        {
            Has local_32;
            bool local_27 = local_32.opCall();
            if (local_27)
            {
                if (!(::FEcologyBehaviorUtils::CheckFlockIsEmergencyState(Entity)))
                {
                    ::FEcologyBehaviorUtils::ModifyFlockEmergencyState(Entity, true);
                }
            }
            return;
        }
        Get local_36;
        const FC_CombatState& local_38 = local_36.opCall();
        if (local_38)
        {
            Has local_32;
            local_21 = float32(((FFPTime(FixedTime.Time) - local_38.SelfCombatSession.EnterCombatTime).ToSeconds()));
            if (int(BehaviorComponent.MainState) == 2)
            {
                if (!(local_32.opCall()))
                {
                    FC_EnterCombatDuringChangeAreaTag local_54;
                    Assign local_52;
                    local_52.opCall(local_54);
                }
            }
        }
        if (local_21 > 20.0f)
        {
            ::FEcologyBehaviorUtils::ModifyFlockEmergencyState(Entity, true);
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateChangeAreaTrigger(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, const FC_EcologyPlaner &inout Planer, FC_EcologyFlockBehaviorComponent &inout BehaviorComponent, const FC_EcologyFlockComponent &inout FlockComponent) const
    {
        this.UpdateChangeAreaTrigger(Entity, FixedTime, BehaviorComponent, FlockComponent);
        return;
    }
    UFUNCTION()
    void Job_CreatureChangeAreaHintMessageHandle(const FCE_CreatureChangeAreaHintMessage &inout Event) const
    {
        if (!(Event.MessageConfig.IsSet()))
        {
            return;
        }
        for (auto& local_16 : Event.PlayerEntityList)
        {
            TArray<FTextArgument> local_20;
            Make local_26;
            local_20.Add(local_26.opImplConv());
            ::MessageHintUtils::ShowMessageHint(local_16, Event.MessageConfig, local_20);
        }
        return;
    }
    UFUNCTION()
    void Job_CreatureForceUpdateChangeAreaHandle(const FCE_CreatureForceUpdateChangeArea &inout Event) const
    {
        if (!(Event.FlockEntity.IsValid()))
        {
            return;
        }
        for (auto& local_16 : Event.ChildEntityList)
        {
            if (!(FECSEntity(local_16).IsValid()))
            {
                continue;
            }
            Modify local_28;
            FC_CreatureEcologyState& local_30 = local_28.opCall();
            if (local_30)
            {
                local_30.bForceUpdateTargetResource = true;
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateFlockCurrentResourceState(const FECSEntity &inout Entity, FC_EcologyFlockComponent &inout FlockComponent) const
    {
        Remove local_4;
        local_4.opCall();
        FECSEntityId local_6 = FlockComponent.ActivityTarget.MainTargetResource;
        if ((local_6 == ENTITY_ID_NULL))
        {
            return;
        }
        if (this.CheckResIsSuitableForFlock(Entity, FlockComponent, local_6))
        {
            return;
        }
        ::FEcologyBehaviorUtils::FlockClaimNewResource(Entity, ENTITY_NULL, true);
        FResourceRequestFilterConfig local_82;
        local_82.SearchRadius = 0;
        local_82.bUseRequesterPosition = true;
        local_82.bUseEntitySpawnerVolume = true;
        local_82.bUseRequesterEcologyInfo = true;
        FChangeAreaMessageInfo local_110;
        ::FEcologyBehaviorUtils::AddFlockChangeAreaRequest(Entity, local_82, FEcologyGameplayTagDefine::Ecology_ChangeAreaReason_MissResource, FEcologyGameplayTagDefine::Ecology_ChangeAreaSource_Common, false, local_110, 25000.0f, 50000.0f, 0, false, false);
        return;
    }
    bool CheckResIsSuitableForFlock(const FECSEntity &inout FlockEntity, FC_EcologyFlockComponent &inout FlockComponent, const FECSEntityId &inout ResourceId) const
    {
        bool local_9;
        FECSEntity local_4 = FECSEntity(ResourceId);
        if (!(local_4))
        {
            return false;
        }
        if (!(local_4.IsActive()))
        {
            local_9 = true;
        }
        else
        {
            Has local_14;
            local_9 = local_14.opCall();
        }
        if (local_9)
        {
            return false;
        }
        return true;
    }
    UFUNCTION()
    void Job_FlockReAllocateRequestNotify(const FCE_NeedReAllocateBehaviorRequest &inout Event) const
    {
        if (!(Event.Entity.IsValid()))
        {
            return;
        }
        if (!(Event.FlockEntity.IsValid()))
        {
            return;
        }
        ::FEcologyBehaviorUtils::InterruptFlockHTNByTag(Event.FlockEntity.GetId(), FEcologyGameplayTagDefine::Ecology_InterruptActivityForReAllocate);
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnInitEcologyPlanerConfig_DefaultReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyHTNPlanerConfigOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_OnInitEcologyPlanerConfig(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnInitEcologyPlanerConfig_LocalReg() const
    {
        int local_48 = 0;
        int local_54 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        FECSMonitorRuntimeView local_14 = ::__GetMonitorEcologyHTNPlanerConfigOnAssignView(this.GetECSWorld(), EECSRegType(2), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_52 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor_OnInitEcologyPlanerConfig(local_48, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateFlockSlotData_StaticReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_178 = 0;
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
                this.Job_UpdateFlockSlotData(local_38, local_40, local_46);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Exclude(local_88).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_106 = 0;
        FECSRuntimeViewIterator local_140 = local_88.Iterator();
        for (; local_140.CanProceed;)
        {
            local_38 = local_140.Proceed();
            ++local_106;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_UpdateFlockSlotData(local_178, local_40, local_46);
        }
        local_4.UpdateCachedEntityCount(local_106);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateFlockSlotData_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_178 = 0;
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
                this.Job_UpdateFlockSlotData(local_38, local_40, local_46);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Exclude(local_88).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_106 = 0;
        FECSRuntimeViewIterator local_140 = local_88.Iterator();
        for (; local_140.CanProceed;)
        {
            local_38 = local_140.Proceed();
            ++local_106;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_UpdateFlockSlotData(local_178, local_40, local_46);
        }
        local_4.UpdateCachedEntityCount(local_106);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateFlockSlotData_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_178 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 2;
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
                this.Job_UpdateFlockSlotData(local_38, local_40, local_46);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Exclude(local_88).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_106 = 0;
        FECSRuntimeViewIterator local_140 = local_88.Iterator();
        for (; local_140.CanProceed;)
        {
            local_38 = local_140.Proceed();
            ++local_106;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_UpdateFlockSlotData(local_178, local_40, local_46);
        }
        local_4.UpdateCachedEntityCount(local_106);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateFlockSubTask_StaticReg() const
    {
        int local_12 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_176 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1.0))))
        {
            return;
        }
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_15 = 1;
        int local_14 = local_15;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_18 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_22 = local_4.GetViewCacheEntities();
            int local_23 = 0;
            for (auto& local_38 : local_22)
            {
                local_38;
                FECSEntity local_42;
                if (!(local_42.IsValid()))
                {
                    continue;
                }
                ++local_23;
                FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42);
                this.Job_UpdateFlockSubTask(local_46, local_12, local_48);
            }
            local_4.UpdateCachedEntityCount(local_23);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Exclude(local_90).opCall();
        bool local_13 = local_4.BeginViewCacheBuild();
        int local_24 = local_4.GetViewCacheEpoch();
        int local_104 = 0;
        FECSRuntimeViewIterator local_138 = local_90.Iterator();
        for (; local_138.CanProceed;)
        {
            local_46 = local_138.Proceed();
            ++local_104;
            if (local_13)
            {
                local_4.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.Job_UpdateFlockSubTask(local_176, local_12, local_48);
        }
        local_4.UpdateCachedEntityCount(local_104);
        if (local_13)
        {
            local_4.CommitViewCacheBuild(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateFlockSubTask_DefaultReg() const
    {
        int local_12 = 0;
        const FECSEntity& local_44;
        int local_46 = 0;
        int local_174 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1.0))))
        {
            return;
        }
        int local_14 = 0;
        int local_13 = local_14;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_16 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_20 = local_4.GetViewCacheEntities();
            int local_21 = 0;
            for (auto& local_36 : local_20)
            {
                local_36;
                FECSEntity local_40;
                if (!(local_40.IsValid()))
                {
                    continue;
                }
                ++local_21;
                FECSEntityScopeCycleCounter local_41 = FECSEntityScopeCycleCounter(local_40);
                this.Job_UpdateFlockSubTask(local_44, local_12, local_46);
            }
            local_4.UpdateCachedEntityCount(local_21);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_22 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_88.Iterator();
        for (; local_136.CanProceed;)
        {
            local_44 = local_136.Proceed();
            ++local_102;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_44.GetId());
            }
            FECSEntityScopeCycleCounter local_41_2 = FECSEntityScopeCycleCounter(local_44);
            this.Job_UpdateFlockSubTask(local_174, local_12, local_46);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_22);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateFlockSubTask_LocalReg() const
    {
        int local_12 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_176 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1.0))))
        {
            return;
        }
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_15 = 2;
        int local_14 = local_15;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_18 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_22 = local_4.GetViewCacheEntities();
            int local_23 = 0;
            for (auto& local_38 : local_22)
            {
                local_38;
                FECSEntity local_42;
                if (!(local_42.IsValid()))
                {
                    continue;
                }
                ++local_23;
                FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42);
                this.Job_UpdateFlockSubTask(local_46, local_12, local_48);
            }
            local_4.UpdateCachedEntityCount(local_23);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Exclude(local_90).opCall();
        bool local_13 = local_4.BeginViewCacheBuild();
        int local_24 = local_4.GetViewCacheEpoch();
        int local_104 = 0;
        FECSRuntimeViewIterator local_138 = local_90.Iterator();
        for (; local_138.CanProceed;)
        {
            local_46 = local_138.Proceed();
            ++local_104;
            if (local_13)
            {
                local_4.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.Job_UpdateFlockSubTask(local_176, local_12, local_48);
        }
        local_4.UpdateCachedEntityCount(local_104);
        if (local_13)
        {
            local_4.CommitViewCacheBuild(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CheckCombatInChangeAreaMoveTag_StaticReg() const
    {
        int local_12 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_180 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1.0))))
        {
            return;
        }
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_15 = 1;
        int local_14 = local_15;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_18 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_22 = local_4.GetViewCacheEntities();
            int local_23 = 0;
            for (auto& local_38 : local_22)
            {
                local_38;
                FECSEntity local_42;
                if (!(local_42.IsValid()))
                {
                    continue;
                }
                ++local_23;
                FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42);
                this.Job_CheckCombatInChangeAreaMoveTag(local_46, local_12, local_48);
            }
            local_4.UpdateCachedEntityCount(local_23);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Exclude(local_90).opCall();
        bool local_13 = local_4.BeginViewCacheBuild();
        int local_24 = local_4.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_90.Iterator();
        for (; local_142.CanProceed;)
        {
            local_46 = local_142.Proceed();
            ++local_108;
            if (local_13)
            {
                local_4.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.Job_CheckCombatInChangeAreaMoveTag(local_180, local_12, local_48);
        }
        local_4.UpdateCachedEntityCount(local_108);
        if (local_13)
        {
            local_4.CommitViewCacheBuild(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CheckCombatInChangeAreaMoveTag_DefaultReg() const
    {
        int local_12 = 0;
        const FECSEntity& local_44;
        int local_46 = 0;
        int local_178 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1.0))))
        {
            return;
        }
        int local_14 = 0;
        int local_13 = local_14;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_16 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_20 = local_4.GetViewCacheEntities();
            int local_21 = 0;
            for (auto& local_36 : local_20)
            {
                local_36;
                FECSEntity local_40;
                if (!(local_40.IsValid()))
                {
                    continue;
                }
                ++local_21;
                FECSEntityScopeCycleCounter local_41 = FECSEntityScopeCycleCounter(local_40);
                this.Job_CheckCombatInChangeAreaMoveTag(local_44, local_12, local_46);
            }
            local_4.UpdateCachedEntityCount(local_21);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_22 = local_4.GetViewCacheEpoch();
        int local_106 = 0;
        FECSRuntimeViewIterator local_140 = local_88.Iterator();
        for (; local_140.CanProceed;)
        {
            local_44 = local_140.Proceed();
            ++local_106;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_44.GetId());
            }
            FECSEntityScopeCycleCounter local_41_2 = FECSEntityScopeCycleCounter(local_44);
            this.Job_CheckCombatInChangeAreaMoveTag(local_178, local_12, local_46);
        }
        local_4.UpdateCachedEntityCount(local_106);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_22);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CheckCombatInChangeAreaMoveTag_LocalReg() const
    {
        int local_12 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_180 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1.0))))
        {
            return;
        }
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_15 = 2;
        int local_14 = local_15;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_18 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_22 = local_4.GetViewCacheEntities();
            int local_23 = 0;
            for (auto& local_38 : local_22)
            {
                local_38;
                FECSEntity local_42;
                if (!(local_42.IsValid()))
                {
                    continue;
                }
                ++local_23;
                FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42);
                this.Job_CheckCombatInChangeAreaMoveTag(local_46, local_12, local_48);
            }
            local_4.UpdateCachedEntityCount(local_23);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Exclude(local_90).opCall();
        bool local_13 = local_4.BeginViewCacheBuild();
        int local_24 = local_4.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_90.Iterator();
        for (; local_142.CanProceed;)
        {
            local_46 = local_142.Proceed();
            ++local_108;
            if (local_13)
            {
                local_4.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.Job_CheckCombatInChangeAreaMoveTag(local_180, local_12, local_48);
        }
        local_4.UpdateCachedEntityCount(local_108);
        if (local_13)
        {
            local_4.CommitViewCacheBuild(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateFlockIntoEmergency_StaticReg() const
    {
        int local_12 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_176 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1.0))))
        {
            return;
        }
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_15 = 1;
        int local_14 = local_15;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_18 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_22 = local_4.GetViewCacheEntities();
            int local_23 = 0;
            for (auto& local_38 : local_22)
            {
                local_38;
                FECSEntity local_42;
                if (!(local_42.IsValid()))
                {
                    continue;
                }
                ++local_23;
                FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42);
                this.Job_UpdateFlockIntoEmergency(local_46, local_12, local_48);
            }
            local_4.UpdateCachedEntityCount(local_23);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Exclude(local_90).opCall();
        bool local_13 = local_4.BeginViewCacheBuild();
        int local_24 = local_4.GetViewCacheEpoch();
        int local_104 = 0;
        FECSRuntimeViewIterator local_138 = local_90.Iterator();
        for (; local_138.CanProceed;)
        {
            local_46 = local_138.Proceed();
            ++local_104;
            if (local_13)
            {
                local_4.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.Job_UpdateFlockIntoEmergency(local_176, local_12, local_48);
        }
        local_4.UpdateCachedEntityCount(local_104);
        if (local_13)
        {
            local_4.CommitViewCacheBuild(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateFlockIntoEmergency_DefaultReg() const
    {
        int local_12 = 0;
        const FECSEntity& local_44;
        int local_46 = 0;
        int local_174 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1.0))))
        {
            return;
        }
        int local_14 = 0;
        int local_13 = local_14;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_16 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_20 = local_4.GetViewCacheEntities();
            int local_21 = 0;
            for (auto& local_36 : local_20)
            {
                local_36;
                FECSEntity local_40;
                if (!(local_40.IsValid()))
                {
                    continue;
                }
                ++local_21;
                FECSEntityScopeCycleCounter local_41 = FECSEntityScopeCycleCounter(local_40);
                this.Job_UpdateFlockIntoEmergency(local_44, local_12, local_46);
            }
            local_4.UpdateCachedEntityCount(local_21);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_22 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_88.Iterator();
        for (; local_136.CanProceed;)
        {
            local_44 = local_136.Proceed();
            ++local_102;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_44.GetId());
            }
            FECSEntityScopeCycleCounter local_41_2 = FECSEntityScopeCycleCounter(local_44);
            this.Job_UpdateFlockIntoEmergency(local_174, local_12, local_46);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_22);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateFlockIntoEmergency_LocalReg() const
    {
        int local_12 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_176 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1.0))))
        {
            return;
        }
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_15 = 2;
        int local_14 = local_15;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_18 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_22 = local_4.GetViewCacheEntities();
            int local_23 = 0;
            for (auto& local_38 : local_22)
            {
                local_38;
                FECSEntity local_42;
                if (!(local_42.IsValid()))
                {
                    continue;
                }
                ++local_23;
                FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42);
                this.Job_UpdateFlockIntoEmergency(local_46, local_12, local_48);
            }
            local_4.UpdateCachedEntityCount(local_23);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Exclude(local_90).opCall();
        bool local_13 = local_4.BeginViewCacheBuild();
        int local_24 = local_4.GetViewCacheEpoch();
        int local_104 = 0;
        FECSRuntimeViewIterator local_138 = local_90.Iterator();
        for (; local_138.CanProceed;)
        {
            local_46 = local_138.Proceed();
            ++local_104;
            if (local_13)
            {
                local_4.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.Job_UpdateFlockIntoEmergency(local_176, local_12, local_48);
        }
        local_4.UpdateCachedEntityCount(local_104);
        if (local_13)
        {
            local_4.CommitViewCacheBuild(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateChangeAreaTrigger_DefaultReg() const
    {
        int local_12 = 0;
        const FECSEntity& local_44;
        int local_46 = 0;
        int local_52 = 0;
        int local_58 = 0;
        MarkModifiedIfDirty local_66;
        int local_202 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1.0))))
        {
            return;
        }
        int local_14 = 0;
        int local_13 = local_14;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_16 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_20 = local_4.GetViewCacheEntities();
            int local_21 = 0;
            for (auto& local_36 : local_20)
            {
                local_36;
                FECSEntity local_40;
                if (!(local_40.IsValid()))
                {
                    continue;
                }
                ++local_21;
                FECSEntityScopeCycleCounter local_41 = FECSEntityScopeCycleCounter(local_40);
                this.Job_UpdateChangeAreaTrigger(local_44, local_12, local_46, local_52, local_58);
                local_66.opCall(local_52);
            }
            local_4.UpdateCachedEntityCount(local_21);
            return;
        }
        FECSRuntimeView local_104 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Include local_116;
        local_116.opCall();
        Include local_120;
        local_120.opCall();
        Exclude(local_104).opCall();
        Exclude(local_104).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_22 = local_4.GetViewCacheEpoch();
        int local_130 = 0;
        FECSRuntimeViewIterator local_164 = local_104.Iterator();
        for (; local_164.CanProceed;)
        {
            local_44 = local_164.Proceed();
            ++local_130;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_44.GetId());
            }
            FECSEntityScopeCycleCounter local_41_2 = FECSEntityScopeCycleCounter(local_44);
            FECSEntity::ModifyAndMarkDirtyManually<FC_EcologyFlockBehaviorComponent> local_56 = FECSEntity::ModifyAndMarkDirtyManually<FC_EcologyFlockBehaviorComponent>(local_44);
            this.Job_UpdateChangeAreaTrigger(local_202, local_12, local_46, local_52, local_58);
            local_66.opCall(local_52);
        }
        local_4.UpdateCachedEntityCount(local_130);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_22);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateChangeAreaTrigger_LocalReg() const
    {
        int local_12 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        MarkModifiedIfDirty local_68;
        int local_204 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1.0))))
        {
            return;
        }
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_15 = 2;
        int local_14 = local_15;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_18 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_22 = local_4.GetViewCacheEntities();
            int local_23 = 0;
            for (auto& local_38 : local_22)
            {
                local_38;
                FECSEntity local_42;
                if (!(local_42.IsValid()))
                {
                    continue;
                }
                ++local_23;
                FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42);
                this.Job_UpdateChangeAreaTrigger(local_46, local_12, local_48, local_54, local_60);
                local_68.opCall(local_54);
            }
            local_4.UpdateCachedEntityCount(local_23);
            return;
        }
        FECSRuntimeView local_106 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Exclude(local_106).opCall();
        Exclude(local_106).opCall();
        bool local_13 = local_4.BeginViewCacheBuild();
        int local_24 = local_4.GetViewCacheEpoch();
        int local_132 = 0;
        FECSRuntimeViewIterator local_166 = local_106.Iterator();
        for (; local_166.CanProceed;)
        {
            local_46 = local_166.Proceed();
            ++local_132;
            if (local_13)
            {
                local_4.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.Job_UpdateChangeAreaTrigger(local_204, local_12, local_48, local_54, local_60);
            local_68.opCall(local_54);
        }
        local_4.UpdateCachedEntityCount(local_132);
        if (local_13)
        {
            local_4.CommitViewCacheBuild(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CreatureChangeAreaHintMessageHandle() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_CreatureChangeAreaHintMessage> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_CreatureChangeAreaHintMessage& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_CreatureChangeAreaHintMessageHandle(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CreatureForceUpdateChangeAreaHandle() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_CreatureForceUpdateChangeArea> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_CreatureForceUpdateChangeArea& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_CreatureForceUpdateChangeAreaHandle(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateFlockCurrentResourceState_StaticReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        MarkModifiedIfDirty local_48;
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
                this.Job_UpdateFlockCurrentResourceState(local_38, local_40);
                local_48.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Exclude(local_86).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_100 = 0;
        FECSRuntimeViewIterator local_134 = local_86.Iterator();
        for (; local_134.CanProceed;)
        {
            local_38 = local_134.Proceed();
            ++local_100;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_UpdateFlockCurrentResourceState(local_172, local_40);
            local_48.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_100);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateFlockCurrentResourceState_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        MarkModifiedIfDirty local_48;
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
                this.Job_UpdateFlockCurrentResourceState(local_38, local_40);
                local_48.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Exclude(local_86).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_100 = 0;
        FECSRuntimeViewIterator local_134 = local_86.Iterator();
        for (; local_134.CanProceed;)
        {
            local_38 = local_134.Proceed();
            ++local_100;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_UpdateFlockCurrentResourceState(local_172, local_40);
            local_48.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_100);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateFlockCurrentResourceState_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        MarkModifiedIfDirty local_48;
        int local_172 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_8 = 2;
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
                this.Job_UpdateFlockCurrentResourceState(local_38, local_40);
                local_48.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Exclude(local_86).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_100 = 0;
        FECSRuntimeViewIterator local_134 = local_86.Iterator();
        for (; local_134.CanProceed;)
        {
            local_38 = local_134.Proceed();
            ++local_100;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_UpdateFlockCurrentResourceState(local_172, local_40);
            local_48.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_100);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_FlockReAllocateRequestNotify() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_NeedReAllocateBehaviorRequest> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_NeedReAllocateBehaviorRequest& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_FlockReAllocateRequestNotify(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}


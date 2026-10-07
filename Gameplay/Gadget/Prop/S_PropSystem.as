

class US_PropSystem : UECSScriptSystem
{
    US_PropSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_PropLifeTime(const FECSEntity &inout Entity, const FC_LifeTime &inout LifeTime, const FCS_FixedTime &inout FixedTime) const
    {
        Get local_6;
        FFPTime local_8 = FProjectileTimeUtils::GetEndTime(LifeTime, local_6.opCall());
        if (local_8.opCmp(FixedTime.LastTime) <= 0)
        {
            ::FLifeCycleUtils::EntityDeath(Entity, Entity.GetId(), FixedTime.Time, true, true, false, true, EDeathReason(0));
        }
        return;
    }
    UFUNCTION()
    void Job_PostTickTrackMovement(const FECSEntity &inout Entity, const FC_Owner &inout OwnerComp, FC_TrackRuntime &inout Track, const FCS_FixedTime &inout FixedTime, const FC_PropTrackOwner &inout PropTrackOwner) const
    {
        if (Track.GetbTrackSuccess())
        {
            if (PropTrackOwner.OwnerSkillConfig != nullptr)
            {
                int local_11 = FSkillUtils::GetSkillIndex(OwnerComp.GetOwnerEntity(), PropTrackOwner.OwnerSkillConfig);
                if (local_11 != -1)
                {
                    FC_EASAbilityInstance& local_14 = FSkillUtils::TryGetSkillAbilityInstance(OwnerComp.GetOwnerEntity(), local_11);
                    if (local_14)
                    {
                        FAbilityUtils::InvokeSignal(local_14, OwnerComp.GetOwnerEntity(), PropTrackOwner.SignalName, FixedTime.Time, true);
                    }
                }
            }
            if (this.GetECSRuntime().IsServer)
            {
                ::FLifeCycleUtils::EntityDeath(Entity, Entity.GetId(), FixedTime.Time, true, true, false, true, EDeathReason(0));
            }
        }
        return;
    }
    UFUNCTION()
    void Job_OutOfDistanceRecycle(const FECSEntity &inout Entity, const FC_Prop &inout PropComp, const FC_Owner &inout OwnerComp, const FCS_FixedTime &inout FixedTime) const
    {
        GetDefaulted local_28;
        bool local_1 = PropComp.bHasSpawnRecycleDis;
        if (!(local_1))
        {
            local_1 = false;
        }
        else
        {
            local_1 = PropComp.SpawnConfig;
        }
        if (local_1)
        {
            bool local_3;
            local_3 = false;
            FECSEntity local_8 = FECSEntity(OwnerComp.GetOwnerEntity());
            if (local_8.IsValid())
            {
                FVector local_18;
                Get local_22;
                const FC_PlayerController& local_24 = local_22.opCall();
                if (local_24)
                {
                    if (local_24.GetPlayerPawnEntity().IsValid())
                    {
                        local_18 = local_28.opCall().GetPosition();
                    }
                }
                else
                {
                    local_18 = local_28.opCall().GetPosition();
                }
                Get local_32;
                if (local_32.opCall().GetPosition().DistSquared(local_18) > (PropComp.SpawnRecycleDis * PropComp.SpawnRecycleDis))
                {
                    FNameHandle_EntityBBVarInt local_40;
                    local_8.SetBB_Int(local_40, (local_8.GetBB_Int(local_40) - 1));
                    TArray<FTextArgument> local_50;
                    ::MessageHintUtils::ShowMessageHint(local_8, PropComp.HintConfig, local_50);
                }
            }
            else
            {
                local_3 = true;
            }
            if (local_3)
            {
                ::FLifeCycleUtils::EntityDeath(Entity, Entity.GetId(), FixedTime.Time, true, true, false, true, EDeathReason(0));
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdatePropActive(const FECSEntity &inout Entity, const FC_Prop &inout Prop, const FC_Owner &inout OwnerComp) const
    {
        if (Prop.bActiveWithOwner)
        {
            if (OwnerComp.GetOwnerEntity().IsValid())
            {
                Entity.SetActive(OwnerComp.GetOwnerEntity().IsActive(), FFPTime(-1));
            }
        }
        return;
    }
    UFUNCTION()
    void Job_DispatchPropDestroy(FCE_DeathEvent &inout Event) const
    {
        int local_130 = 0;
        bool local_163;
        int local_178 = 0;
        if (!(Event.Sender.IsValid()))
        {
            return;
        }
        Get local_6;
        const FC_PropDeathConfig& local_8 = local_6.opCall();
        if (local_8)
        {
            if (!(local_8.DeadFx.GetAsset().IsNull()))
            {
                FFXConfig local_124 = local_8.DeadFx;
                local_124.SetbUseWorldOriginAsBaseTransformSource(true);
                local_124.SetLocationOffsetSpace(EFXOffsetSpace(2));
                local_124.SetRotationOffsetSpace(EFXOffsetSpace(2));
                local_124.SetbDetach(true);
                local_124.SetLocationOffset((FVector(local_130.GetPosition()) + local_130.GetRotation().RotateVector(local_8.DeadFx.GetLocationOffset())));
                local_124.SetRotationOffset((local_130.GetRotation().Rotator() + local_8.DeadFx.GetRotationOffset()));
                FECSEntity local_168 = ECSFX::PlayFXInstant(Event.Sender, local_124, Event.Time, 1.0f, true, true);
            }
            bool local_1 = ECS::GetRuntimeInfo().IsServer;
            if (local_1)
            {
                FECSEntity local_168_2 = FECSEntity(Event.KilledByEntity);
                if (!(local_168_2))
                {
                    local_163 = false;
                }
                else
                {
                    local_163 = local_178;
                }
                if (!(local_163))
                {
                    local_1 = false;
                }
                else
                {
                    local_1 = local_8.bAddBuffToPlayerWhenKilledByPlayer;
                }
                if (local_1)
                {
                    ::PropAddBuffToPlayerUtils::TriggerEntityAddBuffListByBuffTag(local_168_2, Event.Sender, local_8.bIncludeDefaultBuffConfigs, local_8.BuffTagNames.SelectedNames);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_ManipulatedPropStartOverHeatCoolDownTimer(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, FC_ManipulatedPropStartOverHeatCoolDownTimer &inout Timer) const
    {
        if (FFPTime(FixedTime.Time).opCmp(Timer.TargetWorldTime) >= 0)
        {
            Remove local_8;
            local_8.opCall();
            FC_ManipulatedPropOverHeatCoolDownTag local_14;
            Assign local_12;
            local_12.opCall(local_14);
        }
        return;
    }
    UFUNCTION()
    void Job_ManipulatedPropOverHeatCoolDown(const FECSEntity &inout Entity, FC_ManipulateProp &inout ManipulatedProp, const FCS_FixedTime &inout FixedTime) const
    {
        ManipulatedProp.SetHeatValue(ManipulatedProp.GetHeatValue() - (ManipulatedProp.GetOverHeatCoolDownSpeed() * float32(FixedTime.DeltaTime.ToSeconds())));
        ManipulatedProp.SetHeatValue(FMath::Clamp(ManipulatedProp.GetHeatValue(), 0.0f, ManipulatedProp.GetHeatValueMax()));
        if (ManipulatedProp.GetHeatValue() <= 0.0f)
        {
            ManipulatedProp.SetHeatValue(0.0f);
            ManipulatedProp.SetbIsOverHeat(false);
            Modify local_12;
            FC_ManipulateProp& local_14 = local_12.opCall();
            if (local_14)
            {
                local_14.SetbIsOverHeat(false);
            }
            Remove local_18;
            local_18.opCall();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_PropLifeTime() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_174 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_PropLifeTime(local_40, local_42, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
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
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_84.Iterator();
        for (; local_136.CanProceed;)
        {
            local_40 = local_136.Proceed();
            ++local_102;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_PropLifeTime(local_174, local_42, local_6);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_PostTickTrackMovement() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        MarkModifiedIfDirty local_62;
        int local_198 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_PostTickTrackMovement(local_40, local_42, local_48, local_6, local_54);
                local_62.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_100 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Include local_116;
        local_116.opCall();
        Include local_120;
        local_120.opCall();
        Exclude(local_100).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_126 = 0;
        FECSRuntimeViewIterator local_160 = local_100.Iterator();
        for (; local_160.CanProceed;)
        {
            local_40 = local_160.Proceed();
            ++local_126;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_PostTickTrackMovement(local_198, local_42, local_48, local_6, local_54);
            local_62.opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_126);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_OutOfDistanceRecycle() const
    {
        int local_10 = 0;
        const FECSEntity& local_42;
        int local_44 = 0;
        int local_50 = 0;
        int local_186 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1))))
        {
            return;
        }
        int local_12 = 0;
        int local_11 = local_12;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_14 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_18 = local_4.GetViewCacheEntities();
            int local_19 = 0;
            for (auto& local_34 : local_18)
            {
                local_34;
                FECSEntity local_38;
                if (!(local_38.IsValid()))
                {
                    continue;
                }
                ++local_19;
                FECSEntityScopeCycleCounter local_39 = FECSEntityScopeCycleCounter(local_38);
                this.Job_OutOfDistanceRecycle(local_42, local_44, local_50, local_10);
            }
            local_4.UpdateCachedEntityCount(local_19);
            return;
        }
        FECSRuntimeView local_92 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Exclude(local_92).opCall();
        Exclude(local_92).opCall();
        bool local_8 = local_4.BeginViewCacheBuild();
        int local_7 = local_4.GetViewCacheEpoch();
        int local_114 = 0;
        FECSRuntimeViewIterator local_148 = local_92.Iterator();
        for (; local_148.CanProceed;)
        {
            local_42 = local_148.Proceed();
            ++local_114;
            if (local_8)
            {
                local_4.AddViewCacheEntity(local_42.GetId());
            }
            FECSEntityScopeCycleCounter local_39_2 = FECSEntityScopeCycleCounter(local_42);
            this.Job_OutOfDistanceRecycle(local_186, local_44, local_50, local_10);
        }
        local_4.UpdateCachedEntityCount(local_114);
        if (local_8)
        {
            local_4.CommitViewCacheBuild(local_7);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdatePropActive() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_172 = 0;
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
                this.Job_UpdatePropActive(local_36, local_38, local_44);
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
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_100 = 0;
        FECSRuntimeViewIterator local_134 = local_86.Iterator();
        for (; local_134.CanProceed;)
        {
            local_36 = local_134.Proceed();
            ++local_100;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_UpdatePropActive(local_172, local_38, local_44);
        }
        local_2.UpdateCachedEntityCount(local_100);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchPropDestroy() const
    {
        ECS::GetContextJob();
        TECSEventIterator<FCE_DeathEvent> local_36 = FECSWorldPtr::PatchEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            FCE_DeathEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchPropDestroy(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    void Monitor___JobTimer_Pre___Job_ManipulatedPropStartOverHeatCoolDownTimer(const FC_ManipulatedPropStartOverHeatCoolDownTimer &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.TargetWorldTime;
        FName local_8 = FName("S_PropSystem::Job_ManipulatedPropStartOverHeatCoolDownTimer");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___Job_ManipulatedPropStartOverHeatCoolDownTimer(const FC_ManipulatedPropStartOverHeatCoolDownTimer &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.TargetWorldTime;
        FName local_8 = FName("S_PropSystem::Job_ManipulatedPropStartOverHeatCoolDownTimer");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___Job_ManipulatedPropStartOverHeatCoolDownTimer() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorManipulatedPropStartOverHeatCoolDownTimerOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___Job_ManipulatedPropStartOverHeatCoolDownTimer(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorManipulatedPropStartOverHeatCoolDownTimerOnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___Job_ManipulatedPropStartOverHeatCoolDownTimer(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___Job_ManipulatedPropStartOverHeatCoolDownTimer() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorManipulatedPropStartOverHeatCoolDownTimerOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___Job_ManipulatedPropStartOverHeatCoolDownTimer(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorManipulatedPropStartOverHeatCoolDownTimerOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___Job_ManipulatedPropStartOverHeatCoolDownTimer(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ManipulatedPropStartOverHeatCoolDownTimer() const
    {
        int local_6 = 0;
        int local_42 = 0;
        int local_50 = 0;
        int local_52 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        local_4.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_14 = local_4.GetExternalEntityList();
        FECSEntity local_32;
        for (auto& local_28 : local_14)
        {
            local_28;
            FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
            bool local_11 = false;
            bool local_35 = !(false);
            if (!(local_32.IsActive()) == local_35)
            {
                continue;
            }
            if (!(local_42))
            {
                continue;
            }
            FFPTime local_44 = local_42.TargetWorldTime;
            if (local_44.opCmp(0.0) < 0 || (local_42.TargetWorldTime == FPTIME_MAX))
            {
                continue;
            }
            if (local_11)
            {
                continue;
            }
            this.Job_ManipulatedPropStartOverHeatCoolDownTimer(local_50, local_6, local_52);
            MarkModifiedIfDirty local_60;
            local_60.opCall(local_52);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    UFUNCTION()
    void Run_Job_ManipulatedPropOverHeatCoolDown() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_174 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_ManipulatedPropOverHeatCoolDown(local_40, local_42, local_6);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_88.Iterator();
        for (; local_136.CanProceed;)
        {
            local_40 = local_136.Proceed();
            ++local_102;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_ManipulatedPropOverHeatCoolDown(local_174, local_42, local_6);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
}


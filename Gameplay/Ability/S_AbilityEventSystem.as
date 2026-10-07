

class US_AbilityEventSystem : UECSScriptSystem
{
    US_AbilityEventSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_DispatchOnAbilityCustomInteractEvent(const FCE_OnAbilityCustomInteract &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DipatchHitOhterEvent(const FECSEntity &inout Entity, const FC_DealDamageFrame &inout DealDamage, const FCS_FixedTime &inout FixedTime) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DipatchBeingHitEvent(const FECSEntity &inout Entity, const FC_TakeDamageToCalculateFrame &inout TakeDamage, const FCS_FixedTime &inout FixedTime) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DipatchDealDamageCalculatedEvent(const FECSEntity &inout Entity, const FC_DealDamageFrame &inout DealDamage, const FCS_FixedTime &inout FixedTime) const
    {
        for (auto& local_16 : DealDamage.DamageToApply)
        {
            FAbilityDamageCalculatedEventData local_22;
            local_22.DamageTarget = local_16.DamageTarget;
            local_22.DamageIndex = int(local_16.DamageToApplyIndex);
        }
        return;
    }
    UFUNCTION()
    void Job_DipatchTakeDamageCalculatedEvent(const FECSEntity &inout Entity, const FC_DamageToApplyFrame &inout DamageToApply, const FCS_FixedTime &inout FixedTime) const
    {
        int local_3 = 0;
        int local_1 = 0;
        while (local_1 < local_3)
        {
            FAbilityDamageCalculatedEventData local_10;
            local_10.DamageTarget = Entity;
            local_10.DamageIndex = local_1;
            ++local_1;
            local_3 = DamageToApply.Datas.Num();
        }
        return;
    }
    UFUNCTION()
    void Job_DipatchDamageResolvedEvent(const FCE_DamageEvent &inout DamageEvent) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DispatchHitStateEvent(const FCE_HitStateChanged &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DispatchDodgeSuccessEvent(const FCE_InvincibleCounterEvent &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DispatchPerfectDodgeEvent(const FCE_PerfectDodgeEvent &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DispatchGuardHitEvent(const FCE_GuardHitEvent &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DispatchDeathResistanceHPChangeEvent(const FCE_DeathResistanceHPChangeEvent &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DispatchCharacterDeathEvent(const FCE_DeathEvent &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DispatchKillAbilityEvents(const FCE_DeathEvent &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DispatchCharacterRebornEvent(const FCE_Reborn &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DispatchCharacterNearDeathEvent(const FCE_NearDeathEvent &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DispatchCharacterRescuedFromNearDeathEvent(const FCE_RescuedFromNearDeathEvent &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DispatchBodyPartDestroyEvent(const FCE_BodyPartDestroyEvent &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DispatchPreFireProjectile(const FCE_CharacterFireProjectile &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DispatchPostFireProjectile(const FCE_CharacterFireProjectile &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DispatchAbilityDelayEvent(const FCE_AbilityDelayEvent &inout Event) const
    {
        bool local_1;
        int local_18 = 0;
        Has local_6;
        if (!(Event.Receiver.IsValid()) || !(local_6.opCall()))
        {
            local_1 = true;
        }
        else
        {
            Has local_12;
            local_1 = local_12.opCall();
        }
        if (local_1)
        {
            return;
        }
        if (local_18)
        {
            int local_19 = FAbilityUtils::GetAbilityIndex(Event.Receiver, Event.AbilityName);
            if (local_19 != -1)
            {
                FAbilityUtils::InvokeSignal(local_18.ModifyAbilityInstance(local_19), Event.Receiver, Event.SignalName, Event.Time, Event.bAbilityPredictable);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_DispatchAbilityDelayEventByClass(const FCE_AbilityDelayEventByClass &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void ServerJob_DispatchEntityExitWeather(const FCE_EntityExitWeather &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void ServerJob_DispatchPlayerControllerExitWeather(const FCE_PlayerControllerExitWeather &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void ServerJob_DispatchEntityEnterWeather(const FCE_EntityEnterWeather &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void ServerJob_DispatchPlayerControllerEnterWeather(const FCE_PlayerControllerEnterWeather &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void ServerJob_DispatchPlayerControllerBeginOverlap(const FCE_PlayerControllerBeginOverlap &inout Event) const
    {
        FECSEntity local_4 = FECSEntity(Event.OverlappingEntity);
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        return;
    }
    UFUNCTION()
    void ServerJob_DispatchPlayerControllerEndOverlap(const FCE_PlayerControllerEndOverlap &inout Event) const
    {
        FECSEntity local_4 = FECSEntity(Event.OverlappingEntity);
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        return;
    }
    UFUNCTION()
    void Job_DispatchPlayerSwitchSuccess(const FCE_PlayerSwitchSuccess &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DispatchShieldActivate(const FCE_ShieldActivateEvent &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DispatchShieldDeactivate(const FCE_ShieldActivateEvent &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DispatchShieldBroken(const FCE_ShieldBrokenEvent &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DispatchShieldDestroy(const FCE_ShieldDestroyEvent &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DispatchMutualClash(const FCE_MutualClashEvent &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DispatchMutualClashAttributeConsume(const FCE_MutualClashAttributeConsumeEvent &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DispatchMutualClashPlayerBeHitFromNoRangeEvent(const FCE_MutualClashPlayerBeHitFromNoRangeEvent &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DispatchDefenseHit(const FCE_DefenseHitEvent &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DispatchOnLaserEndPointHitUnit(const FCE_LaserEndPointHitUnitEvent &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DispatchEnvBreakablePropDeadEvent(const FCE_EnvBreakablePropDeadEvent &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DispatchEnvBreakablePropPhaseChangedEvent(const FCE_EnvBreakablePropPhaseChangedEvent &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DispatchHealOtherEvent(const FCE_HealOtherEvent &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DispatchSummon(const FCE_SummonEvent &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DispatchInitFakeCharacterEvent(const FCE_InitFakeCharacterEvent &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_ConsumeCombatItemEvent(const FCE_ConsumeCombatItemEvent &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DispatchBuffAddedEvent(const FCE_BuffAddedEvent &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DispatchBuffRemovedEvent(const FCE_BuffRemovedEvent &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DispatchTriggerLockHPEvent(const FCE_TriggerLockHPEvent &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DispatchSkillTransitCompleteEvent(const FCE_SkillTransitComplete &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DispatchOnBeginMount(const FCE_OnBeginMount &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_DispatchOnEndMount(const FCE_OnEndMount &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Run_Job_DispatchOnAbilityCustomInteractEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_OnAbilityCustomInteract> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_OnAbilityCustomInteract& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchOnAbilityCustomInteractEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DipatchHitOhterEvent() const
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
                this.Job_DipatchHitOhterEvent(local_40, local_42, local_6);
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
            this.Job_DipatchHitOhterEvent(local_174, local_42, local_6);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DipatchBeingHitEvent() const
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
                this.Job_DipatchBeingHitEvent(local_40, local_42, local_6);
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
            this.Job_DipatchBeingHitEvent(local_174, local_42, local_6);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DipatchDealDamageCalculatedEvent() const
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
                this.Job_DipatchDealDamageCalculatedEvent(local_40, local_42, local_6);
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
            this.Job_DipatchDealDamageCalculatedEvent(local_174, local_42, local_6);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DipatchTakeDamageCalculatedEvent() const
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
                this.Job_DipatchTakeDamageCalculatedEvent(local_40, local_42, local_6);
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
            this.Job_DipatchTakeDamageCalculatedEvent(local_174, local_42, local_6);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DipatchDamageResolvedEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DamageEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DamageEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DipatchDamageResolvedEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchHitStateEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_HitStateChanged> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_HitStateChanged& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchHitStateEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchDodgeSuccessEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_InvincibleCounterEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_InvincibleCounterEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchDodgeSuccessEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchPerfectDodgeEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PerfectDodgeEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PerfectDodgeEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchPerfectDodgeEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchGuardHitEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_GuardHitEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_GuardHitEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchGuardHitEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchDeathResistanceHPChangeEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DeathResistanceHPChangeEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DeathResistanceHPChangeEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchDeathResistanceHPChangeEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchCharacterDeathEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DeathEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DeathEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchCharacterDeathEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchKillAbilityEvents() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DeathEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DeathEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchKillAbilityEvents(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchCharacterRebornEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_Reborn> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_Reborn& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchCharacterRebornEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchCharacterNearDeathEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_NearDeathEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_NearDeathEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchCharacterNearDeathEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchCharacterRescuedFromNearDeathEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_RescuedFromNearDeathEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_RescuedFromNearDeathEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchCharacterRescuedFromNearDeathEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchBodyPartDestroyEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_BodyPartDestroyEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_BodyPartDestroyEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchBodyPartDestroyEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchPreFireProjectile() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_CharacterFireProjectile> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_CharacterFireProjectile& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchPreFireProjectile(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchPostFireProjectile() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_CharacterFireProjectile> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_CharacterFireProjectile& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchPostFireProjectile(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchAbilityDelayEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_AbilityDelayEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_AbilityDelayEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchAbilityDelayEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchAbilityDelayEventByClass() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_AbilityDelayEventByClass> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_AbilityDelayEventByClass& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchAbilityDelayEventByClass(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DispatchEntityExitWeather() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EntityExitWeather> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EntityExitWeather& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_DispatchEntityExitWeather(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DispatchPlayerControllerExitWeather() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerControllerExitWeather> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayerControllerExitWeather& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_DispatchPlayerControllerExitWeather(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DispatchEntityEnterWeather() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EntityEnterWeather> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EntityEnterWeather& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_DispatchEntityEnterWeather(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DispatchPlayerControllerEnterWeather() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerControllerEnterWeather> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayerControllerEnterWeather& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_DispatchPlayerControllerEnterWeather(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DispatchPlayerControllerBeginOverlap() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerControllerBeginOverlap> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayerControllerBeginOverlap& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_DispatchPlayerControllerBeginOverlap(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DispatchPlayerControllerEndOverlap() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerControllerEndOverlap> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayerControllerEndOverlap& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_DispatchPlayerControllerEndOverlap(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchPlayerSwitchSuccess() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerSwitchSuccess> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayerSwitchSuccess& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchPlayerSwitchSuccess(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchShieldActivate() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ShieldActivateEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ShieldActivateEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchShieldActivate(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchShieldDeactivate() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ShieldActivateEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ShieldActivateEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchShieldDeactivate(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchShieldBroken() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ShieldBrokenEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ShieldBrokenEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchShieldBroken(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchShieldDestroy() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ShieldDestroyEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ShieldDestroyEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchShieldDestroy(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchMutualClash() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_MutualClashEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_MutualClashEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchMutualClash(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchMutualClashAttributeConsume() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_MutualClashAttributeConsumeEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_MutualClashAttributeConsumeEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchMutualClashAttributeConsume(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchMutualClashPlayerBeHitFromNoRangeEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_MutualClashPlayerBeHitFromNoRangeEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_MutualClashPlayerBeHitFromNoRangeEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchMutualClashPlayerBeHitFromNoRangeEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchDefenseHit() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DefenseHitEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DefenseHitEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchDefenseHit(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchOnLaserEndPointHitUnit() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_LaserEndPointHitUnitEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_LaserEndPointHitUnitEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchOnLaserEndPointHitUnit(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchEnvBreakablePropDeadEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EnvBreakablePropDeadEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EnvBreakablePropDeadEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchEnvBreakablePropDeadEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchEnvBreakablePropPhaseChangedEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EnvBreakablePropPhaseChangedEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EnvBreakablePropPhaseChangedEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchEnvBreakablePropPhaseChangedEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchHealOtherEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_HealOtherEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_HealOtherEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchHealOtherEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchSummon() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_SummonEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_SummonEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchSummon(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchInitFakeCharacterEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_InitFakeCharacterEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_InitFakeCharacterEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchInitFakeCharacterEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ConsumeCombatItemEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ConsumeCombatItemEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ConsumeCombatItemEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_ConsumeCombatItemEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchBuffAddedEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_BuffAddedEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_BuffAddedEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchBuffAddedEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchBuffRemovedEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_BuffRemovedEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_BuffRemovedEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchBuffRemovedEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchTriggerLockHPEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_TriggerLockHPEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_TriggerLockHPEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchTriggerLockHPEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchSkillTransitCompleteEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_SkillTransitComplete> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_SkillTransitComplete& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchSkillTransitCompleteEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchOnBeginMount() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_OnBeginMount> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_OnBeginMount& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchOnBeginMount(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchOnEndMount() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_OnEndMount> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_OnEndMount& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_DispatchOnEndMount(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

namespace AbilityEventLibrary
{
UFUNCTION()
void AbilityDelayEventByName(const FECSEntityAdapter &inout Receiver, const float32 DelaySeconds, const FName &inout AbilityName, const FName &inout Signal)
{
    FFPTime local_16 = (FFPTime(Receiver.GetWorld().GetFixedTime().Time) + FFPTime(DelaySeconds));
    SendEvent local_6;
    FCE_AbilityDelayEvent& local_2 = local_6.opCall(local_16);
    if (local_2)
    {
        local_2.Receiver = Receiver.opImplConv();
        local_2.AbilityName = AbilityName;
        local_2.SignalName = Signal;
        local_2.bAbilityPredictable = UEASAbility::GetContextAbility().GetPredictable();
    }
    return;
}
UFUNCTION()
void AbilityDelayEvent(const FECSEntityAdapter &inout Receiver, const float32 DelaySeconds, const USkillConfig Config, const FName &inout Signal)
{
    if (Config == nullptr)
    {
        return;
    }
    AbilityEventLibrary::AbilityDelayEventByName(Receiver, DelaySeconds, Config.GetSkillName(), Signal);
    return;
}
UFUNCTION()
void AbilityDelayEventByClass(const FECSEntityAdapter &inout Receiver, const float32 DelaySeconds, const TSubclassOf<UEASAbility> &inout Ability, const FName &inout Signal)
{
    if ((!(!((Ability == nullptr)))))
    {
        return;
    }
    FCE_AbilityDelayEventByClass& local_4 = FECSEntityAdapter::SendEvent<FCE_AbilityDelayEventByClass>(Receiver).opCall((FFPTime(Receiver.GetWorld().GetFixedTime().Time) + FFPTime(DelaySeconds)));
    if (local_4)
    {
        local_4.Receiver = Receiver.opImplConv();
        local_4.AbilityClass = Ability;
        local_4.SignalName = Signal;
        local_4.bAbilityPredictable = UEASAbility::GetContextAbility().GetPredictable();
    }
    return;
}
UFUNCTION()
void AbilityDelayEventBySelf(const FECSEntityAdapter &inout Receiver, const float32 DelaySeconds, const UEASAbility Ability, const FName &inout Signal)
{
    if ((!((Ability != nullptr))))
    {
        return;
    }
    AbilityEventLibrary::AbilityDelayEventByClass(Receiver, DelaySeconds, TSubclassOf<UEASAbility>(Ability.GetClass()), Signal);
    return;
}
UFUNCTION()
FCE_HitEvent GetHitEvent(const UEASAbility Ability, const FAbilityHitEventContextData &inout Data)
{
    FCE_HitEvent __r;
    FECSWorldPtr local_4 = Ability.GetECSWorld();
    if (FECSWorldPtr::GetEvent(local_4).opCall(Data.HitEventId))
    {
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
FCE_DamageEvent GetDamageEvent(const UEASAbility Ability, const FAbilityHitEventContextData &inout Data)
{
    FCE_DamageEvent __r;
    return __r;
}
UFUNCTION()
void SetDefended(const UEASAbility Ability, const FAbilityHitEventContextData &inout Data, const bool bDefended)
{
    FECSWorldPtr local_4 = Ability.GetECSWorld();
    FECSWorldPtr::PatchEvent(local_4);
    FCE_HitEvent local_2;
    local_2.bDefended = bDefended;
    return;
}
}

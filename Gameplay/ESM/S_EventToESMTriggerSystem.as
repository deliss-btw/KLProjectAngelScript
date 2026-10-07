

class US_EventToESMTriggerSystem : UECSScriptSystem
{
    US_EventToESMTriggerSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_TriggerBeginOverlapESMTrigger(const FCE_BeginOverlap &inout Event) const
    {
        int local_12 = 0;
        int local_18 = 0;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (local_4.IsValid())
        {
            if (!(!(local_12)) && local_18)
            {
                int local_20 = 0;
                for (; local_20 < 8; ++local_20)
                {
                    int local_22 = (1 << local_20) & local_18.GetActivatedIndexMask();
                    if (local_22 != 0 && (local_20 < local_12.BeginOverlapFilter.Num()))
                    {
                        const FEventToESMTriggerFilterConfigItem_BeginOverlap& local_28 = local_12.BeginOverlapFilter[local_20];
                        if (local_28.EvaluateAndTrigger(Event, local_4))
                        {
                            break;
                        }
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_TriggerCustomInteractESMTrigger(const FCE_OnAbilityCustomInteract &inout Event) const
    {
        int local_12 = 0;
        int local_18 = 0;
        FECSEntity local_4 = Event.InteractTarget;
        if (local_4.IsValid())
        {
            if (!(!(local_12)) && local_18)
            {
                int local_20 = 0;
                for (; local_20 < 8; ++local_20)
                {
                    int local_22 = (1 << local_20) & local_18.GetActivatedIndexMask();
                    if (local_22 != 0 && (local_20 < local_12.CustomInteractFilter.Num()))
                    {
                        const FEventToESMTriggerFilterConfigItem_CustomInteract& local_28 = local_12.CustomInteractFilter[local_20];
                        if (local_28.EvaluateAndTrigger(Event, local_4))
                        {
                            break;
                        }
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_TriggerOnTakeDamageESMTrigger(const FCE_DamageEvent &inout Event) const
    {
        bool local_9;
        bool local_10;
        int local_20 = 0;
        int local_26 = 0;
        if (int(Event.DamageProcedureType) != 0)
        {
            local_10 = false;
        }
        else
        {
            Has local_8;
            if (local_8.opCall())
            {
                local_9 = true;
            }
            else
            {
                local_9 = local_8.opCall();
            }
            local_10 = local_9;
        }
        if (local_10)
        {
            FECSEntity local_14 = Event.Receiver;
            if (local_14.IsValid())
            {
                if (!(!(local_20)) && local_26)
                {
                    int local_27 = 0;
                    for (; local_27 < 8; ++local_27)
                    {
                        int local_3 = (1 << local_27) & local_26.GetActivatedIndexMask();
                        if (local_3 != 0 && (local_27 < local_20.OnTakeDamageFilter.Num()))
                        {
                            const FEventToESMTriggerFilterConfigItem_OnTakeDamage& local_32 = local_20.OnTakeDamageFilter[local_27];
                            if (local_32.EvaluateAndTrigger(Event, local_14))
                            {
                                break;
                            }
                        }
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_TriggerOnBeingHitESMTrigger(const FCE_HitEvent &inout Event) const
    {
        Has local_4;
        bool local_5;
        int local_16 = 0;
        int local_22 = 0;
        if (local_4.opCall())
        {
            local_5 = true;
        }
        else
        {
            local_5 = local_4.opCall();
        }
        if (local_5)
        {
            FECSEntity local_10 = Event.Receiver;
            if (local_10.IsValid())
            {
                if (!(local_16))
                {
                    local_5 = false;
                }
                else
                {
                    local_5 = local_22;
                }
                if (local_5)
                {
                    int local_23 = 0;
                    for (; local_23 < 8; ++local_23)
                    {
                        int local_25 = (1 << local_23) & local_22.GetActivatedIndexMask();
                        if (local_25 != 0 && (local_23 < local_16.OnBeingHitFilter.Num()))
                        {
                            const FEventToESMTriggerFilterConfigItem_OnBeingHit& local_30 = local_16.OnBeingHitFilter[local_23];
                            if (local_30.EvaluateAndTrigger(Event, local_10))
                            {
                                break;
                            }
                        }
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_TriggerEnvBreakablePropDead(const FCE_EnvBreakablePropDeadEvent &inout Event) const
    {
        FNameHandle_ESMBBTrigger local_6;
        local_6.Name = FName("EnvBreakableProp.Dead");
        Has local_12;
        bool local_13 = local_12.opCall();
        if (local_13)
        {
            ::FESMUtils::ActivateESMTrigger(Event.Sender, local_6, 0.1f);
        }
        return;
    }
    UFUNCTION()
    void Job_TriggerEnvBreakablePropPhaseChanged(const FCE_EnvBreakablePropPhaseChangedEvent &inout Event) const
    {
        FNameHandle_ESMBBTrigger local_6;
        FNameHandle_ESMBBTrigger local_12;
        FNameHandle_ESMBBTrigger local_18;
        FNameHandle_ESMBBTrigger local_24;
        FNameHandle_ESMBBTrigger local_30;
        local_6.Name = FName("EnvBreakableProp.PhaseChanged.ChangedToPhase0");
        local_12.Name = FName("EnvBreakableProp.PhaseChanged.ChangedToPhase1");
        local_18.Name = FName("EnvBreakableProp.PhaseChanged.ChangedToPhase2");
        local_24.Name = FName("EnvBreakableProp.PhaseChanged.ChangedToPhase3");
        local_30.Name = FName("EnvBreakableProp.PhaseChanged.ChangedToPhase4");
        Has local_36;
        bool local_37 = local_36.opCall();
        if (local_37)
        {
            if (int(Event.NewPhase) == 0)
            {
                ::FESMUtils::ActivateESMTrigger(Event.Sender, local_6, 0.1f);
            }
            else
            {
                if (int(Event.NewPhase) == 1)
                {
                    ::FESMUtils::ActivateESMTrigger(Event.Sender, local_12, 0.1f);
                }
                else
                {
                    if (int(Event.NewPhase) == 2)
                    {
                        ::FESMUtils::ActivateESMTrigger(Event.Sender, local_18, 0.1f);
                    }
                    else
                    {
                        if (int(Event.NewPhase) == 3)
                        {
                            ::FESMUtils::ActivateESMTrigger(Event.Sender, local_24, 0.1f);
                        }
                        else
                        {
                            if (int(Event.NewPhase) == 4)
                            {
                                ::FESMUtils::ActivateESMTrigger(Event.Sender, local_30, 0.1f);
                            }
                            else
                            {
                            }
                        }
                    }
                }
            }
        }
        return;
    }
    void UpdateEcologyState() const
    {
        bool local_49;
        int local_156 = 0;
        int local_162 = 0;
        int local_168 = 0;
        FECSEntity local_4 = FECSEntity(ECS::GetECSWorld(), ENTITY_ID_NULL);
        FECSRuntimeQuery local_92 = FECSRuntimeQueryHelper::MakeRuntimeQuery(local_4, EECSQueryRegsitryType(1), false);
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        FECSRuntimeQueryIterator local_126 = local_92.Iterator();
        for (; local_126.CanProceed;)
        {
            const FECSEntity& local_150 = local_126.Proceed();
            if (!(local_156))
            {
                local_49 = false;
            }
            else
            {
                local_49 = local_162;
            }
            if (!(!(local_49)) && local_168)
            {
                int local_171 = 0;
                for (; local_171 < 8; ++local_171)
                {
                    int local_173 = (1 << local_171) & local_162.GetActivatedIndexMask();
                    if (local_173 != 0 && (local_171 < local_156.PropEcologyEventFilter.Num()))
                    {
                        const FEventToESMTriggerFilterConfigItem_PropEcologyEvent& local_178 = local_156.PropEcologyEventFilter[local_171];
                        if (local_178.EvaluateAndTrigger(local_150, true))
                        {
                            break;
                        }
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleTimeSegmentChanged(const FCE_EcologyTimeSegmentsChangedEvent &inout Event) const
    {
        this.UpdateEcologyState();
        return;
    }
    UFUNCTION()
    void ServerJob_HandleWeatherChanged(const FCE_RegionWeatherChanged &inout Event) const
    {
        this.UpdateEcologyState();
        return;
    }
    UFUNCTION()
    void ServerJob_InitPropEcologyState(const FECSEntity &inout Entity) const
    {
        int local_6 = 0;
        int local_12 = 0;
        int local_18 = 0;
        Remove local_34;
        if (!(!(local_6)) && local_18)
        {
            if (local_12)
            {
                int local_21 = 0;
                for (; local_21 < 8; ++local_21)
                {
                    int local_23 = (1 << local_21) & local_12.GetActivatedIndexMask();
                    if (local_23 != 0 && (local_21 < local_6.PropEcologyEventFilter.Num()))
                    {
                        bool local_29;
                        const FEventToESMTriggerFilterConfigItem_PropEcologyEvent& local_28 = local_6.PropEcologyEventFilter[local_21];
                        local_29 = true;
                        if (local_28.EvaluateAndTrigger(Entity, local_29))
                        {
                            if (local_29)
                            {
                                local_34.opCall();
                            }
                            break;
                        }
                    }
                }
                return;
            }
            local_34.opCall();
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleGlobalLevelEvent(const FCE_CustomLevelEvent &inout Event) const
    {
        bool local_49;
        int local_156 = 0;
        int local_162 = 0;
        int local_168 = 0;
        FECSEntity local_4 = FECSEntity(ECS::GetECSWorld(), ENTITY_ID_NULL);
        FECSRuntimeQuery local_92 = FECSRuntimeQueryHelper::MakeRuntimeQuery(local_4, EECSQueryRegsitryType(1), false);
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        FECSRuntimeQueryIterator local_126 = local_92.Iterator();
        for (; local_126.CanProceed;)
        {
            const FECSEntity& local_150 = local_126.Proceed();
            if (!(local_156))
            {
                local_49 = false;
            }
            else
            {
                local_49 = local_162;
            }
            if (!(!(local_49)) && local_168)
            {
                int local_171 = 0;
                for (; local_171 < 8; ++local_171)
                {
                    int local_173 = (1 << local_171) & local_162.GetActivatedIndexMask();
                    if (local_173 != 0 && (local_171 < local_156.GlobalLevelEventFilter.Num()))
                    {
                        const FEventToESMTriggerFilterConfigItem_GlobalLevelEvent& local_178 = local_156.GlobalLevelEventFilter[local_171];
                        if (local_178.EvaluateAndTrigger(Event, local_150))
                        {
                            break;
                        }
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleDeath(const FCE_DeathEvent &inout Event) const
    {
        int local_12 = 0;
        int local_18 = 0;
        int local_24 = 0;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        bool local_5 = !(local_4.IsValid());
        if (local_5)
        {
            return;
        }
        if (!(local_12))
        {
            local_5 = false;
        }
        else
        {
            local_5 = local_18;
        }
        if (!(!(local_5)) && local_24)
        {
            int local_27 = 0;
            for (; local_27 < 8; ++local_27)
            {
                int local_29 = (1 << local_27) & local_18.GetActivatedIndexMask();
                if (local_29 != 0 && (local_27 < local_12.DeathEventFilter.Num()))
                {
                    const FEventToESMTriggerFilterConfigItem_DeathEvent& local_34 = local_12.DeathEventFilter[local_27];
                    if (local_34.EvaluateAndTrigger(Event, local_4))
                    {
                        break;
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_TriggerGameAttributeChangedESMTrigger(const FECSEntity &inout Entity, const FC_GameAttributeChanged &inout GameAttributeChanged) const
    {
        int local_6 = 0;
        int local_12 = 0;
        int local_18 = 0;
        int local_24 = 0;
        bool local_25;
        bool local_26;
        if (!(local_6))
        {
            local_25 = false;
        }
        else
        {
            local_25 = local_12;
        }
        if (!(local_25))
        {
            local_26 = false;
        }
        else
        {
            local_26 = local_18;
        }
        if (!(local_26))
        {
            local_25 = false;
        }
        else
        {
            local_25 = local_24;
        }
        if (local_25)
        {
            int local_29 = 0;
            for (; local_29 < 8; ++local_29)
            {
                int local_31 = (1 << local_29) & local_12.GetActivatedIndexMask();
                if (local_31 != 0 && (local_29 < local_6.GameAttributeChangedEventToESMTriggerFilter.Num()))
                {
                    const FEventToESMTriggerFilterConfigItem_GameAttributeChanged& local_36 = local_6.GameAttributeChangedEventToESMTriggerFilter[local_29];
                    if (local_36.EvaluateAndTrigger(Entity, local_18, GameAttributeChanged))
                    {
                        break;
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TriggerBeginOverlapESMTrigger() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_BeginOverlap> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_BeginOverlap& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_TriggerBeginOverlapESMTrigger(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TriggerCustomInteractESMTrigger() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_OnAbilityCustomInteract> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_OnAbilityCustomInteract& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_TriggerCustomInteractESMTrigger(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TriggerOnTakeDamageESMTrigger() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DamageEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DamageEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_TriggerOnTakeDamageESMTrigger(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TriggerOnBeingHitESMTrigger() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_HitEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_HitEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_TriggerOnBeingHitESMTrigger(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TriggerEnvBreakablePropDead() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EnvBreakablePropDeadEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EnvBreakablePropDeadEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_TriggerEnvBreakablePropDead(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TriggerEnvBreakablePropPhaseChanged() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EnvBreakablePropPhaseChangedEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EnvBreakablePropPhaseChangedEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_TriggerEnvBreakablePropPhaseChanged(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleTimeSegmentChanged() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EcologyTimeSegmentsChangedEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EcologyTimeSegmentsChangedEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleTimeSegmentChanged(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleWeatherChanged() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_RegionWeatherChanged> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_RegionWeatherChanged& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleWeatherChanged(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_InitPropEcologyState() const
    {
        const FECSEntity& local_42;
        int local_162 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(0.5))))
        {
            return;
        }
        int local_11 = 0;
        int local_10 = local_11;
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
                this.ServerJob_InitPropEcologyState(local_42);
            }
            local_4.UpdateCachedEntityCount(local_19);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Exclude(local_80).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_20 = local_4.GetViewCacheEpoch();
        int local_90 = 0;
        FECSRuntimeViewIterator local_124 = local_80.Iterator();
        for (; local_124.CanProceed;)
        {
            local_42 = local_124.Proceed();
            ++local_90;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_42.GetId());
            }
            FECSEntityScopeCycleCounter local_39_2 = FECSEntityScopeCycleCounter(local_42);
            this.ServerJob_InitPropEcologyState(local_162);
        }
        local_4.UpdateCachedEntityCount(local_90);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_20);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleGlobalLevelEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_CustomLevelEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_CustomLevelEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleGlobalLevelEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleDeath() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DeathEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DeathEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleDeath(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TriggerGameAttributeChangedESMTrigger() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_166 = 0;
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
                this.ServerJob_TriggerGameAttributeChangedESMTrigger(local_36, local_38);
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
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_80.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ServerJob_TriggerGameAttributeChangedESMTrigger(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}


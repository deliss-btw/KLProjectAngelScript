
const FConsoleVariable CVar_AudioVo_PrintOnScreen = FConsoleVariable();
const FConsoleVariable CVar_AudioVo_DebugLog = FConsoleVariable();
const FConsoleVariable CVar_AudioVo_DebugC1 = FConsoleVariable();
const FConsoleVariable CVar_AudioVo_DebugC2 = FConsoleVariable();

class US_GameAudioVoSystem : UECSScriptSystem
{
    US_GameAudioVoSystem()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return true;
    }
    UFUNCTION()
    void Job_InitAudioSystem() const
    {
        return;
    }
    UFUNCTION()
    void Job_UnInitAudioSystem() const
    {
        return;
    }
    UFUNCTION()
    void Monitor_EntityBBChangeRecord(const FECSEntity &inout Entity, const FC_EntityBBChangeRecord &inout EntityBBChangeRecord) const
    {
        if (::FASCommonUtils::IsBossPrefab(Entity))
        {
            Modify local_6;
            local_6.opCall().AddListen(n"iPhase", EEntityBBChangeListenerType(1));
        }
        return;
    }
    UFUNCTION()
    void Job_TeammateUltimateHit(const FCE_SkillHitAudioVo &inout Event, const FCS_LocalTime &inout LocalTime) const
    {
        FECSEntity local_4 = FECSEntity(Event.Sender);
        FECSEntity local_12 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
        if (::FASCommonUtils::IsAvatarPrefab(local_4) == false)
        {
            return;
        }
        FECSEntity local_16 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
        FECSEntity local_26 = Event.Attacker;
        FECSEntity local_30 = Event.Receiver;
        FECSEntity local_34 = Event.Encourager;
        FString local_50;
        if (local_34.IsValid())
        {
            local_50 = local_34.ToString();
        }
        else
        {
            local_50 = FString().Append("ENTITY_NULL");
        }
        if (local_34.IsValid())
        {
            if (CVar_AudioVo_PrintOnScreen.GetBool())
            {
                Print(FString().Append("Job_TeammateUltimateHit, Encourager:").Append(local_50).Append(" Encourage Teammate ").Append(local_26).Append(" Hit Target ").Append(local_30).Append(", AttackCategory :").Append(Event.AttackCategory).Append(", Time").Append(Event.Time).Append(", Frame:").Append(Event.CreatedFrame), 5.0f, FLinearColor::LucBlue);
            }
            ::FAudioVoUtils::SendAudioVoEventOnlyPresentation(n"Battle_UltraHit_Others_Any", local_34, (FFPTime(LocalTime.Time) + FFPTime(1)));
        }
        return;
    }
    UFUNCTION()
    void Job_HandleAbnormalStateEvent(const FCE_AbnormalStateEvent &inout Event) const
    {
        if (CVar_AudioVo_PrintOnScreen.GetBool())
        {
            Print(FString().Append("Job_HandleAbnormalStateEvent AbnormalState: ").Append(Event.AbnormalState), 60.0f, FLinearColor::LucBlue);
        }
        if (int(Event.AbnormalState) == 1)
        {
            if (::FASCommonUtils::IsAvatarPrefab(Event.Caster))
            {
                if (::FASCommonUtils::IsBossPrefab(Event.Receiver))
                {
                    ::FAudioVoUtils::SendAudioVoEventOnlyPresentation(n"Monster_Common_Status_Ignited", Event.Caster, FFPTime(-1));
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_HandleHealHpEvent(const FCE_HealHpAudioVo &inout Event) const
    {
        FECSEntity local_4 = FECSEntity(Event.Sender);
        FECSEntity local_8 = Event.FromEntity;
        if (Event.HealHp <= 0.0f)
        {
            return;
        }
        bool local_11 = !(::FASCommonUtils::IsAvatarPrefab(local_4));
        bool local_12 = !(false);
        local_11 = local_11 == local_12 || (local_8 == local_4);
        if (local_11)
        {
            return;
        }
        if (CVar_AudioVo_PrintOnScreen.GetBool())
        {
            Print(FString().Append("Job_HandleHealHpEvent, EntityBeHealed:").Append(local_4).Append(" Be Healed by Healer ").Append(local_8), 600.0f, FLinearColor::LucBlue);
        }
        ::FAudioVoUtils::SendAudioVoEventOnlyPresentation(n"Battle_BeHeal_Self", local_4, FFPTime(-1));
        return;
    }
    UFUNCTION()
    void Job_HandleHitStateChanged(const FCE_HitStateChanged &inout Event) const
    {
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if ((Event.ToHitState == n"HitStagger"))
        {
            if (::FASCommonUtils::IsAvatarPrefab(Event.Attacker))
            {
                if (::FASCommonUtils::IsBossPrefab(local_4))
                {
                    if (CVar_AudioVo_PrintOnScreen.GetBool())
                    {
                        Print(FString().Append("Job_HandleHitStateChanged, HitStateChanged: ").Append(Event.ToHitState).Append(" Attacker:").Append(Event.Attacker).Append(",Defender:").Append(local_4), 600.0f, FLinearColor::LucBlue);
                    }
                    ::FAudioVoUtils::SendAudioVoEventOnlyPresentation(n"Monster_Common_Status_Hitstun", Event.Attacker, FFPTime(-1));
                }
            }
        }
        else
        {
            if ((Event.ToHitState == n"HitBreak"))
            {
                if (::FASCommonUtils::IsAvatarPrefab(Event.Attacker))
                {
                    if (::FASCommonUtils::IsBossPrefab(local_4))
                    {
                        if (CVar_AudioVo_PrintOnScreen.GetBool())
                        {
                            Print(FString().Append("Job_HandleHitStateChanged, HitStateChanged: ").Append(Event.ToHitState).Append(" Attacker:").Append(Event.Attacker).Append(",Defender:").Append(local_4), 600.0f, FLinearColor::LucBlue);
                        }
                        ::FAudioVoUtils::SendAudioVoEventOnlyPresentation(n"Monster_Common_Status_BreakFall", Event.Attacker, FFPTime(-1));
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_HandleBodyPartDestroy(const FCE_BodyPartDestroyEvent &inout Event) const
    {
        if (CVar_AudioVo_PrintOnScreen.GetBool())
        {
            Print(FString().Append("Job_HandleBodyPartDestroy BodyPart: ").Append(Event.BodyPart).Append(", Destoryed By Entity ").Append(Event.DestroyedByEntity), 60.0f, FLinearColor::LucBlue);
        }
        FECSEntity local_12 = FECSEntity(Event.Sender);
        FECSEntity local_16 = Event.DestroyedByEntity;
        if (::FASCommonUtils::IsAvatarPrefab(Event.DestroyedByEntity))
        {
            if (::FASCommonUtils::IsBossPrefab(local_12))
            {
                ::FAudioVoUtils::SendAudioVoEventOnlyPresentation(n"Monster_Common_Status_PartBreak", local_16, FFPTime(-1));
            }
        }
        return;
    }
    UFUNCTION()
    void Job_CollectDodgeSuccessEvent(const FCE_InvincibleCounterEvent &inout Event, const FCS_FixedTime &inout FixedTime) const
    {
        FECSEntity local_8 = FECSEntity(Event.Sender);
        EInvincibleCounterType local_9 = Event.Type;
        FFPTime local_12 = FFPTime(FixedTime.Time);
        if (int(local_9) == 1)
        {
            int local_27;
            float32 local_25;
            FCS_EntityAudioVoManager local_18;
            FECSWorldPtr local_20 = ECS::GetECSWorld();
            local_25 = local_18.AccumulateDuration;
            local_27 = int(local_18.TriggerThreshold);
            FDodgeState& local_32 = local_18.DodgeStateMap.FindOrAdd(local_8.GetId());
            if (int(local_32.Count) == 0 || (local_12.opCmp(local_32.AccumulateDeadline) > 0))
            {
                local_32.Count = 1;
                local_32.AccumulateDeadline = (local_12 + FFPTime(local_25));
            }
            else
            {
                ++local_32.Count;
                local_32.AccumulateDeadline = (local_12 + FFPTime(local_25));
            }
            XLogIf(CVar_AudioVo_DebugLog.GetBool(), ELog(0), FString().Append("Job_CollectDodgeSuccessEvent, FDodgeState:Entity:").Append(local_8).Append(", DodgetCount:").Append(local_32.Count));
            if (int(local_32.Count) >= local_27)
            {
                FECSEntity local_50 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
                FECSEntity local_58 = FECSEntity(ENTITY_NULL);
                local_58 = ::FAudioVoUtils::GetDeterministicRandomTeamate(local_8, Event.Time);
                if (local_58.IsValid())
                {
                    if (CVar_AudioVo_PrintOnScreen.GetBool())
                    {
                        Print(FString().Append("Job_CollectDodgeSuccessEvent, Encourager Teamate:").Append(local_58), 5.0f, FLinearColor::LucBlue);
                    }
                    ::FAudioVoUtils::SendAudioVoEventOnlyPresentation(n"Battle_MultiDodge_Others_Any", local_58, FFPTime(-1));
                }
                if (CVar_AudioVo_PrintOnScreen.GetBool())
                {
                    Print(FString().Append("Job_CollectDodgeSuccessEvent, Dodge Successer:").Append(local_8).Append(", DodgeCount:").Append(local_32.Count), 5.0f, FLinearColor::LucBlue);
                }
                ::FAudioVoUtils::SendAudioVoEventOnlyPresentation(n"Battle_MultiDodge_Self", local_8, FFPTime(-1));
                int local_13 = 0;
                local_32.Count = local_13;
                local_32.AccumulateDeadline = 0;
            }
        }
        return;
    }
    UFUNCTION()
    void Job_CollectGPSuccessEvent(const FCE_GuardHitEvent &inout Event, const FCS_FixedTime &inout FixedTime) const
    {
        FECSEntity local_4 = FECSEntity(ENTITY_NULL);
        local_4 = ::FAudioVoUtils::GetDeterministicRandomTeamate(Event.Sender, Event.Time);
        if (local_4.IsValid())
        {
            if (CVar_AudioVo_PrintOnScreen.GetBool())
            {
                XLogIf(CVar_AudioVo_DebugLog.GetBool(), ELog(1), FString().Append("Job_CollectGPSuccessEvent, GuardInvincible Successer:").Append(Event.Sender).Append(", Encourager:").Append(local_4));
            }
            ::FAudioVoUtils::SendAudioVoEventOnlyPresentation(n"Battle_CounterAtk_Others_Any", Event.Sender, FFPTime(-1));
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateInventoryPickedUp(const FCE_InventoryAudioVo &inout Event, const FCS_LocalTime &inout LocalTime) const
    {
        const FItemConfig& local_10;
        ::FASCommonUtils::GetLocalPlayerPawnEntity();
        if (int(local_10.Rarity) < 3)
        {
            return;
        }
        if (CVar_AudioVo_PrintOnScreen.GetBool())
        {
            Print(FString().Append("Job_UpdateInventoryPickedUp, Sender").Append(Event.Sender).Append(" Getter").Append(Event.InventoryGetter).Append(" Dropper").Append(Event.InventoryDropper).Append(", Item:").Append(local_10.ItemName).Append(", Rarity:").Append(local_10.Rarity), 600.0f, FLinearColor::LucBlue);
            FECSEntity local_8;
            Print(FString().Append("Job_UpdateInventoryPickedUp, Sender").Append(Event.Sender).Append(" LocalPawnEntity").Append(local_8).Append(" }"), 600.0f, FLinearColor::LucBlue);
        }
        XLogIf(CVar_AudioVo_DebugLog.GetBool(), ELog(1), FString().Append("Job_UpdateInventoryPickedUp, MySelf").Append(Event.Sender).Append(", Getter:").Append(Event.InventoryGetter).Append(" Pickup Inventory Successed! ItemName:").Append(local_10.ItemName).Append(", Rarity:").Append(local_10.Rarity));
        if (CVar_AudioVo_PrintOnScreen.GetBool())
        {
            Print(FString().Append("Job_UpdateInventoryPickedUp, ").Append(Event.InventoryGetter).Append(" Pickup Inventory Successed! ItemName:").Append(local_10.ItemName).Append(", Rarity:").Append(local_10.Rarity), 600.0f, FLinearColor::LucBlue);
        }
        ::FAudioVoUtils::SendAudioVoEventOnlyPresentation(n"Explore_Pickup_Item_Boss_Rare_Self", Event.InventoryGetter, FFPTime(-1));
        FECSEntity local_26 = FECSEntity(ENTITY_NULL);
        local_26 = ::FAudioVoUtils::GetDeterministicRandomTeamate(Event.InventoryGetter, Event.Time);
        if (local_26.IsValid())
        {
            XLogIf(CVar_AudioVo_DebugLog.GetBool(), ELog(1), FString().Append("Job_UpdateInventoryPickedUp, Teammate").Append(Event.InventoryGetter).Append(" Pickup Inventory Successed! ItemName:").Append(local_10.ItemName).Append(", Rarity:").Append(local_10.Rarity));
            if (CVar_AudioVo_PrintOnScreen.GetBool())
            {
                Print(FString().Append("Job_UpdateInventoryPickedUp, Teammate").Append(local_26).Append(" Encourage InventoryGetter ItemName:").Append(local_10.ItemName).Append(", Rarity:").Append(local_10.Rarity), 600.0f, FLinearColor::LucBlue);
            }
            ::FAudioVoUtils::SendAudioVoEventOnlyPresentation(n"Explore_Pickup_Item_Boss_Rare_Others_Any", local_26, (FFPTime(LocalTime.Time) + FFPTime(2)));
        }
        return;
    }
    UFUNCTION()
    void Job_HandleTriggerBeHitAudioVo(const FCE_TriggerBeHitAudioVo &inout Event, const FCS_LocalTime &inout LocalTime) const
    {
        FECSEntity local_8 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
        FECSEntity local_12 = Event.Comforter;
        FString local_30;
        if (local_12.IsValid())
        {
            local_30 = local_12.ToString();
        }
        else
        {
            local_30 = FString().Append("ENTITY_NULL");
        }
        FECSEntity local_34 = Event.Attacker;
        FECSEntity local_38 = Event.Receiver;
        if ((local_8 == local_38) || ::FTeamUtils::IsInSameTeam(local_8, local_38))
        {
            if (CVar_AudioVo_PrintOnScreen.GetBool())
            {
                Print(FString().Append("Job_HandleTriggerBeHitAudioVo, MySelf ").Append(local_38).Append(" Be Hit By ").Append(local_34).Append(", Comforter:").Append(local_30).Append(", HitLevel :").Append(Event.HitLevel).Append(", Time").Append(Event.Time).Append(", Frame:").Append(Event.CreatedFrame), 5.0f, FLinearColor::LucBlue);
            }
            ::FAudioVoUtils::SendAudioVoEventOnlyPresentation(n"Battle_BeHit_H_Self", local_38, LocalTime.Time);
        }
        if (local_12.IsValid() && !((local_12 == local_8)))
        {
            if (CVar_AudioVo_PrintOnScreen.GetBool())
            {
                Print(FString().Append("Job_HandleTriggerBeHitAudioVo, Comforter:").Append(local_30).Append(" Conform  Teammate ").Append(local_38).Append(" Be Hit By ").Append(local_34).Append(", , HitLevel :").Append(Event.HitLevel).Append(", Time").Append(Event.Time).Append(", Frame:").Append(Event.CreatedFrame), 5.0f, FLinearColor::LucBlue);
            }
            ::FAudioVoUtils::SendAudioVoEventOnlyPresentation(n"Battle_BeHit_H_Others_Any", local_12, (FFPTime(LocalTime.Time) + FFPTime(1)));
        }
        return;
    }
    UFUNCTION()
    void Job_HandleRebornForAudioVo(const FCE_RebornForAudioVo &inout Event) const
    {
        if (!(Event.Sender.IsValid()))
        {
            return;
        }
        if (!((FECSEntity(Event.Sender) == Event.RebornByEntity)) && ::FTeamUtils::IsInSameTeam(Event.Sender, Event.RebornByEntity))
        {
            if (CVar_AudioVo_PrintOnScreen.GetBool())
            {
                Print(FString().Append("Job_HandleRebornForAudioVo,  ").Append(Event.Sender).Append(" Be Reborned by Teammate ").Append(Event.RebornByEntity), 600.0f, FLinearColor::LucBlue);
            }
            ::FAudioVoUtils::SendAudioVoEventOnlyPresentation(n"Battle_Revive_Self", Event.Sender, FFPTime(-1));
        }
        return;
    }
    UFUNCTION()
    void Job_HandlePlayerDeathForAudioVo(const FCE_DeathEvent &inout Event) const
    {
        if (!(Event.Sender.IsValid()))
        {
            return;
        }
        if (!(::FASCommonUtils::IsAvatarPrefab(Event.Sender)))
        {
            return;
        }
        if (CVar_AudioVo_PrintOnScreen.GetBool())
        {
            Print(FString().Append("Job_HandleDeathForAudioVo, ").Append(Event.Sender).Append(" is Death, Killed by Entity: ").Append(Event.KilledByEntity.GetIdValue()), 600.0f, FLinearColor::LucBlue);
        }
        ::FAudioVoUtils::SendAudioVoEventOnlyPresentation(n"Battle_Die_Self", Event.Sender, FFPTime(-1));
        return;
    }
    UFUNCTION()
    void Job_HandleDoExecutionVoEvent(const FCE_DoExecutionVo &inout Event) const
    {
        if (Event.bIsMainExecutor)
        {
            if (CVar_AudioVo_PrintOnScreen.GetBool())
            {
                Print(FString().Append("Job_HandleDoExecutionVoEvent, ExecutionVo Initiator: ").Append(Event.Executor).Append(" "), 60.0f, FLinearColor::LucBlue);
            }
            ::FAudioVoUtils::SendAudioVoEventOnlyPresentation(n"Battle_ExecuteStart_Others_Any", Event.Executor, FFPTime(-1));
            return;
        }
        if (CVar_AudioVo_PrintOnScreen.GetBool())
        {
            Print(FString().Append("Job_HandleDoExecutionVoEvent, ExecutionVo Participant: ").Append(Event.Executor).Append(" "), 60.0f, FLinearColor::LucBlue);
        }
        ::FAudioVoUtils::SendAudioVoEventOnlyPresentation(n"Battle_ExecuteRespond_Others_Any", Event.Executor, FFPTime(-1));
        return;
    }
    UFUNCTION()
    void Job_HandleBossZoneSwapVoEvent(const FCE_BossZoneSwapEvent &inout Event) const
    {
        FECSEntity local_8 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
        FECSEntity local_4 = ::FAudioVoUtils::GetDeterministicRandomTeamate(local_8, Event.Time);
        if (!(local_4.IsValid()))
        {
            local_4 = local_8;
        }
        if (CVar_AudioVo_PrintOnScreen.GetBool())
        {
            Print(FString().Append("Job_HandleDoExecutionVoEvent, Boss Swap Zone! BossName: ").Append(Event.Sender).Append(" "), 60.0f, FLinearColor::LucBlue);
        }
        ::FAudioVoUtils::SendAudioVoEventOnlyPresentation(n"Monster_Common_Status_ZoneSwap", local_4, FFPTime(-1));
        return;
    }
    UFUNCTION()
    void ClientJob_HandleTeamJoinVo(const FCE_ServerToClientTeamJoin &inout Event) const
    {
        FECSEntity local_2 = Event.Inviter;
        FECSEntity local_4 = Event.Invitee;
        bool local_6 = !(false);
        if (!(local_2.IsValid()) == local_6 || (!(local_4.IsValid()) == !(false)))
        {
            return;
        }
        FECSEntity local_12 = ::FASCommonUtils::GetLocalPlayerProxy();
        if (((!((local_2 == local_12))) && !((local_4 == local_12))))
        {
            return;
        }
        if (CVar_AudioVo_PrintOnScreen.GetBool())
        {
            Print(FString().Append("ClientJob_HandleTeamJoinVo, Team Join Success, Inviter: ").Append(local_2).Append(" Invitee: ").Append(local_4), 60.0f, FLinearColor::LucBlue);
        }
        ::FAudioVoUtils::SendAudioVoEventOnlyPresentation(n"Team_TeamJoin_Others_Any", local_12, FFPTime(-1));
        return;
    }
    UFUNCTION()
    void Job_CollectAudioVoEvents(const FCE_AudioVoEvent &inout Event) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        0.Synced_AidoVoEvents.Add(Event.AudioVoInfo);
        return;
    }
    UFUNCTION()
    void Job_CollectAudioVoEventsPresentation(const FCE_AudioVoEventPresentation &inout Event) const
    {
        int local_16 = 0;
        XLogIf(CVar_AudioVo_DebugLog.GetBool(), ELog(0), FString().Append("Job_CollectAudioVoEventsPresentation, FCE_AudioVoEventPresentation Is coming, Entity:").Append(Event.AudioVoInfo.GetEntity()).Append(", audiovo:").Append(Event.AudioVoInfo.GetVoRowName()));
        FECSWorldPtr local_10 = this.GetECSWorld();
        local_16.Presentation_AidoVoEvents.Add(Event.AudioVoInfo);
        return;
    }
    UFUNCTION()
    void Job_DispatchAudioVoEvent(FCS_PendingDispatchAudioVo &inout PendingDispatchAudioVoEvents) const
    {
        for (auto& local_16 : PendingDispatchAudioVoEvents.Synced_AidoVoEvents)
        {
            ::FAudioVoUtils::HandleAudioVoEvent(local_16, CVar_AudioVo_DebugLog.GetBool(), CVar_AudioVo_PrintOnScreen.GetBool());
        }
        for (auto& local_16 : PendingDispatchAudioVoEvents.Presentation_AidoVoEvents)
        {
            ::FAudioVoUtils::HandleAudioVoEvent(local_16, CVar_AudioVo_DebugLog.GetBool(), CVar_AudioVo_PrintOnScreen.GetBool());
        }
        PendingDispatchAudioVoEvents.Synced_AidoVoEvents.Reset(0);
        PendingDispatchAudioVoEvents.Presentation_AidoVoEvents.Reset(0);
        return;
    }
    UFUNCTION()
    void Job_CleanUpExpiredDodgeStates(FCS_EntityAudioVoManager &inout Manager, const FCS_FixedTime &inout FixedTime) const
    {
        FFPTime local_28;
        TArray<FECSEntityId> local_4;
        int local_5 = 1106247680;
        for (auto& local_26 : Manager.DodgeStateMap)
        {
            bool local_23 = (local_28 == 0.0);
            if (local_23)
            {
                local_23 = true;
            }
            else
            {
                local_28 = FFPTime(FixedTime.Time);
                FFPTime local_32;
                local_23 = (local_32.opCmp(30.0) > 0);
            }
            if (local_23)
            {
                local_4.Add(local_26.GetKey());
            }
        }
        for (auto& local_48 : local_4)
        {
            local_48;
        }
        return;
    }
    UFUNCTION()
    void Run_Job_InitAudioSystem() const
    {
        ECS::GetContextJob();
        this.Job_InitAudioSystem();
        return;
    }
    UFUNCTION()
    void Run_Job_UnInitAudioSystem() const
    {
        ECS::GetContextJob();
        this.Job_UnInitAudioSystem();
        return;
    }
    UFUNCTION()
    void Run_Monitor_EntityBBChangeRecord() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorEntityBBChangeRecordOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_EntityBBChangeRecord(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TeammateUltimateHit() const
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
        TECSEventConstIterator<FCE_SkillHitAudioVo> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_SkillHitAudioVo& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.Job_TeammateUltimateHit(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleAbnormalStateEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_AbnormalStateEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_AbnormalStateEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleAbnormalStateEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleHealHpEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_HealHpAudioVo> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_HealHpAudioVo& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleHealHpEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleHitStateChanged() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_HitStateChanged> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_HitStateChanged& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleHitStateChanged(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleBodyPartDestroy() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_BodyPartDestroyEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_BodyPartDestroyEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleBodyPartDestroy(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CollectDodgeSuccessEvent() const
    {
        int local_6 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_InvincibleCounterEvent> local_40 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_40.CanProceed;)
        {
            const FCE_InvincibleCounterEvent& local_64 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_65 = FECSEntityScopeCycleCounter(local_64.Sender);
            ECSInternal::PushContextTime(local_64.GetHandleTime());
            this.Job_CollectDodgeSuccessEvent(local_64, local_6);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CollectGPSuccessEvent() const
    {
        int local_6 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_GuardHitEvent> local_40 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_40.CanProceed;)
        {
            const FCE_GuardHitEvent& local_64 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_65 = FECSEntityScopeCycleCounter(local_64.Sender);
            ECSInternal::PushContextTime(local_64.GetHandleTime());
            this.Job_CollectGPSuccessEvent(local_64, local_6);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateInventoryPickedUp() const
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
        TECSEventConstIterator<FCE_InventoryAudioVo> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_InventoryAudioVo& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.Job_UpdateInventoryPickedUp(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleTriggerBeHitAudioVo() const
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
        TECSEventConstIterator<FCE_TriggerBeHitAudioVo> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_TriggerBeHitAudioVo& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.Job_HandleTriggerBeHitAudioVo(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleRebornForAudioVo() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_RebornForAudioVo> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_RebornForAudioVo& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleRebornForAudioVo(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandlePlayerDeathForAudioVo() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DeathEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DeathEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandlePlayerDeathForAudioVo(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleDoExecutionVoEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DoExecutionVo> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DoExecutionVo& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleDoExecutionVoEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleBossZoneSwapVoEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_BossZoneSwapEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_BossZoneSwapEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleBossZoneSwapVoEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleTeamJoinVo() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ServerToClientTeamJoin> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ServerToClientTeamJoin& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleTeamJoinVo(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CollectAudioVoEvents() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_AudioVoEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_AudioVoEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_CollectAudioVoEvents(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CollectAudioVoEventsPresentation() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_AudioVoEventPresentation> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_AudioVoEventPresentation& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_CollectAudioVoEventsPresentation(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DispatchAudioVoEvent() const
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
        this.Job_DispatchAudioVoEvent(local_12);
        FECSWorldPtr local_4_3 = this.GetECSWorld();
        MarkModifiedIfDirty local_20;
        local_20.opCall(local_12);
        return;
    }
    UFUNCTION()
    void Run_Job_CleanUpExpiredDodgeStates() const
    {
        int local_14 = 0;
        int local_20 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        FECSWorldPtr local_6 = this.GetECSWorld();
        Has local_10;
        if (!(local_10.opCall()))
        {
            return;
        }
        FECSWorldPtr local_6_2 = this.GetECSWorld();
        this.Job_CleanUpExpiredDodgeStates(local_14, local_20);
        FECSWorldPtr local_6_3 = this.GetECSWorld();
        MarkModifiedIfDirty local_24;
        local_24.opCall(local_14);
        return;
    }
}


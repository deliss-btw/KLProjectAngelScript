

class US_CombatSystem : UECSScriptSystem
{
    UPROPERTY()
    FName DeathState = FName("HitDeath");

    US_CombatSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_HandleHit(const FCE_HitEvent &inout Event, const FCS_FixedTime &inout FixedTime) const
    {
        int local_8 = 0;
        int local_78 = 0;
        int local_94 = 0;
        int local_106 = 0;
        int local_154 = 0;
        if (!(ECS::IsAuthorityOrPrediction(Event.Attacker)))
        {
            return;
        }
        if (Event.bClientWaitForServerOnHit)
        {
            FInterpoBlendData local_18;
            local_18.SetLastBlendScale(1.0f);
            local_18.SetBlendScale(1.0f);
            local_18.SetLastWorldTime(Event.Time);
            local_18.SetWorldTime(Event.Time);
            local_8.SetBlendData(local_18, Event.Time, false);
        }
        if ((Event.AttackData == nullptr))
        {
            return;
        }
        FAttackData local_70;
        float32 local_71 = local_70.FreezeFrameTime;
        if (local_71 > 0.0f)
        {
            if (!(Event.HitBodyPart.IsNone()))
            {
                if (local_78 && local_78.BodyPartData.BodyParts.Contains(Event.HitBodyPart))
                {
                    local_71 = local_71 * local_78.BodyPartData.BodyParts[Event.HitBodyPart].FreezeDurationRatio;
                }
            }
            UCurveFloat local_86 = local_70.GetFreezeAttenuationCurve();
            if (!((Event.StrikeKey == NAME_None)) && (local_86 != nullptr))
            {
                int local_96 = local_94.GetModify_StrikeHitCounter().FindOrAdd(Event.StrikeKey);
                ++local_96;
                local_71 = local_71 * local_86.GetFloatValue(int(local_96));
            }
            FFPTime local_108 = FFPTime((local_71 + 1.0f));
            local_106.AddFreezeFrame(Event.Attacker.GetId(), FixedTime.Time, Event.Time, FFPTime(local_71), local_108, 0.0f, local_70.FreezeUpdateTime, local_70.FreezeCurve);
            Modify local_122;
            FC_AnimState& local_118 = local_122.opCall();
            if (local_118)
            {
                bool local_123;
                local_123 = false;
                FC_AnimStateIterator local_134 = local_118.Iterator();
                for (; local_134.CanProceed;)
                {
                    if (FFPTime(local_134.Proceed().GetWorldUpdateTime()).opCmp(Event.Time) > 0)
                    {
                        local_123 = true;
                        break;
                    }
                }
                if (local_123)
                {
                    Get local_150;
                    const FC_AnimStateHistory& local_152 = local_150.opCall();
                    if (local_152)
                    {
                        local_152.GetInterpoValue(Event.Time, local_118);
                        local_118.SampleTo(Event.Time);
                    }
                }
                else
                {
                    local_118.SampleTo(Event.Time);
                }
                FC_AnimStateIterator local_144 = local_118.Iterator();
                for (; local_144.CanProceed;)
                {
                    FESMAnimState& local_146 = local_144.Proceed();
                    local_154.Add(local_146.GetLayer(), local_146.GetNormalizedPlaySpeed());
                    local_146.SetWorldUpdateTime(Event.Time);
                    local_146.SetNormalizedPlaySpeed(0.0f);
                    local_146.SetbInFreezeFrameState(true);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_HandleBeHitFreezeFrame(const FCE_HitEvent &inout Event, const FCS_FixedTime &inout FixedTime) const
    {
        FFPTime local_10 = (FFPTime(FixedTime.Time) + FECSWorld::FixedFrameInterval);
        FCE_BeHitFreezeFrame local_2;
        local_2.DeferredEventID = int(Event._base_FECSEvent);
        return;
    }
    UFUNCTION()
    void Job_HandleBeHitFreezeFrameEvent(const FCE_BeHitFreezeFrame &inout BeHitFreezeFrameEvent, const FCS_FixedTime &inout FixedTime) const
    {
        int local_4 = 0;
        int local_90 = 0;
        int local_98 = 0;
        if (!(ECS::IsAuthorityOrPrediction(BeHitFreezeFrameEvent.Sender)))
        {
            return;
        }
        int local_11 = BeHitFreezeFrameEvent.DeferredEventID;
        FECSWorldPtr local_6 = ECS::GetECSWorld();
        GetEvent local_10 = FECSWorldPtr::GetEvent(local_6);
        bool local_1 = !(local_4);
        if (local_1)
        {
            local_1 = true;
        }
        else
        {
            TDataObjectPtr<FAttackData> local_36;
            local_36 = local_4.AttackData;
            local_1 = (local_36 == nullptr);
        }
        if (local_1)
        {
            return;
        }
        Has local_66;
        Get local_70;
        if (!(BeHitFreezeFrameEvent.Sender.IsValid()) || !(local_66.opCall()) || !(local_70.opCall().CanBeHitFreezeFrame))
        {
            return;
        }
        FAttackData local_72;
        float32 local_73 = local_72.BeHitFreezeFrameTime;
        if (local_73 <= 0.0f)
        {
            local_1 = false;
        }
        else
        {
            Has local_78;
            local_1 = local_78.opCall();
        }
        Get local_82;
        local_1 = local_1 && (int(local_82.opCall().GetCurrentHitState()) != 0);
        if (local_1)
        {
            if (local_90 && local_90.BodyPartData.BodyParts.Contains(local_4.HitBodyPart))
            {
                local_73 = local_73 * local_90.BodyPartData.BodyParts[local_4.HitBodyPart].BeHitFreezeDurationRatio;
            }
            int local_105 = int(local_72.FreezeCurve);
            FFPTime local_100 = FFPTime((local_73 + 1.0f));
            local_98.AddFreezeFrame(BeHitFreezeFrameEvent.Sender.GetId(), FixedTime.Time, BeHitFreezeFrameEvent.Time, FFPTime(local_73), local_100, 0.0f, local_72.BeHitFreezeUpdateTime, EFreezeFrameCurve(local_105));
        }
        return;
    }
    UFUNCTION()
    void Monitor_UpdateDeathResistance(const FECSEntity &inout Entity, const FC_DeathResistance &inout DeathResistance) const
    {
        int local_16 = 0;
        if (!(!(Entity.IsValid())) && DeathResistance)
        {
            if (DeathResistance.GetResistanceCount() <= 0)
            {
                if (DeathResistance.GetbDyingDuringResistance() && !(FECSEntity::Has<FC_DeathTag>(Entity).opCall()))
                {
                    FECSWorldPtr local_14 = this.GetECSWorld();
                    local_16.KillerEntityId = DeathResistance.GetKillerEntityId();
                }
                Remove local_20;
                local_20.opCall();
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleDeadDuringDeathResistance(const FCE_DeadDuringDeathResistanceEvent &inout Event, const FCS_FixedTime &inout FixedTime) const
    {
        Has local_6;
        if (Event.Sender.IsValid() && !(local_6.opCall()))
        {
            ::FLifeCycleUtils::KillEntityCheckNearDeathRule(Event.Sender, Event.KillerEntityId, FixedTime.Time, true, true, false, true);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_CheckDeath(const FECSEntity &inout Entity, const FC_GameAttribute &inout GameAttribute, const FCS_FixedTime &inout FixedTime) const
    {
        bool local_1 = false;
        float32 local_4 = FGameAttributeUtils::TryGetAttributeValue(GameAttribute, Attribute::HP, FixedTime.Time, local_1);
        if ((local_1 && (local_4 <= 0.0f)))
        {
            ::FLifeCycleUtils::KillEntityCheckNearDeathRule(Entity, ENTITY_ID_NULL, FixedTime.Time, true, true, false, true);
        }
        return;
    }
    void ESMTryTransitToDeath(const FECSEntity &inout Entity) const
    {
        Has local_4;
        Get local_10;
        if (local_4.opCall() && (local_10.opCall().GetEntityType() != 6))
        {
            FName local_16 = this.DeathState;
            Get local_20;
            const FC_DeathInfo& local_22 = local_20.opCall();
            if (local_22)
            {
                if (!(local_22.GetbESMTransitToDeathState()))
                {
                    return;
                }
                local_16 = local_22.GetFinalDeathStateName();
            }
            if (!(local_16.IsNone()))
            {
                FESMExternalTransitHandle local_32 = Entity.ESMExternalTransitMainSM(local_16, NAME_None);
                local_32.SetBlockExternalTransits(true);
            }
        }
        return;
    }
    void DisableEntityBehaviorTreeByDeath(const FECSEntity &inout Entity, const bool bDisable) const
    {
        int local_6 = 0;
        int local_26 = 0;
        if (local_6)
        {
            FECSEntity local_16 = FECSEntity(local_6.GetControllerEntity());
            Has local_20;
            if (!(local_20.opCall()))
            {
                return;
            }
            if (local_26)
            {
                local_26.SetbDisableByDeath(bDisable);
            }
        }
        return;
    }
    void DisableCollisionAndHitBoxByDeath(const FECSEntity &inout DeadEntity) const
    {
        bool local_1 = false;
        bool local_3 = true;
        Get local_8;
        const FC_DeathConfig& local_10 = local_8.opCall();
        if (local_10)
        {
            if (!(local_10.bCanBeHitAfterDeath))
            {
                Modify local_14;
                FC_HitBox& local_16 = local_14.opCall();
                if (local_16)
                {
                    local_16.GetOptions().DisableByReason(ECollisionDisableReason(2));
                }
            }
            local_1 = local_10.bDisableMoveCollisionAfterDeath;
            local_3 = local_10.bDisablePushColliderAfterDeath;
        }
        Modify local_22;
        FC_Collision& local_24 = local_22.opCall();
        if (local_24)
        {
            local_24.GetOverlapOptions().DisableByReason(ECollisionDisableReason(2));
            local_24.GetOverlapTestOptions().DisableByReason(ECollisionDisableReason(2));
            if (local_1)
            {
                local_24.GetMoveCollisionOptions().DisableByReason(ECollisionDisableReason(2));
            }
            if (local_3)
            {
                local_24.GetPushColliderOptions().DisableByReason(ECollisionDisableReason(2));
            }
        }
        return;
    }
    void DisableHitBoxByDeath(const FECSEntity &inout DeadEntity) const
    {
        Modify local_4;
        FC_HitBox& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.GetOptions().DisableByReason(ECollisionDisableReason(2));
        }
        return;
    }
    void DeathProcess(const FECSEntity &inout DeadEntity, const FFPTime &inout Time) const
    {
        Has local_4;
        const FC_DeferDeathTransition& local_64;
        Get local_10;
        if (local_4.opCall() && local_10.opCall().IsDriver())
        {
            ::FMountUtils::EndMountAsDriver(DeadEntity, Time);
        }
        Has local_16;
        bool local_11 = local_16.opCall();
        if (local_11)
        {
            FBuffUtils::RemoveBuffByDeath(DeadEntity, Time);
        }
        ::FNearDeathUtils::TryRestoreHitboxFromNearDeath(DeadEntity);
        Remove local_20;
        local_20.opCall();
        Remove local_24;
        local_24.opCall();
        Remove local_28;
        local_28.opCall();
        Remove local_32;
        local_32.opCall();
        this.DisableEntityBehaviorTreeByDeath(DeadEntity, true);
        Has local_36;
        bool local_11_2 = local_36.opCall();
        if (local_11_2)
        {
            Assign local_40;
            local_40.opCall(FC_InputMuteConvertToEsmTriggerTag());
        }
        ::FLifeCycleUtils::ClearEntityHpAndAbnormalAttribute(DeadEntity, Time);
        bool local_42 = false;
        bool local_43 = false;
        Has local_48;
        bool local_5 = local_48.opCall();
        if (local_5)
        {
            FName local_50(NAME_None);
            Get local_54;
            const FC_HitStateFrame& local_56 = local_54.opCall();
            if (local_56)
            {
                local_50 = local_56.GetToStateName();
            }
            if (::FDeferredDeathUtils::IsDeferredHitState(DeadEntity, local_50))
            {
                local_64.SetbDeferByAction(true);
                local_64.SetbDeferDeathPresentation(true);
                local_64.SetDeferStartTime(Time);
                DeadEntity.AddGameplayTag(GameplayTags::ESM_HitState_HitBlowDeath, NAME_None);
                local_42 = true;
                local_43 = true;
            }
            bool local_11_3 = !(local_42);
            if (!(local_11_3))
            {
                local_11_3 = false;
            }
            else
            {
                Has local_68;
                local_11_3 = local_68.opCall();
            }
            local_11_3 = local_11_3 && DeadEntity.MatchGameplayTag(GameplayTags::ESM_HitState_Hit);
            if (local_11_3)
            {
                ModifyOrAdd local_62;
                local_62.opCall().SetbWaitLand(true);
                local_42 = true;
            }
            if (!(local_42))
            {
                Get local_72;
                local_64 = local_72.opCall();
                if (local_64)
                {
                    if (local_64.NeedDefer())
                    {
                        local_42 = true;
                    }
                }
            }
        }
        if (local_43)
        {
            this.DisableHitBoxByDeath(DeadEntity);
        }
        else
        {
            this.DisableCollisionAndHitBoxByDeath(DeadEntity);
        }
        Modify local_76;
        FC_DeathInfo& local_78 = local_76.opCall();
        if (local_78)
        {
            FName local_80 = local_78.GetbHasExtraDeathState() ? local_78.GetExtraDeathStateName() : this.DeathState;
            local_78.SetFinalDeathStateName(local_80);
        }
        if (!(local_42))
        {
            this.ESMTryTransitToDeath(DeadEntity);
            Remove local_84;
            local_84.opCall();
            this.TryDeathDestroy(DeadEntity, Time);
        }
        return;
    }
    void TryDeathDestroy(const FECSEntity &inout DeadEntity, const FFPTime &inout Time) const
    {
        FFPTime local_2 = Time;
        bool local_3 = true;
        bool local_5 = false;
        Get local_10;
        const FC_DeathInfo& local_12 = local_10.opCall();
        if (local_12)
        {
            if (!(local_12.GetbAutoEnterDestroy()))
            {
                Remove local_16;
                local_16.opCall();
                return;
            }
            if (local_12.GetbDestroyImmediately())
            {
                local_5 = true;
            }
        }
        if (!(local_5))
        {
            bool local_37;
            Get local_26;
            const FC_HitReactionConfig& local_28 = local_26.opCall();
            if (local_28)
            {
                if (local_28.DeathDestroyTime >= 0.0f)
                {
                    local_2 = (Time + FFPTime(local_28.DeathDestroyTime));
                }
                else
                {
                    local_3 = false;
                }
            }
            else
            {
                FC_PropDeathConfig local_22;
                if (!(local_22))
                {
                    local_37 = false;
                }
                else
                {
                    local_37 = local_22.bHasDestroyWaitTime;
                }
                if (local_37)
                {
                    if (local_22.DeathDestroyWaitTime >= 0.0f)
                    {
                        local_2 = (Time + FFPTime(local_22.DeathDestroyWaitTime));
                    }
                    else
                    {
                        local_3 = false;
                    }
                }
            }
        }
        if (local_3)
        {
            bool local_37;
            Get local_44;
            FECSWorldPtr local_40 = this.GetECSWorld();
            if (local_2.opCmp(local_44.opCall().Time) < 0)
            {
                FECSWorldPtr local_40_2 = this.GetECSWorld();
                local_2 = local_44.opCall().Time;
            }
            local_37 = true;
            FCE_EntityDestroyRequest local_52;
            local_52.bSkipPlayerControlled = local_37;
        }
        return;
    }
    UFUNCTION()
    void Job_HandleDeath(const FCE_DeathEvent &inout Event) const
    {
        bool local_11;
        TArray<FECSEntity> local_4;
        Get local_8;
        const FC_ControlledByPlayer& local_10 = local_8.opCall();
        if (local_10)
        {
            Has local_16;
            local_11 = local_16.opCall();
            if (local_11)
            {
                this.DeathProcess(Event.Sender, Event.Time);
            }
            else
            {
                FECSEntity local_20 = local_10.GetPlayerEntity();
                Get local_24;
                const FC_PlayerController& local_26 = local_24.opCall();
                if (local_26)
                {
                    for (auto& local_40 : local_26.GetAllPlayerPawnEntities())
                    {
                        this.DeathProcess(local_40, Event.Time);
                        local_4.Add(local_40);
                    }
                }
            }
        }
        else
        {
            this.DeathProcess(Event.Sender, Event.Time);
        }
        if (!(local_4.Num() > 0 && !(local_4.Contains(Event.Sender))))
        {
            local_11 = false;
        }
        else
        {
            Has local_48;
            local_11 = local_48.opCall();
        }
        if (local_11)
        {
            this.DeathProcess(Event.Sender, Event.Time);
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateDeferDeathTransition(const FECSEntity &inout Entity, FC_DeferDeathTransition &inout DeferDeathTransition, const FCS_FixedTime &inout FixedTime) const
    {
        if (DeferDeathTransition.GetbWaitLand())
        {
            Has local_6;
            if (!(local_6.opCall()) || !(Entity.MatchGameplayTag(GameplayTags::ESM_HitState_Hit)))
            {
                DeferDeathTransition.SetbWaitLand(false);
            }
        }
        if (!(DeferDeathTransition.NeedDefer()))
        {
            this.ESMTryTransitToDeath(Entity);
            Remove local_12;
            local_12.opCall();
            this.TryDeathDestroy(Entity, FixedTime.Time);
        }
        return;
    }
    void DoReborn(const FECSEntity &inout RebornEntity, const FFPTime &inout Time, const float32 RebornHPRatio, const bool bRebornWithAnimation) const
    {
        int local_68 = 0;
        if (!(RebornEntity.IsValid()))
        {
            XWarning(ELog(42), FString().Append("[DoReborn] и·іиї‡е¤±ж•€е¤Ќжґ»е®ћдЅ“: ").Append(RebornEntity));
            return;
        }
        if (bRebornWithAnimation)
        {
            FESMExternalTransitHandle local_16 = RebornEntity.ESMExternalTransitMainSM(n"DeathReborn", NAME_None);
        }
        Remove local_20;
        local_20.opCall();
        Remove local_24;
        local_24.opCall();
        Remove local_28;
        local_28.opCall();
        this.DisableEntityBehaviorTreeByDeath(RebornEntity, false);
        Remove local_32;
        local_32.opCall();
        Modify local_36;
        FC_Collision& local_38 = local_36.opCall();
        if (local_38)
        {
            local_38.GetMoveCollisionOptions().EnableByReason(ECollisionDisableReason(2));
            local_38.GetPushColliderOptions().EnableByReason(ECollisionDisableReason(2));
            local_38.GetOverlapOptions().EnableByReason(ECollisionDisableReason(2));
            local_38.GetOverlapTestOptions().EnableByReason(ECollisionDisableReason(2));
        }
        Modify local_44;
        FC_HitBox& local_46 = local_44.opCall();
        if (local_46)
        {
            local_46.GetOptions().EnableByReason(ECollisionDisableReason(2));
        }
        Modify local_50;
        FC_Buff& local_52 = local_50.opCall();
        if (local_52)
        {
            local_52.SetbActive(true);
        }
        Modify local_56;
        FC_EASAbility& local_58 = local_56.opCall();
        if (local_58)
        {
            local_58.bActive = true;
        }
        Has local_62;
        bool local_1 = local_62.opCall();
        if (local_1)
        {
            float32 local_69 = local_68.GetAttributeValue(Attribute::HPMax, Time) * RebornHPRatio;
            FGameAttributeUtils::Recover(RebornEntity, Attribute::HP, Time, local_69, -1.0f);
            if (local_68.HasAttribute(Attribute::Posture) && local_68.HasAttribute(Attribute::PostureMax))
            {
                float32 local_71 = local_68.GetAttributeValue(Attribute::PostureMax, Time);
                FGameAttributeUtils::Recover(RebornEntity, Attribute::Posture, Time, local_71, -1.0f);
            }
            return;
        }
        XWarning(ELog(42), FString().Append("[DoReborn] е¤Ќжґ»е®ћдЅ“зјєе°‘ FC_GameAttributeпјЊи·іиї‡е±ћжЂ§жЃўе¤Ќ: ").Append(RebornEntity));
        return;
    }
    UFUNCTION()
    void Job_HandleReborn(const FCE_Reborn &inout Event) const
    {
        bool local_46;
        Has local_6;
        bool local_7 = local_6.opCall();
        TArray<FECSEntity> local_12;
        Get local_16;
        const FC_ControlledByPlayer& local_18 = local_16.opCall();
        if (local_18)
        {
            FECSEntity local_22 = local_18.GetPlayerEntity();
            Get local_26;
            const FC_PlayerController& local_28 = local_26.opCall();
            if (local_28)
            {
                for (auto& local_42 : local_28.GetAllPlayerPawnEntities())
                {
                    if (!(local_42.IsValid()))
                    {
                        continue;
                    }
                    this.DoReborn(local_42, Event.Time, Event.RebornHPRatio, Event.bRebornWithAnimation);
                    local_12.Add(local_42);
                }
            }
        }
        else
        {
            this.DoReborn(Event.Sender, Event.Time, Event.RebornHPRatio, Event.bRebornWithAnimation);
        }
        bool local_1 = local_12.Num() > 0 && !(local_12.Contains(Event.Sender));
        if (!(local_1))
        {
            local_1 = false;
        }
        else
        {
            Has local_50;
            local_1 = local_50.opCall();
        }
        if (local_1)
        {
            local_46 = Event.bRebornWithAnimation;
            this.DoReborn(Event.Sender, Event.Time, Event.RebornHPRatio, local_46);
        }
        FFPTime local_56 = FFPTime(-1);
        FCE_RebornForAudioVo local_58;
        local_58.RebornByEntity = Event.RebornByEntity;
        local_58.RebornHPRatio = Event.RebornHPRatio;
        if (local_7 && Event.bFromPlayerRebornEvent)
        {
            ::FLifeCycleUtils::ServerDataTrackPlayerRevive(Event.Sender, Event.ReviveType);
        }
        return;
    }
    UFUNCTION()
    void Job_HandleHitBreakRecover(const FECSEntity &inout Entity, const FC_WaitHitBreakRecover &inout WaitHitBreakRecover, const FCS_FixedTime &inout FixedTime) const
    {
        Remove local_10;
        SendEvent local_30;
        Get local_34;
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            local_10.opCall();
            return;
        }
        FFPTime local_12 = FFPTime(FixedTime.Time);
        if (local_12.opCmp(WaitHitBreakRecover.GetRecoverTime()) < 0)
        {
            return;
        }
        if (Entity.MatchGameplayTag(GameplayTags::CombatState_Special_MuteHitBreakRecover))
        {
            return;
        }
        Has local_18;
        local_5 = local_18.opCall();
        if (local_5)
        {
            return;
        }
        Modify local_22;
        FC_ExecutedInfo& local_24 = local_22.opCall();
        if (local_24)
        {
            if (int(local_24.GetExecutionState()) == 1)
            {
                local_24.SetExecutionState(EExecutionState(EExecutionState(0)));
                local_30.opCall(FixedTime.Time);
                local_10.opCall();
                const FC_HitReaction& local_36 = local_34.opCall();
                if (local_36)
                {
                    if (int(local_36.GetCurrentHitState()) == 9)
                    {
                        FESMExternalTransitHandle local_46 = Entity.ESMExternalTransitMainSM(n"HitBreak_End", NAME_None);
                    }
                }
            }
            else
            {
                if (int(local_24.GetExecutionState()) == 3)
                {
                    bool local_47;
                    local_47 = false;
                    const FC_HitReaction& local_36_2 = local_34.opCall();
                    if (local_36_2)
                    {
                        local_47 = (int(local_36_2.GetCurrentHitState()) == 10);
                    }
                    if (!(local_47) && (FFPTime(FixedTime.Time).opCmp(local_24.GetCanRecoverFromExecutedTime()) >= 0))
                    {
                        local_24.SetExecutionState(EExecutionState(EExecutionState(0)));
                        local_30.opCall(FixedTime.Time);
                        local_10.opCall();
                    }
                }
            }
            return;
        }
        local_10.opCall();
        return;
    }
    UFUNCTION()
    void Monitor_CheckAndClearNotHandledBeHitContext(const FECSEntity &inout Entity, const FC_DisableSyncNetTime &inout DisableSyncNetTime) const
    {
        Has local_4;
        Has local_10;
        if (!(local_4.opCall()) || !(local_10.opCall()))
        {
            return;
        }
        if (DisableSyncNetTime.GetHandleFrame() < DisableSyncNetTime.GetEnterFrame())
        {
            Remove local_18;
            local_18.opCall();
        }
        return;
    }
    UFUNCTION()
    void Job_HandleBossLowHPDetect(const FECSEntity &inout Entity, const FC_GameAttributeChanged &inout GameAttributeChanged) const
    {
        int local_8 = 0;
        int local_52 = 0;
        if (!(::FASCommonUtils::IsBossPrefab(Entity)))
        {
            return;
        }
        bool local_9 = false;
        int local_10 = 0;
        for (; local_10 < GameAttributeChanged.GetChangedAttributeNum(); ++local_10)
        {
            FGameAttributeRef local_28 = local_8.GetAttributeRef(GameAttributeChanged.GetChangedAttributeLocalIndex(local_10));
            if (local_28.GetGlobalIndex() == Attribute::HP.GetGlobalIndex() || (local_28.GetGlobalIndex() == Attribute::HPMax.GetGlobalIndex()))
            {
                local_9 = true;
                break;
            }
        }
        if (!(local_9))
        {
            return;
        }
        FECSWorldPtr local_46 = this.GetECSWorld();
        float32 local_54 = local_8.GetAttributeValue(Attribute::HP, local_52.Time);
        float32 local_53 = local_8.GetAttributeValue(Attribute::HPMax, local_52.Time);
        if (local_53 > 0.0f)
        {
            Has local_64;
            bool local_44 = ::UCombatGlobalSettings::Get().CheckBossIsLowHp(local_54 / local_53);
            bool local_57 = local_44 && !(local_64.opCall());
            if (local_57)
            {
                FC_BossLowHPTag local_70;
                Assign local_68;
                local_68.opCall(local_70);
                FECSEntityId local_75 = Entity.GetId();
                FECSWorldPtr local_46_2 = Entity.GetWorld();
                ModifyOrAdd local_74;
                local_74.opCall().GetModify_BossLowHPList().AddUnique(local_75);
                return;
            }
            local_57 = !(local_44);
            if (!(local_57))
            {
                local_57 = false;
            }
            else
            {
                local_57 = local_64.opCall();
            }
            if (local_57)
            {
                Remove local_80;
                local_80.opCall();
                FECSEntityId local_75_2 = Entity.GetId();
                FECSWorldPtr local_46_3 = Entity.GetWorld();
            }
        }
        return;
    }
    void GetDataTrackEntityParams(const FECSEntity &inout Entity, uint &inout OutEntityType, uint &inout OutEntityConfigId, uint &inout OutEntityInstanceId) const
    {
        int local_70 = 0;
        if (!(Entity.IsValid()))
        {
            OutEntityType = 0;
            OutEntityConfigId = 0;
            OutEntityInstanceId = 0;
            return;
        }
        Has local_8;
        bool local_1 = local_8.opCall();
        OutEntityType = local_1 ? 1 : 2;
        OutEntityConfigId = 0;
        int local_2 = Entity.GetIdValue();
        OutEntityInstanceId = local_2;
        if (::GetAvatarConfig(Entity))
        {
            OutEntityConfigId = local_2;
        }
        else
        {
            Get local_62;
            if (local_62.opCall())
            {
                OutEntityConfigId = local_2;
            }
        }
        if (local_1)
        {
            OutEntityInstanceId = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(local_70.GetPlayerEntity());
        }
        return;
    }
    uint GetDataTrackDamageType(const EDamageType DamageType) const
    {
        int local_1 = int(DamageType);
        return local_1;
    }
    FECSEntity GetDataTrackPotentialPawn(const FECSEntity &inout Entity, const FECSEntity &inout SourceEntity) const
    {
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            return Entity;
        }
        else
        {
            bool local_5_2 = local_4.opCall();
            if (local_5_2)
            {
                return SourceEntity;
            }
            else
            {
                return Entity;
            }
        }
    }
    void LogDataTrackProtoMessageByInvolvedEntity(const FECSEntity &inout Entity, const uint ActionId, const FProtoWrapper &inout Body) const
    {
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            ::ServerDataTrackerHelper::LogProtoMessage3WithPawn(Entity, ActionId, Body);
            return;
        }
        ::ServerDataTrackerHelper::LogProtoMessage3NoPlayer(ActionId, Body);
        return;
    }
    void LogDataTrackCombatBehavior(const FECSEntity &inout Entity, const FECSEntity &inout TargetEntity, const uint BehaviorType, const float32 StaggerElapsed = 0.f) const
    {
        if (!(Entity.IsValid()))
        {
            return;
        }
        int local_2 = 0;
        int local_4 = 0;
        int local_5 = 0;
        this.GetDataTrackEntityParams(Entity, local_2, local_4, local_5);
        int local_6 = 0;
        int local_7 = 0;
        int local_8 = 0;
        this.GetDataTrackEntityParams(TargetEntity, local_6, local_7, local_8);
        FPbPlayerLogDsCombatBehavior local_18;
        local_18.SetEntityType(local_2);
        local_18.SetEntityConfigId(local_4);
        local_18.SetEntityInstanceId(local_5);
        local_18.SetBehaviorType(BehaviorType);
        local_18.SetStaggerElapsed(StaggerElapsed);
        local_18.SetTargetEntityType(local_6);
        local_18.SetTargetEntityConfigId(local_7);
        local_18.SetTargetEntityInstanceId(local_8);
        FPbPlayerLogDsCombatCommon local_28 = local_18.GetCommon();
        ::FCombatStateUtils::GetDataTrackPbCombatCommonData(Entity, local_28);
        Has local_42;
        bool local_1 = local_42.opCall();
        if (local_1)
        {
            ::ServerDataTrackerHelper::LogProtoMessage3WithPawn(Entity, 102507, local_18.ToWrapper());
        }
        else
        {
            ::ServerDataTrackerHelper::LogProtoMessage3NoPlayer(102507, local_18.ToWrapper());
        }
        return;
    }
    UFUNCTION()
    void ServerJob_DataTrackSkillTransit(const FCE_SkillTransitComplete &inout Event) const
    {
        int local_1 = 0;
        int local_3 = 0;
        int local_4 = 0;
        this.GetDataTrackEntityParams(Event.Sender, local_1, local_3, local_4);
        FPbPlayerLogDsSkillCast local_14;
        local_14.SetEntityType(local_1);
        local_14.SetEntityConfigId(local_3);
        local_14.SetEntityInstanceId(local_4);
        local_14.SetCastType(1);
        local_14.SetSkillId(Event.SkillConfig.ToSoftObjectPath().ToString());
        local_14.GetCommon();
        FECSEntity local_36;
        ::FCombatStateUtils::GetDataTrackPbCombatCommonData(local_36, Event.Sender);
        ::ServerDataTrackerHelper::LogProtoMessage3WithPawn(Event.Sender, 102506, local_14.ToWrapper());
        return;
    }
    void LogDataTrackBossLifecycle(const FECSEntity &inout Entity, const uint BossPhase, const uint ChangeType) const
    {
        int local_1 = 0;
        int local_3 = 0;
        int local_4 = 0;
        this.GetDataTrackEntityParams(Entity, local_1, local_3, local_4);
        FPbPlayerLogDsBossLifecycle local_14;
        local_14.SetBossId(local_3);
        local_14.SetBossInstanceId(local_4);
        local_14.SetBossPhase(BossPhase);
        local_14.SetChangeType(ChangeType);
        FPbPlayerLogDsCombatCommon local_24 = local_14.GetCommon();
        ::FCombatStateUtils::GetDataTrackPbCombatCommonData(Entity, local_24);
        ::ServerDataTrackerHelper::LogProtoMessage3NoPlayer(102505, local_14.ToWrapper());
        return;
    }
    UFUNCTION()
    void Monitor_DataTrackOnMonsterSpawnListenPhaseChange(const FECSEntity &inout Entity, const FC_MonsterInfo &inout MonsterInfo) const
    {
        if (int(MonsterInfo.GetMonsterRank()) == 2)
        {
            FNameHandle_EntityBBVarInt local_18;
            Modify local_8;
            FC_EntityBlackboard& local_10 = local_8.opCall();
            if (local_10)
            {
                (FC_EntityBBChangeRecord::StartEntityBBRecord(local_10, Entity)).AddListen(n"iPhase", EEntityBBChangeListenerType(2));
            }
            local_18;
            this.LogDataTrackBossLifecycle(Entity, FMath::Max(0, Entity.GetBB_Int(local_18)), n"iPhase");
        }
        return;
    }
    UFUNCTION()
    void ServerJob_DataTrackEntityBBChange(const FECSEntity &inout Entity, const FC_MonsterInfo &inout MonsterInfo, const FC_EntityBBChangeRecord &inout EntityBBChangeRecord) const
    {
        if (int(MonsterInfo.GetMonsterRank()) != 2)
        {
            return;
        }
        FEntityBlackboardValueChangeInfo local_6;
        if (EntityBBChangeRecord.ChangeRecords.Find(n"iPhase", local_6))
        {
            this.LogDataTrackBossLifecycle(Entity, local_6.GetNewValue_Int(), 2);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_DataTrackBossDeath(const FCE_DeathEvent &inout Event) const
    {
        int local_12 = 0;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (!(local_4.IsValid()))
        {
            return;
        }
        if (!(local_12) || (int(local_12.GetMonsterRank()) != 2))
        {
            return;
        }
        FNameHandle_EntityBBVarInt local_20;
        local_20;
        this.LogDataTrackBossLifecycle(local_4, FMath::Max(0, local_4.GetBB_Int(local_20)), n"iPhase");
        return;
    }
    UFUNCTION()
    void ServerJob_DataTrackCombatEffectDamage(const FCE_DamageEvent &inout Event) const
    {
        int local_37 = 0;
        int local_1 = 0;
        int local_3 = 0;
        int local_4 = 0;
        this.GetDataTrackEntityParams(Event.Receiver, local_1, local_3, local_4);
        int local_5 = 0;
        int local_6 = 0;
        int local_7 = 0;
        this.GetDataTrackEntityParams(Event.FinalDamageSource, local_5, local_6, local_7);
        FECSEntity local_16 = this.GetDataTrackPotentialPawn(Event.Receiver, Event.FinalDamageSource);
        if (Event.TotalDamageToHP > 0.0f)
        {
            FPbPlayerLogDsCombatEffect local_30;
            local_30.SetEntityType(local_1);
            local_30.SetEntityConfigId(local_3);
            local_30.SetEntityInstanceId(local_4);
            if (Event.bMakeTargetNearDeath)
            {
                local_30.AddResultState(1);
            }
            if (Event.bKillTarget)
            {
                local_30.AddResultState(2);
            }
            if (Event.bMakeTargetBodyPartDestroy)
            {
                local_30.AddResultState(5);
            }
            local_30.SetEffectType(1);
            local_30.SetIsAdd(false);
            local_30.SetDamageType(this.GetDataTrackDamageType(Event.DamageType));
            local_30.SetIsCritical(Event.bCritical);
            local_30.SetBodyPart(Event.HitData.HitBodyPart.ToString());
            local_30.SetRawValue(Event.TotalDamageToHP);
            local_30.SetActualValue(Event.ActualDamageToHP);
            local_30.SetSourceEntityType(local_5);
            local_30.SetSourceEntityConfigId(local_6);
            local_30.SetSourceEntityInstanceId(local_7);
            if (Event.AttackData)
            {
                local_30.SetAttackCategory(local_37);
            }
            FPbPlayerLogDsCombatCommon local_48 = local_30.GetCommon();
            ::FCombatStateUtils::GetDataTrackPbCombatCommonData(local_16, local_48);
            this.LogDataTrackProtoMessageByInvolvedEntity(local_16, 102509, local_30.ToWrapper());
        }
        if (Event.DamageToShield > 0.0f)
        {
            FPbPlayerLogDsCombatEffect local_30;
            local_30.SetEntityType(local_1);
            local_30.SetEntityConfigId(local_3);
            local_30.SetEntityInstanceId(local_4);
            local_30.SetEffectType(2);
            local_30.SetIsAdd(false);
            local_30.SetDamageType(this.GetDataTrackDamageType(Event.DamageType));
            local_30.SetIsCritical(Event.bCritical);
            local_30.SetRawValue(Event.DamageToShield);
            local_30.SetActualValue(Event.DamageToShield);
            local_30.SetSourceEntityType(local_5);
            local_30.SetSourceEntityConfigId(local_6);
            local_30.SetSourceEntityInstanceId(local_7);
            if (Event.AttackData)
            {
                local_30.SetAttackCategory(local_37);
            }
            FPbPlayerLogDsCombatCommon local_58 = local_30.GetCommon();
            ::FCombatStateUtils::GetDataTrackPbCombatCommonData(local_16, local_58);
            this.LogDataTrackProtoMessageByInvolvedEntity(local_16, 102509, local_30.ToWrapper());
        }
        if (Event.DamageToPosture > 0.0f)
        {
            FPbPlayerLogDsCombatEffect local_30;
            local_30.SetEntityType(local_1);
            local_30.SetEntityConfigId(local_3);
            local_30.SetEntityInstanceId(local_4);
            if (Event.bMakeTargetPostureStagger)
            {
                local_30.AddResultState(3);
            }
            if (Event.bMakeTargetPostureBreak)
            {
                local_30.AddResultState(4);
            }
            local_30.SetEffectType(3);
            local_30.SetIsAdd(false);
            local_30.SetDamageType(this.GetDataTrackDamageType(Event.DamageType));
            local_30.SetIsCritical(Event.bCritical);
            local_30.SetRawValue(Event.DamageToPosture);
            local_30.SetActualValue(Event.DamageToPosture);
            local_30.SetSourceEntityType(local_5);
            local_30.SetSourceEntityConfigId(local_6);
            local_30.SetSourceEntityInstanceId(local_7);
            if (Event.AttackData)
            {
                local_30.SetAttackCategory(local_37);
            }
            FPbPlayerLogDsCombatCommon local_48_2 = local_30.GetCommon();
            ::FCombatStateUtils::GetDataTrackPbCombatCommonData(local_16, local_48_2);
            this.LogDataTrackProtoMessageByInvolvedEntity(local_16, 102509, local_30.ToWrapper());
        }
        return;
    }
    UFUNCTION()
    void ServerJob_DataTrackCombatEffectHeal(const FCE_HealedEvent &inout Event) const
    {
        if (Event.TotalHealHP > 0.0f)
        {
            int local_4 = 0;
            int local_6 = 0;
            int local_7 = 0;
            this.GetDataTrackEntityParams(Event.HealedEntity, local_4, local_6, local_7);
            int local_8 = 0;
            int local_9 = 0;
            int local_10 = 0;
            this.GetDataTrackEntityParams(Event.HealFromEntity, local_8, local_9, local_10);
            FPbPlayerLogDsCombatEffect local_20;
            local_20.SetEntityType(local_4);
            local_20.SetEntityConfigId(local_6);
            local_20.SetEntityInstanceId(local_7);
            local_20.SetEffectType(1);
            local_20.SetIsAdd(true);
            local_20.SetRawValue(Event.TotalHealHP);
            local_20.SetActualValue(Event.RealHealHP);
            local_20.SetSourceEntityType(local_8);
            local_20.SetSourceEntityConfigId(local_9);
            local_20.SetSourceEntityInstanceId(local_10);
            FPbPlayerLogDsCombatCommon local_30 = local_20.GetCommon();
            FECSEntity local_48 = this.GetDataTrackPotentialPawn(Event.HealedEntity, Event.HealFromEntity);
            ::FCombatStateUtils::GetDataTrackPbCombatCommonData(local_48, local_30);
            this.LogDataTrackProtoMessageByInvolvedEntity(local_48, 102509, local_20.ToWrapper());
        }
        return;
    }
    UFUNCTION()
    void ServerJob_DataTrackDodge(const FCE_InvincibleCounterEvent &inout Event) const
    {
        if (int(Event.Type) != 1)
        {
            return;
        }
        this.LogDataTrackCombatBehavior(Event.Sender, Event.Attacker, 1, 0.0f);
        return;
    }
    UFUNCTION()
    void ServerJob_DataTrackPerfectDodge(const FCE_PerfectDodgeEvent &inout Event) const
    {
        this.LogDataTrackCombatBehavior(Event.Sender, Event.Attacker, 2, 0.0f);
        return;
    }
    UFUNCTION()
    void ServerJob_DataTrackBlock(const FCE_DefenseHitEvent &inout Event) const
    {
        if (Event.bIsParry)
        {
            this.LogDataTrackCombatBehavior(Event.Sender, Event.Attacker, 4, 0.0f);
            return;
        }
        this.LogDataTrackCombatBehavior(Event.Sender, Event.Attacker, 3, 0.0f);
        return;
    }
    UFUNCTION()
    void ServerJob_DataTrackExecution(const FCE_ExecutionStateChangedEvent &inout Event) const
    {
        int local_6 = 0;
        if (!(local_6) || (int(local_6.GetExecutionState()) != 3) || local_6.GetExecuteEntityArray().IsEmpty())
        {
            return;
        }
        int local_12 = 0;
        Get local_18;
        const FC_HitReaction& local_20 = local_18.opCall();
        if (local_20)
        {
            if (local_20.GetBreakStartTime().ToSeconds() > 0.0)
            {
                local_12 = FMath::Max(0.0f, (float32(((FFPTime(Event.Time) - local_20.GetBreakStartTime()).ToSeconds())) * 1000.0f));
            }
        }
        int local_32 = local_6.GetExecuteEntityArray().Num() > 1 ? 6 : 5;
        int local_31 = local_32;
        for (auto& local_46 : local_6.GetExecuteEntityArray())
        {
            if (local_46.IsValid())
            {
                this.LogDataTrackCombatBehavior(local_46, Event.Sender, local_31, local_12);
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_DataTrackBuffAdded(const FCE_BuffAddedEvent &inout Event) const
    {
        FPbPlayerLogDsBuffChange local_10;
        int local_11 = 0;
        int local_13 = 0;
        int local_14 = 0;
        this.GetDataTrackEntityParams(Event.Sender, local_11, local_13, local_14);
        local_10.SetEntityType(local_11);
        local_10.SetEntityConfigId(local_13);
        local_10.SetEntityInstanceId(local_14);
        local_10.SetBuffId(Event.BuffConfig.GetUniqueID());
        int local_18 = Event.bFirstAdded ? 1 : 3;
        local_10.SetChangeType(local_18);
        local_10.SetStacks(int(Event.BuffStackNum));
        local_10.SetRemainingDuration(Event.BuffDuration);
        int local_21 = 0;
        int local_22 = 0;
        int local_23 = 0;
        this.GetDataTrackEntityParams(Event.BuffFromEntity, local_21, local_22, local_23);
        local_10.SetSourceEntityType(local_21);
        local_10.SetSourceEntityConfigId(local_22);
        local_10.SetSourceEntityInstanceId(local_23);
        FPbPlayerLogDsCombatCommon local_34 = local_10.GetCommon();
        FECSEntity local_52 = this.GetDataTrackPotentialPawn(Event.Sender, Event.BuffFromEntity);
        ::FCombatStateUtils::GetDataTrackPbCombatCommonData(local_52, local_34);
        this.LogDataTrackProtoMessageByInvolvedEntity(local_52, 102508, local_10.ToWrapper());
        return;
    }
    UFUNCTION()
    void ServerJob_DataTrackBuffRemoved(const FCE_BuffRemovedEvent &inout Event) const
    {
        FPbPlayerLogDsBuffChange local_10;
        int local_11 = 0;
        int local_13 = 0;
        int local_14 = 0;
        this.GetDataTrackEntityParams(Event.Sender, local_11, local_13, local_14);
        local_10.SetEntityType(local_11);
        local_10.SetEntityConfigId(local_13);
        local_10.SetEntityInstanceId(local_14);
        local_10.SetBuffId(Event.BuffConfig.GetUniqueID());
        local_10.SetChangeType(2);
        local_10.SetStacks(0);
        local_10.SetRemainingDuration(0.0f);
        int local_18 = 0;
        int local_19 = 0;
        int local_20 = 0;
        this.GetDataTrackEntityParams(Event.BuffFromEntity, local_18, local_19, local_20);
        local_10.SetSourceEntityType(local_18);
        local_10.SetSourceEntityConfigId(local_19);
        local_10.SetSourceEntityInstanceId(local_20);
        FPbPlayerLogDsCombatCommon local_30 = local_10.GetCommon();
        FECSEntity local_48 = this.GetDataTrackPotentialPawn(Event.Sender, Event.BuffFromEntity);
        ::FCombatStateUtils::GetDataTrackPbCombatCommonData(local_48, local_30);
        this.LogDataTrackProtoMessageByInvolvedEntity(local_48, 102508, local_10.ToWrapper());
        return;
    }
    UFUNCTION()
    void ServerJob_DataTrackBuffStackRemoved(const FCE_BuffRemovedStackNumEvent &inout Event) const
    {
        FPbPlayerLogDsBuffChange local_10;
        int local_11 = 0;
        int local_13 = 0;
        int local_14 = 0;
        this.GetDataTrackEntityParams(Event.Sender, local_11, local_13, local_14);
        local_10.SetEntityType(local_11);
        local_10.SetEntityConfigId(local_13);
        local_10.SetEntityInstanceId(local_14);
        local_10.SetBuffId(Event.BuffConfig.GetUniqueID());
        local_10.SetChangeType(4);
        local_10.SetStacks(int(Event.RemainingStackNum));
        local_10.SetRemainingDuration(Event.BuffDuration);
        int local_19 = 0;
        int local_20 = 0;
        int local_21 = 0;
        this.GetDataTrackEntityParams(Event.BuffFromEntity, local_19, local_20, local_21);
        local_10.SetSourceEntityType(local_19);
        local_10.SetSourceEntityConfigId(local_20);
        local_10.SetSourceEntityInstanceId(local_21);
        FPbPlayerLogDsCombatCommon local_32 = local_10.GetCommon();
        FECSEntity local_50 = this.GetDataTrackPotentialPawn(Event.Sender, Event.BuffFromEntity);
        ::FCombatStateUtils::GetDataTrackPbCombatCommonData(local_50, local_32);
        this.LogDataTrackProtoMessageByInvolvedEntity(local_50, 102508, local_10.ToWrapper());
        return;
    }
    UFUNCTION()
    void ServerJob_DataTrackCheckUncontrollableTag(const FECSEntity &inout Entity, const FC_CombatState &inout CombatState) const
    {
        bool local_2 = FGameplayTagsUtils::Match(Entity, GameplayTags::ESM_MotionFlag_BeHit);
        if (local_2)
        {
            FC_CombatStateUncontrollableTag local_8;
            Assign local_6;
            local_6.opCall(local_8);
            return;
        }
        Remove local_12;
        local_12.opCall();
        return;
    }
    UFUNCTION()
    void ServerJob_DataTrackUpdateUncontrollableDuration(const FECSEntity &inout Entity, FC_CombatState &inout CombatState, const FCS_FixedTime &inout FixedTime) const
    {
        if (CombatState.bInCombat)
        {
            float32 local_6 = CombatState.SelfCombatSession.UncontrollableDuration;
            float local_4 = FixedTime.DeltaTime.ToSeconds();
            local_6 = local_6 + float32(local_4);
            CombatState.SelfCombatSession.UncontrollableDuration = local_6;
            for (auto& local_24 : CombatState.BossCombatSessions)
            {
                local_24;
                float local_4_2 = FixedTime.DeltaTime.ToSeconds();
                local_6 = local_6 + float32(local_4_2);
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_DataTrackOnAITargetListChanged(const FCE_AITargetListChanged &inout Event) const
    {
        int local_6 = 0;
        Has local_34;
        if (!(local_6) || !((int(local_6.GetMonsterRank()) == 2)))
        {
            return;
        }
        for (auto& local_26 : Event.RemovedTargets)
        {
            FECSEntity local_30 = local_26.GetEntity();
            if (!(local_34.opCall()))
            {
                continue;
            }
            FECSEntity local_30_2 = local_26.GetEntity();
            Modify local_38;
            FC_CombatState& local_40 = local_38.opCall();
            if (local_40)
            {
                ::FCombatStateUtils::ExitBossCombatSession(local_26.GetEntity(), Event.Sender, local_40, ECombatSessionEndReason(1));
            }
        }
        for (auto& local_26 : Event.AddedTargets)
        {
            FECSEntity local_46 = local_26.GetEntity();
            if (!(local_34.opCall()))
            {
                continue;
            }
            ::FCombatStateUtils::EnterBossCombatSession(local_26.GetEntity(), Event.Sender);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_DataTrackAvatarSnapshotOnEnter(const FCE_PlayerSpawnEvent &inout Event) const
    {
        if ((int(::FLevelUtils::GetCurrentLevelType())) == 1)
        {
            return;
        }
        FECSEntity local_8 = FECSEntity(Event.Sender);
        Has local_12;
        if (!(local_8.IsValid()) || !(local_12.opCall()))
        {
            return;
        }
        FECSEntity local_22 = ::FASCommonUtils::GetUniqueAvatarPawnEntity(local_8);
        ::FCombatStateUtils::LogDataTrackAvatarSnapshot(local_8, local_22, 1);
        return;
    }
    UFUNCTION()
    void ServerJob_DataTrackOnCombatStateDestroy(const FECSEntity &inout Entity, FC_CombatState &inout CombatState, const FCS_FixedTime &inout FixedTime) const
    {
        int local_64 = 0;
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            Has local_10;
            bool local_5_2 = local_10.opCall();
            if (local_5_2)
            {
                return;
            }
        }
        else
        {
            Get local_14;
            const FC_MonsterInfo& local_16 = local_14.opCall();
            if (local_16)
            {
                if (int(local_16.GetMonsterRank()) == 2)
                {
                    Get local_24;
                    const FC_AITargetingV2& local_26 = local_24.opCall();
                    if (local_26)
                    {
                        for (auto& local_44 : local_26.AllTargets)
                        {
                            if (!(local_44.GetEntity().IsValid()))
                            {
                                continue;
                            }
                            FECSEntity local_48 = local_44.GetEntity();
                            if (!(local_4.opCall()))
                            {
                                continue;
                            }
                            FECSEntity local_48_2 = local_44.GetEntity();
                            Modify local_52;
                            FC_CombatState& local_54 = local_52.opCall();
                            if (local_54)
                            {
                                ::FCombatStateUtils::ExitBossCombatSession(local_44.GetEntity(), Entity, local_54, ECombatSessionEndReason(3));
                            }
                        }
                    }
                }
            }
            return;
        }
        bool local_5_3 = (int(::FLevelUtils::GetCurrentLevelType()) != 1);
        int local_63 = CombatState.SelfCombatSession.SessionID;
        if ((local_63 != 0 && (int(CombatState.SelfCombatSession.EndReason) == 0)))
        {
            if (local_5_3)
            {
                FPbPlayerLogDsCombatEnd local_76;
                FPbPlayerLogDsCombatCommon local_86 = local_76.GetCommon();
                ::FCombatStateUtils::GetDataTrackPbCombatCommonData(Entity, local_86);
                local_76.SetEndStatus(3);
                local_76.SetCombatDuration(::FCombatStateUtils::GetDataTrackCombatDuration(CombatState.SelfCombatSession, FixedTime.Time));
                local_76.SetEngagementDuration(::FCombatStateUtils::GetDataTrackEngagementDuration(CombatState.SelfCombatSession, FixedTime.Time));
                local_76.SetUncontrollableDuration((CombatState.SelfCombatSession.UncontrollableDuration * 1000.0f));
                ::ServerDataTrackerHelper::LogProtoMessage3WithPawn(Entity, 102502, local_76.ToWrapper());
            }
            CombatState.bInCombat = false;
            CombatState.SelfCombatSession.EndReason = ECombatSessionEndReason(3);
        }
        if (local_5_3)
        {
            for (auto& local_122 : CombatState.BossCombatSessions)
            {
                local_122;
                if (local_63 == 0)
                {
                    continue;
                }
                FPbPlayerLogDsBossCombatEnd local_132;
                FPbPlayerLogDsCombatCommon local_96 = local_132.GetCommon();
                ::FCombatStateUtils::GetDataTrackPbCombatCommonData(Entity, local_96);
                local_132.SetBossCombatSessionId(local_64);
                local_132.SetBossId(local_63);
                local_132.SetBossInstanceId(local_64);
                local_132.SetEndStatus(3);
                float32 local_97_2 = ::FCombatStateUtils::GetDataTrackCombatDuration(FixedTime.Time);
                local_132.SetCombatDuration(local_97_2);
                local_132.SetEngagementDuration(::FCombatStateUtils::GetDataTrackEngagementDuration(FixedTime.Time));
                local_97_2 = local_97_2 * 1000.0f;
                local_132.SetUncontrollableDuration(local_97_2);
                ::ServerDataTrackerHelper::LogProtoMessage3WithPawn(Entity, 102504, local_132.ToWrapper());
            }
        }
        CombatState.BossCombatSessions.Empty(0);
        return;
    }
    UFUNCTION()
    void Run_Job_HandleHit() const
    {
        int local_6 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_HitEvent> local_40 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_40.CanProceed;)
        {
            const FCE_HitEvent& local_64 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_65 = FECSEntityScopeCycleCounter(local_64.Sender);
            ECSInternal::PushContextTime(local_64.GetHandleTime());
            this.Job_HandleHit(local_64, local_6);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleBeHitFreezeFrame() const
    {
        int local_6 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_HitEvent> local_40 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_40.CanProceed;)
        {
            const FCE_HitEvent& local_64 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_65 = FECSEntityScopeCycleCounter(local_64.Sender);
            ECSInternal::PushContextTime(local_64.GetHandleTime());
            this.Job_HandleBeHitFreezeFrame(local_64, local_6);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleBeHitFreezeFrameEvent() const
    {
        int local_6 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_BeHitFreezeFrame> local_40 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_40.CanProceed;)
        {
            const FCE_BeHitFreezeFrame& local_64 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_65 = FECSEntityScopeCycleCounter(local_64.Sender);
            ECSInternal::PushContextTime(local_64.GetHandleTime());
            this.Job_HandleBeHitFreezeFrameEvent(local_64, local_6);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_UpdateDeathResistance() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorDeathResistanceOnModifyView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_UpdateDeathResistance(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = this.GetECSWorld().__GetMonitorDeathResistanceOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_UpdateDeathResistance(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleDeadDuringDeathResistance() const
    {
        int local_6 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DeadDuringDeathResistanceEvent> local_40 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_40.CanProceed;)
        {
            const FCE_DeadDuringDeathResistanceEvent& local_64 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_65 = FECSEntityScopeCycleCounter(local_64.Sender);
            ECSInternal::PushContextTime(local_64.GetHandleTime());
            this.ServerJob_HandleDeadDuringDeathResistance(local_64, local_6);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_CheckDeath() const
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
                this.ServerJob_CheckDeath(local_40, local_42, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Exclude(local_84).opCall();
        Exclude(local_84).opCall();
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
            this.ServerJob_CheckDeath(local_174, local_42, local_6);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleDeath() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DeathEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DeathEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleDeath(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateDeferDeathTransition() const
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
                this.Job_UpdateDeferDeathTransition(local_40, local_42, local_6);
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
            this.Job_UpdateDeferDeathTransition(local_174, local_42, local_6);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleReborn() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_Reborn> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_Reborn& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleReborn(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleHitBreakRecover() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_170 = 0;
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
                this.Job_HandleHitBreakRecover(local_40, local_42, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_40 = local_132.Proceed();
            ++local_98;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_HandleHitBreakRecover(local_170, local_42, local_6);
        }
        local_4.UpdateCachedEntityCount(local_98);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_CheckAndClearNotHandledBeHitContext() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorDisableSyncNetTimeOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_CheckAndClearNotHandledBeHitContext(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = this.GetECSWorld().__GetMonitorDisableSyncNetTimeOnModifyView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_CheckAndClearNotHandledBeHitContext(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleBossLowHPDetect() const
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
                this.Job_HandleBossLowHPDetect(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Exclude(local_80).opCall();
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
            this.Job_HandleBossLowHPDetect(local_162, local_38);
        }
        local_2.UpdateCachedEntityCount(local_90);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DataTrackSkillTransit() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_SkillTransitComplete> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_SkillTransitComplete& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_DataTrackSkillTransit(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_DataTrackOnMonsterSpawnListenPhaseChange() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorMonsterInfoOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_DataTrackOnMonsterSpawnListenPhaseChange(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DataTrackEntityBBChange() const
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
                this.ServerJob_DataTrackEntityBBChange(local_36, local_38, local_44);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Exclude(local_86).opCall();
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
            this.ServerJob_DataTrackEntityBBChange(local_172, local_38, local_44);
        }
        local_2.UpdateCachedEntityCount(local_100);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DataTrackBossDeath() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DeathEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DeathEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_DataTrackBossDeath(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DataTrackCombatEffectDamage() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DamageEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DamageEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_DataTrackCombatEffectDamage(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DataTrackCombatEffectHeal() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_HealedEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_HealedEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_DataTrackCombatEffectHeal(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DataTrackDodge() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_InvincibleCounterEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_InvincibleCounterEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_DataTrackDodge(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DataTrackPerfectDodge() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PerfectDodgeEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PerfectDodgeEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_DataTrackPerfectDodge(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DataTrackBlock() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DefenseHitEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DefenseHitEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_DataTrackBlock(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DataTrackExecution() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ExecutionStateChangedEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ExecutionStateChangedEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_DataTrackExecution(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DataTrackBuffAdded() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_BuffAddedEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_BuffAddedEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_DataTrackBuffAdded(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DataTrackBuffRemoved() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_BuffRemovedEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_BuffRemovedEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_DataTrackBuffRemoved(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DataTrackBuffStackRemoved() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_BuffRemovedStackNumEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_BuffRemovedStackNumEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_DataTrackBuffStackRemoved(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DataTrackCheckUncontrollableTag() const
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
                this.ServerJob_DataTrackCheckUncontrollableTag(local_36, local_38);
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
            this.ServerJob_DataTrackCheckUncontrollableTag(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DataTrackUpdateUncontrollableDuration() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_178 = 0;
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
                this.ServerJob_DataTrackUpdateUncontrollableDuration(local_40, local_42, local_6);
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
        Include local_100;
        local_100.opCall();
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_106 = 0;
        FECSRuntimeViewIterator local_140 = local_88.Iterator();
        for (; local_140.CanProceed;)
        {
            local_40 = local_140.Proceed();
            ++local_106;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_DataTrackUpdateUncontrollableDuration(local_178, local_42, local_6);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_106);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DataTrackOnAITargetListChanged() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_AITargetListChanged> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_AITargetListChanged& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_DataTrackOnAITargetListChanged(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DataTrackAvatarSnapshotOnEnter() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerSpawnEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayerSpawnEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_DataTrackAvatarSnapshotOnEnter(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DataTrackOnCombatStateDestroy() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_170 = 0;
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
                this.ServerJob_DataTrackOnCombatStateDestroy(local_40, local_42, local_6);
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
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_88.Iterator();
        for (; local_132.CanProceed;)
        {
            local_40 = local_132.Proceed();
            ++local_98;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_DataTrackOnCombatStateDestroy(local_170, local_42, local_6);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_98);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
}


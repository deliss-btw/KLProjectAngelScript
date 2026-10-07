
const FConsoleVariable CVar_HUDSlotUseBehaviorSemantic = FConsoleVariable();

class US_CombatHUDSystem : UECSScriptSystem
{
    US_CombatHUDSystem()
    {
        return;
    }
    UFUNCTION()
    void ClientJob_HandleBuffAddedEvent(const FCE_BuffAddedEvent &inout Event) const
    {
        if ((!((FECSEntity(Event.Sender) == ::FASCommonUtils::GetLocalPlayerPawnEntity()))))
        {
            return;
        }
        FFPTime local_18 = FFPTime(-1);
        FCE_CombatHUD local_12;
        local_12.CombatHUDReason = ECombatHUDReason(10);
        local_12.bEnabled = true;
        return;
    }
    UFUNCTION()
    void ClientJob_StartItemAction(const FCE_ItemActionStart &inout Event) const
    {
        if ((!((FECSEntity(Event.Sender) == ::FASCommonUtils::GetLocalPlayerPawnEntity()))))
        {
            return;
        }
        FFPTime local_18 = FFPTime(-1);
        FCE_CombatHUD local_12;
        local_12.CombatHUDReason = ECombatHUDReason(11);
        local_12.bEnabled = true;
        return;
    }
    UFUNCTION()
    void ClientJob_CombatHUDMainTick(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime) const
    {
        bool local_46;
        Has local_12;
        bool local_13 = local_12.opCall();
        FC_CombatHUDCache local_2;
        bool local_7 = !(local_2.bLastCacheInCombat);
        if (!(local_13) != local_7)
        {
            FCE_CombatHUD local_16;
            FFPTime local_22 = FFPTime(-1);
            local_16.CombatHUDReason = ECombatHUDReason(1);
            local_16.bEnabled = local_13;
        }
        local_2.bLastCacheInCombat = local_13;
        Has local_28;
        bool local_7_2 = local_28.opCall();
        bool local_13_2 = !(local_7_2);
        if (local_13_2 != !(local_2.bLastLockTarget))
        {
            FCE_CombatHUD local_16;
            FFPTime local_22_2 = FFPTime(-1);
            local_16.CombatHUDReason = ECombatHUDReason(2);
            local_16.bEnabled = local_7_2;
        }
        local_2.bLastLockTarget = local_7_2;
        Get local_32;
        const FC_CharacterPoseState& local_34 = local_32.opCall();
        if (local_34)
        {
            FCE_CombatHUD local_16;
            bool local_7_3 = local_34.GetbIsAiming();
            if (!(local_7_3) != !(local_2.bLastAim))
            {
                FFPTime local_22_3 = FFPTime(-1);
                local_16.CombatHUDReason = ECombatHUDReason(3);
                local_16.bEnabled = local_7_3;
            }
            local_2.bLastAim = local_7_3;
        }
        else
        {
            FCE_CombatHUD local_16;
            bool local_13_4 = !(local_2.bLastAim);
            if (local_13_4 == !(true))
            {
                FFPTime local_22_4 = FFPTime(-1);
                local_16.CombatHUDReason = ECombatHUDReason(3);
                local_16.bEnabled = false;
            }
            bool local_13_5 = false;
            local_2.bLastAim = local_13_5;
        }
        Get local_38;
        const FC_GameAttributeView& local_40 = local_38.opCall();
        if (local_40)
        {
            FCE_CombatHUD local_16;
            float32 local_42 = local_40.GetAttributeValue(Attribute::HPMax, ECS::GetContextTime());
            float32 local_41 = local_40.GetAttributeValue(Attribute::StaminaMax, ECS::GetContextTime());
            if ((local_42 != local_2.LastHPMax || (local_41 != local_2.LastStaminaMax)))
            {
                FFPTime local_22_5 = FFPTime(-1);
                local_16.CombatHUDReason = ECombatHUDReason(8);
                local_16.bEnabled = true;
            }
            local_2.LastHPMax = local_42;
            local_2.LastStaminaMax = local_41;
        }
        const FC_GameAttributeView& local_40_2 = local_38.opCall();
        if (local_40_2)
        {
            FCE_CombatHUD local_16;
            float32 local_43 = local_40_2.GetAttributeValue(Attribute::HP, ECS::GetContextTime());
            float32 local_42_2 = local_40_2.GetAttributeValue(Attribute::Stamina, ECS::GetContextTime());
            if (local_43 != local_2.LastHP)
            {
                FFPTime local_22_6 = FFPTime(-1);
                local_16.CombatHUDReason = ECombatHUDReason(6);
                local_16.bEnabled = true;
            }
            if (local_42_2 != local_2.LastStamina)
            {
                FFPTime local_22_7 = FFPTime(-1);
                local_16.CombatHUDReason = ECombatHUDReason(7);
                local_16.bEnabled = true;
            }
            local_2.LastHP = local_43;
            local_2.LastStamina = local_42_2;
        }
        bool local_13_6 = Entity.MatchGameplayTag(GameplayTags::CombatState_HasShield);
        bool local_7_4 = !(local_13_6);
        if (local_7_4 != !(local_2.bLastHasShield))
        {
            FCE_CombatHUD local_16;
            FFPTime local_22_8 = FFPTime(-1);
            local_16.CombatHUDReason = ECombatHUDReason(9);
            local_16.bEnabled = local_13_6;
        }
        local_2.bLastHasShield = local_13_6;
        if ((CVar_HUDSlotUseBehaviorSemantic.GetInt() != 0))
        {
            local_46 = this.IsAnySkillSlotActive(Entity);
        }
        else
        {
            local_46 = this.IsAnyAttackInputPressed(Entity);
        }
        bool local_7_5 = !(local_2.bLastAttackPress);
        if (!(local_46) != local_7_5)
        {
            FCE_CombatHUD local_16;
            FFPTime local_22_9 = FFPTime(-1);
            local_16.CombatHUDReason = ECombatHUDReason(4);
            local_16.bEnabled = local_46;
        }
        local_2.bLastAttackPress = local_46;
        if ((CVar_HUDSlotUseBehaviorSemantic.GetInt() != 0))
        {
            local_7_5 = this.IsAnyItemSlotActive(Entity);
        }
        else
        {
            local_7_5 = this.IsAnyItemInputJustPressed(Entity, FixedTime);
        }
        if (local_7_5)
        {
            FCE_CombatHUD local_16;
            FFPTime local_22_10 = FFPTime(-1);
            local_16.CombatHUDReason = ECombatHUDReason(11);
            bool local_13_7 = true;
            local_16.bEnabled = local_13_7;
        }
        return;
    }
    bool IsAnyAttackInputPressed(const FECSEntity &inout Entity) const
    {
        return FCharacterInputUtils::IsInputSlotPressed(Entity, EESMTriggerInputSlot(1)) || FCharacterInputUtils::IsInputSlotPressed(Entity, EESMTriggerInputSlot(2)) || FCharacterInputUtils::IsInputSlotPressed(Entity, EESMTriggerInputSlot(3)) || FCharacterInputUtils::IsInputSlotPressed(Entity, EESMTriggerInputSlot(4)) || FCharacterInputUtils::IsInputSlotPressed(Entity, EESMTriggerInputSlot(5)) || FCharacterInputUtils::IsInputSlotPressed(Entity, EESMTriggerInputSlot(10)) || FCharacterInputUtils::IsInputSlotPressed(Entity, EESMTriggerInputSlot(11)) || FCharacterInputUtils::IsInputSlotPressed(Entity, EESMTriggerInputSlot(12));
    }
    bool IsAnyItemInputJustPressed(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime) const
    {
        return FCharacterInputUtils::IsInputSlotJustPressed(Entity, EESMTriggerInputSlot(30), FixedTime.LastTime, FixedTime.Time) || FCharacterInputUtils::IsInputSlotJustPressed(Entity, EESMTriggerInputSlot(31), FixedTime.LastTime, FixedTime.Time) || FCharacterInputUtils::IsInputSlotJustPressed(Entity, EESMTriggerInputSlot(32), FixedTime.LastTime, FixedTime.Time) || FCharacterInputUtils::IsInputSlotJustPressed(Entity, EESMTriggerInputSlot(33), FixedTime.LastTime, FixedTime.Time);
    }
    bool IsAnySkillSlotActive(const FECSEntity &inout Entity) const
    {
        int local_6 = 0;
        if (!(local_6))
        {
            return false;
        }
        return this.IsSkillSlotActive(local_6, ESkillSlot(1)) || this.IsSkillSlotActive(local_6, ESkillSlot(2)) || this.IsSkillSlotActive(local_6, ESkillSlot(3)) || this.IsSkillSlotActive(local_6, ESkillSlot(5)) || this.IsSkillSlotActive(local_6, ESkillSlot(6)) || this.IsSkillSlotActive(local_6, ESkillSlot(4)) || this.IsSkillSlotActive(local_6, ESkillSlot(7)) || this.IsSkillSlotActive(local_6, ESkillSlot(9));
    }
    bool IsSkillSlotActive(const FC_Skill &inout SkillComp, const ESkillSlot Slot) const
    {
        int local_2 = SkillComp.IndexOfSkill(ESkillSlot(Slot));
        return local_2 >= 0 && SkillComp.GetSkillRuntimeInfos().IsValidIndex(local_2) && (int(SkillComp.GetSkillRuntimeInfos()[local_2].GetActiveState()) == 1);
    }
    bool IsAnyItemSlotActive(const FECSEntity &inout Entity) const
    {
        int local_6 = 0;
        EESMTriggerInputSlot local_15;
        if (!(local_6))
        {
            return false;
        }
        int local_8 = 0;
        for (; local_8 < local_6.GetSkillInstanceNum(); ++local_8)
        {
            if (!(local_6.GetSkillRuntimeInfos().IsValidIndex(local_8)))
            {
                continue;
            }
            const FSkillRuntimeInfo& local_12 = local_6.GetSkillRuntimeInfos()[local_8];
            if (int(local_12.GetActiveState()) != 1)
            {
                continue;
            }
            local_15 = local_12.GetInputSlot();
            if ((int(local_15) == 30 || (int(local_15) == 31) || (int(local_15) == 32) || (int(local_15) == 33)))
            {
                return true;
            }
        }
        return false;
    }
    UFUNCTION()
    void Run_ClientJob_HandleBuffAddedEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_BuffAddedEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_BuffAddedEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleBuffAddedEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_StartItemAction() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ItemActionStart> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ItemActionStart& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_StartItemAction(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_CombatHUDMainTick() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_164 = 0;
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
                this.ClientJob_CombatHUDMainTick(local_40, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_78 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_82;
        local_82.opCall();
        Include local_86;
        local_86.opCall();
        Exclude(local_78).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_92 = 0;
        FECSRuntimeViewIterator local_126 = local_78.Iterator();
        for (; local_126.CanProceed;)
        {
            local_40 = local_126.Proceed();
            ++local_92;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ClientJob_CombatHUDMainTick(local_164, local_6);
        }
        local_4.UpdateCachedEntityCount(local_92);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
}



const FConsoleVariable CVar_Skill_AllowPreInputInCD = FConsoleVariable();

class US_SkillSystem : UECSScriptSystem
{
    US_SkillSystem()
    {
        return;
    }
    UFUNCTION()
    void ClientJob_SkillSystemOnEnterDS(const FCS_NetReceiveSnapshot &inout ReceiveSnapshot) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        Get local_6;
        if (local_6.opCall())
        {
            Has local_14;
            if (!(local_14.opCall()))
            {
                FECSWorldPtr local_16 = this.GetECSWorld();
                Modify local_20;
                FCS_InputBlockLocal& local_22 = local_20.opCall();
                if (local_22)
                {
                    local_22.BlockedInputNames.Empty(0);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_UpdateLocalInputBlockBySkillPanel(const FECSEntity &inout PlayerControllerEntity, const FC_ChangeSkillPanel &inout ChangeSkillPanel) const
    {
        int local_16 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        if ((!((PlayerControllerEntity == 0.PlayerEntity))))
        {
            return;
        }
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        local_16.BlockedInputNames.Empty(0);
        if (ChangeSkillPanel.GetSkillBtnConfig())
        {
            local_16.BlockedInputNames.Append(ChangeSkillPanel.GetSkillBtnConfig().opArrow().BanInputNames);
        }
        return;
    }
    UFUNCTION()
    void Monitor_ClearLocalInputBlockBySkillPanelRemoved(const FECSEntity &inout PlayerControllerEntity, const FC_ChangeSkillPanel &inout ChangeSkillPanel) const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        if ((!((PlayerControllerEntity == 0.PlayerEntity))))
        {
            return;
        }
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        Modify local_14;
        FCS_InputBlockLocal& local_16 = local_14.opCall();
        if (local_16)
        {
            local_16.BlockedInputNames.Empty(0);
        }
        return;
    }
    void DoClearSkillBeforeDestroy(const FECSEntity &inout Entity, FC_Skill &inout Skill) const
    {
        TArray<FECSEntityId> local_4 = Skill.GetInstances();
        for (auto& local_20 : local_4)
        {
            FECSEntity local_24 = FECSEntity(local_20);
            if (local_24.IsValid())
            {
                Has local_28;
                bool local_17 = local_28.opCall();
                if (local_17)
                {
                    FAbilityUtils::RemoveAbility(local_24, Entity, EEASAbilityEndType(0));
                }
                local_24.DestroyDeferred();
            }
            else
            {
                XError(ELog(0), FString().Append("SkillInstanceEntity is invalid when destroy entity, SkillInstanceId: '").Append(local_20).Append("', destroy entity: '").Append(Entity.ToString()).Append("'!"));
            }
        }
        return;
    }
    UFUNCTION()
    void Job_ClearSkillBeforeDestroy(const FECSEntity &inout Entity, FC_Skill &inout Skill) const
    {
        this.DoClearSkillBeforeDestroy(Entity, Skill);
        return;
    }
    UFUNCTION()
    void Job_ClearSkillBeforeDestroyLocalEntity(const FECSEntity &inout Entity, FC_Skill &inout Skill) const
    {
        this.DoClearSkillBeforeDestroy(Entity, Skill);
        return;
    }
    UFUNCTION()
    void Job_InitCharacterSkillConfig(const FECSEntity &inout Entity, const FC_ControlledByPlayer &inout ControlledByPlayer) const
    {
        int local_6 = 0;
        UDataTable local_86;
        int local_122 = 0;
        int local_130 = 0;
        int local_132 = 0;
        int local_165;
        USkillConfig local_216;
        int local_346 = 0;
        if (!(local_6))
        {
            return;
        }
        TDataObjectPtr<FAvatarPrefabConfig> local_32 = ::GetAvatarConfig(Entity);
        if (!(local_32))
        {
            return;
        }
        TArray<TDataObjectPtr<FSkillInitConfig>> local_62 = ::FAvatarPrefabConfig::GetEffectiveSkills(Entity.GetWorld(), local_32);
        for (auto& local_82 : local_62)
        {
            local_86 = Cast<UDataTable>(local_82.GetRoot());
            if (local_86 != nullptr)
            {
                break;
            }
        }
        FECSWorldPtr local_58 = Entity.GetWorld();
        GetDefaulted local_92;
        bool local_7 = (int(local_92.opCall().GetGameModeType()) != 0);
        TMap<ESkillSlot, FSkillInitInfo> local_116;
        bool local_87 = !(local_7);
        if (!(local_87))
        {
            local_87 = false;
        }
        else
        {
            local_87 = local_122;
        }
        if (local_87)
        {
            int local_131;
            local_131 = local_132;
            for (auto& local_146 : local_122.GetAvatarList())
            {
                local_132 = local_146.GetAvatarId();
                if (local_132 != local_131)
                {
                    continue;
                }
                for (auto& local_164 : local_146.GetAvatarTalentEquipList().GetTalentIdBySkillSlot())
                {
                    local_165 = local_132;
                    if (local_130)
                    {
                        local_165 = ::FTalentUtils::GetHighestUnlockedTalentIdInChain(local_132, local_130.GetUnlockTalentList());
                    }
                    if (!(::FTalentUtils::GetSkillInitConfigByTalentId(local_165)) || !((local_216 != nullptr)))
                    {
                        continue;
                    }
                    GetDataObjectByGSDataId<FTalentConfig> local_264;
                    TDataObjectPtr<FTalentConfig> local_240 = local_264.opImplConv();
                    FSkillInitInfo local_316;
                    ESkillSlot local_317 = local_164.GetKey();
                    if (local_240)
                    {
                    }
                    else
                    {
                    }
                }
                break;
            }
        }
        if (local_7)
        {
            for (auto& local_82 : local_62)
            {
                if (local_82)
                {
                    const FSkillInitConfig& local_320;
                    if (local_320.bIsDefault && ((local_320.SkillConfig != nullptr)))
                    {
                        if (local_116.Contains(local_320.DefaultSkillSlot))
                        {
                            continue;
                        }
                        FSkillInitInfo local_316;
                        local_316.SkillConfig = local_320.SkillConfig;
                        ESkillSlot local_317_2 = local_320.DefaultSkillSlot;
                        local_116.Add(local_320.DefaultSkillSlot, local_316);
                    }
                }
            }
        }
        for (auto& local_340 : local_116)
        {
            local_340;
            local_346.InitSkills.Add();
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateESMTriggerInputBinding(const FECSEntity &inout Entity, const FC_ESMTriggerInputBinding &inout Bindings, const FC_Input &inout Input, const FCS_FixedTime &inout FixedTime, FC_ESMTrigger &inout ESMTrigger) const
    {
        int local_14 = 0;
        TArrayConstIterator<FESMInputTriggerItem> local_42;
        int local_78 = 0;
        ::FASCommonUtils::GetUniquePlayerEntity(Entity);
        for (auto& local_34 : Bindings.GetBindingsBySlot())
        {
            if (local_14.IsSlotBlocked(EESMTriggerInputSlot(local_34.GetKey())))
            {
                continue;
            }
            for (; local_42.CanProceed;)
            {
                const FESMInputTriggerItem& local_50 = local_42.Proceed();
                FActiveTriggerResult local_66 = FCharacterInputUtils::TestInputTriggerItem(local_50, Input, FixedTime.LastTime, FixedTime.Time, ESMTrigger.Storage);
                if (local_66.bClear || (local_66.bActive && ((FFPTime(local_66.TriggerTime).opCmp(FixedTime.Time) <= 0)) && ((local_66.GetTriggerExpireTime().opCmp(FixedTime.LastTime) >= 0))))
                {
                    local_78.ActiveTriggerResultByName.Add(local_50.OutputTrigger, local_66);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateSimpleInputSkill(const FECSEntity &inout Entity, const FC_SimpleInputSkill &inout SimpleInputSkill, const FCS_FixedTime &inout FixedTime, FC_ESMTrigger &inout ESMTrigger) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_UpdateSkillInput(const FECSEntity &inout Entity, FC_Skill &inout Skill, const FC_ESMCommonTriggerInputResult &inout InputResult, const FCS_FixedTime &inout FixedTime, FC_ESMTrigger &inout ESMTrigger) const
    {
        const USkillConfig local_42;
        const USkillConfig local_44;
        int local_2 = Skill.GetSkillRuntimeInfos().Num();
        int local_3 = 0;
        for (; local_3 < local_2; ++local_3)
        {
            const FSkillRuntimeInfo& local_8 = Skill.GetSkillRuntimeInfos()[local_3];
            for (auto& local_22 : local_8.GetInputTriggerNames())
            {
                FActiveTriggerResult local_30;
                if (InputResult.ActiveTriggerResultByName.Find(local_22, local_30))
                {
                    TSoftObjectPtr<USkillConfig> local_40 = Skill.GetSkillRuntimeInfos()[local_3].GetSkillConfig();
                    local_44 = local_42;
                    if (local_44 == nullptr)
                    {
                        continue;
                    }
                    if (local_44.InputConfig.IsEmpty())
                    {
                        FSkillInputTriggerConfig local_90;
                        if (local_44.GetDefaultInputConfig(local_90))
                        {
                            const FC_SkillInstance& local_92 = Skill.GetSkillInstance(local_3);
                            if (local_92)
                            {
                                this.ValidateSkillTrigger(Entity, Skill, local_90, local_30, local_3, local_92, ESMTrigger, FixedTime);
                            }
                        }
                    }
                    else
                    {
                        for (auto& local_106 : local_44.InputConfig)
                        {
                            if (!(local_106.CoreTriggerItem.OutputTrigger.IsEqual(local_22, true, true)))
                            {
                                continue;
                            }
                            const FC_SkillInstance& local_92_2 = Skill.GetSkillInstance(local_3);
                            if (local_92_2)
                            {
                                this.ValidateSkillTrigger(Entity, Skill, local_106, local_30, local_3, local_92_2, ESMTrigger, FixedTime);
                            }
                            break;
                        }
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_ClearESMCommonTriggerInputResult() const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        FECSWorldPtr::Clear(local_2).opCall(EECSRegType(0));
        return;
    }
    bool ValidateSkillTrigger(const FECSEntity &inout Entity, FC_Skill &inout Skill, const FSkillInputTriggerConfig &inout SkillInputConfig, const FActiveTriggerResult &inout InResult, const int SkillIndex, const FC_SkillInstance &inout Instance, FC_ESMTrigger &inout ESMTrigger, const FCS_FixedTime &inout FixedTime) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        bool __r; return __r;
    }
    UFUNCTION()
    void Job_HandleSimpleSkillRecoverSpeedChange(const FECSEntity &inout Entity, const FC_GameAttributeChanged &inout GameAttributeChanged) const
    {
        int local_8 = 0;
        int local_14 = 0;
        int local_56 = 0;
        const USkillConfig local_102;
        FECSWorldPtr local_2 = this.GetECSWorld();
        bool local_15 = false;
        int local_17 = 0;
        for (; local_17 < GameAttributeChanged.GetChangedAttributeNum(); ++local_17)
        {
            FGameAttributeRef local_34 = local_14.GetAttributeRef(GameAttributeChanged.GetChangedAttributeLocalIndex(local_17));
            int local_49 = Attribute::SimpleSkillRecoverSpeed.GetGlobalIndex();
            if (local_34.GetGlobalIndex() == local_49)
            {
                local_15 = true;
                break;
            }
        }
        if (!(local_15))
        {
            return;
        }
        if (!(local_56))
        {
            return;
        }
        FFPTime local_58 = FFPTime(local_8.Time);
        float32 local_60 = local_14.GetAttributeValue(Attribute::SimpleSkillRecoverSpeed, local_58);
        Get local_64;
        const FC_Skill& local_66 = local_64.opCall();
        if (local_66)
        {
            for (auto& local_80 : local_66.GetInstances())
            {
                FECSEntity local_84 = FECSEntity(local_80);
                Modify local_88;
                FC_SkillInstance& local_90 = local_88.opCall();
                if (local_90)
                {
                    TSoftObjectPtr<USkillConfig> local_100 = local_90.GetSkillConfig();
                    if (this.CheckSkillSlotIsSimpleSkill(local_102.Slot))
                    {
                        float32 local_104;
                        float32 local_59 = local_90.GetSimpleSkillRecoverSpeed();
                        local_104 = local_59;
                        local_90.SetSimpleSkillRecoverSpeed(local_60);
                        local_59 = local_104 + 1.0f;
                        local_59 = local_59 / (local_60 + 1.0f);
                        if (local_90.IsInCD(local_58))
                        {
                            local_90.GetModify_CDCost().SetRecover(local_58, local_90.GetCDCost().Evaluate(local_58), 0.0f, (float32(((local_90.GetCDCost().FindNextTime(1.0f, local_58) - local_58).ToSeconds())) * local_59), 1.0f);
                            int local_49_2 = local_90.GetMaxUsableTimes();
                            if (local_49_2 > 1)
                            {
                                float32 local_107 = local_90.GetUsableTimeCost().Evaluate(local_58);
                                if (local_107 != local_49_2)
                                {
                                    local_90.GetModify_UsableTimeCost().SetRecover(local_58, local_107, 0.0f, ((float32(((local_90.GetUsableTimeCost().FindNextTime(local_49_2, local_58) - local_58).ToSeconds()))) * local_59), local_49_2);
                                }
                            }
                        }
                    }
                }
            }
        }
        return;
    }
    bool CheckSkillSlotIsSimpleSkill(const ESkillSlot Slot) const
    {
        if ((int(Slot) == 3 || (int(Slot) == 5) || (int(Slot) == 6)))
        {
            return true;
        }
        return false;
    }
    UFUNCTION()
    void Run_ClientJob_SkillSystemOnEnterDS() const
    {
        Has local_8;
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_3 = this.GetECSWorld();
        this.ClientJob_SkillSystemOnEnterDS(local_12);
        return;
    }
    UFUNCTION()
    void Run_Monitor_UpdateLocalInputBlockBySkillPanel() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorChangeSkillPanelOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_UpdateLocalInputBlockBySkillPanel(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorChangeSkillPanelOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_UpdateLocalInputBlockBySkillPanel(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ClearLocalInputBlockBySkillPanelRemoved() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorChangeSkillPanelOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ClearLocalInputBlockBySkillPanelRemoved(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearSkillBeforeDestroy() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
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
                this.Job_ClearSkillBeforeDestroy(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_ClearSkillBeforeDestroy(local_170, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearSkillBeforeDestroyLocalEntity() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        MarkModifiedIfDirty local_48;
        int local_168 = 0;
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
                this.Job_ClearSkillBeforeDestroyLocalEntity(local_38, local_40);
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
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_96 = 0;
        FECSRuntimeViewIterator local_130 = local_86.Iterator();
        for (; local_130.CanProceed;)
        {
            local_38 = local_130.Proceed();
            ++local_96;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_ClearSkillBeforeDestroyLocalEntity(local_168, local_40);
            local_48.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_96);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_InitCharacterSkillConfig() const
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
                this.Job_InitCharacterSkillConfig(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
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
            this.Job_InitCharacterSkillConfig(local_162, local_38);
        }
        local_2.UpdateCachedEntityCount(local_90);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateESMTriggerInputBinding() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        MarkModifiedIfDirty local_62;
        int local_194 = 0;
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
                this.Job_UpdateESMTriggerInputBinding(local_40, local_42, local_48, local_6, local_54);
                local_62.opCall(local_54);
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
        Exclude(local_100).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_122 = 0;
        FECSRuntimeViewIterator local_156 = local_100.Iterator();
        for (; local_156.CanProceed;)
        {
            local_40 = local_156.Proceed();
            ++local_122;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_UpdateESMTriggerInputBinding(local_194, local_42, local_48, local_6, local_54);
            local_62.opCall(local_54);
        }
        local_4.UpdateCachedEntityCount(local_122);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateSimpleInputSkill() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_188 = 0;
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
                this.Job_UpdateSimpleInputSkill(local_40, local_42, local_6, local_48);
                FECSEntity::MarkModifiedIfDirty<FC_ESMTrigger> local_56;
                local_56.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Exclude(local_94).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_116 = 0;
        FECSRuntimeViewIterator local_150 = local_94.Iterator();
        for (; local_150.CanProceed;)
        {
            local_40 = local_150.Proceed();
            ++local_116;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_UpdateSimpleInputSkill(local_188, local_42, local_6, local_48);
            FECSEntity::MarkModifiedIfDirty<FC_ESMTrigger>(local_40).opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_116);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateSkillInput() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        MarkModifiedIfDirty local_62;
        MarkModifiedIfDirty local_66;
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
                this.Job_UpdateSkillInput(local_40, local_42, local_48, local_6, local_54);
                local_62.opCall(local_42);
                local_66.opCall(local_54);
            }
            local_4.UpdateCachedEntityCount(local_17);
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
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_126 = 0;
        FECSRuntimeViewIterator local_160 = local_104.Iterator();
        for (; local_160.CanProceed;)
        {
            local_40 = local_160.Proceed();
            ++local_126;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_UpdateSkillInput(local_198, local_42, local_48, local_6, local_54);
            local_62.opCall(local_42);
            local_66.opCall(local_54);
        }
        local_4.UpdateCachedEntityCount(local_126);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearESMCommonTriggerInputResult() const
    {
        ECS::GetContextJob();
        this.Job_ClearESMCommonTriggerInputResult();
        return;
    }
    UFUNCTION()
    void Run_Job_HandleSimpleSkillRecoverSpeedChange() const
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
                this.Job_HandleSimpleSkillRecoverSpeedChange(local_36, local_38);
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
            this.Job_HandleSimpleSkillRecoverSpeedChange(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}


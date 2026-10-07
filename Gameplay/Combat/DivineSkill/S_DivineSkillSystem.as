

class US_DivineSkillSystem : UECSScriptSystem
{
    UPROPERTY()
    UDataTable EquipableSkillDataTable;

    US_DivineSkillSystem()
    {
        return;
    }
    UFUNCTION()
    void Monitor_InitCharacterDivineSkillWithoutGS(const FECSEntity &inout Entity, const FC_PlayerController &inout PlayerController) const
    {
        int local_18 = 0;
        if (!(::UGameDSConnectionSubsystem::Get().IsConnectedToGameServer()))
        {
            FECSWorldPtr local_6 = ECS::GetECSWorld();
            Has local_10;
            bool local_3 = local_10.opCall();
            if (local_3)
            {
                int local_11;
                local_11 = PlayerController.GetPlayerId();
                FECSWorldPtr local_6_2 = ECS::GetECSWorld();
                if (local_18.GetPlayerMatchDatas().Contains(local_11) && (int(local_18.GetPlayerMatchDatas()[local_11].GetFaction()) == 6))
                {
                    return;
                }
            }
            if (this.EquipableSkillDataTable != nullptr)
            {
                EDivineSkillType local_29;
                FName local_28 = ::FGameModeUtils::GetDivineSkillDisplayTag();
                local_29 = EDivineSkillType(0);
                if ((!((local_28 == NAME_None))))
                {
                    local_29 = ::DivineSkillUtils::FilterTagToDivineSkillType(local_28);
                }
                for (auto& local_48 : this.EquipableSkillDataTable.GetRowNames())
                {
                    FDivineSkillData local_72;
                    UDataTable::FindDataObject local_76;
                    TDataObjectPtr<FDivineSkillConfig> local_100 = local_76.opCall(local_48);
                    if (local_100 && (int(local_100.opArrow().DivineSkillType) != int(local_29)))
                    {
                        continue;
                    }
                    local_72.SetSkillConfig(local_100);
                    ModifyOrAdd local_128;
                    this.UpdateDivineSkillData(Entity, local_128.opCall(), PlayerController, local_72, Entity.GetWorld().GetFixedTime());
                    break;
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_UpdateDivineSkillChangeWithoutGS(const FCE_ChangeDivineSkillWithOutGS &inout Event, const FCS_FixedTime &inout FixedTime) const
    {
        if (Event.DivineSkillConfig)
        {
            FDivineSkillData local_26;
            local_26.SetSkillConfig(Event.DivineSkillConfig);
            Get local_30;
            ModifyOrAdd local_34;
            this.UpdateDivineSkillData(Event.Sender, local_34.opCall(), local_30.opCall(), local_26, FixedTime);
        }
        return;
    }
    void OnUpdatePlayerEntityDivineSkillSuitable(const FECSEntity &inout Entity, const FC_ControlledByPlayer &inout ControlledByPlayer) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    UFUNCTION()
    void Monitor_ServerOnCharacterTalentChanged(const FECSEntity &inout Entity, const FC_CharacterTalent &inout CharacterTalent) const
    {
        bool local_7;
        int local_14 = 0;
        int local_20 = 0;
        Get local_6;
        const FC_ControlledByPlayer& local_2 = local_6.opCall();
        if (local_2)
        {
            if (!(local_20))
            {
                local_7 = false;
            }
            else
            {
                local_7 = local_14;
            }
            if (local_7)
            {
                if (local_20.GetDivineSkillData().GetSkillConfig())
                {
                    local_7 = ::DivineSkillUtils::SuitForPlayerCurrentAvatars(local_20.GetDivineSkillData().GetSkillConfig(), local_2.GetPlayerEntity());
                    if (!(local_7) != !(local_20.GetbHasSuitableCharacter()))
                    {
                        FC_DivineSkillSuitableUpdateTag local_28;
                        Assign local_26;
                        local_26.opCall(local_28);
                        local_20.SetbHasSuitableCharacter(local_7);
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_InitNewlyCreatedCharacterDivineSkill(const FECSEntity &inout Entity, const FC_ControlledByPlayer &inout ControlledByPlayer) const
    {
        this.OnUpdatePlayerEntityDivineSkillSuitable(Entity, ControlledByPlayer);
        return;
    }
    UFUNCTION()
    void Job_ClearCommissionEnterDivineSkillResetMark(const FECSEntity &inout PlayerEntity, const FC_PlayerController &inout PlayerController, const FC_DivineSkillCommissionEnterResetPending &inout Pending, const FCS_FixedTime &inout FixedTime) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    UFUNCTION()
    void Job_ResetDivineSkillCDOnRaceStart(const FCS_FixedTime &inout FixedTime) const
    {
        for (auto& local_22 : FGameUtils::GetAllPlayerControllerEntities(true))
        {
            ::DivineSkillCDUtils::SetPlayerTeamDivineSkillFullCD(local_22, FixedTime.Time);
        }
        FECSWorldPtr local_24 = ECS::GetECSWorld();
        Remove local_28;
        local_28.opCall();
        return;
    }
    UFUNCTION()
    void ServerJob_OnDivineSkillChanged(const FCE_OnChangeDivineSkillReq &inout Event, const FCS_FixedTime &inout FixedTime) const
    {
        int local_6 = 0;
        if (!(local_6))
        {
            return;
        }
        bool local_8 = false;
        if (::FASCommonUtils::IsInCombat(::FASCommonUtils::GetUniqueAvatarPawnEntity(Event.Sender)))
        {
            XWarning(ELog(28), "Cannot change equipable skill in combat");
        }
        else
        {
            if (Event.DivineSkillData)
            {
                ModifyOrAdd local_18;
                this.UpdateDivineSkillData(Event.Sender, local_18.opCall(), local_6, Event.DivineSkillData, FixedTime);
                local_8 = true;
            }
        }
        if (Event.bNeedReply)
        {
            FPbChangeDivineSkillRsp local_22;
            local_22.SetDivineSkillId(Event.DivineSkillData.GetSkillConfig().opArrow().DataId);
            int local_24 = local_8 ? 0 : -1;
            local_22.SetRetcode(local_24);
            ::UGameDSConnectionSubsystem::Get().SendProtoWrapperByPlayerUid(local_6.GetPlayerId(), local_22.ToWrapper());
        }
        return;
    }
    UFUNCTION()
    void ServerJob_OnDivineSkillSuitableUpdate(const FECSEntity &inout Entity, FC_DivineSkill &inout DivineSkill, const FC_PlayerController &inout PlayerController, const FCS_FixedTime &inout FixedTime) const
    {
        if (!(::FGameModeUtils::ShouldDisableDivineSkillPassive()) && DivineSkill.GetbHasSuitableCharacter())
        {
            const FDivineSkillConfig& local_4;
            if (DivineSkill.GetDivineSkillData().GetSkillConfig())
            {
                if (PlayerController.GetPlayerPawnEntity().IsValid())
                {
                    ::DivineSkillUtils::AddDivineSkillModifier(PlayerController.GetPlayerPawnEntity(), DivineSkill, FFPTime(-1));
                }
                for (auto& local_22 : PlayerController.GetAllPlayerPawnEntities())
                {
                    if (local_4.BuffConfig.IsValid())
                    {
                        FBuffUtils::AddBuff(local_22, local_4.BuffConfig, FixedTime.Time, local_22, false, -1.0f, 1, false);
                    }
                }
            }
        }
        else
        {
            const FDivineSkillConfig& local_4;
            if (DivineSkill.GetDivineSkillData().GetSkillConfig())
            {
                if (PlayerController.GetPlayerPawnEntity().IsValid())
                {
                    ::DivineSkillUtils::RemoveDivineSkillModifier(PlayerController.GetPlayerPawnEntity(), DivineSkill);
                }
                for (auto& local_22 : PlayerController.GetAllPlayerPawnEntities())
                {
                    if (local_4.BuffConfig.IsValid())
                    {
                        FBuffUtils::RemoveBuff(local_22, local_4.BuffConfig, FixedTime.Time, EBuffEndType(0));
                    }
                }
            }
        }
        Remove local_34;
        local_34.opCall();
        return;
    }
    void UpdateDivineSkillData(const FECSEntity &inout PlayerEntity, FC_DivineSkill &inout DivineSkill, const FC_PlayerController &inout PlayerController, const FDivineSkillData &inout DivineSkillData, const FCS_FixedTime &inout FixedTime) const
    {
        USkillConfig local_92;
        USkillConfig local_100;
        USkillConfig local_108;
        TDataObjectPtr<FDivineSkillConfig> local_24 = DivineSkill.GetDivineSkillData().GetSkillConfig();
        TDataObjectPtr<FDivineSkillConfig> local_72 = DivineSkillData.GetSkillConfig();
        float32 local_73 = 0.0f;
        if (local_24)
        {
            ::DivineSkillUtils::RemoveDivineSkillModifier(PlayerController.GetPlayerPawnEntity(), DivineSkill);
            for (auto& local_90 : PlayerController.GetAllPlayerPawnEntities())
            {
                local_92 = local_24.opArrow().SkillConfig;
                if (local_92 != nullptr)
                {
                    local_73 = ::InventoryUtils::UnequipQuickSlotSkill(local_90, local_24.opArrow().SkillConfig, EESMTriggerInputSlot(11));
                }
                if (local_24.opArrow().BuffConfig.IsValid())
                {
                    FBuffUtils::RemoveBuff(local_90, local_24.opArrow().BuffConfig, FixedTime.Time, EBuffEndType(0));
                }
            }
        }
        DivineSkill.SetbHasSuitableCharacter(false);
        DivineSkill.SetDivineSkillData(DivineSkillData);
        if (local_72)
        {
            bool local_75;
            if (::DivineSkillUtils::SuitForPlayerCurrentAvatarByPlayerController(local_72.opArrow().GetTypeConfig(), PlayerController))
            {
                DivineSkill.SetbHasSuitableCharacter(true);
            }
            if (DivineSkill.GetbHasSuitableCharacter() && !(::FGameModeUtils::ShouldDisableDivineSkillPassive()))
            {
                ::DivineSkillUtils::AddDivineSkillModifier(PlayerController.GetPlayerPawnEntity(), DivineSkill, FFPTime(-1));
                for (auto& local_90 : PlayerController.GetAllPlayerPawnEntities())
                {
                    local_100 = local_72.opArrow().SkillConfig;
                    if (local_100 != nullptr)
                    {
                        ::InventoryUtils::EquipQuickSlotSkill(local_90, local_72.opArrow().SkillConfig, EESMTriggerInputSlot(11));
                        if (local_73 > 0.0f && (local_73 <= 1.0f))
                        {
                            int local_95 = FSkillUtils::GetSkillIndex(local_90, local_72.opArrow().SkillConfig);
                            float32 local_74 = 1.0f - local_73;
                            FSkillUtils::SetSkillCD(local_90, local_95, FixedTime.Time, local_74);
                        }
                    }
                    if (local_72.opArrow().BuffConfig.IsValid())
                    {
                        FBuffUtils::AddBuff(local_90, local_72.opArrow().BuffConfig, FixedTime.Time, local_90, false, -1.0f, 1, false);
                    }
                }
            }
            else
            {
                for (auto& local_90 : PlayerController.GetAllPlayerPawnEntities())
                {
                    local_108 = local_72.opArrow().SkillConfig;
                    if (local_108 != nullptr)
                    {
                        ::InventoryUtils::EquipQuickSlotSkill(local_90, local_72.opArrow().SkillConfig, EESMTriggerInputSlot(11));
                        if (local_73 > 0.0f && (local_73 <= 1.0f))
                        {
                            int local_101 = FSkillUtils::GetSkillIndex(local_90, local_72.opArrow().SkillConfig);
                            float32 local_74_2 = 1.0f - local_73;
                            FSkillUtils::SetSkillCD(local_90, local_101, FixedTime.Time, local_74_2);
                        }
                    }
                }
            }
            Has local_112;
            local_75 = local_112.opCall();
            if (local_75)
            {
                ::DivineSkillCDUtils::SetPlayerTeamDivineSkillFullCD(PlayerEntity, FixedTime.Time);
            }
        }
        Remove local_116;
        local_116.opCall();
        return;
    }
    UFUNCTION()
    void Run_Monitor_InitCharacterDivineSkillWithoutGS() const
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
            this.Monitor_InitCharacterDivineSkillWithoutGS(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_UpdateDivineSkillChangeWithoutGS() const
    {
        int local_6 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ChangeDivineSkillWithOutGS> local_40 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_40.CanProceed;)
        {
            const FCE_ChangeDivineSkillWithOutGS& local_64 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_65 = FECSEntityScopeCycleCounter(local_64.Sender);
            ECSInternal::PushContextTime(local_64.GetHandleTime());
            this.ServerJob_UpdateDivineSkillChangeWithoutGS(local_64, local_6);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ServerOnCharacterTalentChanged() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorCharacterTalentOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ServerOnCharacterTalentChanged(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorCharacterTalentOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_ServerOnCharacterTalentChanged(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_InitNewlyCreatedCharacterDivineSkill() const
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
                this.Job_InitNewlyCreatedCharacterDivineSkill(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
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
            this.Job_InitNewlyCreatedCharacterDivineSkill(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearCommissionEnterDivineSkillResetMark() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_176 = 0;
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
                this.Job_ClearCommissionEnterDivineSkillResetMark(local_40, local_42, local_48, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Exclude(local_90).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_104 = 0;
        FECSRuntimeViewIterator local_138 = local_90.Iterator();
        for (; local_138.CanProceed;)
        {
            local_40 = local_138.Proceed();
            ++local_104;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_ClearCommissionEnterDivineSkillResetMark(local_176, local_42, local_48, local_6);
        }
        local_4.UpdateCachedEntityCount(local_104);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ResetDivineSkillCDOnRaceStart() const
    {
        int local_14 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        FECSWorldPtr local_6 = this.GetECSWorld();
        Has local_10;
        if (!(local_10.opCall()))
        {
            return;
        }
        this.Job_ResetDivineSkillCDOnRaceStart(local_14);
        return;
    }
    UFUNCTION()
    void Run_ServerJob_OnDivineSkillChanged() const
    {
        int local_6 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_OnChangeDivineSkillReq> local_40 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_40.CanProceed;)
        {
            const FCE_OnChangeDivineSkillReq& local_64 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_65 = FECSEntityScopeCycleCounter(local_64.Sender);
            ECSInternal::PushContextTime(local_64.GetHandleTime());
            this.ServerJob_OnDivineSkillChanged(local_64, local_6);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_OnDivineSkillSuitableUpdate() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_184 = 0;
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
                this.ServerJob_OnDivineSkillSuitableUpdate(local_40, local_42, local_48, local_6);
                FECSEntity::MarkModifiedIfDirty<FC_DivineSkill> local_56;
                local_56.opCall(local_42);
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
        Exclude(local_94).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_112 = 0;
        FECSRuntimeViewIterator local_146 = local_94.Iterator();
        for (; local_146.CanProceed;)
        {
            local_40 = local_146.Proceed();
            ++local_112;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_OnDivineSkillSuitableUpdate(local_184, local_42, local_48, local_6);
            FECSEntity::MarkModifiedIfDirty<FC_DivineSkill>(local_40).opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_112);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
}


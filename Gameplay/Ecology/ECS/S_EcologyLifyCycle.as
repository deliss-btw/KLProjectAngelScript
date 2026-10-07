

class US_EcologyLifyCycle : UECSScriptSystem
{
    US_EcologyLifyCycle()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_FinishDestroy(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime) const
    {
        ::FLifeCycleUtils::EntityDestroyDirectly(Entity, FixedTime.Time);
        return;
    }
    UFUNCTION()
    void ServerJob_WaitDestroy(const FECSEntity &inout Entity) const
    {
        Assign local_4;
        local_4.opCall(FC_EcologyCleanUpTag());
        return;
    }
    UFUNCTION()
    void ClientJob_FinishDestroy(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime) const
    {
        ::FLifeCycleUtils::EntityDestroyDirectly(Entity, FixedTime.Time);
        return;
    }
    UFUNCTION()
    void ClientJob_WaitDestroy(const FECSEntity &inout Entity) const
    {
        Assign local_4;
        local_4.opCall(FC_EcologyCleanUpTag());
        return;
    }
    UDataTable GetDifficultyLevelConfig(const FECSEntity &inout Entity, const FC_CreatureMeta &inout CreatureMeta) const
    {
        Get local_4;
        const FC_DifficultyConfigOverride& local_6 = local_4.opCall();
        if (local_6)
        {
            return local_6.DifficultyLevelConfig;
        }
        return CreatureMeta.DifficultyLevelConfig;
    }
    void ApplyDifficultyAttributeScale(const FECSEntity &inout Entity, const UDataTable DifficultyLevelConfig, const int Level, const EDifficultyRank DifficultyRank) const
    {
        int local_34 = 0;
        if (!((DifficultyLevelConfig != nullptr)))
        {
            return;
        }
        TArray<FDifficultyLevelAttributeConfig> local_6;
        DifficultyLevelConfig.GetAllRows(local_6);
        for (auto& local_20 : local_6)
        {
            if (int(local_20.Level) == Level)
            {
                FDifficultyAttributeScale local_26;
                if (!(local_20.AttributeByRank.Find(DifficultyRank, local_26)))
                {
                    local_20.AttributeByRank.Find(EDifficultyRank(0), local_26);
                }
                if (local_26.Attack >= 0.0f && ((local_26.Attack != 1.0f)))
                {
                    float32 local_40 = ((local_34.AttributeScale.FindOrAdd(UGameAttribute_Attack, 1.0f)) * local_26.Attack);
                }
                if (local_26.HP >= 0.0f && (local_26.HP != 1.0f))
                {
                    float32 local_40_2 = local_34.AttributeScale.FindOrAdd(UGameAttribute_HP, 1.0f);
                    float32 local_35_2 = local_40_2 * local_26.HP;
                    local_40_2 = local_35_2;
                    float32 local_42 = local_34.AttributeScale.FindOrAdd(UGameAttribute_HPMax, 1.0f);
                    local_35_2 = local_42;
                    local_35_2 = local_35_2 * local_26.HP;
                    local_42 = local_35_2;
                }
                if (local_26.Posture >= 0.0f && (local_26.Posture != 1.0f))
                {
                    float32 local_42_2 = local_34.AttributeScale.FindOrAdd(UGameAttribute_Posture, 1.0f);
                    float32 local_35_3 = local_42_2 * local_26.Posture;
                    local_42_2 = local_35_3;
                    float32 local_40_3 = local_34.AttributeScale.FindOrAdd(UGameAttribute_PostureMax, 1.0f);
                    local_35_3 = local_40_3;
                    local_35_3 = local_35_3 * local_26.Posture;
                    local_40_3 = local_35_3;
                }
                break;
            }
        }
        return;
    }
    UFUNCTION()
    void Job_WaitLoadViewPrefab(const FECSEntity &inout Entity, const FC_Transform &inout Transform, const FC_CreatureMeta &inout CreatureMeta) const
    {
        if (TSubclassOf<AECSPrefab>(CreatureMeta.ViewPrefab).IsValid())
        {
            UClass local_6;
            ECS::MarkEntityPrefabPendingInit(Entity, TSubclassOf<AECSPrefab>(local_6), Transform.GetPosition(), Transform.GetRotation(), EPrefabCollisionAlignment(0), false);
        }
        else
        {
            XError(ELog(30), FString().Append("Prefab is not valid "));
        }
        Remove local_20;
        local_20.opCall();
        return;
    }
    UFUNCTION()
    void Job_PreCreaturePrefabInit(const FECSEntity &inout Entity, const FC_CreatureMeta &inout CreatureMeta) const
    {
        int local_110 = 0;
        int local_262 = 0;
        EMonsterRank local_339 = EMonsterRank(0);
        UDataTable local_342;
        int local_362 = 0;
        int local_382 = 0;
        int local_404 = 0;
        int local_464 = 0;
        int local_500 = 0;
        int local_549 = 0;
        TDataObjectPtr<FMonsterMainConfig> local_24 = CreatureMeta.CreatureConfigProxy.GetMonsterConfig();
        if (!((local_24 == nullptr)))
        {
            FDataObjectPtr local_286;
            const FCombatUnitBaseConfig& local_162;
            const FMonsterMainConfig& local_52;
            local_110.SetMonsterConfig(local_24);
            local_110.SetMonsterLevel(int(CreatureMeta.Level));
            local_110.SetPresentationConfig(local_52.GetPresentationConfig());
            TDataObjectPtr<FCombatUnitBaseConfig> local_136;
            local_136 = local_52.GetCombatConfig();
            if (!((local_136 == nullptr)))
            {
                TDataObjectPtr<FGameAttributeInitConfig_CombatUnit> local_186;
                local_186 = local_162.GetInitAttributeValues();
                if (!((local_186 == nullptr)) || (local_52.AttributeScale.Num() > 0))
                {
                    local_286;
                    local_262.InitValues = local_286;
                    if (local_52.AttributeScale.Num() > 0)
                    {
                        local_262.AttributeScale = local_52.AttributeScale;
                    }
                }
                CastTo local_290;
                if (local_290.opCall())
                {
                    local_110.SetMonsterRank(EMonsterRank(local_339));
                }
                local_342 = this.GetDifficultyLevelConfig(Entity, CreatureMeta);
                int local_345 = int(local_110.GetMonsterRank());
                this.ApplyDifficultyAttributeScale(Entity, local_342, local_110.GetMonsterLevel());
            }
            if (local_52.GetDropItems().Num() > 0)
            {
                Has local_350;
                Get local_354;
                bool local_49 = local_350.opCall() && local_354.opCall().HasMuteDropItemType(EMuteDropItemType(1));
                if (!(local_49))
                {
                    local_362.DropItems.Reset(0);
                    for (auto& local_376 : local_52.GetDropItems())
                    {
                        local_362.AddDropItemAutoGetTriggerType(local_376);
                    }
                }
            }
            if (local_52.InitBuffs.Num() > 0)
            {
                for (auto& local_396 : local_52.InitBuffs)
                {
                    local_382.GetModify_InitBuffs().Add(local_396);
                }
            }
            ::FEcologyLevelEventBuffUtils::AppendLevelEventInitBuffs(Entity, CreatureMeta);
            if (int(local_52.FactionOverride) != 0)
            {
                local_404.SetFactionId(EFaction(local_52.FactionOverride));
                ::FFactionUtils::InitFactionRelationForEntity(Entity, local_404);
            }
            return;
        }
        TDataObjectPtr<FNPCMainConfig> local_428 = CreatureMeta.CreatureConfigProxy.GetNPCConfig();
        if (local_428)
        {
            FDataObjectPtr local_286;
            const FCombatUnitBaseConfig& local_162;
            const FNPCMainConfig& local_454;
            local_464.SetNPCId(local_428.GetUniqueID());
            local_464.SetCombatPriority(ENPCCombatPriority(local_454.CombatPriority));
            local_500.SetMainConfig(local_428);
            TDataObjectPtr<FNPCRoleConfig> local_524;
            local_524 = local_454.GetRole();
            if ((!((local_524 == nullptr))))
            {
                local_464.SetRoleId(local_549);
            }
            TDataObjectPtr<FCombatUnitBaseConfig> local_160;
            local_160 = local_454.GetCombatConfig();
            if ((!((local_160 == nullptr))))
            {
                TDataObjectPtr<FGameAttributeInitConfig_CombatUnit> local_186;
                local_186 = local_162.GetInitAttributeValues();
                if (!((local_186 == nullptr)) || (local_454.AttributeScale.Num() > 0))
                {
                    local_286;
                    local_262.InitValues = local_286;
                    if (local_454.AttributeScale.Num() > 0)
                    {
                        local_262.AttributeScale = local_454.AttributeScale;
                    }
                }
                local_342 = this.GetDifficultyLevelConfig(Entity, CreatureMeta);
                this.ApplyDifficultyAttributeScale(Entity, local_342, int(CreatureMeta.Level), EDifficultyRank(10));
            }
            if (local_454.GetDropItems().Num() > 0)
            {
                local_362.DropItems.Reset(0);
                for (auto& local_376 : local_454.GetDropItems())
                {
                    local_362.AddDropItemAutoGetTriggerType(local_376);
                }
            }
            if (local_454.InitBuffs.Num() > 0)
            {
                for (auto& local_396 : local_454.InitBuffs)
                {
                    local_382.GetModify_InitBuffs().Add(local_396);
                }
            }
            ::FEcologyLevelEventBuffUtils::AppendLevelEventInitBuffs(Entity, CreatureMeta);
            ::FNPCComponentSwitchUtils::ApplyAfterNPCInfo(Entity, local_454);
            FC_NPCReadyTag local_556;
            Assign local_554;
            local_554.opCall(local_556);
        }
        return;
    }
    UFUNCTION()
    void Job_AfterViewPrefabLoaded(const FECSEntity &inout Entity, const FC_CreatureMeta &inout CreatureMeta) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argint]
    }
    UFUNCTION()
    void Job_OnCreatureInited(const FCE_EcologySpawnerCreateEntityInited &inout Event) const
    {
        if (!(Event.CreatureEntity.IsValid()))
        {
            return;
        }
        ::FEcologyLifeCycleUtils::MarkCreatureReady(Event.CreatureEntity);
        return;
    }
    UFUNCTION()
    void Job_CreatureOnDeathCorpseHandle(const FCE_DeathEvent &inout Event) const
    {
        int local_12 = 0;
        if (!(Event.Sender.IsValid()))
        {
            return;
        }
        Has local_6;
        if (!(local_6.opCall()))
        {
            return;
        }
        if (!(local_12))
        {
            return;
        }
        bool local_1 = !(local_12.CreatureType.IsSet());
        if (local_1)
        {
            return;
        }
        local_1 = !local_1;
        if (local_1)
        {
            return;
        }
        FC_IsCreatureCorpseTag local_18;
        Assign local_16;
        local_16.opCall(local_18);
        return;
    }
    UFUNCTION()
    void Job_EcologyCreatureDeathNotify(const FCE_DeathEvent &inout Event) const
    {
        int local_8 = 0;
        if (!(Event.Sender.IsValid()))
        {
            return;
        }
        if (!(local_8))
        {
            return;
        }
        FECSEntity local_12 = FECSEntity(local_8.RuntimeSpawnerEntity);
        if (!(local_12))
        {
            return;
        }
        ::FEcologySpawnerUtils::NotifyMonsterDeath(local_12, Event.Sender);
        return;
    }
    UFUNCTION()
    void Job_DestroyEntityByLifeTime(const FECSEntity &inout Entity, const FC_LifeTime &inout LifeTime, const FCS_FixedTime &inout FixedTime) const
    {
        if (LifeTime.GetEndTime().opCmp(FixedTime.Time) <= 0)
        {
            ::FEcologyLifeCycleUtils::MarkEntityWaitDestroy(Entity);
        }
        return;
    }
    UFUNCTION()
    void Job_ResolveSpawnInitEntry(const FECSEntity &inout Entity, const FC_EntitySpawnInitEntry &inout SpawnInitEntry) const
    {
        FEntitySpawnInitEntry local_10;
        int local_22 = 0;
        if ((SpawnInitEntry.GetInitEntryName() == NAME_None))
        {
            return;
        }
        if (!(::FEcologySpawnerUtils::GetMatchedSpawnInitEntry(Entity, SpawnInitEntry.GetInitEntryName(), local_10)))
        {
            XWarning(ELog(30), FString().Append("SpawnInitEntryName '").Append(SpawnInitEntry.GetInitEntryName()).Append("' not found on Entity SpawnInitEntryConfig"));
            return;
        }
        if (local_10.HasESMOverride())
        {
            local_22.Add(uint8(int(local_10.ESMEntryStateOverride.SMIndex)), local_10.ESMEntryStateOverride.EntryState);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_FinishDestroy_StaticReg() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_160 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_10 = 1;
        int local_9 = local_10;
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
                this.ServerJob_FinishDestroy(local_40, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_78 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_82;
        local_82.opCall();
        Exclude(local_78).opCall();
        bool local_8 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_88 = 0;
        FECSRuntimeViewIterator local_122 = local_78.Iterator();
        for (; local_122.CanProceed;)
        {
            local_40 = local_122.Proceed();
            ++local_88;
            if (local_8)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_FinishDestroy(local_160, local_6);
        }
        local_4.UpdateCachedEntityCount(local_88);
        if (local_8)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_FinishDestroy_DefaultReg() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_160 = 0;
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
                this.ServerJob_FinishDestroy(local_40, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_78 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_82;
        local_82.opCall();
        Exclude(local_78).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_88 = 0;
        FECSRuntimeViewIterator local_122 = local_78.Iterator();
        for (; local_122.CanProceed;)
        {
            local_40 = local_122.Proceed();
            ++local_88;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_FinishDestroy(local_160, local_6);
        }
        local_4.UpdateCachedEntityCount(local_88);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_FinishDestroy_LocalReg() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_160 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_10 = 2;
        int local_9 = local_10;
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
                this.ServerJob_FinishDestroy(local_40, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_78 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_82;
        local_82.opCall();
        Exclude(local_78).opCall();
        bool local_8 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_88 = 0;
        FECSRuntimeViewIterator local_122 = local_78.Iterator();
        for (; local_122.CanProceed;)
        {
            local_40 = local_122.Proceed();
            ++local_88;
            if (local_8)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_FinishDestroy(local_160, local_6);
        }
        local_4.UpdateCachedEntityCount(local_88);
        if (local_8)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_WaitDestroy_StaticReg() const
    {
        const FECSEntity& local_38;
        int local_162 = 0;
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
                this.ServerJob_WaitDestroy(local_38);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_76 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_80;
        local_80.opCall();
        Exclude(local_76).opCall();
        Exclude(local_76).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_90 = 0;
        FECSRuntimeViewIterator local_124 = local_76.Iterator();
        for (; local_124.CanProceed;)
        {
            local_38 = local_124.Proceed();
            ++local_90;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.ServerJob_WaitDestroy(local_162);
        }
        local_4.UpdateCachedEntityCount(local_90);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_WaitDestroy_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_162 = 0;
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
                this.ServerJob_WaitDestroy(local_38);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_76 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_80;
        local_80.opCall();
        Exclude(local_76).opCall();
        Exclude(local_76).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_90 = 0;
        FECSRuntimeViewIterator local_124 = local_76.Iterator();
        for (; local_124.CanProceed;)
        {
            local_38 = local_124.Proceed();
            ++local_90;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.ServerJob_WaitDestroy(local_162);
        }
        local_4.UpdateCachedEntityCount(local_90);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_WaitDestroy_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_162 = 0;
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
                this.ServerJob_WaitDestroy(local_38);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_76 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_80;
        local_80.opCall();
        Exclude(local_76).opCall();
        Exclude(local_76).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_90 = 0;
        FECSRuntimeViewIterator local_124 = local_76.Iterator();
        for (; local_124.CanProceed;)
        {
            local_38 = local_124.Proceed();
            ++local_90;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.ServerJob_WaitDestroy(local_162);
        }
        local_4.UpdateCachedEntityCount(local_90);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_FinishDestroy_StaticReg() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_160 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 1;
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
                this.ClientJob_FinishDestroy(local_40, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_78 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_82;
        local_82.opCall();
        Exclude(local_78).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_88 = 0;
        FECSRuntimeViewIterator local_122 = local_78.Iterator();
        for (; local_122.CanProceed;)
        {
            local_40 = local_122.Proceed();
            ++local_88;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ClientJob_FinishDestroy(local_160, local_6);
        }
        local_4.UpdateCachedEntityCount(local_88);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_FinishDestroy_LocalReg() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_160 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 2;
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
                this.ClientJob_FinishDestroy(local_40, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_78 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_82;
        local_82.opCall();
        Exclude(local_78).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_88 = 0;
        FECSRuntimeViewIterator local_122 = local_78.Iterator();
        for (; local_122.CanProceed;)
        {
            local_40 = local_122.Proceed();
            ++local_88;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ClientJob_FinishDestroy(local_160, local_6);
        }
        local_4.UpdateCachedEntityCount(local_88);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_WaitDestroy_StaticReg() const
    {
        const FECSEntity& local_36;
        int local_160 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 1;
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
                this.ClientJob_WaitDestroy(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Exclude(local_74).opCall();
        Exclude(local_74).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_88 = 0;
        FECSRuntimeViewIterator local_122 = local_74.Iterator();
        for (; local_122.CanProceed;)
        {
            local_36 = local_122.Proceed();
            ++local_88;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_WaitDestroy(local_160);
        }
        local_2.UpdateCachedEntityCount(local_88);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_WaitDestroy_LocalReg() const
    {
        const FECSEntity& local_36;
        int local_160 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 2;
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
                this.ClientJob_WaitDestroy(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Exclude(local_74).opCall();
        Exclude(local_74).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_88 = 0;
        FECSRuntimeViewIterator local_122 = local_74.Iterator();
        for (; local_122.CanProceed;)
        {
            local_36 = local_122.Proceed();
            ++local_88;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_WaitDestroy(local_160);
        }
        local_2.UpdateCachedEntityCount(local_88);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_WaitLoadViewPrefab_StaticReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_182 = 0;
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
                this.Job_WaitLoadViewPrefab(local_38, local_40, local_46);
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
        Exclude(local_88).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_110 = 0;
        FECSRuntimeViewIterator local_144 = local_88.Iterator();
        for (; local_144.CanProceed;)
        {
            local_38 = local_144.Proceed();
            ++local_110;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_WaitLoadViewPrefab(local_182, local_40, local_46);
        }
        local_4.UpdateCachedEntityCount(local_110);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_WaitLoadViewPrefab_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_182 = 0;
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
                this.Job_WaitLoadViewPrefab(local_38, local_40, local_46);
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
        Exclude(local_88).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_110 = 0;
        FECSRuntimeViewIterator local_144 = local_88.Iterator();
        for (; local_144.CanProceed;)
        {
            local_38 = local_144.Proceed();
            ++local_110;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_WaitLoadViewPrefab(local_182, local_40, local_46);
        }
        local_4.UpdateCachedEntityCount(local_110);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_WaitLoadViewPrefab_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        int local_182 = 0;
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
                this.Job_WaitLoadViewPrefab(local_38, local_40, local_46);
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
        Exclude(local_88).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_110 = 0;
        FECSRuntimeViewIterator local_144 = local_88.Iterator();
        for (; local_144.CanProceed;)
        {
            local_38 = local_144.Proceed();
            ++local_110;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_WaitLoadViewPrefab(local_182, local_40, local_46);
        }
        local_4.UpdateCachedEntityCount(local_110);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_PreCreaturePrefabInit_StaticReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_164 = 0;
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
                this.Job_PreCreaturePrefabInit(local_38, local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_82 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_86;
        local_86.opCall();
        Include local_90;
        local_90.opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_92 = 0;
        FECSRuntimeViewIterator local_126 = local_82.Iterator();
        for (; local_126.CanProceed;)
        {
            local_38 = local_126.Proceed();
            ++local_92;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_PreCreaturePrefabInit(local_164, local_40);
        }
        local_4.UpdateCachedEntityCount(local_92);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_PreCreaturePrefabInit_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_164 = 0;
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
                this.Job_PreCreaturePrefabInit(local_38, local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_82 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_86;
        local_86.opCall();
        Include local_90;
        local_90.opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_92 = 0;
        FECSRuntimeViewIterator local_126 = local_82.Iterator();
        for (; local_126.CanProceed;)
        {
            local_38 = local_126.Proceed();
            ++local_92;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_PreCreaturePrefabInit(local_164, local_40);
        }
        local_4.UpdateCachedEntityCount(local_92);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_PreCreaturePrefabInit_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_164 = 0;
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
                this.Job_PreCreaturePrefabInit(local_38, local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_82 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_86;
        local_86.opCall();
        Include local_90;
        local_90.opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_92 = 0;
        FECSRuntimeViewIterator local_126 = local_82.Iterator();
        for (; local_126.CanProceed;)
        {
            local_38 = local_126.Proceed();
            ++local_92;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_PreCreaturePrefabInit(local_164, local_40);
        }
        local_4.UpdateCachedEntityCount(local_92);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_AfterViewPrefabLoaded_StaticReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_168 = 0;
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
                this.Job_AfterViewPrefabLoaded(local_38, local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_82 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_86;
        local_86.opCall();
        Include local_90;
        local_90.opCall();
        Exclude(local_82).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_96 = 0;
        FECSRuntimeViewIterator local_130 = local_82.Iterator();
        for (; local_130.CanProceed;)
        {
            local_38 = local_130.Proceed();
            ++local_96;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_AfterViewPrefabLoaded(local_168, local_40);
        }
        local_4.UpdateCachedEntityCount(local_96);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_AfterViewPrefabLoaded_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_168 = 0;
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
                this.Job_AfterViewPrefabLoaded(local_38, local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_82 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_86;
        local_86.opCall();
        Include local_90;
        local_90.opCall();
        Exclude(local_82).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_96 = 0;
        FECSRuntimeViewIterator local_130 = local_82.Iterator();
        for (; local_130.CanProceed;)
        {
            local_38 = local_130.Proceed();
            ++local_96;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_AfterViewPrefabLoaded(local_168, local_40);
        }
        local_4.UpdateCachedEntityCount(local_96);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_AfterViewPrefabLoaded_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
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
                this.Job_AfterViewPrefabLoaded(local_38, local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_82 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_86;
        local_86.opCall();
        Include local_90;
        local_90.opCall();
        Exclude(local_82).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_96 = 0;
        FECSRuntimeViewIterator local_130 = local_82.Iterator();
        for (; local_130.CanProceed;)
        {
            local_38 = local_130.Proceed();
            ++local_96;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_AfterViewPrefabLoaded(local_168, local_40);
        }
        local_4.UpdateCachedEntityCount(local_96);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_OnCreatureInited() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EcologySpawnerCreateEntityInited> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EcologySpawnerCreateEntityInited& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_OnCreatureInited(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CreatureOnDeathCorpseHandle() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DeathEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DeathEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_CreatureOnDeathCorpseHandle(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_EcologyCreatureDeathNotify() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DeathEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DeathEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_EcologyCreatureDeathNotify(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DestroyEntityByLifeTime_StaticReg() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_170 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_10 = 1;
        int local_9 = local_10;
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
                this.Job_DestroyEntityByLifeTime(local_40, local_42, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        bool local_8 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_40 = local_132.Proceed();
            ++local_98;
            if (local_8)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_DestroyEntityByLifeTime(local_170, local_42, local_6);
        }
        local_4.UpdateCachedEntityCount(local_98);
        if (local_8)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DestroyEntityByLifeTime_DefaultReg() const
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
                this.Job_DestroyEntityByLifeTime(local_40, local_42, local_6);
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
            this.Job_DestroyEntityByLifeTime(local_170, local_42, local_6);
        }
        local_4.UpdateCachedEntityCount(local_98);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DestroyEntityByLifeTime_LocalReg() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_170 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_10 = 2;
        int local_9 = local_10;
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
                this.Job_DestroyEntityByLifeTime(local_40, local_42, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        bool local_8 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_40 = local_132.Proceed();
            ++local_98;
            if (local_8)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_DestroyEntityByLifeTime(local_170, local_42, local_6);
        }
        local_4.UpdateCachedEntityCount(local_98);
        if (local_8)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ResolveSpawnInitEntry_StaticReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_164 = 0;
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
                this.Job_ResolveSpawnInitEntry(local_38, local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_82 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_86;
        local_86.opCall();
        Include local_90;
        local_90.opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_92 = 0;
        FECSRuntimeViewIterator local_126 = local_82.Iterator();
        for (; local_126.CanProceed;)
        {
            local_38 = local_126.Proceed();
            ++local_92;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_ResolveSpawnInitEntry(local_164, local_40);
        }
        local_4.UpdateCachedEntityCount(local_92);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ResolveSpawnInitEntry_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_164 = 0;
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
                this.Job_ResolveSpawnInitEntry(local_38, local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_82 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_86;
        local_86.opCall();
        Include local_90;
        local_90.opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_92 = 0;
        FECSRuntimeViewIterator local_126 = local_82.Iterator();
        for (; local_126.CanProceed;)
        {
            local_38 = local_126.Proceed();
            ++local_92;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_ResolveSpawnInitEntry(local_164, local_40);
        }
        local_4.UpdateCachedEntityCount(local_92);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ResolveSpawnInitEntry_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_164 = 0;
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
                this.Job_ResolveSpawnInitEntry(local_38, local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_82 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_86;
        local_86.opCall();
        Include local_90;
        local_90.opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_92 = 0;
        FECSRuntimeViewIterator local_126 = local_82.Iterator();
        for (; local_126.CanProceed;)
        {
            local_38 = local_126.Proceed();
            ++local_92;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_ResolveSpawnInitEntry(local_164, local_40);
        }
        local_4.UpdateCachedEntityCount(local_92);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
}


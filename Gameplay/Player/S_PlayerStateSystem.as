

class US_PlayeLevelSystem : UECSScriptSystem
{
    US_PlayeLevelSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_OverridePlayerAvatarInitAttribute(const FECSEntity &inout Entity, const FC_ControlledByPlayer &inout ControlledByPlayer) const
    {
        int local_6 = 0;
        int local_58 = 0;
        int local_88 = 0;
        if (!(local_6))
        {
            return;
        }
        if (!(::GetAvatarConfig(Entity)))
        {
            return;
        }
        int local_57 = local_58;
        TDataObjectPtr<FGameAttributeInitConfig_Avatar> local_82;
        if (local_6.AtrributeInitConfigByAvatarId.Find(local_57, local_82))
        {
            local_88.InitValues = local_82.opImplConv();
        }
        return;
    }
    UFUNCTION()
    void Job_HandlePlayerLevelUpdateByGS(const FCE_PlayerLevelUpdateByGS &inout Event, const FCS_FixedTime &inout FixedTime) const
    {
        if (0.GetCurLevel() != int(Event.NewLevel))
        {
            FFPTime local_22 = (FFPTime(FixedTime.Time) + FFPTime(0.5));
            FCE_PlayerLevelChange local_24;
            local_24.NewLevel = int(Event.NewLevel);
        }
        return;
    }
    UFUNCTION()
    void Job_UpdatePlayerLevel(const FCE_PlayerLevelChange &inout Event, const FCS_FixedTime &inout FixedTime) const
    {
        Has local_4;
        int local_12 = 0;
        if (!(local_4.opCall()))
        {
            return;
        }
        if (!(local_12))
        {
            return;
        }
        bool local_13 = false;
        Get local_18;
        const FC_DSPlayerAvatarInfo& local_20 = local_18.opCall();
        if (local_20)
        {
            local_13 = local_20.GetbDisableLevelGrowth();
        }
        if (::FGameModeUtils::ShouldDisableLevelGrowth(local_13))
        {
            return;
        }
        if (!(TSoftObjectPtr<UDataTable>(UGameplayConfigsManager::GetLevelAttributeGrowthConfig()).IsNull()))
        {
            TArray<FGameAttributeGrowByLevelConfig> local_34;
            UDataTable local_36;
            local_36.GetAllRows(local_34);
            int local_38 = local_12.GetCurLevel() - 1;
            if (local_38 >= 0 && (local_38 < local_34.Num()))
            {
                FGameAttributeGrowByLevelConfig& local_42 = local_34[local_38];
                float32 local_43 = local_42.HPMax;
                if (local_43 != 0.0f)
                {
                    FGameAttributeUtils::RemoveModifyShared(Event.Sender, Attribute::HPMax, EGameAttributeModifyType(1), local_42.HPMax, FixedTime.Time);
                }
                local_43 = local_42.StaminaMax;
                if (local_43 != 0.0f)
                {
                    FGameAttributeUtils::RemoveModifyShared(Event.Sender, Attribute::StaminaMax, EGameAttributeModifyType(1), local_42.StaminaMax, FixedTime.Time);
                }
            }
            int local_37 = Event.NewLevel - 1;
            if (local_37 >= 0 && (local_37 < local_34.Num()))
            {
                FGameAttributeGrowByLevelConfig& local_42_2 = local_34[local_37];
                float32 local_43_2 = local_42_2.HPMax;
                if (local_43_2 != 0.0f)
                {
                    FGameAttributeUtils::AddModifyShared(Event.Sender, Attribute::HPMax, EGameAttributeModifyType(1), local_42_2.HPMax, FixedTime.Time);
                }
                local_43_2 = local_42_2.StaminaMax;
                if (local_43_2 != 0.0f)
                {
                    FGameAttributeUtils::AddModifyShared(Event.Sender, Attribute::StaminaMax, EGameAttributeModifyType(1), local_42_2.StaminaMax, FixedTime.Time);
                }
            }
        }
        local_12.SetCurLevel(int(Event.NewLevel));
        return;
    }
    UFUNCTION()
    void Monitor_InitPlayerLevelAttribute(const FECSEntity &inout Entity, const FC_PlayerInGameState &inout PlayerState) const
    {
        bool local_1 = false;
        Get local_6;
        const FC_DSPlayerAvatarInfo& local_8 = local_6.opCall();
        if (local_8)
        {
            local_1 = local_8.GetbDisableLevelGrowth();
        }
        if (::FGameModeUtils::ShouldDisableLevelGrowth(local_1))
        {
            return;
        }
        if (!(TSoftObjectPtr<UDataTable>(UGameplayConfigsManager::GetLevelAttributeGrowthConfig()).IsNull()))
        {
            TArray<FGameAttributeGrowByLevelConfig> local_22;
            UDataTable local_24;
            local_24.GetAllRows(local_22);
            int local_26 = PlayerState.GetCurLevel() - 1;
            if (local_26 >= 0 && (local_26 < local_22.Num()))
            {
                FGameAttributeGrowByLevelConfig& local_30 = local_22[local_26];
                float32 local_31 = local_30.HPMax;
                if (local_31 != 0.0f)
                {
                    FGameAttributeUtils::AddModifyShared(Entity, Attribute::HPMax, EGameAttributeModifyType(1), int(local_30.HPMax), this.GetECSWorld().GetFixedTime().Time);
                }
                local_31 = local_30.StaminaMax;
                if (local_31 != 0.0f)
                {
                    FGameAttributeUtils::RemoveModifyShared(Entity, Attribute::StaminaMax, EGameAttributeModifyType(1), int(local_30.StaminaMax), this.GetECSWorld().GetFixedTime().Time);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_ClearNewlySpawnedPlayerPawnTag(const FECSEntity &inout Entity) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
    UFUNCTION()
    void Run_Job_OverridePlayerAvatarInitAttribute() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
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
                this.Job_OverridePlayerAvatarInitAttribute(local_36, local_38);
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
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_80.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_OverridePlayerAvatarInitAttribute(local_170, local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandlePlayerLevelUpdateByGS() const
    {
        int local_6 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerLevelUpdateByGS> local_40 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_40.CanProceed;)
        {
            const FCE_PlayerLevelUpdateByGS& local_64 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_65 = FECSEntityScopeCycleCounter(local_64.Sender);
            ECSInternal::PushContextTime(local_64.GetHandleTime());
            this.Job_HandlePlayerLevelUpdateByGS(local_64, local_6);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdatePlayerLevel() const
    {
        int local_6 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerLevelChange> local_40 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_40.CanProceed;)
        {
            const FCE_PlayerLevelChange& local_64 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_65 = FECSEntityScopeCycleCounter(local_64.Sender);
            ECSInternal::PushContextTime(local_64.GetHandleTime());
            this.Job_UpdatePlayerLevel(local_64, local_6);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_InitPlayerLevelAttribute() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorPlayerInGameStateOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_InitPlayerLevelAttribute(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearNewlySpawnedPlayerPawnTag() const
    {
        const FECSEntity& local_36;
        int local_156 = 0;
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
                this.Job_ClearNewlySpawnedPlayerPawnTag(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Include local_82;
        local_82.opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_84 = 0;
        FECSRuntimeViewIterator local_118 = local_74.Iterator();
        for (; local_118.CanProceed;)
        {
            local_36 = local_118.Proceed();
            ++local_84;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_ClearNewlySpawnedPlayerPawnTag(local_156);
        }
        local_2.UpdateCachedEntityCount(local_84);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}


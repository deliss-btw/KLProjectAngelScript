

class US_InitialLevelLoadingPassSystem : UECSScriptSystem
{
    UPROPERTY()
    float32 MaxDurationToWaitGroupReady = 1.0f;


    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return !(UGameplayConfigsManager::UseJsonConfig());
    }
    UFUNCTION()
    void ServerJob_InitialUpdateLevelGroups() const
    {
        int local_52 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        FCS_InitialLevelLoading local_12;
        local_12.bLoadedDefaultGroup = false;
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        local_52.ResetLoadingPassOrder();
        for (auto& local_66 : local_52.LoadingPassNames)
        {
            XLog(ELog(22), FString().Append("ResetLoadingPassOrder: ").Append(local_66));
        }
        TArray<FName> local_76;
        TArray<FName> local_80;
        ULevelActorManager::Get().GetActiveDataLayers(local_76, local_80);
        FName local_88 = FName(WorldUtils::GetWorldPathName(this.GetWorld(), true));
        FName local_84 = LevelConfig::GetDefaultGlobalLevelGroupName();
        FConfigGUID local_92 = FConfigGUID(LevelConfig::FindLevelGroupConfigByName(local_88, local_84).GUID);
        if (local_92.IsValid())
        {
            local_52.DefaultGroupStatus.GroupGUID = local_92;
            local_52.DefaultGroupStatus.GroupName = local_84;
        }
        else
        {
            XWarning(ELog(22), FString().Append("Server InitialLevelLoadingPass Prepare: Default group not found, level: ").Append(local_88).Append(", name: ").Append(local_84));
            local_12.bLoadedDefaultGroup = true;
        }
        for (auto& local_66 : local_80)
        {
            const FLevelGroupConfig& local_94 = LevelConfig::FindLevelGroupConfigByName(local_88, local_66);
            if (!(local_94.IsValid()))
            {
                continue;
            }
            if (!(local_94.GUID.IsValid()))
            {
                XWarning(ELog(22), FString().Append("Server InitialLevelLoadingPass Prepare: Group not found, level: ").Append(local_88).Append(", name: ").Append(local_66));
                continue;
            }
            FName local_96(local_94.LoadingPass);
            if (local_94.bIsSubGroup)
            {
                local_94.ParentGroupRef.IsValid();
                const FLevelGroupConfig& local_98 = LevelConfig::FindLevelGroupConfig(local_94.ParentGroupRef);
                if (!(local_98.IsValid()))
                {
                    XWarning(ELog(22), FString().Append("Server InitialLevelLoadingPass Prepare: Parent group not found, level: ").Append(local_88).Append(", name: ").Append(local_66));
                    continue;
                }
                if (local_98.bIsSubGroup)
                {
                    XWarning(ELog(22), FString().Append("Server InitialLevelLoadingPass Prepare: Parent group is sub group, level: ").Append(local_88).Append(", name: ").Append(local_66));
                    continue;
                }
                XLog(ELog(22), FString().Append("Server InitialLevelLoadingPass Prepare: Set pass: ").Append(local_98.LoadingPass).Append(" for sub group: ").Append(local_66));
                local_96 = local_98.LoadingPass;
            }
            if (!(local_52.LoadingPassNames.Contains(local_96)))
            {
                FName local_90 = local_52.GetFallbackPass();
                XWarning(ELog(22), FString().Append("Server InitialLevelLoadingPass Prepare: Pass '").Append(local_96).Append("' not in LoadingPassNames, fallback to '").Append(local_90).Append("', group: ").Append(local_66));
                local_96 = local_90;
            }
            FPerPassLoadingGroups& local_102 = local_52.LoadingGroupsPerPass.FindOrAdd(local_96);
            FLevelGroupLoadingStatus local_110;
            local_110.GroupGUID = local_94.GUID;
            local_110.GroupName = local_94.GroupName;
            local_102.GroupStatus.Add(local_110);
            local_102.Status = EPassLoadingStatus(0);
        }
        if (local_12.bLoadedDefaultGroup && (FName(local_12.CurrentLoadingPass) == NAME_None))
        {
            local_12.CurrentLoadingPass = local_52.TryGetNextAvailablePass(NAME_None, true);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_TickInitialLevelLoadingPass(FCS_InitialLevelLoading &inout InitialLevelLoading, FCS_InitialLevelLoadingData &inout InitialLevelLoadingData, FCS_LevelDataManager &inout LevelDataManager) const
    {
        bool local_34;
        int local_86 = 0;
        int local_94 = 0;
        if (::FLevelDataLayerUtils::IsWaitingForStreaming(this.GetWorld(), false))
        {
            return;
        }
        if (!(InitialLevelLoading.bLoadedDefaultGroup))
        {
            if (!(InitialLevelLoadingData.DefaultGroupStatus.GroupEntity.IsValid()))
            {
                FECSEntity local_8 = ::FInitialLevelLoadingPassUtils::ActivateLevelGroupAndGetGroupEntity(LevelDataManager, InitialLevelLoadingData.DefaultGroupStatus.GroupGUID);
                if (local_8.IsValid())
                {
                    InitialLevelLoadingData.DefaultGroupStatus.GroupEntity = local_8;
                    XLog(ELog(22), FString().Append("Server InitialLevelLoadingPass: Load default group ").Append(InitialLevelLoadingData.DefaultGroupStatus.GroupGUID).Append(" ").Append(InitialLevelLoadingData.DefaultGroupStatus.GroupName));
                }
                else
                {
                    XWarning(ELog(22), FString().Append("Server InitialLevelLoadingPass: Default group not found, guid: ").Append(InitialLevelLoadingData.DefaultGroupStatus.GroupGUID));
                    InitialLevelLoading.bLoadedDefaultGroup = true;
                }
                return;
            }
            if (InitialLevelLoadingData.DefaultGroupStatus.IsLoadingComplete())
            {
                InitialLevelLoading.bLoadedDefaultGroup = true;
                InitialLevelLoading.CurrentLoadingPass = InitialLevelLoadingData.TryGetNextAvailablePass(NAME_None, true);
                XLog(ELog(22), FString().Append("Server InitialLevelLoadingPass: Default group loaded, next pass ").Append(InitialLevelLoading.CurrentLoadingPass));
            }
            else
            {
                XLog(ELog(22), FString().Append("Server InitialLevelLoadingPass: Default group not loaded, wait next frame"));
                return;
            }
        }
        if ((FName(InitialLevelLoading.CurrentLoadingPass) == NAME_None))
        {
            ::FInitialLevelLoadingPassUtils::UnloadOccupiedLevelGroups();
            FECSWorldPtr local_22 = ECS::GetECSWorld();
            Remove local_26;
            local_26.opCall();
            FFPTime local_32 = FFPTime(-1);
            FECSWorldPtr local_22_2 = ECS::GetECSWorld();
            SendEvent local_30;
            local_30.opCall(ENTITY_NULL, local_32);
            XLog(ELog(22), "Server InitialLevelLoadingPass: All groups loaded");
            return;
        }
        local_34 = true;
        TRawPtr<FPerPassLoadingGroups> local_36 = InitialLevelLoadingData.LoadingGroupsPerPass.Find(InitialLevelLoading.CurrentLoadingPass);
        if (local_36 && (int(local_36.opArrow().Status) == 1))
        {
            bool local_41;
            local_41 = true;
            for (auto& local_56 : local_36.opArrow().NewlyAddedGroupNamesDuringLoading)
            {
                const FLevelGroupConfig& local_58 = LevelConfig::FindLevelGroupConfigByName(LevelDataManager.LevelName, local_56);
                if (!(local_58.IsValid()))
                {
                    continue;
                }
                if (::FInitialLevelLoadingPassUtils::IsGroupOccupied(local_58))
                {
                    XLog(ELog(22), FString().Append("Server InitialLevelLoadingPass: Group [").Append(local_56).Append("] occupied, skipped during loading"));
                    continue;
                }
                FECSEntity local_12 = ::FInitialLevelLoadingPassUtils::ActivateLevelGroupAndGetGroupEntity(LevelDataManager, local_58.GUID);
                if (local_12.IsValid())
                {
                    FLevelGroupLoadingStatus local_66;
                    local_66.GroupGUID = local_58.GUID;
                    local_66.GroupName = local_58.GroupName;
                    local_66.GroupEntity = local_12;
                    local_36.opArrow().GroupStatus.Add(local_66);
                    local_41 = false;
                }
            }
            local_36.opArrow().NewlyAddedGroupNamesDuringLoading.Empty(0);
            if (!(local_41))
            {
                local_34 = false;
            }
            else
            {
                auto local_72 = local_36.opArrow().GroupStatus.Iterator();
                for (; local_72.CanProceed;)
                {
                    FLevelGroupLoadingStatus& local_80 = local_72.Proceed();
                    if (!(local_80.IsLoadingComplete()))
                    {
                        local_41 = false;
                        local_34 = false;
                        break;
                    }
                }
            }
            if (local_41)
            {
                FFPTime local_32_2 = FFPTime(-1);
                FECSWorldPtr local_22_3 = ECS::GetECSWorld();
                local_86.LoadingPass = InitialLevelLoading.CurrentLoadingPass;
                ::FInitialLevelLoadingPassUtils::NotifyLBPPassReady(InitialLevelLoading.CurrentLoadingPass, InitialLevelLoadingData);
                local_36.opArrow().Status = EPassLoadingStatus(2);
                XLog(ELog(22), FString().Append("Server InitialLevelLoadingPass: finish load pass ").Append(InitialLevelLoading.CurrentLoadingPass));
                InitialLevelLoading.CurrentLoadingPass = InitialLevelLoadingData.TryGetNextAvailablePass(InitialLevelLoading.CurrentLoadingPass, false);
                if ((FName(InitialLevelLoading.CurrentLoadingPass) == NAME_None))
                {
                    local_34 = false;
                    return;
                }
            }
        }
        if (!(local_34))
        {
            return;
        }
        local_36 = InitialLevelLoadingData.LoadingGroupsPerPass.Find(InitialLevelLoading.CurrentLoadingPass);
        if (!(local_36))
        {
            XWarning(ELog(22), FString().Append("Server InitialLevelLoadingPass: pass ").Append(InitialLevelLoading.CurrentLoadingPass).Append(" not found"));
            InitialLevelLoading.CurrentLoadingPass = InitialLevelLoadingData.TryGetNextAvailablePass(InitialLevelLoading.CurrentLoadingPass, false);
            return;
        }
        if (int(local_36.opArrow().Status) == 0)
        {
            XLog(ELog(22), FString().Append("Server InitialLevelLoadingPass: start load pass ").Append(InitialLevelLoading.CurrentLoadingPass));
            FFPTime local_32_3 = FFPTime(-1);
            FECSWorldPtr local_22_4 = ECS::GetECSWorld();
            local_94.LoadingPass = InitialLevelLoading.CurrentLoadingPass;
            int local_96 = local_36.opArrow().GroupStatus.Num() - 1;
            for (; local_96 >= 0; --local_96)
            {
                FLevelGroupLoadingStatus& local_80_2 = local_36.opArrow().GroupStatus[local_96];
                if (::FInitialLevelLoadingPassUtils::IsGroupOccupied(LevelConfig::FindLevelGroupConfig(local_80_2.GroupGUID)))
                {
                    XLog(ELog(22), FString().Append("Server InitialLevelLoadingPass: pass ").Append(InitialLevelLoading.CurrentLoadingPass).Append(" group [").Append(local_80_2.GroupName).Append("] occupied, skipped"));
                    local_36.opArrow().GroupStatus.RemoveAt(local_96);
                    continue;
                }
                FECSEntity local_8_2 = ::FInitialLevelLoadingPassUtils::ActivateLevelGroupAndGetGroupEntity(LevelDataManager, local_80_2.GroupGUID);
                if (!(local_8_2.IsValid()))
                {
                    XWarning(ELog(22), FString().Append("Server InitialLevelLoadingPass: pass ").Append(InitialLevelLoading.CurrentLoadingPass).Append(" failed to get group entity, skip waiting. group ").Append(local_80_2.GroupGUID).Append(" ").Append(local_80_2.GroupName));
                    local_36.opArrow().GroupStatus.RemoveAt(local_96);
                    continue;
                }
                local_80_2.GroupEntity = local_8_2;
                XLog(ELog(22), FString().Append("Server InitialLevelLoadingPass: pass ").Append(InitialLevelLoading.CurrentLoadingPass).Append(" start Load group ").Append(local_80_2.GroupGUID).Append(" ").Append(local_80_2.GroupName));
            }
            local_36.opArrow().Status = EPassLoadingStatus(1);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_UpdateLevelGroupLoadingReady(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, const FC_LevelGroupComponent &inout LevelGroupComponent) const
    {
        Has local_4;
        bool local_57 = false;
        if (!(local_4.opCall()))
        {
            FC_LevelGroupCheckReadyTime local_12;
            Assign local_10;
            local_10.opCall(local_12).BeginTime = FixedTime.Time;
        }
        bool local_13 = true;
        Has local_62;
        for (auto& local_32 : LevelGroupComponent.ExitedLevelUnitInstance)
        {
            local_32;
            FECSEntity local_40;
            if (!(local_40.IsValid()))
            {
                continue;
            }
            Get local_44;
            const FC_LevelUnitComponent& local_46 = local_44.opCall();
            if (local_46)
            {
                const FLevelConfigInstance& local_48 = local_46.GetLevelUnitConfigInstance();
                if (!(FInstancedStruct::GetPtr(local_48.GetConfigData()).opCall()) || local_57)
                {
                    continue;
                }
            }
            if (!(local_62.opCall()))
            {
                local_13 = false;
                break;
            }
        }
        float32 local_63 = this.MaxDurationToWaitGroupReady;
        if (local_13)
        {
            Assign local_68;
            local_68.opCall(FC_LevelGroupReadyTag());
        }
        else
        {
            Assign local_68;
            if (local_63 > 0.0f)
            {
                if ((FFPTime(FixedTime.Time) - 0.BeginTime).ToSeconds() > local_63)
                {
                    local_68.opCall(FC_LevelGroupReadyTag());
                    XWarning(ELog(22), FString().Append("Force set group ready! duration: ").Append(local_63).Append("s, group: ").Append(LevelGroupComponent.GroupConfigId));
                }
            }
        }
        Has local_94;
        bool local_5 = local_94.opCall();
        if (local_5)
        {
            ::FInitialLevelLoadingPassUtils::NotifyLBPGroupReady(LevelGroupComponent.GetLevelGroupConfig().GroupName);
            XLog(ELog(22), FString().Append("Server LevelGroupReady: ").Append(LevelGroupComponent.GroupConfigId));
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_InitialUpdateLevelGroups() const
    {
        ECS::GetContextJob();
        this.ServerJob_InitialUpdateLevelGroups();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TickInitialLevelLoadingPass() const
    {
        int local_20 = 0;
        int local_26 = 0;
        int local_32 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        Has local_14;
        if (!(local_14.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_3 = this.GetECSWorld();
        Has local_18;
        if (!(local_18.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_4 = this.GetECSWorld();
        FECSWorldPtr local_4_5 = this.GetECSWorld();
        FECSWorldPtr local_4_6 = this.GetECSWorld();
        this.ServerJob_TickInitialLevelLoadingPass(local_20, local_26, local_32);
        FECSWorldPtr local_4_7 = this.GetECSWorld();
        MarkModifiedIfDirty local_40;
        local_40.opCall(local_20);
        FECSWorldPtr local_4_8 = this.GetECSWorld();
        MarkModifiedIfDirty local_44;
        local_44.opCall(local_26);
        FECSWorldPtr local_4_9 = this.GetECSWorld();
        MarkModifiedIfDirty local_48;
        local_48.opCall(local_32);
        return;
    }
    UFUNCTION()
    void Run_ServerJob_UpdateLevelGroupLoadingReady() const
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
                this.ServerJob_UpdateLevelGroupLoadingReady(local_40, local_6, local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Exclude(local_84).opCall();
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
            this.ServerJob_UpdateLevelGroupLoadingReady(local_170, local_6, local_42);
        }
        local_4.UpdateCachedEntityCount(local_98);
        if (local_8)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
}


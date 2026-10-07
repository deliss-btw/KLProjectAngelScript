

class US_EcologyWorldState : UECSScriptSystem
{
    UPROPERTY()
    TDataObjectPtr<FEcologyLevelDataObject> DefaultEcologyLevelConfig;

    US_EcologyWorldState()
    {
        return;
    }
    UFUNCTION()
    void Job_InitWorldStateWithClient() const
    {
        int local_84 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        FCS_EcologyDataCacheContext local_148;
        Assign local_88;
        local_88.opCall(local_148);
        local_84.EditorLoadPolicy = UEcologyLoadPolicySettings::GetActivePolicy();
        if (local_84.EditorLoadPolicy.bEnabled)
        {
            Print(FString().Append("е·ІејЂеђЇз‰№ж®Ље…іеЌЎеЉ иЅЅз­–з•Ґ"), 999999.0f, FLinearColor(1.0f, 0.84f, 0.0f, 1.0f));
        }
        local_84.LoadRegions = ULevelConfigManager::GetLoadedRegions();
        return;
    }
    UFUNCTION()
    void Job_InitWorldState() const
    {
        int local_64 = 0;
        ::FEcologyUtils::AssignScriptGlobalContext();
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        FCS_EcologyWorldInfo local_34;
        local_34.EcologyLevelConfig = this.DefaultEcologyLevelConfig;
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        if (!(!(local_64)) && local_64.CommissionConfig)
        {
            FCommissionConfig local_68;
            local_34.BaseWorldMonsterLevel = int(local_68.MonsterBaseLevel);
        }
        return;
    }
    UFUNCTION()
    void Job_TimeState() const
    {
        int local_6 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        this.CacheAllTimeTags(0);
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        if (ECS::GetRuntimeInfo().IsServer)
        {
            ::FEcologySceneInfoUtils::UpdateTimeToWorldState(local_6);
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateTimeToWorldState(FCS_EcologyGlobalContext &inout Context) const
    {
        ::FEcologySceneInfoUtils::UpdateTimeToWorldState(::FEcologyUtils::ModifyGlobalContext(ECS::GetECSWorld()));
        return;
    }
    UFUNCTION()
    void Monitor_WeatherEffectInit(const FECSEntity &inout WeatherEntity, const FC_WeatherEffect &inout WeatherEffect) const
    {
        this.ProcessWeatherEffectModification(WeatherEntity, WeatherEffect, false);
        ::FDebugEcologyRefreshUtils::ForceRefreshAllSpawner();
        return;
    }
    UFUNCTION()
    void HandleEventSetCurrentTimeOfDay(const FCE_SetCurrentTimeOfDay &inout Event) const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        ::FEcologySceneInfoUtils::UpdateTimeToWorldState(0);
        return;
    }
    UFUNCTION()
    void Monitor_WeatherEffectModification(const FECSEntity &inout WeatherEntity, const FC_WeatherEffect &inout WeatherEffect) const
    {
        this.ProcessWeatherEffectModification(WeatherEntity, WeatherEffect, false);
        ::FDebugEcologyRefreshUtils::ForceRefreshAllSpawner();
        return;
    }
    UFUNCTION()
    void Monitor_WeatherEffectInactive(const FECSEntity &inout WeatherEntity, const FC_WeatherEffect &inout WeatherEffect) const
    {
        this.ProcessWeatherEffectModification(WeatherEntity, WeatherEffect, true);
        ::FDebugEcologyRefreshUtils::ForceRefreshAllSpawner();
        return;
    }
    UFUNCTION()
    void Monitor_RegionEntityActivite(const FECSEntity &inout Entity, const FC_RegionVolume &inout Volume) const
    {
        this.ProcessRegionModify(Entity, Volume, false);
        return;
    }
    UFUNCTION()
    void Monitor_RegionInactive(const FECSEntity &inout Entity, const FC_RegionVolume &inout Volume) const
    {
        this.ProcessRegionModify(Entity, Volume, false);
        return;
    }
    void ProcessRegionModify(const FECSEntity &inout Entity, const FC_RegionVolume &inout Volume, const bool bRemove = false) const
    {
        int local_8 = 0;
        AECSRegionVolume local_12;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        if (!(local_8))
        {
            return;
        }
        if (Volume.RegionVolume.IsValid())
        {
            AActor local_14;
            local_12 = (Cast<AECSRegionVolume>(local_14));
            if (local_12 != nullptr)
            {
                AECSVolumeBase local_30;
                local_12.GetBounds();
                FVoxelRegionScope local_52 = FVoxelRegionScope(local_30.GetBox());
                FECSEntityId local_67 = FECSEntityId(Entity.GetId());
                FVoxelRegionIterator local_78 = local_52.Iterator();
                for (; local_78.CanProceed;)
                {
                    FEcologyVoxelSceneRegion& local_92 = local_8.VoxelScene.FindOrAddRegion(local_78.Proceed().Current);
                    if (!(bRemove))
                    {
                        FRegionVolumeSummary local_94;
                        FECSEntityId local_68 = Entity.GetId();
                        local_94.bIsCombatRegion = local_12.bAffectCombat;
                        local_94.RegionEntityId = Entity.GetId();
                        local_94.bCompleteInRegion = true;
                        local_94.Bounds = local_30;
                        local_94.Volume = local_12;
                        local_94.Priority = int(local_12.Priority);
                        continue;
                    }
                    if (local_92.VolumeData.Contains(local_67))
                    {
                    }
                }
            }
        }
        return;
    }
    void ProcessWeatherEffectModification(const FECSEntity &inout WeatherEntity, const FC_WeatherEffect &inout WeatherEffect, const bool bRemove = false) const
    {
        int local_8 = 0;
        bool local_9;
        int local_22 = 0;
        AECSRegionVolumeBase local_24;
        FRegionVolumeSummary local_106;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        if (!(local_8))
        {
            return;
        }
        if (!(WeatherEffect.GetSourceEntity().IsValid()))
        {
            local_9 = false;
        }
        else
        {
            Has local_14;
            local_9 = local_14.opCall();
        }
        if (local_9)
        {
            if (local_22.RegionVolume.IsValid())
            {
                AActor local_26;
                local_24 = (Cast<AECSRegionVolumeBase>(local_26));
                if (local_24 != nullptr)
                {
                    FVoxelRegionScope local_64 = FVoxelRegionScope(local_24.GetBounds().GetBox());
                    FVoxelRegionIterator local_88 = local_64.Iterator();
                    for (; local_88.CanProceed;)
                    {
                        FEcologyVoxelSceneRegion& local_102 = local_8.VoxelScene.FindOrAddRegion(local_88.Proceed().Current);
                        if (!(bRemove))
                        {
                            FECSEntityId local_103 = WeatherEffect.GetSourceEntity().GetId();
                            local_106.bEffectWeather = true;
                            local_106.WeatherName = WeatherEffect.GetWeatherName();
                            local_106.WeatherEntityId = WeatherEntity.GetId();
                            local_106.Priority = int(local_24.Priority);
                            continue;
                        }
                        if (local_102.VolumeData.Contains(WeatherEffect.GetSourceEntity().GetId()))
                        {
                            FECSEntityId local_103_2 = WeatherEffect.GetSourceEntity().GetId();
                            if ((local_106.WeatherEntityId == WeatherEntity.GetId()))
                            {
                                local_106.bEffectWeather = false;
                                local_106.WeatherEntityId = FECSEntityId();
                            }
                        }
                    }
                }
            }
        }
        return;
    }
    void CacheAllTimeTags(FCS_EcologyDataCacheContext &inout Context) const
    {
        TDataObjectIterator<FTODTagDefinitionRow> local_16;
        for (; local_16; )
        {
            const FTODTagDefinitionRow& local_20 = local_16.GetData();
            int local_23 = int(local_20.StartMinute);
            int local_25 = int(local_20.StartHour);
            int local_26 = ::FEcologySceneInfoUtils::CombineDayTime(local_25, local_23);
            int local_21 = int(local_20.EndMinute);
            local_25 = int(local_20.EndHour);
            local_23 = ::FEcologySceneInfoUtils::CombineDayTime(local_25, local_21);
            if (local_23 < local_26)
            {
                local_25 = ::FEcologySceneInfoUtils::CombineDayTime(23, 60);
                int local_29 = local_26;
                for (; local_29 <= local_25; )
                {
                    Context.DataCache.TimeGameplayTags.FindOrAdd(local_29).AppendTags(local_16.GetData().Tags);
                    ++local_29;
                }
                local_29 = 0;
                for (; local_29 <= local_23; )
                {
                    Context.DataCache.TimeGameplayTags.FindOrAdd(local_29).AppendTags(local_16.GetData().Tags);
                    ++local_29;
                }
            }
            else
            {
                int local_29_2 = local_26;
                for (; local_29_2 <= local_23; )
                {
                    Context.DataCache.TimeGameplayTags.FindOrAdd(local_29_2).AppendTags(local_16.GetData().Tags);
                    ++local_29_2;
                }
            }
            local_16.Next();
        }
        return;
    }
    UFUNCTION()
    void Job_ProcessFlockVoxelInfo(const FC_EcologyFlockComponent &inout FlockComponent, const FECSEntity &inout Entity) const
    {
        for (auto& local_16 : FlockComponent.CreatureEntities)
        {
            if (FECSEntity(local_16))
            {
                FC_WaitingUpdateToVoxelSceneTag local_30;
                Assign local_28;
                local_28.opCall(local_30);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateNormalUnitToVoxelScene(const FECSEntity &inout Entity, const FC_Transform &inout Transform, FC_EcologyVoxelUnit &inout VoxelUnit) const
    {
        if (Transform.GetPosition().DistSquared2D(VoxelUnit.LastScope.GetCenter()) > 625.0)
        {
            FC_WaitingUpdateToVoxelSceneTag local_18;
            Assign local_16;
            local_16.opCall(local_18);
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateEntityToVoxelScene(const FECSEntity &inout Entity, const FC_Transform &inout Transform, FC_EcologyVoxelUnit &inout VoxelUnit) const
    {
        ::FEcologySceneInfoUtils::UpdateEntityToVoxelScene(Entity, Transform.GetPosition(), VoxelUnit, false);
        Remove local_6;
        local_6.opCall();
        return;
    }
    UFUNCTION()
    void Jon_CleanUpUnit(const FECSEntity &inout UnitEntity, FC_EcologyVoxelUnit &inout VoxelUnitComponent) const
    {
        ::FEcologySceneInfoUtils::RemoveFormVoxelScene(UnitEntity, VoxelUnitComponent);
        return;
    }
    UFUNCTION()
    void Run_Job_InitWorldStateWithClient() const
    {
        ECS::GetContextJob();
        this.Job_InitWorldStateWithClient();
        return;
    }
    UFUNCTION()
    void Run_Job_InitWorldState() const
    {
        ECS::GetContextJob();
        this.Job_InitWorldState();
        return;
    }
    UFUNCTION()
    void Run_Job_TimeState() const
    {
        ECS::GetContextJob();
        this.Job_TimeState();
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateTimeToWorldState() const
    {
        int local_16 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(60))))
        {
            return;
        }
        FECSWorldPtr local_10 = this.GetECSWorld();
        Has local_14;
        if (!(local_14.opCall()))
        {
            return;
        }
        FECSWorldPtr local_10_2 = this.GetECSWorld();
        this.Job_UpdateTimeToWorldState(local_16);
        FECSWorldPtr local_10_3 = this.GetECSWorld();
        MarkModifiedIfDirty local_24;
        local_24.opCall(local_16);
        return;
    }
    UFUNCTION()
    void Run_Monitor_WeatherEffectInit() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorWeatherEffectOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_WeatherEffectInit(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_HandleEventSetCurrentTimeOfDay() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_SetCurrentTimeOfDay> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_SetCurrentTimeOfDay& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.HandleEventSetCurrentTimeOfDay(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_WeatherEffectModification() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorWeatherEffectOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_WeatherEffectModification(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_WeatherEffectInactive() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorWeatherEffectOnInactiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_WeatherEffectInactive(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_RegionEntityActivite() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorRegionVolumeOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_RegionEntityActivite(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_RegionInactive() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorRegionVolumeOnRemoveView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_RegionInactive(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ProcessFlockVoxelInfo() const
    {
        int local_36 = 0;
        const FECSEntity& local_42;
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
                this.Job_ProcessFlockVoxelInfo(local_36, local_42);
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
            local_42 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_42.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_42);
            this.Job_ProcessFlockVoxelInfo(local_36, local_170);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateNormalUnitToVoxelScene_StaticReg() const
    {
        const FECSEntity& local_42;
        int local_44 = 0;
        int local_50 = 0;
        MarkModifiedIfDirty local_58;
        int local_190 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(5.0))))
        {
            return;
        }
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_12 = 1;
        int local_11 = local_12;
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
                this.Job_UpdateNormalUnitToVoxelScene(local_42, local_44, local_50);
                local_58.opCall(local_50);
            }
            local_4.UpdateCachedEntityCount(local_19);
            return;
        }
        FECSRuntimeView local_96 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Exclude(local_96).opCall();
        Exclude(local_96).opCall();
        Exclude(local_96).opCall();
        bool local_10 = local_4.BeginViewCacheBuild();
        int local_20 = local_4.GetViewCacheEpoch();
        int local_118 = 0;
        FECSRuntimeViewIterator local_152 = local_96.Iterator();
        for (; local_152.CanProceed;)
        {
            local_42 = local_152.Proceed();
            ++local_118;
            if (local_10)
            {
                local_4.AddViewCacheEntity(local_42.GetId());
            }
            FECSEntityScopeCycleCounter local_39_2 = FECSEntityScopeCycleCounter(local_42);
            this.Job_UpdateNormalUnitToVoxelScene(local_190, local_44, local_50);
            local_58.opCall(local_50);
        }
        local_4.UpdateCachedEntityCount(local_118);
        if (local_10)
        {
            local_4.CommitViewCacheBuild(local_20);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateNormalUnitToVoxelScene_DefaultReg() const
    {
        const FECSEntity& local_42;
        int local_44 = 0;
        int local_50 = 0;
        MarkModifiedIfDirty local_58;
        int local_190 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(5.0))))
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
                this.Job_UpdateNormalUnitToVoxelScene(local_42, local_44, local_50);
                local_58.opCall(local_50);
            }
            local_4.UpdateCachedEntityCount(local_19);
            return;
        }
        FECSRuntimeView local_96 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Exclude(local_96).opCall();
        Exclude(local_96).opCall();
        Exclude(local_96).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_20 = local_4.GetViewCacheEpoch();
        int local_118 = 0;
        FECSRuntimeViewIterator local_152 = local_96.Iterator();
        for (; local_152.CanProceed;)
        {
            local_42 = local_152.Proceed();
            ++local_118;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_42.GetId());
            }
            FECSEntityScopeCycleCounter local_39_2 = FECSEntityScopeCycleCounter(local_42);
            this.Job_UpdateNormalUnitToVoxelScene(local_190, local_44, local_50);
            local_58.opCall(local_50);
        }
        local_4.UpdateCachedEntityCount(local_118);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_20);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateNormalUnitToVoxelScene_LocalReg() const
    {
        const FECSEntity& local_42;
        int local_44 = 0;
        int local_50 = 0;
        MarkModifiedIfDirty local_58;
        int local_190 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(5.0))))
        {
            return;
        }
        if (this.GetECSRuntime().IsClient && !(local_2.bFirstTimeTick))
        {
            return;
        }
        int local_12 = 2;
        int local_11 = local_12;
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
                this.Job_UpdateNormalUnitToVoxelScene(local_42, local_44, local_50);
                local_58.opCall(local_50);
            }
            local_4.UpdateCachedEntityCount(local_19);
            return;
        }
        FECSRuntimeView local_96 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Exclude(local_96).opCall();
        Exclude(local_96).opCall();
        Exclude(local_96).opCall();
        bool local_10 = local_4.BeginViewCacheBuild();
        int local_20 = local_4.GetViewCacheEpoch();
        int local_118 = 0;
        FECSRuntimeViewIterator local_152 = local_96.Iterator();
        for (; local_152.CanProceed;)
        {
            local_42 = local_152.Proceed();
            ++local_118;
            if (local_10)
            {
                local_4.AddViewCacheEntity(local_42.GetId());
            }
            FECSEntityScopeCycleCounter local_39_2 = FECSEntityScopeCycleCounter(local_42);
            this.Job_UpdateNormalUnitToVoxelScene(local_190, local_44, local_50);
            local_58.opCall(local_50);
        }
        local_4.UpdateCachedEntityCount(local_118);
        if (local_10)
        {
            local_4.CommitViewCacheBuild(local_20);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateEntityToVoxelScene_StaticReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        MarkModifiedIfDirty local_54;
        int local_186 = 0;
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
                this.Job_UpdateEntityToVoxelScene(local_38, local_40, local_46);
                local_54.opCall(local_46);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_92 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Exclude(local_92).opCall();
        Exclude(local_92).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_114 = 0;
        FECSRuntimeViewIterator local_148 = local_92.Iterator();
        for (; local_148.CanProceed;)
        {
            local_38 = local_148.Proceed();
            ++local_114;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_UpdateEntityToVoxelScene(local_186, local_40, local_46);
            local_54.opCall(local_46);
        }
        local_4.UpdateCachedEntityCount(local_114);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateEntityToVoxelScene_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        MarkModifiedIfDirty local_54;
        int local_186 = 0;
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
                this.Job_UpdateEntityToVoxelScene(local_38, local_40, local_46);
                local_54.opCall(local_46);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_92 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Exclude(local_92).opCall();
        Exclude(local_92).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_114 = 0;
        FECSRuntimeViewIterator local_148 = local_92.Iterator();
        for (; local_148.CanProceed;)
        {
            local_38 = local_148.Proceed();
            ++local_114;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_UpdateEntityToVoxelScene(local_186, local_40, local_46);
            local_54.opCall(local_46);
        }
        local_4.UpdateCachedEntityCount(local_114);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateEntityToVoxelScene_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        int local_46 = 0;
        MarkModifiedIfDirty local_54;
        int local_186 = 0;
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
                this.Job_UpdateEntityToVoxelScene(local_38, local_40, local_46);
                local_54.opCall(local_46);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_92 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Exclude(local_92).opCall();
        Exclude(local_92).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_114 = 0;
        FECSRuntimeViewIterator local_148 = local_92.Iterator();
        for (; local_148.CanProceed;)
        {
            local_38 = local_148.Proceed();
            ++local_114;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Job_UpdateEntityToVoxelScene(local_186, local_40, local_46);
            local_54.opCall(local_46);
        }
        local_4.UpdateCachedEntityCount(local_114);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Jon_CleanUpUnit_StaticReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        MarkModifiedIfDirty local_48;
        int local_172 = 0;
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
                this.Jon_CleanUpUnit(local_38, local_40);
                local_48.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Exclude(local_86).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_100 = 0;
        FECSRuntimeViewIterator local_134 = local_86.Iterator();
        for (; local_134.CanProceed;)
        {
            local_38 = local_134.Proceed();
            ++local_100;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Jon_CleanUpUnit(local_172, local_40);
            local_48.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_100);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Jon_CleanUpUnit_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        MarkModifiedIfDirty local_48;
        int local_172 = 0;
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
                this.Jon_CleanUpUnit(local_38, local_40);
                local_48.opCall(local_40);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Exclude(local_86).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_100 = 0;
        FECSRuntimeViewIterator local_134 = local_86.Iterator();
        for (; local_134.CanProceed;)
        {
            local_38 = local_134.Proceed();
            ++local_100;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Jon_CleanUpUnit(local_172, local_40);
            local_48.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_100);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_Jon_CleanUpUnit_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        MarkModifiedIfDirty local_48;
        int local_172 = 0;
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
                this.Jon_CleanUpUnit(local_38, local_40);
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
        Exclude(local_86).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_100 = 0;
        FECSRuntimeViewIterator local_134 = local_86.Iterator();
        for (; local_134.CanProceed;)
        {
            local_38 = local_134.Proceed();
            ++local_100;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.Jon_CleanUpUnit(local_172, local_40);
            local_48.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_100);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
}


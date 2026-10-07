

class US_AccountExclusiveCollectionPrefabSystem : UECSScriptSystem
{
    US_AccountExclusiveCollectionPrefabSystem()
    {
        return;
    }
    void PlayInstantFX(const FECSEntity &inout Entity, const TArray<FCollectionPrefabPlayFXCallParam> &inout FXConfigs) const
    {
        for (auto& local_16 : FXConfigs)
        {
            ::FFXUtils::PlayFXInstant(Entity, local_16.FXActorClass, local_16.OverrideParam, NAME_None, true, EFXBaseTransformResolveModeWithAttachmentOption(0), local_16.LocationOrOffset, EFXOffsetSpaceWithAttachmentOption(3), local_16.RotationOrOffset, EFXOffsetSpaceWithAttachmentOption(3), true, FECSEntity());
        }
        return;
    }
    TArray<FECSEntity> PlayDurationalFX(const FECSEntity &inout Entity, const TArray<FCollectionPrefabPlayFXCallParam> &inout FXConfigs) const
    {
        TArray<FECSEntity> local_4;
        for (auto& local_20 : FXConfigs)
        {
            local_4.Add(::FFXUtils::PlayFXDurational(Entity, local_20.FXActorClass, local_20.OverrideParam, NAME_None, true, EFXBaseTransformResolveModeWithAttachmentOption(0), local_20.LocationOrOffset, EFXOffsetSpaceWithAttachmentOption(3), local_20.RotationOrOffset, EFXOffsetSpaceWithAttachmentOption(3), true, FECSEntity(), EAttachFXStopMethod(0)));
        }
        return local_4;
    }
    UFUNCTION()
    void Monitor_ClientAssignPresentationCache(const FECSEntity &inout Entity, const FC_AccountExclusiveCollectionPrefabPresentationConfig &inout PresentationConfig) const
    {
        FC_AccountExclusiveCollectionPrefabPresentationCache local_8;
        Assign local_4;
        local_4.opCall(local_8);
        return;
    }
    UFUNCTION()
    void Monitor_ClientDestroyDurationalFX(const FECSEntity &inout Entity, const FC_AccountExclusiveCollectionPrefabPresentationCache &inout Cache) const
    {
        for (auto& local_16 : Cache.NormalDurationalFXEntities)
        {
            ::FFXUtils::StopFX(local_16, true);
        }
        return;
    }
    UFUNCTION()
    void ClientJob_InitAccountExclusiveCollectionPrefabState(const FECSEntity &inout Entity, const FC_LevelObjectStatConfig &inout LevelObjectStatConfig, const FC_VisualComponentToggleConfig &inout VisualComponentToggleConfig, const FC_AccountExclusiveCollectionPrefabPresentationConfig &inout PresentationConfig) const
    {
        Remove local_4;
        local_4.opCall();
        if (!(LevelObjectStatConfig.LevelObjectStatConfig.IsSet()))
        {
            return;
        }
        if (0 != 4)
        {
            return;
        }
        FECSEntity local_16 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
        if (!(local_16.IsValid()))
        {
            return;
        }
        if (::FLevelObjectStatUtils::IsLevelObjectRecorded(local_16, LevelObjectStatConfig.LevelObjectStatConfig))
        {
            for (auto& local_30 : VisualComponentToggleConfig.Names)
            {
                Modify local_34;
                FC_PresentationVisualComponentToggleDelayHidden& local_36 = local_34.opCall();
                if (local_36)
                {
                    if (local_36.TryCancelDelayHiddenTaskByLogicNameAndUpdateNextTargetTime(local_30))
                    {
                        Remove local_40;
                        local_40.opCall();
                    }
                }
                FVisualComponentToggleUtils::SetVisualComponentHidden(Entity, local_30, true, FName("CollectionPrefabConsumed"));
            }
        }
        else
        {
            if (PresentationConfig && !(PresentationConfig.DurationalFXConfigs.IsEmpty()))
            {
                ModifyOrAdd local_48;
                FC_AccountExclusiveCollectionPrefabPresentationCache& local_50 = local_48.opCall();
                if (local_50)
                {
                    local_50.NormalDurationalFXEntities = this.PlayDurationalFX(Entity, PresentationConfig.DurationalFXConfigs);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_HandleCollectionPrefabCollected(const FCE_AccountExclusiveCollectionPrefabCollected &inout Event) const
    {
        int local_8 = 0;
        int local_38 = 0;
        if (!(Event.CollectionPrefabEntity.IsValid()))
        {
            return;
        }
        if (local_8 && !(local_8.InstantFXConfigs.IsEmpty()))
        {
            this.PlayInstantFX(Event.CollectionPrefabEntity, local_8.InstantFXConfigs);
        }
        Modify local_14;
        FC_AccountExclusiveCollectionPrefabPresentationCache& local_16 = local_14.opCall();
        if (local_16)
        {
            for (auto& local_30 : local_16.NormalDurationalFXEntities)
            {
                ::FFXUtils::StopFX(local_30, true);
            }
            local_16.NormalDurationalFXEntities.Empty(0);
        }
        if (!(local_38))
        {
            return;
        }
        FName local_40 = FName("CollectionPrefabCollected");
        ECS::GetContextTime();
        return;
    }
    UFUNCTION()
    void Run_Monitor_ClientAssignPresentationCache() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorAccountExclusiveCollectionPrefabPresentationConfigOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ClientAssignPresentationCache(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ClientDestroyDurationalFX() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorAccountExclusiveCollectionPrefabPresentationCacheOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ClientDestroyDurationalFX(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_InitAccountExclusiveCollectionPrefabState() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_50 = 0;
        int local_190 = 0;
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
                this.ClientJob_InitAccountExclusiveCollectionPrefabState(local_36, local_38, local_44, local_50);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_92 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Exclude(local_92).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_118 = 0;
        FECSRuntimeViewIterator local_152 = local_92.Iterator();
        for (; local_152.CanProceed;)
        {
            local_36 = local_152.Proceed();
            ++local_118;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_InitAccountExclusiveCollectionPrefabState(local_190, local_38, local_44, local_50);
        }
        local_2.UpdateCachedEntityCount(local_118);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleCollectionPrefabCollected() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_AccountExclusiveCollectionPrefabCollected> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_AccountExclusiveCollectionPrefabCollected& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleCollectionPrefabCollected(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}


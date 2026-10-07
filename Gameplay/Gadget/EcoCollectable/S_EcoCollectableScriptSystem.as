

class US_EcoCollectableScriptSystem : UECSScriptSystem
{
    FName NAME_FruitDither = FName("FruitDither");
    FName NAME_CollectShake = FName("CollectShake");
    FName NAME_EnvDitherExcludeFruit = FName("EnvDitherExcludeFruit");

    US_EcoCollectableScriptSystem()
    {
        return;
    }
    void SetEntitySceneCompHidden(const FECSEntity &inout CollectableNonSyncedEntity, const FC_VisualComponentToggleConfig &inout VisualComponentToggleConfig, const TArray<FName> &inout Names, const bool bHidden, const bool bUnhideReinitializeNS = true) const
    {
        FFPTime local_2 = FFPTime(CollectableNonSyncedEntity.GetWorld().GetFixedTime().Time);
        bool local_6 = bUnhideReinitializeNS && !(bHidden);
        if (local_6)
        {
            ::FFXUtils::ReinitializeNiagaraComponent(CollectableNonSyncedEntity, VisualComponentToggleConfig, Names);
        }
        if (!(bHidden))
        {
            local_6 = false;
        }
        else
        {
            local_6 = VisualComponentToggleConfig;
        }
        if (local_6)
        {
            ::FFXUtils::SetNiagaraComponentDitherOverrideParam(CollectableNonSyncedEntity, VisualComponentToggleConfig, local_2, Names);
        }
        ::VisualComponentToggleUtils::SetVisualComponentHiddenWithPotentialDelay(CollectableNonSyncedEntity, VisualComponentToggleConfig, Names, bHidden, local_2, this.GetFName(), true);
        return;
    }
    void SetComponentsDynamicMaskedMaterial(const FECSEntity &inout CollectableNonSyncedEntity, const TArray<FName> &inout Names, const bool bMaskOn) const
    {
        UPrimitiveComponent local_48;
        AGameActor local_6 = (Cast<AGameActor>(CollectableNonSyncedEntity.GetActor()));
        if (local_6 != nullptr)
        {
            for (auto& local_22 : Names)
            {
                TArray<USceneComponent> local_30 = local_6.GetCachedSceneComponentByLogicName(local_22);
                for (auto local_44 : local_30)
                {
                    local_48 = Cast<UPrimitiveComponent>(local_44);
                    if (local_48 != nullptr)
                    {
                        local_48.SetEnableDynamicMaskedMaterial(bMaskOn);
                    }
                }
            }
        }
        return;
    }
    void SetComponentsDynamicMaskedMaterialOnForDuration_Fruit(const FECSEntity &inout CollectableNonSyncedEntity, const FC_EcoCollectableConfig &inout CollectableConfig, const FC_VisualComponentToggleConfig &inout VisualComponentToggleConfig, const bool bTargetMeshHiddenState, const float32 Duration = 5.0f) const
    {
        if (!(bTargetMeshHiddenState))
        {
            this.SetEntitySceneCompHidden(CollectableNonSyncedEntity, VisualComponentToggleConfig, CollectableConfig.CollectedDitherLogicNames, false, true);
        }
        this.SetComponentsDynamicMaskedMaterial(CollectableNonSyncedEntity, CollectableConfig.CollectedDitherLogicNames, true);
        FECSWorldPtr local_4 = CollectableNonSyncedEntity.GetWorld();
        Get local_8;
        const FCS_FixedTime& local_10 = local_8.opCall();
        if (local_10)
        {
            ModifyOrAdd local_14;
            FC_EcoCollectableTurnOffFruitDitherDynamicMaskedMaterialTimer& local_16 = local_14.opCall();
            if (local_16)
            {
                local_16.TurnOffDynamicMaskedMaterialTimer = FFPTime((local_10.Time.ToSeconds() + Duration));
                local_16.bTargetMeshHiddenState = bTargetMeshHiddenState;
            }
        }
        return;
    }
    void SetComponentsDynamicMaskedMaterialOnForDuration_EnvDitherExceptFruit(const FECSEntity &inout CollectableNonSyncedEntity, const FC_EcoCollectableConfig &inout CollectableConfig, const FC_VisualComponentToggleConfig &inout VisualComponentToggleConfig, const bool bTargetMeshHiddenState, const float32 Duration = 5.0f) const
    {
        if (!(bTargetMeshHiddenState))
        {
            this.SetEntitySceneCompHidden(CollectableNonSyncedEntity, VisualComponentToggleConfig, CollectableConfig.EnvDitherLogicNamesExcludeFruit, false, true);
        }
        this.SetComponentsDynamicMaskedMaterial(CollectableNonSyncedEntity, CollectableConfig.EnvDitherLogicNamesExcludeFruit, true);
        FECSWorldPtr local_4 = CollectableNonSyncedEntity.GetWorld();
        Get local_8;
        const FCS_FixedTime& local_10 = local_8.opCall();
        if (local_10)
        {
            ModifyOrAdd local_14;
            FC_EcoCollectableTurnOffEnvDitherExceptFruitDynamicMaskedMaterialTimer& local_16 = local_14.opCall();
            if (local_16)
            {
                local_16.TurnOffDynamicMaskedMaterialTimer = FFPTime((local_10.Time.ToSeconds() + Duration));
                local_16.bTargetMeshHiddenState = bTargetMeshHiddenState;
            }
        }
        return;
    }
    void SetDitherMaterialAnim(const FECSEntity &inout CollectableNonSyncedEntity, const FC_EcoCollectableConfig &inout CollectableConfig, const TArray<FName> &inout Names, const FName &inout RequestName) const
    {
        if (CollectableConfig.bUseDefaultCollectedDitherMaterialConfig)
        {
            TArray<FSingleMaterialParamRequestData> local_6;
            for (auto& local_20 : Names)
            {
                FSingleMaterialParamRequestData local_52;
                local_52.SetbUseLogicName(true);
                local_52.SetMeshName(local_20);
                local_52.SetbIsOverlayMaterial(false);
                local_52.SetbApplyToAllSlot(true);
                FFloatParamRequestData local_76;
                local_76.ParamName = FName("Dither йЂЏжЋеє¦");
                local_76.bUseNormalizedBlendInCurve = true;
                local_52.GetModify_FloatParams().Add(local_76);
                local_6.Add(local_52);
            }
            ::FMaterialUtils::LocalOnlyRequestChangeMaterialParam(CollectableNonSyncedEntity, RequestName, local_6);
            return;
        }
        ::FMaterialUtils::LocalOnlyRequestChangeMaterialParam(CollectableNonSyncedEntity, RequestName, CollectableConfig.CollectedDitherMaterialConfig);
        return;
    }
    void SetShakeMaterialAnim(const FECSEntity &inout CollectableNonSyncedEntity, const FC_EcoCollectableConfig &inout CollectableConfig, const TArray<FName> &inout Names, const FName &inout RequestName) const
    {
        if (CollectableConfig.bUseDefaultCollectedShakeMaterialConfig)
        {
            TArray<FSingleMaterialParamRequestData> local_6;
            for (auto& local_20 : Names)
            {
                FSingleMaterialParamRequestData local_52;
                local_52.SetbUseLogicName(true);
                local_52.SetMeshName(local_20);
                local_52.SetbIsOverlayMaterial(false);
                local_52.SetbUseSlotName(false);
                local_52.SetMaterialIndex(0);
                FFloatParamRequestData local_78;
                local_78.ParamName = FName("UseInteractive");
                local_78.bUseNormalizedBlendInCurve = true;
                local_52.GetModify_FloatParams().Add(local_78);
                local_78.ParamName = FName("InteractiveStart");
                local_78.bUseNormalizedBlendInCurve = true;
                local_52.GetModify_FloatParams().Add(local_78);
                local_78.ParamName = FName("InteractiveTime");
                local_78.bUseNormalizedBlendInCurve = true;
                local_52.GetModify_FloatParams().Add(local_78);
                local_6.Add(local_52);
            }
            ::FMaterialUtils::LocalOnlyRequestChangeMaterialParam(CollectableNonSyncedEntity, RequestName, local_6);
        }
        else
        {
            ::FMaterialUtils::LocalOnlyRequestChangeMaterialParam(CollectableNonSyncedEntity, RequestName, CollectableConfig.CollectedShakeMaterialConfig);
        }
        FECSWorldPtr local_84 = CollectableNonSyncedEntity.GetWorld();
        Get local_88;
        const FCS_FixedTime& local_90 = local_88.opCall();
        if (local_90)
        {
            ModifyOrAdd local_94;
            FC_EcoCollectableRemoveManualInteractTimer& local_96 = local_94.opCall();
            if (local_96)
            {
                local_96.RemoveManualInteractTimer = FFPTime((local_90.Time.ToSeconds() + 1.2));
            }
        }
        return;
    }
    void SetHiddenOrDither(const FECSEntity &inout CollectableNonSyncedEntity, const FC_EcoCollectableConfig &inout CollectableConfig, const FC_VisualComponentToggleConfig &inout VisualComponentToggleConfig, const TArray<FName> &inout Names, const FName &inout RequestName, const bool bHiddenOrDither = true) const
    {
        if (CollectableConfig.bHideSceneComponentDirectly)
        {
            this.SetEntitySceneCompHidden(CollectableNonSyncedEntity, VisualComponentToggleConfig, Names, bHiddenOrDither, true);
            return;
        }
        if ((!((RequestName == NAME_None))))
        {
            if (bHiddenOrDither)
            {
                this.SetDitherMaterialAnim(CollectableNonSyncedEntity, CollectableConfig, Names, RequestName);
                return;
            }
            ::FMaterialUtils::LocalOnlyRemoveChangeMaterialRequest(CollectableNonSyncedEntity, RequestName, 1.0f, FSoftObjectPath());
        }
        return;
    }
    void SetEcoCollectableEntityViewAccordingToCollectReadyStatus(const FECSEntity &inout CollectableNonSyncedEntity, const FC_EcoCollectableConfig &inout CollectableConfig, FC_EcoCollectableNonSyncedVisualStatus &inout CollectableNonSyncedVisualStatus, const EEcoCollectableNonSyncedCollectReadyStatus NewCollectReadyStatus, const FC_VisualComponentToggleConfig &inout VisualComponentToggleConfig) const
    {
        CollectableNonSyncedVisualStatus.CollectReadyStatus = NewCollectReadyStatus;
        if (int(NewCollectReadyStatus) == 0)
        {
            this.SetComponentsDynamicMaskedMaterialOnForDuration_Fruit(CollectableNonSyncedEntity, CollectableConfig, VisualComponentToggleConfig, false, 5.0f);
            this.SetHiddenOrDither(CollectableNonSyncedEntity, CollectableConfig, VisualComponentToggleConfig, CollectableConfig.CollectedDitherLogicNames, this.NAME_FruitDither, false);
            this.PlayFX(CollectableNonSyncedEntity, CollectableConfig.InteractTipInstantFXs);
            this.PlayInteractTipDurationalFX(CollectableNonSyncedEntity, CollectableConfig, CollectableNonSyncedVisualStatus, VisualComponentToggleConfig, true);
            return;
        }
        if (int(NewCollectReadyStatus) == 1)
        {
            this.SetComponentsDynamicMaskedMaterialOnForDuration_Fruit(CollectableNonSyncedEntity, CollectableConfig, VisualComponentToggleConfig, true, 5.0f);
            this.SetHiddenOrDither(CollectableNonSyncedEntity, CollectableConfig, VisualComponentToggleConfig, CollectableConfig.CollectedDitherLogicNames, this.NAME_FruitDither, true);
            this.SetShakeMaterialAnim(CollectableNonSyncedEntity, CollectableConfig, CollectableConfig.CollectedShakeLogicNames, this.NAME_CollectShake);
            this.PlayFX(CollectableNonSyncedEntity, CollectableConfig.CollectedFXConfigs);
            this.StopInteractTipDurationalFX(CollectableNonSyncedEntity, CollectableConfig, CollectableNonSyncedVisualStatus, VisualComponentToggleConfig, true);
        }
        return;
    }
    void StopInstantFX(const FECSEntity &inout Entity, const FC_VisualComponentToggleConfig &inout VisualComponentToggleConfig, const TArray<FName> &inout FXCompLogicNamesArray) const
    {
        this.SetEntitySceneCompHidden(Entity, VisualComponentToggleConfig, FXCompLogicNamesArray, true, true);
        return;
    }
    void PlayFX(const FECSEntity &inout CollectableNonSyncedEntity, const TArray<FPlayFXCallParam> &inout FXParams) const
    {
        for (auto& local_16 : FXParams)
        {
            ::FFXUtils::PlayFXInstant(CollectableNonSyncedEntity, local_16.FXActorClass, local_16.OverrideParam, local_16.AttachSocket, (int(local_16.bIsAttached) != 0), EFXBaseTransformResolveModeWithAttachmentOption(0), local_16.LocationOrOffset, EFXOffsetSpaceWithAttachmentOption(3), local_16.RotationOrOffset, EFXOffsetSpaceWithAttachmentOption(3), true, FECSEntity());
        }
        return;
    }
    void StopInteractTipDurationalFX(const FECSEntity &inout CollectableNonSyncedEntity, const FC_EcoCollectableConfig &inout EcoCollectableConfig, FC_EcoCollectableNonSyncedVisualStatus &inout VisualStatus, const FC_VisualComponentToggleConfig &inout VisualComponentToggleConfig, const bool bIgnoreIfAlreadyInactive = true) const
    {
        if ((bIgnoreIfAlreadyInactive && !(VisualStatus.bInteractTipDurationalFXActive)))
        {
            return;
        }
        this.SetEntitySceneCompHidden(CollectableNonSyncedEntity, VisualComponentToggleConfig, EcoCollectableConfig.InteractTipDurationalFXCompLogicNames, true, true);
        VisualStatus.bInteractTipDurationalFXActive = false;
        return;
    }
    void PlayInteractTipDurationalFX(const FECSEntity &inout CollectableNonSyncedEntity, const FC_EcoCollectableConfig &inout EcoCollectableConfig, FC_EcoCollectableNonSyncedVisualStatus &inout VisualStatus, const FC_VisualComponentToggleConfig &inout VisualComponentToggleConfig, const bool bResetNSState = true) const
    {
        if (VisualStatus.bInteractTipDurationalFXActive)
        {
            return;
        }
        Modify local_6;
        FC_PresentationVisualComponentToggleDelayHidden& local_8 = local_6.opCall();
        if (local_8)
        {
            for (auto& local_22 : EcoCollectableConfig.InteractTipDurationalFXCompLogicNames)
            {
                local_8.TryCancelDelayHiddenTaskByLogicNameAndUpdateNextTargetTime(local_22);
            }
        }
        this.SetEntitySceneCompHidden(CollectableNonSyncedEntity, VisualComponentToggleConfig, EcoCollectableConfig.InteractTipDurationalFXCompLogicNames, false, true);
        VisualStatus.bInteractTipDurationalFXActive = true;
        return;
    }
    void StopEnvDurationalFX(const FECSEntity &inout CollectableNonSyncedEntity, const FC_EcoCollectableConfig &inout EcoCollectableConfig, FC_EcoCollectableNonSyncedVisualStatus &inout VisualStatus, const FC_VisualComponentToggleConfig &inout VisualComponentToggleConfig, const bool bIgnoreIfAlreadyInactive = true) const
    {
        int local_19 = 0;
        if (bIgnoreIfAlreadyInactive && VisualStatus.EnvDurationalFXActiveIndices.IsEmpty())
        {
            return;
        }
        if (bIgnoreIfAlreadyInactive)
        {
            int local_15;
            auto local_8 = VisualStatus.EnvDurationalFXActiveIndices.Iterator();
            for (; local_8.CanProceed;)
            {
                local_15 = local_8.Proceed();
                if (local_15 >= 0 && (local_15 < EcoCollectableConfig.EnvDurationalFXs.Num()))
                {
                    this.SetEntitySceneCompHidden(CollectableNonSyncedEntity, VisualComponentToggleConfig, EcoCollectableConfig.EnvDurationalFXs[local_15].FXLogicNames, true, true);
                }
            }
        }
        else
        {
            int local_15;
            local_15 = 0;
            while (local_15 < local_19)
            {
                this.SetEntitySceneCompHidden(CollectableNonSyncedEntity, VisualComponentToggleConfig, EcoCollectableConfig.EnvDurationalFXs[local_15].FXLogicNames, true, true);
                ++local_15;
                local_19 = EcoCollectableConfig.EnvDurationalFXs.Num();
            }
        }
        VisualStatus.EnvDurationalFXActiveIndices.Reset(0);
        return;
    }
    void PlayEnvDurationalFX(const FECSEntity &inout CollectableNonSyncedEntity, const FC_EcoCollectableConfig &inout EcoCollectableConfig, FC_EcoCollectableNonSyncedVisualStatus &inout VisualStatus, const FC_VisualComponentToggleConfig &inout VisualComponentToggleConfig, const int EnvFXConfigIndex) const
    {
        if (VisualStatus.EnvDurationalFXActiveIndices.Contains(EnvFXConfigIndex))
        {
            return;
        }
        if (!(EnvFXConfigIndex >= 0 && (EnvFXConfigIndex < EcoCollectableConfig.EnvDurationalFXs.Num())))
        {
            return;
        }
        const FTimeAndSpaceRelatedDurationalFXConfig& local_6 = EcoCollectableConfig.EnvDurationalFXs[EnvFXConfigIndex];
        Modify local_10;
        FC_PresentationVisualComponentToggleDelayHidden& local_12 = local_10.opCall();
        if (local_12)
        {
            for (auto& local_26 : local_6.FXLogicNames)
            {
                local_12.TryCancelDelayHiddenTaskByLogicNameAndUpdateNextTargetTime(local_26);
            }
        }
        this.SetEntitySceneCompHidden(CollectableNonSyncedEntity, VisualComponentToggleConfig, local_6.FXLogicNames, false, true);
        VisualStatus.EnvDurationalFXActiveIndices.Add(EnvFXConfigIndex);
        return;
    }
    UFUNCTION()
    void Job_InitEcoCollectableDataCache() const
    {
        FCS_EcoCollectableDataCache local_48;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Assign local_6;
        local_6.opCall(local_48);
        return;
    }
    UFUNCTION()
    void Monitor_RegisterStaticToDynamicEntityIdMapItem(const FC_EcoCollectableSyncedRuntime &inout SyncedRuntime, const FECSEntity &inout SyncedEntity) const
    {
        if ((!(!((FECSEntityId(SyncedRuntime.GetStaticEntityId()) == ENTITY_ID_NULL)))))
        {
            return;
        }
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        Modify local_8;
        FCS_EcoCollectableDataCache& local_10 = local_8.opCall();
        if (local_10)
        {
            local_10.GetModify_Static2DynamicEntityIdMap().Add(SyncedRuntime.GetStaticEntityId(), SyncedEntity.GetId());
            local_10.GetModify_Dynamic2StaticEntityIdMap().Add(SyncedEntity.GetId(), SyncedRuntime.GetStaticEntityId());
        }
        return;
    }
    UFUNCTION()
    void Monitor_RemoveStaticToDynamicEntityIdMapItem(const FC_EcoCollectableSyncedRuntime &inout SyncedRuntime, const FECSEntity &inout SyncedEntity) const
    {
        if ((!(!((FECSEntityId(SyncedRuntime.GetStaticEntityId()) == ENTITY_ID_NULL)))))
        {
            return;
        }
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        Modify local_8;
        FCS_EcoCollectableDataCache& local_10 = local_8.opCall();
        if (local_10)
        {
            if (local_10.GetStatic2DynamicEntityIdMap().Contains(SyncedRuntime.GetStaticEntityId()))
            {
            }
            if (local_10.GetDynamic2StaticEntityIdMap().Contains(SyncedEntity.GetId()))
            {
                FECSEntityId local_1 = SyncedEntity.GetId();
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_CheckEcoCollectableLayoutInfo(const FECSEntity &inout CollectableNonSyncedEntity) const
    {
        Remove local_4;
        local_4.opCall();
        FString local_10;
        Get local_14;
        const FC_EcoCollectableLayoutInfo& local_16 = local_14.opCall();
        if (local_16)
        {
            local_10 = local_16.LayoutInfo.CheckForErrorsRuntime(CollectableNonSyncedEntity);
            if (local_10.IsEmpty())
            {
                return;
            }
        }
        else
        {
            FECSEntityId local_21;
            CollectableNonSyncedEntity.GetId();
            local_10 = FString().Append("Entity Id: [").Append(local_21).Append(local_21);
        }
        XError(ELog(30), local_10);
        FC_EcoCollectableLayoutInfoErrorServerTag local_28;
        Assign local_26;
        local_26.opCall(local_28);
        Remove local_32;
        local_32.opCall();
        return;
    }
    UFUNCTION()
    void ClientJob_CheckEcoCollectableLayoutInfo(const FECSEntity &inout CollectableNonSyncedEntity, const FC_EcoCollectableConfig &inout CollectableConfig, FC_EcoCollectableNonSyncedVisualStatus &inout CollectableNonSyncedVisualStatus, const FC_VisualComponentToggleConfig &inout VisualComponentToggleConfig) const
    {
        Remove local_4;
        local_4.opCall();
        FString local_10;
        Get local_14;
        const FC_EcoCollectableLayoutInfo& local_16 = local_14.opCall();
        if (local_16)
        {
            local_10 = local_16.LayoutInfo.CheckForErrorsRuntime(CollectableNonSyncedEntity);
            if (local_10.IsEmpty())
            {
                return;
            }
        }
        else
        {
            FECSEntityId local_21;
            CollectableNonSyncedEntity.GetId();
            local_10 = FString().Append("Entity Id: [").Append(local_21).Append(local_21);
        }
        XError(ELog(30), local_10);
        FC_EcoCollectableLayoutInfoErrorClientTag local_28;
        Assign local_26;
        local_26.opCall(local_28);
        Remove local_32;
        local_32.opCall();
        Remove local_36;
        local_36.opCall();
        Remove local_40;
        local_40.opCall();
        this.StopInteractTipDurationalFX(CollectableNonSyncedEntity, CollectableConfig, CollectableNonSyncedVisualStatus, VisualComponentToggleConfig, false);
        this.PlayInteractTipDurationalFX(CollectableNonSyncedEntity, CollectableConfig, CollectableNonSyncedVisualStatus, VisualComponentToggleConfig, true);
        this.StopEnvDurationalFX(CollectableNonSyncedEntity, CollectableConfig, CollectableNonSyncedVisualStatus, VisualComponentToggleConfig, false);
        return;
    }
    UFUNCTION()
    void ClientJob_InitView(const FECSEntity &inout CollectableNonSyncedEntity, const FC_EcoCollectableConfig &inout CollectableConfig, FC_EcoCollectableNonSyncedVisualStatus &inout CollectableNonSyncedVisualStatus, const FC_VisualComponentToggleConfig &inout VisualComponentToggleConfig) const
    {
        int local_24 = 0;
        FC_EcoCollectableNonSyncedVisualStatus local_30;
        int local_32;
        int local_33;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Get local_6;
        const FCS_EcoCollectableDataCache& local_8 = local_6.opCall();
        if (local_8)
        {
            bool local_9 = local_8.GetStatic2DynamicEntityIdMap().Contains(CollectableNonSyncedEntity.GetId());
            if (local_9)
            {
                if (FECSEntity(local_8.GetStatic2DynamicEntityIdMap()[CollectableNonSyncedEntity.GetId()]).IsValid())
                {
                    if (!(local_24))
                    {
                        local_9 = false;
                    }
                    else
                    {
                        local_9 = local_30;
                    }
                    if (local_9)
                    {
                        if (local_24.GetbReadyForCollect())
                        {
                            local_33 = 0;
                            local_32 = local_33;
                        }
                        else
                        {
                            local_33 = 1;
                            local_32 = local_33;
                        }
                        local_30.CollectReadyStatus = EEcoCollectableNonSyncedCollectReadyStatus(local_32);
                    }
                }
            }
        }
        this.StopInteractTipDurationalFX(CollectableNonSyncedEntity, CollectableConfig, CollectableNonSyncedVisualStatus, VisualComponentToggleConfig, false);
        bool local_34 = true;
        this.UpdateEcoCollectableNonSyncedVisibilityState(local_34, CollectableNonSyncedEntity, CollectableConfig, CollectableNonSyncedVisualStatus, VisualComponentToggleConfig);
        if (local_34)
        {
            Remove local_38;
            local_38.opCall();
        }
        return;
    }
    UFUNCTION()
    void ClientJob_InitEnv(const FECSEntity &inout CollectableNonSyncedEntity, const FC_EcoCollectableConfig &inout CollectableConfig, FC_EcoCollectableNonSyncedVisualStatus &inout CollectableNonSyncedVisualStatus, const FC_VisualComponentToggleConfig &inout VisualComponentToggleConfig) const
    {
        this.StopEnvDurationalFX(CollectableNonSyncedEntity, CollectableConfig, CollectableNonSyncedVisualStatus, VisualComponentToggleConfig, true);
        bool local_2 = true;
        this.UpdateEcoCollectableTimeAndSpaceRelatedFXs(local_2, CollectableNonSyncedEntity, CollectableConfig, CollectableNonSyncedVisualStatus, VisualComponentToggleConfig);
        if (local_2)
        {
            Remove local_6;
            local_6.opCall();
        }
        return;
    }
    UFUNCTION()
    void MonitorClient_EcoCollectableSyncedStatesChanged(const FC_EcoCollectableSyncedRuntime &inout CollectableSyncedRuntime, const FECSEntity &inout SyncedEntity) const
    {
        FC_EcoCollectableNonSyncedVisualStatus local_16;
        int local_22 = 0;
        int local_24;
        int local_38 = 0;
        FECSEntity local_8 = FECSEntity(CollectableSyncedRuntime.GetStaticEntityId());
        if (!(local_8))
        {
            return;
        }
        if (!(local_16))
        {
            return;
        }
        if (!(local_22))
        {
            return;
        }
        if (CollectableSyncedRuntime.GetbReadyForCollect())
        {
            int local_25 = 0;
            local_24 = local_25;
        }
        else
        {
            int local_25_2 = 1;
            local_24 = local_25_2;
        }
        Has local_30;
        bool local_9 = local_30.opCall();
        if (local_9)
        {
            if (local_24 != int(local_16.CollectReadyStatus))
            {
                if (local_38)
                {
                    this.SetEcoCollectableEntityViewAccordingToCollectReadyStatus(local_8, local_22, local_16, EEcoCollectableNonSyncedCollectReadyStatus(local_24), local_38);
                }
            }
        }
        else
        {
            EEcoCollectableNonSyncedVisibilityStatus local_26;
            if (::EcoCollectableUtils::CalculateVisibilityState(local_8, local_26))
            {
                if (int(local_26) == 0)
                {
                    if (local_24 != int(local_16.CollectReadyStatus))
                    {
                        if (local_38)
                        {
                            bool local_39;
                            this.SetEcoCollectableEntityViewAccordingToCollectReadyStatus(local_8, local_22, local_16, EEcoCollectableNonSyncedCollectReadyStatus(local_24), local_38);
                            this.UpdateEcoCollectableTimeAndSpaceRelatedFXs(local_39, local_8, local_22, local_16, local_38);
                        }
                    }
                }
            }
        }
        local_16.CollectReadyStatus = EEcoCollectableNonSyncedCollectReadyStatus(local_24);
        return;
    }
    UFUNCTION()
    void ClientJob_RemoveManualInteractEffectTimer(const FC_EcoCollectableRemoveManualInteractTimer &inout Timer, const FCS_FixedTime &inout FixedTime, const FECSEntity &inout Entity) const
    {
        if (FFPTime(FixedTime.Time).opCmp(Timer.RemoveManualInteractTimer) >= 0)
        {
            ::FMaterialUtils::LocalOnlyRemoveChangeMaterialRequest(Entity, this.NAME_CollectShake, 1.2f, FSoftObjectPath());
            Remove local_18;
            local_18.opCall();
        }
        return;
    }
    UFUNCTION()
    void ClientJob_PlayEcoCollectSFX(const FCE_EcoCollectSFX &inout Event) const
    {
        int local_12 = 0;
        FECSEntity local_4 = Event.CollectableEntity;
        if (!(local_4.IsValid()))
        {
            return;
        }
        if (!(local_12) || local_12.CollectedSFXConfigs.IsEmpty())
        {
            return;
        }
        FECSEntity local_22 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
        for (auto& local_36 : local_12.CollectedSFXConfigs)
        {
            if (local_36.Event.IsNull())
            {
                continue;
            }
            if ((local_36.bOnlyLocalPlayer && !((local_22 == Event.Collector))))
            {
                continue;
            }
            FGameAudioUtils::PlayEventOnEmitter(local_36.Event, local_4, FLoadEventCallback(), EGameAudioEmitterPartType(0), false, false, false, FGameAudioUtils::GetCachedAudioWorld(), true);
        }
        return;
    }
    UFUNCTION()
    void ClientJob_TurnOffFruitDitherDynamicMaskedMaterialTimer(const FC_EcoCollectableTurnOffFruitDitherDynamicMaskedMaterialTimer &inout Timer, const FCS_FixedTime &inout FixedTime, const FECSEntity &inout Entity, const FC_EcoCollectableConfig &inout CollectableConfig, const FC_VisualComponentToggleConfig &inout VisualComponentToggleConfig) const
    {
        if (FFPTime(FixedTime.Time).opCmp(Timer.TurnOffDynamicMaskedMaterialTimer) >= 0)
        {
            if (Timer.bTargetMeshHiddenState)
            {
                this.SetEntitySceneCompHidden(Entity, VisualComponentToggleConfig, CollectableConfig.CollectedDitherLogicNames, true, true);
            }
            this.SetComponentsDynamicMaskedMaterial(Entity, CollectableConfig.CollectedDitherLogicNames, false);
            Remove local_10;
            local_10.opCall();
        }
        return;
    }
    UFUNCTION()
    void ClientJob_TurnOffEnvDitherExceptFruitDynamicMaskedMaterialTimer(const FC_EcoCollectableTurnOffEnvDitherExceptFruitDynamicMaskedMaterialTimer &inout Timer, const FCS_FixedTime &inout FixedTime, const FECSEntity &inout Entity, const FC_EcoCollectableConfig &inout CollectableConfig, const FC_VisualComponentToggleConfig &inout VisualComponentToggleConfig) const
    {
        if (FFPTime(FixedTime.Time).opCmp(Timer.TurnOffDynamicMaskedMaterialTimer) >= 0)
        {
            if (Timer.bTargetMeshHiddenState)
            {
                this.SetEntitySceneCompHidden(Entity, VisualComponentToggleConfig, CollectableConfig.EnvDitherLogicNamesExcludeFruit, true, true);
            }
            this.SetComponentsDynamicMaskedMaterial(Entity, CollectableConfig.EnvDitherLogicNamesExcludeFruit, false);
            Remove local_10;
            local_10.opCall();
        }
        return;
    }
    void UpdateEcoCollectableNonSyncedVisibilityState(bool &inout bSuccess, const FECSEntity &inout CollectableNonSyncedEntity, const FC_EcoCollectableConfig &inout CollectableConfig, FC_EcoCollectableNonSyncedVisualStatus &inout CollectableNonSyncedVisualStatus, const FC_VisualComponentToggleConfig &inout VisualComponentToggleConfig) const
    {
        EEcoCollectableNonSyncedVisibilityStatus local_1;
        bool local_2;
        Has local_10;
        bool local_11;
        if (::EcoCollectableUtils::CalculateVisibilityState(CollectableNonSyncedEntity, local_1))
        {
            if (int(local_1) != int(CollectableNonSyncedVisualStatus.VisibilityStatus))
            {
                local_2 = true;
            }
            else
            {
                local_11 = local_10.opCall();
                local_2 = local_11;
            }
            if (local_2)
            {
                if (int(local_1) == 0)
                {
                    this.SetComponentsDynamicMaskedMaterialOnForDuration_EnvDitherExceptFruit(CollectableNonSyncedEntity, CollectableConfig, VisualComponentToggleConfig, false, 5.0f);
                    this.SetHiddenOrDither(CollectableNonSyncedEntity, CollectableConfig, VisualComponentToggleConfig, CollectableConfig.EnvDitherLogicNamesExcludeFruit, this.NAME_EnvDitherExcludeFruit, false);
                    if (int(CollectableNonSyncedVisualStatus.CollectReadyStatus) == 0)
                    {
                        this.SetComponentsDynamicMaskedMaterialOnForDuration_Fruit(CollectableNonSyncedEntity, CollectableConfig, VisualComponentToggleConfig, false, 5.0f);
                        this.SetHiddenOrDither(CollectableNonSyncedEntity, CollectableConfig, VisualComponentToggleConfig, CollectableConfig.CollectedDitherLogicNames, this.NAME_FruitDither, false);
                        this.PlayFX(CollectableNonSyncedEntity, CollectableConfig.InteractTipInstantFXs);
                        this.PlayInteractTipDurationalFX(CollectableNonSyncedEntity, CollectableConfig, CollectableNonSyncedVisualStatus, VisualComponentToggleConfig, true);
                    }
                    else
                    {
                        local_2 = local_10.opCall();
                        if (local_2)
                        {
                            this.SetComponentsDynamicMaskedMaterialOnForDuration_Fruit(CollectableNonSyncedEntity, CollectableConfig, VisualComponentToggleConfig, true, 5.0f);
                            this.SetHiddenOrDither(CollectableNonSyncedEntity, CollectableConfig, VisualComponentToggleConfig, CollectableConfig.CollectedDitherLogicNames, this.NAME_FruitDither, true);
                            this.StopInteractTipDurationalFX(CollectableNonSyncedEntity, CollectableConfig, CollectableNonSyncedVisualStatus, VisualComponentToggleConfig, true);
                        }
                    }
                }
                else
                {
                    if (int(local_1) == 1)
                    {
                        this.SetComponentsDynamicMaskedMaterialOnForDuration_EnvDitherExceptFruit(CollectableNonSyncedEntity, CollectableConfig, VisualComponentToggleConfig, true, 5.0f);
                        this.SetHiddenOrDither(CollectableNonSyncedEntity, CollectableConfig, VisualComponentToggleConfig, CollectableConfig.EnvDitherLogicNamesExcludeFruit, this.NAME_EnvDitherExcludeFruit, true);
                        if (int(CollectableNonSyncedVisualStatus.CollectReadyStatus) == 0)
                        {
                            local_11 = true;
                        }
                        else
                        {
                            local_11 = local_10.opCall();
                        }
                        if (local_11)
                        {
                            this.SetComponentsDynamicMaskedMaterialOnForDuration_Fruit(CollectableNonSyncedEntity, CollectableConfig, VisualComponentToggleConfig, true, 5.0f);
                            this.SetHiddenOrDither(CollectableNonSyncedEntity, CollectableConfig, VisualComponentToggleConfig, CollectableConfig.CollectedDitherLogicNames, this.NAME_FruitDither, true);
                            this.StopInteractTipDurationalFX(CollectableNonSyncedEntity, CollectableConfig, CollectableNonSyncedVisualStatus, VisualComponentToggleConfig, true);
                        }
                    }
                }
                CollectableNonSyncedVisualStatus.VisibilityStatus = EEcoCollectableNonSyncedVisibilityStatus(local_1);
            }
            CollectableNonSyncedVisualStatus.bVisibilityStatusCacheValid = true;
            bSuccess = true;
            return;
        }
        bSuccess = false;
        return;
    }
    UFUNCTION()
    void Job_UpdateEcoCollectablePresentation(const FECSEntity &inout CollectableNonSyncedEntity, FC_EcoCollectableNonSyncedVisualStatus &inout VisualStatus) const
    {
        VisualStatus.bSpawnRatioCacheValid = false;
        VisualStatus.bVisibilityStatusCacheValid = false;
        FC_EcoCollectableIncrementalUpdateTag local_8;
        Assign local_6;
        local_6.opCall(local_8);
        return;
    }
    UFUNCTION()
    void ClientJob_IncrementalUpdateEcoCollectablePresentation(const FECSEntity &inout CollectableNonSyncedEntity, const FC_EcoCollectableConfig &inout CollectableConfig, FC_EcoCollectableNonSyncedVisualStatus &inout CollectableNonSyncedVisualStatus, const FC_VisualComponentToggleConfig &inout VisualComponentToggleConfig) const
    {
        bool local_1;
        this.UpdateEcoCollectableNonSyncedVisibilityState(local_1, CollectableNonSyncedEntity, CollectableConfig, CollectableNonSyncedVisualStatus, VisualComponentToggleConfig);
        this.UpdateEcoCollectableTimeAndSpaceRelatedFXs(local_1, CollectableNonSyncedEntity, CollectableConfig, CollectableNonSyncedVisualStatus, VisualComponentToggleConfig);
        Remove local_6;
        local_6.opCall();
        return;
    }
    void UpdateEcoCollectableTimeAndSpaceRelatedFXs(bool &inout bSuccess, const FECSEntity &inout CollectableNonSyncedEntity, const FC_EcoCollectableConfig &inout CollectableConfig, FC_EcoCollectableNonSyncedVisualStatus &inout CollectableNonSyncedVisualStatus, const FC_VisualComponentToggleConfig &inout VisualComponentToggleConfig) const
    {
        int local_55;
        int local_56;
        int local_57;
        int local_64 = 0;
        int local_78 = 0;
        int local_96 = 0;
        bool local_97;
        bool local_113;
        bool local_114;
        FName local_4 = ::EcoCollectableUtils::GetWeatherName(CollectableNonSyncedEntity);
        if ((local_4 == NAME_None))
        {
            bool local_5;
            local_5 = false;
            bSuccess = local_5;
            return;
        }
        TDataObjectPtr<FWeatherConfig> local_30 = ::FWeatherUtils::GetWeatherConfig(local_4);
        int local_59 = ::FTimeOfDayUtils::GetCurrentTimeOfDayInSeconds();
        ::FTimeOfDayUtils::GetTimeOfDayHourAndMinute(local_59, local_55, local_56, local_57);
        int local_58 = ::FEcologySceneInfoUtils::CombineDayTime(local_56, local_57);
        FECSWorldPtr local_62 = ECS::GetECSWorld();
        FGameplayTagContainer local_76;
        if (local_64)
        {
            if (local_64.DataCache.TimeGameplayTags.Contains(local_58))
            {
                local_76 = local_64.DataCache.TimeGameplayTags[local_58];
            }
        }
        if (int(CollectableNonSyncedVisualStatus.VisibilityStatus) == 1)
        {
            this.StopEnvDurationalFX(CollectableNonSyncedEntity, CollectableConfig, CollectableNonSyncedVisualStatus, VisualComponentToggleConfig, true);
        }
        else
        {
            bool local_5;
            bool local_89;
            FECSEntity local_88 = FECSEntity(::EcoCollectableUtils::GetCurrespondingDynamicEntityIdOfStatic(CollectableNonSyncedEntity.GetId()));
            local_89 = true;
            if (local_88.IsValid())
            {
                local_89 = local_96 && local_96.GetbReadyForCollect();
            }
            for (auto& local_112 : CollectableConfig.EnvInstantFXs)
            {
                local_113 = true;
                local_78 = local_112.WeatherElementTag.Num();
                if (local_78 != 0)
                {
                    if (!(local_30.IsSet()) || !(local_30.opArrow().WeatherElements.HasAll(local_112.WeatherElementTag)))
                    {
                        local_113 = false;
                    }
                }
                local_114 = true;
                if (local_112.DaySegmentsTag.Num() != 0)
                {
                    if (!(local_76.HasAll(local_112.DaySegmentsTag)))
                    {
                        local_114 = false;
                    }
                }
                local_5 = !(local_112.bOnlyWhenReadyToCollect) || local_89;
                local_97 = local_113 && local_114;
                if (local_97 && local_5)
                {
                    TArray<FPlayFXCallParam> local_120;
                    local_120.Add(local_112.FXParams);
                    this.PlayFX(CollectableNonSyncedEntity, local_120);
                }
            }
            int local_121 = 0;
            while (local_121 < local_78)
            {
                const FTimeAndSpaceRelatedDurationalFXConfig& local_124 = CollectableConfig.EnvDurationalFXs[local_121];
                local_5 = true;
                if (local_124.WeatherElementTag.Num() != 0)
                {
                    if (!(local_30.IsSet()) || !(local_30.opArrow().WeatherElements.HasAll(local_124.WeatherElementTag)))
                    {
                        local_5 = false;
                    }
                }
                local_113 = true;
                if (local_124.DaySegmentsTag.Num() != 0)
                {
                    if (!(local_76.HasAll(local_124.DaySegmentsTag)))
                    {
                        local_113 = false;
                    }
                }
                bool local_115 = !(local_124.bOnlyWhenReadyToCollect) || local_89;
                local_97 = local_5 && local_113;
                if (local_97 && local_115)
                {
                    this.PlayEnvDurationalFX(CollectableNonSyncedEntity, CollectableConfig, CollectableNonSyncedVisualStatus, VisualComponentToggleConfig, local_121);
                }
                else
                {
                    this.StopEnvDurationalFX(CollectableNonSyncedEntity, CollectableConfig, CollectableNonSyncedVisualStatus, VisualComponentToggleConfig, true);
                }
                ++local_121;
            }
        }
        local_114 = true;
        bSuccess = local_114;
        return;
    }
    UFUNCTION()
    void ServerJob_EcoCollectableRecoverAfterCollected(FC_EcoCollectableSyncedRuntime &inout SyncedRuntime, const FCS_FixedTime &inout FixedTime) const
    {
        if (FFPTime(FixedTime.Time).opCmp(SyncedRuntime.GetRecoverCDTargetTime()) < 0)
        {
            return;
        }
        if (!(SyncedRuntime.GetbReadyForCollect()))
        {
            SyncedRuntime.SetbReadyForCollect(true);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_InitEcoCollectableSpawner(const FC_PrefabLoaded &inout PrefabLoaded, FC_EcoCollectableSpawnerRuntime &inout SpawnerRuntime) const
    {
        AECSPrefab local_2;
        AEcoCollectableSpawner local_6 = (Cast<AEcoCollectableSpawner>(local_2));
        if (local_6 != nullptr)
        {
            if (local_6.BakedDataArray.IsEmpty())
            {
                return;
            }
            int local_11 = FMath::RandRange(0, (local_6.BakedDataArray.Num() - 1));
            for (auto& local_26 : local_6.EcoCollectableCreatureAndCountRanges)
            {
                if (local_26.EcoCollectableCreatureDef.IsSet())
                {
                    SpawnerRuntime.CreatureDefToCountMap.Add(local_26.EcoCollectableCreatureDef, FMath::RandRange(int(local_26.MinCount), int(local_26.MaxCount)));
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_InitEcoCollectableLayoutInfo(const FECSEntity &inout Entity, FC_EcoCollectableLayoutInfo &inout LayoutInfoComp) const
    {
        FConfigGUID local_2 = LayoutInfoComp.LayoutInfo.SpawnerGUID;
        FECSEntityId local_5 = ::EcologyConfigUtils::FindConfigByUUID(local_2, ECS::GetECSWorld());
        if ((!((local_5 == ENTITY_ID_NULL))))
        {
            FECSEntity local_16 = FECSEntity(local_5);
            Get local_20;
            const FC_EcoCollectableSpawnerRuntime& local_22 = local_20.opCall();
            if (local_22)
            {
                if (LayoutInfoComp.LayoutInfo.ResourcePointIndex >= 0 && (LayoutInfoComp.LayoutInfo.ResourcePointIndex < local_22.BakedData.GetPointBakedData().Num()))
                {
                    LayoutInfoComp.LayoutInfo.BakedOrderIndex = local_22.BakedData.GetPointBakedData()[LayoutInfoComp.LayoutInfo.ResourcePointIndex].GetBakedOrderIndex();
                    LayoutInfoComp.CachedSpawnerEntityId = local_5;
                    Remove local_30;
                    local_30.opCall();
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_InitEcoCollectableLayoutInfo(const FECSEntity &inout Entity, FC_EcoCollectableLayoutInfo &inout LayoutInfoComp) const
    {
        FConfigGUID local_2 = LayoutInfoComp.LayoutInfo.SpawnerGUID;
        FECSEntityId local_5 = ::EcologyConfigUtils::FindConfigByUUID(local_2, ECS::GetECSWorld());
        if ((!((local_5 == ENTITY_ID_NULL))))
        {
            FECSEntity local_16 = FECSEntity(local_5);
            Get local_20;
            const FC_EcoCollectableSpawnerRuntime& local_22 = local_20.opCall();
            if (local_22)
            {
                if (LayoutInfoComp.LayoutInfo.ResourcePointIndex >= 0 && (LayoutInfoComp.LayoutInfo.ResourcePointIndex < local_22.BakedData.GetPointBakedData().Num()))
                {
                    LayoutInfoComp.LayoutInfo.BakedOrderIndex = local_22.BakedData.GetPointBakedData()[LayoutInfoComp.LayoutInfo.ResourcePointIndex].GetBakedOrderIndex();
                    LayoutInfoComp.CachedSpawnerEntityId = local_5;
                    Remove local_30;
                    local_30.opCall();
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_HandleTimeSegmentChanged(const FCE_EcologyTimeSegmentsChangedEvent &inout Event) const
    {
        this.Run_Job_UpdateEcoCollectablePresentation();
        return;
    }
    UFUNCTION()
    void ClientJob_HandleWeatherChanged(const FCE_RegionWeatherChanged &inout Event) const
    {
        this.Run_Job_UpdateEcoCollectablePresentation();
        return;
    }
    UFUNCTION()
    void Monitor_ViewportSelectTarget(const FECSEntity &inout CollectableNonSyncedEntity, const FC_ViewEntityManager &inout ViewEntityManager) const
    {
        int local_36 = 0;
        Get local_4;
        const FC_EcoCollectableConfig& local_6 = local_4.opCall();
        if (local_6)
        {
            Modify local_12;
            FC_EcoCollectableNonSyncedVisualStatus& local_14 = local_12.opCall();
            if (local_14)
            {
                local_14.bVisibilityStatusCacheValid = false;
                local_14.bSpawnRatioCacheValid = false;
            }
            Has local_18;
            if (!(local_18.opCall()))
            {
                FC_EcoCollectableNonSyncedPendingEnvInitTag local_24;
                Assign local_22;
                local_22.opCall(local_24);
                FC_EcoCollectableNonSyncedPendingViewInitTag local_30;
                Assign local_28;
                local_28.opCall(local_30);
                return;
            }
            if (!(local_14))
            {
                return;
            }
            if (!(local_36))
            {
                return;
            }
            this.StopInteractTipDurationalFX(CollectableNonSyncedEntity, local_6, local_14, local_36, false);
            this.PlayInteractTipDurationalFX(CollectableNonSyncedEntity, local_6, local_14, local_36, true);
            this.StopEnvDurationalFX(CollectableNonSyncedEntity, local_6, local_14, local_36, false);
            this.SetEcoCollectableEntityViewAccordingToCollectReadyStatus(CollectableNonSyncedEntity, local_6, local_14, local_14.CollectReadyStatus, local_36);
        }
        return;
    }
    UFUNCTION()
    void ClientJob_ReInitCollectableState(const FECSEntity &inout Entity, const FCS_NetReceiveSnapshot &inout NetReceiveSnapshot) const
    {
        FVisualComponentToggleUtils::ResetVisualComponentToggleState(Entity);
        Modify local_4;
        FC_EcoCollectableNonSyncedVisualStatus& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.VisibilityStatus = EEcoCollectableNonSyncedVisibilityStatus(0);
            local_6.bVisibilityStatusCacheValid = false;
            local_6.CollectReadyStatus = EEcoCollectableNonSyncedCollectReadyStatus(0);
            local_6.bSpawnRatioCacheValid = false;
        }
        FC_EcoCollectableNonSyncedPendingEnvInitTag local_16;
        Assign local_14;
        local_14.opCall(local_16);
        FC_EcoCollectableNonSyncedPendingViewInitTag local_22;
        Assign local_20;
        local_20.opCall(local_22);
        FC_EcoCollectablePendingInitSpawnerInfoTag local_28;
        Assign local_26;
        local_26.opCall(local_28);
        Remove local_32;
        local_32.opCall();
        FC_EcoCollectableLayoutInfoPendingCheckErrorClientTag local_38;
        Assign local_36;
        local_36.opCall(local_38);
        return;
    }
    UFUNCTION()
    void ClientJob_ForceCheckRefreshAllEcoCollectableState(const FECSEntity &inout CollectableNonSyncedEntity, FC_EcoCollectableNonSyncedVisualStatus &inout CollectableNonSyncedVisualStatus, const FC_EcoCollectableConfig &inout Config, const FC_VisualComponentToggleConfig &inout VisualComponentToggleConfig) const
    {
        EEcoCollectableNonSyncedVisibilityStatus local_1;
        if (::EcoCollectableUtils::CalculateVisibilityState(CollectableNonSyncedEntity, local_1))
        {
            if (int(local_1) != int(CollectableNonSyncedVisualStatus.VisibilityStatus))
            {
                bool local_13;
                CollectableNonSyncedEntity.GetId();
                FECSEntityId local_11;
                XError(ELog(30), FString().Append("[TEMP] ForceCheckRefreshAllEcoCollectableState: ").Append(local_11));
                this.UpdateEcoCollectableNonSyncedVisibilityState(local_13, CollectableNonSyncedEntity, Config, CollectableNonSyncedVisualStatus, VisualComponentToggleConfig);
                this.UpdateEcoCollectableTimeAndSpaceRelatedFXs(local_13, CollectableNonSyncedEntity, Config, CollectableNonSyncedVisualStatus, VisualComponentToggleConfig);
            }
        }
        return;
    }
    UFUNCTION()
    void Run_Job_InitEcoCollectableDataCache() const
    {
        ECS::GetContextJob();
        this.Job_InitEcoCollectableDataCache();
        return;
    }
    UFUNCTION()
    void Run_Monitor_RegisterStaticToDynamicEntityIdMapItem() const
    {
        int local_50 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorEcoCollectableSyncedRuntimeOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_48 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_RegisterStaticToDynamicEntityIdMapItem(local_50, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_RemoveStaticToDynamicEntityIdMapItem() const
    {
        int local_50 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorEcoCollectableSyncedRuntimeOnRemoveView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_48 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_RemoveStaticToDynamicEntityIdMapItem(local_50, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_CheckEcoCollectableLayoutInfo_StaticReg() const
    {
        const FECSEntity& local_38;
        int local_166 = 0;
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
                this.ServerJob_CheckEcoCollectableLayoutInfo(local_38);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_76 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_80;
        local_80.opCall();
        Include local_84;
        local_84.opCall();
        Exclude(local_76).opCall();
        Exclude(local_76).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_76.Iterator();
        for (; local_128.CanProceed;)
        {
            local_38 = local_128.Proceed();
            ++local_94;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.ServerJob_CheckEcoCollectableLayoutInfo(local_166);
        }
        local_4.UpdateCachedEntityCount(local_94);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_CheckEcoCollectableLayoutInfo_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_166 = 0;
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
                this.ServerJob_CheckEcoCollectableLayoutInfo(local_38);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_76 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_80;
        local_80.opCall();
        Include local_84;
        local_84.opCall();
        Exclude(local_76).opCall();
        Exclude(local_76).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_76.Iterator();
        for (; local_128.CanProceed;)
        {
            local_38 = local_128.Proceed();
            ++local_94;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.ServerJob_CheckEcoCollectableLayoutInfo(local_166);
        }
        local_4.UpdateCachedEntityCount(local_94);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_CheckEcoCollectableLayoutInfo_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_166 = 0;
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
                this.ServerJob_CheckEcoCollectableLayoutInfo(local_38);
            }
            local_4.UpdateCachedEntityCount(local_15);
            return;
        }
        FECSRuntimeView local_76 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_80;
        local_80.opCall();
        Include local_84;
        local_84.opCall();
        Exclude(local_76).opCall();
        Exclude(local_76).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_76.Iterator();
        for (; local_128.CanProceed;)
        {
            local_38 = local_128.Proceed();
            ++local_94;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.ServerJob_CheckEcoCollectableLayoutInfo(local_166);
        }
        local_4.UpdateCachedEntityCount(local_94);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_CheckEcoCollectableLayoutInfo_StaticReg() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_50 = 0;
        MarkModifiedIfDirty local_58;
        int local_194 = 0;
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
                this.ClientJob_CheckEcoCollectableLayoutInfo(local_36, local_38, local_44, local_50);
                local_58.opCall(local_44);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_96 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Exclude(local_96).opCall();
        Exclude(local_96).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_122 = 0;
        FECSRuntimeViewIterator local_156 = local_96.Iterator();
        for (; local_156.CanProceed;)
        {
            local_36 = local_156.Proceed();
            ++local_122;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_CheckEcoCollectableLayoutInfo(local_194, local_38, local_44, local_50);
            local_58.opCall(local_44);
        }
        local_2.UpdateCachedEntityCount(local_122);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_CheckEcoCollectableLayoutInfo_LocalReg() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_50 = 0;
        MarkModifiedIfDirty local_58;
        int local_194 = 0;
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
                this.ClientJob_CheckEcoCollectableLayoutInfo(local_36, local_38, local_44, local_50);
                local_58.opCall(local_44);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_96 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Exclude(local_96).opCall();
        Exclude(local_96).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_122 = 0;
        FECSRuntimeViewIterator local_156 = local_96.Iterator();
        for (; local_156.CanProceed;)
        {
            local_36 = local_156.Proceed();
            ++local_122;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_CheckEcoCollectableLayoutInfo(local_194, local_38, local_44, local_50);
            local_58.opCall(local_44);
        }
        local_2.UpdateCachedEntityCount(local_122);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_CheckEcoCollectableLayoutInfo_DefaultReg() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_50 = 0;
        MarkModifiedIfDirty local_58;
        int local_194 = 0;
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
                this.ClientJob_CheckEcoCollectableLayoutInfo(local_36, local_38, local_44, local_50);
                local_58.opCall(local_44);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_96 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Exclude(local_96).opCall();
        Exclude(local_96).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_122 = 0;
        FECSRuntimeViewIterator local_156 = local_96.Iterator();
        for (; local_156.CanProceed;)
        {
            local_36 = local_156.Proceed();
            ++local_122;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_CheckEcoCollectableLayoutInfo(local_194, local_38, local_44, local_50);
            local_58.opCall(local_44);
        }
        local_2.UpdateCachedEntityCount(local_122);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_InitView_StaticReg() const
    {
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        MarkModifiedIfDirty local_68;
        int local_210 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 1;
        int local_3 = local_4;
        int local_13 = FMath::Max(1, ECS::FlatTimeToFrame(FFPTime(1.0)));
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_16 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_20 = local_2.GetViewCacheEntities();
            int local_21 = 0;
            for (auto& local_36 : local_20)
            {
                local_36;
                FECSEntity local_40;
                if (!(local_40.IsValid()))
                {
                    continue;
                }
                ++local_21;
                FECSEntityScopeCycleCounter local_41 = FECSEntityScopeCycleCounter(local_40);
                if (!(this.GetECSRuntime().IsOnPerEntityInterval(FFPTime(1.0), local_40.GetId(), local_13)))
                {
                    continue;
                }
                this.ClientJob_InitView(local_46, local_48, local_54, local_60);
                local_68.opCall(local_54);
            }
            local_2.UpdateCachedEntityCount(local_21);
            return;
        }
        FECSRuntimeView local_106 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Include local_126;
        local_126.opCall();
        Include local_130;
        local_130.opCall();
        Exclude(local_106).opCall();
        Exclude(local_106).opCall();
        bool local_14 = local_2.BeginViewCacheBuild();
        int local_12 = local_2.GetViewCacheEpoch();
        int local_140 = 0;
        FECSRuntimeViewIterator local_174 = local_106.Iterator();
        for (; local_174.CanProceed;)
        {
            local_46 = local_174.Proceed();
            ++local_140;
            if (local_14)
            {
                local_2.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_41_2 = FECSEntityScopeCycleCounter(local_46);
            if (!(this.GetECSRuntime().IsOnPerEntityInterval(FFPTime(1.0), local_46.GetId(), local_13)))
            {
                continue;
            }
            this.ClientJob_InitView(local_210, local_48, local_54, local_60);
            local_68.opCall(local_54);
        }
        local_2.UpdateCachedEntityCount(local_140);
        if (local_14)
        {
            local_2.CommitViewCacheBuild(local_12);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_InitView_LocalReg() const
    {
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        MarkModifiedIfDirty local_68;
        int local_210 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 2;
        int local_3 = local_4;
        int local_13 = FMath::Max(1, ECS::FlatTimeToFrame(FFPTime(1.0)));
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_16 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_20 = local_2.GetViewCacheEntities();
            int local_21 = 0;
            for (auto& local_36 : local_20)
            {
                local_36;
                FECSEntity local_40;
                if (!(local_40.IsValid()))
                {
                    continue;
                }
                ++local_21;
                FECSEntityScopeCycleCounter local_41 = FECSEntityScopeCycleCounter(local_40);
                if (!(this.GetECSRuntime().IsOnPerEntityInterval(FFPTime(1.0), local_40.GetId(), local_13)))
                {
                    continue;
                }
                this.ClientJob_InitView(local_46, local_48, local_54, local_60);
                local_68.opCall(local_54);
            }
            local_2.UpdateCachedEntityCount(local_21);
            return;
        }
        FECSRuntimeView local_106 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Include local_126;
        local_126.opCall();
        Include local_130;
        local_130.opCall();
        Exclude(local_106).opCall();
        Exclude(local_106).opCall();
        bool local_14 = local_2.BeginViewCacheBuild();
        int local_12 = local_2.GetViewCacheEpoch();
        int local_140 = 0;
        FECSRuntimeViewIterator local_174 = local_106.Iterator();
        for (; local_174.CanProceed;)
        {
            local_46 = local_174.Proceed();
            ++local_140;
            if (local_14)
            {
                local_2.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_41_2 = FECSEntityScopeCycleCounter(local_46);
            if (!(this.GetECSRuntime().IsOnPerEntityInterval(FFPTime(1.0), local_46.GetId(), local_13)))
            {
                continue;
            }
            this.ClientJob_InitView(local_210, local_48, local_54, local_60);
            local_68.opCall(local_54);
        }
        local_2.UpdateCachedEntityCount(local_140);
        if (local_14)
        {
            local_2.CommitViewCacheBuild(local_12);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_InitView_DefaultReg() const
    {
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        MarkModifiedIfDirty local_68;
        int local_210 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        int local_13 = FMath::Max(1, ECS::FlatTimeToFrame(FFPTime(1.0)));
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_16 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_20 = local_2.GetViewCacheEntities();
            int local_21 = 0;
            for (auto& local_36 : local_20)
            {
                local_36;
                FECSEntity local_40;
                if (!(local_40.IsValid()))
                {
                    continue;
                }
                ++local_21;
                FECSEntityScopeCycleCounter local_41 = FECSEntityScopeCycleCounter(local_40);
                if (!(this.GetECSRuntime().IsOnPerEntityInterval(FFPTime(1.0), local_40.GetId(), local_13)))
                {
                    continue;
                }
                this.ClientJob_InitView(local_46, local_48, local_54, local_60);
                local_68.opCall(local_54);
            }
            local_2.UpdateCachedEntityCount(local_21);
            return;
        }
        FECSRuntimeView local_106 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Include local_126;
        local_126.opCall();
        Include local_130;
        local_130.opCall();
        Exclude(local_106).opCall();
        Exclude(local_106).opCall();
        bool local_14 = local_2.BeginViewCacheBuild();
        int local_12 = local_2.GetViewCacheEpoch();
        int local_140 = 0;
        FECSRuntimeViewIterator local_174 = local_106.Iterator();
        for (; local_174.CanProceed;)
        {
            local_46 = local_174.Proceed();
            ++local_140;
            if (local_14)
            {
                local_2.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_41_2 = FECSEntityScopeCycleCounter(local_46);
            if (!(this.GetECSRuntime().IsOnPerEntityInterval(FFPTime(1.0), local_46.GetId(), local_13)))
            {
                continue;
            }
            this.ClientJob_InitView(local_210, local_48, local_54, local_60);
            local_68.opCall(local_54);
        }
        local_2.UpdateCachedEntityCount(local_140);
        if (local_14)
        {
            local_2.CommitViewCacheBuild(local_12);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_InitEnv_StaticReg() const
    {
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        MarkModifiedIfDirty local_68;
        int local_210 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 1;
        int local_3 = local_4;
        int local_13 = FMath::Max(1, ECS::FlatTimeToFrame(FFPTime(1.0)));
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_16 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_20 = local_2.GetViewCacheEntities();
            int local_21 = 0;
            for (auto& local_36 : local_20)
            {
                local_36;
                FECSEntity local_40;
                if (!(local_40.IsValid()))
                {
                    continue;
                }
                ++local_21;
                FECSEntityScopeCycleCounter local_41 = FECSEntityScopeCycleCounter(local_40);
                if (!(this.GetECSRuntime().IsOnPerEntityInterval(FFPTime(1.0), local_40.GetId(), local_13)))
                {
                    continue;
                }
                this.ClientJob_InitEnv(local_46, local_48, local_54, local_60);
                local_68.opCall(local_54);
            }
            local_2.UpdateCachedEntityCount(local_21);
            return;
        }
        FECSRuntimeView local_106 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Include local_126;
        local_126.opCall();
        Include local_130;
        local_130.opCall();
        Exclude(local_106).opCall();
        Exclude(local_106).opCall();
        bool local_14 = local_2.BeginViewCacheBuild();
        int local_12 = local_2.GetViewCacheEpoch();
        int local_140 = 0;
        FECSRuntimeViewIterator local_174 = local_106.Iterator();
        for (; local_174.CanProceed;)
        {
            local_46 = local_174.Proceed();
            ++local_140;
            if (local_14)
            {
                local_2.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_41_2 = FECSEntityScopeCycleCounter(local_46);
            if (!(this.GetECSRuntime().IsOnPerEntityInterval(FFPTime(1.0), local_46.GetId(), local_13)))
            {
                continue;
            }
            this.ClientJob_InitEnv(local_210, local_48, local_54, local_60);
            local_68.opCall(local_54);
        }
        local_2.UpdateCachedEntityCount(local_140);
        if (local_14)
        {
            local_2.CommitViewCacheBuild(local_12);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_InitEnv_LocalReg() const
    {
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        MarkModifiedIfDirty local_68;
        int local_210 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 2;
        int local_3 = local_4;
        int local_13 = FMath::Max(1, ECS::FlatTimeToFrame(FFPTime(1.0)));
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_16 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_20 = local_2.GetViewCacheEntities();
            int local_21 = 0;
            for (auto& local_36 : local_20)
            {
                local_36;
                FECSEntity local_40;
                if (!(local_40.IsValid()))
                {
                    continue;
                }
                ++local_21;
                FECSEntityScopeCycleCounter local_41 = FECSEntityScopeCycleCounter(local_40);
                if (!(this.GetECSRuntime().IsOnPerEntityInterval(FFPTime(1.0), local_40.GetId(), local_13)))
                {
                    continue;
                }
                this.ClientJob_InitEnv(local_46, local_48, local_54, local_60);
                local_68.opCall(local_54);
            }
            local_2.UpdateCachedEntityCount(local_21);
            return;
        }
        FECSRuntimeView local_106 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Include local_126;
        local_126.opCall();
        Include local_130;
        local_130.opCall();
        Exclude(local_106).opCall();
        Exclude(local_106).opCall();
        bool local_14 = local_2.BeginViewCacheBuild();
        int local_12 = local_2.GetViewCacheEpoch();
        int local_140 = 0;
        FECSRuntimeViewIterator local_174 = local_106.Iterator();
        for (; local_174.CanProceed;)
        {
            local_46 = local_174.Proceed();
            ++local_140;
            if (local_14)
            {
                local_2.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_41_2 = FECSEntityScopeCycleCounter(local_46);
            if (!(this.GetECSRuntime().IsOnPerEntityInterval(FFPTime(1.0), local_46.GetId(), local_13)))
            {
                continue;
            }
            this.ClientJob_InitEnv(local_210, local_48, local_54, local_60);
            local_68.opCall(local_54);
        }
        local_2.UpdateCachedEntityCount(local_140);
        if (local_14)
        {
            local_2.CommitViewCacheBuild(local_12);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_InitEnv_DefaultReg() const
    {
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        MarkModifiedIfDirty local_68;
        int local_210 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        int local_13 = FMath::Max(1, ECS::FlatTimeToFrame(FFPTime(1.0)));
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_16 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_20 = local_2.GetViewCacheEntities();
            int local_21 = 0;
            for (auto& local_36 : local_20)
            {
                local_36;
                FECSEntity local_40;
                if (!(local_40.IsValid()))
                {
                    continue;
                }
                ++local_21;
                FECSEntityScopeCycleCounter local_41 = FECSEntityScopeCycleCounter(local_40);
                if (!(this.GetECSRuntime().IsOnPerEntityInterval(FFPTime(1.0), local_40.GetId(), local_13)))
                {
                    continue;
                }
                this.ClientJob_InitEnv(local_46, local_48, local_54, local_60);
                local_68.opCall(local_54);
            }
            local_2.UpdateCachedEntityCount(local_21);
            return;
        }
        FECSRuntimeView local_106 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Include local_126;
        local_126.opCall();
        Include local_130;
        local_130.opCall();
        Exclude(local_106).opCall();
        Exclude(local_106).opCall();
        bool local_14 = local_2.BeginViewCacheBuild();
        int local_12 = local_2.GetViewCacheEpoch();
        int local_140 = 0;
        FECSRuntimeViewIterator local_174 = local_106.Iterator();
        for (; local_174.CanProceed;)
        {
            local_46 = local_174.Proceed();
            ++local_140;
            if (local_14)
            {
                local_2.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_41_2 = FECSEntityScopeCycleCounter(local_46);
            if (!(this.GetECSRuntime().IsOnPerEntityInterval(FFPTime(1.0), local_46.GetId(), local_13)))
            {
                continue;
            }
            this.ClientJob_InitEnv(local_210, local_48, local_54, local_60);
            local_68.opCall(local_54);
        }
        local_2.UpdateCachedEntityCount(local_140);
        if (local_14)
        {
            local_2.CommitViewCacheBuild(local_12);
        }
        return;
    }
    UFUNCTION()
    void Run_MonitorClient_EcoCollectableSyncedStatesChanged() const
    {
        int local_50 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorEcoCollectableSyncedRuntimeOnModifyView(EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_48 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.MonitorClient_EcoCollectableSyncedStatesChanged(local_50, local_52);
        }
        FECSMonitorRuntimeView local_16 = this.GetECSWorld().__GetMonitorEcoCollectableSyncedRuntimeOnAssignView(EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_48_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.MonitorClient_EcoCollectableSyncedStatesChanged(local_50, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_RemoveManualInteractEffectTimer_StaticReg() const
    {
        int local_6 = 0;
        int local_40 = 0;
        const FECSEntity& local_46;
        int local_166 = 0;
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
                this.ClientJob_RemoveManualInteractEffectTimer(local_40, local_6, local_46);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Exclude(local_84).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_84.Iterator();
        for (; local_128.CanProceed;)
        {
            local_46 = local_128.Proceed();
            ++local_94;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_46);
            this.ClientJob_RemoveManualInteractEffectTimer(local_40, local_6, local_166);
        }
        local_4.UpdateCachedEntityCount(local_94);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_RemoveManualInteractEffectTimer_LocalReg() const
    {
        int local_6 = 0;
        int local_40 = 0;
        const FECSEntity& local_46;
        int local_166 = 0;
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
                this.ClientJob_RemoveManualInteractEffectTimer(local_40, local_6, local_46);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Exclude(local_84).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_84.Iterator();
        for (; local_128.CanProceed;)
        {
            local_46 = local_128.Proceed();
            ++local_94;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_46);
            this.ClientJob_RemoveManualInteractEffectTimer(local_40, local_6, local_166);
        }
        local_4.UpdateCachedEntityCount(local_94);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_RemoveManualInteractEffectTimer_DefaultReg() const
    {
        int local_6 = 0;
        int local_40 = 0;
        const FECSEntity& local_46;
        int local_166 = 0;
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
                this.ClientJob_RemoveManualInteractEffectTimer(local_40, local_6, local_46);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Exclude(local_84).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_84.Iterator();
        for (; local_128.CanProceed;)
        {
            local_46 = local_128.Proceed();
            ++local_94;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_46);
            this.ClientJob_RemoveManualInteractEffectTimer(local_40, local_6, local_166);
        }
        local_4.UpdateCachedEntityCount(local_94);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_PlayEcoCollectSFX() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EcoCollectSFX> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EcoCollectSFX& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_PlayEcoCollectSFX(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TurnOffFruitDitherDynamicMaskedMaterialTimer_StaticReg() const
    {
        int local_6 = 0;
        int local_40 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_54 = 0;
        int local_186 = 0;
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
                this.ClientJob_TurnOffFruitDitherDynamicMaskedMaterialTimer(local_40, local_6, local_46, local_48, local_54);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_96 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Exclude(local_96).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_114 = 0;
        FECSRuntimeViewIterator local_148 = local_96.Iterator();
        for (; local_148.CanProceed;)
        {
            local_46 = local_148.Proceed();
            ++local_114;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_46);
            this.ClientJob_TurnOffFruitDitherDynamicMaskedMaterialTimer(local_40, local_6, local_186, local_48, local_54);
        }
        local_4.UpdateCachedEntityCount(local_114);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TurnOffFruitDitherDynamicMaskedMaterialTimer_LocalReg() const
    {
        int local_6 = 0;
        int local_40 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_54 = 0;
        int local_186 = 0;
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
                this.ClientJob_TurnOffFruitDitherDynamicMaskedMaterialTimer(local_40, local_6, local_46, local_48, local_54);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_96 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Exclude(local_96).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_114 = 0;
        FECSRuntimeViewIterator local_148 = local_96.Iterator();
        for (; local_148.CanProceed;)
        {
            local_46 = local_148.Proceed();
            ++local_114;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_46);
            this.ClientJob_TurnOffFruitDitherDynamicMaskedMaterialTimer(local_40, local_6, local_186, local_48, local_54);
        }
        local_4.UpdateCachedEntityCount(local_114);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TurnOffFruitDitherDynamicMaskedMaterialTimer_DefaultReg() const
    {
        int local_6 = 0;
        int local_40 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_54 = 0;
        int local_186 = 0;
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
                this.ClientJob_TurnOffFruitDitherDynamicMaskedMaterialTimer(local_40, local_6, local_46, local_48, local_54);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_96 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Exclude(local_96).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_114 = 0;
        FECSRuntimeViewIterator local_148 = local_96.Iterator();
        for (; local_148.CanProceed;)
        {
            local_46 = local_148.Proceed();
            ++local_114;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_46);
            this.ClientJob_TurnOffFruitDitherDynamicMaskedMaterialTimer(local_40, local_6, local_186, local_48, local_54);
        }
        local_4.UpdateCachedEntityCount(local_114);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TurnOffEnvDitherExceptFruitDynamicMaskedMaterialTimer_StaticReg() const
    {
        int local_6 = 0;
        int local_40 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_54 = 0;
        int local_186 = 0;
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
                this.ClientJob_TurnOffEnvDitherExceptFruitDynamicMaskedMaterialTimer(local_40, local_6, local_46, local_48, local_54);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_96 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Exclude(local_96).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_114 = 0;
        FECSRuntimeViewIterator local_148 = local_96.Iterator();
        for (; local_148.CanProceed;)
        {
            local_46 = local_148.Proceed();
            ++local_114;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_46);
            this.ClientJob_TurnOffEnvDitherExceptFruitDynamicMaskedMaterialTimer(local_40, local_6, local_186, local_48, local_54);
        }
        local_4.UpdateCachedEntityCount(local_114);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TurnOffEnvDitherExceptFruitDynamicMaskedMaterialTimer_LocalReg() const
    {
        int local_6 = 0;
        int local_40 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_54 = 0;
        int local_186 = 0;
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
                this.ClientJob_TurnOffEnvDitherExceptFruitDynamicMaskedMaterialTimer(local_40, local_6, local_46, local_48, local_54);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_96 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Exclude(local_96).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_114 = 0;
        FECSRuntimeViewIterator local_148 = local_96.Iterator();
        for (; local_148.CanProceed;)
        {
            local_46 = local_148.Proceed();
            ++local_114;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_46);
            this.ClientJob_TurnOffEnvDitherExceptFruitDynamicMaskedMaterialTimer(local_40, local_6, local_186, local_48, local_54);
        }
        local_4.UpdateCachedEntityCount(local_114);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TurnOffEnvDitherExceptFruitDynamicMaskedMaterialTimer_DefaultReg() const
    {
        int local_6 = 0;
        int local_40 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_54 = 0;
        int local_186 = 0;
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
                this.ClientJob_TurnOffEnvDitherExceptFruitDynamicMaskedMaterialTimer(local_40, local_6, local_46, local_48, local_54);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_96 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Exclude(local_96).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_114 = 0;
        FECSRuntimeViewIterator local_148 = local_96.Iterator();
        for (; local_148.CanProceed;)
        {
            local_46 = local_148.Proceed();
            ++local_114;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_46);
            this.ClientJob_TurnOffEnvDitherExceptFruitDynamicMaskedMaterialTimer(local_40, local_6, local_186, local_48, local_54);
        }
        local_4.UpdateCachedEntityCount(local_114);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateEcoCollectablePresentation_StaticReg() const
    {
        int local_144 = 0;
        int local_146 = 0;
        FECSManualJobStatScope local_1 = FECSManualJobStatScope(FName("[AS][ManualJob]S_EcoCollectableScriptSystem::Job_UpdateEcoCollectablePresentation"));
        ECS::GetContextJob();
        int local_8 = 1;
        int local_7 = local_8;
        FECSRuntimeView local_48 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_52;
        local_52.opCall();
        Include local_56;
        local_56.opCall();
        Include local_60;
        local_60.opCall();
        Exclude(local_48).opCall();
        Exclude(local_48).opCall();
        FECSRuntimeViewIterator local_102 = local_48.Iterator();
        for (; local_102.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_141 = FECSEntityScopeCycleCounter(local_102.Proceed());
            this.Job_UpdateEcoCollectablePresentation(local_144, local_146);
            MarkModifiedIfDirty local_154;
            local_154.opCall(local_146);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateEcoCollectablePresentation_LocalReg() const
    {
        int local_144 = 0;
        int local_146 = 0;
        FECSManualJobStatScope local_1 = FECSManualJobStatScope(FName("[AS][ManualJob]S_EcoCollectableScriptSystem::Job_UpdateEcoCollectablePresentation"));
        ECS::GetContextJob();
        int local_8 = 2;
        int local_7 = local_8;
        FECSRuntimeView local_48 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_52;
        local_52.opCall();
        Include local_56;
        local_56.opCall();
        Include local_60;
        local_60.opCall();
        Exclude(local_48).opCall();
        Exclude(local_48).opCall();
        FECSRuntimeViewIterator local_102 = local_48.Iterator();
        for (; local_102.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_141 = FECSEntityScopeCycleCounter(local_102.Proceed());
            this.Job_UpdateEcoCollectablePresentation(local_144, local_146);
            MarkModifiedIfDirty local_154;
            local_154.opCall(local_146);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateEcoCollectablePresentation_DefaultReg() const
    {
        int local_144 = 0;
        int local_146 = 0;
        FECSManualJobStatScope local_1 = FECSManualJobStatScope(FName("[AS][ManualJob]S_EcoCollectableScriptSystem::Job_UpdateEcoCollectablePresentation"));
        ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        FECSRuntimeView local_48 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_52;
        local_52.opCall();
        Include local_56;
        local_56.opCall();
        Include local_60;
        local_60.opCall();
        Exclude(local_48).opCall();
        Exclude(local_48).opCall();
        FECSRuntimeViewIterator local_102 = local_48.Iterator();
        for (; local_102.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_141 = FECSEntityScopeCycleCounter(local_102.Proceed());
            this.Job_UpdateEcoCollectablePresentation(local_144, local_146);
            MarkModifiedIfDirty local_154;
            local_154.opCall(local_146);
        }
        return;
    }
    void Run_Job_UpdateEcoCollectablePresentation() const
    {
        this.Run_Job_UpdateEcoCollectablePresentation_StaticReg();
        this.Run_Job_UpdateEcoCollectablePresentation_LocalReg();
        this.Run_Job_UpdateEcoCollectablePresentation_DefaultReg();
        return;
    }
    UFUNCTION()
    void Run_ClientJob_IncrementalUpdateEcoCollectablePresentation_StaticReg() const
    {
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        MarkModifiedIfDirty local_68;
        int local_198 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 1;
        int local_3 = local_4;
        int local_13 = FMath::Max(1, ECS::FlatTimeToFrame(FFPTime(1.0)));
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_16 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_20 = local_2.GetViewCacheEntities();
            int local_21 = 0;
            for (auto& local_36 : local_20)
            {
                local_36;
                FECSEntity local_40;
                if (!(local_40.IsValid()))
                {
                    continue;
                }
                ++local_21;
                FECSEntityScopeCycleCounter local_41 = FECSEntityScopeCycleCounter(local_40);
                if (!(this.GetECSRuntime().IsOnPerEntityInterval(FFPTime(1.0), local_40.GetId(), local_13)))
                {
                    continue;
                }
                this.ClientJob_IncrementalUpdateEcoCollectablePresentation(local_46, local_48, local_54, local_60);
                local_68.opCall(local_54);
            }
            local_2.UpdateCachedEntityCount(local_21);
            return;
        }
        FECSRuntimeView local_106 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Exclude(local_106).opCall();
        bool local_14 = local_2.BeginViewCacheBuild();
        int local_12 = local_2.GetViewCacheEpoch();
        int local_128 = 0;
        FECSRuntimeViewIterator local_162 = local_106.Iterator();
        for (; local_162.CanProceed;)
        {
            local_46 = local_162.Proceed();
            ++local_128;
            if (local_14)
            {
                local_2.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_41_2 = FECSEntityScopeCycleCounter(local_46);
            if (!(this.GetECSRuntime().IsOnPerEntityInterval(FFPTime(1.0), local_46.GetId(), local_13)))
            {
                continue;
            }
            this.ClientJob_IncrementalUpdateEcoCollectablePresentation(local_198, local_48, local_54, local_60);
            local_68.opCall(local_54);
        }
        local_2.UpdateCachedEntityCount(local_128);
        if (local_14)
        {
            local_2.CommitViewCacheBuild(local_12);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_IncrementalUpdateEcoCollectablePresentation_LocalReg() const
    {
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        MarkModifiedIfDirty local_68;
        int local_198 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 2;
        int local_3 = local_4;
        int local_13 = FMath::Max(1, ECS::FlatTimeToFrame(FFPTime(1.0)));
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_16 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_20 = local_2.GetViewCacheEntities();
            int local_21 = 0;
            for (auto& local_36 : local_20)
            {
                local_36;
                FECSEntity local_40;
                if (!(local_40.IsValid()))
                {
                    continue;
                }
                ++local_21;
                FECSEntityScopeCycleCounter local_41 = FECSEntityScopeCycleCounter(local_40);
                if (!(this.GetECSRuntime().IsOnPerEntityInterval(FFPTime(1.0), local_40.GetId(), local_13)))
                {
                    continue;
                }
                this.ClientJob_IncrementalUpdateEcoCollectablePresentation(local_46, local_48, local_54, local_60);
                local_68.opCall(local_54);
            }
            local_2.UpdateCachedEntityCount(local_21);
            return;
        }
        FECSRuntimeView local_106 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Exclude(local_106).opCall();
        bool local_14 = local_2.BeginViewCacheBuild();
        int local_12 = local_2.GetViewCacheEpoch();
        int local_128 = 0;
        FECSRuntimeViewIterator local_162 = local_106.Iterator();
        for (; local_162.CanProceed;)
        {
            local_46 = local_162.Proceed();
            ++local_128;
            if (local_14)
            {
                local_2.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_41_2 = FECSEntityScopeCycleCounter(local_46);
            if (!(this.GetECSRuntime().IsOnPerEntityInterval(FFPTime(1.0), local_46.GetId(), local_13)))
            {
                continue;
            }
            this.ClientJob_IncrementalUpdateEcoCollectablePresentation(local_198, local_48, local_54, local_60);
            local_68.opCall(local_54);
        }
        local_2.UpdateCachedEntityCount(local_128);
        if (local_14)
        {
            local_2.CommitViewCacheBuild(local_12);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_IncrementalUpdateEcoCollectablePresentation_DefaultReg() const
    {
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        MarkModifiedIfDirty local_68;
        int local_198 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        int local_13 = FMath::Max(1, ECS::FlatTimeToFrame(FFPTime(1.0)));
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_16 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_20 = local_2.GetViewCacheEntities();
            int local_21 = 0;
            for (auto& local_36 : local_20)
            {
                local_36;
                FECSEntity local_40;
                if (!(local_40.IsValid()))
                {
                    continue;
                }
                ++local_21;
                FECSEntityScopeCycleCounter local_41 = FECSEntityScopeCycleCounter(local_40);
                if (!(this.GetECSRuntime().IsOnPerEntityInterval(FFPTime(1.0), local_40.GetId(), local_13)))
                {
                    continue;
                }
                this.ClientJob_IncrementalUpdateEcoCollectablePresentation(local_46, local_48, local_54, local_60);
                local_68.opCall(local_54);
            }
            local_2.UpdateCachedEntityCount(local_21);
            return;
        }
        FECSRuntimeView local_106 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Exclude(local_106).opCall();
        bool local_14 = local_2.BeginViewCacheBuild();
        int local_12 = local_2.GetViewCacheEpoch();
        int local_128 = 0;
        FECSRuntimeViewIterator local_162 = local_106.Iterator();
        for (; local_162.CanProceed;)
        {
            local_46 = local_162.Proceed();
            ++local_128;
            if (local_14)
            {
                local_2.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_41_2 = FECSEntityScopeCycleCounter(local_46);
            if (!(this.GetECSRuntime().IsOnPerEntityInterval(FFPTime(1.0), local_46.GetId(), local_13)))
            {
                continue;
            }
            this.ClientJob_IncrementalUpdateEcoCollectablePresentation(local_198, local_48, local_54, local_60);
            local_68.opCall(local_54);
        }
        local_2.UpdateCachedEntityCount(local_128);
        if (local_14)
        {
            local_2.CommitViewCacheBuild(local_12);
        }
        return;
    }
    void Monitor___JobTimer_Pre___ServerJob_EcoCollectableRecoverAfterCollected(const FC_EcoCollectableSyncedRuntime &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.GetRecoverCDTargetTime();
        FName local_8 = FName("S_EcoCollectableScriptSystem::ServerJob_EcoCollectableRecoverAfterCollected");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___ServerJob_EcoCollectableRecoverAfterCollected(const FC_EcoCollectableSyncedRuntime &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.GetRecoverCDTargetTime();
        FName local_8 = FName("S_EcoCollectableScriptSystem::ServerJob_EcoCollectableRecoverAfterCollected");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___ServerJob_EcoCollectableRecoverAfterCollected() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = this.GetECSWorld().__GetMonitorEcoCollectableSyncedRuntimeOnModifyView(EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___ServerJob_EcoCollectableRecoverAfterCollected(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = this.GetECSWorld().__GetMonitorEcoCollectableSyncedRuntimeOnActiveView(EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___ServerJob_EcoCollectableRecoverAfterCollected(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___ServerJob_EcoCollectableRecoverAfterCollected() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = this.GetECSWorld().__GetMonitorEcoCollectableSyncedRuntimeOnModifyView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___ServerJob_EcoCollectableRecoverAfterCollected(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = this.GetECSWorld().__GetMonitorEcoCollectableSyncedRuntimeOnActiveView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___ServerJob_EcoCollectableRecoverAfterCollected(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_EcoCollectableRecoverAfterCollected() const
    {
        int local_6 = 0;
        int local_42 = 0;
        int local_50 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        local_4.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_14 = local_4.GetExternalEntityList();
        FECSEntity local_32;
        for (auto& local_28 : local_14)
        {
            local_28;
            FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
            bool local_11 = false;
            bool local_35 = !(false);
            if (!(local_32.IsActive()) == local_35)
            {
                continue;
            }
            if (!(local_42))
            {
                continue;
            }
            FFPTime local_44 = local_42.GetRecoverCDTargetTime();
            if (local_44.opCmp(0.0) < 0 || (FFPTime(local_42.GetRecoverCDTargetTime()) == FPTIME_MAX))
            {
                continue;
            }
            if (local_11)
            {
                continue;
            }
            this.ServerJob_EcoCollectableRecoverAfterCollected(local_50, local_6);
            MarkModifiedIfDirty local_58;
            local_58.opCall(local_50);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_InitEcoCollectableSpawner() const
    {
        int local_36 = 0;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
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
                this.ServerJob_InitEcoCollectableSpawner(local_36, local_42);
                local_50.opCall(local_42);
            }
            local_2.UpdateCachedEntityCount(local_13);
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
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_106 = 0;
        FECSRuntimeViewIterator local_140 = local_88.Iterator();
        for (; local_140.CanProceed;)
        {
            const FECSEntity& local_176 = local_140.Proceed();
            ++local_106;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_176.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_176);
            this.ServerJob_InitEcoCollectableSpawner(local_36, local_42);
            local_50.opCall(local_42);
        }
        local_2.UpdateCachedEntityCount(local_106);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_InitEcoCollectableLayoutInfo_StaticReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        MarkModifiedIfDirty local_48;
        int local_176 = 0;
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
                this.ServerJob_InitEcoCollectableLayoutInfo(local_38, local_40);
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
        Include local_98;
        local_98.opCall();
        Exclude(local_86).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_104 = 0;
        FECSRuntimeViewIterator local_138 = local_86.Iterator();
        for (; local_138.CanProceed;)
        {
            local_38 = local_138.Proceed();
            ++local_104;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.ServerJob_InitEcoCollectableLayoutInfo(local_176, local_40);
            local_48.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_104);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_InitEcoCollectableLayoutInfo_LocalReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        MarkModifiedIfDirty local_48;
        int local_176 = 0;
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
                this.ServerJob_InitEcoCollectableLayoutInfo(local_38, local_40);
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
        Include local_98;
        local_98.opCall();
        Exclude(local_86).opCall();
        bool local_6 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_104 = 0;
        FECSRuntimeViewIterator local_138 = local_86.Iterator();
        for (; local_138.CanProceed;)
        {
            local_38 = local_138.Proceed();
            ++local_104;
            if (local_6)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.ServerJob_InitEcoCollectableLayoutInfo(local_176, local_40);
            local_48.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_104);
        if (local_6)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_InitEcoCollectableLayoutInfo_DefaultReg() const
    {
        const FECSEntity& local_38;
        int local_40 = 0;
        MarkModifiedIfDirty local_48;
        int local_176 = 0;
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
                this.ServerJob_InitEcoCollectableLayoutInfo(local_38, local_40);
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
        Include local_98;
        local_98.opCall();
        Exclude(local_86).opCall();
        bool local_7 = local_4.BeginViewCacheBuild();
        int local_16 = local_4.GetViewCacheEpoch();
        int local_104 = 0;
        FECSRuntimeViewIterator local_138 = local_86.Iterator();
        for (; local_138.CanProceed;)
        {
            local_38 = local_138.Proceed();
            ++local_104;
            if (local_7)
            {
                local_4.AddViewCacheEntity(local_38.GetId());
            }
            FECSEntityScopeCycleCounter local_35_2 = FECSEntityScopeCycleCounter(local_38);
            this.ServerJob_InitEcoCollectableLayoutInfo(local_176, local_40);
            local_48.opCall(local_40);
        }
        local_4.UpdateCachedEntityCount(local_104);
        if (local_7)
        {
            local_4.CommitViewCacheBuild(local_16);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_InitEcoCollectableLayoutInfo_StaticReg() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_174 = 0;
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
                this.ClientJob_InitEcoCollectableLayoutInfo(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_84.Iterator();
        for (; local_136.CanProceed;)
        {
            local_36 = local_136.Proceed();
            ++local_102;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_InitEcoCollectableLayoutInfo(local_174, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_102);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_InitEcoCollectableLayoutInfo_LocalReg() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_174 = 0;
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
                this.ClientJob_InitEcoCollectableLayoutInfo(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_84.Iterator();
        for (; local_136.CanProceed;)
        {
            local_36 = local_136.Proceed();
            ++local_102;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_InitEcoCollectableLayoutInfo(local_174, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_102);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_InitEcoCollectableLayoutInfo_DefaultReg() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_174 = 0;
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
                this.ClientJob_InitEcoCollectableLayoutInfo(local_36, local_38);
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
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_84.Iterator();
        for (; local_136.CanProceed;)
        {
            local_36 = local_136.Proceed();
            ++local_102;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_InitEcoCollectableLayoutInfo(local_174, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_102);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleTimeSegmentChanged() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EcologyTimeSegmentsChangedEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EcologyTimeSegmentsChangedEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleTimeSegmentChanged(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleWeatherChanged() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_RegionWeatherChanged> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_RegionWeatherChanged& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleWeatherChanged(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ViewportSelectTarget() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorViewEntityManagerOnAssignView(EECSRegType(1), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ViewportSelectTarget(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ReInitCollectableState() const
    {
        int local_12 = 0;
        const FECSEntity& local_46;
        int local_162 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        int local_18 = 1;
        int local_17 = local_18;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_4_3 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_22 = local_2.GetViewCacheEntities();
            int local_23 = 0;
            for (auto& local_38 : local_22)
            {
                local_38;
                FECSEntity local_42;
                if (!(local_42.IsValid()))
                {
                    continue;
                }
                ++local_23;
                FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42);
                this.ClientJob_ReInitCollectableState(local_46, local_12);
            }
            local_2.UpdateCachedEntityCount(local_23);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        bool local_9 = local_2.BeginViewCacheBuild();
        int local_24 = local_2.GetViewCacheEpoch();
        int local_90 = 0;
        FECSRuntimeViewIterator local_124 = local_84.Iterator();
        for (; local_124.CanProceed;)
        {
            local_46 = local_124.Proceed();
            ++local_90;
            if (local_9)
            {
                local_2.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.ClientJob_ReInitCollectableState(local_162, local_12);
        }
        local_2.UpdateCachedEntityCount(local_90);
        if (local_9)
        {
            local_2.CommitViewCacheBuild(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ForceCheckRefreshAllEcoCollectableState_StaticReg() const
    {
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        MarkModifiedIfDirty local_68;
        int local_214 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 1;
        int local_3 = local_4;
        int local_13 = FMath::Max(1, ECS::FlatTimeToFrame(FFPTime(5.0)));
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_16 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_20 = local_2.GetViewCacheEntities();
            int local_21 = 0;
            for (auto& local_36 : local_20)
            {
                local_36;
                FECSEntity local_40;
                if (!(local_40.IsValid()))
                {
                    continue;
                }
                ++local_21;
                FECSEntityScopeCycleCounter local_41 = FECSEntityScopeCycleCounter(local_40);
                if (!(this.GetECSRuntime().IsOnPerEntityInterval(FFPTime(5.0), local_40.GetId(), local_13)))
                {
                    continue;
                }
                this.ClientJob_ForceCheckRefreshAllEcoCollectableState(local_46, local_48, local_54, local_60);
                local_68.opCall(local_48);
            }
            local_2.UpdateCachedEntityCount(local_21);
            return;
        }
        FECSRuntimeView local_106 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Include local_126;
        local_126.opCall();
        Exclude(local_106).opCall();
        Exclude(local_106).opCall();
        Exclude(local_106).opCall();
        Exclude(local_106).opCall();
        bool local_14 = local_2.BeginViewCacheBuild();
        int local_12 = local_2.GetViewCacheEpoch();
        int local_144 = 0;
        FECSRuntimeViewIterator local_178 = local_106.Iterator();
        for (; local_178.CanProceed;)
        {
            local_46 = local_178.Proceed();
            ++local_144;
            if (local_14)
            {
                local_2.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_41_2 = FECSEntityScopeCycleCounter(local_46);
            if (!(this.GetECSRuntime().IsOnPerEntityInterval(FFPTime(5.0), local_46.GetId(), local_13)))
            {
                continue;
            }
            this.ClientJob_ForceCheckRefreshAllEcoCollectableState(local_214, local_48, local_54, local_60);
            local_68.opCall(local_48);
        }
        local_2.UpdateCachedEntityCount(local_144);
        if (local_14)
        {
            local_2.CommitViewCacheBuild(local_12);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ForceCheckRefreshAllEcoCollectableState_LocalReg() const
    {
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        MarkModifiedIfDirty local_68;
        int local_214 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 2;
        int local_3 = local_4;
        int local_13 = FMath::Max(1, ECS::FlatTimeToFrame(FFPTime(5.0)));
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_16 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_20 = local_2.GetViewCacheEntities();
            int local_21 = 0;
            for (auto& local_36 : local_20)
            {
                local_36;
                FECSEntity local_40;
                if (!(local_40.IsValid()))
                {
                    continue;
                }
                ++local_21;
                FECSEntityScopeCycleCounter local_41 = FECSEntityScopeCycleCounter(local_40);
                if (!(this.GetECSRuntime().IsOnPerEntityInterval(FFPTime(5.0), local_40.GetId(), local_13)))
                {
                    continue;
                }
                this.ClientJob_ForceCheckRefreshAllEcoCollectableState(local_46, local_48, local_54, local_60);
                local_68.opCall(local_48);
            }
            local_2.UpdateCachedEntityCount(local_21);
            return;
        }
        FECSRuntimeView local_106 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Include local_126;
        local_126.opCall();
        Exclude(local_106).opCall();
        Exclude(local_106).opCall();
        Exclude(local_106).opCall();
        Exclude(local_106).opCall();
        bool local_14 = local_2.BeginViewCacheBuild();
        int local_12 = local_2.GetViewCacheEpoch();
        int local_144 = 0;
        FECSRuntimeViewIterator local_178 = local_106.Iterator();
        for (; local_178.CanProceed;)
        {
            local_46 = local_178.Proceed();
            ++local_144;
            if (local_14)
            {
                local_2.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_41_2 = FECSEntityScopeCycleCounter(local_46);
            if (!(this.GetECSRuntime().IsOnPerEntityInterval(FFPTime(5.0), local_46.GetId(), local_13)))
            {
                continue;
            }
            this.ClientJob_ForceCheckRefreshAllEcoCollectableState(local_214, local_48, local_54, local_60);
            local_68.opCall(local_48);
        }
        local_2.UpdateCachedEntityCount(local_144);
        if (local_14)
        {
            local_2.CommitViewCacheBuild(local_12);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ForceCheckRefreshAllEcoCollectableState_DefaultReg() const
    {
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        MarkModifiedIfDirty local_68;
        int local_214 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        int local_13 = FMath::Max(1, ECS::FlatTimeToFrame(FFPTime(5.0)));
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_16 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_20 = local_2.GetViewCacheEntities();
            int local_21 = 0;
            for (auto& local_36 : local_20)
            {
                local_36;
                FECSEntity local_40;
                if (!(local_40.IsValid()))
                {
                    continue;
                }
                ++local_21;
                FECSEntityScopeCycleCounter local_41 = FECSEntityScopeCycleCounter(local_40);
                if (!(this.GetECSRuntime().IsOnPerEntityInterval(FFPTime(5.0), local_40.GetId(), local_13)))
                {
                    continue;
                }
                this.ClientJob_ForceCheckRefreshAllEcoCollectableState(local_46, local_48, local_54, local_60);
                local_68.opCall(local_48);
            }
            local_2.UpdateCachedEntityCount(local_21);
            return;
        }
        FECSRuntimeView local_106 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_110;
        local_110.opCall();
        Include local_114;
        local_114.opCall();
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Include local_126;
        local_126.opCall();
        Exclude(local_106).opCall();
        Exclude(local_106).opCall();
        Exclude(local_106).opCall();
        Exclude(local_106).opCall();
        bool local_14 = local_2.BeginViewCacheBuild();
        int local_12 = local_2.GetViewCacheEpoch();
        int local_144 = 0;
        FECSRuntimeViewIterator local_178 = local_106.Iterator();
        for (; local_178.CanProceed;)
        {
            local_46 = local_178.Proceed();
            ++local_144;
            if (local_14)
            {
                local_2.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_41_2 = FECSEntityScopeCycleCounter(local_46);
            if (!(this.GetECSRuntime().IsOnPerEntityInterval(FFPTime(5.0), local_46.GetId(), local_13)))
            {
                continue;
            }
            this.ClientJob_ForceCheckRefreshAllEcoCollectableState(local_214, local_48, local_54, local_60);
            local_68.opCall(local_48);
        }
        local_2.UpdateCachedEntityCount(local_144);
        if (local_14)
        {
            local_2.CommitViewCacheBuild(local_12);
        }
        return;
    }
}


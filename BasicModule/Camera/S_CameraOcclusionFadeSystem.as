
const FConsoleVariable CVar_OcclusionFadeNearCamera = FConsoleVariable();
const FConsoleVariable CVar_OcclusionDebugActors = FConsoleVariable();
const FName NAME_PlayerHeadPosForMPC = n"PlayerPosition_Head";

class US_CameraOcclusionFadeSystem : UECSScriptSystem
{
    UPROPERTY()
    float32 FadeWeightUpdateDuration = 0.2f;
    UPROPERTY()
    float32 MaxFadeWeight = 0.75f;
    UPROPERTY()
    float32 MinFadeWeight = 0.2f;
    UPROPERTY()
    float32 DelayDurationWhenFadeWeightDecrease = 0.2f;
    UPROPERTY()
    float32 DefaultNearCameraFadeRange = 120.0f;
    UPROPERTY()
    float32 DefaultNearCameraCompleteFadeDistance = 10.0f;
    UPROPERTY()
    float32 DefaultNearCameraSweepSphereRadius = 75.0f;
    UPROPERTY()
    float32 DefaultNearCameraMaxSweepDistance = 500.0f;
    UPROPERTY()
    float32 DefaultBossNearCameraRadius = 1000.0f;
    UPROPERTY()
    float32 DefaultTeammateOutlineCameraRadius = 10000.0f;
    UPROPERTY()
    float32 DefaultOutlineCheckInterval = 0.5f;


    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    UFUNCTION()
    void ClientJob_TickClearExsitingFadeObjects(const FCS_LocalPlayer &inout Player, FCS_CameraOcclusionFade &inout FadeStorage) const
    {
        for (auto& local_20 : FadeStorage.FadeObjects)
        {
            local_20;
        }
        return;
    }
    UFUNCTION()
    void ClientJob_TickFadeNearCamera(const FCS_LocalPlayer &inout Player) const
    {
        float32 local_123;
        float32 local_219;
        FVector local_6(Player.UEPlayerController.PlayerCameraManager.GetCameraLocation());
        FRotator local_18 = FRotator(Player.UEPlayerController.PlayerCameraManager.GetCameraRotation());
        float32 local_29 = this.DefaultNearCameraSweepSphereRadius;
        FQuat local_33;
        FCollisionShape::MakeSphere(local_33);
        FCollisionQueryParams local_72;
        local_72.bTraceComplex = false;
        TArray<FHitResult> local_78;
        FVector local_84 = local_6;
        FVector local_90(FVector::ZeroVector);
        FVector local_96(local_18.GetForwardVector());
        float32 local_29_2 = this.DefaultNearCameraFadeRange;
        float32 local_97 = local_29_2;
        FECSEntity local_102 = Player.GetPlayerPawnEntity();
        if (local_102.IsValid())
        {
            FECSEntity local_102_2 = Player.GetPlayerPawnEntity();
            Get local_106;
            const FC_Collision& local_108 = local_106.opCall();
            if (local_108)
            {
                FVector local_12 = FTransformUtils::GetLocation(Player.GetPlayerPawnEntity(), FFPTime(-1));
                local_29_2 = local_108.GetScaledHalfHeight();
                local_29_2 = local_29_2 * 0.5f;
                local_90 = (local_12 + FVector::UpVector.opMul_r(local_29_2));
                FVector local_114 = (local_90 - local_6);
                local_96 = local_114.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
                local_123 = this.DefaultNearCameraMaxSweepDistance;
                local_97 = FMath::Clamp(float32(local_114.Size()), this.DefaultNearCameraFadeRange, local_123);
            }
        }
        FVector local_132 = (local_6 + (local_96 * local_97));
        local_18.Quaternion();
        ECS::GetUEWorld();
        TMap<AActor, float32> local_180;
        TArray<AActor> local_184;
        FECSWorldPtr local_186 = this.GetECSWorld();
        for (auto& local_206 : local_78)
        {
            if (local_206.GetActor() == nullptr)
            {
                continue;
            }
            if (local_206.GetActor().IsHidden())
            {
                continue;
            }
            if (ECS::GetEntity(local_206.GetActor(), false))
            {
                Has local_218;
                bool local_213 = local_218.opCall();
                if (local_213)
                {
                    continue;
                }
            }
            if (local_206.GetActor().Tags.Contains(n"IgnoreNearCameraOcclusionFade"))
            {
                local_219 = 1.0f;
            }
            else
            {
                if (local_206.GetbStartPenetrating())
                {
                    local_123 = 0.0f;
                }
                else
                {
                    local_123 = local_206.Distance;
                }
                float32 local_220 = this.DefaultNearCameraFadeRange;
                local_219 = FMathUtils::InverseLerp(local_123, local_220, this.DefaultNearCameraCompleteFadeDistance) * this.MaxFadeWeight;
                if (local_219 < this.MinFadeWeight)
                {
                    local_220 = 0.0f;
                }
                else
                {
                    local_220 = local_219;
                }
                local_219 = local_220;
            }
            if (local_219 > 0.0f)
            {
                local_29_2 = 0.0f;
                float32 local_220_2 = local_180.FindOrAdd(local_206.GetActor(), local_29_2);
                float32 local_222 = FMath::Max(local_220_2, local_219);
                local_206.GetActor().GetAttachedActors(local_184, true, true);
                for (auto local_236 : local_184)
                {
                    local_220_2 = local_180.FindOrAdd(local_236, 0.0f);
                    float32 local_222_2 = FMath::Max(local_220_2, local_219);
                }
            }
        }
        for (auto& local_254 : local_180)
        {
            TWeakObjectPtr<AActor> local_256 = TWeakObjectPtr<AActor>(local_254.GetKey());
            FCameraOcclusionFadeItem local_258;
            local_258.OcclusionFadeTargetWeight = local_29_2;
        }
        UMaterialParameterCollection local_262 = ::UCombatGlobalSettings::Get().GlobalEnvStateMPC;
        if (local_262 != nullptr)
        {
            Material::SetVectorParameterValue(__GetWorldContext(), local_262, NAME_PlayerHeadPosForMPC, FLinearColor());
        }
        return;
    }
    UFUNCTION()
    void ClientJob_OutlineCheckUpdate(const FCS_LocalPlayer &inout Player) const
    {
        int local_112 = 0;
        if (!(Player.PlayerEntity))
        {
            return;
        }
        FVector local_8(Player.UEPlayerController.PlayerCameraManager.GetCameraLocation());
        float32 local_19 = this.DefaultBossNearCameraRadius;
        FVector local_23;
        FCollisionShape::MakeSphere(local_23);
        FCollisionQueryParams local_62;
        local_62.bTraceComplex = false;
        TArray<FOverlapResult> local_68;
        FCollisionResponseParams local_76 = FCollisionResponseParams();
        FECSEntity local_82 = Player.GetPlayerPawnEntity();
        bool local_84 = false;
        FName local_86(n"OutlinerOccluder");
        for (auto& local_102 : local_68)
        {
            if (local_102.GetActor() == nullptr)
            {
                continue;
            }
            if (local_102.GetActor().Tags.Contains(local_86))
            {
                local_84 = true;
                break;
            }
        }
        FECSWorldPtr local_106 = ECS::GetECSWorld();
        if ((!(local_84) == !(false) && ::CharacterOutline::ShouldShowTeamOutline(local_112)))
        {
            Get local_120;
            const FC_TeamInfo& local_122 = local_120.opCall();
            if (local_122)
            {
                for (auto& local_136 : local_122.GetMembers())
                {
                    if ((FECSEntity(local_136.GetEntity()) == Player.PlayerEntity))
                    {
                        continue;
                    }
                    FECSEntity local_82_2 = ::FTeamUtils::GetPawnEntityFromTeamMember(local_136.GetEntity(), true);
                    if (local_82_2)
                    {
                        if ((FTransformUtils::GetLocation(local_82_2, FFPTime(-1)).DistSquared(local_8)) < (this.DefaultTeammateOutlineCameraRadius * this.DefaultTeammateOutlineCameraRadius))
                        {
                            local_84 = true;
                            break;
                        }
                    }
                }
            }
        }
        GameVisualCue::GameVisualCue_EnableOcclusionOutline(__GetWorldContext(), local_84);
        return;
    }
    UFUNCTION()
    void Monitor_OnRemoveSyncDitherRequest(const FECSEntity &inout Entity, const FC_SyncDitherRequests &inout SyncDitherRequest) const
    {
        const AActor local_4;
        const AActor local_42;
        local_4 = Entity.GetActor();
        if (local_4 != nullptr)
        {
            FECSWorldPtr local_8 = this.GetECSWorld();
            Modify local_12;
            FCS_CameraOcclusionFade& local_14 = local_12.opCall();
            if (local_14)
            {
                bool local_5 = local_14.FadeObjects.Contains(TWeakObjectPtr<AActor>(local_4));
                if (local_5)
                {
                    TWeakObjectPtr<AActor> local_16 = TWeakObjectPtr<AActor>(local_4);
                    local_14.FadeObjects[local_16].LogicFadeWeight = 0.0f;
                }
                Get local_22;
                const FC_AttachmentChildren& local_24 = local_22.opCall();
                if (local_24)
                {
                    for (auto& local_38 : local_24.GetChildren())
                    {
                        local_42 = local_38.GetActor();
                        if (local_42 != nullptr)
                        {
                            bool local_5_2 = local_14.FadeObjects.Contains(TWeakObjectPtr<AActor>(local_42));
                            if (local_5_2)
                            {
                                TWeakObjectPtr<AActor> local_16_2 = TWeakObjectPtr<AActor>(local_42);
                                local_14.FadeObjects[local_16_2].LogicFadeWeight = 0.0f;
                            }
                        }
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Client_UpdateLogicFadeValue(const FECSEntity &inout Entity, const FC_SyncDitherRequests &inout SyncDitherRequest) const
    {
        const AActor local_4;
        int local_14 = 0;
        float32 local_31;
        const AActor local_48;
        local_4 = Entity.GetActor();
        bool local_5 = !((local_4 != nullptr));
        if (local_5)
        {
            return;
        }
        FECSWorldPtr local_8 = this.GetECSWorld();
        FFPTime local_18 = ECS::GetContextTime();
        TWeakObjectPtr<AActor> local_22 = TWeakObjectPtr<AActor>(local_4);
        local_14.FadeObjects.FindOrAdd(local_22).LogicFadeWeight = SyncDitherRequest.GetCurrentDitherValue(local_18);
        Get local_26;
        const FC_AttachmentChildren& local_28 = local_26.opCall();
        if (local_28)
        {
            bool local_5_2 = SyncDitherRequest.HasIncludeAttachEntityRequest();
            if (local_5_2)
            {
                local_31 = SyncDitherRequest.GetCurrentAttachEntityDitherValue(local_18);
            }
            else
            {
                local_31 = 0.0f;
            }
            for (auto& local_46 : local_28.GetChildren())
            {
                local_48 = local_46.GetActor();
                if (local_48 != nullptr)
                {
                    if (local_5_2)
                    {
                        TWeakObjectPtr<AActor> local_22_2 = TWeakObjectPtr<AActor>(local_48);
                        local_14.FadeObjects.FindOrAdd(local_22_2).LogicFadeWeight = local_31;
                    }
                    else
                    {
                        bool local_29 = local_14.FadeObjects.Contains(TWeakObjectPtr<AActor>(local_48));
                        if (local_29)
                        {
                            TWeakObjectPtr<AActor> local_22_3 = TWeakObjectPtr<AActor>(local_48);
                            local_14.FadeObjects[local_22_3].LogicFadeWeight = 0.0f;
                        }
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Client_UpdateFinalFadeValue(FCS_CameraOcclusionFade &inout FadeStorage) const
    {
        const AActor local_28;
        FCameraOcclusionFadeItem& local_30;
        float local_6 = ECS::GetContextDeltaTime().ToSeconds();
        float32 local_7 = float32(local_6);
        auto local_16 = FadeStorage.FadeObjects.Iterator();
        for (; local_16.CanProceed;)
        {
            local_16.Proceed();
            if (local_28 == nullptr)
            {
                local_16.RemoveCurrent();
                continue;
            }
            if (local_30.bFreezeOcclusionFadeWeight)
            {
                local_30.OcclusionFadeWeightFreezeTimer -= local_7;
                local_30.bFreezeOcclusionFadeWeight = (local_30.OcclusionFadeWeightFreezeTimer > 0.0f && (local_30.OcclusionFadeTargetWeight < local_30.OcclusionFadeWeight));
            }
            else
            {
                local_30.bFreezeOcclusionFadeWeight = (local_30.OcclusionFadeTargetWeight < local_30.PrevOcclusionTargetFadeWeight);
                local_30.OcclusionFadeWeightFreezeTimer = this.DelayDurationWhenFadeWeightDecrease;
            }
            if (!(local_30.bFreezeOcclusionFadeWeight))
            {
                local_30.OcclusionFadeWeightFreezeTimer = -1.0f;
                float32 local_1_2 = 1.0f / this.FadeWeightUpdateDuration;
                local_30.OcclusionFadeWeight = FMath::FInterpConstantTo(local_30.OcclusionFadeWeight, local_30.OcclusionFadeTargetWeight, local_7, local_1_2);
            }
            if ((local_30.OcclusionFadeWeight != local_30.PrevOcclusionFadeWeight || (local_30.LogicFadeWeight != local_30.PrevLogicFadeWeight)))
            {
                local_30.PrevOcclusionFadeWeight = local_30.OcclusionFadeWeight;
                local_30.PrevLogicFadeWeight = local_30.LogicFadeWeight;
                FECSWorldPtr local_36 = this.GetECSWorld();
                ModifyOrAdd local_40;
                local_40.opCall().Actor.Add(local_16.GetKey());
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_UpdateOcculusionOpacityToRender(FCS_CameraOcclusionFade &inout FadeStorage, FCS_CameraOcclusionFadeUpdated &inout Updated) const
    {
        int local_8 = 0;
        bool local_21;
        bool local_27;
        const AActor local_30;
        UPrimitiveComponent local_46;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        for (auto& local_24 : Updated.Actor)
        {
            FCameraOcclusionFadeItem& local_26 = FadeStorage.FadeObjects.FindOrAdd(local_24);
            local_21 = !(local_26.bCompCached);
            local_27 = !(false);
            if (local_21 == local_27)
            {
                local_26.CachedFadeComponents = local_30.GetComponentsByClass(UPrimitiveComponent);
                int local_38 = local_26.CachedFadeComponents.Num() - 1;
                for (; local_38 >= 0; --local_38)
                {
                    UPrimitiveComponent local_40 = local_26.CachedFadeComponents[local_38];
                    if (local_40.GetNumMaterials() == 0)
                    {
                        local_26.CachedFadeComponents.RemoveAt(local_38);
                    }
                }
                local_26.SetEnableDynamicMaskedMaterialByFades.SetNum(local_26.CachedFadeComponents.Num());
                local_21 = true;
                local_26.bCompCached = local_21;
            }
            if (!((local_26.LogicFadeWeight > 0.0f) || (local_26.OcclusionFadeWeight > 0.0f)))
            {
                int local_38_2 = 0;
                for (; local_38_2 < local_26.CachedFadeComponents.Num(); )
                {
                    local_46 = local_26.CachedFadeComponents[local_38_2];
                    TWeakObjectPtr<UActorComponent> local_48 = TWeakObjectPtr<UActorComponent>(local_46);
                    if (local_26.SetEnableDynamicMaskedMaterialByFades[local_38_2])
                    {
                        local_46.SetEnableDynamicMaskedMaterial(false);
                        local_26.SetEnableDynamicMaskedMaterialByFades[local_38_2] = false;
                    }
                    local_46.SetCustomPrimitiveDataFloat(0, 0.0f);
                    local_46.SetCustomPrimitiveDataFloat(1, 0.0f);
                    ++local_38_2;
                }
                continue;
            }
            int local_38_3 = 0;
            for (; local_38_3 < local_26.CachedFadeComponents.Num(); )
            {
                local_46 = local_26.CachedFadeComponents[local_38_3];
                local_8.Components.Add(TWeakObjectPtr<UActorComponent>(local_46));
                local_21 = !(false);
                if (!(local_46.GetbEnableDynamicMaskedMaterial()) == local_21)
                {
                    local_46.SetEnableDynamicMaskedMaterial(true);
                    local_26.SetEnableDynamicMaskedMaterialByFades[local_38_3] = true;
                }
                local_46.SetCustomPrimitiveDataFloat(0, local_26.LogicFadeWeight);
                local_46.SetCustomPrimitiveDataFloat(1, local_26.OcclusionFadeWeight);
                ++local_38_3;
            }
        }
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        Remove local_52;
        local_52.opCall();
        return;
    }
    UFUNCTION()
    void ClientJob_TickDebugOccludeActor(const FCS_CameraOcclusionFade &inout FadeStorage) const
    {
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TickClearExsitingFadeObjects() const
    {
        int local_16 = 0;
        int local_22 = 0;
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
        FECSWorldPtr local_4_4 = this.GetECSWorld();
        this.ClientJob_TickClearExsitingFadeObjects(local_16, local_22);
        FECSWorldPtr local_4_5 = this.GetECSWorld();
        MarkModifiedIfDirty local_30;
        local_30.opCall(local_22);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TickFadeNearCamera() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        if (CVar_OcclusionFadeNearCamera.GetBool() == false)
        {
            return;
        }
        FECSWorldPtr local_6 = this.GetECSWorld();
        Has local_10;
        if (!(local_10.opCall()))
        {
            return;
        }
        FECSWorldPtr local_6_2 = this.GetECSWorld();
        this.ClientJob_TickFadeNearCamera(local_12);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_OutlineCheckUpdate() const
    {
        int local_18 = 0;
        ECS::GetContextJob();
        if (!(this.GetECSRuntime().IsOnInterval(FFPTime(this.DefaultOutlineCheckInterval))))
        {
            return;
        }
        FECSWorldPtr local_12 = this.GetECSWorld();
        Has local_16;
        if (!(local_16.opCall()))
        {
            return;
        }
        FECSWorldPtr local_12_2 = this.GetECSWorld();
        this.ClientJob_OutlineCheckUpdate(local_18);
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnRemoveSyncDitherRequest() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorSyncDitherRequestsOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnRemoveSyncDitherRequest(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Client_UpdateLogicFadeValue() const
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
                this.Client_UpdateLogicFadeValue(local_36, local_38);
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
            this.Client_UpdateLogicFadeValue(local_162, local_38);
        }
        local_2.UpdateCachedEntityCount(local_90);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Client_UpdateFinalFadeValue() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        this.Client_UpdateFinalFadeValue(local_12);
        FECSWorldPtr local_4_3 = this.GetECSWorld();
        MarkModifiedIfDirty local_20;
        local_20.opCall(local_12);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_UpdateOcculusionOpacityToRender() const
    {
        int local_16 = 0;
        int local_22 = 0;
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
        FECSWorldPtr local_4_4 = this.GetECSWorld();
        this.ClientJob_UpdateOcculusionOpacityToRender(local_16, local_22);
        FECSWorldPtr local_4_5 = this.GetECSWorld();
        MarkModifiedIfDirty local_30;
        local_30.opCall(local_16);
        FECSWorldPtr local_4_6 = this.GetECSWorld();
        MarkModifiedIfDirty local_34;
        local_34.opCall(local_22);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TickDebugOccludeActor() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        if (CVar_OcclusionDebugActors.GetBool() == false)
        {
            return;
        }
        FECSWorldPtr local_6 = this.GetECSWorld();
        Has local_10;
        if (!(local_10.opCall()))
        {
            return;
        }
        FECSWorldPtr local_6_2 = this.GetECSWorld();
        this.ClientJob_TickDebugOccludeActor(local_12);
        return;
    }
}


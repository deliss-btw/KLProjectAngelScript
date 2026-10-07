
const float32 THROW_PREDICT_DETACH_VISUAL_BLEND_TIME = 0.2f;
const FConsoleVariable CVar_ThrowPredictMaxPathStartOffset = FConsoleVariable();

class US_ThrowSystem : UECSScriptSystem
{
    US_ThrowSystem()
    {
        return;
    }
    bool IsSameThrowTargetInfo(const FThrowTargetInfo &inout A, const FThrowTargetInfo &inout B) const
    {
        return int(A.GetTargetType()) == (int(B.GetTargetType())) && (A.GetProjectileKey() == B.GetProjectileKey()) && (FECSEntityId(A.GetOwnerId()) == B.GetOwnerId()) && (FECSEntityId(A.GetPropEntityId()) == B.GetPropEntityId());
    }
    void StopThrowPredictPathView(const FECSEntity &inout Entity, const FThrowTargetInfo &inout ExpectedTargetInfo, const bool bRequireTargetMatch) const
    {
        int local_6 = 0;
        if (!(local_6))
        {
            return;
        }
        if (bRequireTargetMatch && !(this.IsSameThrowTargetInfo(local_6.TargetInfo, ExpectedTargetInfo)))
        {
            return;
        }
        FECSEntity local_12 = FECSEntity(local_6.FXEntity);
        if (local_12.IsValid())
        {
            ECSFX::StopFX(local_12, true, false, 0.0f);
            local_6.FXEntity = ENTITY_NULL;
        }
        Remove local_18;
        local_18.opCall();
        return;
    }
    bool IsValidReceivedPredictPath(const FKLPredictProjectilePathResult &inout PredictPath) const
    {
        int local_2 = PredictPath.PathData.Num();
        if (local_2 <= 0 || (local_2 > 1024))
        {
            return false;
        }
        float32 local_5 = 0.0f;
        for (auto& local_20 : PredictPath.PathData)
        {
            if (!(FMath::IsFinite(local_20.Time)) || ((local_20.Time < 0.0f)) || (local_20.Time < local_5) || !(FMath::IsFinite(local_20.Location.X)) || !(FMath::IsFinite(local_20.Location.Y)) || !(FMath::IsFinite(local_20.Location.Z)) || !(FMath::IsFinite(local_20.Velocity.X)) || !(FMath::IsFinite(local_20.Velocity.Y)) || !(FMath::IsFinite(local_20.Velocity.Z)))
            {
                return false;
            }
            local_5 = local_20.Time;
        }
        return FMath::IsFinite(PredictPath.HitLocation.X) && FMath::IsFinite(PredictPath.HitLocation.Y) && FMath::IsFinite(PredictPath.HitLocation.Z) && FMath::IsFinite(PredictPath.HitImpactPoint.X) && FMath::IsFinite(PredictPath.HitImpactPoint.Y) && FMath::IsFinite(PredictPath.HitImpactPoint.Z) && FMath::IsFinite(PredictPath.HitImpactNormal.X) && FMath::IsFinite(PredictPath.HitImpactNormal.Y) && FMath::IsFinite(PredictPath.HitImpactNormal.Z);
    }
    bool IsValidReceivedPropPredictPath(const FECSEntity &inout OwnerEntity, const FECSEntity &inout PropEntity, const FThrowTargetInfo &inout TargetInfo, const FKLPredictProjectilePathResult &inout PredictPath) const
    {
        int local_8 = 0;
        int local_10 = 0;
        float32 local_120;
        if (!(this.IsValidReceivedPredictPath(PredictPath)))
        {
            return false;
        }
        if (!(local_8))
        {
            return false;
        }
        float32 local_30 = FMath::Max(0.0f, CVar_ThrowPredictMaxPathStartOffset.GetFloat());
        if ((local_30 > 0.0f && (float32((FVector(local_10[0].Location) - local_8.GetPosition()).Size()) > local_30)))
        {
            return false;
        }
        if (local_10[0].Time > 0.01f)
        {
            return false;
        }
        FThrowPredictPathData local_108;
        bool local_109 = false;
        Get local_114;
        const FC_ThrowPredictPathData& local_116 = local_114.opCall();
        if (local_116)
        {
            local_109 = local_116.ThrowPathDataMap.Find(TargetInfo, local_108);
        }
        if (!(local_109))
        {
            return true;
        }
        FThrowPredictPathParams local_118 = local_108.PredictPathParams;
        if (local_118.GetSimFrequency() > 1e-8f)
        {
            local_120 = 1.0f / local_118.GetSimFrequency();
        }
        else
        {
            local_120 = 0.1f;
        }
        float32 local_121 = local_10[(local_10.Num() - 1)].Time;
        float32 local_119 = local_118.GetMaxSimTime() + local_120;
        if (local_118.GetMaxSimTime() > 0.0f && (local_121 > (local_119 + 0.01f)))
        {
            return false;
        }
        float32 local_123 = float32(FVector(local_10[0].Velocity).Size());
        if (local_118.GetInitSpeed() > 1e-8f)
        {
            float32 local_124 = FMath::Max(100.0f, (local_118.GetInitSpeed() * 0.25f));
            if (FMath::Abs((local_123 - local_118.GetInitSpeed())) > local_124)
            {
                return false;
            }
        }
        float32 local_125 = local_118.GetInitSpeed();
        float32 local_124_2 = (local_125 + ((FMath::Abs(local_118.GetGravityScale()) * 980.0f) * FMath::Max(local_118.GetMaxSimTime(), local_121))) * 1.5f;
        float32 local_119_4 = local_124_2 + 100.0f;
        local_124_2 = FMath::Max(1000.0f, local_119_4);
        int local_128 = 1;
        for (; local_128 < local_10.Num(); ++local_128)
        {
            const FKLPredictProjectilePathPointData& local_130 = local_10[local_128 - 1];
            const FKLPredictProjectilePathPointData& local_132 = local_10[local_128];
            float32 local_119_5 = local_132.Time - local_130.Time;
            if (local_119_5 <= 1e-8f)
            {
                return false;
            }
            if ((FVector(local_132.Velocity).Size() > local_124_2 || ((((FVector(local_132.Location) - local_130.Location).Size()) > ((local_124_2 * local_119_5) + 10.0f)))))
            {
                return false;
            }
        }
        return true;
    }
    UFUNCTION()
    void Monitor_TrySendPredictPath(const FECSEntity &inout Entity, const FC_NeedSendThrowPredictPath &inout NeedSendPredictProjectilePath) const
    {
        int local_28 = 0;
        Has local_6;
        if (!(Entity.IsValid()) || !(local_6.opCall()))
        {
            return;
        }
        FECSWorldPtr local_10 = ECS::GetECSWorld();
        ModifyOrAdd local_14;
        FCS_ThrowPredictPathTrace& local_16 = local_14.opCall();
        if (local_16)
        {
            if (local_16.UploadedProjectileKeys.Contains(NeedSendPredictProjectilePath.TargetInfo))
            {
                return;
            }
            FKLPredictProjectilePathResult local_18 = NeedSendPredictProjectilePath.PredictPath;
            if (local_18.PathData.Num() > 0)
            {
                FFPTime local_26 = FFPTime(-1);
                local_28.TargetInfo = NeedSendPredictProjectilePath.TargetInfo;
                local_28.PredictPath = local_18;
                local_16.UploadedProjectileKeys.Add(NeedSendPredictProjectilePath.TargetInfo);
                XLog(ELog(48), FString().Append("ThrowProjectile SendPredictProjectilePath: ").Append(local_18.PathData.Num()));
            }
        }
        return;
    }
    UFUNCTION()
    void Job_ClearNeedSendPredictPath(const FECSEntity &inout Entity, const FC_NeedSendThrowPredictPath &inout NeedSendPredictProjectilePath) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
    UFUNCTION()
    void ServerJob_ReceivePredictPath(const FCE_SendThrowPredictPath &inout Event) const
    {
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (!(local_4.IsValid()))
        {
            return;
        }
        if (!((FECSEntityId(Event.TargetInfo.GetOwnerId()) == local_4.GetId())))
        {
            return;
        }
        FECSEntity local_12;
        if (int(Event.TargetInfo.GetTargetType()) == 1)
        {
            local_12 = FECSEntity(Event.TargetInfo.GetPropEntityId());
            if (!(local_12.IsValid()) || !(Event.TargetInfo.GetProjectileKey().IsNone()))
            {
                return;
            }
        }
        else
        {
            if (int(Event.TargetInfo.GetTargetType()) == 0 && !((FECSEntityId(Event.TargetInfo.GetPropEntityId()) == ENTITY_ID_NULL)))
            {
                return;
            }
        }
        if (int(Event.TargetInfo.GetTargetType()) == 1 && !(this.IsValidReceivedPropPredictPath(local_4, local_12, Event.TargetInfo, Event.PredictPath)))
        {
            return;
        }
        FECSWorldPtr local_26 = ECS::GetECSWorld();
        ModifyOrAdd local_30;
        FCS_ThrowPredictPathTrace& local_32 = local_30.opCall();
        if (local_32)
        {
            local_32.PathTraceResults.Add(Event.TargetInfo, Event.PredictPath);
        }
        XLog(ELog(48), FString().Append("ThrowProjectile ReceivePredictProjectilePath: ").Append(Event.PredictPath.PathData.Num()));
        return;
    }
    UFUNCTION()
    void Monitor_OnStartUpdateThrowPredictPath(const FECSEntity &inout Entity, const FC_UpdateThrowPredictPath &inout UpdateThrowPredictPath) const
    {
        Has local_6;
        if (!(Entity.IsValid()) || !(local_6.opCall()))
        {
            return;
        }
        if (UpdateThrowPredictPath.GetPredictPathConfig())
        {
            Modify local_14;
            FC_ThrowPredictPathView& local_16 = local_14.opCall();
            if (local_16)
            {
                if (local_16.FXEntity.IsValid() && this.IsSameThrowTargetInfo(local_16.TargetInfo, UpdateThrowPredictPath.GetTargetInfo()))
                {
                    return;
                }
                if (local_16.FXEntity.IsValid())
                {
                    ECSFX::StopFX(local_16.FXEntity, true, false, 0.0f);
                    local_16.FXEntity = ENTITY_NULL;
                }
            }
            local_16.TargetInfo = UpdateThrowPredictPath.GetTargetInfo();
            FThrowPredictPathConfig local_10;
            FFXConfig local_138 = local_10.PredictPathFXConfig;
            if (FECSEntity(UpdateThrowPredictPath.GetTargetInfo().GetPropEntityId()).IsValid())
            {
                Get local_150;
                const FC_ThrowMovementConfig& local_152 = local_150.opCall();
                if (local_152)
                {
                    if (local_152.bOverrideSplineFXActor)
                    {
                        local_138.SetAsset(local_152.SplineFXActorClass);
                    }
                }
            }
            local_16.FXEntity = ECSFX::PlayFXDurational(Entity, local_138, ECS::GetContextTime(), 1.0f, false);
            Modify local_158;
            FC_ViewEntityFXData& local_160 = local_158.opCall();
            if (local_160)
            {
                local_160.bTickLifeTime = (false != 0);
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnStopUpdateThrowPredictPath(const FECSEntity &inout Entity, const FC_UpdateThrowPredictPath &inout UpdateThrowPredictPath) const
    {
        Has local_6;
        if (!(Entity.IsValid()) || !(local_6.opCall()))
        {
            return;
        }
        Get local_12;
        const FC_UpdateThrowPredictPath& local_14 = local_12.opCall();
        if (local_14)
        {
            if (this.IsSameThrowTargetInfo(local_14.GetTargetInfo(), UpdateThrowPredictPath.GetTargetInfo()))
            {
                return;
            }
        }
        Get local_18;
        const FC_ThrowPredictPathView& local_20 = local_18.opCall();
        if (local_20)
        {
            if (!(this.IsSameThrowTargetInfo(local_20.TargetInfo, UpdateThrowPredictPath.GetTargetInfo())))
            {
                return;
            }
        }
        this.StopThrowPredictPathView(Entity, UpdateThrowPredictPath.GetTargetInfo(), true);
        return;
    }
    UFUNCTION()
    void ClientJob_StopOrphanedThrowPredictPathView(const FECSEntity &inout Entity, const FC_ThrowPredictPathView &inout PredictPathView) const
    {
        this.StopThrowPredictPathView(Entity, PredictPathView.TargetInfo, false);
        return;
    }
    UFUNCTION()
    void Job_UpdatePredictPathPresentationStop(const FECSEntity &inout Entity, FC_ThrowPredictPathView &inout PredictPathFX, const FC_UpdateThrowPredictPath &inout UpdateThrowPredictPath) const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Get local_6;
        const FCS_ThrowPredictPathTrace& local_8 = local_6.opCall();
        if (local_8)
        {
            if (local_8.UploadedProjectileKeys.Contains(PredictPathFX.TargetInfo))
            {
                if (PredictPathFX.FXEntity.IsValid())
                {
                    ECSFX::StopFX(PredictPathFX.FXEntity, true, false, 0.0f);
                    PredictPathFX.FXEntity = ENTITY_NULL;
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdatePredictPathPresentation(const FECSEntity &inout Entity, FC_ThrowPredictPathView &inout PredictPathFX, const FC_UpdateThrowPredictPath &inout UpdateThrowPredictPath) const
    {
        ASplineFXActor local_20;
        UNiagaraComponent local_34;
        const AActor local_172;
        int local_256 = 0;
        if (!(PredictPathFX.FXEntity.IsValid()))
        {
            return;
        }
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        Get local_8;
        const FCS_ThrowPredictPathTrace& local_10 = local_8.opCall();
        Get local_24;
        if (local_10)
        {
            bool local_113;
            if (local_10.UploadedProjectileKeys.Contains(PredictPathFX.TargetInfo))
            {
                return;
            }
            ECSFX::GetFXViewEntity(PredictPathFX.FXEntity);
            if (local_24.opCall())
            {
                AFXActor local_28;
                local_20 = (Cast<ASplineFXActor>(local_28));
            }
            if ((!((local_20 != nullptr))))
            {
                return;
            }
            local_34 = local_20.EndPointFXComponent;
            if ((local_34 == nullptr) && (int(UpdateThrowPredictPath.GetTargetInfo().GetTargetType()) == 1))
            {
                if (FECSEntity(UpdateThrowPredictPath.GetTargetInfo().GetPropEntityId()).IsValid())
                {
                    Get local_46;
                    const FC_ThrowMovementConfig& local_48 = local_46.opCall();
                    if (local_48)
                    {
                        if (local_48.bOverrideEndPointFXTransform)
                        {
                            local_20.EndPointScale = local_48.EndPointFXOverrideScale;
                            float32 local_49 = local_48.EndPointFXOverrideHeightOffset;
                        }
                    }
                }
            }
            bool local_31 = (int(UpdateThrowPredictPath.GetTargetInfo().GetTargetType()) == 1);
            FKLPredictProjectilePathResult local_80;
            FKLPredictProjectilePathParams local_112;
            local_113 = false;
            FTransform local_140;
            if (int(UpdateThrowPredictPath.GetTargetInfo().GetTargetType()) == 0)
            {
                local_140 = ::FProjectileUtils::GetProjectileSpawnTransform(Entity, ECS::GetContextTime(), UpdateThrowPredictPath.GetFireData(), true, local_113);
            }
            else
            {
                if (local_31)
                {
                    FECSEntity local_42 = FECSEntity(UpdateThrowPredictPath.GetTargetInfo().GetPropEntityId());
                    if (!(local_42.IsValid()))
                    {
                        return;
                    }
                    local_172 = local_42.GetActor();
                    if (local_172 == nullptr)
                    {
                        return;
                    }
                    local_140 = local_172.GetActorTransform();
                }
            }
            if (local_113)
            {
                return;
            }
            FVector3f local_175;
            if (int(UpdateThrowPredictPath.GetTargetInfo().GetTargetType()) == 0)
            {
                local_175 = (FVector3f(local_140.GetRotation().GetForwardVector()) * UpdateThrowPredictPath.GetPredictParams().GetInitSpeed());
            }
            else
            {
                if (!(local_10.PreparedLaunchVelocities.Find(UpdateThrowPredictPath.GetTargetInfo(), local_175)))
                {
                    return;
                }
            }
            local_112.SetProjectileShape(UpdateThrowPredictPath.GetPredictParams().GetShapeInfo());
            local_112.SetProjectileScale(UpdateThrowPredictPath.GetPredictParams().GetCollisionScale());
            local_112.SetGravityScale(UpdateThrowPredictPath.GetPredictParams().GetGravityScale());
            local_112.SetMaxSimTime(UpdateThrowPredictPath.GetPredictParams().GetMaxSimTime());
            local_112.SetSimFrequency(UpdateThrowPredictPath.GetPredictParams().GetSimFrequency());
            local_112.SetbTraceWithCollision(UpdateThrowPredictPath.GetPredictParams().GetbTraceWithCollision());
            local_112.SetStartLocation(local_140.GetLocation());
            local_112.SetStartRotation(local_140.GetRotation());
            local_112.SetLaunchVelocity(local_175);
            TArray<FECSEntity> local_202;
            local_202.Add(Entity);
            Get local_206;
            const FC_InteractionInfoForESM& local_208 = local_206.opCall();
            if (local_208)
            {
                local_202.Add(local_208.GetTargetEntity());
            }
            FProjectileUtils::PredictProjectilePath(Entity, local_112, local_202, local_80, PredictPathFX.ViewPathTraceCache, true);
            TArray<FVector> local_212;
            for (auto& local_226 : local_80.PathData)
            {
                local_212.Add(local_226.Location);
            }
            local_212.Add(::FThrowUtils::GetFinalPredictPathPoint(local_80));
            FVector local_232(local_80.HitLocation);
            FQuat local_184 = FQuat(local_80.HitImpactNormal.ToOrientationRotator().Quaternion());
            local_140 = FTransform(FQuat(local_184), local_232, FVector::OneVector);
            local_20.UpdateSpline(local_212);
            local_20.UpdateEndPoint(local_140);
            if (int(UpdateThrowPredictPath.GetTargetInfo().GetTargetType()) == 0 || (int(UpdateThrowPredictPath.GetTargetInfo().GetTargetType()) == 1))
            {
                FECSWorldPtr local_250 = ECS::GetECSWorld();
                local_256.PathTraceResults.Add(UpdateThrowPredictPath.GetTargetInfo(), local_80);
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_ClearThrowDetachVisualBlendOnAttach(const FECSEntity &inout Entity, const FC_SyncTransformAttachmentPresentation &inout AttachPresentation) const
    {
        if (!(Entity.IsValid()))
        {
            return;
        }
        Has local_6;
        bool local_1 = local_6.opCall();
        if (local_1)
        {
            Remove local_10;
            local_10.opCall();
            Remove local_14;
            local_14.opCall();
        }
        Remove local_18;
        local_18.opCall();
        return;
    }
    UFUNCTION()
    void Monitor_PrepareThrowDetachVisualBlend(const FECSEntity &inout Entity, const FC_SyncTransformAttachmentPresentation &inout AttachPresentation) const
    {
        FThrowTargetInfo local_6;
        int local_22 = 0;
        int local_36 = 0;
        int local_48 = 0;
        Remove local_84;
        Has local_10;
        if ((!(local_10.opCall()) || !(::FThrowUtils::GetMatchedThrowTargetInfo(Entity, local_6, false))) || (int(local_6.GetTargetType()) != 1))
        {
            return;
        }
        if (!(local_22))
        {
            return;
        }
        FECSEntity local_30 = local_22.GetGameActorEntity();
        if (local_36)
        {
        }
        else
        {
        }
        AActor local_40;
        AActor local_42 = local_40;
        if (local_42 == nullptr || !(local_48))
        {
            return;
        }
        FVector local_60 = local_42.GetActorLocation();
        FQuat local_76 = local_42.GetActorQuat();
        Has local_80;
        bool local_13 = local_80.opCall();
        if (local_13)
        {
            local_84.opCall();
            return;
        }
        local_84.opCall();
        FC_ThrowDetachVisualBlendOwnedTag local_108;
        Assign local_106;
        local_106.opCall(local_108);
        FVector local_54 = (local_60 - local_48.GetPosition());
        FC_VisualTransformOffset local_102;
        local_102.PositionOffset = FVector3f(local_54);
        local_102.RotationOffset = FQuat4f((local_76 * local_48.GetRotation().Inverse()));
        local_102.bUseOffsetAsTransformDirectly = false;
        return;
    }
    UFUNCTION()
    void ClientJob_BlendThrowDetachVisualOffset(const FECSEntity &inout Entity, const FCS_LocalTime &inout LocalTime, FC_VisualTransformOffset &inout VisualOffset) const
    {
        float32 local_5 = float32(LocalTime.DeltaTime.ToSeconds());
        if (local_5 <= 0.0f)
        {
            return;
        }
        float32 local_7 = FMath::Min(local_5, 0.033333335f) / 0.2f;
        float32 local_1_2 = VisualOffset.BlendWeight - local_7;
        float32 local_7_2 = VisualOffset.BlendWeight;
        if (local_7_2 <= 0.0f)
        {
            Remove local_14;
            local_14.opCall();
            Remove local_18;
            local_18.opCall();
            return;
        }
        float32 local_7_3 = VisualOffset.BlendWeight;
        float32 local_19 = FMath::Clamp(local_7_3, 0.0f, 1.0f);
        return;
    }
    UFUNCTION()
    void Job_ClearThrowPredictStateOnStableAttach(const FCE_EntityAttachmentOperation &inout Event) const
    {
        int local_16;
        if (!(Event.bIsAttach))
        {
            return;
        }
        FECSEntity local_6 = FECSEntity(Event.Sender);
        if (!(local_6.IsValid()))
        {
            return;
        }
        FECSEntity local_10 = FECSEntity(Event.AttachEvent.GetParent());
        Has local_26;
        if (!(local_10.IsValid()) || !(local_16) || !((FECSEntity(local_16.GetParent()) == local_10)) || !(local_26.opCall()))
        {
            return;
        }
        Get local_30;
        const FC_UpdateThrowPredictPath& local_32 = local_30.opCall();
        if (local_32)
        {
            FThrowTargetInfo local_34 = local_32.GetTargetInfo();
            if (int(local_34.GetTargetType()) == 1 && (FECSEntityId(local_34.GetOwnerId()) == local_10.GetId()) && (FECSEntityId(local_34.GetPropEntityId()) == local_6.GetId()))
            {
                return;
            }
        }
        bool local_1 = ECS::GetRuntimeInfo().IsServer;
        if (local_1)
        {
            local_1 = true;
        }
        else
        {
            Has local_44;
            local_1 = local_44.opCall();
        }
        if (local_1)
        {
            Remove local_48;
            local_48.opCall();
            Remove local_52;
            local_52.opCall();
        }
        FECSWorldPtr local_54 = ECS::GetECSWorld();
        Modify local_58;
        FCS_ThrowPredictPathTrace& local_60 = local_58.opCall();
        if (local_60)
        {
            TArray<FThrowTargetInfo> local_64;
            local_60.PathTraceResults.GetKeys(local_64);
            auto local_70 = local_64.Iterator();
            for (; local_70.CanProceed;)
            {
                FThrowTargetInfo local_34_2 = local_70.Proceed();
                if (int(local_34_2.GetTargetType()) == 1 && (FECSEntityId(local_34_2.GetPropEntityId()) == local_6.GetId()))
                {
                }
            }
            local_64.Empty(0);
            local_60.PreparedPredictPaths.GetKeys(local_64);
            auto local_76 = local_64.Iterator();
            for (; local_76.CanProceed;)
            {
                FThrowTargetInfo local_34_3 = local_76.Proceed();
                if (int(local_34_3.GetTargetType()) == 1 && (FECSEntityId(local_34_3.GetPropEntityId()) == local_6.GetId()))
                {
                }
            }
            local_64.Empty(0);
            local_60.PreparedLaunchVelocities.GetKeys(local_64);
            auto local_70_2 = local_64.Iterator();
            for (; local_70_2.CanProceed;)
            {
                FThrowTargetInfo local_34_4 = local_70_2.Proceed();
                if (int(local_34_4.GetTargetType()) == 1 && (FECSEntityId(local_34_4.GetPropEntityId()) == local_6.GetId()))
                {
                }
            }
            local_64.Empty(0);
            auto local_84 = local_60.UploadedProjectileKeys.Iterator();
            for (; local_84.CanProceed;)
            {
                FThrowTargetInfo local_34_5 = local_84.Proceed();
                if (int(local_34_5.GetTargetType()) == 1 && (FECSEntityId(local_34_5.GetPropEntityId()) == local_6.GetId()))
                {
                    local_64.Add(local_34_5);
                }
            }
            auto local_76_2 = local_64.Iterator();
            for (; local_76_2.CanProceed;)
            {
                FThrowTargetInfo local_34_6 = local_76_2.Proceed();
            }
        }
        return;
    }
    UFUNCTION()
    void Job_HandlePropDetachFromEntity(const FCE_EntityAttachmentOperation &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_TryMatchPendingPropPredictPath(const FECSEntity &inout Entity, const FC_MovementInfo &inout MovementInfo, const FC_ThrowPredictPathKey &inout ThrowPathKey) const
    {
        Has local_6;
        if ((((!(ECS::GetRuntimeInfo().IsServer) && !(local_6.opCall())) || (int(ThrowPathKey.GetKeyInfo().GetTargetType()) != 1)) || !((FECSEntityId(ThrowPathKey.GetKeyInfo().GetPropEntityId()) == Entity.GetId()))) || (FFPTime(MovementInfo.GetMoveTime()).opCmp(0.0) > 0))
        {
            return;
        }
        FECSWorldPtr local_18 = ECS::GetECSWorld();
        Get local_22;
        const FCS_ThrowPredictPathTrace& local_24 = local_22.opCall();
        if (local_24)
        {
            FKLPredictProjectilePathResult local_54;
            if (local_24.PathTraceResults.Find(ThrowPathKey.GetKeyInfo(), local_54))
            {
                ::FThrowUtils::MatchPredictPath(Entity);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_HandleBeginInteractThrowProjectile(const FCE_BeginInteractEvent &inout Event) const
    {
        Has local_10;
        if (!(FECSEntity(Event.Sender).IsValid()) || !(local_10.opCall()))
        {
            return;
        }
        Get local_16;
        const FC_InteractionInfoForESM& local_18 = local_16.opCall();
        if (local_18)
        {
            if (!(FECSEntity(local_18.GetTargetEntity()).IsValid()))
            {
                return;
            }
            Get local_26;
            if (local_26.opCall())
            {
                ECS::GetContextTime();
                FNameHandle_EntityBBVarInt local_36;
                local_36;
            }
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_TrySendPredictPath() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorNeedSendThrowPredictPathOnActiveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_TrySendPredictPath(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearNeedSendPredictPath() const
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
                this.Job_ClearNeedSendPredictPath(local_36, local_38);
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
            this.Job_ClearNeedSendPredictPath(local_162, local_38);
        }
        local_2.UpdateCachedEntityCount(local_90);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_ReceivePredictPath() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_SendThrowPredictPath> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_SendThrowPredictPath& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_ReceivePredictPath(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnStartUpdateThrowPredictPath() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorUpdateThrowPredictPathOnActiveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnStartUpdateThrowPredictPath(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnStopUpdateThrowPredictPath() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorUpdateThrowPredictPathOnInactiveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnStopUpdateThrowPredictPath(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_StopOrphanedThrowPredictPathView() const
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
                this.ClientJob_StopOrphanedThrowPredictPathView(local_36, local_38);
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
            this.ClientJob_StopOrphanedThrowPredictPathView(local_170, local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdatePredictPathPresentationStop() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        MarkModifiedIfDirty local_52;
        int local_180 = 0;
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
                this.Job_UpdatePredictPathPresentationStop(local_36, local_38, local_44);
                local_52.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Exclude(local_90).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_90.Iterator();
        for (; local_142.CanProceed;)
        {
            local_36 = local_142.Proceed();
            ++local_108;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_UpdatePredictPathPresentationStop(local_180, local_38, local_44);
            local_52.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_108);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdatePredictPathPresentation() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        MarkModifiedIfDirty local_52;
        int local_180 = 0;
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
                this.Job_UpdatePredictPathPresentation(local_36, local_38, local_44);
                local_52.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Exclude(local_90).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_90.Iterator();
        for (; local_142.CanProceed;)
        {
            local_36 = local_142.Proceed();
            ++local_108;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_UpdatePredictPathPresentation(local_180, local_38, local_44);
            local_52.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_108);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ClearThrowDetachVisualBlendOnAttach() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorSyncTransformAttachmentPresentationOnActiveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ClearThrowDetachVisualBlendOnAttach(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_PrepareThrowDetachVisualBlend() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorSyncTransformAttachmentPresentationOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_PrepareThrowDetachVisualBlend(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_BlendThrowDetachVisualOffset() const
    {
        int local_12 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        MarkModifiedIfDirty local_56;
        int local_188 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        int local_18 = 0;
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
                this.ClientJob_BlendThrowDetachVisualOffset(local_46, local_12, local_48);
                local_56.opCall(local_48);
            }
            local_2.UpdateCachedEntityCount(local_23);
            return;
        }
        FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Exclude(local_94).opCall();
        Exclude(local_94).opCall();
        Exclude(local_94).opCall();
        bool local_9 = local_2.BeginViewCacheBuild();
        int local_24 = local_2.GetViewCacheEpoch();
        int local_116 = 0;
        FECSRuntimeViewIterator local_150 = local_94.Iterator();
        for (; local_150.CanProceed;)
        {
            local_46 = local_150.Proceed();
            ++local_116;
            if (local_9)
            {
                local_2.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.ClientJob_BlendThrowDetachVisualOffset(local_188, local_12, local_48);
            local_56.opCall(local_48);
        }
        local_2.UpdateCachedEntityCount(local_116);
        if (local_9)
        {
            local_2.CommitViewCacheBuild(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearThrowPredictStateOnStableAttach() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EntityAttachmentOperation> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EntityAttachmentOperation& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_ClearThrowPredictStateOnStableAttach(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandlePropDetachFromEntity() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EntityAttachmentOperation> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EntityAttachmentOperation& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandlePropDetachFromEntity(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TryMatchPendingPropPredictPath() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_180 = 0;
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
                this.Job_TryMatchPendingPropPredictPath(local_36, local_38, local_44);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        local_94.opCall();
        Exclude(local_86).opCall();
        Exclude(local_86).opCall();
        Exclude(local_86).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_86.Iterator();
        for (; local_142.CanProceed;)
        {
            local_36 = local_142.Proceed();
            ++local_108;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_TryMatchPendingPropPredictPath(local_180, local_38, local_44);
        }
        local_2.UpdateCachedEntityCount(local_108);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleBeginInteractThrowProjectile() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_BeginInteractEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_BeginInteractEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleBeginInteractThrowProjectile(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}


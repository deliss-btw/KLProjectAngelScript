

class US_BorderSystemAS : UECSScriptSystem
{
    float32 RevivePointSearchDistance = 500.0f;
    float32 BorderPeriodCheckInterval = 0.5f;
    float32 DynamicMeshUpdateInterval = 2.0f;


    UFUNCTION()
    void ClientJob_PeriodCheckRelevantBorder(const FECSEntity &inout Entity, const FC_RelevantBorders &inout RelevantBorders, const FCS_FixedTime &inout FixedTime) const
    {
        int local_6 = 0;
        bool local_19;
        AKLBorderActor local_34;
        int local_56 = 0;
        Has local_60;
        int local_82 = 0;
        for (auto& local_22 : RelevantBorders.GetBorders())
        {
            if (!(local_22.IsValid()))
            {
                continue;
            }
            if (!(this.IsInWarningDistance(Entity, local_22)))
            {
                continue;
            }
            Get local_26;
            const FC_BorderActor& local_28 = local_26.opCall();
            if (local_28)
            {
                if (!(local_28.Border.IsValid()))
                {
                    continue;
                }
                AKLBorder local_30;
                local_34 = Cast<AKLBorderActor>(local_30);
                if (local_34 != nullptr)
                {
                    FFPTime& local_36 = local_6.ActivateTimes.FindOrAdd(local_22);
                    if (int(local_34.WarningType) == 0)
                    {
                        if (FFPTime(FixedTime.Time).opCmp((local_36 + FFPTime(local_34.WarningInterval))) < 0)
                        {
                            continue;
                        }
                        FFPTime local_42 = FFPTime(-1);
                        local_56.BorderEntity = local_22;
                        local_36 = FixedTime.Time;
                    }
                    else
                    {
                        if (int(local_34.WarningType) == 1)
                        {
                            local_19 = local_60.opCall();
                            if (local_19)
                            {
                                continue;
                            }
                            FFPTime local_48 = FFPTime(-1);
                            local_56.BorderEntity = local_22;
                            local_36 = FixedTime.Time;
                            FC_BorderWarningPendingDeactivateTag local_66;
                            Assign local_64;
                            local_64.opCall(local_66);
                        }
                    }
                }
            }
        }
        FECSWorldPtr local_68 = ECS::GetECSWorld();
        Get local_72;
        const FCS_ActiveBorders& local_74 = local_72.opCall();
        if (local_74)
        {
            for (auto& local_22 : local_74.GetBorderEntities())
            {
                if (!(local_22.IsValid()))
                {
                    continue;
                }
                if (RelevantBorders.GetBorders().Contains(local_22) && this.IsInWarningDistance(Entity, local_22))
                {
                    continue;
                }
                local_19 = local_60.opCall();
                if (local_19)
                {
                    FFPTime local_50 = FFPTime(-1);
                    local_82.BorderEntity = local_22;
                    Remove local_86;
                    local_86.opCall();
                }
            }
        }
        return;
    }
    FVector UpdateDynamicMeshInterpPosition(FBorderDynamicMeshInterpData &inout InterpData, const FVector &inout RealTarget, const float32 DeltaTime, const float32 InterpSpeed, const FRuntimeFloatCurve &inout InterpCurve, const float32 InterpThreshold, const EBorderDynamicMeshInterpMode InterpMode) const
    {
        float32 local_5;
        float32 local_13;
        float32 local_14;
        bool local_4 = (int(InterpMode) == 1);
        if (local_4)
        {
            local_5 = float32((FMath::Abs((InterpData.TargetPos.Z - RealTarget.Z))));
        }
        else
        {
            float local_8_2 = InterpData.TargetPos.Distance(RealTarget);
            local_5 = float32(local_8_2);
        }
        if (InterpData.bCompleted && (local_5 < InterpThreshold))
        {
            if (local_4)
            {
                InterpData.CurrentPos.X = RealTarget.X;
                InterpData.CurrentPos.Y = RealTarget.Y;
            }
            return InterpData.CurrentPos;
        }
        if (local_5 >= InterpThreshold || InterpData.bCompleted)
        {
            InterpData.StartPos = InterpData.CurrentPos;
            InterpData.TargetPos = RealTarget;
            if (local_4)
            {
                float local_8_3 = FMath::Abs((InterpData.StartPos.Z - RealTarget.Z));
                local_13 = float32(local_8_3);
            }
            else
            {
                float local_8_4 = InterpData.StartPos.Distance(RealTarget);
                local_13 = float32(local_8_4);
            }
            if (InterpSpeed > 0.0f)
            {
                local_14 = local_13 / InterpSpeed;
            }
            else
            {
                local_14 = 0.0f;
            }
            InterpData.Duration = local_14;
            InterpData.ElapsedTime = 0.0f;
            InterpData.bCompleted = false;
        }
        float32 local_11_2 = InterpData.ElapsedTime;
        InterpData.ElapsedTime = (local_11_2 + DeltaTime);
        if (InterpData.Duration <= 0.0f)
        {
            InterpData.CurrentPos = InterpData.TargetPos;
            InterpData.bCompleted = true;
            return InterpData.CurrentPos;
        }
        local_14 = InterpData.ElapsedTime;
        local_14 = local_14 / InterpData.Duration;
        local_11_2 = FMath::Clamp(local_14, 0.0f, 1.0f);
        local_13 = InterpCurve.GetFloatValue(local_11_2, 0.0f);
        if (local_4)
        {
            InterpData.CurrentPos.X = RealTarget.X;
            InterpData.CurrentPos.Y = RealTarget.Y;
            InterpData.CurrentPos.Z = FMath::Lerp(InterpData.StartPos.Z, InterpData.TargetPos.Z, local_13);
        }
        else
        {
            InterpData.CurrentPos = FMath::Lerp(InterpData.StartPos, InterpData.TargetPos, local_13);
        }
        if (local_11_2 >= 1.0f)
        {
            InterpData.bCompleted = true;
        }
        return InterpData.CurrentPos;
    }
    UFUNCTION()
    void ClientJob_UpdateBorderDynamicMesh(const FECSEntity &inout Entity, const FC_RelevantBorders &inout RelevantBorders, const FC_Transform &inout Transform, const FCS_FixedTime &inout FixedTime) const
    {
        int local_22 = 0;
        Get local_40;
        AKLBorder local_44;
        AKLBorderActor local_48;
        FECSEntity local_8 = ::FASCommonUtils::GetUniquePlayerEntity(Entity);
        if (!(local_8.IsValid()))
        {
            return;
        }
        float32 local_15 = float32(ECS::GetContextDeltaTime().ToSeconds());
        for (auto& local_36 : RelevantBorders.GetBorders())
        {
            if (!(local_36.IsValid()))
            {
                continue;
            }
            const FC_BorderActor& local_42 = local_40.opCall();
            if (local_42)
            {
                if (!(local_42.Border.IsValid()))
                {
                    continue;
                }
                local_48 = Cast<AKLBorderActor>(local_44);
                if (local_48 != nullptr)
                {
                    FVector local_54 = Transform.GetPosition();
                    if (local_48.bEnableDynamicMeshInterp)
                    {
                        FBorderDynamicMeshInterpData& local_56 = local_22.InterpData.FindOrAdd(local_36);
                        if (local_56.bCompleted && local_56.CurrentPos.IsZero())
                        {
                            local_56.CurrentPos = Transform.GetPosition();
                            local_56.TargetPos = Transform.GetPosition();
                        }
                        local_54 = this.UpdateDynamicMeshInterpPosition(local_56, Transform.GetPosition(), local_15, local_48.DynamicMeshInterpSpeed, local_48.DynamicMeshInterpCurve, int(local_48.DynamicMeshInterpThreshold), local_48.DynamicMeshInterpMode);
                    }
                    local_48.CreateDynamicMesh(local_8.GetEntityName(), local_54);
                }
            }
        }
        FECSWorldPtr local_70 = ECS::GetECSWorld();
        Get local_74;
        const FCS_ActiveBorders& local_76 = local_74.opCall();
        if (local_76)
        {
            for (auto& local_36 : local_76.GetBorderEntities())
            {
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                if (RelevantBorders.GetBorders().Contains(local_36))
                {
                    continue;
                }
                const FC_BorderActor& local_42_2 = local_40.opCall();
                if (local_42_2)
                {
                    if (!(local_42_2.Border.IsValid()))
                    {
                        continue;
                    }
                    local_48 = Cast<AKLBorderActor>(local_44);
                    if (local_48 != nullptr)
                    {
                        local_48.ClearDynamicMesh(local_8.GetEntityName());
                        if (!(local_48.HasDynamicMesh(local_8.GetEntityName())))
                        {
                        }
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnRelevantBorderAssigned(const FECSEntity &inout Entity, const FC_RelevantBorders &inout RelevantBorders) const
    {
        Has local_4;
        AKLBorderActor local_46;
        int local_60 = 0;
        Has local_10;
        if (!(local_4.opCall()) && !(local_10.opCall()))
        {
            return;
        }
        FECSEntity local_20 = ::FASCommonUtils::GetUniquePlayerEntity(Entity);
        if (!(local_20.IsValid()))
        {
            return;
        }
        for (auto& local_34 : RelevantBorders.GetBorders())
        {
            if (!(local_34.IsValid()))
            {
                continue;
            }
            Get local_38;
            const FC_BorderActor& local_40 = local_38.opCall();
            if (local_40)
            {
                if (!(local_40.Border.IsValid()))
                {
                    continue;
                }
                AKLBorder local_42;
                local_46 = Cast<AKLBorderActor>(local_42);
                if (local_46 != nullptr)
                {
                    Get local_50;
                    const FC_Transform& local_52 = local_50.opCall();
                    if (local_52)
                    {
                        if (!(local_46.bEnableDynamicMeshInterp))
                        {
                            local_46.CreateDynamicMesh(local_20.GetEntityName(), local_52.GetPosition());
                        }
                        else
                        {
                            bool local_11 = local_46.HasDynamicMesh(local_20.GetEntityName());
                            bool local_5 = local_60.InterpData.Contains(local_34);
                            if ((local_11 && local_5))
                            {
                                local_46.CreateDynamicMesh(local_20.GetEntityName(), local_60.InterpData.FindOrAdd(local_34).CurrentPos);
                            }
                            else
                            {
                                FVector local_70 = local_52.GetPosition();
                                FBorderDynamicMeshInterpData& local_64 = local_60.InterpData.FindOrAdd(local_34);
                                local_64.CurrentPos = local_70;
                                local_64.StartPos = local_70;
                                local_64.TargetPos = local_70;
                                local_64.ElapsedTime = 0.0f;
                                local_64.Duration = 0.0f;
                                local_64.bCompleted = true;
                                local_46.CreateDynamicMesh(local_20.GetEntityName(), local_70);
                            }
                        }
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnRelevantBorderRemoved(const FECSEntity &inout Entity, const FC_RelevantBorders &inout RelevantBorders) const
    {
        Has local_4;
        int local_56 = 0;
        AKLBorderActor local_72;
        Has local_10;
        if (!(local_4.opCall()) && !(local_10.opCall()))
        {
            return;
        }
        FECSEntity local_20 = ::FASCommonUtils::GetUniquePlayerEntity(Entity);
        if (!(local_20.IsValid()))
        {
            return;
        }
        FECSWorldPtr local_22 = ECS::GetECSWorld();
        Get local_26;
        const FCS_ActiveBorders& local_28 = local_26.opCall();
        if (local_28)
        {
            for (auto& local_42 : local_28.GetBorderEntities())
            {
                if (!(local_42.IsValid()))
                {
                    continue;
                }
                Has local_46;
                bool local_11 = local_46.opCall();
                if (local_11)
                {
                    FFPTime local_52 = FFPTime(-1);
                    local_56.BorderEntity = local_42;
                    Remove local_60;
                    local_60.opCall();
                }
                Get local_64;
                const FC_BorderActor& local_66 = local_64.opCall();
                if (local_66)
                {
                    if (!(local_66.Border.IsValid()))
                    {
                        continue;
                    }
                    AKLBorder local_68;
                    local_72 = Cast<AKLBorderActor>(local_68);
                    if (local_72 != nullptr)
                    {
                        local_72.ClearDynamicMesh(local_20.GetEntityName());
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_HandleActivateWarningAudioVo(const FCE_ActivateBorderWarningEffect &inout Event) const
    {
        AKLBorderActor local_14;
        Get local_4;
        const FC_BorderActor& local_6 = local_4.opCall();
        if (local_6)
        {
            if (!(local_6.Border.IsValid()))
            {
                return;
            }
            AKLBorder local_10;
            local_14 = (Cast<AKLBorderActor>(local_10));
            if (local_14 != nullptr)
            {
                ::FAudioVoUtils::SendAudioVoEventOnlyPresentation(local_14.SoundVO.GetDataName(), Event.Sender, FFPTime(-1));
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_HandleActivateWarningMessageHint(const FCE_ActivateBorderWarningEffect &inout Event) const
    {
        AKLBorderActor local_14;
        Get local_4;
        const FC_BorderActor& local_6 = local_4.opCall();
        if (local_6)
        {
            if (!(local_6.Border.IsValid()))
            {
                return;
            }
            AKLBorder local_10;
            local_14 = (Cast<AKLBorderActor>(local_10));
            if (local_14 != nullptr)
            {
                if (local_14.MessageHint)
                {
                    ::MessageHintUtils::ShowMessageHint(Event.Sender, local_14.MessageHint, TArray<FTextArgument>());
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_HandleActivateWarningFX(const FCE_ActivateBorderWarningEffect &inout Event) const
    {
        AKLBorderActor local_14;
        int local_154 = 0;
        Get local_4;
        const FC_BorderActor& local_6 = local_4.opCall();
        if (local_6)
        {
            if (!(local_6.Border.IsValid()))
            {
                return;
            }
            AKLBorder local_10;
            local_14 = (Cast<AKLBorderActor>(local_10));
            if (local_14 != nullptr)
            {
                ECS::GetContextTime();
                if (int(local_14.WarningType) == 0)
                {
                    bool local_7 = !(local_14.bInstantFX) && false;
                }
                else
                {
                    if (int(local_14.WarningType) == 1)
                    {
                        FECSEntity local_144;
                        local_154.FXEntities.Add(local_144);
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_HandleDeactivateWarningFX(const FCE_DeactivateBorderWarningEffect &inout Event) const
    {
        AKLBorderActor local_14;
        Get local_4;
        const FC_BorderActor& local_6 = local_4.opCall();
        if (local_6)
        {
            if (!(local_6.Border.IsValid()))
            {
                return;
            }
            AKLBorder local_10;
            local_14 = (Cast<AKLBorderActor>(local_10));
            if (local_14 != nullptr)
            {
                if (int(local_14.WarningType) != 1)
                {
                    return;
                }
                Get local_22;
                const FC_BorderActivatingWarningFX& local_24 = local_22.opCall();
                if (local_24)
                {
                    for (auto& local_38 : local_24.FXEntities)
                    {
                        if (!(local_38.IsValid()))
                        {
                            continue;
                        }
                        ECSFX::StopFX(local_38, false, false, 0.0f);
                    }
                    Remove local_44;
                    local_44.opCall();
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_UpdateBorderMaterial(const FECSEntity &inout Entity, const FC_RelevantBorders &inout RelevantBorders, const FCS_FixedTime &inout FixedTime) const
    {
        AKLBorderActor local_28;
        for (auto& local_16 : RelevantBorders.GetBorders())
        {
            if (!(local_16.IsValid()))
            {
                continue;
            }
            Get local_20;
            const FC_BorderActor& local_22 = local_20.opCall();
            if (local_22)
            {
                if (!(local_22.Border.IsValid()))
                {
                    continue;
                }
                AKLBorder local_24;
                local_28 = Cast<AKLBorderActor>(local_24);
                if (local_28 != nullptr)
                {
                    TArray<FSingleMaterialParamRequestData> local_32;
                    this.CalculateBorderMaterialParams(local_28, Entity, local_32);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_HandleBorderFadingIn(const FCE_BorderCreatedView &inout Event) const
    {
        AKLBorderActor local_18;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (!(local_4.IsValid()))
        {
            return;
        }
        Get local_10;
        const FC_BorderActor& local_12 = local_10.opCall();
        if (local_12)
        {
            if (!(local_12.Border.IsValid()))
            {
                return;
            }
            AKLBorder local_14;
            local_18 = (Cast<AKLBorderActor>(local_14));
            if (local_18 != nullptr)
            {
                if (!(local_18.FadingInMaterial.IsEmpty()))
                {
                    ::FMaterialUtils::LocalOnlyRequestChangeMaterialParam(local_4, FName("UpdateBorderFadingInMaterial"), local_18.FadingInMaterial);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_HandleBorderFadingOut(const FCE_BorderDestroyView &inout Event) const
    {
        AKLBorderActor local_18;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (!(local_4.IsValid()))
        {
            return;
        }
        Get local_10;
        const FC_BorderActor& local_12 = local_10.opCall();
        if (local_12)
        {
            if (!(local_12.Border.IsValid()))
            {
                return;
            }
            AKLBorder local_14;
            local_18 = (Cast<AKLBorderActor>(local_14));
            if (local_18 != nullptr)
            {
                if (!(local_18.FadingOutMaterial.IsEmpty()))
                {
                    ::FMaterialUtils::LocalOnlyRequestChangeMaterialParam(local_4, FName("UpdateBorderFadingOutMaterial"), local_18.FadingOutMaterial);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_ServerOnSyncBorderDestroyAssign(const FECSEntity &inout Entity, const FC_SyncBorderDestroy &inout SyncBorderDestroy) const
    {
        AKLBorderActor local_18;
        if (!(FECSEntity(SyncBorderDestroy.GetBorderEntity()).IsValid()))
        {
            return;
        }
        Get local_10;
        const FC_BorderActor& local_12 = local_10.opCall();
        if (local_12)
        {
            if (!(local_12.Border.IsValid()))
            {
                return;
            }
            AKLBorder local_14;
            local_18 = (Cast<AKLBorderActor>(local_14));
            if (local_18 != nullptr)
            {
                local_18.DeferredDestroyIfNeed();
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_ClientOnSyncBorderDestroyAssign(const FECSEntity &inout Entity, const FC_SyncBorderDestroy &inout SyncBorderDestroy) const
    {
        AKLBorderActor local_26;
        if (!(FECSEntity(SyncBorderDestroy.GetBorderEntity()).IsValid()))
        {
            return;
        }
        SendEvent local_10;
        local_10.opCall(FFPTime(-1));
        Get local_18;
        const FC_BorderActor& local_20 = local_18.opCall();
        if (local_20)
        {
            if (!(local_20.Border.IsValid()))
            {
                return;
            }
            AKLBorder local_22;
            local_26 = (Cast<AKLBorderActor>(local_22));
            if (local_26 != nullptr)
            {
                local_26.DeferredDestroyIfNeed();
            }
        }
        return;
    }
    UFUNCTION()
    void Job_HandleBorderDestroy(const FCE_DestroyBorder &inout Event) const
    {
        int local_18 = 0;
        FECSEntity local_4 = FECSEntity(Event.BorderEntity);
        if (!(local_4.IsValid()))
        {
            return;
        }
        local_18.SetBorderEntity(local_4);
        return;
    }
    UFUNCTION()
    void ServerJob_HandleBorderRelationChanged(const FCE_BorderRelationChanged &inout Event) const
    {
        Get local_24;
        AKLBorderActor local_66;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FVector local_16(FVector::ZeroVector);
        Has local_20;
        bool local_9 = local_20.opCall();
        if (local_9)
        {
            local_16 = local_24.opCall().GetPosition();
        }
        float32 local_25 = this.RevivePointSearchDistance;
        float32 local_27 = 1000.0f;
        TArray<FECSEntity> local_32 = ::TeleporterUtils::GetActiveTeleporterEntities(local_4);
        bool local_37 = false;
        for (auto& local_52 : local_32)
        {
            local_52;
            if (!(local_20.opCall()))
            {
                continue;
            }
            FVector local_58 = local_24.opCall().GetPosition();
            if (local_16.Dist2D(local_58) <= local_25 && (FMath::Abs((local_16.Z - local_58.Z)) <= local_27))
            {
                local_37 = true;
                break;
            }
        }
        if (!(local_37))
        {
            EKLBorderAcrossTeleportMode local_77;
            if (Event.Border.IsValid())
            {
                Get local_70;
                const FC_BorderActor& local_72 = local_70.opCall();
                if (local_72)
                {
                    if (local_72.Border.IsValid())
                    {
                        AKLBorder local_74;
                        local_66 = (Cast<AKLBorderActor>(local_74));
                    }
                }
            }
            local_77 = EKLBorderAcrossTeleportMode(0);
            if (local_66 != nullptr)
            {
                local_77 = local_66.AcrossTeleportMode;
            }
            if ((int(local_77)) == 1)
            {
                bool local_9_3 = local_66 != nullptr && !(Event.NewRelation);
                if (!(local_9_3))
                {
                    local_9_3 = false;
                }
                else
                {
                    Has local_84;
                    local_9_3 = local_84.opCall();
                }
                if (local_9_3)
                {
                    int local_85 = 1112014848;
                    FKLBorderQueryInfo local_112;
                    local_112.InAgentLocation = local_16;
                    Get local_116;
                    float32 local_26 = local_116.opCall().GetScaledRadius() + 50.0f;
                    float32 local_118 = FMath::Max(local_66.GetRelevantDistance(), (local_112.InAgentRadius + 1.0f));
                    local_66.Query(local_112);
                    if (!(local_112.OutIsInside))
                    {
                        FCE_TeleportToLocationRequest local_132;
                        Has local_124;
                        bool local_9_4 = local_124.opCall();
                        FFPTime local_130 = FFPTime(-1);
                        local_132.Location = local_112.OutAgentLocationInBorder;
                        GetDefaulted local_136;
                        local_132.Rotation = FRotator(local_136.opCall().GetRotation());
                        local_132.bShowBlackScreen = local_9_4;
                        local_132.bBlockInput = local_9_4;
                    }
                }
            }
            else
            {
                FCE_Event_ReviveTeleport local_144;
                FFPTime local_130_2 = FFPTime(-1);
                local_144.CustomName = n"BorderRelationChangedTeleport";
                local_144.ReviveType = EReviveType(2);
            }
        }
        return;
    }
    void CalculateWarningFXParams(const AKLBorderActor BorderActor, const FECSEntity &inout Entity, FFXConfig &inout OutFXConfig) const
    {
        int local_8 = 0;
        int local_14 = 0;
        if (!(Entity.IsValid()))
        {
            return;
        }
        if ((!(local_8) || !(local_14)))
        {
            return;
        }
        FKLBorderQueryInfo local_42;
        local_42.InAgentLocation = local_8.GetPosition();
        BorderActor.Query(local_42);
        FVector local_50(local_42.OutClosestBorderPoint);
        local_50.Z = (local_8.GetPosition().Z + (local_14.GetScaledHalfHeight() * 0.5f));
        FFXParamValueVector local_62;
        local_62.Value = local_50;
        FFXOverrideParam local_68;
        local_68.ParamName = FName("RecentLocation");
        local_68.ParamValue = FInstancedStruct::Make(local_62);
        OutFXConfig.GetModify_OverrideParams().Add(local_68);
        return;
    }
    void CalculateBorderMaterialParams(const AKLBorderActor BorderActor, const FECSEntity &inout Entity, TArray<FSingleMaterialParamRequestData> &inout OutMaterialParams) const
    {
        int local_8 = 0;
        int local_14 = 0;
        if (!((BorderActor != nullptr)) || !(Entity.IsValid()))
        {
            return;
        }
        if (!(local_8) || !(local_14))
        {
            return;
        }
        FKLBorderQueryInfo local_40;
        local_40.InAgentLocation = local_8.GetPosition();
        BorderActor.Query(local_40);
        FVector local_48(local_40.OutClosestBorderPoint);
        float local_52 = local_8.GetPosition().Z;
        float32 local_41_3 = local_14.GetScaledHalfHeight() * 0.5f;
        local_52 = local_52 + local_41_3;
        local_48.Z = local_52;
        float32 local_55 = 0.0f;
        float32 local_56 = 0.0f;
        BorderActor.GetPercentAlongSplineAtLocation(local_48, local_55, local_56, Entity.GetEntityName());
        UWorld local_60 = ECS::GetUEWorld();
        float32 local_63 = BorderActor.BlockMaterialEffectDuration;
        if (local_60 != nullptr)
        {
            local_41_3 = float32((local_60.GetTimeSeconds() + local_63));
        }
        else
        {
            local_41_3 = 0.0f;
        }
        TMap<FName, float32> local_84;
        local_84.Add(FName("ShortestU"), local_55);
        local_84.Add(FName("ShortestV"), local_56);
        local_84.Add(FName("EndTime"), local_41_3);
        local_84.Add(FName("Duration"), local_63);
        TMap<FName, FVector> local_104;
        local_104.Add(FName("PlayerWorldPosition"), local_8.GetPosition());
        BorderActor.UpdateMaterialParams(local_84, local_104);
        return;
    }
    bool IsInWarningDistance(const FECSEntity &inout PawnEntity, const FECSEntity &inout BorderEntity) const
    {
        AKLBorderActor local_20;
        if (!(PawnEntity.IsValid()) || !(BorderEntity.IsValid()))
        {
            return false;
        }
        Get local_6;
        const FC_Transform& local_8 = local_6.opCall();
        if (local_8)
        {
            Get local_12;
            const FC_BorderActor& local_14 = local_12.opCall();
            if (local_14)
            {
                if (!(local_14.Border.IsValid()))
                {
                    return false;
                }
                AKLBorder local_16;
                local_20 = (Cast<AKLBorderActor>(local_16));
                if (local_20 != nullptr)
                {
                    return (local_8.GetPosition().Dist2D(local_20.GetClosestLocationOnSpline(local_8.GetPosition())) <= local_20.WarningDistance);
                }
            }
        }
        return false;
    }
    UFUNCTION()
    void Run_ClientJob_PeriodCheckRelevantBorder() const
    {
        int local_14 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_180 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(this.GetECSRuntime().IsOnInterval(FFPTime(this.BorderPeriodCheckInterval))))
        {
            return;
        }
        int local_16 = 0;
        int local_15 = local_16;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_18 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_22 = local_4.GetViewCacheEntities();
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
                this.ClientJob_PeriodCheckRelevantBorder(local_46, local_48, local_14);
            }
            local_4.UpdateCachedEntityCount(local_23);
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
        bool local_11 = local_4.BeginViewCacheBuild();
        int local_24 = local_4.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_90.Iterator();
        for (; local_142.CanProceed;)
        {
            local_46 = local_142.Proceed();
            ++local_108;
            if (local_11)
            {
                local_4.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.ClientJob_PeriodCheckRelevantBorder(local_180, local_48, local_14);
        }
        local_4.UpdateCachedEntityCount(local_108);
        if (local_11)
        {
            local_4.CommitViewCacheBuild(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_UpdateBorderDynamicMesh() const
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
                this.ClientJob_UpdateBorderDynamicMesh(local_40, local_42, local_48, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Exclude(local_90).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_112 = 0;
        FECSRuntimeViewIterator local_146 = local_90.Iterator();
        for (; local_146.CanProceed;)
        {
            local_40 = local_146.Proceed();
            ++local_112;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ClientJob_UpdateBorderDynamicMesh(local_184, local_42, local_48, local_6);
        }
        local_4.UpdateCachedEntityCount(local_112);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnRelevantBorderAssigned() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorRelevantBordersOnAssignView(EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnRelevantBorderAssigned(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnRelevantBorderRemoved() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorRelevantBordersOnRemoveView(EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnRelevantBorderRemoved(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleActivateWarningAudioVo() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ActivateBorderWarningEffect> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ActivateBorderWarningEffect& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleActivateWarningAudioVo(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleActivateWarningMessageHint() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ActivateBorderWarningEffect> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ActivateBorderWarningEffect& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleActivateWarningMessageHint(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleActivateWarningFX() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ActivateBorderWarningEffect> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ActivateBorderWarningEffect& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleActivateWarningFX(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleDeactivateWarningFX() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DeactivateBorderWarningEffect> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DeactivateBorderWarningEffect& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleDeactivateWarningFX(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_UpdateBorderMaterial() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
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
                this.ClientJob_UpdateBorderMaterial(local_40, local_42, local_6);
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
            local_40 = local_128.Proceed();
            ++local_94;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ClientJob_UpdateBorderMaterial(local_166, local_42, local_6);
        }
        local_4.UpdateCachedEntityCount(local_94);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleBorderFadingIn() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_BorderCreatedView> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_BorderCreatedView& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleBorderFadingIn(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleBorderFadingOut() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_BorderDestroyView> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_BorderDestroyView& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleBorderFadingOut(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ServerOnSyncBorderDestroyAssign() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorSyncBorderDestroyOnAssignView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ServerOnSyncBorderDestroyAssign(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ClientOnSyncBorderDestroyAssign() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorSyncBorderDestroyOnAssignView(EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ClientOnSyncBorderDestroyAssign(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleBorderDestroy() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DestroyBorder> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DestroyBorder& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleBorderDestroy(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleBorderRelationChanged() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_BorderRelationChanged> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_BorderRelationChanged& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleBorderRelationChanged(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}


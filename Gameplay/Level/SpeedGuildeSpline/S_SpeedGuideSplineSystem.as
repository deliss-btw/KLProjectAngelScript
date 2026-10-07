

class US_SpeedGuideSpineSystem : UECSScriptSystem
{
    US_SpeedGuideSpineSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_TickRemoveInactive(const FECSEntity &inout Entity, FC_CharacterSpeedGuideSpline &inout CharacterSpeedGuideSpline) const
    {
        ASpeedGuideSplinePrefab local_8;
        if (!(Entity.IsActive()))
        {
            FECSEntity local_6 = FECSEntity(CharacterSpeedGuideSpline.GetSpeedGuideSplineEntity());
            if (local_6)
            {
                local_8 = (Cast<ASpeedGuideSplinePrefab>(ULevelActorManager::Get().GetInLevelPrefabByEntity(local_6)));
                if (local_8 != nullptr && local_8.BuffConfig.IsValid())
                {
                    FBuffUtils::RemoveBuff(Entity, local_8.BuffConfig, this.GetECSRuntime().Time, EBuffEndType(0));
                }
            }
            Remove local_22;
            local_22.opCall();
        }
        return;
    }
    UFUNCTION()
    void Job_TickCharacterExtraSpeedPct(const FECSEntity &inout Entity, FC_CharacterSpeedGuideSpline &inout CharacterSpeedGuideSpline, FC_CharacterMovementSpeedModifier &inout CharacterMovementSpeedModifier) const
    {
        CharacterMovementSpeedModifier.SetSpecialSystemSpeedModifier(FMath::Max(CharacterSpeedGuideSpline.GetExtraSpeedPctByGuideSpline(), 0.0f) + 1.0f);
        return;
    }
    UFUNCTION()
    void Job_TickCharacterSpeedGuide(const FECSEntity &inout Entity, FC_CharacterMovementControl &inout CharacterMovementControl, const FC_Transform &inout Tranform, FC_Rigidbody &inout Rigidbody, FC_CharacterMovement &inout CharacterMovement, const FCS_FixedTime &inout FixedTime) const
    {
        ASpeedGuideSplinePrefab local_6;
        ASpeedGuideSplinePrefab local_30;
        const FC_CharacterSpeedGuideSpline& local_90;
        ASpeedGuideSplinePrefab local_96;
        float32 local_1 = 0.0f;
        float32 local_3 = 0.0f;
        Get local_10;
        const FC_PredictableOverlapping& local_12 = local_10.opCall();
        if (local_12)
        {
            Modify local_34;
            for (auto& local_28 : local_12.GetOverlappingEntities())
            {
                local_28;
                FC_SpeedGuideSpline& local_36 = local_34.opCall();
                if (local_36)
                {
                    local_30 = local_36.GetSplinePrefabActor();
                }
                if (local_30 != nullptr)
                {
                    FVector local_44 = Tranform.GetPosition();
                    float local_68 = FMath::Abs(local_30.SplineComponent.FindDirectionClosestToWorldLocation(local_44, ESplineCoordinateSpace(1)).DotProduct(FVector(Rigidbody.GetVelocity()).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector)));
                    float local_70 = (FMath::Clamp(local_68, 0.0, 1.0)) * local_30.MaxExtraSpeedPct;
                    if (local_70 >= local_1)
                    {
                        local_1 = float32(local_70);
                        local_6 = local_30;
                        local_3 = float32(local_68);
                    }
                }
            }
        }
        if (local_6 != nullptr)
        {
            Modify local_34;
            FECSEntity local_84 = ECS::GetPrefabEntity(local_6);
            FECSEntity local_94 = FECSEntity(local_90.GetSpeedGuideSplineEntity());
            if (!((local_94 == local_84)))
            {
                if (local_94.IsValid())
                {
                    FC_SpeedGuideSpline& local_36_2 = local_34.opCall();
                    if (local_36_2)
                    {
                        local_96 = local_36_2.GetSplinePrefabActor();
                    }
                    if (local_96 != nullptr && local_96.BuffConfig.IsValid())
                    {
                        FBuffUtils::RemoveBuff(Entity, local_96.BuffConfig, this.GetECSRuntime().Time, EBuffEndType(0));
                    }
                }
                FBuffUtils::AddBuff(Entity, local_6.BuffConfig, this.GetECSRuntime().Time, local_84, true, -1.0f, 1, false);
            }
            local_90.SetSpeedGuideSplineEntity(local_84);
            local_90.SetCosineValueToSplineDirection(local_3);
            local_90.SetExtraSpeedPctByGuideSpline(local_1);
            return;
        }
        Get local_108;
        local_90 = local_108.opCall();
        if (local_90)
        {
            FECSEntity local_84_2 = FECSEntity(local_90.GetSpeedGuideSplineEntity());
            if (local_84_2.IsValid())
            {
                local_30 = (Cast<ASpeedGuideSplinePrefab>(ULevelActorManager::Get().GetInLevelPrefabByEntity(local_84_2)));
                if (local_30 != nullptr && local_30.BuffConfig.IsValid())
                {
                    FBuffUtils::RemoveBuff(Entity, local_30.BuffConfig, this.GetECSRuntime().Time, EBuffEndType(0));
                }
            }
            Remove local_116;
            local_116.opCall();
        }
        return;
    }
    UFUNCTION()
    void Job_TickSpeedGuideSplineActive(const FECSEntity &inout Entity, FC_SpeedGuideSpline &inout SpeedGuideSpline) const
    {
        ASpeedGuideSplinePrefab local_2 = SpeedGuideSpline.GetSplinePrefabActor();
        if (local_2 != nullptr)
        {
            local_2.SetActorEnableCollision(Entity.IsActive());
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnAssignCharacterSpeedGuideSpline(const FECSEntity &inout Entity, const FC_CharacterSpeedGuideSpline &inout CharacterSpeedGuideSpline) const
    {
        int local_26 = 0;
        FC_SpeedSplineFXParamValue local_38;
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            if (!(FECSEntity(CharacterSpeedGuideSpline.GetSpeedGuideSplineEntity()).IsValid()))
            {
                local_5 = false;
            }
            else
            {
                Has local_14;
                local_5 = local_14.opCall();
            }
            if (local_5)
            {
                Has local_20;
                bool local_15 = local_20.opCall();
                int local_27 = 0;
                for (; local_27 < local_26.FXParamConfigs.Num(); )
                {
                    const FSpeedSplineFXParamConfig& local_32 = local_26.FXParamConfigs[local_27];
                    if (local_15)
                    {
                        FSpeedSplineFXParamValue& local_40 = local_38.FXParamValues[local_27];
                        local_40.BlendStartValue = local_40.ParamValue;
                    }
                    else
                    {
                        FSpeedSplineFXParamValue local_44;
                        local_44.ParamValue = local_32.ParamDefaultValue;
                        local_44.BlendStartValue = local_44.ParamValue;
                        local_38.FXParamValues.Add(local_44);
                    }
                    local_38.BlendStartTime = ECS::GetContextTime();
                    local_38.bIsBlendIn = true;
                    ++local_27;
                }
                local_27 = 0;
                for (; local_27 < local_26.MaterialParamConfigs.Num(); )
                {
                    const FSpeedSplineFXParamConfig& local_32_2 = local_26.MaterialParamConfigs[local_27];
                    if (local_15)
                    {
                        FSpeedSplineFXParamValue& local_40_2 = local_38.MaterialParamValues[local_27];
                        local_40_2.BlendStartValue = local_40_2.ParamValue;
                    }
                    else
                    {
                        FSpeedSplineFXParamValue local_44;
                        local_44.ParamValue = local_32_2.ParamDefaultValue;
                        local_44.BlendStartValue = local_44.ParamValue;
                        local_38.MaterialParamValues.Add(local_44);
                    }
                    local_38.BlendStartTime = ECS::GetContextTime();
                    local_38.bIsBlendIn = true;
                    ++local_27;
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnRemoveCharacterSpeedGuideSpline(const FECSEntity &inout Entity, const FC_CharacterSpeedGuideSpline &inout CharacterSpeedGuideSpline) const
    {
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            if (!(CharacterSpeedGuideSpline.GetSpeedGuideSplineEntity().IsValid()))
            {
                local_5 = false;
            }
            else
            {
                Has local_10;
                local_5 = local_10.opCall();
            }
            if (!(local_5))
            {
                local_5 = false;
            }
            else
            {
                Has local_16;
                local_5 = local_16.opCall();
            }
            if (local_5)
            {
                FC_SpeedSplineFXParamValue local_22;
                int local_23 = 0;
                for (; local_23 < local_22.FXParamValues.Num(); )
                {
                    FSpeedSplineFXParamValue& local_28 = local_22.FXParamValues[local_23];
                    local_28.BlendStartValue = local_28.ParamValue;
                    ++local_23;
                }
                local_23 = 0;
                for (; local_23 < local_22.MaterialParamValues.Num(); )
                {
                    FSpeedSplineFXParamValue& local_28_2 = local_22.MaterialParamValues[local_23];
                    local_28_2.BlendStartValue = local_28_2.ParamValue;
                    ++local_23;
                }
                local_22.BlendStartTime = ECS::GetContextTime();
                local_22.bIsBlendIn = false;
            }
        }
        return;
    }
    UFUNCTION()
    void Job_TickSpeedSplineFXParam(const FECSEntity &inout Entity, const FC_SpeedSplineFXParamConfig &inout SpeedSplineFXParamConfig, FC_SpeedSplineFXParamValue &inout SpeedSplineFXParamValue, const FC_SpeedGuideSpline &inout SpeedGuideSpline) const
    {
        const AActor local_8;
        ASpeedGuideSplineActor local_16;
        float32 local_21;
        UCurveFloat local_34;
        float32 local_35;
        float32 local_36;
        float32 local_37;
        float32 local_38;
        UCurveFloat local_54;
        UCurveFloat local_70;
        UCurveFloat local_74;
        UCurveFloat local_76;
        UCurveFloat local_78;
        int local_1 = SpeedSplineFXParamConfig.FXParamConfigs.Num();
        int local_2 = SpeedSplineFXParamValue.FXParamValues.Num();
        int local_1_2 = SpeedSplineFXParamConfig.MaterialParamConfigs.Num();
        int local_2_2 = SpeedSplineFXParamValue.MaterialParamValues.Num();
        local_8 = Entity.GetActor();
        if (local_8 != nullptr)
        {
            UNiagaraComponent local_12 = Cast<UNiagaraComponent>(local_8.GetComponentByClass(UNiagaraComponent));
            local_16 = (Cast<ASpeedGuideSplineActor>(local_8));
            FFPTime local_20 = ECS::GetContextTime();
            if (SpeedSplineFXParamValue.bIsBlendIn)
            {
                float local_24 = (local_20 - SpeedSplineFXParamValue.BlendStartTime).ToSeconds();
                float32 local_25 = float32(local_24);
                int local_26 = 0;
                while (local_26 < local_1_2)
                {
                    const FSpeedSplineFXParamConfig& local_28 = SpeedSplineFXParamConfig.FXParamConfigs[local_26];
                    FSpeedSplineFXParamValue& local_30 = SpeedSplineFXParamValue.FXParamValues[local_26];
                    local_21 = local_28.BlendInTime;
                    if (local_21 > 0.0f)
                    {
                        local_34 = local_28.BlendInWeightCurve;
                        if (local_34 != nullptr)
                        {
                            local_38 = local_28.BlendInWeightCurve.GetFloatValue(local_25);
                        }
                        else
                        {
                            local_21 = local_28.BlendInTime;
                            local_21 = local_25 / local_21;
                            local_38 = FMath::Clamp(local_21, 0.0f, 1.0f);
                        }
                        local_35 = FMath::Lerp(local_30.BlendStartValue, local_28.ParamTargetValue, local_38);
                        local_30.ParamValue = local_35;
                    }
                    else
                    {
                        local_30.ParamValue = local_28.ParamTargetValue;
                    }
                    local_36 = local_30.ParamValue;
                    local_12.SetFloatParameter(local_28.FXParamName, local_36);
                    ++local_26;
                }
                if (local_16 != nullptr)
                {
                    for (auto local_52 : local_16.MIDSplines)
                    {
                        local_26 = 0;
                        while (local_26 < local_2_2)
                        {
                            const FSpeedSplineFXParamConfig& local_28_2 = SpeedSplineFXParamConfig.MaterialParamConfigs[local_26];
                            FSpeedSplineFXParamValue& local_30_2 = SpeedSplineFXParamValue.MaterialParamValues[local_26];
                            if (local_28_2.BlendInTime > 0.0f)
                            {
                                local_54 = local_28_2.BlendInWeightCurve;
                                if (local_54 != nullptr)
                                {
                                    local_21 = local_28_2.BlendInWeightCurve.GetFloatValue(local_25);
                                }
                                else
                                {
                                    local_35 = local_28_2.BlendInTime;
                                    local_37 = local_25 / local_35;
                                    local_21 = FMath::Clamp(local_37, 0.0f, 1.0f);
                                }
                                local_30_2.ParamValue = FMath::Lerp(local_30_2.BlendStartValue, local_28_2.ParamTargetValue, local_21);
                            }
                            else
                            {
                                local_38 = local_28_2.ParamTargetValue;
                                local_30_2.ParamValue = local_38;
                            }
                            local_36 = local_30_2.ParamValue;
                            local_52.SetScalarParameterValue(local_28_2.FXParamName, local_36);
                            ++local_26;
                        }
                    }
                    for (auto local_68 : local_16.EffectPlaneSplineMeshes)
                    {
                        local_26 = 0;
                        while (local_26 < local_1_2)
                        {
                            const FSpeedSplineFXParamConfig& local_28_3 = SpeedSplineFXParamConfig.MaterialParamConfigs[local_26];
                            FSpeedSplineFXParamValue& local_30_3 = SpeedSplineFXParamValue.MaterialParamValues[local_26];
                            local_38 = local_28_3.BlendInTime;
                            if (local_38 > 0.0f)
                            {
                                local_70 = local_28_3.BlendInWeightCurve;
                                if (local_70 != nullptr)
                                {
                                    local_35 = local_28_3.BlendInWeightCurve.GetFloatValue(local_25);
                                }
                                else
                                {
                                    local_35 = FMath::Clamp(local_25 / local_28_3.BlendInTime, 0.0f, 1.0f);
                                }
                                local_30_3.ParamValue = FMath::Lerp(local_30_3.BlendStartValue, local_28_3.ParamTargetValue, local_35);
                            }
                            else
                            {
                                local_30_3.ParamValue = local_28_3.ParamTargetValue;
                            }
                            float32 local_32_3 = local_30_3.ParamValue;
                            local_68.SetScalarParameterForCustomPrimitiveData(local_28_3.FXParamName, local_32_3);
                            ++local_26;
                        }
                    }
                }
            }
            else
            {
                bool local_71;
                local_21 = float32(((local_20 - SpeedSplineFXParamValue.BlendStartTime).ToSeconds()));
                local_71 = true;
                int local_26_2 = 0;
                while (local_26_2 < local_2_2)
                {
                    const FSpeedSplineFXParamConfig& local_28_4 = SpeedSplineFXParamConfig.FXParamConfigs[local_26_2];
                    FSpeedSplineFXParamValue& local_30_4 = SpeedSplineFXParamValue.FXParamValues[local_26_2];
                    local_37 = local_28_4.BlendOutTime;
                    if (local_37 > 0.0f)
                    {
                        local_74 = local_28_4.BlendOutWeightCurve;
                        if (local_74 != nullptr)
                        {
                            local_37 = local_28_4.BlendOutWeightCurve.GetFloatValue(local_21);
                            local_38 = local_37;
                        }
                        else
                        {
                            local_38 = FMath::Clamp(local_21 / local_28_4.BlendOutTime, 0.0f, 1.0f);
                        }
                        local_30_4.ParamValue = FMath::Lerp(local_30_4.BlendStartValue, local_28_4.ParamDefaultValue, local_38);
                        if (local_21 < local_28_4.BlendOutTime)
                        {
                            local_71 = false;
                        }
                    }
                    else
                    {
                        local_36 = local_28_4.ParamDefaultValue;
                        local_30_4.ParamValue = local_36;
                    }
                    local_35 = local_30_4.ParamValue;
                    local_12.SetFloatParameter(local_28_4.FXParamName, local_35);
                    ++local_26_2;
                }
                if (local_16 != nullptr)
                {
                    for (auto local_52 : local_16.MIDSplines)
                    {
                        local_26_2 = 0;
                        while (local_26_2 < local_1_2)
                        {
                            const FSpeedSplineFXParamConfig& local_28_5 = SpeedSplineFXParamConfig.MaterialParamConfigs[local_26_2];
                            FSpeedSplineFXParamValue& local_30_5 = SpeedSplineFXParamValue.MaterialParamValues[local_26_2];
                            local_35 = local_28_5.BlendOutTime;
                            if (local_35 > 0.0f)
                            {
                                local_76 = local_28_5.BlendOutWeightCurve;
                                if (local_76 != nullptr)
                                {
                                    local_37 = local_28_5.BlendOutWeightCurve.GetFloatValue(local_21);
                                }
                                else
                                {
                                    local_37 = FMath::Clamp((local_21 / local_28_5.BlendOutTime), 0.0f, 1.0f);
                                }
                                local_30_5.ParamValue = FMath::Lerp(local_30_5.BlendStartValue, local_28_5.ParamDefaultValue, local_37);
                                if (local_21 < local_28_5.BlendOutTime)
                                {
                                    local_71 = false;
                                }
                            }
                            else
                            {
                                float32 local_31_3 = local_28_5.ParamDefaultValue;
                                local_30_5.ParamValue = local_31_3;
                            }
                            local_35 = local_30_5.ParamValue;
                            local_52.SetScalarParameterValue(local_28_5.FXParamName, local_35);
                            ++local_26_2;
                        }
                    }
                    for (auto local_68 : local_16.EffectPlaneSplineMeshes)
                    {
                        local_26_2 = 0;
                        while (local_26_2 < local_2_2)
                        {
                            const FSpeedSplineFXParamConfig& local_28_6 = SpeedSplineFXParamConfig.MaterialParamConfigs[local_26_2];
                            FSpeedSplineFXParamValue& local_30_6 = SpeedSplineFXParamValue.MaterialParamValues[local_26_2];
                            float32 local_31_4 = local_28_6.BlendOutTime;
                            if (local_31_4 > 0.0f)
                            {
                                local_78 = local_28_6.BlendOutWeightCurve;
                                if (local_78 != nullptr)
                                {
                                    local_36 = local_28_6.BlendOutWeightCurve.GetFloatValue(local_21);
                                }
                                else
                                {
                                    local_36 = FMath::Clamp((local_21 / local_28_6.BlendOutTime), 0.0f, 1.0f);
                                }
                                local_30_6.ParamValue = FMath::Lerp(local_30_6.BlendStartValue, local_28_6.ParamDefaultValue, local_36);
                                if (local_21 < local_28_6.BlendOutTime)
                                {
                                    local_71 = false;
                                }
                            }
                            else
                            {
                                float32 local_32_6 = local_28_6.ParamDefaultValue;
                                local_30_6.ParamValue = local_32_6;
                            }
                            local_31_4 = local_30_6.ParamValue;
                            local_68.SetScalarParameterForCustomPrimitiveData(local_28_6.FXParamName, local_31_4);
                            ++local_26_2;
                        }
                    }
                }
                if (local_71)
                {
                    Remove local_82;
                    local_82.opCall();
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickRemoveInactive() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
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
                this.Job_TickRemoveInactive(local_36, local_38);
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
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_84.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_TickRemoveInactive(local_166, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickCharacterExtraSpeedPct() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        MarkModifiedIfDirty local_52;
        MarkModifiedIfDirty local_56;
        int local_184 = 0;
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
                this.Job_TickCharacterExtraSpeedPct(local_36, local_38, local_44);
                local_52.opCall(local_38);
                local_56.opCall(local_44);
            }
            local_2.UpdateCachedEntityCount(local_13);
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
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_112 = 0;
        FECSRuntimeViewIterator local_146 = local_94.Iterator();
        for (; local_146.CanProceed;)
        {
            local_36 = local_146.Proceed();
            ++local_112;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_TickCharacterExtraSpeedPct(local_184, local_38, local_44);
            local_52.opCall(local_38);
            local_56.opCall(local_44);
        }
        local_2.UpdateCachedEntityCount(local_112);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickCharacterSpeedGuide() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        MarkModifiedIfDirty local_68;
        MarkModifiedIfDirty local_72;
        MarkModifiedIfDirty local_76;
        int local_216 = 0;
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
                this.Job_TickCharacterSpeedGuide(local_40, local_42, local_48, local_54, local_60, local_6);
                local_68.opCall(local_42);
                local_72.opCall(local_54);
                local_76.opCall(local_60);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_114 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_118;
        local_118.opCall();
        Include local_122;
        local_122.opCall();
        Include local_126;
        local_126.opCall();
        Include local_130;
        local_130.opCall();
        Include local_134;
        local_134.opCall();
        Include local_138;
        local_138.opCall();
        Exclude(local_114).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_144 = 0;
        FECSRuntimeViewIterator local_178 = local_114.Iterator();
        for (; local_178.CanProceed;)
        {
            local_40 = local_178.Proceed();
            ++local_144;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_TickCharacterSpeedGuide(local_216, local_42, local_48, local_54, local_60, local_6);
            local_68.opCall(local_42);
            local_72.opCall(local_54);
            local_76.opCall(local_60);
        }
        local_4.UpdateCachedEntityCount(local_144);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickSpeedGuideSplineActive() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_162 = 0;
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
                this.Job_TickSpeedGuideSplineActive(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_90 = 0;
        FECSRuntimeViewIterator local_124 = local_84.Iterator();
        for (; local_124.CanProceed;)
        {
            local_36 = local_124.Proceed();
            ++local_90;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_TickSpeedGuideSplineActive(local_162, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_90);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnAssignCharacterSpeedGuideSpline() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorCharacterSpeedGuideSplineOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnAssignCharacterSpeedGuideSpline(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnRemoveCharacterSpeedGuideSpline() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorCharacterSpeedGuideSplineOnRemoveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnRemoveCharacterSpeedGuideSpline(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_TickSpeedSplineFXParam() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_50 = 0;
        MarkModifiedIfDirty local_58;
        int local_186 = 0;
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
                this.Job_TickSpeedSplineFXParam(local_36, local_38, local_44, local_50);
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
        Exclude(local_96).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_114 = 0;
        FECSRuntimeViewIterator local_148 = local_96.Iterator();
        for (; local_148.CanProceed;)
        {
            local_36 = local_148.Proceed();
            ++local_114;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_TickSpeedSplineFXParam(local_186, local_38, local_44, local_50);
            local_58.opCall(local_44);
        }
        local_2.UpdateCachedEntityCount(local_114);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}


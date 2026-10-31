class US_CharacterEnvEffect : UECSScriptSystem
{
    US_CharacterEnvEffect()
    {
        return;
    }
    float32 SampleCurveDeltaValue(const FRuntimeFloatCurve &inout Curve, const float32 Time, const float32 Delta) const
    {
        float32 local_3 = Curve.GetFloatValue(Time - Delta, 0.0f);
        return Curve.GetFloatValue(Time, 0.0f) - local_3;
    }
    UFUNCTION()
    void UpdateEnvEffect(const FECSEntity &inout Entity, const FC_Collision &inout Collision, FC_CharacterEnvEffect &inout EnvEffect) const
    {
        const AActor local_10;
        const UMeshComponent local_12;
        UGamePhysicalMaterial local_174;
        FCharacterEnvEffectGroundData& local_208;
        if (EnvEffect.Settings == nullptr)
        {
            return;
        }
        UCharacterEnvEffectSettings local_6 = EnvEffect.Settings;
        local_10 = Entity.GetActor();
        if (local_10 == nullptr)
        {
            return;
        }
        if (EnvEffect.Mesh.IsValid())
        {
            local_12 = EnvEffect.Mesh.GetMeshComponent();
        }
        if ((!((local_12 != nullptr))))
        {
            local_12 = Cast<UMeshComponent>(local_10.GetComponentByClass(USkeletalMeshComponent));
        }
        if (!(EnvEffect.Mesh.IsValid()))
        {
            EnvEffect.Mesh = Entity.ModifyActorComponent(local_12.GetFName()).CastToMeshComponent();
        }
        FECSMeshComponentProxy local_28 = EnvEffect.Mesh;
        if (!(local_28.IsValid()) || !((local_12 != nullptr)))
        {
            return;
        }
        FVector local_36 = local_10.GetActorLocation();
        float32 local_43 = 0.0f;
        FHitResult local_110;
        FCollisionQueryParams local_148;
        local_148.bReturnPhysicalMaterial = true;
        FCollisionObjectQueryParams local_150 = FCollisionObjectQueryParams(ECollisionChannel(0));
        bool local_3 = FPhysicsUtils::LineTraceSingle(ECS::GetUEWorld(), EPhysicsTraceTag(22), local_110, local_36, (local_36 - FVector(0.0, 0.0, (Collision.GetScaledHalfHeight() + 10.0f))), local_150, local_148);
        if (local_3)
        {
            local_174 = (Cast<UGamePhysicalMaterial>(local_110.GetPhysMaterial()));
            if (local_174 != nullptr)
            {
                if (local_174.GetbIsWater())
                {
                    float local_158 = local_110.ImpactPoint.Z - local_28.GetMeshComponent().GetWorldLocation().Z;
                    local_43 = float32(local_158);
                }
            }
        }
        float local_158_2 = ECS::GetContextDeltaTime().ToSeconds();
        float32 local_44_2 = float32(local_158_2);
        float32 local_152 = Collision.GetScaledHeight();
        if (local_43 > 0.0f)
        {
            EnvEffect.EnterWaterSeconds = (EnvEffect.EnterWaterSeconds + local_44_2);
            EnvEffect.ExitWaterSeconds = 0.0f;
            EnvEffect.WetnessDeep = (local_43 / local_152);
            float32 local_179 = EnvEffect.WetnessShallowHeight;
            EnvEffect.WetnessShallowHeight = FMath::Max(local_179, EnvEffect.WetnessDeep);
            EnvEffect.WetnessDeepDry = FMath::Max((EnvEffect.WetnessDeepDry - this.SampleCurveDeltaValue(local_6.WetnessDeepDryFadeOutCurve, EnvEffect.EnterWaterSeconds, local_44_2)), 0.0f);
            local_179 = EnvEffect.EnterWaterSeconds;
            local_179 = EnvEffect.WetnessDry - this.SampleCurveDeltaValue(local_6.WetnessDryFadeOutCurve, local_179, local_44_2);
            EnvEffect.WetnessDry = FMath::Max(local_179, 0.0f);
        }
        else
        {
            EnvEffect.EnterWaterSeconds = 0.0f;
            EnvEffect.ExitWaterSeconds = (EnvEffect.ExitWaterSeconds + local_44_2);
            EnvEffect.WetnessDeep = FMath::Max((EnvEffect.WetnessDeep - this.SampleCurveDeltaValue(local_6.WetnessFadeOutCurve, EnvEffect.ExitWaterSeconds, local_44_2)), 0.0f);
            float32 local_179_2 = EnvEffect.WetnessDeepDry + this.SampleCurveDeltaValue(local_6.WetnessDeepDryFadeInCurve, EnvEffect.ExitWaterSeconds, local_44_2);
            EnvEffect.WetnessDeepDry = FMath::Min(local_179_2, 1.0f);
            float32 local_180 = EnvEffect.ExitWaterSeconds;
            local_180 = EnvEffect.WetnessDry + this.SampleCurveDeltaValue(local_6.WetnessDryFadeInCurve, local_180, local_44_2);
            EnvEffect.WetnessDry = FMath::Min(local_180, 1.0f);
            if ((EnvEffect.WetnessDry == 1.0f && (EnvEffect.WetnessDeepDry == 1.0f)))
            {
                EnvEffect.WetnessShallowHeight = 0.0f;
            }
        }
        local_28.SetScalarParameterValueOnMaterials(n"Wetness Deep Height", EnvEffect.WetnessDeep);
        local_28.SetScalarParameterValueOnMaterials(n"Wetness Shallow Height", EnvEffect.WetnessShallowHeight);
        local_28.SetScalarParameterValueOnMaterials(n"Wetness Deep Dry", EnvEffect.WetnessDeepDry);
        local_28.SetScalarParameterValueOnMaterials(n"Wetness Dry", EnvEffect.WetnessDry);
        local_158_2 = ECS::GetContextTime().ToSeconds();
        for (auto& local_202 : EnvEffect.GroundData)
        {
            FCharacterEnvEffectGroundSettings& local_206 = local_6.GroundSettings[local_202.GetKey()];
            if (local_208.MoveWeight > 0.0f)
            {
                local_208.MoveDurationSeconds = (local_208.MoveDurationSeconds + local_44_2);
                local_208.MoveWeight = FMath::Max((local_208.MoveWeight - this.SampleCurveDeltaValue(local_206.MoveFadeOutCurve, local_208.MoveDurationSeconds, local_44_2)), 0.0f);
                local_28.SetScalarParameterValueOnMaterials(local_206.MoveMaterialParameterName, local_208.MoveWeight);
            }
            if (local_208.FallWeight > 0.0f)
            {
                local_208.FallDurationSeconds = (local_208.FallDurationSeconds + local_44_2);
                local_208.FallWeight = FMath::Max((local_208.FallWeight - this.SampleCurveDeltaValue(local_206.FallFadeOutCurve, local_208.FallDurationSeconds, local_44_2)), 0.0f);
                local_28.SetScalarParameterValueOnMaterials(local_206.FallMaterialParameterName, local_208.FallWeight);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_HandleLandedSound(const FCE_EntityFootStepEvent &inout Event) const
    {
        int local_10 = 0;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if ((!(local_10) || (!((local_10.Settings != nullptr)))))
        {
            return;
        }
        int local_16 = int(FGamePhysicsUtils::GetPhysicalSurfaceType(Event.SurfaceName));
        if (local_10.Settings.GroundSettings.Contains(EPhysicalSurface(local_16)))
        {
            FCharacterEnvEffectGroundSettings& local_20 = local_10.Settings.GroundSettings[EPhysicalSurface(local_16)];
            if ((!((local_20.MoveMaterialParameterName == NAME_None))))
            {
                FCharacterEnvEffectGroundData& local_24 = local_10.GroundData.FindOrAdd(EPhysicalSurface(local_16));
                local_24.MoveDurationSeconds = 0.0f;
                local_24.MoveWeight = FMath::Min((local_24.MoveWeight + local_20.MoveStepAddValue), 1.0f);
            }
        }
        return;
    }
    UFUNCTION()
    void UpdateGlobalEnvEffect(const FCS_ClientWeatherEffect &inout WeatherEffect) const
    {
        UMaterialParameterCollection local_8;
        int local_18 = 0;
        float32 local_67;
        EGlobalEnvEffectWeatherType local_93;
        FGlobalEnvEffectWeatherSettings& local_96;
        UGlobalEnvEffectSettings local_4 = ::UCombatGlobalSettings::Get().EnvEffectSettings;
        if (local_4 != nullptr)
        {
            local_8 = local_4.WeatherMPC;
        }
        else
        {
        }
        UMaterialParameterCollection local_10 = local_8;
        if (local_10 == nullptr)
        {
            return;
        }
        FECSWorldPtr local_12 = ECS::GetECSWorld();
        if (!(WeatherEffect.WeatherConfig.IsSet()))
        {
            return;
        }
        TDataObjectPtr<FWeatherConfig> local_42 = WeatherEffect.WeatherConfig;
        float local_72 = ECS::GetContextDeltaTime().ToSeconds();
        float32 local_73 = float32(local_72);
        for (auto& local_92 : local_4.EnvEffectWeather)
        {
            local_93 = local_92.GetKey();
            FGlobalEnvEffectWeatherData& local_98 = local_18.WeatherEffectData.FindOrAdd(local_93);
            if (local_42.opArrow().WeatherEffect.Contains(local_93))
            {
                local_67 = local_42.opArrow().WeatherEffect[local_93].MaxWeight;
            }
            else
            {
                local_67 = 0.0f;
            }
            if ((local_67 > 0.0f && (local_98.Weight <= local_67)))
            {
                float32 local_99 = local_98.EnterDurationSeconds;
                float32 local_100 = local_99 + local_73;
                local_98.EnterDurationSeconds = local_100;
                local_99 = 0.0f;
                local_98.ExitDurationSeconds = 0.0f;
                local_100 = local_98.Weight;
                if (local_100 < local_67)
                {
                    local_100 = local_98.EnterDurationSeconds;
                    local_99 = this.SampleCurveDeltaValue(local_96.FadeInCurce, local_100, local_73);
                    local_100 = local_98.Weight + local_99;
                    local_98.Weight = local_100;
                    local_99 = local_98.Weight;
                    local_98.Weight = FMath::Min(local_99, local_67);
                }
            }
            else
            {
                local_98.EnterDurationSeconds = 0.0f;
                local_98.ExitDurationSeconds = (local_98.ExitDurationSeconds + local_73);
                if (local_98.Weight > 0.0f)
                {
                    float32 local_99_2 = this.SampleCurveDeltaValue(local_96.FadeOutCurce, local_98.ExitDurationSeconds, local_73);
                    local_98.Weight = (local_98.Weight - local_99_2);
                    local_98.Weight = FMath::Max(local_98.Weight, 0.0f);
                }
            }
            float32 local_99_3 = local_98.Weight;
            Material::SetScalarParameterValue(__GetWorldContext(), local_10, local_96.MaterialParameterName, local_99_3);
        }
        return;
    }
    UFUNCTION()
    void Run_UpdateEnvEffect() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        MarkModifiedIfDirty local_52;
        int local_176 = 0;
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
                this.UpdateEnvEffect(local_36, local_38, local_44);
                local_52.opCall(local_44);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Exclude(local_90).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_104 = 0;
        FECSRuntimeViewIterator local_138 = local_90.Iterator();
        for (; local_138.CanProceed;)
        {
            local_36 = local_138.Proceed();
            ++local_104;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.UpdateEnvEffect(local_176, local_38, local_44);
            local_52.opCall(local_44);
        }
        local_2.UpdateCachedEntityCount(local_104);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleLandedSound() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EntityFootStepEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EntityFootStepEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleLandedSound(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_UpdateGlobalEnvEffect() const
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
        this.UpdateGlobalEnvEffect(local_12);
        return;
    }
}


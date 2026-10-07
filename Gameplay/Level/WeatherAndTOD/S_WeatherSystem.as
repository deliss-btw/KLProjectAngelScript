
const FConsoleVariable CVar_DisableWeatherSystem = FConsoleVariable();

class US_WeatherSystem : UECSScriptSystem
{
    float32 UpdateRegionWeatherInterval = 0.2f;


    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return (CVar_DisableWeatherSystem.GetInt() != 0);
    }
    UFUNCTION()
    void ServerJob_BuildWeatherInitConfig() const
    {
        int local_16 = 0;
        AAS_ECSWorldSettings local_8 = (Cast<AAS_ECSWorldSettings>(ECS::GetUEWorld().GetWorldSettings()));
        FECSWorldPtr local_10 = this.GetECSWorld();
        local_16.GlobalWeatherTemplate = local_8.GlobalWeatherTemplate;
        local_16.GlobalWeatherAreaConfig = local_8.GlobalWeatherAreaConfig;
        TDataObjectPtr<FLevelInfoConfig> local_88 = ::FLevelUtils::GetCurrentLevelInfoConfig(nullptr);
        EInitWeatherPolicy local_114 = EInitWeatherPolicy(0);
        EInitWeatherPolicy local_113 = local_114;
        if (local_88.IsSet())
        {
            local_113 = local_114;
        }
        int local_116 = int(local_113);
        if (local_116 <= 2)
        {
            if (local_116 != 1)
            {
                if (local_116 != 2)
                {
                    return;
                }
            }
            else
            {
                ::FWeatherUtils::BuildWeatherInitConfigFromCommission(local_16);
                return;
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnRegionInactive(const FECSEntity &inout Entity, const FC_RegionWeatherData &inout RegionWeatherData) const
    {
        if (RegionWeatherData.GetWeatherEntity().IsValid())
        {
            FC_WeatherPendingDestroyTag local_8;
            Assign local_6;
            local_6.opCall(local_8);
            FString local_16_2 = (((FString("Monitor_OnRegionInactive: mark weather pending destroy, Region:") + Entity) + " WeatherEntity:") + RegionWeatherData.GetWeatherEntity());
            ::FWeatherUtils::DebugWeatherLog(local_16_2);
        }
        Get local_20;
        const FC_RegionOverlappingEntities& local_22 = local_20.opCall();
        if (local_22)
        {
            for (auto& local_36 : local_22.OverlappingEntities)
            {
                if (local_36.IsValid())
                {
                    FC_CharacterNeedCheckRegionTag local_42;
                    Assign local_40;
                    local_40.opCall(local_42);
                    ::FWeatherUtils::CheckAssignCharacterNeedUpdateWeatherTag(local_36);
                }
            }
        }
        Remove local_46;
        local_46.opCall();
        Remove local_50;
        local_50.opCall();
        Remove local_54;
        local_54.opCall();
        ::FWeatherUtils::DebugWeatherLog((FString("Monitor_OnRegionInactive: cleaned up region weather, Region:") + Entity));
        return;
    }
    UFUNCTION()
    void Monitor_OnRegionActive(const FECSEntity &inout Entity, const FC_Region &inout Region) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void ServerJob_UpdateRegionWeather(const FECSEntity &inout Entity, FC_RegionWeatherData &inout RegionWeatherData, const FCS_FixedTime &inout FixedTime) const
    {
        TDataObjectPtr<FWeatherConfig> local_24 = TDataObjectPtr<FWeatherConfig>(nullptr);
        FECSEntity local_76 = FECSEntity(RegionWeatherData.GetWeatherEntity());
        TDataObjectPtr<FWeatherConfig> local_100 = TDataObjectPtr<FWeatherConfig>(nullptr);
        FECSEntity local_104 = FECSEntity(ENTITY_NULL);
        float32 local_105 = 0.0f;
        if (local_76.IsValid())
        {
            Get local_112;
            local_24 = local_112.opCall().GetWeatherConfig();
        }
        bool local_113 = false;
        FECSWorldPtr local_116 = Entity.GetWorld();
        Get local_120;
        const FCS_DebugLogicWeatherAndTOD& local_122 = local_120.opCall();
        if (local_122)
        {
            if (!((local_122.ForceLogicWeather == NAME_None)) && !((local_122.ForceLogicWeather == local_24.GetDataName())))
            {
                local_100 = ::FWeatherUtils::GetWeatherConfig(local_122.ForceLogicWeather);
                local_105 = -1.0f;
                local_113 = true;
            }
        }
        if (!(local_113))
        {
            if (RegionWeatherData.GetDuration() > 0.0f)
            {
                if (RegionWeatherData.GetElapsedTime() >= RegionWeatherData.GetDuration())
                {
                    bool local_107;
                    Has local_132;
                    local_107 = local_132.opCall();
                    if (local_107)
                    {
                        Remove local_136;
                        local_136.opCall();
                        ::FWeatherUtils::DebugWeatherLog((FString("removed expired override weather,  RegionEntity:") + Entity));
                    }
                    TDataObjectPtr<FWeatherGenerateTemplate> local_168 = RegionWeatherData.GetUsingWeatherTemplate();
                    if (::FWeatherUtils::GetRandomWeatherIndexForRegion(Entity, local_168, local_24, FixedTime.Time) >= 0)
                    {
                        const FWeatherChanceConfig& local_196;
                        float32 local_198 = FMath::RandRange(local_196.MinDuration, local_196.MaxDuration);
                        local_100 = local_196.WeatherName;
                        local_105 = local_198;
                    }
                }
            }
        }
        if (local_100.IsSet())
        {
            FString local_140 = ((FString(" UpdateWeather success:  PrevWeather: ") + local_76) + "  NextWeather: ");
            FString local_144_2 = (local_140 + ::FWeatherUtils::ChangeRegionWeather(Entity, local_100, RegionWeatherData.GetUsingWeatherTemplate(), local_105, FixedTime.Time));
            FString local_140_2 = (local_144_2 + " NewWeatherConfig: ");
            ::FWeatherUtils::DebugWeatherLog((local_140_2 + local_100.GetDataName()));
        }
        else
        {
            RegionWeatherData.SetElapsedTime(RegionWeatherData.GetElapsedTime() + this.UpdateRegionWeatherInterval);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleRegionWeatherChanged(const FCE_RegionWeatherChanged &inout Event) const
    {
        Get local_4;
        AECSRegionVolume local_14;
        FName local_18;
        if (local_4.opCall())
        {
            AActor local_10;
            local_14 = (Cast<AECSRegionVolume>(local_10));
            if (local_14 != nullptr)
            {
                FName local_20;
                if (Event.PrevWeatherConfig.IsSet())
                {
                    local_20 = Event.PrevWeatherConfig.GetDataName();
                }
                else
                {
                    local_20 = NAME_None;
                }
                if (Event.NewWeatherConfig.IsSet())
                {
                    local_18 = Event.NewWeatherConfig.GetDataName();
                }
                else
                {
                    local_18 = NAME_None;
                }
                local_14.OnRegionWeatherChanged.Broadcast(local_20, local_18);
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_UpdateDynamicWeatherTint(const FECSEntity &inout Entity, const FC_DynamicWeatherTintConfig &inout WeatherTintConfig, FC_DynamicWeatherTint &inout WeatherTint) const
    {
        TArray<FECSEntity> local_4;
        int local_170 = 0;
        TArray<FECSEntity> local_8;
        TArray<FECSEntity> local_12 = WeatherTint.GetOverlappingEntities();
        Get local_16;
        FECSRuntimeQuery local_60 = FECSRuntimeQueryHelper::RuntimeQueryInSphere(WeatherTint.GetSourceEntity(), local_16.opCall().GetPosition(), WeatherTintConfig.Radius, EECSQueryRegsitryType(3), false);
        Include local_104;
        local_104.opCall();
        FECSRuntimeQueryIterator local_126 = local_60.Iterator();
        for (; local_126.CanProceed;)
        {
            FECSEntity local_150 = local_126.Proceed();
            if (!(WeatherTint.GetOverlappingEntities().Contains(local_150)))
            {
                local_8.AddUnique(local_150);
                continue;
            }
            local_4.AddUnique(local_150);
        }
        auto local_156 = local_12.Iterator();
        for (; local_156.CanProceed;)
        {
            FECSEntity local_150_2 = local_156.Proceed();
            if (!(local_4.Contains(local_150_2)))
            {
                if (local_150_2.IsValid())
                {
                    ::FWeatherUtils::CheckAssignCharacterNeedUpdateWeatherTag(local_150_2);
                }
            }
        }
        auto local_162 = local_8.Iterator();
        for (; local_162.CanProceed;)
        {
            FECSEntity local_150_3 = local_162.Proceed();
            WeatherTint.GetModify_OverlappingEntities().Add(local_150_3);
            local_170.GetModify_DynamicWeatherTintEntities().Add(Entity);
            ::FWeatherUtils::CheckAssignCharacterNeedUpdateWeatherTag(local_150_3);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_InitWeatherAbility(const FECSEntity &inout WeatherEntity, const FC_WeatherEffect &inout WeatherEffect) const
    {
        UDataTable local_4;
        bool local_5;
        int local_36 = 0;
        if (local_4 == nullptr)
        {
            XWarning(ELog(44), "Cannot found Weather datatable!");
            return;
        }
        if (!(WeatherEffect.GetWeatherConfig().IsSet()))
        {
            local_5 = false;
        }
        else
        {
            TSoftClassPtr<UEASAbility> local_16;
            local_5 = !((local_16 == nullptr));
        }
        if (local_5)
        {
            FECSEntity local_30 = WeatherEntity.GetWorld().Create(EEntityType(9), n"WeatherAbility");
            local_36.SetEntity(local_30);
            Assign local_40;
            local_40.opCall(FC_LocalTag());
            int local_42 = local_30.GetIdValue();
            local_30.SetEntityName(FName((FString("WeatherAbilityContainer") + local_42)));
            ModifyOrAdd local_56;
            local_56.opCall().SetOwnerEntity(WeatherEntity);
            FC_NetRelevancePolicy local_61;
            Assign local_60;
            local_60.opCall(local_61).RelevancePolicyType = (3 != 0);
            TSubclassOf<UEASAbility> local_64;
            FAbilityUtils::AddAbility(local_30, local_64, false, n"WeatherAbility", false, false, true, false, FFPTime(0));
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleDestroyDynamicWeatherTintRequest(FCE_DestroyDynamicWeatherTintRequest &inout Request) const
    {
        int local_8;
        int local_28 = 0;
        if (!(Request.Entity.IsValid()))
        {
            return;
        }
        for (auto& local_22 : local_8.GetOverlappingEntities())
        {
            ::FWeatherUtils::CheckAssignCharacterNeedUpdateWeatherTag(local_22);
            if (local_28.GetDynamicWeatherTintEntities().Num() == 0)
            {
                Remove local_34;
                local_34.opCall();
            }
        }
        Request.Entity.DestroyDeferred();
        return;
    }
    UFUNCTION()
    void ServerJob_RemoveCharacterDynamicWeatherTint(const FECSEntity &inout Entity, const FC_CharacterDynamicWeatherTint &inout CharacterDynamicWeatherTint) const
    {
        if (CharacterDynamicWeatherTint.GetDynamicWeatherTintEntities().Num() == 0)
        {
            Remove local_8;
            local_8.opCall();
        }
        return;
    }
    UFUNCTION()
    void ServerJob_DestroyWeather(const FECSEntity &inout WeatherEntity, const FC_WeatherEffect &inout WeatherEffect) const
    {
        ::FWeatherUtils::DestroyWeatherEntity(WeatherEntity);
        return;
    }
    UFUNCTION()
    void ServerJob_CheckCharacterBeginOverlapping(const FCE_BeginOverlap &inout BeginOverlap) const
    {
        Has local_4;
        bool local_5;
        if (!(local_4.opCall()))
        {
            local_5 = false;
        }
        else
        {
            Has local_10;
            local_5 = local_10.opCall();
        }
        if (local_5)
        {
            FC_CharacterNeedCheckRegionTag local_18;
            Assign local_16;
            local_16.opCall(local_18);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_CheckCharacterEndOverlapping(const FCE_EndOverlap &inout EndOverlap) const
    {
        Has local_4;
        bool local_5;
        if (!(local_4.opCall()))
        {
            local_5 = false;
        }
        else
        {
            Has local_10;
            local_5 = local_10.opCall();
        }
        if (local_5)
        {
            FC_CharacterNeedCheckRegionTag local_18;
            Assign local_16;
            local_16.opCall(local_18);
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnActiveCharacterCareAboutRegion(const FECSEntity &inout Entity, const FC_CareAboutRegionTag &inout CareAboutRegionTag) const
    {
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            FC_CharacterNeedCheckRegionTag local_12;
            Assign local_10;
            local_10.opCall(local_12);
            ::FWeatherUtils::CheckAssignCharacterNeedUpdateWeatherTag(Entity);
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnInactiveCharacterCareAboutRegion(const FECSEntity &inout Entity, const FC_CareAboutRegionTag &inout CareAboutRegionTag) const
    {
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            FC_CharacterNeedCheckRegionTag local_12;
            Assign local_10;
            local_10.opCall(local_12);
            ::FWeatherUtils::CheckAssignCharacterNeedUpdateWeatherTag(Entity);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_UpdatePlayerCharacterRegion(const FECSEntity &inout CharacterEntity, const FCS_FixedTime &inout FixedTime) const
    {
        int local_34 = 0;
        FC_RegionOverlappingEntities& local_96;
        int local_136 = 0;
        float32 local_154;
        int local_160 = 0;
        int local_166 = 0;
        FECSEntity local_4 = FECSEntity(ENTITY_NULL);
        Has local_8;
        bool local_9 = local_8.opCall();
        if (local_9)
        {
            Get local_14;
            local_4 = local_14.opCall().GetRegionEntity();
        }
        FECSEntity local_18 = FECSEntity(ENTITY_NULL);
        FName local_20(n"Region_Default");
        FName local_23(n"None");
        Has local_28;
        bool local_9_2 = local_28.opCall();
        if (local_9_2)
        {
            local_18 = local_34.GetRegionEntity();
            local_20 = local_34.GetRegionName();
            local_23 = local_34.GetRegionVolumeName();
        }
        FECSEntity local_40 = FECSEntity(ENTITY_NULL);
        FECSEntity local_44 = FECSEntity(ENTITY_NULL);
        FName local_46(n"Region_Default");
        FName local_48(n"None");
        if (CharacterEntity.IsActive())
        {
            Has local_52;
            bool local_9_3 = local_52.opCall();
            if (local_9_3)
            {
                int local_60;
                int local_53 = -1;
                int local_54 = -1;
                for (auto& local_74 : local_60.OverlappingEntities)
                {
                    if (!(local_74.IsValid()))
                    {
                        continue;
                    }
                    AECSRegionVolume local_76 = ::FLevelUtils::TryGetRegionVolumeActor(local_74);
                    if (local_76 != nullptr)
                    {
                        int local_21 = local_76.GetWeatherPriority();
                        if (local_76.bAffectWeather && (local_21 > local_53))
                        {
                            local_53 = local_21;
                            local_40 = local_76.GetRegionEntity();
                        }
                        int local_79 = local_76.GetAudioPriority();
                        if (local_76.bAffectAudio && (local_79 > local_54))
                        {
                            local_54 = local_79;
                            local_44 = local_76.GetRegionEntity();
                            local_46 = local_76.AudioTemplate.GetDataName();
                            local_48 = local_76.GetFName();
                        }
                    }
                }
            }
            if ((local_40 == ENTITY_NULL))
            {
                FECSWorldPtr local_84 = this.GetECSWorld();
                Get local_88;
                const FCS_GlobalRegion& local_90 = local_88.opCall();
                if (local_90)
                {
                    local_40 = local_90.GetRegionEntity();
                }
            }
        }
        bool local_9_4 = !((local_4 == local_40));
        if (local_9_4)
        {
            Has local_108;
            bool local_80;
            if (local_4.IsValid())
            {
                Modify local_94;
                local_96 = local_94.opCall();
                if (local_96)
                {
                }
            }
            if (local_40.IsValid())
            {
                local_96.OverlappingEntities.Add(CharacterEntity);
            }
            ModifyOrAdd local_104;
            local_104.opCall().SetRegionEntity(local_40);
            ::FWeatherUtils::CheckAssignCharacterNeedUpdateWeatherTag(CharacterEntity);
            if (!(CharacterEntity.IsActive()))
            {
                local_9_4 = false;
            }
            else
            {
                local_9_4 = local_108.opCall();
            }
            if (local_9_4)
            {
                Get local_112;
                if (FECSEntity(local_112.opCall().GetPlayerEntity()).IsValid())
                {
                    FECSEntity local_124 = FECSEntity(ENTITY_NULL);
                    FFPTime local_126 = FFPTime();
                    FFPTime local_126_2 = 0;
                    Has local_130;
                    local_80 = local_130.opCall();
                    if (local_80)
                    {
                        local_124 = local_136.GetRegionEntity();
                        local_126_2 = local_136.GetEnterTime();
                    }
                    if (!((local_124 == local_40)))
                    {
                        FCE_PlayerWorldRegionChanged local_148;
                        local_136.SetRegionEntity(local_40);
                        local_136.SetEnterTime(FixedTime.Time);
                        FFPTime local_146 = FFPTime(-1);
                        local_148.PrevRegionEntity = local_124;
                        local_148.NewRegionEntity = local_40;
                        if (local_126_2.opCmp(0.0) > 0)
                        {
                            local_154 = (FFPTime(FixedTime.Time) - local_126_2);
                        }
                        else
                        {
                            local_154 = 0.0f;
                        }
                        local_148.PrevRegionDuration = local_154;
                    }
                }
            }
        }
        if (!((local_18 == local_44)) || !((local_20 == local_46)))
        {
            Has local_108;
            bool local_80;
            local_80 = local_108.opCall();
            if (local_80)
            {
                if (local_18.IsValid() || !((local_20 == n"Region_Default")))
                {
                    local_160.SetRegionEntity(local_18);
                    local_160.SetRegionName(local_20);
                    local_160.SetRegionVolumeName(local_23);
                }
                local_166.SetRegionEntity(local_44);
                local_166.SetRegionName(local_46);
                local_166.SetRegionVolumeName(local_48);
            }
            local_34.SetRegionEntity(local_44);
            local_34.SetRegionName(local_46);
            local_34.SetRegionVolumeName(local_48);
        }
        Remove local_174;
        local_174.opCall();
        return;
    }
    UFUNCTION()
    void Monitor_OnInactiveCharacterRegionEntity(const FECSEntity &inout Entity, const FC_CharacterWeatherRegionEntity &inout CharacterRegionEntity) const
    {
        if (CharacterRegionEntity.GetRegionEntity().IsValid())
        {
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnInactiveRegionOverlappingEntities(const FECSEntity &inout Entity, const FC_RegionOverlappingEntities &inout RegionOverlappingEntities) const
    {
        bool local_13;
        for (auto& local_16 : RegionOverlappingEntities.OverlappingEntities)
        {
            if (!(local_16.IsValid()))
            {
                local_13 = false;
            }
            else
            {
                Has local_20;
                local_13 = local_20.opCall();
            }
            Get local_26;
            local_13 = local_13 && (FECSEntity(local_26.opCall().GetRegionEntity()) == Entity);
            if (local_13)
            {
                Remove local_34;
                local_34.opCall();
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_UpdateWeatherForPlayer(const FECSEntity &inout CharacterEntity, const FC_Transform &inout Transform, const FC_ControlledByPlayer &inout C_ControlledByPlayer) const
    {
        int local_52 = 0;
        int local_84 = 0;
        int local_106 = 0;
        int local_306 = 0;
        int local_314 = 0;
        int local_330 = 0;
        Remove local_4;
        local_4.opCall();
        if (!(FECSEntity(C_ControlledByPlayer.GetPlayerEntity()).IsValid()))
        {
            int local_15 = CharacterEntity.GetIdValue();
            ::FWeatherUtils::DebugWeatherLog((FString(" UpdateWeatherForPlayer failed: PlayerEntity is invalid: ") + local_15));
            return;
        }
        FECSEntity local_28 = FECSEntity(ENTITY_NULL);
        Get local_32;
        const FC_PlayerControllerWeatherEntity& local_34 = local_32.opCall();
        if (local_34)
        {
            if (local_34.GetWeatherEntity().IsValid())
            {
                local_28 = local_34.GetWeatherEntity();
            }
        }
        FC_PlayerControllerWeatherChangeChecker local_40;
        local_40.PrevWeatherEntity = local_28;
        FECSEntity local_44 = FECSEntity(ENTITY_NULL);
        bool local_45 = false;
        bool local_5 = false;
        bool local_46 = local_5;
        if (local_52)
        {
            Has local_90;
            const FC_DynamicWeatherTintConfig& local_78;
            int local_53;
            local_53 = -1;
            FECSEntity local_58 = FECSEntity(ENTITY_NULL);
            for (auto& local_72 : local_52.GetDynamicWeatherTintEntities())
            {
                const FECSEntity& local_86 = local_84.GetWeatherEntity();
                if (!(local_86.IsValid()))
                {
                    local_5 = true;
                }
                else
                {
                    local_5 = local_90.opCall();
                }
                if (local_5)
                {
                    continue;
                }
                if (int(local_78.Priority) > local_53)
                {
                    local_53 = int(local_78.Priority);
                    FECSEntity local_58_2 = local_72;
                    local_44 = local_86;
                }
            }
            local_45 = local_44.IsValid();
        }
        if ((local_44 == ENTITY_NULL))
        {
            Has local_90;
            FECSEntity local_58_3 = FECSEntity(ENTITY_NULL);
            Has local_96;
            bool local_5_2 = local_96.opCall();
            if (local_5_2)
            {
                Get local_100;
                local_58_3 = local_100.opCall().GetRegionEntity();
            }
            if (local_58_3.IsValid())
            {
                if (local_106 && local_106.GetWeatherEntity().IsValid() && !(local_90.opCall()))
                {
                    local_44 = local_106.GetWeatherEntity();
                }
            }
            local_46 = local_44.IsValid();
        }
        FECSEntity local_58_4 = local_44;
        TDataObjectPtr<FWeatherConfig> local_130 = TDataObjectPtr<FWeatherConfig>(nullptr);
        TDataObjectPtr<FWeatherConfig> local_202 = TDataObjectPtr<FWeatherConfig>(nullptr);
        TDataObjectPtr<FWeatherGenerateTemplate> local_226 = TDataObjectPtr<FWeatherGenerateTemplate>(nullptr);
        TDataObjectPtr<FWeatherGenerateTemplate> local_298 = TDataObjectPtr<FWeatherGenerateTemplate>(nullptr);
        local_40.NewWeatherEntity = local_58_4;
        if (!((local_28 == local_58_4)))
        {
            const FC_DynamicWeatherTintConfig& local_78;
            float32 local_299;
            local_299 = -1.0f;
            if (local_28.IsValid())
            {
                FFPTime local_312 = FFPTime(-1);
                local_314.Entity = CharacterEntity;
                local_314.WeatherConfig = local_306.GetWeatherConfig();
                Get local_318;
                const FC_RuntimeOverrideRegionWeather& local_320 = local_318.opCall();
                if (local_320)
                {
                    local_299 = local_320.ArtWeatherBlendTime;
                }
                else
                {
                    Get local_76;
                    local_78 = local_76.opCall();
                    if (local_78)
                    {
                        local_299 = local_78.BlendOutTime;
                    }
                }
                local_130 = local_306.GetWeatherConfig();
                local_226 = local_306.GetWeatherTemplate();
            }
            local_40.OverrideBlendTime = local_299;
            if (local_58_4.IsValid())
            {
                FFPTime local_312_2 = FFPTime(-1);
                local_330.Entity = CharacterEntity;
                local_330.WeatherConfig = local_306.GetWeatherConfig();
                local_202 = local_306.GetWeatherConfig();
                local_298 = local_306.GetWeatherTemplate();
            }
            FString local_20_2 = (((FString(" UpdateWeatherForPlayer success: Character:") + CharacterEntity) + " WeatherEntity:") + local_58_4);
            FString local_24_2 = (local_20_2 + " SourceEntity:");
            GetDefaulted local_304;
            FString local_20_3 = (local_24_2 + local_304.opCall().GetSourceEntity());
            FString local_24_3 = (local_20_3 + "  Weather:");
            FString local_20_4 = (local_24_3 + local_202.GetDataName());
            FString local_24_4 = (local_20_4 + " WeatherTempalate:");
            FString local_20_5 = (local_24_4 + local_298.GetDataName());
            FString local_24_5 = (local_20_5 + "  PrevWeather:");
            FString local_20_6 = (local_24_5 + local_130.GetDataName());
            FString local_24_6 = (local_20_6 + " PreWeatherTemplate:");
            FString local_20_7 = (local_24_6 + local_226.GetDataName());
            FString local_24_7 = (local_20_7 + " bWeatherIsFromTint:");
            FString local_20_8 = (local_24_7 + local_45);
            FString local_24_8 = (local_20_8 + " bWeatherIsFromRegion:");
            ::FWeatherUtils::DebugWeatherLog((local_24_8 + local_46));
        }
        return;
    }
    UFUNCTION()
    void ServerJob_CheckPlayerControllerWeatherChange(const FECSEntity &inout PlayerEntity, const FCS_FixedTime &inout FixedTime, const FC_PlayerController &inout C_PlayerController, const FC_PlayerControllerWeatherChangeChecker &inout PlayerControllerWeatherChangeChecker) const
    {
        bool local_9;
        GetDefaulted local_14;
        TDataObjectPtr<FWeatherConfig> local_38;
        int local_236 = 0;
        float32 local_237 = 0.0f;
        Has local_242;
        Remove local_246;
        Remove local_250;
        int local_296 = 0;
        int local_312 = 0;
        bool local_313 = false;
        FECSEntity local_4 = PlayerControllerWeatherChangeChecker.PrevWeatherEntity;
        FECSEntity local_8 = PlayerControllerWeatherChangeChecker.NewWeatherEntity;
        if (!((local_4 == local_8)))
        {
            bool local_275;
            TDataObjectPtr<FWeatherConfig> local_62;
            if (local_4.IsValid())
            {
                local_62 = local_14.opCall().GetWeatherConfig();
            }
            else
            {
                local_62 = (TDataObjectPtr<FWeatherConfig>(nullptr));
            }
            if (local_8.IsValid())
            {
                local_38 = local_14.opCall().GetWeatherConfig();
            }
            else
            {
                local_38 = TDataObjectPtr<FWeatherConfig>(nullptr);
            }
            if ((local_62 == local_38.opImplConv()))
            {
                if (local_8.IsValid())
                {
                    local_236.SetWeatherEntity(local_8);
                    local_237 = PlayerControllerWeatherChangeChecker.OverrideBlendTime;
                    local_236.SetOverrideBlendTime(local_237);
                }
                else
                {
                    local_9 = local_242.opCall();
                    if (local_9)
                    {
                        local_246.opCall();
                    }
                }
                local_250.opCall();
                return;
            }
            TDataObjectPtr<FWeatherConfig> local_274 = TDataObjectPtr<FWeatherConfig>(nullptr);
            local_9 = false;
            local_275 = local_9;
            Get local_280;
            const FC_PendingAddWeatherBuff& local_282 = local_280.opCall();
            if (local_282)
            {
                local_274 = local_282.PrevWeatherConfig;
                local_275 = true;
                Remove local_286;
                local_286.opCall();
            }
            if (local_4.IsValid())
            {
                FFPTime local_292 = FFPTime(-1);
                local_296.PlayerControllerEntity = PlayerEntity;
                local_296.PlayerPawnEntity = ::FASCommonUtils::GetUniqueAvatarPawnEntity(PlayerEntity);
                local_296.WeatherConfig = local_62;
                if (!(local_275))
                {
                    Get local_304;
                    const FC_WeatherEffect& local_306 = local_304.opCall();
                    if (local_306)
                    {
                        local_274 = local_306.GetWeatherConfig();
                    }
                }
            }
            if (local_8.IsValid())
            {
                FFPTime local_292_2 = FFPTime(-1);
                local_312.PlayerControllerEntity = PlayerEntity;
                local_312.PlayerPawnEntity = ::FASCommonUtils::GetUniqueAvatarPawnEntity(PlayerEntity);
                local_312.WeatherConfig = local_38;
                local_9 = !((local_38 == local_274.opImplConv()));
                if (local_9)
                {
                    local_9 = local_38.IsSet() && local_313;
                    if (local_9)
                    {
                        float32 local_319;
                        local_282.WeatherConfig = local_38;
                        local_282.PrevWeatherConfig = local_274;
                        local_319 = local_237;
                        local_282.BuffStartTime = (FFPTime(FixedTime.Time) + FFPTime(local_319));
                        FString local_334_2 = (((FString(" Delay add weather buff: ") + PlayerEntity) + " WeatherConfig:") + local_38.GetDataName());
                        FString local_330_2 = (local_334_2 + " BuffConfigAddDelay:");
                        ::FWeatherUtils::DebugWeatherLog((local_330_2 + local_319));
                    }
                    else
                    {
                        local_9 = local_274.IsSet() && local_313;
                        if (local_9)
                        {
                            FString local_334_3 = (FString(" Remove weather buff (no new buff): ") + PlayerEntity);
                            FString local_330_3 = (local_334_3 + " WeatherConfig:");
                            ::FWeatherUtils::DebugWeatherLog((local_330_3 + local_274.GetDataName()));
                            ::FWeatherUtils::RemoveWeatherBuffFromPlayer(PlayerEntity, local_274, FixedTime.Time);
                        }
                    }
                }
                local_236.SetWeatherEntity(local_8);
                local_236.SetOverrideBlendTime(PlayerControllerWeatherChangeChecker.OverrideBlendTime);
            }
            else
            {
                if (local_274.IsSet() && local_9)
                {
                    FString local_330_4 = (FString(" Remove weather buff (no new weather): ") + PlayerEntity);
                    FString local_334_4 = (local_330_4 + " WeatherConfig:");
                    ::FWeatherUtils::DebugWeatherLog((local_334_4 + local_274.GetDataName()));
                    ::FWeatherUtils::RemoveWeatherBuffFromPlayer(PlayerEntity, local_274, FixedTime.Time);
                }
                local_313 = local_242.opCall();
                if (local_313)
                {
                    FString local_334_5 = (FString(" Cannot find best weather entity for player: ") + PlayerEntity);
                    FString local_330_5 = (local_334_5 + " Destroy PlayerControllerWeatherEntity");
                    ::FWeatherUtils::DebugWeatherLog(local_330_5);
                    local_246.opCall();
                }
            }
        }
        local_250.opCall();
        return;
    }
    UFUNCTION()
    void ServerJob_DelayAddWeatherBuff(const FECSEntity &inout PlayerEntity, const FCS_FixedTime &inout FixedTime, const FC_PendingAddWeatherBuff &inout PendingAddWeatherBuff) const
    {
        bool local_5 = false;
        if (PendingAddWeatherBuff.BuffStartTime.opCmp(FixedTime.Time) <= 0)
        {
            bool local_4 = PendingAddWeatherBuff.PrevWeatherConfig.IsSet() && local_5;
            if (local_4)
            {
                ::FWeatherUtils::DebugWeatherLog((((FString(" Remove prev weather buff: ") + PlayerEntity) + " WeatherConfig:") + PendingAddWeatherBuff.PrevWeatherConfig.GetDataName()));
                ::FWeatherUtils::RemoveWeatherBuffFromPlayer(PlayerEntity, PendingAddWeatherBuff.PrevWeatherConfig, FixedTime.Time);
            }
            if (PendingAddWeatherBuff.WeatherConfig.IsSet() && local_4)
            {
                FString local_10_2 = (FString(" Add weather buff: ") + PlayerEntity);
                FString local_14_2 = (local_10_2 + " WeatherConfig:");
                ::FWeatherUtils::DebugWeatherLog((local_14_2 + PendingAddWeatherBuff.WeatherConfig.GetDataName()));
                ::FWeatherUtils::AddWeatherBuffToPlayer(PlayerEntity, PendingAddWeatherBuff.WeatherConfig, FixedTime.Time);
            }
            Remove local_20;
            local_20.opCall();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_BuildWeatherInitConfig() const
    {
        ECS::GetContextJob();
        this.ServerJob_BuildWeatherInitConfig();
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnRegionInactive() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorRegionWeatherDataOnInactiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnRegionInactive(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnRegionActive() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorRegionOnActiveView(EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnRegionActive(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_UpdateRegionWeather() const
    {
        int local_14 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_180 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(this.UpdateRegionWeatherInterval))))
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
                this.ServerJob_UpdateRegionWeather(local_46, local_48, local_14);
                FECSEntity::MarkModifiedIfDirty<FC_RegionWeatherData> local_56;
                local_56.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_23);
            return;
        }
        FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_98;
        local_98.opCall();
        Exclude(local_94).opCall();
        Exclude(local_94).opCall();
        bool local_11 = local_4.BeginViewCacheBuild();
        int local_24 = local_4.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_94.Iterator();
        for (; local_142.CanProceed;)
        {
            local_46 = local_142.Proceed();
            ++local_108;
            if (local_11)
            {
                local_4.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.ServerJob_UpdateRegionWeather(local_180, local_48, local_14);
            FECSEntity::MarkModifiedIfDirty<FC_RegionWeatherData>(local_46).opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_108);
        if (local_11)
        {
            local_4.CommitViewCacheBuild(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleRegionWeatherChanged() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_RegionWeatherChanged> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_RegionWeatherChanged& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleRegionWeatherChanged(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_UpdateDynamicWeatherTint() const
    {
        const FECSEntity& local_42;
        int local_44 = 0;
        int local_50 = 0;
        MarkModifiedIfDirty local_58;
        int local_182 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(0.5))))
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
                this.ServerJob_UpdateDynamicWeatherTint(local_42, local_44, local_50);
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
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_20 = local_4.GetViewCacheEpoch();
        int local_110 = 0;
        FECSRuntimeViewIterator local_144 = local_96.Iterator();
        for (; local_144.CanProceed;)
        {
            local_42 = local_144.Proceed();
            ++local_110;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_42.GetId());
            }
            FECSEntityScopeCycleCounter local_39_2 = FECSEntityScopeCycleCounter(local_42);
            this.ServerJob_UpdateDynamicWeatherTint(local_182, local_44, local_50);
            local_58.opCall(local_50);
        }
        local_4.UpdateCachedEntityCount(local_110);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_20);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_InitWeatherAbility() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
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
                this.ServerJob_InitWeatherAbility(local_36, local_38);
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
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_80.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ServerJob_InitWeatherAbility(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleDestroyDynamicWeatherTintRequest() const
    {
        ECS::GetContextJob();
        TECSEventIterator<FCE_DestroyDynamicWeatherTintRequest> local_36 = FECSWorldPtr::PatchEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            FCE_DestroyDynamicWeatherTintRequest& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleDestroyDynamicWeatherTintRequest(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_RemoveCharacterDynamicWeatherTint() const
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
                this.ServerJob_RemoveCharacterDynamicWeatherTint(local_36, local_38);
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
            this.ServerJob_RemoveCharacterDynamicWeatherTint(local_162, local_38);
        }
        local_2.UpdateCachedEntityCount(local_90);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DestroyWeather() const
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
                this.ServerJob_DestroyWeather(local_36, local_38);
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
            this.ServerJob_DestroyWeather(local_170, local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_CheckCharacterBeginOverlapping() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_BeginOverlap> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_BeginOverlap& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_CheckCharacterBeginOverlapping(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_CheckCharacterEndOverlapping() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EndOverlap> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EndOverlap& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_CheckCharacterEndOverlapping(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnActiveCharacterCareAboutRegion() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorCareAboutRegionTagOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnActiveCharacterCareAboutRegion(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnInactiveCharacterCareAboutRegion() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorCareAboutRegionTagOnInactiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnInactiveCharacterCareAboutRegion(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_UpdatePlayerCharacterRegion() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_160 = 0;
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
                this.ServerJob_UpdatePlayerCharacterRegion(local_40, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_78 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_82;
        local_82.opCall();
        Include local_86;
        local_86.opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_88 = 0;
        FECSRuntimeViewIterator local_122 = local_78.Iterator();
        for (; local_122.CanProceed;)
        {
            local_40 = local_122.Proceed();
            ++local_88;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_UpdatePlayerCharacterRegion(local_160, local_6);
        }
        local_4.UpdateCachedEntityCount(local_88);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnInactiveCharacterRegionEntity() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorCharacterWeatherRegionEntityOnInactiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnInactiveCharacterRegionEntity(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnInactiveRegionOverlappingEntities() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorRegionOverlappingEntitiesOnInactiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnInactiveRegionOverlappingEntities(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_UpdateWeatherForPlayer() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
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
                this.ServerJob_UpdateWeatherForPlayer(local_36, local_38, local_44);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_104 = 0;
        FECSRuntimeViewIterator local_138 = local_86.Iterator();
        for (; local_138.CanProceed;)
        {
            local_36 = local_138.Proceed();
            ++local_104;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ServerJob_UpdateWeatherForPlayer(local_176, local_38, local_44);
        }
        local_2.UpdateCachedEntityCount(local_104);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_CheckPlayerControllerWeatherChange() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_180 = 0;
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
                this.ServerJob_CheckPlayerControllerWeatherChange(local_40, local_6, local_42, local_48);
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
        Exclude(local_90).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_90.Iterator();
        for (; local_142.CanProceed;)
        {
            local_40 = local_142.Proceed();
            ++local_108;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_CheckPlayerControllerWeatherChange(local_180, local_6, local_42, local_48);
        }
        local_4.UpdateCachedEntityCount(local_108);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DelayAddWeatherBuff() const
    {
        int local_12 = 0;
        const FECSEntity& local_44;
        int local_46 = 0;
        int local_174 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(0.5))))
        {
            return;
        }
        int local_14 = 0;
        int local_13 = local_14;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_16 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_20 = local_4.GetViewCacheEntities();
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
                this.ServerJob_DelayAddWeatherBuff(local_44, local_12, local_46);
            }
            local_4.UpdateCachedEntityCount(local_21);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_22 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_88.Iterator();
        for (; local_136.CanProceed;)
        {
            local_44 = local_136.Proceed();
            ++local_102;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_44.GetId());
            }
            FECSEntityScopeCycleCounter local_41_2 = FECSEntityScopeCycleCounter(local_44);
            this.ServerJob_DelayAddWeatherBuff(local_174, local_12, local_46);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_22);
        }
        return;
    }
}


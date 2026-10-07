

class US_WeatherPresentationSystem : UECSScriptSystem
{
    US_WeatherPresentationSystem()
    {
        return;
    }
    bool GetArtWeatherConfig(const FECSEntity &inout SourceEntity, const TDataObjectPtr<FWeatherConfig> &inout WeatherConfig, FArtWeatherConfig &inout ArtWeatherConfig, TDataObjectPtr<FWorldAreaConfig> &inout WorldAreaConfig) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        bool __r; return __r;
    }
    UFUNCTION()
    void ClientJob_OutputWeather(const FECSEntity &inout PlayerEntity, const FCS_TimeOfDay &inout TimeOfDay, const FC_PlayerController &inout PlayerController, const FC_PlayerControllerWeatherEntity &inout CharacterWeatherComp) const
    {
        int local_218 = 0;
        FCS_DebugViewWeatherAndTOD local_226;
        int local_272 = 0;
        int local_273;
        FECSWorldPtr local_2 = this.GetECSWorld();
        FCS_ClientWeatherEffect local_8;
        bool local_10 = !(local_8.WeatherConfig.IsSet());
        TDataObjectPtr<FWeatherConfig> local_34 = local_8.WeatherConfig;
        TDataObjectPtr<FWorldAreaConfig> local_82 = local_8.WorldAreaConfig;
        TDataObjectPtr<FWeatherConfig> local_130 = TDataObjectPtr<FWeatherConfig>(nullptr);
        TDataObjectPtr<FWorldAreaConfig> local_178 = TDataObjectPtr<FWorldAreaConfig>(nullptr);
        FArtWeatherConfig local_206;
        const FECSEntity& local_208 = CharacterWeatherComp.GetWeatherEntity();
        FECSEntity local_212 = FECSEntity(ENTITY_NULL);
        if (local_208.IsValid())
        {
            local_130 = local_218.GetWeatherConfig();
            local_212 = local_218.GetSourceEntity();
        }
        bool local_219 = local_10;
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        bool local_229 = local_226 && !((local_226.ForceArtWeatherName == NAME_None));
        if (local_229)
        {
            FArtWeatherSingleParam local_234;
            local_234.ArtWeatherName = local_226.ForceArtWeatherName;
            local_234.BlendInTime = local_226.ForceArtWeatherBlendTime;
            local_206.ArtWeathers.Add(local_234);
            if (local_219)
            {
                local_229 = true;
            }
            else
            {
                local_229 = local_226.bIsDirty;
            }
            local_219 = local_229;
            local_226.bIsDirty = false;
        }
        else
        {
            this.GetArtWeatherConfig(local_212, local_130, local_206, local_178);
        }
        int local_236 = local_206.ArtWeathers.Num();
        float32 local_238 = -1.0f;
        if (local_236 > 0)
        {
            local_238 = 0.0f;
        }
        else
        {
            if (CharacterWeatherComp.GetOverrideBlendTime() >= 0.0f)
            {
                local_238 = CharacterWeatherComp.GetOverrideBlendTime();
            }
        }
        if (!((local_34 == local_130.opImplConv())) || !((local_82 == local_178.opImplConv())))
        {
            if (!((local_34 == local_130.opImplConv())))
            {
                FFPTime local_270 = FFPTime(-1);
                local_272.PrevWeatherConfig = local_34;
                local_272.NewWeatherConfig = local_130;
                local_272.NewWeatherEntity = CharacterWeatherComp.GetWeatherEntity();
            }
            local_8.WorldAreaConfig = local_178;
            local_8.WeatherConfig = local_130;
            local_8.CurrentArtWeatherStartTime = ECS::GetContextTime();
            local_8.ForceBlendTime = local_238;
            if (FMath::Abs(local_238) < 0.0001f)
            {
                local_273 = local_206.ArtWeathers.Num() - 1;
            }
            else
            {
                local_273 = 0;
            }
            local_8.CurrentArtWeatherIndex = local_273;
        }
        else
        {
            if (int(local_8.CurrentArtWeatherIndex) < (local_206.ArtWeathers.Num() - 1))
            {
                FFPTime local_276 = (ECS::GetContextTime() - local_8.CurrentArtWeatherStartTime);
                if (local_276.opCmp(local_206.ArtWeathers[int(local_8.CurrentArtWeatherIndex)].BlendInTime) >= 0)
                {
                    ++local_8.CurrentArtWeatherIndex;
                    local_8.CurrentArtWeatherStartTime = ECS::GetContextTime();
                    local_8.ForceBlendTime = local_238;
                }
            }
        }
        this.ClientUpdateArtWeather(TimeOfDay, local_8, local_219);
        KLWeather::KLWeather_UpdateGameplayLogicTime(__GetWorldContext(), (TimeOfDay.GetTimeOfDaySeconds() % 86400));
        return;
    }
    void ClientUpdateArtWeather(const FCS_TimeOfDay &inout TimeOfDay, FCS_ClientWeatherEffect &inout ClientWeather, const bool bForceRefresh) const
    {
        float32 local_21 = 0.0f;
        if (Debug::CVar_Debug_EnableArtWeatherUpdate.GetInt() == 0)
        {
            return;
        }
        if (ClientWeather.ArtWeatherConfig.ArtWeathers.Num() == 0)
        {
            XWarning(ELog(44), "ArtWeatherConfig is empty");
            return;
        }
        if (int(ClientWeather.CurrentArtWeatherIndex) < 0 || (int(ClientWeather.CurrentArtWeatherIndex) >= ClientWeather.ArtWeatherConfig.ArtWeathers.Num()))
        {
            return;
        }
        FName local_12 = KLWeather::KLWeather_GetWeatherName(__GetWorldContext());
        float32 local_14 = KLWeather::KLWeather_GetTimeInSeconds(__GetWorldContext());
        bool local_5 = KLWeather::KLWeather_IsDuringBlending(__GetWorldContext());
        FName local_17(ClientWeather.ArtWeatherConfig.ArtWeathers[int(ClientWeather.CurrentArtWeatherIndex)].ArtWeatherName);
        float32 local_18 = (TimeOfDay.GetTimeOfDaySeconds() % 86400);
        if ((!((local_17 == NAME_None)) && !(local_5)) && (bForceRefresh || !((local_12 == local_17)) || (local_14 != local_18)))
        {
            float32 local_20;
            local_20 = 0.0f;
            if (!(KLLoadingScreen::IsLoadingScreenVisible(__GetWorldContext())))
            {
                if (ClientWeather.ForceBlendTime >= 0.0f)
                {
                }
                else
                {
                    int local_1_2 = ClientWeather.CurrentArtWeatherIndex;
                }
                local_20 = local_21;
            }
            KLWeather::KLWeather_SetWeather(__GetWorldContext(), local_17, local_18, local_20, true);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_DebugDrawWeatherInfo(const FCE_ClientToServerDebugDrawWeahterInfo &inout Event) const
    {
        if (Event.bDrawWeatherInfo)
        {
            bool local_1 = true;
            FECSWorldPtr local_4 = this.GetECSWorld();
            FCS_SyncDebugWeatherInfo local_10;
            Assign local_8;
            local_8.opCall(local_10).bDrawWeatherInfo = local_1;
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        Remove local_14;
        local_14.opCall();
        FECSWorldPtr local_4_3 = this.GetECSWorld();
        FECSWorldPtr::Clear(local_4_3).opCall(EECSRegType(0));
        FECSWorldPtr local_4_4 = this.GetECSWorld();
        FECSWorldPtr::Clear(local_4_4).opCall(EECSRegType(0));
        return;
    }
    UFUNCTION()
    void ServerJob_SyncDebugWeatherInfo(const FECSEntity &inout RegionEntity, const FCS_SyncDebugWeatherInfo &inout SyncDebugWeatherInfo, const FC_RegionWeatherData &inout RegionWeatherData) const
    {
        int local_8 = 0;
        int local_22 = 0;
        if (SyncDebugWeatherInfo.bDrawWeatherInfo)
        {
            local_8.SetWeatherTemplate(RegionWeatherData.GetWeatherTemplate());
            local_8.SetRuntimeOverrideWeatherTemplate(RegionWeatherData.GetRuntimeOverrideWeatherTemplate());
            local_8.SetWeatherEntity(RegionWeatherData.GetWeatherEntity());
            local_8.SetUpdatedTimeStamp(RegionWeatherData.GetUpdatedTimeStamp());
            local_8.SetDuration(RegionWeatherData.GetDuration());
            local_8.SetElapsedTime(RegionWeatherData.GetElapsedTime());
            Get local_14;
            const FC_RuntimeOverrideRegionWeather& local_16 = local_14.opCall();
            if (local_16)
            {
                local_22.SetWeatherConfig(local_16.WeatherConfig);
                local_22.SetDuration(local_16.Duration);
                local_22.SetArtWeatherBlendTime(local_16.ArtWeatherBlendTime);
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_DebugWeather(const FECSEntity &inout PlayerEntity, const FC_PlayerController &inout PlayerController) const
    {
        FCS_DebugViewWeatherAndTOD local_8;
        int local_46 = 0;
        FString local_58;
        FECSWorldPtr local_2 = this.GetECSWorld();
        if (!(!(local_8)) && local_8.bDrawWeatherInfo)
        {
            int local_49;
            int local_48;
            int local_47;
            FCS_ClientWeatherEffect local_16;
            FECSWorldPtr local_2_2 = this.GetECSWorld();
            GetDefaulted local_24;
            FECSEntity local_20 = FECSEntity(local_24.opCall().GetWeatherEntity());
            FName local_26(NAME_None);
            FName local_28(NAME_None);
            FECSEntity local_32 = FECSEntity(ENTITY_NULL);
            if (local_20.IsActive())
            {
                Get local_36;
                const FC_WeatherEffect& local_38 = local_36.opCall();
                if (local_38)
                {
                    local_32 = local_38.GetSourceEntity();
                    local_26 = local_38.GetSourceEntity().GetEntityName();
                    local_28 = local_38.GetWeatherTemplate().GetDataName();
                }
            }
            FECSWorldPtr local_2_3 = this.GetECSWorld();
            ::FTimeOfDayUtils::GetTimeOfDayHourAndMinute(local_46.GetTimeOfDaySeconds(), local_47, local_48, local_49);
            FString local_54 = FString().Append(local_48);
            if (local_48 < 10)
            {
                local_54 = (FString("0") + local_54);
            }
            FString local_66 = FString().Append(local_49);
            if (local_49 < 10)
            {
                local_66 = (FString("0") + local_66);
            }
            FName local_40 = KLWeather::KLWeather_GetWeatherName(__GetWorldContext());
            float32 local_72 = KLWeather::KLWeather_GetTimeInSeconds(__GetWorldContext());
            bool local_9 = (int(local_16.CurrentArtWeatherIndex) < (local_16.ArtWeatherConfig.ArtWeathers.Num() - 1));
            FArtWeatherSingleParam local_80;
            if (int(local_16.CurrentArtWeatherIndex) >= 0 && (int(local_16.CurrentArtWeatherIndex) < local_16.ArtWeatherConfig.ArtWeathers.Num()))
            {
                local_80 = local_16.ArtWeatherConfig.ArtWeathers[int(local_16.CurrentArtWeatherIndex)];
            }
            FString local_84 = "";
            Get local_88;
            const FC_DebugRegionWeatherData& local_90 = local_88.opCall();
            if (local_90)
            {
                local_84 = FString().Append(" duration: ").Append(local_90.GetDuration()).Append(" elapsed: ").Append(local_90.GetElapsedTime());
            }
            if (local_9)
            {
                local_58 = "(Fading)";
            }
            else
            {
                local_58 = "";
            }
            FString local_96 = (FString("Time: ") + local_54);
            FString local_96_2 = ((local_96 + ":") + local_66);
            FString local_62_2 = (local_96_2 + "(");
            int local_75 = local_46.GetTimeOfDaySeconds();
            FString local_96_3 = (local_62_2 + local_75);
            FString local_62_3 = (local_96_3 + ")");
            FString local_96_4 = (local_62_3 + "  Stage:");
            FString local_62_4 = (local_96_4 + local_46.GetTODStageName());
            FString local_96_5 = (local_62_4 + "  LogicWeather:");
            FString local_62_5 = (local_96_5 + local_16.WeatherConfig.GetDataName());
            FString local_96_6 = (local_62_5 + "  ");
            FString local_62_6 = (local_96_6 + local_84);
            FString local_96_7 = (local_62_6 + "  ArtWeather:");
            FString local_62_7 = (local_96_7 + local_80.ArtWeatherName);
            FString local_96_8 = (local_62_7 + local_58);
            FString local_62_8 = (local_96_8 + "(Actual:");
            FString local_96_9 = (local_62_8 + local_40);
            FString local_62_9 = (local_96_9 + "  ");
            FString local_96_10 = (local_62_9 + local_72);
            FString local_62_10 = (local_96_10 + ")");
            FString local_96_11 = (local_62_10 + "  Template:");
            FString local_62_11 = (local_96_11 + local_28);
            FString local_96_12 = (local_62_11 + "   RegionName: ");
            FString local_62_12 = (local_96_12 + local_26);
            Get local_104;
            const FC_Transform& local_106 = local_104.opCall();
            if (local_106)
            {
                FString local_110 = (FString("   Position:") + local_106.GetPosition().ToString());
                local_62_12 += local_110;
            }
            System::PrintString(__GetWorldContext(), local_62_12, true, false, FLinearColor::Green, -1.0f, n"Debug_Weather");
            this.DebugPrintWeatherSourceEntityInfo(local_32);
        }
        return;
    }
    void AppendWeatherInitPolicyInfo(FString &inout S) const
    {
        S += "  InitPolicy: ";
        FString local_4 = "None";
        if (::FLevelUtils::GetCurrentLevelInfoConfig(nullptr).IsSet())
        {
            FString local_58 = FString();
        }
        S += local_4;
        return;
    }
    void DebugPrintWeatherSourceEntityInfo(const FECSEntity &inout WeatherSourceEntity) const
    {
        int local_16 = 0;
        const FC_DebugRegionWeatherData& local_32;
        FString local_4 = "Extra Info:";
        if (WeatherSourceEntity.IsValid())
        {
            Has local_10;
            bool local_5 = local_10.opCall();
            if (local_5)
            {
                FString local_22 = " Source: WeatherTint: ";
                FName local_18 = local_16.WeatherName.GetDataName();
                FString local_26 = (local_22 + local_18);
                local_4 += local_26;
            }
            else
            {
                FString local_22;
                Get local_30;
                local_32 = local_30.opCall();
                if (local_32)
                {
                    Get local_36;
                    if (local_36.opCall())
                    {
                        int local_39 = WeatherSourceEntity.GetIdValue();
                        FString local_26_2 = (FString(" Source: RegionVolume: ") + local_39);
                        local_4 += local_26_2;
                    }
                    else
                    {
                        local_22 = FString(" Source: Global Region: ");
                        int local_39_2 = WeatherSourceEntity.GetIdValue();
                        FString local_26_3 = (local_22 + local_39_2);
                        local_4 += local_26_3;
                    }
                    if (::FWeatherUtils::GetWorldAreaConfigFromRegionEntity(WeatherSourceEntity).IsSet())
                    {
                        FString local_92 = (FString(" WorldAreaConfig: ") + local_22);
                        local_4 += local_92;
                    }
                    else
                    {
                        local_4 += " WorldAreaConfig: None";
                    }
                }
                else
                {
                    int local_39_3 = WeatherSourceEntity.GetIdValue();
                    FString local_92_2 = (FString(" Source: No WeatherData Entity:") + local_39_3);
                    local_4 += local_92_2;
                }
            }
        }
        else
        {
            local_4 += " Source: Unknown";
        }
        if (local_32)
        {
            FString local_22 = "   Template:";
            FName local_18_2 = local_32.GetWeatherTemplate().GetDataName();
            FString local_92_3 = (local_22 + local_18_2);
            FString local_26_4 = (local_92_3 + "  OverrideTemplate: ");
            FName local_18_3 = local_32.GetRuntimeOverrideWeatherTemplate().GetDataName();
            FString local_92_4 = (local_26_4 + local_18_3);
            local_4 += local_92_4;
        }
        System::PrintString(__GetWorldContext(), local_4, true, false, FLinearColor::Green, -1.0f, n"Debug_Weather1");
        if (local_32)
        {
            FString local_22;
            TDataObjectPtr<FWeatherGenerateTemplate> local_122 = local_32.GetUsingWeatherTemplate();
            FName local_18_4 = local_122.GetDataName();
            local_4 = (FString(" Using Template: ") + local_18_4);
            Get local_152;
            const FC_DebugOverrideRegionWeatherData& local_154 = local_152.opCall();
            if (local_154)
            {
                FString local_92_5 = ((FString("  OverrideWeather: ") + local_154.GetWeatherConfig().GetDataName()) + " Duration:");
                float32 local_97 = local_154.GetDuration();
                local_22 = (local_92_5 + local_97);
                FString local_26_5 = (local_22 + " BlendTime:");
                float32 local_97_2 = local_154.GetArtWeatherBlendTime();
                local_22 = (local_26_5 + local_97_2);
                local_4 += local_22;
            }
            else
            {
                local_4 += "  OverrideWeather: None";
            }
            this.AppendWeatherInitPolicyInfo(local_4);
            System::PrintString(__GetWorldContext(), local_4, true, false, FLinearColor::Green, -1.0f, n"Debug_Weather2");
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_OutputWeather() const
    {
        int local_12 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_54 = 0;
        int local_186 = 0;
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
                this.ClientJob_OutputWeather(local_46, local_12, local_48, local_54);
            }
            local_2.UpdateCachedEntityCount(local_23);
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
        bool local_9 = local_2.BeginViewCacheBuild();
        int local_24 = local_2.GetViewCacheEpoch();
        int local_114 = 0;
        FECSRuntimeViewIterator local_148 = local_96.Iterator();
        for (; local_148.CanProceed;)
        {
            local_46 = local_148.Proceed();
            ++local_114;
            if (local_9)
            {
                local_2.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.ClientJob_OutputWeather(local_186, local_12, local_48, local_54);
        }
        local_2.UpdateCachedEntityCount(local_114);
        if (local_9)
        {
            local_2.CommitViewCacheBuild(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DebugDrawWeatherInfo() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ClientToServerDebugDrawWeahterInfo> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ClientToServerDebugDrawWeahterInfo& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_DebugDrawWeatherInfo(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_SyncDebugWeatherInfo() const
    {
        int local_12 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_172 = 0;
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
                this.ServerJob_SyncDebugWeatherInfo(local_46, local_12, local_48);
            }
            local_2.UpdateCachedEntityCount(local_23);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Exclude(local_90).opCall();
        bool local_9 = local_2.BeginViewCacheBuild();
        int local_24 = local_2.GetViewCacheEpoch();
        int local_100 = 0;
        FECSRuntimeViewIterator local_134 = local_90.Iterator();
        for (; local_134.CanProceed;)
        {
            local_46 = local_134.Proceed();
            ++local_100;
            if (local_9)
            {
                local_2.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.ServerJob_SyncDebugWeatherInfo(local_172, local_12, local_48);
        }
        local_2.UpdateCachedEntityCount(local_100);
        if (local_9)
        {
            local_2.CommitViewCacheBuild(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_DebugWeather() const
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
                this.ClientJob_DebugWeather(local_36, local_38);
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
            this.ClientJob_DebugWeather(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}


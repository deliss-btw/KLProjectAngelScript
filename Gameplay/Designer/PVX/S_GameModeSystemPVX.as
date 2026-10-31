class US_ASGameModeSystemPVX : US_ECSScriptGameModeSystemBase
{
    US_ASGameModeSystemPVX()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return FGameModeUtils::CVar_GameMode_UseUniversalSystem.GetBool();
    }
    UFUNCTION()
    void ServerJob_Begin() const
    {
        int local_8 = 0;
        int local_16 = 0;
        int local_76 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        local_8.SetStageType(EFCS_GameStageType(1));
        ::FGameModeUtils::InitAttributeScale(this.GetECSWorld());
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        local_16.SetGameModeType(EGameModeType(1));
        local_16.SetbPVXGame(true);
        local_16.SetbPVPGame(true);
        UAS_GameModeSettingsPVX local_26 = (Cast<UAS_GameModeSettingsPVX>(UECSGameModeSettingsBase::Get(ECS::GetUEWorld())));
        if ((!((local_26 != nullptr))))
        {
            XError(ELog(0), "we need a UAS_GameModeSettingsPVX!");
        }
        UGameDSConnectionSubsystem local_30 = ::UGameDSConnectionSubsystem::Get();
        if (local_30 != nullptr)
        {
            if (local_30.IsConnectedToGameServer())
            {
                FPbDsGlobalInfo local_42 = local_30.GetDSGlobalInfo();
                if (local_42.GetPvxGlobalInfo().IsValid())
                {
                    this.InitPVXMatchData(local_42.GetPvxGlobalInfo());
                }
            }
        }
        FECSWorldPtr local_2_3 = this.GetECSWorld();
        Has local_66;
        bool local_18 = local_66.opCall();
        if (local_18)
        {
            int local_77;
            XLog(ELog(27), FString().Append("PVX HandleClientJoin"));
            FECSWorldPtr local_2_4 = this.GetECSWorld();
            local_77 = local_26.SelectRoleTime;
            local_76.SetSelectRoleEndTime((ECS::GetContextTime() + FFPTime(local_77)));
            local_76.SetSelectRoleTotalTime(FFPTime(local_77));
        }
        FFPTime local_84 = FFPTime(-1);
        FECSWorldPtr local_2_5 = this.GetECSWorld();
        SendEvent local_88;
        local_88.opCall(ENTITY_NULL, local_84);
        return;
    }
    UFUNCTION()
    void ServerJob_TickPrepare() const
    {
        int local_28 = 0;
        int local_46 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        Has local_6;
        bool local_7 = !(local_6.opCall());
        if (local_7)
        {
            local_7 = true;
        }
        else
        {
            FECSWorldPtr local_2_2 = this.GetECSWorld();
            Get local_12;
            local_7 = (int(local_12.opCall().GetStageType()) != 1);
        }
        if (local_7)
        {
            return;
        }
        if (::FLevelDataLayerUtils::IsWaitingForStreaming(this.GetWorld(), false))
        {
            return;
        }
        if (!(::FGameModeUtils::IsInitialLoadingComplete()))
        {
            return;
        }
        FECSWorldPtr local_2_3 = this.GetECSWorld();
        Has local_22;
        bool local_16 = local_22.opCall();
        if (local_16)
        {
            FECSWorldPtr local_2_4 = this.GetECSWorld();
            if (ECS::GetContextTime().opCmp(local_28.GetSelectRoleEndTime()) > 0)
            {
                XLog(ELog(27), FString().Append("PVX SelectRoleEndTime"));
                FECSWorldPtr local_2_5 = this.GetECSWorld();
                Has local_40;
                if (!(local_40.opCall()))
                {
                    ::FGameModeUtils::InitTeamSpawner(this.GetECSWorld());
                }
                FECSWorldPtr local_2_6 = this.GetECSWorld();
                XLog(ELog(22), "FinishPrepareGameEvent");
                FFPTime local_30 = FFPTime(-1);
                FECSWorldPtr local_2_7 = this.GetECSWorld();
                SendEvent local_50;
                local_50.opCall(ENTITY_NULL, local_30);
                FFPTime local_30_2 = FFPTime(-1);
                FECSWorldPtr local_2_8 = this.GetECSWorld();
                SendEvent local_54;
                local_54.opCall(ENTITY_NULL, local_30_2);
                local_46.SetStageType(EFCS_GameStageType(2));
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_TickStart() const
    {
        UAS_GameModeSettingsPVX local_24;
        int local_30 = 0;
        bool local_34 = false;
        if (::FLevelDataLayerUtils::IsWaitingForStreaming(this.GetWorld(), false))
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
        Has local_14;
        bool local_3 = !(local_14.opCall());
        if (local_3)
        {
            local_3 = true;
        }
        else
        {
            FECSWorldPtr local_6_3 = this.GetECSWorld();
            Get local_18;
            local_3 = !(local_18.opCall().GetbInitialized());
        }
        if (local_3)
        {
            local_24 = (Cast<UAS_GameModeSettingsPVX>(UECSGameModeSettingsBase::Get(ECS::GetUEWorld())));
            if (local_24 != nullptr && local_24.PhaseTrackingCommissionConfig.IsSet())
            {
                ::PVXPhaseTracking::Init(local_24.PhaseTrackingCommissionConfig);
            }
        }
        FECSWorldPtr local_6_4 = this.GetECSWorld();
        if (int(local_30.GetStageType()) != 0)
        {
            this.TickCreatePlayerController();
            if (int(local_30.GetStageType()) == 2)
            {
                local_34 = false;
                FECSRuntimeView local_72 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
                Include local_76;
                local_76.opCall();
                int local_77 = 0;
                FECSRuntimeViewIterator local_112 = local_72.Iterator();
                for (; local_112.CanProceed;)
                {
                    local_112.Proceed();
                    ++local_77;
                }
                FECSWorldPtr local_6_5 = this.GetECSWorld();
                if ((local_77 == 0.GetPlayerEntries().Num()))
                {
                    this.TickStart();
                    local_30.SetStageType(EFCS_GameStageType(3));
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_TickPlaying() const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        if ((int(0.GetStageType())) == 3)
        {
            this.TickPlaying();
        }
        return;
    }
    void TickStart() const
    {
        bool local_19;
        int local_148 = 0;
        int local_154 = 0;
        int local_164 = 0;
        int local_174 = 0;
        FECSEntityId local_193;
        int local_204 = 0;
        int local_262;
        int local_282 = 0;
        int local_288;
        FECSWorldPtr local_2 = this.GetECSWorld();
        UKLGameModeSettings local_14 = (Cast<UKLGameModeSettings>(UECSGameModeSettingsBase::Get(ECS::GetUEWorld())));
        if ((!((local_14 != nullptr))))
        {
            XError(ELog(0), "GameModeSettings is null");
            return;
        }
        int local_21 = 0;
        FECSRuntimeView local_60 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_64;
        local_64.opCall();
        Include local_68;
        local_68.opCall();
        XLog(ELog(27), FString().Append("PVX TickStart"));
        FECSRuntimeViewIterator local_106 = local_60.Iterator();
        Get local_312;
        for (; local_106.CanProceed;)
        {
            const FECSEntity& local_142 = local_106.Proceed();
            Has local_158;
            local_19 = local_158.opCall();
            if (local_19)
            {
                if (!(local_164.GetbReady()))
                {
                    local_164.SetbReady(true);
                }
            }
            FECSWorldPtr local_2_2 = this.GetECSWorld();
            Has local_168;
            local_19 = local_168.opCall();
            if (local_19)
            {
                int local_180;
                int local_179;
                FECSWorldPtr local_2_3 = this.GetECSWorld();
                local_179 = local_154.GetPlayerTeamID();
                local_180 = local_154.GetPlayerInTeamIndex();
                TArray<FECSEntityId> local_184;
                local_184 = local_174.GetRandomTeamSpawnersByRandomGroup(local_179);
                if (local_184.IsValidIndex(local_180))
                {
                    local_154.SetSpawnPoint(FECSEntity(local_184[local_180]));
                    FName local_196 = local_154.GetSpawnPoint().GetEntityName();
                    int local_194 = local_154.GetPlayerInTeamIndex();
                    int local_22 = local_154.GetPlayerTeamID();
                    local_142.GetId();
                    XLog(ELog(27), FString().Append("PVX PlayerInfoPVX.SpawnPoint(fallback index) ").Append(local_193).Append(local_193).Append(" PlayerTeamID=").Append(local_22).Append(" PlayerInTeamIndex=").Append(local_194).Append(" SpawnPoint="));
                }
                else
                {
                    XError(ELog(22), "PlayerTeamID or PlayerInTeamIndex is invalid (or Boss team 4 has no spawner at index)");
                }
            }
            int local_22_2 = local_154.GetBossPrefabIdx();
            int local_197 = int(local_154.GetFaction());
            local_142.GetId();
            int local_194_2 = local_154.GetBossPrefabIdx();
            int local_197_2 = int(local_154.GetFaction());
            local_142.GetId();
            XLog(ELog(27), FString().Append("PVX SpawnPVXPlayer ").Append(local_193).Append(local_193).Append(" Faction=").Append(local_197_2).Append(" BossPrefabIdx="));
            FECSWorldPtr local_2_4 = this.GetECSWorld();
            FPVX_PlayerData local_256;
            local_256.SetLevel(1);
            local_256.SetExp(0);
            local_256.SetScore(0);
            local_256.SetTeamId(local_154.GetPlayerTeamID());
            local_256.SetPlayerInTeamIndex(local_154.GetPlayerInTeamIndex());
            GetDefaulted local_260;
            local_256.SetPlayerName(local_260.opCall().GetNickName());
            local_256.SetPlayerUID(::FASCommonUtils::GetPlayerUidFromPlayerEntity(local_142));
            int local_261 = local_154.GetPlayerAvatarID();
            local_262 = local_261;
            if (local_262 != 0)
            {
                local_19 = false;
            }
            else
            {
                Has local_266;
                local_19 = local_266.opCall();
            }
            if (local_19)
            {
                Get local_272;
                local_261 = local_272.opCall().GetPlayerSpecialtyID();
                local_262 = local_261;
            }
            local_256.SetPlayerAvatarID(local_262);
            Has local_276;
            local_19 = local_276.opCall();
            if (local_19)
            {
                if (local_282.GetDivineSkillData().GetSkillConfig())
                {
                    local_256.SetPlayerDivineSkillID(local_261);
                }
            }
            local_256.SetKills(0);
            local_256.SetDeaths(0);
            local_256.SetAssists(0);
            local_256.SetCurrencyAmount(0);
            local_204.Add(local_142, local_256);
            for (auto& local_302 : local_288)
            {
                ::PVXUtil::ReplaceInitAttribute(local_302, local_256.GetLevel());
            }
            local_142.GetId();
            FECSWorldPtr local_2_5 = this.GetECSWorld();
            local_194_2 = local_148.GetPlayerId();
            ++local_21;
            FECSWorldPtr local_2_6 = this.GetECSWorld();
            if (!(local_312.opCall().GetbHasStarted()))
            {
                FECSWorldPtr local_2_7 = this.GetECSWorld();
                FECSWorldPtr local_2_8 = this.GetECSWorld();
                int local_318 = (ECS::GetContextTime() + FFPTime(1200));
                ECS::GetContextTime();
                bool local_267 = true;
                FECSWorldPtr local_2_9 = this.GetECSWorld();
                Modify local_316;
                local_316.opCall().SetbHasStarted(local_267);
            }
        }
        return;
    }
    void TickPlaying() const
    {
        int local_14 = 0;
        Modify local_22;
        int local_28 = 0;
        UAS_GameModeSettingsPVX local_36;
        Include local_100;
        int local_190 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        Has local_6;
        bool local_7 = local_6.opCall();
        if (local_7)
        {
            float32 local_37;
            int local_23;
            Get local_12;
            FECSWorldPtr local_2_2 = this.GetECSWorld();
            FFPTime local_16 = ECS::GetContextTime();
            if (local_16.opCmp(local_14) > 0)
            {
                FECSWorldPtr local_2_3 = this.GetECSWorld();
                if (local_22.opCall().GetWinnerTeamId() < 0)
                {
                    FECSWorldPtr local_2_4 = this.GetECSWorld();
                    local_22.opCall().SetWinnerTeamId(4);
                }
            }
            FFPTime local_16_2 = ECS::GetContextTime();
            FECSWorldPtr local_2_5 = this.GetECSWorld();
            local_36 = (Cast<UAS_GameModeSettingsPVX>(UECSGameModeSettingsBase::Get(ECS::GetUEWorld())));
            FECSWorldPtr local_2_6 = this.GetECSWorld();
            local_37 = local_12.opCall().GetExpMultiplier();
            for (auto& local_52 : local_36.Time_ExpMultiplier_Datas)
            {
                if ((ECS::GetContextTime().opCmp((local_28 + FFPTime(int(local_52.Time)))) >= 0 && ((local_37 < local_52.ExpMultiplier))))
                {
                    FECSWorldPtr local_2_7 = this.GetECSWorld();
                    local_22.opCall().SetExpMultiplier(local_52.ExpMultiplier);
                    FECSWorldPtr local_2_8 = this.GetECSWorld();
                    local_22.opCall().SetMonsterPowerBuffConfig(local_52.BuffConfig);
                    if (local_52.MessageHintConfig)
                    {
                        FECSRuntimeView local_96 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
                        local_100.opCall();
                        FECSRuntimeViewIterator local_134 = local_96.Iterator();
                        for (; local_134.CanProceed;)
                        {
                            ::BlueprintFunctions_Level::Level_SendMessageHint(FECSEntityAdapter(local_134.Proceed()), local_52.MessageHintConfig, TArray<FTextArgument>());
                        }
                    }
                    FFPTime local_56 = FFPTime(-1);
                    FECSWorldPtr local_2_9 = this.GetECSWorld();
                    local_190.CustomName = n"PVX_EXP_MULTIPLIER_UPDATE";
                }
            }
            local_23 = 0;
            for (; local_23 < local_36.LevelProgressDatas.Num(); ++local_23)
            {
                const FLevelProgressData& local_194 = local_36.LevelProgressDatas[local_23];
                if (local_16_2.opCmp((local_28 + FFPTime(int(local_194.Time)))) >= 0)
                {
                    FECSWorldPtr local_2_10 = this.GetECSWorld();
                    bool local_57 = local_12.opCall().GetHasTriggeredLevelProgressArray().Contains(local_23);
                    if (local_57)
                    {
                        continue;
                    }
                    FECSWorldPtr local_2_11 = this.GetECSWorld();
                    local_22.opCall().GetModify_HasTriggeredLevelProgressArray().Add(local_23);
                    if (local_194.MessageHintConfig)
                    {
                        FECSRuntimeView local_76 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
                        local_100.opCall();
                        FECSRuntimeViewIterator local_168 = local_76.Iterator();
                        for (; local_168.CanProceed;)
                        {
                            ::BlueprintFunctions_Level::Level_SendMessageHint(FECSEntityAdapter(local_168.Proceed()), local_194.MessageHintConfig, TArray<FTextArgument>());
                        }
                    }
                    FFPTime local_26 = FFPTime(-1);
                    FECSWorldPtr local_2_12 = this.GetECSWorld();
                    local_190.CustomName = local_194.CustomName;
                }
            }
        }
        return;
    }
    UFUNCTION()
    void OnCustomLevelEvent(const FCE_CustomLevelEvent &inout Event) const
    {
        int local_18 = 0;
        if ((Event.CustomName == n"PVX_WIN_TEMP"))
        {
            if (Event.Sender.IsValid())
            {
                int local_25;
                Modify local_24;
                Get local_8;
                FECSEntity local_12 = local_8.opCall().GetPlayerEntity();
                FECSWorldPtr local_20 = this.GetECSWorld();
                local_25 = local_24.opCall().GetWinnerTeamId();
                if (local_25 < 0)
                {
                    int local_1 = local_18.GetPlayerTeamID();
                    FECSWorldPtr local_20_2 = this.GetECSWorld();
                    local_24.opCall().SetWinnerTeamId(local_1);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleReviveTeleport(FCE_Event_ReviveTeleport &inout Event) const
    {
        if (Event.Sender.IsValid())
        {
            Get local_6;
            FECSEntity local_10 = local_6.opCall().GetPlayerEntity();
            FECSEntity local_14 = FECSEntity(Event.Sender);
            FECSEntity local_18 = int(Event.SkipNearestCount) > 0 ? this.GetOtherRevivePoint(Event, this.GetRevivePoint(Event)) : this.GetRevivePoint(Event);
            if (local_18.IsValid())
            {
                FVector local_60 = (::FASCommonUtils::GetEntityLocation(local_18) + FVector(0.0, 0.0, 100.0));
                GetDefaulted local_70;
                ::BlueprintFunctions_Common::TeleportEntityToLocation(FECSEntityAdapter(local_14), ::FASCommonUtils::FindLegalLocationExt(local_14, local_60, 400.0f, 200.0f, 4, FVector(100.0, 100.0, 200.0), false), local_70.opCall().GetRotation().Rotator(), false, FRotator::ZeroRotator, false, true, ELoadingScreenAction(0), true);
            }
        }
        return;
    }
    FECSEntity GetRevivePoint(FCE_Event_ReviveTeleport &inout Event) const
    {
        float32 local_39;
        int local_164 = 0;
        int local_170 = 0;
        bool local_171;
        Get local_4;
        FECSEntity local_8 = local_4.opCall().GetPlayerEntity();
        FECSEntity local_12 = FECSEntity(Event.Sender);
        Get local_16;
        FECSEntity local_20 = FECSEntity(local_16.opCall().GetSpawnPoint());
        FGameplayTag local_22 = ::PVXUtil::GetEntityTeamTag(local_8);
        Has local_30;
        if (!(local_8.IsValid()) || !(local_30.opCall()) || !(local_22.IsValid()))
        {
            FECSEntity local_36;
            if (local_20.IsValid())
            {
                local_36 = local_20;
            }
            else
            {
                local_36 = ENTITY_NULL;
            }
            return local_36;
        }
        if (local_20.IsValid())
        {
            local_39 = ::FASCommonUtils::CalculateEntityDistance3D(local_12, local_20);
        }
        else
        {
            local_39 = 999999.0f;
        }
        FECSRuntimeView local_80 = Event.Sender.GetWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
        FECSRuntimeViewIterator local_122 = local_80.Iterator();
        for (; local_122.CanProceed;)
        {
            const FECSEntity& local_158 = local_122.Proceed();
            if (!(local_164.Match(local_22)))
            {
                continue;
            }
            local_171 = false;
            for (auto& local_186 : Event.SpecificPrefabClass)
            {
                if (local_170.PrefabClass.opArrow().IsChildOf(local_186))
                {
                    local_171 = true;
                    break;
                }
            }
            if (!(local_171))
            {
                continue;
            }
            float32 local_38 = ::FASCommonUtils::CalculateEntityDistance3D(local_12, local_158);
            if (local_38 < local_39)
            {
                local_39 = local_38;
                local_20 = local_158;
            }
        }
        FECSEntity local_36;
        if (local_20.IsValid())
        {
            local_36 = local_20;
        }
        else
        {
            local_36 = ENTITY_NULL;
        }
        return local_36;
    }
    FECSEntity GetOtherRevivePoint(FCE_Event_ReviveTeleport &inout Event, const FECSEntity &inout ExcludePoint) const
    {
        int local_162 = 0;
        int local_168 = 0;
        bool local_169;
        Get local_4;
        FECSEntity local_8 = local_4.opCall().GetPlayerEntity();
        FECSEntity local_12 = FECSEntity(Event.Sender);
        FGameplayTag local_14 = ::PVXUtil::GetEntityTeamTag(local_8);
        Has local_22;
        if (!(local_8.IsValid()) || !(local_22.opCall()) || !(local_14.IsValid()))
        {
            return ENTITY_NULL;
        }
        FECSEntity local_28 = FECSEntity(ENTITY_NULL);
        float32 local_29 = 999999.0f;
        Get local_34;
        FECSEntity local_38 = FECSEntity(local_34.opCall().GetSpawnPoint());
        if (local_38.IsValid() && !((local_38 == ExcludePoint)))
        {
            local_29 = ::FASCommonUtils::CalculateEntityDistance3D(local_12, local_38);
            local_28 = local_38;
        }
        FECSRuntimeView local_78 = Event.Sender.GetWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_82;
        local_82.opCall();
        Include local_86;
        local_86.opCall();
        FECSRuntimeViewIterator local_120 = local_78.Iterator();
        for (; local_120.CanProceed;)
        {
            const FECSEntity& local_156 = local_120.Proceed();
            if ((local_156 == ExcludePoint))
            {
                continue;
            }
            if (!(local_162.Match(local_14)))
            {
                continue;
            }
            local_169 = false;
            for (auto& local_184 : Event.SpecificPrefabClass)
            {
                if (local_168.PrefabClass.opArrow().IsChildOf(local_184))
                {
                    local_169 = true;
                    break;
                }
            }
            if (!(local_169))
            {
                continue;
            }
            float32 local_30 = ::FASCommonUtils::CalculateEntityDistance3D(local_12, local_156);
            if (local_30 < local_29)
            {
                local_29 = local_30;
                local_28 = local_156;
            }
        }
        if (!(local_28.IsValid()) && ExcludePoint.IsValid())
        {
            return ExcludePoint;
        }
        return local_28;
    }
    UFUNCTION()
    void Job_HandleReborn(const FCE_Reborn &inout Event) const
    {
        return;
    }
    void TickFinish() const
    {
        return;
    }
    bool SpawnPVXPlayer(const FECSEntity &inout PlayerEntity, const EFaction Faction, const int BossPrefabIdx = -1, const FECSEntity &inout SpawnPoint = ENTITY_NULL, const FString &inout UserNameOverride = "") const
    {
        int local_6 = 0;
        APlayerStartPIE local_22;
        Get local_60;
        const FC_Transform& local_62;
        FVector local_12(FVector::ZeroVector);
        FQuat local_20 = FQuat(FQuat::Identity);
        if (local_22 != nullptr)
        {
            local_12 = local_22.GetActorLocation();
            local_20 = FRotator(0.0, local_22.GetActorRotation().Yaw, 0.0).Quaternion();
        }
        else
        {
            if (SpawnPoint.IsValid())
            {
                local_62 = local_60.opCall();
                if (local_62)
                {
                    const FC_Transform& local_64;
                    local_12 = local_64.GetPosition();
                    local_20 = local_64.GetRotation();
                }
            }
            else
            {
                TArray<FECSEntity> local_72;
                FECSWorldPtr local_66 = PlayerEntity.GetWorld();
                if (local_72.Num() > 0)
                {
                    FECSEntity local_78 = FECSEntity(local_72[FMath::RandRange(0, (local_72.Num() - 1))]);
                    if (local_60.opCall())
                    {
                        local_12 = local_62.GetPosition();
                        local_20 = local_62.GetRotation();
                    }
                }
                else
                {
                    XWarning(ELog(0), "SpawnPVXPlayer failed to find a valid spawn point!");
                }
            }
        }
        UAS_GameModeSettingsPVX local_88 = (Cast<UAS_GameModeSettingsPVX>(UECSGameModeSettingsBase::Get(ECS::GetUEWorld())));
        if ((!((local_88 != nullptr))))
        {
            XError(ELog(0), "SpawnPVXPlayer failed, GameModeSettings is null, we need a UAS_GameModeSettingsPVX!");
            return false;
        }
        if (int(Faction) == 1)
        {
            int local_89;
            Get local_94;
            int local_95 = local_94.opCall().GetPlayerAvatarID();
            local_89 = local_95;
            TDataObjectPtr<FAvatarPrefabConfig> local_120;
            if (local_89 <= 0)
            {
                Get local_124;
                local_95 = local_124.opCall().GetPlayerSpecialtyID();
                local_89 = local_95;
            }
            if (local_89 > 0)
            {
                GetDataObjectByGSDataId<FAvatarPrefabConfig> local_148;
                local_120 = local_148.opImplConv();
            }
            else
            {
                if (local_88.ChangeRoleDataObjects.Num() > 0)
                {
                    local_120 = local_88.ChangeRoleDataObjects[0];
                    local_89 = local_95;
                }
            }
            Modify local_200;
            local_200.opCall().SetPlayerAvatarID(local_89);
            if ((!((local_120 == nullptr))))
            {
                FNameHandle_EntityBBVarInt local_224;
                FName local_206 = FName(FString().Append("Pawn_").Append(local_6.GetPlayerId()));
                FECSEntity local_214 = ::FGameModeUtils::CreateAvatarEntity(PlayerEntity, local_6, local_12, local_20, local_120, TSubclassOf<AECSPrefab>(nullptr), local_206, true, true);
                local_214.IsValid();
                Modify local_218;
                FC_Faction& local_220 = local_218.opCall();
                if (local_220)
                {
                    local_220.SetFactionId(EFaction(Faction));
                    ::FFactionUtils::InitFactionRelationForEntity(local_214, local_220);
                }
                local_224;
                int local_79 = PlayerEntity.GetBB_Int(local_224);
                local_224;
                PlayerEntity.SetBB_Int(local_224, n"iRefillTimes");
                local_224;
                int local_74_2 = PlayerEntity.GetBB_Int(local_224);
                local_224;
                PlayerEntity.SetBB_Int(local_224, n"iRefillTimesMax");
            }
        }
        else
        {
            if (int(Faction) == 6)
            {
                if (BossPrefabIdx >= 0 && (BossPrefabIdx < local_88.BossPrefabs.Num()))
                {
                    FName local_206_2 = FName(FString().Append("Pawn_").Append(local_6.GetPlayerId()).Append("_0"));
                    ::FGameModeUtils::CreateAvatarEntity(PlayerEntity, local_6, local_12, local_20, TDataObjectPtr<FAvatarPrefabConfig>(nullptr), local_88.BossPrefabs[BossPrefabIdx], local_206_2, true, true).IsValid();
                }
            }
        }
        int local_74_3 = local_6.GetAllPlayerPawnEntities().Num();
        local_6.SetPlayerPawnEntity(local_6.GetAllPlayerPawnEntities()[0]);
        bool local_207 = !(UserNameOverride.IsEmpty());
        if (local_74_3 > 0)
        {
            Modify local_228;
            FC_DSPlayerInfo& local_230 = local_228.opCall();
            if (local_230)
            {
                local_230.SetNickName(UserNameOverride);
            }
        }
        return true;
    }
    UFUNCTION()
    void ServerJob_TickPlayerEnter(const FCE_PlayerEnterPVX &inout Event) const
    {
        int local_12;
        if (Event.Sender.IsValid())
        {
            ModifyOrAdd local_6;
            FC_InitInfoPVX& local_8 = local_6.opCall();
            if (local_8)
            {
                int local_11;
                local_11 = int(Event.bIsInvader);
                if (local_11 != 0)
                {
                    local_11 = 1;
                }
                else
                {
                    bool local_1 = (int(Event.BossPrefabIdx) >= 0);
                    local_11 = local_1;
                }
                if (local_11 != 0)
                {
                    local_12 = 2;
                }
                else
                {
                    local_12 = 1;
                }
                local_8.Faction = EFaction(local_12);
                local_8.BossPrefabIdx = int(Event.BossPrefabIdx);
                local_8.SpawnPoint = Event.SpawnPoint;
                local_8.UserNameOverride = Event.UserNameOverride;
                local_8.PlayerPrefabIdx = int(Event.PlayerPrefabIdx);
            }
            ModifyOrAdd local_18;
            FC_PlayerInfoPVX& local_20 = local_18.opCall();
            if (local_20)
            {
                local_20.SetSpawnPoint(Event.SpawnPoint);
                local_20.SetBossPrefabIdx(int(Event.BossPrefabIdx));
                if (int(Event.BossPrefabIdx) >= 0)
                {
                    local_20.SetFaction(EFaction(6));
                }
                else
                {
                    if (Event.bIsInvader)
                    {
                        local_20.SetFaction(EFaction(2));
                    }
                    else
                    {
                        local_20.SetFaction(EFaction(1));
                    }
                }
            }
            ModifyOrAdd local_24;
            FC_PlayerStates& local_26 = local_24.opCall();
            if (local_26)
            {
                local_26.SetbReady(true);
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandlePlayerSelectInfo(const FCE_PlayerSelectInfoPVX &inout Event) const
    {
        int local_16 = 0;
        int local_32 = 0;
        int local_38 = 0;
        int local_46 = 0;
        UAS_GameModeSettingsPVX local_62;
        if (Event.Sender.IsValid())
        {
            FCE_PlayerSelectChangePVX local_72;
            FECSEntityId local_7;
            Event.Sender.GetId();
            XLog(ELog(27), FString().Append("PVX HandlePlayerSelectInfo Before ").Append(local_7).Append(local_7).Append(" PlayerAvatarID=").Append(Event.PlayerAvatarID).Append(" PlayerMonsterIdx=").Append(Event.PlayerMonsterIdx).Append(" bIsReady="));
            FECSWorldPtr local_10 = this.GetECSWorld();
            if (int(local_16.GetStageType()) != 1)
            {
                return;
            }
            Event.Sender.GetId();
            XLog(ELog(27), FString().Append("PVX HandlePlayerSelectInfo Final ").Append(local_7).Append(local_7).Append(" PlayerAvatarID=").Append(Event.PlayerAvatarID).Append(" PlayerMonsterIdx=").Append(Event.PlayerMonsterIdx).Append(" bIsReady="));
            int local_26 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(FECSEntity(Event.Sender));
            FECSWorldPtr local_10_2 = this.GetECSWorld();
            if (!(local_32.GetPlayerEntries().Contains(local_26)))
            {
                return;
            }
            if (!(local_38.GetbReady()) == (!(Event.bIsReady)))
            {
                return;
            }
            local_38.SetbReady(Event.bIsReady);
            FPVX_MatchPlayerEntry local_54 = FPVX_MatchPlayerEntry(local_32.GetPlayerEntries()[local_26]);
            local_62 = (Cast<UAS_GameModeSettingsPVX>(UECSGameModeSettingsBase::Get(ECS::GetUEWorld())));
            if ((!((local_62 != nullptr))))
            {
                return;
            }
            if (int(local_54.GetFaction()) == 1)
            {
                if (local_46.GetPlayerAvatarID() != int(Event.PlayerAvatarID))
                {
                    local_46.SetPlayerAvatarID(int(Event.PlayerAvatarID));
                }
            }
            else
            {
                if (int(local_54.GetFaction()) == 6)
                {
                    if (local_62.BossPrefabs.IsValidIndex(int(Event.PlayerMonsterIdx)) && (local_46.GetBossPrefabIdx() != int(Event.PlayerMonsterIdx)))
                    {
                        local_46.SetBossPrefabIdx(int(Event.PlayerMonsterIdx));
                    }
                }
            }
            FFPTime local_70 = FFPTime(-1);
            FECSWorldPtr local_10_3 = this.GetECSWorld();
            local_72.PlayerAvatarID = int(Event.PlayerAvatarID);
            local_72.PlayerMonsterIdx = int(Event.PlayerMonsterIdx);
            local_72.bIsReady = Event.bIsReady;
        }
        return;
    }
    UFUNCTION()
    void Job_HandleDeath(const FCE_DeathEvent &inout Event) const
    {
        this.DeathProcess(Event, Event.Sender, Event.Time);
        return;
    }
    void DeathProcess(const FCE_DeathEvent &inout Event, const FECSEntity &inout DeadEntity, const FFPTime &inout Time) const
    {
        int local_38 = 0;
        bool local_279;
        int local_324 = 0;
        int local_461;
        FECSEntity& local_494;
        int local_551;
        int local_556 = 0;
        UAS_GameModeSettingsPVX local_8 = (Cast<UAS_GameModeSettingsPVX>(UECSGameModeSettingsBase::Get(ECS::GetUEWorld())));
        if (!((local_8 != nullptr)))
        {
            XError(ELog(33), "we need a UAS_GameModeSettingsPVX!");
            return;
        }
        bool local_11 = false;
        int local_12 = 0;
        Has local_18;
        bool local_9 = local_18.opCall();
        if (local_9)
        {
            const FECSEntity& local_86;
            Get local_46;
            int local_41;
            int local_40;
            int local_39;
            int local_29;
            Get local_28;
            local_29 = int(local_28.opCall().GetFaction());
            FECSWorldPtr local_32 = this.GetECSWorld();
            local_39 = local_38.GetExp();
            if (!(local_38.GetbInLevelProtect()))
            {
                local_40 = local_38.GetLevel();
                if (local_38.GetLevel() > 1)
                {
                    local_41 = local_38.GetLevel();
                    local_41 = local_41 - 1;
                    local_38.SetLevel(local_41);
                    local_38.SetExp(::PVXUtil::GetLevelRequiredExp(local_38.GetLevel(), EFaction(local_29)));
                }
                else
                {
                    local_38.SetLevel(1);
                    local_38.SetExp(0);
                }
                if (local_38.GetLevel() != local_40)
                {
                    const FC_PlayerController& local_48 = local_46.opCall();
                    if (local_48)
                    {
                        FDataObjectPtr local_72 = FDataObjectPtr(local_38.GetLastOverrideAttributeData());
                        auto local_78 = local_48.GetAllPlayerPawnEntities().Iterator();
                        for (; local_78.CanProceed;)
                        {
                            local_86 = local_78.Proceed();
                            local_38.SetLastOverrideAttributeData(local_72);
                            ::PVXUtil::OverrideGameAttributeByDelta(local_86, local_38.GetLevel());
                        }
                    }
                }
                local_38.SetbInLevelProtect(true);
            }
            else
            {
                local_38.SetExp(::PVXUtil::GetLevelRequiredExp(local_38.GetLevel(), EFaction(local_29)));
            }
            int local_13 = local_39 - local_38.GetExp();
            local_12 = local_13 + 300;
            int local_87 = local_38.GetDeaths();
            local_13 = local_87 + 1;
            local_38.SetDeaths(local_13);
            local_11 = true;
        }
        FECSEntity local_92 = FECSEntity(Event.KilledByEntity);
        TDataObjectPtr<FBasePrefabConfig> local_120 = ::GetPrefabConfigPtr(DeadEntity);
        if ((local_120.GetDataName() == local_8.HelpMonsterPrefab.GetDataName()))
        {
            FECSEntity local_304;
            Get local_154;
            bool local_149;
            int local_40;
            int local_39;
            local_149 = false;
            FVector local_160(local_154.opCall().GetPosition());
            FRotator local_172 = local_154.opCall().GetRotation().Rotator();
            FVector local_178 = local_160;
            FVector local_202 = (local_160 - FVector(0.0, 0.0, 1000000.0));
            TArray<AActor> local_206;
            FHitResult local_272;
            local_40 = 20;
            local_39 = 0;
            for (; local_39 < 20; ++local_39)
            {
                bool local_299 = System::LineTraceSingle(__GetWorldContext(), local_178, local_202, ETraceTypeQuery(5), false, local_206, EDrawDebugTrace(0), local_272, true, FLinearColor(1.0f, 0.0f, 0.0f, 1.0f), FLinearColor(0.0f, 1.0f, 0.0f, 1.0f), 5.0f);
                if (local_299)
                {
                    local_160 = local_272.ImpactPoint;
                    break;
                }
            }
            UClass local_306;
            ::BlueprintFunctions_Common::SpawnProp(FECSEntityAdapter(local_92), TSoftClassPtr<APropPrefab>(local_306), local_160, local_172, local_304, false, 1000.0f, 50.0f);
            ::FLevelUtils::SendCustomLevelEvent(DeadEntity, n"PVXBossDeath");
        }
        FECSWorldPtr local_32_2 = this.GetECSWorld();
        XLog(ELog(0), "PVX DeathProcess: Received death event for entity");
        FECSEntity local_96 = FECSEntity(FECSEntityId(Event.KilledByEntity));
        if (local_96)
        {
            FECSEntity local_304;
            Get local_154;
            bool local_149;
            const FECSEntity& local_86;
            Get local_46;
            int local_41;
            int local_40;
            int local_39;
            int local_29;
            Get local_28;
            bool local_297;
            local_297 = local_18.opCall();
            if (local_297)
            {
                int local_437;
                FECSWorldPtr local_32_3 = this.GetECSWorld();
                TDataObjectPtr<FBasePrefabConfig> local_144 = ::GetPrefabConfigPtr(DeadEntity);
                local_29 = int(local_28.opCall().GetFaction());
                FECSRuntimeView local_364 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
                Include local_368;
                local_368.opCall();
                local_39 = 0;
                FECSRuntimeViewIterator local_402 = local_364.Iterator();
                for (; local_402.CanProceed;)
                {
                    FECSEntity local_24 = local_402.Proceed();
                    ++local_39;
                }
                local_40 = 0;
                local_437 = 0;
                TArray<FPVX_MonsterKillExpConfig> local_442;
                local_8.MonsterKillExpDataTable.GetAllRows(local_442);
                local_149 = false;
                for (auto& local_456 : local_442)
                {
                    if ((local_456.GetMonsterConfig().GetDataName() == local_144.GetDataName()))
                    {
                        local_149 = true;
                        local_279 = local_456.UseExpMul;
                        if (local_279)
                        {
                            FECSWorldPtr local_32_4 = this.GetECSWorld();
                            Get local_460;
                            float local_287 = local_460.opCall().GetExpMultiplier();
                            local_461 = int(local_287);
                            local_287 = int(local_456.Exp);
                            local_40 = uint((local_287 * local_461));
                            local_287 = int(local_456.Coin) * local_461;
                            local_437 = uint(local_287);
                        }
                        else
                        {
                            local_40 = int(local_456.Exp);
                            local_437 = int(local_456.Coin);
                        }
                        break;
                    }
                }
                int local_462 = 0;
                if (local_12 > 0)
                {
                    local_462 = 1;
                    local_40 = local_40 + local_12;
                    int local_87_2 = local_38.GetKills() + 1;
                    local_38.SetKills(local_87_2);
                }
                else
                {
                    if (!(local_149))
                    {
                        local_462 = 2;
                        local_40 = 100;
                    }
                }
                if (local_40 > 0)
                {
                    int local_479;
                    FVector local_160_2(FVector::ZeroVector);
                    Has local_466;
                    local_297 = local_466.opCall();
                    if (local_297)
                    {
                        local_160_2 = local_154.opCall().GetPosition();
                    }
                    TArray<FECSEntity> local_470;
                    local_470 = ::BlueprintFunctions_Common::GetAllPlayerEntitiesInRangeAS(local_160_2, 1000000.0f, false);
                    TArray<FECSEntity> local_478;
                    local_479 = local_46.opCall().GetTeam();
                    auto local_486 = local_470.Iterator();
                    for (; local_486.CanProceed;)
                    {
                        FECSEntity local_24_2 = local_486.Proceed();
                        Has local_498;
                        bool local_9_2 = local_498.opCall();
                        local_297 = local_9_2 && ((local_46.opCall().GetTeam() == local_479));
                        if (local_297)
                        {
                            local_478.Add(local_494);
                        }
                    }
                    local_279 = local_462 == 1 && (local_478.Num() > 0);
                    if (local_279)
                    {
                        local_40 = uint((local_40 / local_478.Num()));
                    }
                    TDataObjectPtr<FItemConfig> local_522 = local_8.CurrencyItemConfig;
                    if (local_522)
                    {
                        if (local_462 != 1)
                        {
                            local_279 = false;
                        }
                        else
                        {
                            local_279 = local_18.opCall();
                        }
                        if (local_279 && (local_478.Num() > 0))
                        {
                            Get local_22;
                            local_304 = FECSEntity(local_22.opCall().GetPlayerEntity());
                            int local_87_3 = ::InventoryUtils::GetInventoryItemNumber(local_304, local_522);
                            int local_547 = FMath::IntegerDivisionTrunc(local_87_3, 4);
                            if (local_547 > 0)
                            {
                                ::InventoryUtils::RemoveInventoryItem(local_304, local_522, local_547);
                                local_324.GetModify_PlayerInfoMap()[local_304].SetCurrencyAmount(::InventoryUtils::GetInventoryItemNumber(local_304, local_522));
                                int local_548 = local_478.Num();
                                local_41 = FMath::IntegerDivisionTrunc(local_547, local_548);
                                int local_550 = local_547 - (local_41 * local_548);
                                int local_552 = 0;
                                for (; local_552 < local_478.Num(); ++local_552)
                                {
                                    if (local_552 < local_550)
                                    {
                                        local_551 = 1;
                                    }
                                    else
                                    {
                                        local_551 = 0;
                                    }
                                    int local_13_2 = local_41 + local_551;
                                    if (local_13_2 > 0)
                                    {
                                        ::InventoryUtils::AddInventoryItem(local_478[local_552], local_522, local_13_2);
                                        local_324.GetModify_PlayerInfoMap()[local_478[local_552]].SetCurrencyAmount(::InventoryUtils::GetInventoryItemNumber(local_478[local_552], local_522));
                                    }
                                }
                            }
                        }
                        else
                        {
                            if (local_437 > 0)
                            {
                                auto local_492 = local_478.Iterator();
                                for (; local_492.CanProceed;)
                                {
                                    FECSEntity local_24_3 = local_492.Proceed();
                                    ::InventoryUtils::AddInventoryItem(local_24_3, local_522, local_437);
                                    local_324.GetModify_PlayerInfoMap()[local_24_3].SetCurrencyAmount(::InventoryUtils::GetInventoryItemNumber(local_24_3, local_522));
                                }
                            }
                        }
                    }
                    local_461 = 6000.0f;
                    auto local_486_2 = local_478.Iterator();
                    for (; local_486_2.CanProceed;)
                    {
                        FECSEntity local_24_4 = local_486_2.Proceed();
                        FECSWorldPtr local_32_5 = this.GetECSWorld();
                        if (local_462 == 1 && !((local_24_4 == local_86)))
                        {
                            local_304 = FECSEntity(local_46.opCall().GetPlayerPawnEntity());
                            local_297 = local_304.IsValid() && local_96.IsValid();
                            if (local_297 && (::FASCommonUtils::CalculateEntityDistance3D(local_96, local_304) <= 6000.0f))
                            {
                                local_556.SetAssists(local_556.GetAssists() + 1);
                            }
                        }
                        local_41 = local_556.GetLevel();
                        local_556.SetExp((local_556.GetExp() + local_40));
                        local_556.SetLevel(::PVXUtil::GetLevelByExp(local_556.GetExp(), EFaction(local_29)));
                        if (local_41 < local_556.GetLevel())
                        {
                            int local_571;
                            local_556.SetbInLevelProtect(false);
                            local_304 = FECSEntity(local_46.opCall().GetPlayerPawnEntity());
                            Has local_560;
                            bool local_9_3 = local_560.opCall();
                            if (local_9_3 && (local_29 != 6))
                            {
                                TArray<FECSEntity> local_564 = local_46.opCall().GetAllPlayerPawnEntities();
                                auto local_492_2 = local_564.Iterator();
                                for (; local_492_2.CanProceed;)
                                {
                                    local_494 = local_492_2.Proceed();
                                    if (!((local_494 == local_304)))
                                    {
                                        local_304 = local_494;
                                        break;
                                    }
                                }
                            }
                            ::PVXUtil::OverrideGameAttributeByDelta(local_304, local_556.GetLevel());
                            local_571 = int(local_28.opCall().GetFaction());
                            ::PVXUtil::ApplyLevelUpBuff(local_304, EFaction(local_571), local_8.LevelUpBuff_Player, local_8.LevelUpBuff_Boss);
                            if (local_571 == 6)
                            {
                                FPVXBossEvolveSettings local_622;
                                local_556.SetLastEvolveLevel_Boss(::PVXUtil::TryEvolveBoss(local_8.UpgradeMonsterDatas, local_41, local_556.GetLevel(), local_556.GetLastEvolveLevel_Boss(), local_304, local_622));
                            }
                        }
                    }
                    if (local_11)
                    {
                        if (!(local_96))
                        {
                            local_297 = false;
                        }
                        else
                        {
                            local_297 = local_18.opCall();
                        }
                        if (local_297)
                        {
                            TArray<FTextArgument> local_630;
                            Make local_636;
                            local_630.Add(local_636.opImplConv());
                            Make local_648;
                            local_630.Add(local_648.opImplConv());
                            ::BlueprintFunctions_Level::Level_SendMessageHint(FECSEntityAdapter(local_96), local_8.MessageHintConfig_PlayerKill, local_630);
                        }
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_InitFakeCharacter_PVX(const FECSEntity &inout FakeEntity, const FC_FakeCharacterInit &inout FakeCharacterInit, const FCS_FixedTime &inout Time) const
    {
        int local_18 = 0;
        int local_34 = 0;
        int local_44 = 0;
        Has local_4;
        bool local_5 = local_4.opCall();
        if (!(local_5))
        {
            local_5 = false;
        }
        else
        {
            local_5 = FakeCharacterInit;
        }
        if (local_5)
        {
            int local_28;
            EFaction local_19;
            local_19 = EFaction(1);
            FECSWorldPtr local_22 = this.GetECSWorld();
            Has local_26;
            bool local_6 = local_26.opCall();
            if (local_6)
            {
                int local_27;
                local_27 = local_18.GetPlayerId();
                FECSWorldPtr local_22_2 = this.GetECSWorld();
                if (local_34.GetPlayerMatchDatas().Contains(local_27))
                {
                    local_19 = local_34.GetPlayerMatchDatas()[local_27].GetFaction();
                }
            }
            local_28 = (int(local_19) == 6) ? local_18.GetAllPlayerPawnEntities().IndexOfByKey(FakeCharacterInit.SwitchOutEntity) : -1;
            if (local_28 != -1)
            {
                local_18.GetModify_AllPlayerPawnEntities()[local_28] = FakeEntity;
            }
            else
            {
                if (!(local_18.GetAllPlayerPawnEntities().Contains(FakeEntity)))
                {
                    local_18.GetModify_AllPlayerPawnEntities().Add(FakeEntity);
                }
            }
            FECSWorldPtr local_22_3 = this.GetECSWorld();
            ::PVXUtil::OverrideGameAttribute(FakeEntity, local_44.GetLevel());
        }
        return;
    }
    void InitPVXMatchData(const FPbPvXGlobalInfo &inout FPbPVXMathData) const
    {
        int local_14 = 0;
        int local_39;
        int local_41;
        int local_51;
        XLog(ELog(27), FString().Append("PVX InitPVXMatchData"));
        if (FPbPVXMathData.IsValid())
        {
            int local_16;
            if (!(ECS::GetECSWorld().IsValid()))
            {
                return;
            }
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            local_14.GetModify_PlayerEntries().Empty(0);
            local_16 = FPbPVXMathData.GetUidCampId_Num();
            int local_18 = 0;
            for (; local_18 < local_16; )
            {
                FPbUint32Pair local_38 = FPbPVXMathData.GetUidCampId_Index(local_18);
                local_39 = local_38.GetFirst();
                local_41 = local_38.GetSecond();
                XLog(ELog(27), FString().Append("PVX Pair Uid=").Append(local_39).Append(" CampId=").Append(local_41));
                FPVX_MatchPlayerEntry local_50;
                local_50.SetUid(local_39);
                if (local_41 == 1)
                {
                    local_51 = EFaction(1);
                }
                else
                {
                    local_51 = EFaction(6);
                }
                local_50.SetFaction(EFaction(local_51));
                local_14.GetModify_PlayerEntries().Add(local_39, local_50);
                ++local_18;
            }
            local_41 = FPbPVXMathData.GetUidList_Num();
            int local_53 = 0;
            local_18 = 0;
            for (; local_18 < local_41; local_53 = local_53 + 1, ++local_18)
            {
                FPbUidList local_64 = FPbPVXMathData.GetUidList_Index(local_18);
                local_39 = local_64.GetValList_Num();
                int local_75 = 0;
                for (; local_75 < local_39; ++local_75)
                {
                    int local_77 = local_64.GetValList_Index(local_75);
                    if (!(local_14.GetPlayerEntries().Contains(local_77)))
                    {
                        continue;
                    }
                    int local_83 = (int(local_14.GetPlayerEntries()[local_77].GetFaction())) == 6 ? 4 : local_53;
                    local_14.GetModify_PlayerEntries()[local_77].SetTeamId(local_83);
                    local_14.GetModify_PlayerEntries()[local_77].SetPlayerInTeamIndex(local_75);
                    XLog(ELog(27), FString().Append("PVX Team Uid=").Append(local_77).Append(" TeamID=").Append(local_83).Append(", PlayerInTeamIndex=").Append(local_75));
                }
            }
        }
        return;
    }
    void TickCreatePlayerController() const
    {
        UAS_GameModeSettingsPVX local_66;
        bool local_73 = false;
        int local_80 = 0;
        int local_82 = 0;
        int local_155;
        int local_184 = 0;
        int local_198 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        Has local_6;
        bool local_7 = local_6.opCall();
        if (local_7)
        {
            ::FGameModeUtils::HandleClientJoin();
            FECSRuntimeView local_46 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
            Include local_50;
            local_50.opCall();
            Exclude(local_46).opCall();
            Exclude(local_46).opCall();
            local_66 = (Cast<UAS_GameModeSettingsPVX>(UECSGameModeSettingsBase::Get(ECS::GetUEWorld())));
            if (!((local_66 != nullptr)))
            {
                XError(ELog(0), "we need a UAS_GameModeSettingsPVX!");
            }
            UGameDSConnectionSubsystem local_72 = ::UGameDSConnectionSubsystem::Get();
            local_73 = local_72 != nullptr && local_72.IsConnectedToGameServer();
            FECSWorldPtr local_2_2 = this.GetECSWorld();
            int local_81 = 0;
            int local_84 = local_80.GetPlayerEntries().Num();
            FECSRuntimeViewIterator local_118 = local_46.Iterator();
            for (; local_118.CanProceed;)
            {
                const FECSEntity& local_154 = local_118.Proceed();
                local_155 = local_82;
                Has local_160;
                bool local_7_2 = local_160.opCall();
                if (local_7_2)
                {
                    Get local_164;
                    local_155 = local_164.opCall().GetPlayerSpecialtyID();
                }
                local_82 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(local_154);
                local_184.SetPlayerAvatarID(local_155);
                local_184.SetBossPrefabIdx(0);
                if (local_80.GetPlayerEntries().Contains(local_82))
                {
                    local_184.SetPlayerTeamID(local_80.GetPlayerEntries()[local_82].GetTeamId());
                    local_184.SetPlayerInTeamIndex(local_80.GetPlayerEntries()[local_82].GetPlayerInTeamIndex());
                    local_184.SetFaction(local_80.GetPlayerEntries()[local_82].GetFaction());
                    XLog(ELog(27), FString().Append("PVX PlayerInfoPVX ").Append(local_82).Append(" PlayerTeamID=").Append(local_184.GetPlayerTeamID()).Append(" PlayerInTeamIndex=").Append(local_184.GetPlayerInTeamIndex()).Append(" Faction=").Append(int(local_184.GetFaction())));
                    if (local_198)
                    {
                        int local_199 = local_184.GetPlayerTeamID();
                        local_198.SetTeam(uint8(local_199));
                        XLog(ELog(27), FString().Append("PVX PlayerController ").Append(local_82).Append(" Team=").Append(local_198.GetTeam()));
                    }
                }
            }
        }
        return;
    }
    void InitPVXMatchDataInPIE() const
    {
        int local_14 = 0;
        UAS_GameModeSettingsPVX local_24;
        FECSWorldPtr local_2 = this.GetECSWorld();
        Has local_6;
        if (!(local_6.opCall()))
        {
            FECSWorldPtr local_2_2 = this.GetECSWorld();
            local_14.GetModify_PlayerEntries().Empty(0);
            local_24 = (Cast<UAS_GameModeSettingsPVX>(UECSGameModeSettingsBase::Get(ECS::GetUEWorld())));
            if ((!((local_24 != nullptr))))
            {
                XError(ELog(0), "need a UAS_GameModeSettingsPVX!");
                return;
            }
            int local_26 = 1;
            int local_28 = 0;
            if (local_24.bEnablePIEQuickTest)
            {
                int local_15 = local_24.PIE_Team1AvatarIndexList.Num();
                if (local_15 > 0)
                {
                    int local_30 = 0;
                    for (; local_30 < local_15; )
                    {
                        FPVX_MatchPlayerEntry local_40;
                        local_40.SetUid(local_26);
                        local_40.SetFaction(EFaction(1));
                        local_40.SetTeamId(0);
                        local_40.SetPlayerInTeamIndex(local_30);
                        local_40.SetPlayerPrefabIdx(local_24.PIE_Team1AvatarIndexList[local_30]);
                        local_14.GetModify_PlayerEntries().Add(local_26, local_40);
                        XLog(ELog(27), FString().Append("PIEPVX AddPlayer=").Append(local_26).Append(", PlayerPrefabIdx=").Append(local_40.GetPlayerPrefabIdx()).Append(" PlayerBossPrefabIdx=").Append(local_40.GetBossPrefabIdx()).Append(", TeamId=").Append(local_40.GetTeamId()).Append(", TeamIndex=").Append(local_40.GetPlayerInTeamIndex()));
                        local_28 = local_28 + 1;
                        local_26 = local_26 + 1;
                        ++local_30;
                    }
                }
                if (local_24.PIE_Team2AvatarIndexList.Num() > 0)
                {
                    int local_29 = local_24.PIE_Team2AvatarIndexList.Num();
                    if (local_29 > 0)
                    {
                        int local_50 = 0;
                        for (; local_50 < local_29; )
                        {
                            FPVX_MatchPlayerEntry local_40;
                            local_40.SetUid(local_26);
                            local_40.SetFaction(EFaction(1));
                            local_40.SetTeamId(1);
                            local_40.SetPlayerInTeamIndex(local_50);
                            local_40.SetPlayerPrefabIdx(local_24.PIE_Team2AvatarIndexList[local_50]);
                            local_14.GetModify_PlayerEntries().Add(local_26, local_40);
                            XLog(ELog(27), FString().Append("PIEPVX AddPlayer=").Append(local_26).Append(", PlayerPrefabIdx=").Append(local_40.GetPlayerPrefabIdx()).Append(" PlayerBossPrefabIdx=").Append(local_40.GetBossPrefabIdx()).Append(", TeamId=").Append(local_40.GetTeamId()).Append(", TeamIndex=").Append(local_40.GetPlayerInTeamIndex()));
                            local_28 = local_28 + 1;
                            local_26 = local_26 + 1;
                            ++local_50;
                        }
                    }
                }
                if (int(local_24.PIE_TeamBossPrefabIdx) >= 0)
                {
                    FPVX_MatchPlayerEntry local_40;
                    local_40.SetUid(local_26);
                    local_40.SetFaction(EFaction(6));
                    local_40.SetTeamId(4);
                    local_40.SetPlayerInTeamIndex(0);
                    local_40.SetBossPrefabIdx(int(local_24.PIE_TeamBossPrefabIdx));
                    local_14.GetModify_PlayerEntries().Add(local_26, local_40);
                    XLog(ELog(27), FString().Append("PIEPVX AddBoss=").Append(local_26).Append(", PlayerPrefabIdx=").Append(local_40.GetPlayerPrefabIdx()).Append(" PlayerBossPrefabIdx=").Append(local_40.GetBossPrefabIdx()).Append(", TeamId=").Append(local_40.GetTeamId()).Append(", TeamIndex=").Append(local_40.GetPlayerInTeamIndex()));
                    local_28 = local_28 + 1;
                    local_26 = local_26 + 1;
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_Begin() const
    {
        ECS::GetContextJob();
        this.ServerJob_Begin();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TickPrepare() const
    {
        ECS::GetContextJob();
        this.ServerJob_TickPrepare();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TickStart() const
    {
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1))))
        {
            return;
        }
        this.ServerJob_TickStart();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TickPlaying() const
    {
        ECS::GetContextJob();
        this.ServerJob_TickPlaying();
        return;
    }
    UFUNCTION()
    void Run_OnCustomLevelEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_CustomLevelEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_CustomLevelEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.OnCustomLevelEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleReviveTeleport() const
    {
        ECS::GetContextJob();
        TECSEventIterator<FCE_Event_ReviveTeleport> local_36 = FECSWorldPtr::PatchEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            FCE_Event_ReviveTeleport& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleReviveTeleport(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleReborn() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_Reborn> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_Reborn& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleReborn(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TickPlayerEnter() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerEnterPVX> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayerEnterPVX& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_TickPlayerEnter(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandlePlayerSelectInfo() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerSelectInfoPVX> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayerSelectInfoPVX& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                XError(ELog(3), (FString("Validate Failed: FCE_PlayerSelectInfoPVX, sender") + local_60.Sender.ToString()));
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandlePlayerSelectInfo(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleDeath() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DeathEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DeathEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleDeath(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_InitFakeCharacter_PVX() const
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
                this.ServerJob_InitFakeCharacter_PVX(local_40, local_42, local_6);
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
            this.ServerJob_InitFakeCharacter_PVX(local_166, local_42, local_6);
        }
        local_4.UpdateCachedEntityCount(local_94);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
}


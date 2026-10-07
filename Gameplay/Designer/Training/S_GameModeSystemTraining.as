

class US_ASGameModeSystemTraining : US_ECSScriptGameModeSystemBase
{
    US_ASGameModeSystemTraining()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_Begin() const
    {
        int local_8 = 0;
        int local_16 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        local_8.SetStageType(EFCS_GameStageType(1));
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        if (int(local_16.GetGameModeType()) != 0 || local_16.GetbPVPGame() || local_16.GetbPVXGame())
        {
            XError(ELog(45), FString().Append("[TrainingSpawn] Dirty FCS_GameMode on training begin: GameModeType=").Append(int(local_16.GetGameModeType())).Append(", bPVPGame=").Append(local_16.GetbPVPGame()).Append(", bPVXGame=").Append(local_16.GetbPVXGame()).Append(". Reset to None."));
        }
        local_16.SetGameModeType(EGameModeType(EGameModeType(0)));
        local_16.SetbPVPGame(false);
        local_16.SetbPVXGame(false);
        local_16.SetFairModeFlags(0);
        local_16.SetCombatRestrictionFlags(0);
        ::FGameModeUtils::InitAttributeScale(this.GetECSWorld());
        return;
    }
    UFUNCTION()
    void ServerJob_TickPrepare() const
    {
        int local_32 = 0;
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
        FECSWorldPtr local_2_3 = this.GetECSWorld();
        Has local_20;
        if (!(local_20.opCall()))
        {
            this.InitTrainingInfo();
        }
        if (::FLevelDataLayerUtils::IsWaitingForStreaming(this.GetWorld(), false))
        {
            return;
        }
        if (!(::FGameModeUtils::IsInitialLoadingComplete()))
        {
            return;
        }
        FECSWorldPtr local_2_4 = this.GetECSWorld();
        Has local_26;
        if (!(local_26.opCall()))
        {
            ::FGameModeUtils::InitTeamSpawner(this.GetECSWorld());
            FECSWorldPtr local_2_5 = this.GetECSWorld();
            XLog(ELog(22), "FinishPrepareGameEvent");
            FFPTime local_40 = FFPTime(-1);
            FECSWorldPtr local_2_6 = this.GetECSWorld();
            SendEvent local_38;
            local_38.opCall(ENTITY_NULL, local_40);
            local_32.SetStageType(EFCS_GameStageType(EFCS_GameStageType(2)));
        }
        return;
    }
    UFUNCTION()
    void ServerJob_TickStart() const
    {
        int local_12 = 0;
        if (::FLevelDataLayerUtils::IsWaitingForStreaming(this.GetWorld(), false))
        {
            return;
        }
        FECSWorldPtr local_6 = this.GetECSWorld();
        if (int(local_12.GetStageType()) != 2 && (int(local_12.GetStageType()) != 3))
        {
            return;
        }
        ::FGameModeUtils::HandleClientJoin();
        if (int(local_12.GetStageType()) != 2)
        {
            return;
        }
        bool local_16 = false;
        FECSRuntimeView local_54 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_58;
        local_58.opCall();
        int local_59 = 0;
        FECSEntity local_68 = FECSEntity(ENTITY_NULL);
        FECSRuntimeViewIterator local_102 = local_54.Iterator();
        for (; local_102.CanProceed;)
        {
            local_68 = local_102.Proceed();
            ++local_59;
            if (local_59 >= 1)
            {
                break;
            }
        }
        if (local_59 >= 1)
        {
            local_16 = true;
        }
        if (local_16)
        {
            this.SpawnTrainingPlayer(local_68);
            local_12.SetStageType(EFCS_GameStageType(EFCS_GameStageType(3)));
        }
        return;
    }
    void SpawnTrainingPlayer(const FECSEntity &inout PlayerEntity) const
    {
        int local_8 = 0;
        int local_84 = 0;
        int local_90 = 0;
        int local_112 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        TDataObjectPtr<FTrainingInfoConfig> local_32 = local_8.TrainingInfo;
        if (!(local_32.IsSet()))
        {
            XError(ELog(33), "TrainConfig is null in SpawnTrainingPlayer");
            return;
        }
        const TArray<TDataObjectPtr<FAvatarBuildOverrideConfig>>& local_60 = GetTrainingAvatarConfigs();
        if (local_60.IsEmpty())
        {
            XError(ELog(33), "TrainingAvatarConfigs is empty in SpawnTrainingPlayer");
            return;
        }
        int local_62 = local_60.Num();
        if (local_62 > 2)
        {
            XError(ELog(33), FString().Append("TrainingAvatarConfigs count ").Append(local_62).Append(" exceeds max 2 in SpawnTrainingPlayer, only use the first 2"));
            local_62 = 2;
        }
        FECSEntity local_74 = FECSEntity(ENTITY_NULL);
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        Has local_78;
        bool local_57 = local_78.opCall();
        if (local_57)
        {
            FECSWorldPtr local_2_3 = this.GetECSWorld();
            if (local_84.Spawners.IsValidIndex(0))
            {
                local_74 = local_84.Spawners[0];
            }
        }
        FVector local_96(FVector::ZeroVector);
        FQuat local_104 = FQuat(FQuat::Identity);
        if (local_74.IsValid())
        {
            Get local_108;
            if (local_108.opCall())
            {
                local_96 = local_112.GetPosition();
                local_104 = local_112.GetRotation();
            }
        }
        else
        {
            XWarning(ELog(33), "SpawnTrainingPlayer failed to find a valid spawn point!");
        }
        int local_113 = 0;
        for (; local_113 < local_62; ++local_113)
        {
            TDataObjectPtr<FAvatarBuildOverrideConfig> local_138 = local_60[local_113];
            if (!(local_138.IsSet()))
            {
                XError(ELog(33), FString().Append("TrainingAvatarConfigs[").Append(local_113).Append("] is null in SpawnTrainingPlayer"));
                continue;
            }
            TDataObjectPtr<FAvatarPrefabConfig> local_210 = this.ResolveTrainingAvatarConfig(PlayerEntity, local_138);
            if (!(local_210.IsSet()))
            {
                continue;
            }
            ::FPlayerUtils::OverridePlayerAvatarBuild(PlayerEntity, local_138);
            FName local_216 = FName(FString().Append("Pawn_").Append(local_90.GetPlayerId()).Append("_").Append(local_113));
            ::FGameModeUtils::CreateAvatarEntity(PlayerEntity, local_90, local_96, local_104, local_210, TSubclassOf<AECSPrefab>(nullptr), local_216, (local_113 == 0), true).IsValid();
        }
        int local_114 = local_90.GetAllPlayerPawnEntities().Num();
        local_90.SetPlayerPawnEntity(local_90.GetAllPlayerPawnEntities()[0]);
        return;
    }
    TDataObjectPtr<FAvatarPrefabConfig> ResolveTrainingAvatarConfig(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FAvatarBuildOverrideConfig> &inout TrainingAvatarBuildConfig) const
    {
        TDataObjectPtr<FAvatarMappingConfig> local_24 = GetAvatarMappingConfig();
        if ((local_24 == nullptr))
        {
            XError(ELog(33), "AvatarMappingConfig is null");
            return TDataObjectPtr<FAvatarPrefabConfig>();
        }
        if (GetAvatar().IsEmpty())
        {
            XError(ELog(33), "AvatarMappingConfig.Avatar is empty");
            return TDataObjectPtr<FAvatarPrefabConfig>();
        }
        TDataObjectPtr<FAvatarPrefabConfig> local_122 = GetAvatar()[0];
        if (GetAvatar().Num() > 1)
        {
            Get local_128;
            const FC_DSPlayerInfo& local_130 = local_128.opCall();
            if (local_130)
            {
                EGenderType local_131;
                EGenderType local_132 = local_130.GetGender();
                local_131 = local_132;
                int local_133 = 0;
                for (; local_133 < GetAvatar().Num(); ++local_133)
                {
                    if (int(local_132) == (int(local_131)))
                    {
                        local_122 = GetAvatar()[local_133];
                        break;
                    }
                }
            }
        }
        return local_122;
    }
    void InitTrainingInfo() const
    {
        TDataObjectPtr<FTrainingInfoConfig> local_24;
        int local_61 = 0;
        UAS_GameModeSettingsTraining local_118;
        int local_130 = 0;
        FString local_138;
        UGameDSConnectionSubsystem local_26 = ::UGameDSConnectionSubsystem::Get();
        if (local_26 != nullptr)
        {
            if (local_26.IsConnectedToGameServer())
            {
                FPbDsGlobalInfo local_40 = local_26.GetDSGlobalInfo();
                if (local_40.GetTrainingGlobalInfo().IsValid())
                {
                    local_24 = ::FTrainingInfoConfig::GetByDataId(local_40.GetTrainingGlobalInfo().GetTrainingInfoId());
                }
            }
        }
        if (!(local_24.IsSet()))
        {
            local_118 = (Cast<UAS_GameModeSettingsTraining>(UECSGameModeSettingsBase::Get(ECS::GetUEWorld())));
            if (local_118 != nullptr)
            {
                if (local_118.TrainingInfos.IsValidIndex(int(local_118.SelectIndex)))
                {
                    local_24 = ::FTrainingInfoConfig::GetByDataId(local_61);
                }
            }
        }
        if (!(local_24.IsSet()))
        {
            XError(ELog(33), "TrainLevelConfig is null");
            return;
        }
        FECSWorldPtr local_124 = this.GetECSWorld();
        local_130.TrainingInfo = local_24;
        if (!(local_138.IsEmpty()))
        {
            ::FLevelDataLayerUtils::SetDatalayerRuntimeStateByName(ECS::GetUEWorld(), FName(local_138), EDataLayerRuntimeState(2));
            XLog(ELog(22), FString().Append("SpawnTrainingPlayer: Activated DataLayer: ").Append(local_138));
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
}


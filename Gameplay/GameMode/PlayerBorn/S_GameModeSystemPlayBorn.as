
const float32 PlayerBornInitCameraHeightOffset = 180f;
const float32 PlayerBornInitCameraLengthOffset = 400f;

class US_ASGameModeSystemPlayerBorn : US_ECSScriptGameModeSystemBase
{
    US_ASGameModeSystemPlayerBorn()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_Begin() const
    {
        int local_16 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        0.SetbHiddenExitLevel(true);
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        local_16.SetStageType(EFCS_GameStageType(1));
        ::FGameModeUtils::InitAttributeScale(this.GetECSWorld());
        return;
    }
    UFUNCTION()
    void ServerJob_TickPrepare() const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void ServerJob_HandlePlayerChangeSpecialty(const FCE_ClientChangeSpecialty &inout Event) const
    {
        FECSEntity local_4 = FECSEntity(Event.Sender);
        this.OnSpecialtyChange(local_4, int(Event.FromAvatarId), int(Event.ToAvatarId));
        return;
    }
    UFUNCTION()
    void ServerJob_DispatchServerSendChatFromGS(const FCE_DispatchSpecialtyChangeFromDS &inout Event) const
    {
        FECSEntity local_4 = FECSEntity(Event.Sender);
        this.OnSpecialtyChange(local_4, int(Event.FromSpecialtyID), int(Event.ToSpecialtyID));
        return;
    }
    UFUNCTION()
    void ServerJob_TickStart() const
    {
        this.TickStartPlayers();
        return;
    }
    UFUNCTION()
    void ServerJob_HandleReviveTeleport(FCE_Event_ReviveTeleport &inout Event) const
    {
        ::FGameModeUtils::DefaultReviveTeleport(Event);
        return;
    }
    void OnSpecialtyChange(const FECSEntity &inout PlayerEntity, const uint FromSpecialtyID, const uint ToSpecialtyID) const
    {
        int local_56 = 0;
        int local_70 = 0;
        if (!(PlayerEntity.IsValid()))
        {
            XError(ELog(22), "OnSpecialtyChange: PlayerEntity is invalid!");
            return;
        }
        UGameDSConnectionSubsystem local_4 = ::UGameDSConnectionSubsystem::Get();
        if (local_4 != nullptr && local_4.IsConnectedToGameServer())
        {
            int local_8;
            Get local_12;
            local_8 = local_12.opCall().GetPlayerId();
            FPbDsPlayerInfo local_34 = local_4.GetPlayerInfo(local_8);
            if (local_34.IsValid())
            {
                local_34.SetMainAvatarSpecialty(ToSpecialtyID);
                if (this.IsMainAvatar(local_34.GetAvatarCompInfo().GetCurAvatarId()))
                {
                    local_34.GetAvatarCompInfo().SetCurAvatarId(ToSpecialtyID);
                }
                else
                {
                    if (this.IsMainAvatar(local_34.GetAvatarCompInfo().GetSwitchAvatarId()))
                    {
                        local_34.GetAvatarCompInfo().SetSwitchAvatarId(ToSpecialtyID);
                    }
                }
            }
        }
        Has local_50;
        bool local_7 = local_50.opCall();
        if (local_7)
        {
            local_56.SetPlayerSpecialtyID(ToSpecialtyID);
        }
        this.OverrideAvatarBuildBySpecialty(PlayerEntity, ToSpecialtyID);
        XLog(ELog(22), "OnSpecialtyChange");
        FFPTime local_64 = FFPTime(-1);
        FECSWorldPtr local_58 = this.GetECSWorld();
        SendEvent local_62;
        local_62.opCall(ENTITY_NULL, local_64);
        FECSWorldPtr local_58_2 = this.GetECSWorld();
        local_70.SetStageType(EFCS_GameStageType(2));
        return;
    }
    bool IsMainAvatar(const uint AvatarId) const
    {
        bool local_51 = false;
        if (AvatarId == 0)
        {
            return false;
        }
        return ::FAvatarPrefabConfig::GetByDataId(AvatarId).IsSet() && local_51;
    }
    void OverrideAvatarBuildBySpecialty(const FECSEntity &inout PlayerEntity, const uint SpecialtyAvatarId) const
    {
        const UAvatarBuildSettings local_2;
        GetGameplaySettings<UAvatarBuildSettings> local_4;
        local_2 = local_4;
        if (local_2 == nullptr)
        {
            XError(ELog(22), "OverrideAvatarBuildBySpecialty: AvatarBuildSettings is null");
            return;
        }
        TDataObjectPtr<FAvatarBuildOverrideConfig> local_32;
        if (this.BuildConfigContainsAvatar(local_2.SwordSpecialtyTrainingAvatarConfig, SpecialtyAvatarId))
        {
            local_32 = local_2.SwordSpecialtyTrainingAvatarConfig;
        }
        else
        {
            if (this.BuildConfigContainsAvatar(local_2.WizardSpecialtyTrainingAvatarConfig, SpecialtyAvatarId))
            {
                local_32 = local_2.WizardSpecialtyTrainingAvatarConfig;
            }
        }
        if (!(local_32.IsSet()))
        {
            XWarning(ELog(22), FString().Append("OverrideAvatarBuildBySpecialty: no training build matches SpecialtyAvatarId=").Append(SpecialtyAvatarId));
            return;
        }
        ::FPlayerUtils::OverridePlayerAvatarBuild(PlayerEntity, local_32);
        return;
    }
    bool TrySpawnSpecialtyAvatar(const FECSEntity &inout PlayerEntity, FC_PlayerController &inout PlayerController) const
    {
        int local_82 = 0;
        int local_100 = 0;
        int local_1 = 0;
        Get local_6;
        const FC_DSPlayerInfo& local_8 = local_6.opCall();
        if (local_8)
        {
            local_1 = local_8.GetPlayerSpecialtyID();
        }
        if (local_1 == 0)
        {
            return false;
        }
        TDataObjectPtr<FAvatarPrefabConfig> local_58 = ::FAvatarPrefabConfig::GetByDataId(local_1);
        if (!(local_58.IsSet()))
        {
            return false;
        }
        FVector local_64(FVector::ZeroVector);
        FQuat local_72 = FQuat(FQuat::Identity);
        Has local_76;
        bool local_9 = local_76.opCall();
        if (local_9)
        {
            local_64 = local_82.GetLocation();
            local_72 = local_82.GetRotation().Quaternion();
        }
        else
        {
            FECSWorldPtr local_94 = this.GetECSWorld();
            TDataObjectPtr<FLevelInfoConfig> local_148 = ::FLevelUtils::GetCurrentLevelInfoConfig(nullptr);
            bool local_9_2 = false;
            if (!(::FGameModeUtils::GetSpawnLocationForPlayer(PlayerEntity, PlayerController, local_100, local_148, local_64, local_72, local_9_2)))
            {
                XWarning(ELog(33), FString().Append("TrySpawnSpecialtyAvatarForPIE: cannot find spawn location for player ").Append(PlayerController.GetPlayerId()));
            }
        }
        FName local_162 = FName(FString().Append("Pawn_").Append(PlayerController.GetPlayerId()));
        FECSEntity local_170 = ::FGameModeUtils::CreateAvatarEntity(PlayerEntity, PlayerController, local_64, local_72, local_58, TSubclassOf<AECSPrefab>(nullptr), local_162, true, true);
        if (!(local_170.IsValid()))
        {
            return false;
        }
        PlayerController.SetPlayerPawnEntity(local_170);
        return true;
    }
    bool BuildConfigContainsAvatar(const TDataObjectPtr<FAvatarBuildOverrideConfig> &inout BuildConfig, const uint AvatarId) const
    {
        if (!(BuildConfig.IsSet()))
        {
            return false;
        }
        if (!(GetAvatarMappingConfig().IsSet()))
        {
            return false;
        }
        for (auto& local_64 : GetAvatar())
        {
            if (local_64.IsSet() && (0 == AvatarId))
            {
                return true;
            }
        }
        return false;
    }
    void TickStartPlayers() const
    {
        int local_146 = 0;
        int local_152 = 0;
        int local_158 = 0;
        int local_178 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        FECSRuntimeView local_52 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_56;
        local_56.opCall();
        Include local_60;
        local_60.opCall();
        Include local_64;
        local_64.opCall();
        UGameDSConnectionSubsystem local_66 = ::UGameDSConnectionSubsystem::Get();
        FECSRuntimeViewIterator local_102 = local_52.Iterator();
        for (; local_102.CanProceed;)
        {
            const FECSEntity& local_140 = local_102.Proceed();
            if (local_146.GetbBorn())
            {
                continue;
            }
            local_146.SetbBorn(true);
            local_158.SetbReady(true);
            this.TrySpawnSpecialtyAvatar(local_140, local_152);
            FECSEntity local_168 = FECSEntity(local_140.GetId());
            FECSWorldPtr local_2_3 = this.GetECSWorld();
            int local_171 = local_152.GetPlayerId();
        }
        FECSWorldPtr local_2_4 = this.GetECSWorld();
        local_178.SetStageType(EFCS_GameStageType(3));
        return;
    }
    bool GetSpawnTransformByRule(const uint8 TeamId, const FCS_PlayerSpawnerIndex &inout SpawnerIndex, const TDataObjectPtr<FLevelInfoConfig> &inout LevelInfoConfig, FVector &inout Position, FQuat &inout Rotation) const
    {
        Position = FVector::ZeroVector;
        Rotation = FQuat::Identity;
        ESpawnPointSelectionRule local_2 = ESpawnPointSelectionRule(0);
        ESpawnPointSelectionRule local_1 = local_2;
        if (LevelInfoConfig.IsSet())
        {
            local_1 = local_2;
        }
        return ::FGameModeUtils::GetSpawnLocationForPlayerBySpawnPointRule(ENTITY_NULL, uint8(TeamId), SpawnerIndex, ESpawnPointSelectionRule(local_1), Position, Rotation);
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
        if ((!((int(::FGameModeUtils::GetGameStageType()) == 1))) == (!(false)))
        {
            return;
        }
        this.ServerJob_TickPrepare();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandlePlayerChangeSpecialty() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ClientChangeSpecialty> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ClientChangeSpecialty& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_ClientChangeSpecialty, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandlePlayerChangeSpecialty(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DispatchServerSendChatFromGS() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DispatchSpecialtyChangeFromDS> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DispatchSpecialtyChangeFromDS& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_DispatchServerSendChatFromGS(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TickStart() const
    {
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if ((!((int(::FGameModeUtils::GetGameStageType()) == 2))) == (!(false)))
        {
            return;
        }
        if (!(local_2.IsOnInterval(FFPTime(1))))
        {
            return;
        }
        this.ServerJob_TickStart();
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
}


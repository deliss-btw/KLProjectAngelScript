

UCLASS(Abstract)
class UGameModeFlow : UObject
{
    UGameModeFlow()
    {
        return;
    }
    void OnInitInternal(const FCS_GameModeProfile &inout Profile) const
    {
        int local_108 = 0;
        ::FGameModeUtils::InitAttributeScale(ECS::GetECSWorld());
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        ModifyOrAdd local_6;
        local_6.opCall();
        FGameModeFlowSettings local_54 = this.GetFlowSettings(Profile);
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        if (int(local_54.FairModeFlags) != 0)
        {
            local_108.SetFairModeFlags(int(local_54.FairModeFlags));
        }
        if (local_54.CombatRestriction.Flags != 0)
        {
            local_108.SetCombatRestrictionFlags(local_54.CombatRestriction.Flags);
        }
        return;
    }
    void OnFirstTick(const FCS_GameModeProfile &inout Profile) const
    {
        return;
    }
    void OnTickGameModeGeneral(const FCS_GameModeProfile &inout Profile) const
    {
        return;
    }
    void OnTickPreparing(const FCS_GameModeProfile &inout Profile) const
    {
        if (!(this.IsLoadingFinish()))
        {
            return;
        }
        FFPTime local_10 = FFPTime(-1);
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        SendEvent local_8;
        local_8.opCall(ENTITY_NULL, local_10);
        this.ChangeGameState(EFCS_GameStageType(2));
        return;
    }
    void OnTickStarting(const FCS_GameModeProfile &inout Profile) const
    {
        this.ChangeGameState(EFCS_GameStageType(3));
        return;
    }
    void OnTickPlaying(const FCS_GameModeProfile &inout Profile) const
    {
        return;
    }
    void OnFastTick(const FCS_GameModeProfile &inout Profile) const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Remove local_6;
        local_6.opCall();
        return;
    }
    void OnTickFinishing(const FCS_GameModeProfile &inout Profile) const
    {
        int local_14 = 0;
        int local_132 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Has local_6;
        if (!(local_6.opCall()))
        {
            return;
        }
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        if (local_14.GetFinishStartTime().ToSeconds() <= 0.0 || local_14.GetbDSExitRequested())
        {
            return;
        }
        FGameModeFlowSettings local_68 = this.GetFlowSettings(Profile);
        float32 local_123 = float32(((FFPTime(ECS::GetECSWorld().GetFixedTime().Time) - local_14.GetFinishStartTime()).ToSeconds()));
        if (!(local_14.GetbPlayersKicked()) && (local_123 >= int(local_68.MatchFinishDelaySeconds)))
        {
            bool local_19;
            local_19 = true;
            FECSWorldPtr local_2_3 = ECS::GetECSWorld();
            Modify local_128;
            local_128.opCall().SetbPlayersKicked(local_19);
            this.KickPlayersOnFinish(Profile);
        }
        if (local_123 >= (local_68.MatchFinishDelaySeconds + local_68.PostShutdownDelaySeconds))
        {
            FECSWorldPtr local_2_4 = ECS::GetECSWorld();
            local_132.SetbDSExitRequested(true);
            UGameDSConnectionSubsystem local_134 = ::UGameDSConnectionSubsystem::Get();
            if (local_134 != nullptr)
            {
                local_134.DelayExitDS(0.0f);
            }
        }
        return;
    }
    void OnHandleDeath(const FCS_GameModeProfile &inout Profile, FCE_DeathEvent &inout Event) const
    {
        if (!(this.GetFlowSettings(Profile).bEnableManualRevive))
        {
            Has local_102;
            bool local_97 = local_102.opCall();
            if (local_97)
            {
                Remove local_106;
                local_106.opCall();
            }
        }
        this.RecordDeathScoring(Event);
        return;
    }
    void OnHandleReborn(const FCS_GameModeProfile &inout Profile, FCE_Reborn &inout Event) const
    {
        return;
    }
    void OnHandleReviveTeleport(const FCS_GameModeProfile &inout Profile, FCE_Event_ReviveTeleport &inout Event) const
    {
        this.DoReviveTeleport(Event);
        return;
    }
    void OnChangeGameState(const EFCS_GameStageType OldStageType, const EFCS_GameStageType NewStageType) const
    {
        XLog(ELog(22), FString().Append("OnChangeGameState: ").Append(OldStageType).Append(" -> ").Append(NewStageType));
        return;
    }
    bool IsLoadingFinish() const
    {
        if (::FLevelDataLayerUtils::IsWaitingForStreaming(ECS::GetUEWorld(), false))
        {
            return false;
        }
        if (!(::FGameModeUtils::IsInitialLoadingComplete()))
        {
            return false;
        }
        return true;
    }
    bool CanHandleClientJoin(const FCS_GameModeProfile &inout Profile) const
    {
        return true;
    }
    void InitTeamsFromMatchResult(const FPbDsGlobalInfo &inout GlobalInfo) const
    {
        return;
    }
    void KickPlayersOnFinish(const FCS_GameModeProfile &inout Profile) const
    {
        FECSRuntimeView local_40 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_44;
        local_44.opCall();
        FECSRuntimeViewIterator local_78 = local_40.Iterator();
        Get local_120;
        for (; local_78.CanProceed;)
        {
            const FECSEntity& local_116 = local_78.Proceed();
            if ((!((local_120.opCall().GetUEPlayerController() == nullptr))))
            {
                ::FGameConnectionUtils::UICallBackToCityLevel(local_116);
            }
        }
        return;
    }
    FDataObjectPtr GetOverrideAttributeData(const FECSEntity &inout Entity, const int Level) const
    {
        const FAvatarPrefabConfig& local_76;
        FPVPGameAttributeByLevelConfig local_104;
        bool local_49 = !(::GetAvatarConfig(Entity));
        if (local_49)
        {
            return FDataObjectPtr();
        }
        TDataObjectPtr<FGameModeOverrideAvatarConfig> local_100;
        if (!(local_76.GetGameModeOverride().Find(EGameModeType(2), local_100)))
        {
            local_49 = false;
        }
        else
        {
            local_49 = local_100;
        }
        if (local_49)
        {
            if (local_104.IsValid())
            {
                TDataObjectPtr<FGameAttributeInitConfigBase> local_128 = local_104.FindAttributeConfigByLevel(Level);
                return local_128.opImplConv();
            }
        }
        if (!(local_76.GetPVPOverride()))
        {
            return FDataObjectPtr();
        }
        FPVPOverrideAvatarConfig local_130;
        local_104 = local_130.GameAttributeConfig;
        if (!(local_104.IsValid()))
        {
            return FDataObjectPtr();
        }
        TDataObjectPtr<FGameAttributeInitConfigBase> local_128_2 = local_104.FindAttributeConfigByLevel(Level);
        return local_128_2.opImplConv();
    }
    void InitScoreData() const
    {
        int local_8 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        FECSRuntimeView local_46 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_50;
        local_50.opCall();
        Include local_54;
        local_54.opCall();
        FECSRuntimeViewIterator local_88 = local_46.Iterator();
        for (; local_88.CanProceed;)
        {
            const FECSEntity& local_126 = local_88.Proceed();
            if (!(local_8.GetPlayerScores().Contains(local_126)))
            {
                FGameModePlayerScoreDataBase local_132;
                local_8.GetModify_PlayerScores().Add(local_126, local_132);
            }
        }
        return;
    }
    void RecordDeathScoring(FCE_DeathEvent &inout Event) const
    {
        int local_8 = 0;
        int local_22 = 0;
        Has local_38;
        int local_65;
        Get local_74;
        int local_76;
        int local_200 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        Has local_12;
        if (!(local_12.opCall()))
        {
            return;
        }
        if (int(local_8.GetStageType()) != 3)
        {
            if (int(local_8.GetStageType()) != 4)
            {
                return;
            }
            FECSWorldPtr local_2_3 = ECS::GetECSWorld();
            if ((local_22.GetFinishStartTime().ToSeconds()) <= (0.0) || !((FFPTime(ECS::GetECSWorld().GetFixedTime().Time) == local_22.GetFinishStartTime())))
            {
                return;
            }
        }
        if (!(FECSEntity(Event.Sender).IsValid()) || !(local_38.opCall()))
        {
            return;
        }
        Get local_46;
        FECSEntity local_42 = local_46.opCall().GetPlayerEntity();
        if (!(local_42.IsValid()))
        {
            return;
        }
        FECSWorldPtr local_2_4 = ECS::GetECSWorld();
        if (local_22.GetPlayerScores().Contains(local_42))
        {
            FGameModePlayerScoreDataBase& local_52 = local_22.GetModify_PlayerScores()[local_42];
            local_52.SetDeaths((local_52.GetDeaths() + 1));
        }
        FECSEntity local_60 = FECSEntity(Event.KilledByEntity);
        if (!(local_60.IsValid()) || !(local_38.opCall()))
        {
            return;
        }
        FECSEntity local_64 = local_46.opCall().GetPlayerEntity();
        if (!(local_64.IsValid()) || (local_64 == local_42))
        {
            return;
        }
        Has local_70;
        bool local_29 = local_70.opCall();
        if (local_29)
        {
            local_76 = local_74.opCall().GetTeam();
        }
        else
        {
            int local_75 = 0;
            local_76 = local_75;
        }
        bool local_13 = local_70.opCall();
        if (local_13)
        {
            local_65 = local_74.opCall().GetTeam();
        }
        else
        {
            int local_75_2 = 0;
            local_65 = local_75_2;
        }
        if (local_65 != 0 && (local_65 == local_76))
        {
            return;
        }
        if (local_22.GetPlayerScores().Contains(local_64))
        {
            FGameModePlayerScoreDataBase& local_52_2 = local_22.GetModify_PlayerScores()[local_64];
            local_52_2.SetKills((local_52_2.GetKills() + 1));
        }
        int local_79 = 1169915904;
        FECSRuntimeView local_118 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_122;
        local_122.opCall();
        Include local_126;
        local_126.opCall();
        FECSRuntimeViewIterator local_160 = local_118.Iterator();
        for (; local_160.CanProceed;)
        {
            const FECSEntity& local_196 = local_160.Proceed();
            if ((local_196 == local_64) || (local_196 == local_42))
            {
                continue;
            }
            if (!(local_22.GetPlayerScores().Contains(local_196)))
            {
                continue;
            }
            int local_16 = local_65;
            if (local_16 != 0)
            {
                if (local_74.opCall().GetTeam() != local_65)
                {
                    continue;
                }
            }
            FECSEntity local_204 = local_200.GetPlayerPawnEntity();
            if (!(local_204.IsValid()) || !(local_60.IsValid()))
            {
                continue;
            }
            if ((::FASCommonUtils::CalculateEntityDistance3D(local_60, local_204)) <= 6000.0f)
            {
                FGameModePlayerScoreDataBase& local_52_3 = local_22.GetModify_PlayerScores()[local_196];
                local_52_3.SetAssists((local_52_3.GetAssists() + 1));
            }
        }
        return;
    }
    void HandleAccumulateDamageStats(const FCE_DamageEvent &inout Event, const FC_ControlledByPlayer &inout ControlledByPlayer) const
    {
        int local_30 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Get local_6;
        if (int(local_6.opCall().GetStageType()) != 3)
        {
            return;
        }
        FECSEntity local_14 = ControlledByPlayer.GetPlayerEntity();
        Has local_18;
        if (!(local_14.IsValid()) || !(local_18.opCall()))
        {
            return;
        }
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        Has local_24;
        if (!(local_24.opCall()))
        {
            return;
        }
        FECSWorldPtr local_2_3 = ECS::GetECSWorld();
        if (Event.ActualDamageToHP <= 0.0f)
        {
            return;
        }
        if (int(Event.DamageCalculationType) == 3)
        {
            return;
        }
        float32 local_34 = Event.ActualDamageToHP;
        if (local_30.GetPlayerScores().Contains(local_14))
        {
            FGameModePlayerScoreDataBase& local_36 = local_30.GetModify_PlayerScores()[local_14];
            local_36.SetDamageTaken(local_36.GetDamageTaken() + local_34);
        }
        Has local_44;
        if (!(FECSEntity(Event.FinalDamageSource).IsValid()) || !(local_44.opCall()))
        {
            return;
        }
        Get local_48;
        FECSEntity local_52 = local_48.opCall().GetPlayerEntity();
        if (local_52.IsValid() && !((local_52 == local_14)) && local_30.GetPlayerScores().Contains(local_52))
        {
            FGameModePlayerScoreDataBase& local_36_2 = local_30.GetModify_PlayerScores()[local_52];
            float32 local_32 = local_36_2.GetDamageDealt() + local_34;
            local_36_2.SetDamageDealt(local_32);
        }
        return;
    }
    FGameModeFlowSettings GetFlowSettings(const FCS_GameModeProfile &inout Profile) const
    {
        FGameModeFlowSettings __r;
        return __r;
    }
    UGameModeBehavior GetDefaultBehaviorObject(const FInstancedStruct &inout BehaviorSetting) const
    {
        if (!(BehaviorSetting.IsValid()))
        {
            return nullptr;
        }
        Get local_8;
        TSubclassOf<UGameModeBehavior> local_10 = TSubclassOf<UGameModeBehavior>(local_8.opCall().BehaviorClass);
        if ((local_10 == nullptr))
        {
            return nullptr;
        }
        return local_10.GetDefaultObject();
    }
    void OnInit(const FCS_GameModeProfile &inout Profile) const
    {
        this.OnInitInternal(Profile);
        for (auto& local_16 : Profile.GameModeBehaviorSettings)
        {
            UGameModeBehavior local_20 = this.GetDefaultBehaviorObject(local_16);
            if (local_20 == nullptr)
            {
                continue;
            }
            local_20.OnInit(Profile, local_16);
        }
        return;
    }
    void FirstTick(const FCS_GameModeProfile &inout Profile) const
    {
        this.OnFirstTick(Profile);
        for (auto& local_16 : Profile.GameModeBehaviorSettings)
        {
            UGameModeBehavior local_20 = this.GetDefaultBehaviorObject(local_16);
            if (local_20 == nullptr)
            {
                continue;
            }
            local_20.OnFirstTick(Profile, local_16);
        }
        return;
    }
    void TickGameModeGeneral(const FCS_GameModeProfile &inout Profile) const
    {
        this.OnTickGameModeGeneral(Profile);
        return;
    }
    void TickPreparing(const FCS_GameModeProfile &inout Profile) const
    {
        this.OnTickPreparing(Profile);
        for (auto& local_16 : Profile.GameModeBehaviorSettings)
        {
            UGameModeBehavior local_20 = this.GetDefaultBehaviorObject(local_16);
            if (local_20 == nullptr)
            {
                continue;
            }
            local_20.OnTickPreparing(Profile, local_16);
        }
        return;
    }
    void TickStarting(const FCS_GameModeProfile &inout Profile) const
    {
        this.OnTickStarting(Profile);
        for (auto& local_16 : Profile.GameModeBehaviorSettings)
        {
            UGameModeBehavior local_20 = this.GetDefaultBehaviorObject(local_16);
            if (local_20 == nullptr)
            {
                continue;
            }
            local_20.OnTickStarting(Profile, local_16);
        }
        return;
    }
    void TickPlaying(const FCS_GameModeProfile &inout Profile) const
    {
        this.OnTickPlaying(Profile);
        for (auto& local_16 : Profile.GameModeBehaviorSettings)
        {
            UGameModeBehavior local_20 = this.GetDefaultBehaviorObject(local_16);
            if (local_20 == nullptr)
            {
                continue;
            }
            local_20.OnTickPlaying(Profile, local_16);
        }
        return;
    }
    void TickFinishing(const FCS_GameModeProfile &inout Profile) const
    {
        this.OnTickFinishing(Profile);
        for (auto& local_16 : Profile.GameModeBehaviorSettings)
        {
            UGameModeBehavior local_20 = this.GetDefaultBehaviorObject(local_16);
            if (local_20 == nullptr)
            {
                continue;
            }
            local_20.OnTickFinishing(Profile, local_16);
        }
        return;
    }
    void HandleReviveTeleport(const FCS_GameModeProfile &inout Profile, FCE_Event_ReviveTeleport &inout Event) const
    {
        this.OnHandleReviveTeleport(Profile, Event);
        for (auto& local_16 : Profile.GameModeBehaviorSettings)
        {
            UGameModeBehavior local_20 = this.GetDefaultBehaviorObject(local_16);
            if (local_20 == nullptr)
            {
                continue;
            }
            local_20.OnHandleReviveTeleport(Profile, local_16, Event);
        }
        return;
    }
    void HandleDeath(const FCS_GameModeProfile &inout Profile, FCE_DeathEvent &inout Event) const
    {
        this.OnHandleDeath(Profile, Event);
        for (auto& local_16 : Profile.GameModeBehaviorSettings)
        {
            UGameModeBehavior local_20 = this.GetDefaultBehaviorObject(local_16);
            if (local_20 == nullptr)
            {
                continue;
            }
            local_20.OnHandleDeath(Profile, local_16, Event);
        }
        return;
    }
    void HandleReborn(const FCS_GameModeProfile &inout Profile, FCE_Reborn &inout Event) const
    {
        this.OnHandleReborn(Profile, Event);
        for (auto& local_16 : Profile.GameModeBehaviorSettings)
        {
            UGameModeBehavior local_20 = this.GetDefaultBehaviorObject(local_16);
            if (local_20 == nullptr)
            {
                continue;
            }
            local_20.OnHandleReborn(Profile, local_16, Event);
        }
        return;
    }
    void ChangeGameState(const EFCS_GameStageType NewStageType) const
    {
        int local_8 = 0;
        int local_9;
        int local_24 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        local_9 = int(local_8.GetStageType());
        local_8.SetStageType(EFCS_GameStageType(NewStageType));
        FFPTime local_16 = FFPTime(-1);
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        SendEvent local_14;
        local_14.opCall(ENTITY_NULL, local_16);
        this.OnChangeGameState(EFCS_GameStageType(local_9), EFCS_GameStageType(NewStageType));
        FECSWorldPtr local_2_3 = ECS::GetECSWorld();
        for (auto& local_40 : local_24.GameModeBehaviorSettings)
        {
            UGameModeBehavior local_44 = this.GetDefaultBehaviorObject(local_40);
            if (local_44 == nullptr)
            {
                continue;
            }
            local_44.OnChangeGameState(local_24, local_40, EFCS_GameStageType(local_9), EFCS_GameStageType(NewStageType));
        }
        return;
    }
    void GameModeFinish(const TArray<int> &inout InWinnerTeamIds, const TArray<int> &inout InLoserTeamIds) const
    {
        int local_22 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Has local_6;
        bool local_7 = local_6.opCall();
        if (!(local_7))
        {
            local_7 = false;
        }
        else
        {
            FECSWorldPtr local_2_2 = ECS::GetECSWorld();
            Get local_12;
            local_7 = (int(local_12.opCall().GetStageType()) == 4);
        }
        if (local_7)
        {
            return;
        }
        this.RemoveCombatRestrictions();
        FECSWorldPtr local_2_3 = ECS::GetECSWorld();
        local_22.SetWinnerTeamIds(InWinnerTeamIds);
        local_22.SetLoserTeamIds(InLoserTeamIds);
        local_22.SetFinishStartTime(ECS::GetECSWorld().GetFixedTime().Time);
        this.ChangeGameState(EFCS_GameStageType(EFCS_GameStageType(4)));
        return;
    }
    void ApplyCombatRestrictionsForPawn(const FECSEntity &inout PawnEntity) const
    {
        int local_6 = 0;
        int local_22 = 0;
        Has local_12;
        if (!(local_6) || !(local_12.opCall()))
        {
            return;
        }
        FECSWorldPtr local_16 = ECS::GetECSWorld();
        if (!(local_22) || (local_22.GetCombatRestrictionFlags() == 0))
        {
            return;
        }
        if (local_22.HasCombatRestriction(ECombatRestrictionFlags(1)))
        {
            ModifyOrAdd local_30;
            local_30.opCall().SetbIsDisallowed(true);
            Has local_34;
            bool local_7 = local_34.opCall();
            if (local_7)
            {
                ::FMountUtils::EndMountAsDriver(PawnEntity, ECS::GetECSWorld().GetFixedTime().Time);
            }
        }
        if (local_22.HasCombatRestriction(ECombatRestrictionFlags(2)))
        {
            int local_24 = ::FGameModeUtils::GetCombatRestrictionPotionMaxCount();
            if (local_24 >= 0)
            {
                FECSEntity local_40 = local_6.GetPlayerEntity();
                FItemTableRowRef local_66 = FItemTableRowRef(::NearDeathSettings::Get().PotionItemConfig);
                int local_23 = ::InventoryUtils::GetInventoryItemNumber(local_40, TDataObjectPtr<FItemConfig>());
                if (local_23 > local_24)
                {
                    ::InventoryUtils::RemoveInventoryItem(local_40, TDataObjectPtr<FItemConfig>(), local_23 - local_24);
                }
            }
        }
        return;
    }
    void RemoveCombatRestrictionsForPawn(const FECSEntity &inout PawnEntity) const
    {
        int local_6 = 0;
        int local_22 = 0;
        Has local_12;
        if (!(local_6) || !(local_12.opCall()))
        {
            return;
        }
        FECSWorldPtr local_16 = ECS::GetECSWorld();
        if (!(local_22) || (local_22.GetCombatRestrictionFlags() == 0))
        {
            return;
        }
        if (local_22.HasCombatRestriction(ECombatRestrictionFlags(1)))
        {
            ModifyOrAdd local_30;
            local_30.opCall().SetbIsDisallowed(false);
        }
        return;
    }
    void ApplyCombatRestrictions() const
    {
        int local_8 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        if (!(local_8) || (local_8.GetCombatRestrictionFlags() == 0))
        {
            return;
        }
        FECSRuntimeView local_50 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_54;
        local_54.opCall();
        Include local_58;
        local_58.opCall();
        FECSRuntimeViewIterator local_92 = local_50.Iterator();
        for (; local_92.CanProceed;)
        {
            const FECSEntity& local_128 = local_92.Proceed();
            if (local_8.HasCombatRestriction(ECombatRestrictionFlags(2)))
            {
                ::StigmataUtils::RefreshHealItemMax(local_128);
            }
            Get local_134;
            FECSEntity local_138 = local_134.opCall().GetPlayerPawnEntity();
            if (local_138.IsValid())
            {
                this.ApplyCombatRestrictionsForPawn(local_138);
            }
        }
        return;
    }
    void RemoveCombatRestrictions() const
    {
        int local_8 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        if (!(local_8) || (local_8.GetCombatRestrictionFlags() == 0))
        {
            return;
        }
        FECSRuntimeView local_50 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_54;
        local_54.opCall();
        Include local_58;
        local_58.opCall();
        FECSRuntimeViewIterator local_92 = local_50.Iterator();
        for (; local_92.CanProceed;)
        {
            local_92.Proceed();
            Get local_132;
            FECSEntity local_136 = local_132.opCall().GetPlayerPawnEntity();
            if (local_136.IsValid())
            {
                this.RemoveCombatRestrictionsForPawn(local_136);
            }
        }
        return;
    }
    void SetupCombatTeams() const
    {
        FECSRuntimeView local_40 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_44;
        local_44.opCall();
        FECSRuntimeViewIterator local_78 = local_40.Iterator();
        for (; local_78.CanProceed;)
        {
            ::FTeamUtils::HandlePlayerEnterForCombatTeam(local_78.Proceed());
        }
        return;
    }
    void InitMatchDataForEntryMode(const FCS_GameModeProfile &inout Profile) const
    {
        int local_132 = 0;
        FGameModeFlowSettings local_48 = this.GetFlowSettings(Profile);
        if (int(local_48.EntryMode) == 0)
        {
            UGameDSConnectionSubsystem local_102 = ::UGameDSConnectionSubsystem::Get();
            if (local_102 != nullptr)
            {
                if (local_102.IsConnectedToGameServer())
                {
                    this.InitTeamsFromMatchResult(local_102.GetDSGlobalInfo());
                }
            }
        }
        else
        {
            FECSWorldPtr local_126 = ECS::GetECSWorld();
            local_132.InitTeamCounts(int(local_48.MaxTeamCount));
        }
        return;
    }
    void TickStartPlayers() const
    {
        int local_14 = 0;
        int local_138 = 0;
        int local_150 = 0;
        ::FGameModeUtils::HandleClientJoin();
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        FECSRuntimeView local_52 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_56;
        local_56.opCall();
        Exclude(local_52).opCall();
        FECSRuntimeViewIterator local_94 = local_52.Iterator();
        for (; local_94.CanProceed;)
        {
            const FECSEntity& local_132 = local_94.Proceed();
            local_150.SetbReady(true);
            local_138.SetTeam(uint8(((local_138.GetPlayerIndex() % 2) + 1)));
            ::FGameModeUtils::SpawnAvatarsForPlayer(local_132, local_138, local_14);
            FECSEntity local_164 = FECSEntity(local_132.GetId());
            FECSWorldPtr local_2_3 = ECS::GetECSWorld();
            int local_152 = local_138.GetPlayerId();
        }
        return;
    }
    void DoReviveTeleport(FCE_Event_ReviveTeleport &inout Event) const
    {
        ::FGameModeUtils::DefaultReviveTeleport(Event);
        return;
    }
    void ReviveAllDeadPlayers() const
    {
        int local_126;
        FECSRuntimeView local_40 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_44;
        local_44.opCall();
        Include local_48;
        local_48.opCall();
        FECSRuntimeViewIterator local_82 = local_40.Iterator();
        for (; local_82.CanProceed;)
        {
            local_82.Proceed();
            for (auto& local_140 : local_126.GetAllPlayerPawnEntities())
            {
                if (!(local_140.IsValid()))
                {
                    continue;
                }
                this.ReviveSinglePawn(local_140);
            }
        }
        return;
    }
    void ReviveSinglePawn(const FECSEntity &inout PawnEntity) const
    {
        bool local_1 = false;
        Has local_6;
        bool local_2 = local_6.opCall();
        if (local_2)
        {
            ::FNearDeathUtils::TryRestoreHitboxFromNearDeath(PawnEntity);
            Remove local_10;
            local_10.opCall();
            Remove local_14;
            local_14.opCall();
            Remove local_18;
            local_18.opCall();
            Remove local_22;
            local_22.opCall();
            local_1 = true;
        }
        Has local_26;
        bool local_2_2 = local_26.opCall();
        if (local_2_2)
        {
            local_1 = true;
        }
        if (local_1)
        {
            FCE_Reborn local_34;
            ECS::GetContextTime();
            local_34.RebornByEntity = PawnEntity;
            local_34.RebornHPRatio = 1.0f;
            bool local_2_3 = true;
            local_34.bRebornWithAnimation = local_2_3;
        }
        else
        {
            this.FullHealPawn(PawnEntity);
        }
        Has local_40;
        bool local_2_4 = local_40.opCall();
        if (local_2_4)
        {
            Remove local_44;
            local_44.opCall();
        }
        return;
    }
    void FullHealPawn(const FECSEntity &inout PawnEntity) const
    {
        Has local_4;
        if (!(local_4.opCall()))
        {
            return;
        }
        Get local_10;
        float32 local_13 = local_10.opCall().GetAttributeValue(Attribute::HPMax, ECS::GetContextTime());
        float32 local_6 = local_10.opCall().GetAttributeValue(Attribute::HP, ECS::GetContextTime());
        if (local_6 < local_13)
        {
            FGameAttributeUtils::Recover(PawnEntity, Attribute::HP, ECS::GetContextTime(), local_13 - local_6, -1.0f);
        }
        return;
    }
}


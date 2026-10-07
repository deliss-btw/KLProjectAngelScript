

// NOTE: class defaults are not authored in this module: FPVXGameModeFlowSettings (body was stubbed).
// They are carried over byte-exact when this module is recompiled.

struct FPvxRewardFactorData
{
    UPROPERTY()
    float32 Coefficient;
    UPROPERTY()
    TDataObjectPtr<FRewardConfig> Reward;


}

struct FPVXGameModeFlowSettings : FGameModeFlowSettings
{
    FGameModeFlowSettings _base_FGameModeFlowSettings;
    UPROPERTY()
    TArray<TSubclassOf<ACharacterPrefab>> BossPrefabs;
    UPROPERTY()
    TDataObjectPtr<FBasePrefabConfig> HelpMonsterPrefab;
    UPROPERTY()
    TSubclassOf<APropPrefab> DoomHeartPrefab;
    UPROPERTY()
    FVector DoomHeartSpawnOffset;
    UPROPERTY()
    float32 DoomHeartNavProjectExtent;
    UPROPERTY()
    UDataTable MonsterKillExpDataTable;
    UPROPERTY()
    UDataTable LevelExpDataTable;
    UPROPERTY()
    UDataTable LevelExpDataTable_Boss;
    UPROPERTY()
    FBuffConfigRef LevelUpBuff_Player;
    UPROPERTY()
    FBuffConfigRef LevelUpBuff_Boss;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> MessageHintConfig_PlayerKill;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> MessageHintConfig_HelpMonsterHurt;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> MessageHintConfig_HelpMonsterDeath;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> MessageHintConfig_DoomHeartInteract;
    UPROPERTY()
    TArray<FUpgradeMonsterData> UpgradeMonsterDatas;
    UPROPERTY()
    FPVXBossEvolveSettings BossEvolveSettings;
    UPROPERTY()
    TArray<FLevelProgressData> LevelProgressDatas;
    UPROPERTY()
    TArray<FTime_ExpMultiplier_Data> Time_ExpMultiplier_Datas;
    UPROPERTY()
    int SelectRoleTime;
    UPROPERTY()
    int MatchDuration;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> CurrencyItemConfig;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> CarryOutCurrencyItemConfig;
    UPROPERTY()
    TDataObjectPtr<FCommissionConfig> PhaseTrackingCommissionConfig;
    UPROPERTY()
    TDataObjectPtr<FReviveData> NoReviveRule;
    UPROPERTY()
    TMap<FName, FPvxRewardFactorData> PvxRewardArray;
    UPROPERTY()
    float32 PvxSettlementDelayTime;

    FPVXGameModeFlowSettings()
    {
        super();
        this.MonsterKillExpDataTable = nullptr;
        this.LevelExpDataTable = nullptr;
        this.LevelExpDataTable_Boss = nullptr;
        this.DoomHeartSpawnOffset = FVector(0.0, 0.0, 0.0);
        this.DoomHeartNavProjectExtent = 1000.0f;
        this.SelectRoleTime = 50;
        this.MatchDuration = 900;
        this.PvxSettlementDelayTime = 5.0f;
        this.__InitDefaults();
        return;
    }
}

class UPVXGameModeFlow : UGameModeFlow
{
    UPVXGameModeFlow()
    {
        super();
        return;
    }
    void OnInitInternal(const FCS_GameModeProfile &inout Profile) const
    {
        int local_8 = 0;
        Super::OnInitInternal(Profile);
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        local_8.SetGameModeType(EGameModeType(1));
        local_8.SetbPVXGame(true);
        local_8.SetbPVPGame(true);
        FGameModeFlowSettings local_58 = Super::GetFlowSettings(Profile);
        int local_59 = int(local_58.EntryMode);
        Super::InitMatchDataForEntryMode(Profile);
        return;
    }
    void OnFirstTick(const FCS_GameModeProfile &inout Profile) const
    {
        int local_850 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Has local_6;
        if (!(local_6.opCall()))
        {
            return;
        }
        FPVXGameModeFlowSettings local_426 = this.GetPVXFlowSettings(Profile);
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        int local_851 = local_426.SelectRoleTime;
        local_850.SetSelectRoleEndTime((ECS::GetContextTime() + FFPTime(local_851)));
        local_850.SetSelectRoleTotalTime(FFPTime(local_851));
        return;
    }
    void OnTickGameModeGeneral(const FCS_GameModeProfile &inout Profile) const
    {
        if (this.CanHandleClientJoin(Profile))
        {
            this.TryInitNewPlayers();
        }
        return;
    }
    void OnTickPreparing(const FCS_GameModeProfile &inout Profile) const
    {
        int local_18 = 0;
        if (!(this.IsLoadingFinish()))
        {
            return;
        }
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = ECS::GetECSWorld();
        Has local_12;
        if (!(local_12.opCall()))
        {
            ::FGameModeUtils::InitTeamSpawner(ECS::GetECSWorld());
        }
        FECSWorldPtr local_4_3 = ECS::GetECSWorld();
        if (ECS::GetContextTime().opCmp(local_18.GetSelectRoleEndTime()) <= 0)
        {
            return;
        }
        XLog(ELog(27), "PVX SelectRoleEndTime reached, leaving Preparing");
        FFPTime local_20 = FFPTime(-1);
        FECSWorldPtr local_4_4 = ECS::GetECSWorld();
        SendEvent local_26;
        local_26.opCall(ENTITY_NULL, local_20);
        FFPTime local_20_2 = FFPTime(-1);
        FECSWorldPtr local_4_5 = ECS::GetECSWorld();
        SendEvent local_30;
        local_30.opCall(ENTITY_NULL, local_20_2);
        ::FLevelUtils::SendCustomLevelEvent(ENTITY_NULL, PVXSettlementEventNames::LevelEvent_PVXPrepareFinished);
        Super::ChangeGameState(EFCS_GameStageType(2));
        return;
    }
    void OnTickStarting(const FCS_GameModeProfile &inout Profile) const
    {
        int local_856 = 0;
        if (::FLevelDataLayerUtils::IsWaitingForStreaming(this.GetWorld(), false))
        {
            return;
        }
        FECSWorldPtr local_6 = ECS::GetECSWorld();
        Has local_10;
        bool local_3 = !(local_10.opCall());
        if (local_3)
        {
            local_3 = true;
        }
        else
        {
            FECSWorldPtr local_6_2 = ECS::GetECSWorld();
            Get local_14;
            local_3 = !(local_14.opCall().GetbInitialized());
        }
        if (local_3)
        {
            FPVXGameModeFlowSettings local_432 = this.GetPVXFlowSettings(Profile);
            if (local_432.PhaseTrackingCommissionConfig.IsSet())
            {
                ::PVXPhaseTracking::Init(local_432.PhaseTrackingCommissionConfig);
            }
        }
        FECSWorldPtr local_6_3 = ECS::GetECSWorld();
        FECSRuntimeView local_894 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_898;
        local_898.opCall();
        int local_899 = 0;
        FECSRuntimeViewIterator local_934 = local_894.Iterator();
        for (; local_934.CanProceed;)
        {
            local_934.Proceed();
            ++local_899;
        }
        if (local_899 == 0)
        {
            return;
        }
        bool local_3_2 = PVXGameModeUtils::CVar_PVX_AllowPartialRosterAndLateJoin.GetBool();
        if (local_3_2)
        {
            if (local_899 < local_856.GetPlayerMatchDatas().Num())
            {
                XLog(ELog(27), FString().Append("PVX OnTickStarting: SelectRoleEndTime reached, starting with partial roster ").Append(local_899).Append("/").Append(local_856.GetPlayerMatchDatas().Num()));
            }
        }
        else
        {
            if (local_899 != local_856.GetPlayerMatchDatas().Num())
            {
                return;
            }
        }
        FECSRuntimeView local_874 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        local_898.opCall();
        FECSRuntimeViewIterator local_968 = local_874.Iterator();
        for (; local_968.CanProceed;)
        {
            this.FinalizePVXPlayer(local_968.Proceed());
        }
        this.MatchClockStart();
        Super::ChangeGameState(EFCS_GameStageType(3));
        return;
    }
    void OnTickPlaying(const FCS_GameModeProfile &inout Profile) const
    {
        int local_20 = 0;
        int local_26 = 0;
        int local_34 = 0;
        int local_52 = 0;
        float32 local_893;
        Include local_954;
        int local_1040 = 0;
        if (PVXGameModeUtils::CVar_PVX_AllowPartialRosterAndLateJoin.GetBool())
        {
            this.TryHandleLateJoinPlayers();
        }
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        Has local_8;
        bool local_1 = !(local_8.opCall());
        if (local_1)
        {
            local_1 = true;
        }
        else
        {
            FECSWorldPtr local_4_2 = ECS::GetECSWorld();
            Has local_12;
            local_1 = !(local_12.opCall());
        }
        if (local_1)
        {
            return;
        }
        FECSWorldPtr local_4_3 = ECS::GetECSWorld();
        FECSWorldPtr local_4_4 = ECS::GetECSWorld();
        if (local_26.GetMatchEndTime().ToSeconds() > 0.0 && ((ECS::GetContextTime().opCmp(local_26.GetMatchEndTime()) > 0)))
        {
            if (local_26.GetWinnerTeamIds().Num() == 0)
            {
                TArray<int> local_38;
                local_38.Add(4);
                TArray<int> local_46 = this.CollectNonWinnerTeamIds(4);
                FECSWorldPtr local_4_5 = ECS::GetECSWorld();
                local_52.SetWinnerFinishReason(EPVXPlayerFinishReason(4));
                Super::GameModeFinish(local_38, local_46);
            }
        }
        if (local_26.GetWinnerTeamIds().Num() == 0)
        {
            this.CheckPlayerTeamWipe();
        }
        FPVXGameModeFlowSettings local_472 = this.GetPVXFlowSettings(Profile);
        FFPTime local_32 = ECS::GetContextTime();
        local_893 = local_20.GetExpMultiplier();
        for (auto& local_908 : local_472.Time_ExpMultiplier_Datas)
        {
            local_34 = int(local_908.Time);
            if ((local_32.opCmp((FFPTime(local_26.GetMatchStartTime()) + FFPTime(local_34))) >= 0 && ((local_893 < local_908.ExpMultiplier))))
            {
                FECSWorldPtr local_4_6 = ECS::GetECSWorld();
                local_52.SetExpMultiplier(local_908.ExpMultiplier);
                local_52.SetMonsterPowerBuffConfig(local_908.BuffConfig);
                if (local_908.MessageHintConfig)
                {
                    FECSRuntimeView local_950 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
                    local_954.opCall();
                    FECSRuntimeViewIterator local_988 = local_950.Iterator();
                    for (; local_988.CanProceed;)
                    {
                        ::BlueprintFunctions_Level::Level_SendMessageHint(FECSEntityAdapter(local_988.Proceed()), local_908.MessageHintConfig, TArray<FTextArgument>());
                    }
                }
                FFPTime local_912 = FFPTime(-1);
                FECSWorldPtr local_4_7 = ECS::GetECSWorld();
                local_1040.CustomName = n"PVX_EXP_MULTIPLIER_UPDATE";
            }
        }
        int local_1041 = 0;
        while (local_1041 < local_34)
        {
            FLevelProgressData& local_1044 = local_472.LevelProgressDatas[local_1041];
            if (local_32.opCmp((FFPTime(local_26.GetMatchStartTime()) + FFPTime(int(local_1044.Time)))) >= 0)
            {
                if (local_20.GetHasTriggeredLevelProgressArray().Contains(local_1041))
                {
                }
                else
                {
                    FECSWorldPtr local_4_8 = ECS::GetECSWorld();
                    Modify local_50;
                    local_50.opCall().GetModify_HasTriggeredLevelProgressArray().Add(local_1041);
                    if (local_1044.MessageHintConfig)
                    {
                        FECSRuntimeView local_930 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
                        local_954.opCall();
                        FECSRuntimeViewIterator local_1022 = local_930.Iterator();
                        for (; local_1022.CanProceed;)
                        {
                            ::BlueprintFunctions_Level::Level_SendMessageHint(FECSEntityAdapter(local_1022.Proceed()), local_1044.MessageHintConfig, TArray<FTextArgument>());
                        }
                    }
                    FFPTime local_912_2 = FFPTime(-1);
                    FECSWorldPtr local_4_9 = ECS::GetECSWorld();
                    local_1040.CustomName = local_1044.CustomName;
                }
            }
            ++local_1041;
        }
        return;
    }
    void OnFastTick(const FCS_GameModeProfile &inout Profile) const
    {
        this.ProcessPendingSettlements();
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Remove local_6;
        local_6.opCall();
        return;
    }
    void OnTickFinishing(const FCS_GameModeProfile &inout Profile) const
    {
        Super::OnTickFinishing(Profile);
        return;
    }
    void OnHandleDeath(const FCS_GameModeProfile &inout Profile, FCE_DeathEvent &inout Event) const
    {
        Super::OnHandleDeath(Profile, Event);
        this.DeathProcess(Event, Event.Sender, Event.Time);
        this.TryTriggerSettlement(Event.Sender);
        return;
    }
    void OnHandleReviveTeleport(const FCS_GameModeProfile &inout Profile, FCE_Event_ReviveTeleport &inout Event) const
    {
        if (!(Event.Sender.IsValid()))
        {
            return;
        }
        FECSEntity local_6 = FECSEntity(Event.Sender);
        FECSEntity local_10 = int(Event.SkipNearestCount) > 0 ? this.GetOtherRevivePoint(Event, this.GetRevivePoint(Event)) : this.GetRevivePoint(Event);
        if (local_10.IsValid())
        {
            FVector local_52 = (::FASCommonUtils::GetEntityLocation(local_10) + FVector(0.0, 0.0, 100.0));
            GetDefaulted local_62;
            ::BlueprintFunctions_Common::TeleportEntityToLocation(FECSEntityAdapter(local_6), ::FASCommonUtils::FindLegalLocationExt(local_6, local_52, 400.0f, 200.0f, 4, FVector(100.0, 100.0, 200.0), false), local_62.opCall().GetRotation().Rotator(), false, FRotator::ZeroRotator, false, true, ELoadingScreenAction(0), true);
        }
        return;
    }
    void OnChangeGameState(const EFCS_GameStageType OldStageType, const EFCS_GameStageType NewStageType) const
    {
        int local_858 = 0;
        int local_864 = 0;
        Super::OnChangeGameState(EFCS_GameStageType(OldStageType), EFCS_GameStageType(NewStageType));
        if (int(NewStageType) == 4)
        {
            FECSWorldPtr local_6 = ECS::GetECSWorld();
            Has local_10;
            bool local_3 = !(local_10.opCall());
            if (local_3)
            {
                local_3 = true;
            }
            else
            {
                FECSWorldPtr local_6_2 = ECS::GetECSWorld();
                Has local_14;
                local_3 = !(local_14.opCall());
            }
            if (local_3)
            {
                return;
            }
            FPVXGameModeFlowSettings local_434 = this.GetPVXFlowSettingsFromSingleton();
            FECSWorldPtr local_6_3 = ECS::GetECSWorld();
            FECSWorldPtr local_6_4 = ECS::GetECSWorld();
            TSet<FECSEntity> local_884;
            TSet<FECSEntity> local_904;
            for (auto& local_922 : local_864.GetPlayerProgressMap())
            {
                if (!(local_922.GetKey().IsValid()))
                {
                    continue;
                }
                if (int(GetFinalState()) != 0)
                {
                    continue;
                }
                if (local_858.GetWinnerTeamIds().Contains(GetTeamId()))
                {
                    local_884.Add(local_922.GetKey());
                    continue;
                }
                local_904.Add(local_922.GetKey());
            }
            for (auto& local_944 : local_884)
            {
                ::PVXSettlementEventUtils::SetPlayerFinalState(local_944, EPVXPlayerFinalState(EPVXPlayerFinalState(1)), ::PVXGameModeUtils::GetPlayerFinishReasonFromWorld(local_864.GetWinnerFinishReason(), true));
                ::PVXSettlementEventUtils::TrySendPendingSettlementEvent(local_944, local_434, PVXSettlementEventNames::RewardEvent_PVX_Success);
                this.ScheduleSettlement(local_944);
                ::FLevelUtils::SendCustomLevelEvent(local_944, PVXSettlementEventNames::LevelEvent_PVXFinish);
            }
            for (auto& local_944 : local_904)
            {
                ::PVXSettlementEventUtils::SetPlayerFinalState(local_944, EPVXPlayerFinalState(EPVXPlayerFinalState(2)), ::PVXGameModeUtils::GetPlayerFinishReasonFromWorld(local_864.GetWinnerFinishReason(), false));
                ::PVXSettlementEventUtils::TrySendPendingSettlementEvent(local_944, local_434, PVXSettlementEventNames::RewardEvent_PVX_Defeat);
                this.ScheduleSettlement(local_944);
                ::FLevelUtils::SendCustomLevelEvent(local_944, PVXSettlementEventNames::LevelEvent_PVXDefeat);
            }
        }
        return;
    }
    bool CanHandleClientJoin(const FCS_GameModeProfile &inout Profile) const
    {
        if (!(this.IsLoadingFinish()))
        {
            return false;
        }
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        Has local_8;
        return local_8.opCall();
    }
    void InitTeamsFromMatchResult(const FPbDsGlobalInfo &inout GlobalInfo) const
    {
        int local_32 = 0;
        int local_34;
        int local_59;
        int local_61;
        int local_77;
        int local_107;
        if (!(GlobalInfo.GetPvxGlobalInfo().IsValid()) || !(ECS::GetECSWorld().IsValid()))
        {
            return;
        }
        FPbPvXGlobalInfo local_26 = FPbPvXGlobalInfo(GlobalInfo.GetPvxGlobalInfo());
        FECSWorldPtr local_14 = ECS::GetECSWorld();
        local_32.GetModify_PlayerMatchDatas().Empty(0);
        local_34 = local_26.GetUidCampId_Num();
        int local_36 = 0;
        int local_37 = 0;
        for (; local_37 < local_34; )
        {
            FPbUint32Pair local_58 = local_26.GetUidCampId_Index(local_37);
            local_59 = local_58.GetFirst();
            local_61 = local_58.GetSecond();
            XLog(ELog(27), FString().Append("MatchResult Pair Uid=").Append(local_59).Append(" CampId=").Append(local_61));
            FGameModePlayerMatchDataBase local_76;
            local_76.SetUID(local_59);
            if (local_61 == 1)
            {
                local_77 = EFaction(1);
            }
            else
            {
                local_77 = EFaction(6);
            }
            local_76.SetFaction(EFaction(local_77));
            local_76.SetBossPrefabIdx(local_36);
            local_32.GetModify_PlayerMatchDatas().Add(local_59, local_76);
            ++local_37;
        }
        local_61 = local_26.GetUidList_Num();
        int local_79 = 0;
        int local_37_2 = 0;
        for (; local_37_2 < local_61; local_79 = local_79 + 1, ++local_37_2)
        {
            FPbUidList local_90 = local_26.GetUidList_Index(local_37_2);
            local_59 = local_90.GetValList_Num();
            int local_101 = 0;
            for (; local_101 < local_59; ++local_101)
            {
                int local_103 = local_90.GetValList_Index(local_101);
                if (!(local_32.GetPlayerMatchDatas().Contains(local_103)))
                {
                    continue;
                }
                if ((int(local_32.GetPlayerMatchDatas()[local_103].GetFaction())) == 6)
                {
                    local_107 = 4;
                }
                else
                {
                    local_107 = local_79;
                }
                TMap<uint, FGameModePlayerMatchDataBase>& local_110 = local_32.GetModify_PlayerMatchDatas();
                local_110[local_103].SetTeamID();
                local_110[local_103].SetPlayerInTeamIndex(local_101);
                XLog(ELog(27), FString().Append("MatchResult Team Uid=").Append(local_103).Append(" TeamID=").Append(local_107).Append(", PlayerInTeamIndex=").Append(local_101));
            }
        }
        return;
    }
    FDataObjectPtr GetOverrideAttributeData(const FECSEntity &inout Entity, const int Level) const
    {
        FECSEntityId local_7;
        FDataObjectPtr __return;
        EFaction local_1 = EFaction(1);
        Entity.GetId();
        XLog(ELog(27), FString().Append("GetOverrideAttributeData ").Append(local_7).Append(local_7).Append(" Level="));
        FECSWorldPtr local_10 = ECS::GetECSWorld();
        Get local_14;
        const FCS_GameMode_MatchData& local_16 = local_14.opCall();
        if (local_16)
        {
            Get local_22;
            const FC_ControlledByPlayer& local_24 = local_22.opCall();
            if (local_24)
            {
                int local_26 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(local_24.GetPlayerEntity());
                XLog(ELog(27), FString().Append("GetOverrideAttributeData DPlayerID=").Append(local_26));
                if (local_16.GetPlayerMatchDatas().Contains(local_26))
                {
                    local_1 = local_16.GetPlayerMatchDatas()[local_26].GetFaction();
                }
                else
                {
                    __return = FDataObjectPtr();
                }
            }
            else
            {
                __return = FDataObjectPtr();
            }
        }
        Entity.GetId();
        XLog(ELog(27), FString().Append("GetOverrideAttributeData ").Append(local_7).Append(local_7).Append(" Level="));
        if ((int(local_1)) == 1)
        {
            FPVPGameAttributeByLevelConfig local_130;
            bool local_128;
            bool local_17 = !(::GetAvatarConfig(Entity));
            if (local_17)
            {
                return FDataObjectPtr();
            }
            else
            {
                const FAvatarPrefabConfig& local_102;
                TDataObjectPtr<FGameModeOverrideAvatarConfig> local_126;
                if (!(local_102.GetGameModeOverride().Find(EGameModeType(1), local_126)))
                {
                    local_17 = false;
                }
                else
                {
                    local_17 = local_126;
                }
                if (local_17)
                {
                    if (local_130.IsValid())
                    {
                        TDataObjectPtr<FGameAttributeInitConfigBase> local_154 = local_130.FindAttributeConfigByLevel(Level);
                        return local_154.opImplConv();
                    }
                    else
                    {
                    }
                }
                local_128 = !(local_102.GetPVPOverride());
                if (local_128)
                {
                    return FDataObjectPtr();
                }
                else
                {
                    FPVPOverrideAvatarConfig local_156;
                    local_130 = local_156.GameAttributeConfig;
                    if (!(local_130.IsValid()))
                    {
                        return FDataObjectPtr();
                    }
                    else
                    {
                        TDataObjectPtr<FGameAttributeInitConfigBase> local_154_2 = local_130.FindAttributeConfigByLevel(Level);
                        __return = local_154_2.opImplConv();
                    }
                }
            }
        }
        else
        {
            FPVPGameAttributeByLevelConfig local_130;
            bool local_128;
            if (!(::GetMonsterConfig(Entity)))
            {
                return FDataObjectPtr();
            }
            else
            {
                const FMonsterPrefabConfig& local_206;
                TDataObjectPtr<FGameModeOverrideMonsterConfig> local_230;
                if (!(local_206.GetGameModeOverride().Find(EGameModeType(1), local_230)))
                {
                    local_128 = false;
                }
                else
                {
                    local_128 = local_230;
                }
                if (local_128)
                {
                    if (local_130.IsValid())
                    {
                        TDataObjectPtr<FGameAttributeInitConfigBase> local_154_3 = local_130.FindAttributeConfigByLevel(Level);
                        return local_154_3.opImplConv();
                    }
                    else
                    {
                    }
                }
                if (!(local_206.GetPVPOverride()))
                {
                    return FDataObjectPtr();
                }
                else
                {
                    FPVPOverrideMonsterConfig local_232;
                    local_130 = local_232.GameAttributeConfig;
                    XLog(ELog(27), FString().Append("GetOverrideAttributeData ").Append(local_130.RowNamePrefix));
                    if (!(local_130.IsValid()))
                    {
                        return FDataObjectPtr();
                    }
                    else
                    {
                        TDataObjectPtr<FGameAttributeInitConfigBase> local_154_4 = local_130.FindAttributeConfigByLevel(Level);
                        __return = local_154_4.opImplConv();
                    }
                }
            }
        }
        return __return;
    }
    FPVXGameModeFlowSettings GetPVXFlowSettings(const FCS_GameModeProfile &inout Profile) const
    {
        FPVXGameModeFlowSettings __r;
        return __r;
    }
    FPVXGameModeFlowSettings GetPVXFlowSettingsFromSingleton() const
    {
        FPVXGameModeFlowSettings __r;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        return __r;
    }
    TArray<int> CollectNonWinnerTeamIds(const int WinnerTeam) const
    {
        int local_18;
        TArray<int> local_4;
        FECSWorldPtr local_6 = ECS::GetECSWorld();
        Has local_10;
        if (!(local_10.opCall()))
        {
            return local_4;
        }
        FECSWorldPtr local_6_2 = ECS::GetECSWorld();
        for (auto& local_36 : local_18.GetPlayerMatchDatas())
        {
            local_36;
            int local_39 = GetTeamID();
            if (local_39 != WinnerTeam && !(local_4.Contains(local_39)))
            {
                local_4.Add(local_39);
            }
        }
        return local_4;
    }
    void TryInitNewPlayers() const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Has local_6;
        if (!(local_6.opCall()))
        {
            return;
        }
        FECSRuntimeView local_46 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_50;
        local_50.opCall();
        Exclude(local_46).opCall();
        int local_55 = 0;
        FECSRuntimeViewIterator local_90 = local_46.Iterator();
        for (; local_90.CanProceed;)
        {
            const FECSEntity& local_126 = local_90.Proceed();
            this.InitNewPlayer(local_126, local_55);
        }
        return;
    }
    void InitNewPlayer(const FECSEntity &inout PlayerEntity, uint &inout InOutPieAssignIndex) const
    {
        int local_28 = 0;
        int local_38 = 0;
        int local_64 = 0;
        int local_72 = 0;
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            return;
        }
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        Has local_12;
        if (!(local_12.opCall()))
        {
            return;
        }
        UAS_GameModeSettings local_20 = (Cast<UAS_GameModeSettings>(UECSGameModeSettingsBase::Get(ECS::GetUEWorld())));
        if (!((local_20 != nullptr)))
        {
            XError(ELog(27), "we need a UAS_GameModeSettings!");
            return;
        }
        FECSWorldPtr local_8_2 = ECS::GetECSWorld();
        int local_30 = local_28.GetPlayerMatchDatas().Num();
        bool local_31 = false;
        UGameDSConnectionSubsystem local_34 = ::UGameDSConnectionSubsystem::Get();
        if (local_34 != nullptr)
        {
            bool local_31_2 = local_34.IsConnectedToGameServer();
        }
        int local_37 = local_38;
        Has local_42;
        bool local_5_2 = local_42.opCall();
        if (local_5_2)
        {
            Get local_46;
            local_37 = local_46.opCall().GetPlayerSpecialtyID();
        }
        PlayerEntity.GetId();
        FECSEntityId local_51;
        XLog(ELog(27), FString().Append("PVX InitNewPlayer ").Append(local_51));
        local_38 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(PlayerEntity);
        local_64.SetPlayerAvatarID(local_37);
        if (local_28.GetPlayerMatchDatas().Contains(local_38))
        {
            const FGameModePlayerMatchDataBase& local_66 = local_28.GetPlayerMatchDatas()[local_38];
            int local_73 = local_66.GetTeamID();
            local_72.SetTeam(uint8(local_73));
            XLog(ELog(27), FString().Append("PVX InitNewPlayer ").Append(local_38).Append(" Team=").Append(local_66.GetTeamID()).Append(" Faction=").Append(local_66.GetFaction()));
            this.SetupInitCameraTransform(PlayerEntity, local_64, local_66.GetTeamID(), local_66.GetPlayerInTeamIndex());
            return;
        }
        XError(ELog(27), FString().Append("PVX InitNewPlayer ").Append(local_38).Append(" not found in MatchData"));
        return;
    }
    void SetupInitCameraTransform(const FECSEntity &inout PlayerEntity, FC_PVXPlayerRuntime &inout Runtime, const int TeamID, const int PlayerInTeamIndex) const
    {
        int local_14 = 0;
        int local_48 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Has local_6;
        if (!(local_6.opCall()))
        {
            return;
        }
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        TArray<FECSEntityId> local_22 = local_14.GetRandomTeamSpawnersByRandomGroup(TeamID);
        if (!(local_22.IsValidIndex(PlayerInTeamIndex)))
        {
            XLog(ELog(27), FString().Append("PVX SetupInitCameraTransform: no valid spawner for Team=").Append(TeamID).Append(" Index=").Append(PlayerInTeamIndex).Append(", skip init camera"));
            return;
        }
        FECSEntity local_36 = FECSEntity(local_22[PlayerInTeamIndex]);
        Runtime.SetSpawnPoint(local_36);
        Get local_40;
        const FC_Transform& local_42 = local_40.opCall();
        if (local_42)
        {
            local_48.Location = (FVector(local_42.GetPosition()) + FVector(0.0, 0.0, 180.0));
            local_48.Rotation = local_42.GetRotation().Rotator();
            local_36.GetEntityName();
            PlayerEntity.GetId();
            FString local_26 = FString();
        }
        return;
    }
    void SpawnPVXPlayerIfNeeded(const FECSEntity &inout PlayerEntity) const
    {
        int local_6 = 0;
        int local_42 = 0;
        int local_48 = 0;
        int local_55;
        FECSEntityId local_69;
        int local_82 = 0;
        FECSEntity local_94;
        if (local_6.GetAllPlayerPawnEntities().Num() > 0)
        {
            return;
        }
        Has local_14;
        if (!(local_14.opCall()))
        {
            return;
        }
        UKLGameModeSettings local_16 = (Cast<UKLGameModeSettings>(UECSGameModeSettingsBase::Get(ECS::GetUEWorld())));
        if ((!((local_16 != nullptr))))
        {
            XError(ELog(27), "GameModeSettings is null");
            return;
        }
        FECSWorldPtr local_26 = ECS::GetECSWorld();
        Has local_30;
        if (!(local_30.opCall()))
        {
            return;
        }
        FECSWorldPtr local_26_2 = ECS::GetECSWorld();
        FECSWorldPtr local_26_3 = ECS::GetECSWorld();
        Modify local_52;
        FC_PlayerStates& local_54 = local_52.opCall();
        if (local_54)
        {
            local_54.SetbReady(true);
        }
        local_55 = local_6.GetPlayerId();
        int local_57 = 1;
        int local_56 = local_57;
        int local_58 = -1;
        int local_59 = 0;
        int local_60 = 0;
        if (local_42.GetPlayerMatchDatas().Contains(local_55))
        {
            const FGameModePlayerMatchDataBase& local_62 = local_42.GetPlayerMatchDatas()[local_55];
            local_56 = int(local_62.GetFaction());
            local_58 = local_62.GetBossPrefabIdx();
            local_59 = local_62.GetTeamID();
            local_60 = local_62.GetPlayerInTeamIndex();
        }
        if (local_48.GetSpawnPoint().IsValid())
        {
            local_48.GetSpawnPoint().GetEntityName();
            PlayerEntity.GetId();
            XLog(ELog(27), FString().Append("PVX SpawnPoint(reuse) ").Append(local_69).Append(local_69).Append(" Team=").Append(local_59).Append(" Index=").Append(local_60).Append(" Spawn="));
        }
        else
        {
            FECSWorldPtr local_26_4 = ECS::GetECSWorld();
            Has local_76;
            bool local_9 = local_76.opCall();
            if (local_9)
            {
                FECSWorldPtr local_26_5 = ECS::GetECSWorld();
                TArray<FECSEntityId> local_90 = local_82.GetRandomTeamSpawnersByRandomGroup(local_59);
                if (local_90.IsValidIndex(local_60))
                {
                    local_94 = FECSEntity(local_90[local_60]);
                    local_48.SetSpawnPoint(local_94);
                    local_48.GetSpawnPoint().GetEntityName();
                    PlayerEntity.GetId();
                    XLog(ELog(27), FString().Append("PVX SpawnPoint ").Append(local_69).Append(local_69).Append(" Team=").Append(local_59).Append(" Index=").Append(local_60).Append(" Spawn="));
                }
                else
                {
                    XError(ELog(22), "PlayerTeamID or PlayerInTeamIndex is invalid (or Boss team 4 has no spawner at index)");
                }
            }
        }
        PlayerEntity.GetId();
        this.SpawnPVXPlayer(local_94, local_69, local_58, local_48.GetSpawnPoint(), "");
        PlayerEntity.GetId();
        XLog(ELog(27), FString().Append("PVX SpawnPVXPlayer ").Append(local_69).Append(local_69).Append(" Faction=").Append(local_56).Append(" BossPrefabIdx="));
        PlayerEntity.GetId();
        FECSWorldPtr local_26_6 = ECS::GetECSWorld();
        int local_7 = local_6.GetPlayerId();
        return;
    }
    void SetupCombatTeamForPlayer(const FECSEntity &inout PlayerEntity) const
    {
        int local_18 = 0;
        int local_19;
        int local_79;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Has local_6;
        if (!(local_6.opCall()))
        {
            return;
        }
        Has local_12;
        bool local_7 = local_12.opCall();
        if (local_7)
        {
            return;
        }
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        Get local_24;
        local_19 = local_24.opCall().GetPlayerId();
        if (!(local_18.GetPlayerMatchDatas().Contains(local_19)))
        {
            return;
        }
        int local_25 = local_18.GetPlayerMatchDatas()[local_19].GetTeamID();
        if ((local_25 < 0 || (local_25 >= 4)))
        {
            return;
        }
        TArray<uint> local_32;
        for (auto& local_50 : local_18.GetPlayerMatchDatas())
        {
            int local_27 = GetTeamID();
            if (local_27 != local_25)
            {
                continue;
            }
            local_32.Add(local_50.GetKey());
        }
        if (local_32.Num() < 2)
        {
            return;
        }
        TArray<FECSEntity> local_56;
        TArray<FECSEntity> local_64 = FGameUtils::GetAllPlayerControllerEntities(true);
        for (auto& local_78 : local_64)
        {
            local_79 = local_24.opCall().GetPlayerId();
            if (local_32.Contains(local_79))
            {
                local_56.Add(local_78);
            }
        }
        if (local_56.Num() < 2)
        {
            return;
        }
        FECSEntity local_84 = FECSEntity(ENTITY_NULL);
        for (auto& local_78 : local_56)
        {
            local_7 = local_12.opCall();
            if (local_7)
            {
                Get local_88;
                local_84 = local_88.opCall().GetTeamEntity();
                break;
            }
        }
        if (local_84.IsValid())
        {
            ::FTeamUtils::AddMemberToTeam(local_84, PlayerEntity);
            return;
        }
        FECSEntity local_96 = ::FTeamUtils::CreateTeam(local_56[0], local_25);
        for (auto& local_78 : local_56)
        {
            ::FTeamUtils::AddMemberToTeam(local_96, local_78);
        }
        return;
    }
    void InitPlayerScoreEntry(const FECSEntity &inout PlayerEntity) const
    {
        Has local_4;
        bool local_5;
        int local_14 = 0;
        int local_26 = 0;
        int local_40 = 0;
        int local_41;
        int local_134 = 0;
        if (!(local_4.opCall()))
        {
            return;
        }
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        if (!(local_14.GetPlayerScores().Contains(PlayerEntity)))
        {
            FGameModePlayerScoreDataBase local_20;
            local_14.GetModify_PlayerScores().Add(PlayerEntity, local_20);
        }
        FECSWorldPtr local_8_2 = ECS::GetECSWorld();
        if (local_26.GetPlayerProgressMap().Contains(PlayerEntity))
        {
            return;
        }
        FECSWorldPtr local_8_3 = ECS::GetECSWorld();
        Has local_30;
        if (!(local_30.opCall()))
        {
            return;
        }
        Has local_34;
        if (!(local_34.opCall()))
        {
            return;
        }
        FECSWorldPtr local_8_4 = ECS::GetECSWorld();
        Get local_46;
        local_41 = local_46.opCall().GetPlayerId();
        FPVX_PlayerProgressData local_96;
        if (local_40.GetPlayerMatchDatas().Contains(local_41))
        {
            local_96.SetTeamId(local_40.GetPlayerMatchDatas()[local_41].GetTeamID());
            local_96.SetPlayerInTeamIndex(local_40.GetPlayerMatchDatas()[local_41].GetPlayerInTeamIndex());
        }
        GetDefaulted local_102;
        local_96.SetPlayerName(local_102.opCall().GetNickName());
        local_96.SetPlayerUID(local_41);
        Get local_112;
        int local_113 = local_112.opCall().GetPlayerAvatarID();
        int local_107 = local_113;
        if (local_107 != 0)
        {
            local_5 = false;
        }
        else
        {
            Has local_118;
            local_5 = local_118.opCall();
        }
        if (local_5)
        {
            Get local_124;
            local_113 = local_124.opCall().GetPlayerSpecialtyID();
            local_107 = local_113;
        }
        local_96.SetPlayerAvatarID(local_107);
        Has local_128;
        local_5 = local_128.opCall();
        if (local_5)
        {
            if (local_134.GetDivineSkillData().GetSkillConfig())
            {
                local_96.SetPlayerDivineSkillID(local_113);
            }
        }
        local_26.GetModify_PlayerProgressMap().Add(PlayerEntity, local_96);
        Modify local_138;
        FC_PlayerController& local_140 = local_138.opCall();
        if (local_140)
        {
            for (auto& local_154 : local_140.GetAllPlayerPawnEntities())
            {
                ::FGameModeUtils::ReplaceInitAttribute(local_154, local_96.GetLevel());
            }
        }
        return;
    }
    void MatchClockStart() const
    {
        int local_8 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        if (local_8.GetMatchStartTime().ToSeconds() <= 0.0)
        {
            int local_14;
            FPVXGameModeFlowSettings local_432 = this.GetPVXFlowSettingsFromSingleton();
            local_14 = local_432.MatchDuration;
            local_8.SetMatchEndTime((ECS::GetContextTime() + FFPTime(local_14)));
            local_8.SetMatchStartTime(ECS::GetContextTime());
        }
        return;
    }
    void FinalizePVXPlayer(const FECSEntity &inout PlayerEntity) const
    {
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            return;
        }
        Has local_10;
        if (!(local_10.opCall()))
        {
            FECSEntityId local_15;
            PlayerEntity.GetId();
            XError(ELog(27), FString().Append("PVX FinalizePVXPlayer: missing FC_PVXPlayerRuntime on ").Append(local_15).Append(local_15));
            return;
        }
        this.SpawnPVXPlayerIfNeeded(PlayerEntity);
        this.InitPlayerScoreEntry(PlayerEntity);
        this.SetupCombatTeamForPlayer(PlayerEntity);
        this.ApplyPerPlayerCombatRestrictions(PlayerEntity);
        FC_PVXPlayerFullyInitializedTag local_22;
        Assign local_20;
        local_20.opCall(local_22);
        return;
    }
    bool SpawnPVXPlayer(const FECSEntity &inout PlayerEntity, const EFaction Faction, const int BossPrefabIdx = -1, const FECSEntity &inout SpawnPoint = ENTITY_NULL, const FString &inout UserNameOverride = "") const
    {
        int local_6 = 0;
        FString local_22;
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
        FPVXGameModeFlowSettings local_498 = this.GetPVXFlowSettingsFromSingleton();
        UAS_GameModeSettings local_924 = (Cast<UAS_GameModeSettings>(UECSGameModeSettingsBase::Get(ECS::GetUEWorld())));
        if ((!((local_924 != nullptr))))
        {
            XError(ELog(0), "SpawnPVXPlayer failed, BaseSettings is null!");
            return false;
        }
        if (int(Faction) == 1)
        {
            int local_925;
            Get local_930;
            int local_931 = local_930.opCall().GetPlayerAvatarID();
            local_925 = local_931;
            TDataObjectPtr<FAvatarPrefabConfig> local_956;
            if (local_925 <= 0)
            {
                Get local_960;
                local_931 = local_960.opCall().GetPlayerSpecialtyID();
                local_925 = local_931;
            }
            if (local_925 > 0)
            {
                GetDataObjectByGSDataId<FAvatarPrefabConfig> local_984;
                local_956 = local_984.opImplConv();
            }
            else
            {
                if (local_924.ChangeRoleDataObjects.Num() > 0)
                {
                    local_956 = local_924.ChangeRoleDataObjects[0];
                    local_925 = local_931;
                }
            }
            Modify local_1036;
            local_1036.opCall().SetPlayerAvatarID(local_925);
            if ((!((local_956 == nullptr))))
            {
                FNameHandle_EntityBBVarInt local_1060;
                FName local_1042 = FName(FString().Append("Pawn_").Append(local_6.GetPlayerId()));
                FECSEntity local_1050 = ::FGameModeUtils::CreateAvatarEntity(PlayerEntity, local_6, local_12, local_20, local_956, TSubclassOf<AECSPrefab>(nullptr), local_1042, true, true);
                local_1050.IsValid();
                Modify local_1054;
                FC_Faction& local_1056 = local_1054.opCall();
                if (local_1056)
                {
                    local_1056.SetFactionId(EFaction(Faction));
                    ::FFactionUtils::InitFactionRelationForEntity(local_1050, local_1056);
                }
                local_1060;
                int local_79 = PlayerEntity.GetBB_Int(local_1060);
                local_1060;
                PlayerEntity.SetBB_Int(local_1060, n"iRefillTimes");
                local_1060;
                int local_74_2 = PlayerEntity.GetBB_Int(local_1060);
                local_1060;
                PlayerEntity.SetBB_Int(local_1060, n"iRefillTimesMax");
            }
        }
        else
        {
            if (int(Faction) == 6)
            {
                if (BossPrefabIdx >= 0 && (BossPrefabIdx < local_498.BossPrefabs.Num()))
                {
                    FName local_1042_2 = FName(FString().Append("Pawn_").Append(local_6.GetPlayerId()).Append("_0"));
                    ::FGameModeUtils::CreateAvatarEntity(PlayerEntity, local_6, local_12, local_20, TDataObjectPtr<FAvatarPrefabConfig>(nullptr), local_498.BossPrefabs[BossPrefabIdx], local_1042_2, true, true).IsValid();
                }
            }
        }
        int local_74_3 = local_6.GetAllPlayerPawnEntities().Num();
        local_6.SetPlayerPawnEntity(local_6.GetAllPlayerPawnEntities()[0]);
        bool local_1043 = !(UserNameOverride.IsEmpty());
        if (local_74_3 > 0)
        {
            Modify local_1064;
            FC_DSPlayerInfo& local_1066 = local_1064.opCall();
            if (local_1066)
            {
                local_1066.SetNickName(UserNameOverride);
            }
        }
        return true;
    }
    void HandlePlayerEnterPVX(const FCE_PlayerEnterPVX &inout Event) const
    {
        int local_12;
        int local_13;
        int local_20 = 0;
        FECSEntityId local_35;
        if (!(Event.Sender.IsValid()))
        {
            return;
        }
        ModifyOrAdd local_6;
        FC_InitInfoPVX& local_8 = local_6.opCall();
        if (local_8)
        {
            if ((Event.bIsInvader || (int(Event.BossPrefabIdx) >= 0)))
            {
                local_13 = 2;
                local_12 = local_13;
            }
            else
            {
                local_13 = 1;
                local_12 = local_13;
            }
            local_8.Faction = EFaction(local_12);
            local_8.BossPrefabIdx = int(Event.BossPrefabIdx);
            local_8.SpawnPoint = Event.SpawnPoint;
            local_8.UserNameOverride = Event.UserNameOverride;
            local_8.PlayerPrefabIdx = int(Event.PlayerPrefabIdx);
        }
        local_20.SetSpawnPoint(Event.SpawnPoint);
        if (int(Event.BossPrefabIdx) >= 0)
        {
            local_20.SetPlayerAvatarID(0);
        }
        else
        {
            bool local_11;
            Has local_26;
            local_11 = local_26.opCall();
            if (local_11)
            {
                Get local_30;
                local_20.SetPlayerAvatarID(local_30.opCall().GetPlayerSpecialtyID());
            }
        }
        int local_21 = local_20.GetPlayerAvatarID();
        Event.Sender.GetId();
        XLog(ELog(27), FString().Append("PVX HandlePlayerEnterPVX SenderID ").Append(local_35).Append(local_35).Append(" to ").Append(local_21));
        ModifyOrAdd local_40;
        FC_PlayerStates& local_42 = local_40.opCall();
        if (local_42)
        {
            local_42.SetbReady(true);
        }
        return;
    }
    void HandlePlayerSelectInfo(const FCE_PlayerSelectInfoPVX &inout Event) const
    {
        FECSEntityId local_7;
        int local_16 = 0;
        int local_32 = 0;
        int local_38 = 0;
        int local_46 = 0;
        int local_974 = 0;
        int local_980 = 0;
        if (!(Event.Sender.IsValid()))
        {
            return;
        }
        Event.Sender.GetId();
        XLog(ELog(27), FString().Append("PVX HandlePlayerSelectInfo ").Append(local_7).Append(local_7).Append(" AvatarID=").Append(Event.PlayerAvatarID).Append(" MonsterIdx=").Append(Event.PlayerMonsterIdx).Append(" Ready="));
        FECSWorldPtr local_10 = ECS::GetECSWorld();
        if (int(local_16.GetStageType()) >= 2)
        {
            return;
        }
        FECSEntity local_24 = FECSEntity(Event.Sender);
        int local_26 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(local_24);
        FECSWorldPtr local_10_2 = ECS::GetECSWorld();
        if (!(local_32.GetPlayerMatchDatas().Contains(local_26)))
        {
            return;
        }
        local_38.SetbReady(Event.bIsReady);
        const FGameModePlayerMatchDataBase& local_40 = local_32.GetPlayerMatchDatas()[local_26];
        FPVXGameModeFlowSettings local_464 = this.GetPVXFlowSettingsFromSingleton();
        if (int(local_40.GetFaction()) == 1)
        {
            if (local_46.GetPlayerAvatarID() != int(Event.PlayerAvatarID))
            {
                local_46.SetPlayerAvatarID(int(Event.PlayerAvatarID));
                UGameDSConnectionSubsystem local_886 = ::UGameDSConnectionSubsystem::Get();
                if (local_886 != nullptr)
                {
                    FPbDsPlayerInfo local_908 = local_886.GetPlayerInfo(local_26);
                    if (local_908.IsValid())
                    {
                        TDataObjectPtr<FDivineSkillConfig> local_932 = local_886.TryGetPvpDivineSkillByAvatarId(local_908, int(Event.PlayerAvatarID));
                        if (local_932)
                        {
                            FCE_OnChangeDivineSkillReq local_964;
                            FFPTime local_962 = FFPTime(-1);
                            local_964.DivineSkillData.SetSkillConfig(local_932);
                            local_964.bNeedReply = false;
                        }
                        else
                        {
                            XWarning(ELog(27), FString().Append("PVX HandlePlayerSelectInfo no PvpDivineSkill for AvatarId=").Append(Event.PlayerAvatarID).Append(" Uid=").Append(local_26));
                        }
                    }
                }
            }
            FECSWorldPtr local_10_3 = ECS::GetECSWorld();
            Has local_968;
            bool local_1 = local_968.opCall();
            if (local_1)
            {
                FECSWorldPtr local_10_4 = ECS::GetECSWorld();
                if (local_974.GetPlayerProgressMap().Contains(local_24))
                {
                    local_974.GetModify_PlayerProgressMap()[local_24].SetPlayerAvatarID(int(Event.PlayerAvatarID));
                }
            }
        }
        else
        {
            if (int(local_40.GetFaction()) == 6)
            {
                if (local_464.BossPrefabs.IsValidIndex(int(Event.PlayerMonsterIdx)))
                {
                    FECSWorldPtr local_10_5 = ECS::GetECSWorld();
                    TMap<uint, FGameModePlayerMatchDataBase>& local_982 = local_980.GetModify_PlayerMatchDatas();
                    local_982[local_26].SetBossPrefabIdx(int(Event.PlayerMonsterIdx));
                }
            }
        }
        FFPTime local_962_2 = FFPTime(-1);
        FECSWorldPtr local_10_6 = ECS::GetECSWorld();
        FCE_PlayerSelectChangePVX local_988;
        local_988.PlayerAvatarID = int(Event.PlayerAvatarID);
        local_988.PlayerMonsterIdx = int(Event.PlayerMonsterIdx);
        local_988.bIsReady = Event.bIsReady;
        return;
    }
    void TryHandleLateJoinPlayers() const
    {
        FECSRuntimeView local_40 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_44;
        local_44.opCall();
        Exclude(local_40).opCall();
        bool local_49 = false;
        FECSRuntimeViewIterator local_84 = local_40.Iterator();
        for (; local_84.CanProceed;)
        {
            const FECSEntity& local_120 = local_84.Proceed();
            local_49 = true;
            break;
        }
        if (!(local_49))
        {
            return;
        }
        FECSRuntimeViewIterator local_118 = local_40.Iterator();
        for (; local_118.CanProceed;)
        {
            const FECSEntity& local_120_2 = local_118.Proceed();
            local_120_2.GetId();
            FECSEntityId local_125;
            XLog(ELog(27), FString().Append("PVX TryHandleLateJoinPlayers: finalizing late joiner ").Append(local_125));
            this.FinalizePVXPlayer(local_120_2);
        }
        return;
    }
    void ApplyPerPlayerCombatRestrictions(const FECSEntity &inout PlayerEntity) const
    {
        int local_18 = 0;
        Get local_4;
        FECSEntity local_8 = local_4.opCall().GetPlayerPawnEntity();
        if (local_8.IsValid())
        {
            Super::ApplyCombatRestrictionsForPawn(local_8);
        }
        FECSWorldPtr local_12 = ECS::GetECSWorld();
        if (local_18 && local_18.HasCombatRestriction(ECombatRestrictionFlags(2)))
        {
            ::StigmataUtils::RefreshHealItemMax(PlayerEntity);
        }
        return;
    }
    bool IsNoReviveActive(const FPVXGameModeFlowSettings &inout InFlowSettings) const
    {
        bool local_83;
        if (!(InFlowSettings.NoReviveRule.IsSet()))
        {
            return false;
        }
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        Get local_8;
        const FCS_NearDeathRule& local_10 = local_8.opCall();
        if (local_10)
        {
            if (!(local_10.GetReviveData()))
            {
                local_83 = false;
            }
            else
            {
                FDataObjectPtr local_82;
                TDataObjectPtr<FReviveData> local_34;
                local_34 = local_10.GetReviveData();
                local_82;
                local_83 = (local_34 == local_82);
            }
            return local_83;
        }
        return false;
    }
    void CheckPlayerTeamWipe() const
    {
        int local_930 = 0;
        int local_1049;
        int local_1060 = 0;
        Has local_1072;
        Has local_1076;
        int local_1120 = 0;
        FPVXGameModeFlowSettings local_418 = this.GetPVXFlowSettingsFromSingleton();
        if (!(local_418.NoReviveRule.IsSet()))
        {
            return;
        }
        FECSWorldPtr local_840 = ECS::GetECSWorld();
        Get local_844;
        const FCS_NearDeathRule& local_846 = local_844.opCall();
        if (local_846)
        {
            bool local_837 = !(local_846.GetReviveData());
            if (local_837)
            {
                local_837 = true;
            }
            else
            {
                FDataObjectPtr local_918;
                TDataObjectPtr<FReviveData> local_870;
                local_870 = local_846.GetReviveData();
                local_918;
                local_837 = !((local_870 == local_918));
            }
            if (local_837)
            {
                return;
            }
        }
        else
        {
            return;
        }
        FECSWorldPtr local_840_2 = ECS::GetECSWorld();
        Has local_924;
        if (!(local_924.opCall()))
        {
            return;
        }
        FECSWorldPtr local_840_3 = ECS::GetECSWorld();
        FECSRuntimeView local_968 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_972;
        local_972.opCall();
        bool local_919 = false;
        bool local_973 = local_919;
        TArray<FECSEntity> local_978;
        FECSRuntimeViewIterator local_1012 = local_968.Iterator();
        for (; local_1012.CanProceed;)
        {
            FECSEntity local_1048 = local_1012.Proceed();
            Get local_1054;
            local_1049 = local_1054.opCall().GetPlayerId();
            if (!(local_930.GetPlayerMatchDatas().Contains(local_1049)))
            {
                continue;
            }
            if (int(local_930.GetPlayerMatchDatas()[local_1049].GetFaction()) == 6)
            {
                continue;
            }
            local_919 = true;
            local_973 = local_919;
            FECSEntity local_1068 = local_1060.GetPlayerPawnEntity();
            if (!(local_1068.IsValid()))
            {
                continue;
            }
            if (!(local_1072.opCall()) && !(local_1076.opCall()))
            {
                return;
            }
            if (local_1072.opCall() && !(local_1076.opCall()))
            {
                local_978.Add(local_1068);
            }
        }
        if (local_973)
        {
            FFPTime local_1080 = ECS::GetContextTime();
            auto local_1086 = local_978.Iterator();
            for (; local_1086.CanProceed;)
            {
                FECSEntity local_1048_2 = local_1086.Proceed();
                if (!(local_1048_2.IsValid()))
                {
                    local_919 = true;
                }
                else
                {
                    local_919 = local_1076.opCall();
                }
                if (local_919)
                {
                    continue;
                }
                Get local_1098;
                FECSEntityId local_1093 = FECSEntityId(local_1098.opCall().GetKilledByEntity());
                ::FLifeCycleUtils::EntityDeath(local_1048_2, local_1093, local_1080, true, true, false, true, EDeathReason(0));
                ::FLifeCycleUtils::ServerDataTrackPlayerDeath(local_1048_2, EServerDataTrackDeathReason(5), local_1093);
            }
            TArray<int> local_1106;
            local_1106.Add(4);
            TArray<int> local_1114 = this.CollectNonWinnerTeamIds(4);
            FECSWorldPtr local_840_4 = ECS::GetECSWorld();
            local_1120.SetWinnerFinishReason(EPVXPlayerFinishReason(1));
            Super::GameModeFinish(local_1106, local_1114);
            XLog(ELog(33), "PVX PlayerTeamWipe: all player-faction pawns are down/dead and cannot revive, BossTeam wins");
        }
        return;
    }
    void HandleCustomLevelEvent(const FCE_CustomLevelEvent &inout Event) const
    {
        int local_38 = 0;
        int local_68 = 0;
        bool local_4 = (Event.CustomName == n"PVX_WIN_TEMP");
        if (local_4)
        {
            if (!(Event.Sender.IsValid()))
            {
                local_4 = false;
            }
            else
            {
                Has local_8;
                local_4 = local_8.opCall();
            }
            if (local_4)
            {
                int local_19;
                Get local_14;
                FECSEntity local_18 = local_14.opCall().GetPlayerEntity();
                Get local_24;
                local_19 = local_24.opCall().GetPlayerId();
                int local_25 = -1;
                FECSWorldPtr local_28 = ECS::GetECSWorld();
                Has local_32;
                bool local_9 = local_32.opCall();
                if (local_9)
                {
                    FECSWorldPtr local_28_2 = ECS::GetECSWorld();
                    if (local_38.GetPlayerMatchDatas().Contains(local_19))
                    {
                        local_25 = local_38.GetPlayerMatchDatas()[local_19].GetTeamID();
                    }
                }
                if (local_25 >= 0)
                {
                    FECSWorldPtr local_28_3 = ECS::GetECSWorld();
                    Has local_44;
                    bool local_4_2 = !(local_44.opCall());
                    if (local_4_2)
                    {
                        local_4_2 = true;
                    }
                    else
                    {
                        FECSWorldPtr local_28_4 = ECS::GetECSWorld();
                        Get local_48;
                        local_4_2 = (local_48.opCall().GetWinnerTeamIds().Num() == 0);
                    }
                    if (local_4_2)
                    {
                        TArray<int> local_54;
                        local_54.Add(local_25);
                        TArray<int> local_62 = this.CollectNonWinnerTeamIds(local_25);
                        FECSWorldPtr local_28_5 = ECS::GetECSWorld();
                        local_68.SetWinnerFinishReason(EPVXPlayerFinishReason(3));
                        Super::GameModeFinish(local_54, local_62);
                    }
                }
            }
            return;
        }
        if ((Event.CustomName == PVXSettlementEventNames::LevelEvent_PVXHelpMonsterHurt))
        {
            Include local_948;
            FPVXGameModeFlowSettings local_488 = this.GetPVXFlowSettingsFromSingleton();
            if (local_488.MessageHintConfig_HelpMonsterHurt)
            {
                FECSRuntimeView local_944 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
                local_948.opCall();
                FECSRuntimeViewIterator local_982 = local_944.Iterator();
                for (; local_982.CanProceed;)
                {
                    ::BlueprintFunctions_Level::Level_SendMessageHint(FECSEntityAdapter(local_982.Proceed()), local_488.MessageHintConfig_HelpMonsterHurt, TArray<FTextArgument>());
                }
            }
            return;
        }
        if ((Event.CustomName == PVXSettlementEventNames::LevelEvent_PVXDoomHeartInteract))
        {
            Include local_948;
            FPVXGameModeFlowSettings local_906 = this.GetPVXFlowSettingsFromSingleton();
            if (local_906.MessageHintConfig_DoomHeartInteract)
            {
                FECSRuntimeView local_924 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
                local_948.opCall();
                FECSRuntimeViewIterator local_1016 = local_924.Iterator();
                for (; local_1016.CanProceed;)
                {
                    ::BlueprintFunctions_Level::Level_SendMessageHint(FECSEntityAdapter(local_1016.Proceed()), local_906.MessageHintConfig_DoomHeartInteract, TArray<FTextArgument>());
                }
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
        GetDefaulted local_16;
        FECSEntity local_20 = FECSEntity(local_16.opCall().GetSpawnPoint());
        FGameplayTag local_22 = ::PVXGameModeUtils::GetEntityTeamTag(local_8);
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
        return local_20;
    }
    FECSEntity GetOtherRevivePoint(FCE_Event_ReviveTeleport &inout Event, const FECSEntity &inout ExcludePoint) const
    {
        int local_162 = 0;
        int local_168 = 0;
        bool local_169;
        Get local_4;
        FECSEntity local_8 = local_4.opCall().GetPlayerEntity();
        FECSEntity local_12 = FECSEntity(Event.Sender);
        FGameplayTag local_14 = ::PVXGameModeUtils::GetEntityTeamTag(local_8);
        Has local_22;
        if (!(local_8.IsValid()) || !(local_22.opCall()) || !(local_14.IsValid()))
        {
            return ENTITY_NULL;
        }
        FECSEntity local_28 = FECSEntity(ENTITY_NULL);
        float32 local_29 = 999999.0f;
        GetDefaulted local_34;
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
    void ScheduleSettlement(const FECSEntity &inout PlayerEntity) const
    {
        int local_10 = 0;
        if (!(PlayerEntity.IsValid()))
        {
            return;
        }
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        local_10.PendingPlayers.AddUnique(PlayerEntity);
        FECSWorldPtr local_4_2 = ECS::GetECSWorld();
        FCS_GameModeFastTickTag local_16;
        Assign local_14;
        local_14.opCall(local_16);
        return;
    }
    void ProcessPendingSettlements() const
    {
        int local_14 = 0;
        Remove local_20;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Has local_6;
        if (!(local_6.opCall()))
        {
            return;
        }
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        if (local_14.PendingPlayers.Num() == 0)
        {
            FECSWorldPtr local_2_3 = ECS::GetECSWorld();
            local_20.opCall();
            return;
        }
        float32 local_860 = FMath::Max(0.0f, this.GetPVXFlowSettingsFromSingleton().PvxSettlementDelayTime);
        for (auto& local_874 : local_14.PendingPlayers)
        {
            if (!(local_874.IsValid()))
            {
                continue;
            }
            this.SendSettlementRewardsToGS(local_874);
            ::PVXGameModeUtils::SendPVXEndDataTrack(local_874);
            __Lambda_Gameplay_Designer_PVX_PVXGameMode_1472 local_878;
            ::FGameModeTimerUtils::AddTimerCallback(local_860, Foundation::MakeClosure(local_878));
        }
        FECSWorldPtr local_2_4 = ECS::GetECSWorld();
        local_20.opCall();
        return;
    }
    void SendSettlementRewardsToGS(const FECSEntity &inout PlayerEntity) const
    {
        int local_20 = 0;
        int local_922 = 0;
        int local_923 = 0;
        Has local_6;
        if (!(PlayerEntity.IsValid()) || !(local_6.opCall()))
        {
            return;
        }
        FECSWorldPtr local_10 = ECS::GetECSWorld();
        Has local_14;
        if (!(local_14.opCall()))
        {
            return;
        }
        FECSWorldPtr local_10_2 = ECS::GetECSWorld();
        if (!(local_20.GetPlayerProgressMap().Contains(PlayerEntity)))
        {
            return;
        }
        const FPVX_PlayerProgressData& local_22 = local_20.GetPlayerProgressMap()[PlayerEntity];
        FPVXGameModeFlowSettings local_440 = this.GetPVXFlowSettingsFromSingleton();
        float32 local_859 = 1.0f;
        TMap<uint, uint> local_880;
        for (auto& local_894 : local_22.GetPendingSettlementEvents())
        {
            FPvxRewardFactorData local_920;
            if (local_440.PvxRewardArray.Find(local_894, local_920))
            {
                local_859 = local_859 * local_920.Coefficient;
                if (local_920.Reward)
                {
                    local_923 = int(local_922);
                    local_923 = local_923 + 1;
                    local_922 = local_923;
                }
            }
        }
        if (local_880.Num() > 0)
        {
            FC_PVX_SettlementReward local_930;
            FPbGsOp local_942;
            FPbGsOpGetReward local_952 = local_942.GetOpGetReward();
            local_952.SetReason(19);
            local_930.RewardEntries.Empty(0);
            for (auto& local_980 : local_880)
            {
                FPbGsOpRewardEntry local_990 = local_952.AddRewardList();
                local_990.SetRewardId(local_980.GetKey());
                local_990.SetNum(local_923);
                FPVX_SettlementRewardEntry local_1002;
                local_1002.RewardId = local_980.GetKey();
                local_1002.Num = local_923;
                local_930.RewardEntries.Add(local_1002);
            }
            ::UGameDSConnectionSubsystem::Get().AddGsOpAndSendExecuteRequest(PlayerEntity, local_942);
        }
        TDataObjectPtr<FItemConfig> local_1028 = local_440.CarryOutCurrencyItemConfig;
        if (local_1028)
        {
            FC_PVX_SettlementReward local_930;
            int local_931 = uint((local_22.GetCurrencyAmount() * local_859));
            if (local_931 > 0)
            {
                ::InventoryUtils_GSInventoryInternal::AddItemToGSInventory(PlayerEntity, local_1028, local_931);
                FC_PlayerAddItemRequestPendingFlushTag local_1060;
                Assign local_1058;
                local_1058.opCall(local_1060);
                local_930.RewardCurrencyAmount = local_931;
            }
        }
        return;
    }
    void TryTriggerSettlement(const FECSEntity &inout DeadEntity) const
    {
        Has local_4;
        int local_12 = 0;
        int local_860 = 0;
        if (!(local_4.opCall()))
        {
            return;
        }
        if (!(local_12.IsValid()))
        {
            return;
        }
        FPVXGameModeFlowSettings local_430 = this.GetPVXFlowSettingsFromSingleton();
        if (this.IsNoReviveActive(local_430))
        {
            FECSWorldPtr local_850 = ECS::GetECSWorld();
            Has local_854;
            bool local_5 = local_854.opCall();
            if (local_5)
            {
                FECSWorldPtr local_850_2 = ECS::GetECSWorld();
                if (local_860.GetPlayerProgressMap().Contains(local_12))
                {
                    if ((int(local_860.GetPlayerProgressMap()[local_12].GetFinalState())) == 0)
                    {
                        ::PVXSettlementEventUtils::SetPlayerFinalState(local_12, EPVXPlayerFinalState(EPVXPlayerFinalState(2)), EPVXPlayerFinishReason(2));
                        ::PVXSettlementEventUtils::TrySendPendingSettlementEvent(local_12, local_430, PVXSettlementEventNames::RewardEvent_PVX_Death);
                        this.ScheduleSettlement(local_12);
                        ::FLevelUtils::SendCustomLevelEvent(local_12, PVXSettlementEventNames::LevelEvent_PVXPlayerDeath);
                    }
                }
            }
        }
        return;
    }
    void DeathProcess(const FCE_DeathEvent &inout Event, const FECSEntity &inout DeadEntity, const FFPTime &inout Time) const
    {
        int local_856 = 0;
        int local_866 = 0;
        int local_884 = 0;
        int local_932 = 0;
        bool local_1125;
        bool local_1139;
        FECSEntity& local_1330;
        int local_1383;
        int local_1384;
        int local_1389;
        FPVXGameModeFlowSettings local_418 = this.GetPVXFlowSettingsFromSingleton();
        bool local_837 = false;
        int local_839 = 0;
        FECSEntity local_844 = FECSEntity(Event.KilledByEntity);
        FECSWorldPtr local_850 = ECS::GetECSWorld();
        Has local_860;
        bool local_838 = local_860.opCall();
        if (local_838)
        {
            FECSEntity local_930;
            int local_888;
            int local_887;
            Has local_878;
            EFaction local_873;
            Get local_872;
            int local_867;
            local_867 = local_872.opCall().GetPlayerId();
            local_873 = EFaction(1);
            FECSWorldPtr local_850_2 = ECS::GetECSWorld();
            bool local_838_2 = local_878.opCall();
            if (local_838_2)
            {
                FECSWorldPtr local_850_3 = ECS::GetECSWorld();
                if (local_884.GetPlayerMatchDatas().Contains(local_867))
                {
                    local_873 = local_884.GetPlayerMatchDatas()[local_867].GetFaction();
                }
            }
            FPVX_PlayerProgressData& local_886 = local_856.GetModify_PlayerProgressMap()[local_866];
            local_887 = local_886.GetExp();
            if (!(local_886.GetbInLevelProtect()))
            {
                local_888 = local_886.GetLevel();
                if (local_886.GetLevel() > 1)
                {
                    local_886.SetLevel((local_886.GetLevel() - 1));
                    local_886.SetExp(::PVXGameModeUtils::GetLevelRequiredExp(local_886.GetLevel()));
                }
                else
                {
                    local_886.SetLevel(1);
                    local_886.SetExp(0);
                }
                if (local_886.GetLevel() != local_888)
                {
                    const FC_PlayerController& local_892 = local_872.opCall();
                    if (local_892)
                    {
                        FDataObjectPtr local_916 = FDataObjectPtr(local_886.GetLastOverrideAttributeData());
                        auto local_922 = local_892.GetAllPlayerPawnEntities().Iterator();
                        for (; local_922.CanProceed;)
                        {
                            local_930 = local_922.Proceed();
                            local_886.SetLastOverrideAttributeData(local_916);
                            ::FGameModeUtils::OverrideGameAttributeByDelta(local_930, local_886.GetLevel());
                        }
                    }
                }
                local_886.SetbInLevelProtect(true);
            }
            else
            {
                local_886.SetExp(::PVXGameModeUtils::GetLevelRequiredExp(local_886.GetLevel()));
            }
            int local_840 = local_887 - local_886.GetExp();
            local_839 = local_840 + 300;
            int local_931 = local_886.GetExp();
            if (local_887 != local_931)
            {
                local_931 = local_886.GetExp();
                ::PVXGameModeUtils::SendPVXExpChangeDataTrack(local_866, local_844, local_887, local_931, EPVXExpChangeReason(2));
            }
            local_837 = true;
        }
        TDataObjectPtr<FBasePrefabConfig> local_956 = ::GetPrefabConfigPtr(DeadEntity);
        if ((local_956.GetDataName() == local_418.HelpMonsterPrefab.GetDataName()))
        {
            Get local_994;
            FECSEntity local_930;
            local_994.opCall().GetRotation().Rotator();
            FVector local_1000;
            FVector local_1024 = (FVector(local_994.opCall().GetPosition()) + local_1000.RotateVector(local_418.DoomHeartSpawnOffset));
            FVector local_1030;
            FVector local_1018 = FVector(FVector::OneVector);
            bool local_838_3 = UNavigationSystemV1::ProjectPointToNavigation(__GetWorldContext(), local_1024, local_1030, nullptr, TSubclassOf<UNavigationQueryFilter>(nullptr), (local_1018 * local_418.DoomHeartNavProjectExtent));
            if (local_838_3)
            {
                local_1024 = local_1030;
            }
            FVector local_1012 = FVector(0.0, 0.0, 100.0);
            FVector local_1018_2 = (local_1024 + local_1012);
            FVector local_1012_2 = (local_1024 - FVector(0.0, 0.0, 1000000.0));
            FHitResult local_1124;
            bool local_1141 = System::LineTraceSingle(__GetWorldContext(), local_1018_2, local_1012_2, ETraceTypeQuery(5), false, TArray<AActor>(), EDrawDebugTrace(0), local_1124, true, FLinearColor(1.0f, 0.0f, 0.0f, 1.0f), FLinearColor(0.0f, 1.0f, 0.0f, 1.0f), 5.0f);
            if (local_1141)
            {
                local_1024 = local_1124.ImpactPoint;
            }
            local_1125 = false;
            UClass local_1148;
            TSoftClassPtr<APropPrefab> local_1158 = TSoftClassPtr<APropPrefab>(local_1148);
            FECSEntityAdapter local_1164 = FECSEntityAdapter(local_844);
            if (!(local_844.IsValid()))
            {
                local_1125 = false;
            }
            else
            {
                local_1125 = local_860.opCall();
            }
            if (local_1125)
            {
                if (local_930.IsValid() && local_856.GetPlayerProgressMap().Contains(local_930))
                {
                    int local_931_2 = local_856.GetPlayerProgressMap()[local_930].GetTeamId();
                    ::PVXSettlementEventUtils::TrySendPendingSettlementEventToTeam(local_931_2, local_418, PVXSettlementEventNames::RewardEvent_PVX_BossAim);
                }
            }
            ::FLevelUtils::SendCustomLevelEvent(DeadEntity, PVXSettlementEventNames::LevelEvent_PVXBossDeath);
            if (local_418.MessageHintConfig_HelpMonsterDeath)
            {
                FECSRuntimeView local_1202 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
                Include local_1206;
                local_1206.opCall();
                FECSRuntimeViewIterator local_1240 = local_1202.Iterator();
                for (; local_1240.CanProceed;)
                {
                    local_930 = local_1240.Proceed();
                    ::BlueprintFunctions_Level::Level_SendMessageHint(FECSEntityAdapter(local_930), local_418.MessageHintConfig_HelpMonsterDeath, TArray<FTextArgument>());
                }
            }
        }
        if (!(local_844))
        {
            local_1125 = false;
        }
        else
        {
            local_1125 = local_860.opCall();
        }
        if (local_1125)
        {
            Get local_994;
            FECSEntity local_930;
            int local_888;
            int local_887;
            Has local_878;
            EFaction local_873;
            Get local_872;
            int local_867;
            TDataObjectPtr<FBasePrefabConfig> local_980 = ::GetPrefabConfigPtr(DeadEntity);
            local_867 = local_872.opCall().GetPlayerId();
            local_873 = EFaction(1);
            FECSWorldPtr local_850_4 = ECS::GetECSWorld();
            local_1125 = local_878.opCall();
            if (local_1125)
            {
                FECSWorldPtr local_850_5 = ECS::GetECSWorld();
                if (local_884.GetPlayerMatchDatas().Contains(local_867))
                {
                    local_873 = local_884.GetPlayerMatchDatas()[local_867].GetFaction();
                }
            }
            local_887 = 0;
            local_888 = 0;
            TArray<FPVX_MonsterKillExpConfig> local_1282;
            local_418.MonsterKillExpDataTable.GetAllRows(local_1282);
            bool local_838_4 = false;
            for (auto& local_1296 : local_1282)
            {
                if ((local_1296.GetMonsterConfig().GetDataName() == local_980.GetDataName()))
                {
                    local_838_4 = true;
                    local_1139 = local_1296.UseExpMul;
                    if (local_1139)
                    {
                        int local_1297;
                        local_1297 = int(local_856.GetExpMultiplier());
                        local_887 = uint((int(local_1296.Exp) * local_1297));
                        int local_931_3 = int(local_1296.Coin);
                        local_888 = uint((local_931_3 * local_1297));
                    }
                    else
                    {
                        local_887 = int(local_1296.Exp);
                        local_888 = int(local_1296.Coin);
                    }
                    break;
                }
            }
            int local_1298 = 0;
            if (local_839 > 0)
            {
                local_1298 = 1;
                local_887 = local_887 + local_839;
            }
            else
            {
                if (!(local_838_4))
                {
                    local_1298 = 2;
                    local_887 = 100;
                }
            }
            if (local_887 > 0)
            {
                int local_1315;
                bool local_1031;
                FVector local_1018_3 = FVector(FVector::ZeroVector);
                Has local_1302;
                local_1031 = local_1302.opCall();
                if (local_1031)
                {
                    local_1018_3 = local_994.opCall().GetPosition();
                }
                TArray<FECSEntity> local_1310 = ::BlueprintFunctions_Common::GetAllPlayerEntitiesInRangeAS(local_1018_3, 1000000.0f, false);
                TArray<FECSEntity> local_1314;
                local_1315 = local_872.opCall().GetTeam();
                auto local_1322 = local_1310.Iterator();
                for (; local_1322.CanProceed;)
                {
                    local_930 = local_1322.Proceed();
                    Has local_1334;
                    local_1125 = local_1334.opCall();
                    if (local_1125 && ((local_872.opCall().GetTeam() == local_1315)))
                    {
                        local_1314.Add(local_1330);
                    }
                }
                local_1139 = local_1298 == 1 && (local_1314.Num() > 0);
                if (local_1139)
                {
                    local_887 = uint((local_887 / local_1314.Num()));
                }
                TDataObjectPtr<FItemConfig> local_1358 = local_418.CurrencyItemConfig;
                if (local_1358)
                {
                    if (local_1298 != 1)
                    {
                        local_1139 = false;
                    }
                    else
                    {
                        local_1139 = local_860.opCall();
                    }
                    if (local_1139 && (local_1314.Num() > 0))
                    {
                        Get local_864;
                        FECSEntity local_1146 = FECSEntity(local_864.opCall().GetPlayerEntity());
                        int local_931_4 = ::InventoryUtils::GetInventoryItemNumber(local_1146, local_1358);
                        local_1383 = FMath::IntegerDivisionTrunc(local_931_4, 4);
                        if (local_1383 > 0)
                        {
                            ::InventoryUtils::RemoveInventoryItem(local_1146, local_1358, local_1383);
                            local_856.GetModify_PlayerProgressMap()[local_1146].SetCurrencyAmount(::InventoryUtils::GetInventoryItemNumber(local_1146, local_1358));
                            local_1384 = local_1314.Num();
                            int local_889_2 = FMath::IntegerDivisionTrunc(local_1383, local_1384);
                            int local_1388 = local_1383 - (local_889_2 * local_1384);
                            int local_1390 = 0;
                            for (; local_1390 < local_1314.Num(); ++local_1390)
                            {
                                if (local_1390 < local_1388)
                                {
                                    local_1389 = 1;
                                }
                                else
                                {
                                    local_1389 = 0;
                                }
                                int local_840_2 = local_889_2 + local_1389;
                                if (local_840_2 > 0)
                                {
                                    ::InventoryUtils::AddInventoryItem(local_1314[local_1390], local_1358, local_840_2);
                                    local_856.GetModify_PlayerProgressMap()[local_1314[local_1390]].SetCurrencyAmount(::InventoryUtils::GetInventoryItemNumber(local_1314[local_1390], local_1358));
                                }
                            }
                        }
                    }
                    else
                    {
                        if (local_888 > 0)
                        {
                            auto local_1328 = local_1314.Iterator();
                            for (; local_1328.CanProceed;)
                            {
                                local_930 = local_1328.Proceed();
                                ::InventoryUtils::AddInventoryItem(local_930, local_1358, local_888);
                                local_856.GetModify_PlayerProgressMap()[local_930].SetCurrencyAmount(::InventoryUtils::GetInventoryItemNumber(local_930, local_1358));
                            }
                        }
                    }
                }
                auto local_1322_2 = local_1314.Iterator();
                for (; local_1322_2.CanProceed;)
                {
                    local_930 = local_1322_2.Proceed();
                    FPVX_PlayerProgressData& local_886_2 = local_856.GetModify_PlayerProgressMap()[local_930];
                    local_1383 = local_886_2.GetLevel();
                    local_1384 = local_886_2.GetExp();
                    local_886_2.SetExp((local_886_2.GetExp() + local_887));
                    local_886_2.SetLevel(::PVXGameModeUtils::GetLevelByExp(local_886_2.GetExp()));
                    if ((local_866 == local_930))
                    {
                        local_932 = 1;
                    }
                    else
                    {
                        local_932 = 3;
                    }
                    ::PVXGameModeUtils::SendPVXExpChangeDataTrack(local_930, DeadEntity, local_1384, local_886_2.GetExp());
                    if (local_1383 < local_886_2.GetLevel())
                    {
                        local_886_2.SetbInLevelProtect(false);
                        FECSEntity local_1146_2 = FECSEntity(local_872.opCall().GetPlayerPawnEntity());
                        Has local_1400;
                        bool local_1141_2 = local_1400.opCall();
                        if (local_1141_2 && (int(local_873) != 6))
                        {
                            TArray<FECSEntity> local_1404 = local_872.opCall().GetAllPlayerPawnEntities();
                            auto local_1328_2 = local_1404.Iterator();
                            for (; local_1328_2.CanProceed;)
                            {
                                local_1330 = local_1328_2.Proceed();
                                if (!((local_1330 == local_1146_2)))
                                {
                                    local_1146_2 = local_1330;
                                    break;
                                }
                            }
                        }
                        ::FGameModeUtils::OverrideGameAttributeByDelta(local_1146_2, local_886_2.GetLevel());
                        ::PVXUtil::ApplyLevelUpBuff(local_1146_2, EFaction(local_873), local_418.LevelUpBuff_Player, local_418.LevelUpBuff_Boss);
                        if (int(local_873) == 6)
                        {
                            local_886_2.SetLastEvolveLevel_Boss(::PVXUtil::TryEvolveBoss(local_418.UpgradeMonsterDatas, local_1383, local_886_2.GetLevel(), local_886_2.GetLastEvolveLevel_Boss(), local_1146_2, local_418.BossEvolveSettings));
                        }
                    }
                }
                if (local_837)
                {
                    if (!(local_844))
                    {
                        local_1139 = false;
                    }
                    else
                    {
                        local_1139 = local_860.opCall();
                    }
                    if (local_1139)
                    {
                        TArray<FTextArgument> local_1278;
                        Make local_1416;
                        local_1278.Add(local_1416.opImplConv());
                        Make local_1428;
                        local_1278.Add(local_1428.opImplConv());
                        ::BlueprintFunctions_Level::Level_SendMessageHint(FECSEntityAdapter(local_844), local_418.MessageHintConfig_PlayerKill, local_1278);
                    }
                }
            }
        }
        return;
    }
    void HandleInitFakeCharacter(const FECSEntity &inout FakeEntity, const FC_FakeCharacterInit &inout FakeCharacterInit) const
    {
        Has local_4;
        int local_18 = 0;
        int local_34 = 0;
        int local_44 = 0;
        if (!(local_4.opCall()) || !(FakeCharacterInit))
        {
            return;
        }
        EFaction local_19 = EFaction(1);
        FECSWorldPtr local_22 = ECS::GetECSWorld();
        Has local_26;
        if (local_26.opCall())
        {
            int local_27;
            local_27 = local_18.GetPlayerId();
            FECSWorldPtr local_22_2 = ECS::GetECSWorld();
            if (local_34.GetPlayerMatchDatas().Contains(local_27))
            {
                local_19 = local_34.GetPlayerMatchDatas()[local_27].GetFaction();
            }
        }
        bool local_5 = (int(local_19) == 6);
        if (!(local_5))
        {
            return;
        }
        int local_28 = local_5 ? local_18.GetAllPlayerPawnEntities().IndexOfByKey(FakeCharacterInit.SwitchOutEntity) : -1;
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
        FECSWorldPtr local_22_3 = ECS::GetECSWorld();
        ::FGameModeUtils::OverrideGameAttribute(FakeEntity, local_44.GetLevel());
        return;
    }
    void HandlePlayerLeavePVX(const FCE_PlayerLeaveEvent &inout Event) const
    {
        int local_12 = 0;
        int local_20 = 0;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (!(local_4.IsValid()))
        {
            return;
        }
        if (!(local_12))
        {
            return;
        }
        FECSWorldPtr local_14 = ECS::GetECSWorld();
        if (!(local_20.GetPlayerProgressMap().Contains(local_4)))
        {
            return;
        }
        FPVX_PlayerProgressData& local_22 = local_20.GetModify_PlayerProgressMap()[local_4];
        if ((int(local_22.GetFinalState())) == 0)
        {
            ::PVXSettlementEventUtils::SetPlayerProgressDataFinalState(local_22, EPVXPlayerFinalState(EPVXPlayerFinalState(3)), EPVXPlayerFinishReason(5));
            ::PVXGameModeUtils::SendPVXEndDataTrack(local_4);
        }
        return;
    }
}

struct __Lambda_Gameplay_Designer_PVX_PVXGameMode_1472
{
    UPROPERTY()
    FECSEntity __PlayerEntity;

    __Lambda_Gameplay_Designer_PVX_PVXGameMode_1472()
    {
        return;
    }
    __Lambda_Gameplay_Designer_PVX_PVXGameMode_1472(const FECSEntity &inout _InPlayerEntity)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FECSEntity GetPlayerEntity() property
    {
        FECSEntity __r;
        return __r;
    }
    void opCall()
    {
        if (!(this.GetPlayerEntity().IsValid()))
        {
            return;
        }
        SendEvent local_6;
        local_6.opCall(FFPTime(-1));
        return;
    }
}


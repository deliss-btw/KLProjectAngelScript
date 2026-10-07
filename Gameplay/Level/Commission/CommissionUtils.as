
namespace CommissionUtils
{
    const FConsoleVariable CVar_Commission_DebugEnableNewTierRule = FConsoleVariable();

}
struct __Lambda_Gameplay_Level_Commission_CommissionUtils_278
{
    __Lambda_Gameplay_Level_Commission_CommissionUtils_278()
    {
        return;
    }
    bool opCall(const FFinishTeamMemberInfo &inout A, const FFinishTeamMemberInfo &inout B)
    {
        int local_3 = A.GetPlayerIndex();
        int local_4 = B.GetPlayerIndex();
        return (local_3 < local_4);
    }
}

namespace CommissionUtils
{
TDataObjectPtr<FCommissionConfig> GetMyCommissionConfig(const uint64 CommissionID)
{
    if (FMS_CommissionData::Get(FASCommonUtils::GetLocalPlayerController()).FindCommissionByInstId(CommissionID).IsValid())
    {
        return GetCommissionConfig();
    }
    return TDataObjectPtr<FCommissionConfig>();
}
uint GetFinishCommissionTotalScore(const bool MainObj, const bool SubObj, const int Random, const bool Challenge, const bool Special_Environment, const bool Special_TeamerFriend)
{
    int local_1 = 0;
    int local_2 = MainObj ? int(CommissionUtils::GetCommissionSettings().MainObjectiveScore) : 0;
    local_1 = local_1 + local_2;
    int local_5 = SubObj ? int(CommissionUtils::GetCommissionSettings().SubObjectiveScore) : 0;
    local_1 = local_1 + local_5;
    local_2 = int(CommissionUtils::GetCommissionSettings().RandomAndEnvironmentObjScore);
    local_5 = Random * local_2;
    local_1 = local_1 + local_5;
    local_2 = Challenge ? int(CommissionUtils::GetCommissionSettings().ChallengeObjectiveScore) : 0;
    local_1 = local_1 + local_2;
    local_5 = Special_Environment ? int(CommissionUtils::GetCommissionSettings().Special_EnvironmentEndingScore) : 0;
    local_1 = local_1 + local_5;
    local_2 = Special_TeamerFriend ? int(CommissionUtils::GetCommissionSettings().Special_TeamHaveFriendsScore) : 0;
    local_1 = local_1 + local_2;
    return local_1;
}
void SetFinishCommissionTierAndScore(FCS_CommissionFinish &inout CommissionFinish)
{
    if (!(CommissionFinish.GetMainObjectiveIsFinish()))
    {
        CommissionFinish.SetRewardScore(0);
        CommissionFinish.SetFinishTier(1);
        return;
    }
    TDataObjectPtr<FCommissionConfig> local_26 = CommissionUtils::GetCurrentCommissionConfig();
    if (!(local_26))
    {
        XError(ELog(22), FString().Append("SetFinishCommissionTierAndScore can not found CurrentCommissionConfig"));
        return;
    }
    ECommissionType local_56 = local_26.opArrow().CommissionType;
    FCommissionFinishScoreRule local_72;
    switch (int(local_56))
    {
    case 1:
    {
        CommissionUtils::GetCommissionSettings();
        break;
    }
    case 2:
    {
        CommissionUtils::GetCommissionSettings();
        break;
    }
    case 4:
    {
        CommissionUtils::GetCommissionSettings();
        break;
    }
    case 3:
    default:
    {
        XError(ELog(22), FString().Append("SetFinishCommissionTierAndScore unknow CommissionType ").Append(local_56));
        return;
    }
    }
    FFPTime local_84 = FFPTime(CommissionFinish.GetFinishTime());
    FECSWorldPtr local_78 = ECS::GetECSWorld();
    Get local_82;
    int local_73 = int(((local_84 - local_82.opCall().CommissionStartTime).ToSeconds() / 60.0));
    TArray<FECSEntity> local_102 = FGameUtils::GetAllPlayerControllerEntities(true);
    int local_103 = 0;
    int local_104 = 0;
    for (auto& local_118 : local_102)
    {
        local_118;
        Get local_122;
        const FC_CommissionPlayerStats& local_124 = local_122.opCall();
        if (local_124)
        {
            local_103 = local_103 + int(local_124.DeathCount);
            local_104 = local_104 + int(local_124.NearDeathCount);
        }
    }
    CommissionFinish.GetModify_ScoreItems().Empty(0);
    int local_125 = local_72.MainObjectFinish;
    FCommissionFinishScoreItem local_130;
    local_130.SetType(ECommissionFinishScoreType(0));
    local_130.SetNum(1);
    local_130.SetScore(int(local_72.MainObjectFinish));
    CommissionFinish.GetModify_ScoreItems().Add(local_130);
    if (CommissionFinish.GetSubObjectiveIsFinish())
    {
        local_125 = local_125 + local_72.SubObjectFinish;
        local_130.SetType(ECommissionFinishScoreType(4));
        local_130.SetNum(1);
        local_130.SetScore(int(local_72.SubObjectFinish));
        CommissionFinish.GetModify_ScoreItems().Add(local_130);
    }
    for (auto& local_146 : local_72.FinishTimeMinutes)
    {
        if (local_73 <= int(local_146.Metric))
        {
            local_125 = local_125 + int(local_146.Score);
            int local_150 = FMath::Max(0, ((uint((local_26.opArrow().CommissionTimeLimit / 60.0f))) - int(local_146.Metric)));
            local_130.SetType(ECommissionFinishScoreType(1));
            local_130.SetNum(local_150);
            local_130.SetScore(int(local_146.Score));
            CommissionFinish.GetModify_ScoreItems().Add(local_130);
            break;
        }
    }
    for (auto& local_146 : local_72.TeamTotalDeathCount)
    {
        if (local_103 <= int(local_146.Metric))
        {
            local_125 = local_125 + int(local_146.Score);
            local_130.SetType(ECommissionFinishScoreType(2));
            local_130.SetNum(local_103);
            local_130.SetScore(int(local_146.Score));
            CommissionFinish.GetModify_ScoreItems().Add(local_130);
            break;
        }
    }
    for (auto& local_146 : local_72.TeamTotalNearDeathCount)
    {
        if (local_104 <= int(local_146.Metric))
        {
            local_125 = local_125 + int(local_146.Score);
            local_130.SetType(ECommissionFinishScoreType(3));
            local_130.SetNum(local_104);
            local_130.SetScore(int(local_146.Score));
            CommissionFinish.GetModify_ScoreItems().Add(local_130);
            break;
        }
    }
    CommissionFinish.SetRewardScore(local_125);
    CommissionFinish.SetFinishTier(int((CommissionUtils::GetCommissionScore2TierLevel(ECommissionType(local_56), local_125))));
    return;
}
void FinishCommission(const TDataObjectPtr<FCommissionConfig> &inout CommissionConfig, const bool bSuccess, const ECommissionFailReason FailReason = ECommissionFailReason::Unknown)
{
    int local_30 = 0;
    int local_37 = 0;
    FCS_CommissionInfo local_84;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Has local_6;
    bool local_7 = local_6.opCall();
    if (local_7)
    {
        XError(ELog(22), FString().Append("FinishCommission: CommissionConfig=").Append(CommissionConfig.GetDataName().ToString()).Append(", bSuccess=").Append(bSuccess).Append(", FailReason=").Append(FailReason).Append(" already finished"));
        return;
    }
    FECSWorldPtr local_2_2 = ECS::GetECSWorld();
    Has local_24;
    if (!(local_24.opCall()))
    {
        XError(ELog(22), FString().Append("FinishCommission: CommissionConfig=").Append(CommissionConfig.GetDataName().ToString()).Append(", bSuccess=").Append(bSuccess).Append(", FailReason=").Append(FailReason).Append(" No ds gloable info"));
        return;
    }
    XLog(ELog(22), FString().Append("FinishCommission: CommissionConfig=").Append(CommissionConfig.GetDataName().ToString()).Append(", bSuccess=").Append(bSuccess).Append(", FailReason=").Append(FailReason));
    FECSWorldPtr local_2_3 = ECS::GetECSWorld();
    local_30.SetbSuccess(bSuccess);
    local_30.SetFailReason(ECommissionFailReason(FailReason));
    FECSWorldPtr local_2_4 = ECS::GetECSWorld();
    Get local_34;
    local_30.SetFinishTime(local_34.opCall().Time);
    float32 local_35 = 10.0f;
    int local_38 = local_37;
    if (local_38 == 3)
    {
        float32 local_36;
        if (bSuccess)
        {
            local_36 = CommissionUtils::GetCommissionSettings().MissionFinishKickPlayerTime;
        }
        else
        {
            local_36 = CommissionUtils::GetCommissionSettings().MissionFailKickPlayerTime;
        }
        local_35 = local_36;
    }
    else
    {
        float32 local_36;
        if (bSuccess)
        {
            local_36 = CommissionUtils::GetCommissionSettings().CommissionFinishKickPlayerTime;
        }
        else
        {
            local_36 = CommissionUtils::GetCommissionSettings().CommissionFailKickPlayerTime;
        }
        local_35 = local_36;
    }
    if (local_35 > 0.0f)
    {
        XLog(ELog(22), FString().Append("Will kick player after ").Append(local_35).Append(" seconds"));
        local_30.SetKickPlayerTime((FFPTime(local_30.GetFinishTime()) + FFPTime(local_35)));
        local_30.SetbKickedPlayer(false);
    }
    bool local_55 = false;
    FECSWorldPtr local_2_5 = ECS::GetECSWorld();
    Get local_60;
    bool local_7_2 = local_60.opCall().SubTargetConfig.IsSet();
    FECSWorldPtr local_2_6 = ECS::GetECSWorld();
    Get local_64;
    const FCS_CommissionSubTarget& local_66 = local_64.opCall();
    if (local_66)
    {
        if (bSuccess && (int(local_66.GetStatus()) == 0))
        {
            FECSWorldPtr local_70 = ECS::GetECSWorld();
            Modify local_74;
            CommissionUtils::HandlePendingSubTargetOnCommissionFinish(local_30, local_74.opCall());
        }
        local_55 = local_66.GetObjectiveInstanceId() > 0 && (int(local_66.GetStatus()) == 1);
    }
    bool local_68 = false;
    int local_77 = local_68;
    FECSWorldPtr local_70_2 = ECS::GetECSWorld();
    Get local_82;
    local_68 = (local_82.opCall().bHasFinishChallengeFactor != 0);
    if (local_68)
    {
        FECSWorldPtr local_70_3 = ECS::GetECSWorld();
        int local_38_2 = local_82.opCall().bHasFinishChallengeFactor;
        bool local_78 = (local_38_2 > 0);
        local_77 = local_78;
    }
    FECSWorldPtr local_70_4 = ECS::GetECSWorld();
    local_30.SetMainObjectiveIsFinish(bSuccess);
    local_30.SetSubObjectiveIsFinish(local_55);
    int local_39 = local_84 ? int(local_84.RandomEventSuccessNum) : 0;
    local_30.SetRandomEventFinishNum(local_39);
    local_30.SetChallengeObjectiveIsFinish((local_77 != 0));
    local_30.SetSpecial_EnvironmentEndingFinish(false);
    if (CommissionUtils::CVar_Commission_DebugEnableNewTierRule.GetBool())
    {
        CommissionUtils::SetFinishCommissionTierAndScore(local_30);
    }
    else
    {
        local_39 = CommissionConfig.opArrow().MaxRandomEventCount;
        local_30.SetTotalScore(CommissionUtils::GetFinishCommissionTotalScore(true, local_7_2, local_39, local_68, false, false));
        local_30.SetRewardScore(CommissionUtils::GetFinishCommissionTotalScore(local_30.GetMainObjectiveIsFinish(), local_30.GetSubObjectiveIsFinish(), local_30.GetRandomEventFinishNum(), local_30.GetChallengeObjectiveIsFinish(), false, false));
    }
    TArray<FECSEntity> local_96 = FGameUtils::GetAllPlayerControllerEntities(true);
    for (auto& local_110 : local_96)
    {
        UGameDSConnectionSubsystem::Get().FinishCommission(local_110, bSuccess);
        Get local_116;
        const FC_PlayerController& local_118 = local_116.opCall();
        if (local_118)
        {
            FFinishTeamMemberInfo local_156;
            local_156.SetPlayerEntityId(local_110.GetId());
            Get local_162;
            local_156.SetPlayerNameCached(local_162.opCall().GetNickName());
            local_156.SetAvatarPrefabConfig(GetAvatarConfig(local_118.GetPlayerPawnEntity()));
            local_156.SetPlayerID(local_118.GetPlayerId());
            local_156.SetPlayerIndex(uint8(local_118.GetPlayerIndex()));
            local_156.SetRewardBadge(CommissionStatsUtils::GetAllRewardBadge(local_110));
            local_30.GetModify_FinishTeamers().Add(local_156);
            FECSWorldPtr local_2_7 = ECS::GetECSWorld();
            FBuffUtils::AddBuff(local_118.GetPlayerPawnEntity(), CommissionUtils::GetCommissionSettings().CommissionEndBuffConfig, local_34.opCall().Time, local_118.GetPlayerPawnEntity(), false, -1.0f, 1, false);
        }
    }
    PlayerNotify::CancelNotify(EPlayerNotify(0));
    PlayerNotify::NotifyPlayer(EPlayerNotify(1));
    FFPTime local_54 = FFPTime(-1);
    FECSWorldPtr local_2_8 = ECS::GetECSWorld();
    FCE_CommissionFinished local_206;
    local_206.bSuccess = bSuccess;
    local_206.FailReason = FailReason;
    return;
}
TDataObjectPtr<FCommissionTypeConfig> GetCommissionTypeConfig(const ECommissionType CommissionType)
{
    TDataObjectIterator<FCommissionTypeConfig> local_16;
    for (; local_16; )
    {
        if (int(local_16.GetData().CommissionType) == int(CommissionType))
        {
            return TDataObjectPtr<FCommissionTypeConfig>();
        }
        local_16.Next();
    }
    return local_48;
}
ESystemModule GetSystemModuleByCommissionType(const ECommissionType CommissionType)
{
    switch (int(CommissionType))
    {
    case 1:
    {
        return ESystemModule(110);
    }
    case 2:
    {
        return ESystemModule(111);
    }
    case 3:
    {
        return ESystemModule(109);
    }
    case 4:
    {
        return ESystemModule(112);
    }
    case 5:
    {
        return ESystemModule(113);
    }
    default:
    {
    }
    }
    return ESystemModule(0);
}
bool IsCommissionTypeUnlocked(const ECommissionType CommissionType, const bool bShowTips = false)
{
    if ((int(CommissionUtils::GetSystemModuleByCommissionType(ECommissionType(CommissionType)))) == 0)
    {
        return false;
    }
    return FMS_SystemControl::Get(FASCommonUtils::GetLocalPlayerController()).IsSystemUnlock(bShowTips);
}
void ServerSetCurrentCommission(const TDataObjectPtr<FCommissionConfig> &inout CommissionConfig)
{
    XLog(ELog(22), FString().Append("ServerSetCurrentCommission: CommissionConfig=").Append(CommissionConfig.GetDataName().ToString()));
    FECSWorldPtr local_14 = ECS::GetECSWorld();
    Has local_18;
    bool local_19 = local_18.opCall();
    FECSWorldPtr local_14_2 = ECS::GetECSWorld();
    Remove local_24;
    local_24.opCall();
    PlayerNotify::CancelNotify(EPlayerNotify(1));
    if (CommissionConfig)
    {
        FCS_CommissionInfo local_32;
        FECSWorldPtr local_14_3 = ECS::GetECSWorld();
        local_32.CommissionConfig = CommissionConfig;
        local_32.RandomEventSuccessNum = 0;
    }
    if (local_19)
    {
        FECSWorldPtr local_14_4 = ECS::GetECSWorld();
        FCS_CommissionInfoChangedTag local_64;
        Assign local_62;
        local_62.opCall(local_64);
    }
    return;
}
uint ServerActivateCommissionObjective(const TDataObjectPtr<FObjectiveConfig> &inout ObjectiveConfig, const bool bActivateGuide = false)
{
    FCS_CommissionInfo local_8;
    FObjectiveInstance local_366;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if (int(local_8.CommissionTargetObjectiveInstanceId) > 0)
    {
        ObjectiveUtils::DeactivateObjectives(int(local_8.CommissionTargetObjectiveInstanceId));
    }
    FCommissionTargetProgress local_18;
    local_8.Progress = local_18;
    local_8.ChildProgress.Empty(0);
    local_8.CommissionTargetObjective = ObjectiveConfig;
    if (ObjectiveConfig.IsSet())
    {
        FObjectiveContext local_50;
        local_8.CommissionTargetObjectiveInstanceId = ObjectiveUtils::ActivateObjective(ObjectiveConfig, local_50);
        int local_9 = int(local_8.CommissionTargetObjectiveInstanceId);
        if ((local_9 > 0 && (0 == 1)))
        {
            FObjectiveInstance local_200;
            int local_10 = int(local_8.CommissionTargetObjectiveInstanceId);
            if (ObjectiveUtils::TryFindActivetedObjectiveInstance(local_10, local_200))
            {
                FECSWorldPtr local_2_2 = ECS::GetECSWorld();
                for (auto& local_220 : local_200.ChildObjectiveMap)
                {
                    local_220;
                    if (local_10 == 0)
                    {
                        continue;
                    }
                    if (ObjectiveUtils::TryFindActivetedObjectiveInstance(local_9, local_366))
                    {
                        FCommissionTargetProgress local_368;
                        local_368.SetSuccessProgressValue(local_366.GetFinishProgressValue());
                        local_368.SetFailedProgressValue(local_366.GetFailProgressValue());
                        TMap<uint, FCommissionTargetProgress> local_202;
                        local_202.Add(local_366.ObjectiveId, local_368);
                    }
                }
            }
        }
        if ((bActivateGuide && (int(local_8.CommissionTargetObjectiveInstanceId) > 0)))
        {
            int local_369 = int(CommissionUtils::GetCommissionGuideStyleType());
            FECSWorldPtr local_2_3 = ECS::GetECSWorld();
            ModifyOrAdd local_374;
            FCS_CommissionGuideInfo& local_376 = local_374.opCall();
            if (local_376)
            {
                local_376.CommissionTargetObjectiveInstanceId = int(local_8.CommissionTargetObjectiveInstanceId);
                local_376.GuideStyleType = EGuideStyleType(local_369);
                CommissionUtils::SetObjectiveGuideEnabledToAllPlayers(int(local_8.CommissionTargetObjectiveInstanceId), true, EGuideStyleType(local_369));
            }
        }
    }
    return int(local_8.CommissionTargetObjectiveInstanceId);
}
void ServerDeactivateCommissionObjective(const TDataObjectPtr<FObjectiveConfig> &inout ObjectiveConfig)
{
    FCS_CommissionInfo local_8;
    bool local_11;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if (int(local_8.CommissionTargetObjectiveInstanceId) <= 0)
    {
        local_11 = false;
    }
    else
    {
        TDataObjectPtr<FObjectiveConfig> local_36;
        local_36 = local_8.CommissionTargetObjective;
        local_11 = (local_36 == ObjectiveConfig.opImplConv());
    }
    if (local_11)
    {
        ObjectiveUtils::DeactivateObjectives(int(local_8.CommissionTargetObjectiveInstanceId));
        local_8.CommissionTargetObjectiveInstanceId = 0;
        local_8.CommissionTargetObjective = TDataObjectPtr<FObjectiveConfig>(nullptr);
        FCommissionTargetProgress local_92;
        local_8.Progress = local_92;
        local_8.ChildProgress.Empty(0);
    }
    return;
}
uint ServerActivateAdditionalCommissionObjective(const TDataObjectPtr<FObjectiveSingleConfig> &inout ChildConfig)
{
    FCS_CommissionInfo local_8;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if ((!(local_8) || (int(local_8.CommissionTargetObjectiveInstanceId) == 0)))
    {
        XError(ELog(22), FString().Append("ServerActivateAdditionalCommissionObjective: no active commission objective"));
        return 0;
    }
    int local_10 = ObjectiveUtils::AddChildToObjectiveGroup(int(local_8.CommissionTargetObjectiveInstanceId), ChildConfig);
    if (local_10 > 0)
    {
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        Get local_22;
        const FCS_CommissionGuideInfo& local_24 = local_22.opCall();
        if (local_24)
        {
            CommissionUtils::SetObjectiveGuideEnabledToAllPlayers(local_10, true, local_24.GuideStyleType);
        }
    }
    return local_10;
}
void ServerSetCurrentCommissionTimeoutTime(const FCS_FixedTime &inout C_FixedTime, FCS_CommissionInfo &inout C_CommissionInfo)
{
    float32 local_1 = 0.0f;
    if (local_1 > 0.0f)
    {
        C_CommissionInfo.CommissionTimeoutTime = (FFPTime(C_FixedTime.Time) + FFPTime(local_1));
    }
    else
    {
        C_CommissionInfo.CommissionTimeoutTime = FFPTime(-1);
    }
    XLog(ELog(22), FString().Append("ServerSetCurrentCommissionTimeoutTime: CurrentTime=").Append(C_FixedTime.Time).Append(", CommissionTimeoutTime=").Append(C_CommissionInfo.CommissionTimeoutTime));
    return;
}
TDataObjectPtr<FCommissionConfig> GetCurrentCommissionConfig()
{
    if (!(ECS::GetECSWorld().IsValid()))
    {
        return TDataObjectPtr<FCommissionConfig>();
    }
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Get local_56;
    const FCS_CommissionInfo& local_58 = local_56.opCall();
    if (local_58)
    {
        return local_58.CommissionConfig;
    }
    return local_28;
}
TArray<FECSEntity> FindCurrentCommissionTargets()
{
    return CommissionTargetUtils_Internal::FindCurrentCommissionTargetsInternal(0);
}
FECSEntity FindFirstCurrentCommissionTarget()
{
    TArray<FECSEntity> local_6 = CommissionTargetUtils_Internal::FindCurrentCommissionTargetsInternal(1);
    if (!(local_6.IsEmpty()))
    {
        return local_6[0];
    }
    return ENTITY_NULL;
}
TArray<FECSEntity> FindCurrentCommissionObjectiveTargets()
{
    return CommissionTargetUtils_Internal::FindCurrentCommissionObjectiveTargetsInternal(0);
}
FECSEntity FindFirstCurrentCommissionObjectiveTarget()
{
    TArray<FECSEntity> local_6 = CommissionTargetUtils_Internal::FindCurrentCommissionObjectiveTargetsInternal(1);
    if (!(local_6.IsEmpty()))
    {
        return local_6[0];
    }
    return ENTITY_NULL;
}
bool IsCommissionTarget(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    FDataObjectPtr local_68;
    Has local_6;
    if (!(Entity) || !(local_6.opCall()))
    {
        return false;
    }
    if (!(local_14))
    {
        return false;
    }
    FECSWorldPtr local_16 = Entity.GetWorld();
    Get local_20;
    if (local_20.opCall())
    {
        TArray<TDataObjectPtr<FMonsterMainConfig>> local_26 = FLevelUtils::GetTargetMonsterConfigsFromObjective(GetCommissionTargetObjective());
        for (auto& local_44 : local_26)
        {
            local_68;
            if ((local_44 == local_68))
            {
                return true;
            }
        }
    }
    return false;
}
TDataObjectPtr<FMonsterMainConfig> TryGetMonsterConfigFromSingleObjective(const TDataObjectPtr<FObjectiveSingleConfig> &inout SingleObjective)
{
    bool local_111 = false;
    TDataObjectPtr<FMonsterMainConfig> __return;
    if (!(SingleObjective))
    {
        return TDataObjectPtr<FMonsterMainConfig>();
    }
    CastTo local_54;
    if (!(local_54.opCall()))
    {
        return TDataObjectPtr<FMonsterMainConfig>();
    }
    FInstancedStruct::GetPtr local_106;
    if (local_106.opCall() && local_111)
    {
    }
    else
    {
        __return = TDataObjectPtr<FMonsterMainConfig>();
    }
    return __return;
}
TArray<TDataObjectPtr<FMonsterMainConfig>> GetCommissionObjectiveTargetMonsterConfigs()
{
    TArray<TDataObjectPtr<FMonsterMainConfig>> local_4;
    int local_63 = 0;
    FECSWorldPtr local_6 = ECS::GetECSWorld();
    Get local_10;
    if (local_10.opCall())
    {
        if (!(GetCommissionTargetObjective().IsSet()))
        {
            return local_4;
        }
        int local_64 = local_63;
        if (local_64 == 0)
        {
            CastTo local_70;
            TDataObjectPtr<FMonsterMainConfig> local_142 = CommissionUtils::TryGetMonsterConfigFromSingleObjective(local_70.opCall());
            if (local_142)
            {
                local_4.Add(local_142);
            }
        }
        else
        {
            if (local_63 == 1)
            {
                CastTo local_170;
                TDataObjectPtr<FObjectiveGroupConfig> local_194 = local_170.opCall();
                for (auto& local_232 : GetChildObjectives())
                {
                    TDataObjectPtr<FMonsterMainConfig> local_166 = CommissionUtils::TryGetMonsterConfigFromSingleObjective(local_232);
                    if (local_166)
                    {
                        local_4.Add(local_166);
                    }
                }
            }
        }
    }
    return local_4;
}
bool IsCommissionObjectiveTarget(const FECSEntity &inout Entity)
{
    FDataObjectPtr local_60;
    Has local_6;
    if (!(Entity) || !(local_6.opCall()))
    {
        return false;
    }
    Get local_12;
    if (local_12.opCall())
    {
        TArray<TDataObjectPtr<FMonsterMainConfig>> local_22 = CommissionUtils::GetCommissionObjectiveTargetMonsterConfigs();
        for (auto& local_36 : local_22)
        {
            local_60;
            if ((local_36 == local_60))
            {
                return true;
            }
        }
    }
    return false;
}
bool CommissionFinishLikePlayer(const FECSEntity &inout FromPlayer, const uint TargetPlayerID)
{
    if ((!(FromPlayer) || (TargetPlayerID == 0)))
    {
        return false;
    }
    FFPTime local_10 = FFPTime(-1);
    FCE_RequestCommissionFinishedLikePlayer local_14;
    local_14.FromPlayer = FromPlayer;
    local_14.TargetPlayerID = TargetPlayerID;
    return true;
}
UCommissionSettings GetCommissionSettings()
{
    return GetGameplaySettings<UCommissionSettings>();
}
TDataObjectPtr<FWorldAreaConfig> GetCommissionStartArea()
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Get local_6;
    const FCS_CommissionDSGlobalInfo& local_8 = local_6.opCall();
    if (local_8)
    {
        return local_8.SpawnAreaConfig;
    }
    return TDataObjectPtr<FWorldAreaConfig>(nullptr);
}
void SetObjectiveGuideEnabledToAllPlayers(const uint ObjectiveInstanceId, const bool bEnabled, const EGuideStyleType GuideStyleType = EGuideStyleType::Level)
{
    if (ObjectiveInstanceId > 0)
    {
        TArray<FECSEntity> local_10 = FGameUtils::GetAllPlayerControllerEntities(true);
        if (bEnabled)
        {
            for (auto& local_24 : local_10)
            {
                ObjectiveUtils::StartObjectiveGuide(ObjectiveInstanceId, local_24, EGuideStyleType(GuideStyleType));
            }
        }
        else
        {
            ObjectiveUtils::StopObjectiveGuide(ObjectiveInstanceId, ENTITY_NULL);
        }
    }
    return;
}
void ServerInitCommissionByDSGlobalInfo(const FPbDsGlobalCommissionInfo &inout DsCommissionInfo)
{
    FDataObjectPtr local_64;
    FDataObjectPtr local_88;
    TDataObjectPtr<FWorldAreaConfig> local_256;
    if (!(DsCommissionInfo.IsValid()))
    {
        return;
    }
    int64 local_4 = DsCommissionInfo.GetCommissionInstId();
    if (local_4 == 0)
    {
        return;
    }
    FECSWorldPtr local_8 = ECS::GetECSWorld();
    ModifyOrAdd local_12;
    FCS_CommissionDSGlobalInfo& local_14 = local_12.opCall();
    if (local_14)
    {
        local_14.CommissionProgress = DsCommissionInfo.GetProgress();
        local_14.CommissionInstId = DsCommissionInfo.GetCommissionInstId();
        XLog(ELog(22), FString().Append("Init CommissionInstId=").Append(local_14.CommissionInstId).Append(" CommissionProgress=").Append(local_14.CommissionProgress));
        if (DsCommissionInfo.GetCommissionInstanceInfo().GetCommissionTime() >= 0)
        {
            int local_34 = DsCommissionInfo.GetCommissionInstanceInfo().GetCommissionTime();
            float32 local_36 = (DsCommissionInfo.GetCommissionInstanceInfo().GetCommissionTime() % 24);
            local_14.StartTimeInHoursOverride = local_36;
        }
        if (DsCommissionInfo.GetCommissionInstanceInfo().GetTimeSpeed() >= 0)
        {
            local_14.TimeSpeedOverride = DsCommissionInfo.GetCommissionInstanceInfo().GetTimeSpeed();
        }
        if (DsCommissionInfo.GetCommissionInstanceInfo().GetTimeId() > 0)
        {
            int local_37 = DsCommissionInfo.GetCommissionInstanceInfo().GetTimeId();
            if (!(local_64.IsValid()))
            {
                XError(ELog(22), FString().Append("SelectedCommissionTimeConfig is not valid for DsCommissionInfo.TimeId=").Append(DsCommissionInfo.GetCommissionInstanceInfo().GetTimeId()));
            }
            else
            {
                TDataObjectPtr<FCommissionTimeConfig> local_112;
                local_14.SelectedCommissionTimeConfig = local_112;
            }
        }
        if (DsCommissionInfo.GetCommissionInstanceInfo().GetSubTargetId() > 0)
        {
            int local_15 = DsCommissionInfo.GetCommissionInstanceInfo().GetSubTargetId();
            if (!(local_88.IsValid()))
            {
                XError(ELog(22), FString().Append("SubTargetConfig is not valid for DsCommissionInfo.SubTargetId=").Append(DsCommissionInfo.GetCommissionInstanceInfo().GetSubTargetId()));
            }
            else
            {
                TDataObjectPtr<FObjectiveConfig> local_160;
                local_14.SubTargetConfig = local_160;
            }
        }
        if (DsCommissionInfo.GetCommissionInstanceInfo().GetIntrusionPolicyId() > 0)
        {
            int local_37_2 = DsCommissionInfo.GetCommissionInstanceInfo().GetIntrusionPolicyId();
            if (!(local_64.IsValid()))
            {
                XError(ELog(22), FString().Append("IntrusionPolicyConfig is not valid for DsCommissionInfo.IntrusionPolicyId=").Append(DsCommissionInfo.GetCommissionInstanceInfo().GetIntrusionPolicyId()));
            }
            else
            {
                TDataObjectPtr<FIntrusionPolicyConfig> local_208;
                local_14.IntrusionPolicyConfig = local_208;
            }
        }
        if (DsCommissionInfo.GetCommissionInstanceInfo().GetSpawnAreaId() > 0)
        {
            int local_37_3 = DsCommissionInfo.GetCommissionInstanceInfo().GetSpawnAreaId();
            if (!(local_88.IsValid()))
            {
                XError(ELog(22), FString().Append("SpawnAreaConfig is not valid for DsCommissionInfo.SpawnAreaId=").Append(DsCommissionInfo.GetCommissionInstanceInfo().GetSpawnAreaId()));
            }
            else
            {
                local_14.SpawnAreaConfig = local_256;
            }
        }
        if (DsCommissionInfo.GetCommissionInstanceInfo().GetEntryRuleId() > 0)
        {
            int local_37_4 = DsCommissionInfo.GetCommissionInstanceInfo().GetEntryRuleId();
            if (!(local_64.IsValid()))
            {
                XError(ELog(22), FString().Append("EntryRuleConfig is not valid for DsCommissionInfo.EntryRuleId=").Append(DsCommissionInfo.GetCommissionInstanceInfo().GetEntryRuleId()));
            }
            else
            {
                TDataObjectPtr<FCommissionEntryRuleConfig> local_304;
                local_14.EntryRuleConfig = local_304;
            }
        }
        if (DsCommissionInfo.GetCommissionInstanceInfo().GetWeatherId() > 0)
        {
            int local_37_5 = DsCommissionInfo.GetCommissionInstanceInfo().GetWeatherId();
            if (!(local_88.IsValid()))
            {
                XError(ELog(22), FString().Append("WeatherConfig is not valid for DsCommissionInfo.WeatherId=").Append(DsCommissionInfo.GetCommissionInstanceInfo().GetWeatherId()));
            }
            else
            {
                TDataObjectPtr<FWeatherConfig> local_352;
                local_14.StartWeatherConfig = local_352;
            }
        }
        if (DsCommissionInfo.GetCommissionInstanceInfo().GetAreaTemplateList_Num() > 0)
        {
            TArray<FPbUint32Pair> local_380;
            DsCommissionInfo.GetCommissionInstanceInfo().GetAreaTemplateList(local_380);
            for (auto& local_394 : local_380)
            {
                int local_37_6 = local_394.GetFirst();
                if (!(local_64.IsValid()))
                {
                    XError(ELog(22), FString().Append("AreaTemplateConfig is not valid for AreaTemplate.First=").Append(local_394.GetFirst()));
                    continue;
                }
                local_37_6 = local_394.GetSecond();
                if (!(local_88.IsValid()))
                {
                    XError(ELog(22), FString().Append("WeatherTemplate is not valid for AreaTemplate.Second=").Append(local_394.GetSecond()));
                    continue;
                }
                local_14.WeatherTemplateMap.Add(local_256, TDataObjectPtr<FWeatherGenerateTemplate>());
            }
        }
    }
    return;
}
void ServerInitCommissionByDSGlobalInfoForPIEOnly(const TDataObjectPtr<FCommissionConfig> &inout CommissionConfig)
{
    FCS_CommissionDSGlobalInfo local_10;
    TArrayConstIterator<FRandomFactorConfig> local_184;
    int local_414 = 0;
    if (!(CommissionConfig.IsSet()))
    {
        return;
    }
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    TDataObjectPtr<FRandomSeedConfig> local_34 = GetRandomSeedConfig();
    if (!(local_34.IsSet()))
    {
        return;
    }
    if (!(FPIECommissionRandomPolicy::GetRandomPolicyByRandomSeedConfig(local_34).IsSet()))
    {
        return;
    }
    TDataObjectPtr<FCommissionWeatherPoolConfig> local_130 = TDataObjectPtr<FCommissionWeatherPoolConfig>(nullptr);
    for (; local_184.CanProceed;)
    {
        switch (int(local_184.Proceed().RandomFactorType))
        {
        case 1:
        {
            CastTo local_200;
            TDataObjectPtr<FSpawnAreaPoolConfig> local_224 = local_200.opCall();
            if (!(local_224.IsSet()))
            {
                break;
            }
            TDataObjectPtr<FWorldAreaConfig> local_272 = FPIECommissionRandomPolicy::GetRandomSpwanAreaBySpawnAreaPoolConfig(local_224);
            if (!(local_272.IsSet()))
            {
                break;
            }
            local_10.SpawnAreaConfig = local_272;
            XLog(ELog(22), FString().Append("ServerInitCommissionByDSGlobalInfoForPIEOnly: SpawnAreaConfig=").Append(local_272.GetDataName().ToString()));
            break;
        }
        case 2:
        {
            CastTo local_312;
            local_130 = local_312.opCall();
            break;
        }
        case 5:
        {
            CastTo local_316;
            TDataObjectPtr<FCommissionTimePoolConfig> local_340 = local_316.opCall();
            if (!(local_340.IsSet()))
            {
                break;
            }
            TDataObjectPtr<FCommissionTimeConfig> local_388 = FPIECommissionRandomPolicy::GetRandomCommissionTimeByCommissionTimePoolConfig(local_340);
            if (!(local_388.IsSet()))
            {
                break;
            }
            int local_194 = (0 + (FMath::RandRange(0, local_414))) % 24;
            local_10.StartTimeInHoursOverride = local_194;
            local_10.TimeSpeedOverride = local_414;
            local_10.SelectedCommissionTimeConfig = local_388;
            XLog(ELog(22), FString().Append("ServerInitCommissionByDSGlobalInfoForPIEOnly: CommissionTimeConfig=").Append(local_388.GetDataName().ToString()).Append(" StartTimeInHoursOverride=").Append(local_10.StartTimeInHoursOverride).Append(" TimeSpeedOverride=").Append(local_10.SelectedCommissionTimeConfig));
            break;
        }
        case 4:
        {
            CastTo local_420;
            TDataObjectPtr<FCommissionSubTargetPoolConfig> local_444 = local_420.opCall();
            if (!(local_444.IsSet()))
            {
                break;
            }
            TDataObjectPtr<FObjectiveConfig> local_492 = FPIECommissionRandomPolicy::GetRandomSubTargetBySubTargetPoolConfig(local_444);
            if (!(local_492.IsSet()))
            {
                break;
            }
            local_10.SubTargetConfig = local_492;
            XLog(ELog(22), FString().Append("ServerInitCommissionByDSGlobalInfoForPIEOnly: SubTargetConfig=").Append(local_492.GetDataName().ToString()));
            break;
        }
        case 3:
        {
            CastTo local_520;
            TDataObjectPtr<FIntrusionPolicyPoolConfig> local_544 = local_520.opCall();
            if (!(local_544.IsSet()))
            {
                break;
            }
            TDataObjectPtr<FIntrusionPolicyConfig> local_592;
            local_592 = FPIECommissionRandomPolicy::GetRandomIntrusionPolicyByIntrusionPolicyPoolConfig(local_544);
            XLog(ELog(22), FString().Append("ServerInitCommissionByDSGlobalInfoForPIEOnly: IntrusionPolicyConfig=").Append(local_592.GetDataName().ToString()));
            local_10.IntrusionPolicyConfig = local_592;
            break;
        }
        case 6:
        {
                TArray<FCommissionEntryRuleRandomFactor> local_694;
                CastTo local_644;
            if (!(local_644.opCall().IsSet()))
            {
                break;
            }
            if (local_694.Num() > 0)
            {
                int local_195 = FMath::RandRange(0, local_694.Num() - 1);
                TDataObjectPtr<FCommissionEntryRuleConfig> local_720 = local_694[local_195].Config;
                if (local_720.IsSet())
                {
                    local_10.EntryRuleConfig = local_720;
                    XLog(ELog(22), FString().Append("ServerInitCommissionByDSGlobalInfoForPIEOnly: EntryRuleConfig=").Append(local_720.GetDataName().ToString()));
                }
            }
            break;
        }
        }
    }
    if (local_130.IsSet())
    {
        TDataObjectPtr<FWeatherConfig> local_768;
        bool local_1 = FPIECommissionRandomPolicy::TryRandomWeatherAndTemplateByWeatherPoolConfig(local_130, local_10.SpawnAreaConfig, local_768, local_10.WeatherTemplateMap);
        if (!(local_1))
        {
            XError(ELog(22), FString().Append("ServerInitCommissionByDSGlobalInfoForPIEOnly: TryRandomWeatherAndTemplateByWeatherPoolConfig failed, WeatherPoolConfig=").Append(local_130.GetDataName().ToString()).Append(" SpawnAreaConfig=").Append(local_10.SpawnAreaConfig.GetDataName().ToString()));
            return;
        }
        local_10.StartWeatherConfig = local_768;
    }
    return;
}
void HandlePendingSubTargetOnCommissionFinish(const FCS_CommissionFinish &inout CommissionFinish, FCS_CommissionSubTarget &inout CommissionSubTarget)
{
    ECommissionSubTargetStatus local_4 = ECommissionSubTargetStatus(0);
    int local_7 = 0;
    Modify local_218;
    CommissionUtils::SetObjectiveGuideEnabledToAllPlayers(CommissionSubTarget.GetObjectiveInstanceId(), false, EGuideStyleType(3));
    if ((int(CommissionSubTarget.GetStatus())) != 0)
    {
        return;
    }
    if ((local_7) == 0)
    {
        FObjectiveInstance local_208;
        bool local_61;
        CastTo local_12;
        local_12.opCall().IsSet();
        local_61 = false;
        if (!(ObjectiveUtils::TryFindActivetedObjectiveInstance(CommissionSubTarget.GetObjectiveInstanceId(), local_208)))
        {
            local_61 = true;
        }
        if (!(local_61) && local_208.FinishConditionInfo.IsSet() && !(local_208.FinishConditionInfo.IsReached()))
        {
            local_61 = true;
        }
        if (!(local_61) && local_208.FailConditionInfo.IsSet() && local_208.FailConditionInfo.IsReached())
        {
            local_61 = true;
        }
        if (local_61)
        {
            local_4 = ECommissionSubTargetStatus(2);
        }
        else
        {
            local_4 = ECommissionSubTargetStatus(1);
        }
        FECSWorldPtr local_214 = ECS::GetECSWorld();
        local_218.opCall().SetSubTargetStatus();
        return;
    }
    FECSWorldPtr local_214_2 = ECS::GetECSWorld();
    local_218.opCall().SetSubTargetStatus(ECommissionSubTargetStatus(2));
    return;
}
EGuideStyleType GetCommissionGuideStyleType()
{
    int local_12 = 0;
    int local_1 = 3;
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    Get local_8;
    const FCS_CommissionInfo& local_10 = local_8.opCall();
    if (local_10)
    {
        if (local_10.CommissionConfig.IsSet())
        {
            if (local_12 == 1)
            {
                local_1 = 4;
            }
            else
            {
                if (local_12 == 2)
                {
                    local_1 = 5;
                }
                else
                {
                    if (local_12 == 3)
                    {
                        local_1 = 1;
                    }
                    else
                    {
                        if (local_12 == 4)
                        {
                            local_1 = 7;
                        }
                        else
                        {
                            if (local_12 == 5)
                            {
                                local_1 = 8;
                            }
                        }
                    }
                }
            }
        }
    }
    return EGuideStyleType(local_1);
}
TArray<FCommissionRating> GetCommissionRatingRule(const ECommissionType CommissionType)
{
    UCommissionSettings local_6;
    if (int(CommissionType) == 1)
    {
        local_6 = CommissionUtils::GetCommissionSettings();
        return local_6.Rating_Normal;
    }
    if (int(CommissionType) == 2)
    {
        local_6 = CommissionUtils::GetCommissionSettings();
        return local_6.Rating_Hard;
    }
    if (int(CommissionType) == 4)
    {
        local_6 = CommissionUtils::GetCommissionSettings();
        return local_6.Rating_Extreme;
    }
    if (int(CommissionType) == 3)
    {
        return TArray<FCommissionRating>();
    }
    return TArray<FCommissionRating>();
}
FText GetCommissionScore2TierTextAndIndex(const ECommissionType CommissionType, const int Score, int &inout BestRatingImageIndex)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    FText __r; return __r;
}
ECommissionFinishScoreTier GetCommissionScore2TierLevel(const ECommissionType CommissionType, const int Score)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    ECommissionFinishScoreTier __r; return __r;
}
void ResetRaceCommissionTimer(const FFPTime &inout StartTime = FFPTime(-1))
{
    FCS_CommissionInfo local_8;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if ((!(local_8) || !(local_8.CommissionConfig)))
    {
        XError(ELog(22), FString().Append("ResetRaceCommissionTimer: Not in commission"));
        return;
    }
    if (int(local_8.CommissionConfig.opArrow().CommissionType) != 5)
    {
        XError(ELog(22), FString().Append("ResetRaceCommissionTimer: Not in race commission"));
        return;
    }
    if (StartTime.opCmp(0.0) < 0)
    {
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        GetDefaulted local_24;
        local_8.RaceCommissionStartTime = local_24.opCall().Time;
    }
    else
    {
        local_8.RaceCommissionStartTime = StartTime;
    }
    local_8.bRaceCommissionStarted = true;
    return;
}
bool IsRaceCommissionTimerStarted()
{
    FCS_CommissionInfo local_8;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if ((!(local_8) || !(local_8.CommissionConfig)))
    {
        return false;
    }
    if (int(local_8.CommissionConfig.opArrow().CommissionType) != 5)
    {
        return false;
    }
    return local_8.bRaceCommissionStarted;
}
FFPTime GetRaceCommissionTime(const FFPTime &inout CurrentTime = FFPTime(-1))
{
    FCS_CommissionInfo local_8;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if ((!(local_8) || !(local_8.bRaceCommissionStarted)))
    {
        return FFPTime();
    }
    FFPTime local_14;
    FECSWorldPtr local_2_2 = ECS::GetECSWorld();
    Get local_18;
    const FCS_CommissionFinish& local_20 = local_18.opCall();
    if (local_20)
    {
        local_14 = local_20.GetFinishTime();
    }
    else
    {
        if (CurrentTime.opCmp(0.0) < 0)
        {
            FECSWorldPtr local_26 = ECS::GetECSWorld();
            GetDefaulted local_30;
            local_14 = local_30.opCall().Time;
        }
        else
        {
            local_14 = CurrentTime;
        }
    }
    return (local_14 - local_8.RaceCommissionStartTime);
}
FText GetRaceCommissionTimeText(const int TimeSec)
{
    int local_3 = FMath::IntegerDivisionTrunc(TimeSec, 60);
    FText::AsNumber(TimeSec % 60, FNumberFormattingOptions().SetMinimumIntegralDigits(2));
    FNumberFormattingOptions local_10 = FNumberFormattingOptions();
    FText local_18;
    FText::AsNumber(local_3, local_18);
    return FText::Format(INVTEXT("{0}'{1}\""), local_18, local_10.SetMinimumIntegralDigits(2));
}
}
namespace CommissionTargetUtils_Internal
{
TArray<FECSEntity> FindCurrentCommissionTargetsInternal(const int MaxFindCount)
{
    TArray<FECSEntity> local_4;
    FECSWorldPtr local_6 = ECS::GetECSWorld();
    Get local_10;
    if (local_10.opCall())
    {
        FECSRuntimeView local_36 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_58;
        local_58.opCall();
        Exclude(local_36).opCall();
        Exclude(local_36).opCall();
        FECSRuntimeViewIterator local_100 = local_36.Iterator();
        for (; local_100.CanProceed;)
        {
            const FECSEntity& local_136 = local_100.Proceed();
            if (CommissionUtils::IsCommissionTarget(local_136))
            {
                local_4.Add(local_136);
                if (MaxFindCount > 0 && (local_4.Num() >= MaxFindCount))
                {
                    break;
                }
            }
        }
    }
    return local_4;
}
TArray<FECSEntity> FindCurrentCommissionObjectiveTargetsInternal(const int MaxFindCount)
{
    TArray<FECSEntity> local_4;
    FECSWorldPtr local_6 = ECS::GetECSWorld();
    Get local_10;
    if (local_10.opCall())
    {
        FECSRuntimeView local_36 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_58;
        local_58.opCall();
        Exclude(local_36).opCall();
        Exclude(local_36).opCall();
        FECSRuntimeViewIterator local_100 = local_36.Iterator();
        for (; local_100.CanProceed;)
        {
            const FECSEntity& local_136 = local_100.Proceed();
            if (CommissionUtils::IsCommissionObjectiveTarget(local_136))
            {
                local_4.Add(local_136);
                if (MaxFindCount > 0 && (local_4.Num() >= MaxFindCount))
                {
                    break;
                }
            }
        }
    }
    return local_4;
}
}

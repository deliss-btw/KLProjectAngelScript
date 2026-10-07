
enum EMissionTabType
{
    Commission,
    InProgress,
    MainStory,
    SubStory,
}

namespace MissionUtils
{
TDataObjectPtr<FMissionConfig> FindMissionConfig(const uint MissionId)
{
    GetDataObjectByGSDataId<FMissionConfig> local_24;
    return local_24.opImplConv();
}
TDataObjectPtr<FMissionPhaseConfig> FindMissionFirstPhaseConfig(const uint MissionId)
{
    if (MissionUtils::FindMissionConfig(MissionId))
    {
        TDataObjectPtr<FMissionPhaseConfig> local_74 = GetFirstPhase();
        return local_74;
    }
    return TDataObjectPtr<FMissionPhaseConfig>();
}
TDataObjectPtr<FMissionPhaseConfig> FindMissionPhaseConfig(const uint MissionPhaseId)
{
    GetDataObjectByGSDataId<FMissionPhaseConfig> local_24;
    return local_24.opImplConv();
}
EMissionTabType MissionTypeToTabType(const EMissionType MissionType)
{
    int local_1 = int(MissionType);
    if (local_1 <= 1)
    {
        if (local_1 != 0)
        {
            if (local_1 != 1)
            {
            }
        }
        else
        {
            return EMissionTabType(2);
        }
    }
    XError(ELog(63), FString().Append("Invalid mission type: ").Append(MissionType));
    return EMissionTabType(2);
}
TArray<FMissionDetail> GetAllMissionDetails(const FECSEntity &inout PlayerEntity)
{
    TArray<FMissionDetail> local_4;
    Get local_8;
    const FC_PlayerMissionInfo& local_10 = local_8.opCall();
    if (local_10)
    {
        for (auto& local_30 : local_10.GetActiveMissionStatus())
        {
            local_30;
            local_4.Add();
        }
    }
    return local_4;
}
bool TryFindMissionDetail(const FECSEntity &inout PlayerEntity, const uint MissionId, FMissionDetail &out MissionDetail, const bool bIncludeFinished = false)
{
    FMissionDetail local_112;
    int local_126 = 0;
    MissionDetail = local_112;
    Has local_118;
    if (!(PlayerEntity.IsValid()) || !(local_118.opCall()))
    {
        return false;
    }
    if (local_126.GetActiveMissionStatus().Find(MissionId, MissionDetail))
    {
        return true;
    }
    if (!(!(bIncludeFinished)) && local_126.GetFinishedMissionStatus().Find(MissionId, MissionDetail))
    {
        return true;
    }
    return false;
}
bool TryFindActiveMissionPhaseForObjective(const FECSEntity &inout PlayerEntity, const uint ObjectiveInstanceId, uint &out MissionId, uint &out MissionPhaseId)
{
    int local_8;
    MissionId = 0;
    MissionPhaseId = 0;
    for (auto& local_28 : local_8.GetActiveMissionStatus())
    {
        if (!(GetActiveObjectiveStatusMap().Contains(ObjectiveInstanceId)))
        {
            continue;
        }
        MissionPhaseId = GetActivePhaseId();
        MissionId = local_28.GetKey();
        return true;
    }
    return false;
}
EMissionStatus GetMissionPhaseStatus(const FMissionDetail &inout MissionDetail, const uint MissionPhaseId)
{
    if (MissionDetail.GetMissionPhaseStatusMap().Contains(MissionPhaseId))
    {
        return MissionDetail.GetMissionPhaseStatusMap()[MissionPhaseId];
    }
    return EMissionStatus(0);
}
EMissionStatus GetMissionPhaseStatus(const FECSEntity &inout PlayerEntity, const uint MissionId, const uint MissionPhaseId)
{
    FMissionDetail local_112;
    if (MissionUtils::TryFindMissionDetail(PlayerEntity, MissionId, local_112, false))
    {
        return MissionUtils::GetMissionPhaseStatus(local_112, MissionPhaseId);
    }
    return EMissionStatus(0);
}
bool CanApplyMissionPhaseStatus(const FECSEntity &inout PlayerEntity, const uint MissionId, const uint MissionPhaseId, const EMissionStatus NewStatus)
{
    EMissionStatus local_2 = MissionUtils::GetMissionPhaseStatus(PlayerEntity, MissionId, MissionPhaseId);
    switch (int(NewStatus))
    {
    case 1:
    {
        return (int(local_2) == 0);
    }
    case 2:
    case 3:
    case 4:
    {
        return (int(local_2) == 1);
    }
    }
    return false;
}
TDataObjectPtr<FMissionConfig> GetCurrentTrackingMission(const FECSEntity &inout PlayerEntity, const EMissionType MissionType)
{
    Has local_4;
    int local_60 = 0;
    if (!(local_4.opCall()))
    {
        return TDataObjectPtr<FMissionConfig>();
    }
    if (local_60.GetTrackingMissionMap().Contains(MissionType))
    {
        return local_60.GetTrackingMissionMap()[MissionType];
    }
    return TDataObjectPtr<FMissionConfig>();
}
bool IsMissionTracking(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FMissionConfig> &inout MissionConfig)
{
    Has local_4;
    int local_12 = 0;
    if (!(local_4.opCall()) || !(MissionConfig.IsSet()))
    {
        return false;
    }
    if (local_12.GetTrackingMissionMap().Contains(unresolved.MissionType))
    {
        return (0 == 0);
    }
    return false;
}
bool TryFindMissionTrackingTargetEntity(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FMissionConfig> &inout MissionConfig, FECSEntity &out TargetEntity)
{
    FECSEntity local_4;
    int local_119 = 0;
    TargetEntity = local_4;
    if (!(MissionConfig.IsSet()) || !(MissionUtils::IsMissionTracking(PlayerEntity, MissionConfig)))
    {
        return false;
    }
    FMissionDetail local_118;
    if (!(MissionUtils::TryFindMissionDetail(PlayerEntity, local_119, local_118, false)))
    {
        return false;
    }
    for (auto& local_138 : local_118.GetActiveObjectiveStatusMap())
    {
        if ((int(GetObjectiveStatus())) != 1)
        {
            continue;
        }
        int local_144 = ObjectiveUtils::ObjectiveInstanceIdToGuideUniqueId(local_138.GetKey(), 0);
        if (GuideUtils::TryFindGuideTargetEntity(PlayerEntity, local_144, TargetEntity))
        {
            return true;
        }
    }
    return false;
}
bool TryFindMissionFirstGuidingInfo(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FMissionConfig> &inout MissionConfig, FGuideContext &out GuideContext)
{
    FGuideContext local_140;
    int local_255 = 0;
    int local_278;
    GuideContext = local_140;
    if (!(MissionConfig.IsSet()))
    {
        return false;
    }
    FMissionDetail local_254;
    if (!(MissionUtils::TryFindMissionDetail(PlayerEntity, local_255, local_254, false)))
    {
        return false;
    }
    for (auto& local_274 : local_254.GetActiveObjectiveStatusMap())
    {
        local_274;
        if ((int(GetObjectiveStatus())) != 1)
        {
            continue;
        }
        local_278 = GetObjectiveId();
        TDataObjectPtr<FObjectiveConfig> local_302 = ObjectiveUtils::FindObjectiveConfig(local_278);
        if (!(local_302))
        {
            continue;
        }
        TArray<uint> local_330 = ObjectiveUtils::GetObjectiveStartedGuideUniqueIds(PlayerEntity, GetInstanceId(), local_302);
        if (local_330.IsEmpty())
        {
            continue;
        }
        if (GuideUtils::TryFindGuideContext(PlayerEntity, local_330[0], GuideContext))
        {
            return true;
        }
    }
    return false;
}
bool TryFindMissionNearestGuidingInfo(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FMissionConfig> &inout MissionConfig, FGuideContext &out GuideContext)
{
    FGuideContext local_140;
    int local_255 = 0;
    int local_424;
    GuideContext = local_140;
    if (!(MissionConfig.IsSet()))
    {
        return false;
    }
    FMissionDetail local_254;
    if (!(MissionUtils::TryFindMissionDetail(PlayerEntity, local_255, local_254, false)))
    {
        return false;
    }
    bool local_257 = false;
    float local_260 = 0.0;
    FGuideContext local_402;
    for (auto& local_420 : local_254.GetActiveObjectiveStatusMap())
    {
        local_420;
        if ((int(GetObjectiveStatus())) != 1)
        {
            continue;
        }
        local_424 = GetObjectiveId();
        TDataObjectPtr<FObjectiveConfig> local_448 = ObjectiveUtils::FindObjectiveConfig(local_424);
        if (!(local_448))
        {
            continue;
        }
        TArray<uint> local_476 = ObjectiveUtils::GetObjectiveStartedGuideUniqueIds(PlayerEntity, GetInstanceId(), local_448);
        for (auto local_493 : local_476)
        {
            FGuideContext local_634;
            if (!(GuideUtils::TryFindGuideContext(PlayerEntity, local_493, local_634)))
            {
                continue;
            }
            float local_636 = 0.0;
            if (!(GuideUtils::TryCalculateGuideDistance(local_634.GetGuideData(), PlayerEntity, local_636)))
            {
                continue;
            }
            if ((!(local_257) || (local_636 < local_260)))
            {
                local_257 = true;
                local_260 = local_636;
                local_402 = local_634;
            }
        }
    }
    if (!(local_257))
    {
        return false;
    }
    GuideContext = local_402;
    return true;
}
void RefreshMissionGuidingPathOnObjectiveChanged(const FECSEntity &inout PlayerEntity, const FMissionDetail &inout MissionDetail)
{
    TDataObjectPtr<FMissionConfig> local_24 = MissionDetail.GetMissionConfig();
    if (!(MissionUtils::ShouldAutoShowMissionGuidingPath(PlayerEntity, local_24)))
    {
        return;
    }
    FGuideContext local_190;
    if (!(MissionUtils::TryFindMissionNearestGuidingInfo(PlayerEntity, local_24, local_190)) && !(MissionUtils::TryFindMissionFirstGuidingInfo(PlayerEntity, local_24, local_190)))
    {
        return;
    }
    FECSEntity local_200 = local_190.GetPrimaryTargetEntity();
    if (local_200.IsValid())
    {
        Get local_204;
        const FC_GuidingPathUpdateInfo& local_206 = local_204.opCall();
        if (local_206)
        {
            if ((local_206.TargetEntity == local_200))
            {
                return;
            }
        }
        FGuidingPathUtils::ServerSetGuidingPathTargetEntity(local_200, PlayerEntity, false);
    }
    else
    {
        Get local_204;
        if (local_190.GetGuideTargets().Num() > 0)
        {
            FVector local_220 = local_190.GetPrimaryTargetPosition();
            const FC_GuidingPathUpdateInfo& local_206_2 = local_204.opCall();
            if (local_206_2)
            {
                if (!(local_206_2.TargetEntity.IsValid()) && local_206_2.TargetLocation.Equals(local_220, 1.0))
                {
                    return;
                }
            }
            FGuidingPathUtils::ServerSetGuidingPathTargetLocation(local_220, PlayerEntity, false);
        }
    }
    return;
}
bool CanStartGuideForMissionInLevel(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FMissionConfig> &inout MissionConfig, const TDataObjectPtr<FLevelInfoConfig> &inout LevelInfo = TDataObjectPtr<FLevelInfoConfig>())
{
    int local_115 = 0;
    if (!(MissionConfig.IsSet()))
    {
        return false;
    }
    FMissionDetail local_114;
    if (!(MissionUtils::TryFindMissionDetail(PlayerEntity, local_115, local_114, false)))
    {
        return false;
    }
    for (auto& local_134 : local_114.GetActiveObjectiveStatusMap())
    {
        local_134;
        if ((int(GetObjectiveStatus())) != 1)
        {
            continue;
        }
        TDataObjectPtr<FObjectiveConfig> local_162 = ObjectiveUtils::FindObjectiveConfig(GetObjectiveId());
        if (!(local_162))
        {
            continue;
        }
        if (ObjectiveUtils::CanStartObjectiveGuideInLevel(local_162, LevelInfo))
        {
            return true;
        }
    }
    return false;
}
void DeactivateDialogueForMission(const FECSEntity &inout PlayerEntity, const FName &inout DialogueId, FMissionDetail &inout MissionDetail)
{
    DialogueUtils::DeactivatePlayerDialogue(MissionDetail.GetActiveDialogueMap()[DialogueId], PlayerEntity);
    return;
}
uint ActivateObjectiveForMission(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FObjectiveConfig> &inout ObjectiveConfig, FMissionDetail &inout MissionDetail)
{
    int local_1 = 0;
    int local_191 = 0;
    FObjectiveInstance local_338;
    int local_2 = ObjectiveUtils::ActivateObjective(ObjectiveConfig, FObjectiveContext(PlayerEntity, EConditionUsage(1), MissionDetail.GetActivePhaseId()));
    MissionDetail.GetModify_ActiveObjectiveStatusMap().Add(local_2, FMissionObjectiveInfo(local_2, local_1, EObjectiveStatus(1)));
    FObjectiveInstance local_170;
    if (ObjectiveUtils::TryFindActivetedObjectiveInstance(local_2, local_170) && !(local_170.ChildObjectiveMap.IsEmpty()))
    {
        for (auto& local_190 : local_170.ChildObjectiveMap)
        {
            local_190;
            if (local_1 == 0)
            {
                continue;
            }
            if (ObjectiveUtils::TryFindActivetedObjectiveInstance(local_191, local_338))
            {
                MissionDetail.GetModify_ActiveObjectiveStatusMap().Add(FMissionObjectiveInfo(local_191, int(local_338.ObjectiveId), local_338.Status));
            }
            else
            {
                XError(ELog(63), FString().Append("Failed to find activated objective instance for child objective: ").Append());
            }
        }
    }
    if (MissionUtils::IsMissionTracking(PlayerEntity, MissionDetail.GetMissionConfig()))
    {
        MissionUtils::StartMissionGuide(PlayerEntity, MissionDetail, false);
    }
    return local_2;
}
void RegisterNewSequenceChildForMission(const FECSEntity &inout PlayerEntity, const uint GroupInstanceId, const uint NewChildInstanceId, FMissionDetail &inout MissionDetail)
{
    if (!(MissionDetail.GetActiveObjectiveStatusMap().Contains(GroupInstanceId)))
    {
        return;
    }
    FObjectiveInstance local_148;
    if (!(ObjectiveUtils::TryFindActivetedObjectiveInstance(NewChildInstanceId, local_148)))
    {
        XError(ELog(63), FString().Append("RegisterNewSequenceChildForMission: child instance not found: ").Append(NewChildInstanceId));
        return;
    }
    MissionDetail.GetModify_ActiveObjectiveStatusMap().Add(NewChildInstanceId, FMissionObjectiveInfo(NewChildInstanceId, int(local_148.ObjectiveId), local_148.Status));
    if (MissionUtils::IsMissionTracking(PlayerEntity, MissionDetail.GetMissionConfig()))
    {
        FGuideDataSourceConfig local_238;
        local_238.SetFromMission(MissionDetail.GetMissionConfig());
        ObjectiveUtils::StartObjectiveGuide(NewChildInstanceId, PlayerEntity, MissionUtils::GetGuidePresentationConfig(MissionDetail.GetMissionConfig(), MissionDetail.GetActivePhaseConfig()), local_238, false, MissionUtils::ShouldAutoShowMissionGuidingPath(PlayerEntity, MissionDetail.GetMissionConfig()));
    }
    return;
}
void DeactivateObjectiveForMission(const uint ObjectiveInstanceId, FMissionDetail &inout MissionDetail)
{
    TArray<uint> local_8 = ObjectiveUtils::DeactivateObjectives(ObjectiveInstanceId);
    for (auto local_22 : local_8)
    {
        if (MissionDetail.GetActiveObjectiveStatusMap().Contains(local_22))
        {
            continue;
        }
        XWarning(ELog(63), FString().Append("Failed to find activated objective instance for child objective: ").Append(local_22));
    }
    return;
}
void ClearActivePhase(const FECSEntity &inout PlayerEntity, FMissionDetail &inout MissionDetail)
{
    TDataObjectPtr<FMissionPhaseConfig> local_24;
    MissionDetail.SetActivePhaseConfig(local_24);
    if (MissionDetail.GetActiveObjectiveStatusMap().Num() > 0)
    {
        TArray<uint> local_32;
        MissionDetail.GetActiveObjectiveStatusMap().GetKeys(local_32);
        for (auto local_45 : local_32)
        {
            MissionUtils::DeactivateObjectiveForMission(local_45, MissionDetail);
        }
    }
    if (MissionDetail.GetActiveDialogueMap().Num() > 0)
    {
        TArray<FName> local_50;
        MissionDetail.GetActiveDialogueMap().GetKeys(local_50);
        for (auto& local_64 : local_50)
        {
            MissionUtils::DeactivateDialogueForMission(PlayerEntity, local_64, MissionDetail);
        }
    }
    return;
}
void ActivatePhase(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FMissionPhaseConfig> &inout PhaseCfg, FMissionDetail &inout MissionDetail)
{
    if (!(PhaseCfg.IsSet()))
    {
        XError(ELog(63), FString().Append("Failed to activate phase for mission: phase is not set"));
        return;
    }
    MissionDetail.SetActivePhaseConfig(PhaseCfg);
    MissionDetail.GetModify_ActiveObjectiveStatusMap().Empty(0);
    if (GetDialogues().Num() > 0)
    {
        for (auto& local_24 : GetDialogues())
        {
            if (local_24.IsSet())
            {
                XLog(ELog(63), FString().Append("Activate Dialogue for Mission Phase ").Append(PhaseCfg.GetDataName()).Append(": ").Append(local_24.GetDataName()));
                DialogueUtils::ActivatePlayerDialogue(local_24, PlayerEntity);
                MissionDetail.GetModify_ActiveDialogueMap().Add(local_24.GetDataName(), local_24);
                continue;
            }
            XError(ELog(63), FString().Append("Failed to activate dialogue for mission phase ").Append(PhaseCfg.GetDataName()).Append(": dialogue is not set"));
        }
    }
    if (GetObjective().IsSet())
    {
        TDataObjectPtr<FObjectiveConfig> local_52 = GetObjective();
        MissionUtils::ActivateObjectiveForMission(PlayerEntity, local_52, MissionDetail);
    }
    return;
}
void InitMissionTrackingAndGuiding(const FECSEntity &inout PlayerEntity, const FMissionDetail &inout MissionDetail)
{
    bool local_59 = false;
    EMissionType local_2;
    EMissionType local_1 = local_2;
    if (MissionUtils::GetMissionPresentationRuleConfig(MissionDetail.GetMissionConfig()).IsSet())
    {
        bool local_51 = (0 == 1);
        bool local_52 = MissionDetail.GetActivePhaseConfig().IsSet() && (0 == 0);
        if (local_59)
        {
            if ((local_51 && local_52))
            {
                if (local_59)
                {
                    MissionUtils::StartMissionGuide(PlayerEntity, MissionDetail, false);
                }
            }
            else
            {
                local_59 = !(MissionUtils::GetCurrentTrackingMission(PlayerEntity, EMissionType(local_1)).IsSet());
                if (local_59)
                {
                    MissionUtils::StartMissionTrackingWithGuide(PlayerEntity, MissionDetail.GetMissionConfig(), false);
                }
            }
            return;
        }
        local_59 = (local_51 && local_59) && local_52;
        if (local_59)
        {
            MissionUtils::StartMissionGuide(PlayerEntity, MissionDetail, false);
        }
    }
    return;
}
void ResetPlayerMissionInfo(const FECSEntity &inout PlayerEntity, const TMap<uint, FMissionDetail> &inout MissionInfoMap, const TArray<uint> &inout PriorityTrackingMissionIds = TArray<uint32>(), const bool bPlayerClearedAllTracking = false)
{
    int local_6 = 0;
    for (auto& local_26 : local_6.GetActiveMissionStatus())
    {
        FMissionDetail& local_28 = local_6.GetModify_ActiveMissionStatus().FindOrAdd(local_26.GetKey());
        MissionUtils::ClearActivePhase(PlayerEntity, local_28);
    }
    local_6.GetModify_ActiveMissionStatus().Empty(0);
    for (auto& local_26 : MissionInfoMap)
    {
        bool local_23 = !(local_6.GetActiveMissionStatus().Contains(local_26.GetKey()));
        FMissionDetail& local_28_2 = local_6.GetModify_ActiveMissionStatus().FindOrAdd(local_26.GetKey());
        if (local_28_2.GetActivePhaseConfig().IsSet())
        {
            MissionUtils::ActivatePhase(PlayerEntity, local_28_2.GetActivePhaseConfig(), local_28_2);
        }
    }
    for (auto local_43 : PriorityTrackingMissionIds)
    {
        TDataObjectPtr<FMissionConfig> local_68 = MissionUtils::FindMissionConfig(local_43);
        if (!(local_68.IsSet()))
        {
            continue;
        }
        FMissionDetail local_204;
        if (!(MissionUtils::TryFindMissionDetail(PlayerEntity, local_43, local_204, false)))
        {
            continue;
        }
        FString local_210 = FString();
        MissionUtils::StartMissionTrackingWithGuide(PlayerEntity, local_68, false);
    }
    if (!(bPlayerClearedAllTracking))
    {
        for (auto& local_26_2 : local_6.GetActiveMissionStatus())
        {
            MissionUtils::InitMissionTrackingAndGuiding(PlayerEntity);
        }
    }
    return;
}
void InitializeMissionInfo(const FECSEntity &inout PlayerEntity, const FPbDsPlayerInfo &inout PlayerInfo)
{
    if (PlayerInfo.IsValid())
    {
        FPbDsPlayerMissionInfo local_12 = PlayerInfo.GetMissionInfo();
        TArray<uint> local_26;
        PlayerInfo.GetMissionTrackInfo().GetMissionTrackInfo(local_26);
        bool local_1 = local_26.Contains(0);
        TArray<uint> local_42;
        for (auto local_55 : local_26)
        {
            if (local_55 != 0)
            {
                local_42.Add(local_55);
            }
        }
        MissionUtils::ResetPlayerMissionInfo(PlayerEntity, MissionNetUtils::ConvertPlayerMissionInfo(local_12), local_42, local_1);
        TArray<FPbMissionStatusChange> local_80;
        local_12.GetMissionStatusChanges(local_80);
        if (local_80.Num() > 0)
        {
            MissionNetUtils::HandleMissionStatusChangeNotify(PlayerEntity, local_80);
        }
        return;
    }
    XLog(ELog(63), FString().Append("LoadPlayer can't get playerinfo, continue without mission."));
    return;
}
void SaveMissionTrackInfo(const FECSEntity &inout PlayerEntity, FPbDsPlayerInfo &inout PlayerInfo)
{
    if (!(PlayerInfo.IsValid()))
    {
        return;
    }
    FPbDsPlayerMissionTrackInfo local_12 = PlayerInfo.GetMissionTrackInfo();
    local_12.ClearMissionTrackInfo();
    TArray<uint> local_26;
    Has local_30;
    bool local_1 = local_30.opCall();
    if (local_1)
    {
        int local_36;
        for (auto& local_54 : local_36.GetTrackingMissionMap())
        {
            local_54;
            if (IsSet())
            {
            }
        }
    }
    if (local_26.Num() > 0)
    {
        for (auto local_69 : local_26)
        {
            local_12.AddMissionTrackInfo(local_69);
        }
    }
    else
    {
        Get local_78;
        Has local_74;
        if (local_74.opCall() && !(local_78.opCall().GetActiveMissionStatus().IsEmpty()))
        {
            local_12.AddMissionTrackInfo(0);
        }
    }
    return;
}
void StartMissionTracking(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FMissionConfig> &inout MissionConfig)
{
    bool local_1;
    int local_14 = 0;
    if (!(MissionConfig))
    {
        XError(ELog(63), FString().Append("StartMissionTracking Failed, MissionConfig is not set"));
        return;
    }
    EMissionType local_16;
    EMissionType local_15 = local_16;
    TDataObjectPtr<FMissionConfig> local_40;
    if (!(local_14.GetTrackingMissionMap().Find(local_15, local_40)))
    {
        local_1 = false;
    }
    else
    {
        local_1 = local_40;
    }
    local_1 = local_1 && (0 != 0);
    if (local_1)
    {
        MissionUtils::StopMissionGuide(PlayerEntity, local_40);
    }
    local_14.GetModify_TrackingMissionMap().Add(local_15, MissionConfig);
    return;
}
bool StopMissionTracking(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FMissionConfig> &inout MissionConfig)
{
    int local_14 = 0;
    if (!(MissionConfig))
    {
        XError(ELog(63), FString().Append("StopMissionTracking Failed, MissionConfig is not set"));
        return false;
    }
    if (!(MissionUtils::IsMissionTracking(PlayerEntity, MissionConfig)))
    {
        FString local_6 = FString();
        return false;
    }
    if (local_14.GetTrackingMissionMap().IsEmpty())
    {
        Remove local_18;
        local_18.opCall();
    }
    return true;
}
void StartMissionTrackingWithGuide(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FMissionConfig> &inout MissionConfig, const bool bOpenMapAndSelect = false)
{
    MissionUtils::StartMissionTracking(PlayerEntity, MissionConfig);
    MissionUtils::StartMissionGuide(PlayerEntity, MissionConfig, bOpenMapAndSelect);
    return;
}
bool StopMissionTrackingWithGuide(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FMissionConfig> &inout MissionConfig)
{
    if (!(MissionUtils::StopMissionTracking(PlayerEntity, MissionConfig)))
    {
        return false;
    }
    MissionUtils::StopMissionGuide(PlayerEntity, MissionConfig);
    return true;
}
UFUNCTION()
bool TryToggleMissionTracking(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FMissionConfig> &inout MissionConfig)
{
    if (!(MissionUtils::IsMissionTracking(PlayerEntity, MissionConfig)))
    {
        MissionUtils::StartMissionTrackingWithGuide(PlayerEntity, MissionConfig, false);
    }
    else
    {
        if (!(MissionUtils::StopMissionTrackingWithGuide(PlayerEntity, MissionConfig)))
        {
            return false;
        }
        return true;
    }
    return true;
}
TDataObjectPtr<FMissionPresentationRuleConfig> GetMissionPresentationRuleConfig(const TDataObjectPtr<FMissionConfig> &inout MissionConfig)
{
    const UMissionSettings local_76;
    TDataObjectPtr<FMissionPresentationRuleConfig> __return;
    if (!(MissionConfig.IsSet()))
    {
        return TDataObjectPtr<FMissionPresentationRuleConfig>();
    }
    TDataObjectPtr<FMissionPresentationRuleConfig> local_74 = GetPresentationRule();
    if (local_74.IsSet())
    {
        return local_74;
    }
    GetGameplaySettings<UMissionSettings> local_78;
    local_76 = local_78;
    if (local_76.DefaultMissionPresentationRuleConfig.Contains(unresolved.MissionType))
    {
    }
    else
    {
        __return = local_26;
    }
    return __return;
}
TDataObjectPtr<FGuidePresentationConfig> GetGuidePresentationConfig(const TDataObjectPtr<FMissionConfig> &inout MissionConfig, const TDataObjectPtr<FMissionPhaseConfig> &inout PhaseConfig = TDataObjectPtr<FMissionPhaseConfig>())
{
    if (PhaseConfig.IsSet() && GetOverrideGuidePresentation().IsSet())
    {
        return GetOverrideGuidePresentation();
    }
    if (MissionUtils::GetMissionPresentationRuleConfig(MissionConfig).IsSet() && GetGuidePresentation().IsSet())
    {
        return GetGuidePresentation();
    }
    return TDataObjectPtr<FGuidePresentationConfig>();
}
void UpdateMissionTracking(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FMissionConfig> &inout MissionConfig, const bool bOpenMapAndSelect = false)
{
    FMissionDetail local_112;
    bool local_119 = false;
    Get local_116;
    if (local_116.opCall())
    {
        local_119 = !local_119;
        if (local_119)
        {
            FString local_124 = FString();
            return;
        }
    }
    else
    {
        XError(ELog(63), FString().Append("UpdateMissionTracking Failed, PlayerEntity ").Append(PlayerEntity).Append(" does not have FC_PlayerMissionInfo"));
        return;
    }
    if (!(MissionUtils::IsMissionTracking(PlayerEntity, local_112.GetMissionConfig())))
    {
        for (auto& local_144 : local_112.GetActiveObjectiveStatusMap())
        {
            ObjectiveUtils::StopObjectiveGuide(local_144.GetKey(), PlayerEntity);
        }
    }
    else
    {
        TDataObjectPtr<FGuidePresentationConfig> local_170 = MissionUtils::GetGuidePresentationConfig(MissionConfig, local_112.GetActivePhaseConfig());
        for (auto& local_144_2 : local_112.GetActiveObjectiveStatusMap())
        {
            if ((int(GetObjectiveStatus())) == 1)
            {
                FGuideDataSourceConfig local_274;
                local_274.SetFromMission(MissionConfig);
                ObjectiveUtils::StartObjectiveGuide(local_144_2.GetKey(), PlayerEntity, local_170, local_274, bOpenMapAndSelect, MissionUtils::ShouldAutoShowMissionGuidingPath(PlayerEntity, MissionConfig));
                continue;
            }
            ObjectiveUtils::StopObjectiveGuide(local_144_2.GetKey(), PlayerEntity);
        }
    }
    return;
}
bool ShouldAutoShowMissionGuidingPath(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FMissionConfig> &inout MissionConfig)
{
    bool local_51 = false;
    if (!(MissionConfig.IsSet()))
    {
        return false;
    }
    bool local_1 = !(GetPresentationRule().IsSet());
    if (local_1)
    {
        local_1 = true;
    }
    else
    {
        local_51 = !local_51;
        local_1 = local_51;
    }
    if (local_1)
    {
        return false;
    }
    bool local_1_2 = CommissionUtils::GetCurrentCommissionConfig().IsSet();
    if (local_1_2)
    {
        return false;
    }
    return MissionUtils::IsMissionTracking(PlayerEntity, MissionConfig);
}
void StartMissionGuide(const FECSEntity &inout PlayerEntity, const FMissionDetail &inout MissionDetail, const bool bOpenMapAndSelect = false)
{
    TDataObjectPtr<FMissionConfig> local_24 = MissionDetail.GetMissionConfig();
    if (!(local_24.IsSet()))
    {
        XError(ELog(63), FString().Append("StartMissionGuide Failed, MissionConfig is not set"));
        return;
    }
    TDataObjectPtr<FGuidePresentationConfig> local_80 = MissionUtils::GetGuidePresentationConfig(local_24, MissionDetail.GetActivePhaseConfig());
    for (auto& local_122 : MissionDetail.GetActiveObjectiveStatusMap())
    {
        if ((int(GetObjectiveStatus())) == 1)
        {
            FGuideDataSourceConfig local_202;
            local_202.SetFromMission(local_24);
            ObjectiveUtils::StartObjectiveGuide(local_122.GetKey(), PlayerEntity, local_80, local_202, bOpenMapAndSelect, MissionUtils::ShouldAutoShowMissionGuidingPath(PlayerEntity, local_24));
        }
    }
    return;
}
void StartMissionGuide(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FMissionConfig> &inout MissionConfig, const bool bOpenMapAndSelect = false)
{
    FMissionDetail local_112;
    int local_114 = 0;
    if (!(MissionUtils::TryFindMissionDetail(PlayerEntity, local_114, local_112, false)))
    {
        XError(ELog(63), FString().Append("StartMissionGuide Failed, MissionDetail not found for MissionConfig: ").Append(MissionConfig.GetDataName()));
        return;
    }
    MissionUtils::StartMissionGuide(PlayerEntity, local_112, bOpenMapAndSelect);
    return;
}
void StopMissionGuide(const FECSEntity &inout PlayerEntity, const FMissionDetail &inout MissionDetail)
{
    for (auto& local_20 : MissionDetail.GetActiveObjectiveStatusMap())
    {
        ObjectiveUtils::StopObjectiveGuide(local_20.GetKey(), PlayerEntity);
    }
    return;
}
void StopMissionGuide(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FMissionConfig> &inout MissionConfig)
{
    FMissionDetail local_112;
    int local_114 = 0;
    if (!(MissionUtils::TryFindMissionDetail(PlayerEntity, local_114, local_112, false)))
    {
        XError(ELog(63), FString().Append("StopMissionGuide Failed, MissionDetail not found for MissionConfig: ").Append(MissionConfig.GetDataName()));
        return;
    }
    MissionUtils::StopMissionGuide(PlayerEntity, local_112);
    return;
}
TDataObjectPtr<FMissionConfig> FindFollowUpMissionToTrack(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FMissionConfig> &inout CompletedMissionConfig)
{
    int local_62 = 0;
    const FMissionDetail& local_158;
    Has local_6;
    if (!(CompletedMissionConfig) || !(local_6.opCall()))
    {
        return TDataObjectPtr<FMissionConfig>();
    }
    EMissionType local_64;
    EMissionType local_63 = local_64;
    const TArray<TDataObjectPtr<FMissionConfig>>& local_66 = GetFollowUpTrackingMissions();
    if (local_66.Num() > 0)
    {
        for (auto& local_82 : local_66)
        {
            if (!(local_82))
            {
                continue;
            }
            if (local_62.GetActiveMissionStatus().Contains(unresolved.DataId))
            {
                return local_82;
            }
        }
        return TDataObjectPtr<FMissionConfig>();
    }
    TDataObjectPtr<FMissionConfig> local_106;
    TDataObjectPtr<FMissionConfig> local_130;
    FName local_136 = GetBelongChapter() ? GetBelongChapter().GetDataName() : FName();
    for (auto& local_156 : local_62.GetActiveMissionStatus())
    {
        local_156;
        bool local_1 = !(local_158.GetMissionConfig()) || (int(local_158.GetMissionStatus()) != 1);
        if (local_1)
        {
            continue;
        }
        if (int(local_64) != int(local_63))
        {
            continue;
        }
        if (!(local_130))
        {
            local_130 = local_158.GetMissionConfig();
        }
        if (!(!(local_106) && !((local_136 == NAME_None))))
        {
            local_1 = false;
        }
        else
        {
            local_1 = GetBelongChapter();
        }
        if (local_1 && (GetBelongChapter().GetDataName() == local_136))
        {
            local_106 = local_158.GetMissionConfig();
        }
    }
    if (local_106)
    {
        return local_106;
    }
    return local_130;
}
UFUNCTION()
bool TryActivateObjectiveForMission(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FMissionConfig> &inout MissionConfig, const TDataObjectPtr<FObjectiveConfig> &inout ObjectiveConfig)
{
    Has local_4;
    int local_13 = 0;
    int local_20 = 0;
    if (!(local_4.opCall()))
    {
        XError(ELog(63), FString().Append("PlayerEntity ").Append(PlayerEntity).Append(" does not have FC_PlayerMissionInfo"));
        return false;
    }
    int local_12 = local_13;
    if (!(local_20.GetActiveMissionStatus().Contains(local_12)))
    {
        XError(ELog(63), FString().Append("Mission ").Append(local_12).Append(" is not active"));
        return false;
    }
    FMissionDetail& local_22 = local_20.GetModify_ActiveMissionStatus()[local_12];
    MissionUtils::ActivateObjectiveForMission(PlayerEntity, ObjectiveConfig, local_22);
    return true;
}
UFUNCTION()
bool TryDeactivateObjectiveForMission(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FMissionConfig> &inout MissionConfig, const TDataObjectPtr<FObjectiveConfig> &inout ObjectiveConfig)
{
    Has local_4;
    int local_13 = 0;
    int local_20 = 0;
    if (!(local_4.opCall()))
    {
        XError(ELog(63), FString().Append("PlayerEntity ").Append(PlayerEntity).Append(" does not have FC_PlayerMissionInfo"));
        return false;
    }
    int local_12 = local_13;
    if (!(local_20.GetActiveMissionStatus().Contains(local_12)))
    {
        XError(ELog(63), FString().Append("Mission ").Append(local_12).Append(" is not active"));
        return false;
    }
    FMissionDetail& local_22 = local_20.GetModify_ActiveMissionStatus()[local_12];
    for (auto& local_40 : local_22.GetActiveObjectiveStatusMap())
    {
        if (GetObjectiveId() == 0)
        {
            MissionUtils::DeactivateObjectiveForMission(local_40.GetKey(), local_22);
            return true;
        }
    }
    return false;
}
UFUNCTION()
bool TrySetObjectiveStatusForMission(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FMissionConfig> &inout MissionConfig, const TDataObjectPtr<FObjectiveConfig> &inout ObjectiveConfig, const EObjectiveStatus ObjectiveStatus)
{
    Has local_4;
    int local_13 = 0;
    int local_20 = 0;
    if (!(local_4.opCall()))
    {
        XError(ELog(63), FString().Append("PlayerEntity ").Append(PlayerEntity).Append(" does not have FC_PlayerMissionInfo"));
        return false;
    }
    int local_12 = local_13;
    if (!(local_20.GetActiveMissionStatus().Contains(local_12)))
    {
        XError(ELog(63), FString().Append("Mission ").Append(local_12).Append(" is not active"));
        return false;
    }
    FMissionDetail& local_22 = local_20.GetModify_ActiveMissionStatus()[local_12];
    for (auto& local_40 : local_22.GetActiveObjectiveStatusMap())
    {
        if (GetObjectiveId() == 0)
        {
            ObjectiveUtils::SetObjectiveStatusManually(local_40.GetKey());
            return true;
        }
    }
    return false;
}
UFUNCTION()
void NotifyClientOpenCGPlayer(const TDataObjectPtr<FCGConfig> &inout CGConfig, const FECSEntity &inout PlayerEntity = FECSEntity(), const FCGPlayFinishedDelegate &inout CGPlayFinishedCallback = FCGPlayFinishedDelegate())
{
    int local_14 = 0;
    if (!(CGConfig.IsSet()))
    {
        XError(ELog(63), "NotifyClientOpenCGPlayer failed: invalid CGConfig");
        return;
    }
    if (!(ECS::GetECSWorld().IsValid()))
    {
        XError(ELog(63), "NotifyClientOpenCGPlayer skipped: ECS world is invalid (likely during level EndPlay)");
        return;
    }
    if (PlayerEntity.IsValid())
    {
        FFPTime local_10 = FFPTime(-1);
        local_14.CGConfig = CGConfig;
        if (CGPlayFinishedCallback.IsBound())
        {
            ULevelEventManager::Get().RegisterCGPlayFinishedCallback(CGConfig, PlayerEntity, CGPlayFinishedCallback);
        }
        return;
    }
    for (auto& local_60 : FGameUtils::GetAllPlayerControllerEntities(true))
    {
        if (!(local_60.IsValid()))
        {
            continue;
        }
        FFPTime local_10_2 = FFPTime(-1);
        local_14.CGConfig = CGConfig;
        if (CGPlayFinishedCallback.IsBound())
        {
            ULevelEventManager::Get().RegisterCGPlayFinishedCallback(CGConfig, local_60, CGPlayFinishedCallback);
        }
    }
    return;
}
}

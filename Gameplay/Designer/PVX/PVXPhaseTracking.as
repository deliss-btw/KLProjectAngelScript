
namespace PVXPhaseTracking
{
void Init(const TDataObjectPtr<FCommissionConfig> &inout CommissionConfig)
{
    int local_20 = 0;
    XLog(ELog(22), FString().Append("[PVXPhase] Init: Config=").Append(CommissionConfig.GetDataName().ToString()));
    FECSWorldPtr local_14 = ECS::GetECSWorld();
    TDataObjectPtr<FObjectiveConfig> local_44 = local_20.GetPendingObjective();
    local_20.SetActiveObjectiveInstanceId(0);
    local_20.SetActiveObjective(TDataObjectPtr<FObjectiveConfig>(nullptr));
    local_20.SetbInitialized(true);
    FECSWorldPtr local_14_2 = ECS::GetECSWorld();
    FCS_CommissionInfo local_76;
    local_76.CommissionConfig = CommissionConfig;
    local_76.CommissionTargetObjectiveInstanceId = 0;
    local_76.CommissionTargetObjective = TDataObjectPtr<FObjectiveConfig>(nullptr);
    FCommissionTargetProgress local_126;
    local_76.Progress = local_126;
    local_76.ChildProgress.Empty(0);
    if (local_44.IsSet())
    {
        local_20.SetPendingObjective(local_44);
        XLog(ELog(22), FString().Append("[PVXPhase] Init: pending objective ").Append(local_44.GetDataName().ToString()).Append(" will activate next frame"));
    }
    return;
}
void ProcessPending()
{
    int local_8 = 0;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if (!(local_8) || !(local_8.GetbInitialized()))
    {
        return;
    }
    if (local_8.GetPendingObjective().IsSet())
    {
        TDataObjectPtr<FObjectiveConfig> local_34 = local_8.GetPendingObjective();
        XLog(ELog(22), FString().Append("[PVXPhase] ProcessPending: activating ").Append(local_34.GetDataName().ToString()));
        PVXPhaseTracking::DoActivatePhase(local_34);
    }
    return;
}
void ActivatePhase(const TDataObjectPtr<FObjectiveConfig> &inout ObjectiveConfig)
{
    int local_10 = 0;
    if (!(ObjectiveConfig.IsSet()))
    {
        XWarning(ELog(22), "[PVXPhase] ActivatePhase: ObjectiveConfig is null");
        return;
    }
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    if (!(local_10.GetbInitialized()))
    {
        local_10.SetPendingObjective(ObjectiveConfig);
        XLog(ELog(22), FString().Append("[PVXPhase] ActivatePhase deferred: ").Append(ObjectiveConfig.GetDataName().ToString()).Append(" (waiting for game start)"));
        return;
    }
    PVXPhaseTracking::DoActivatePhase(ObjectiveConfig);
    return;
}
void DoActivatePhase(const TDataObjectPtr<FObjectiveConfig> &inout ObjectiveConfig)
{
    int local_8 = 0;
    int local_11 = 0;
    int local_22 = 0;
    int local_51 = 0;
    FObjectiveInstance local_382;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if (!(local_8))
    {
        return;
    }
    if (local_8.GetActiveObjectiveInstanceId() > 0)
    {
        local_11 = local_8.GetActiveObjectiveInstanceId();
        ObjectiveUtils::DeactivateObjectives(local_11);
    }
    FECSWorldPtr local_2_2 = ECS::GetECSWorld();
    if (!(local_22))
    {
        return;
    }
    FCommissionTargetProgress local_24;
    local_22.Progress = local_24;
    local_22.ChildProgress.Empty(0);
    local_22.CommissionTargetObjective = ObjectiveConfig;
    FObjectiveContext local_58;
    int local_10 = ObjectiveUtils::ActivateObjective(ObjectiveConfig, local_58);
    local_8.SetActiveObjectiveInstanceId(local_10);
    local_8.SetActiveObjective(ObjectiveConfig);
    local_8.SetPendingObjective(TDataObjectPtr<FObjectiveConfig>(nullptr));
    XLog(ELog(22), FString().Append("[PVXPhase] DoActivatePhase: ").Append(ObjectiveConfig.GetDataName().ToString()).Append(", InstanceId=").Append(local_10));
    if ((local_10 > 0 && (0 == 1)))
    {
        FObjectiveInstance local_218;
        if (ObjectiveUtils::TryFindActivetedObjectiveInstance(local_10, local_218))
        {
            for (auto& local_236 : local_218.ChildObjectiveMap)
            {
                local_236;
                if (local_11 == 0)
                {
                    continue;
                }
                if (ObjectiveUtils::TryFindActivetedObjectiveInstance(local_51, local_382))
                {
                    FCommissionTargetProgress local_384;
                    local_384.SetSuccessProgressValue(local_382.GetFinishProgressValue());
                    local_384.SetFailedProgressValue(local_382.GetFailProgressValue());
                    local_22.ChildProgress.Add(local_382.ObjectiveId, local_384);
                }
            }
        }
    }
    return;
}
void DeactivatePhase()
{
    int local_8 = 0;
    int local_52 = 0;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if (!(local_8))
    {
        return;
    }
    if (local_8.GetActiveObjectiveInstanceId() > 0)
    {
        ObjectiveUtils::DeactivateObjectives(local_8.GetActiveObjectiveInstanceId());
        XLog(ELog(22), FString().Append("[PVXPhase] DeactivatePhase: InstanceId=").Append(local_8.GetActiveObjectiveInstanceId()));
    }
    local_8.SetActiveObjectiveInstanceId(0);
    local_8.SetActiveObjective(TDataObjectPtr<FObjectiveConfig>(nullptr));
    FECSWorldPtr local_2_2 = ECS::GetECSWorld();
    if (local_52)
    {
        local_52.CommissionTargetObjective = TDataObjectPtr<FObjectiveConfig>(nullptr);
        FCommissionTargetProgress local_78;
        local_52.Progress = local_78;
        local_52.ChildProgress.Empty(0);
    }
    return;
}
void ActivateMonsterHPPhase(const TDataObjectPtr<FObjectiveConfig> &inout ObjectiveConfig, const TDataObjectPtr<FMonsterMainConfig> &inout MonsterConfig)
{
    int local_12 = 0;
    FCS_CommissionInfo local_18;
    int local_24 = 0;
    if (!(ObjectiveConfig.IsSet()) || !(MonsterConfig.IsSet()))
    {
        XWarning(ELog(22), "[PVXPhase] ActivateMonsterHPPhase: ObjectiveConfig or MonsterConfig is null");
        return;
    }
    PVXPhaseTracking::ActivatePhase(ObjectiveConfig);
    FECSWorldPtr local_6 = ECS::GetECSWorld();
    if (!(local_12))
    {
        return;
    }
    local_12.SetMonitoredMonsterConfig(MonsterConfig);
    local_12.SetbMonitoringHP(true);
    FECSWorldPtr local_6_2 = ECS::GetECSWorld();
    if (local_18)
    {
        local_18.bMonsterHPBar = true;
    }
    FECSWorldPtr local_6_3 = ECS::GetECSWorld();
    local_24.SetHPPercent(100);
    XLog(ELog(22), FString().Append("[PVXPhase] ActivateMonsterHPPhase: monitoring ").Append(MonsterConfig.GetDataName().ToString()).Append(" HP"));
    return;
}
void StopMonitoringHP()
{
    int local_8 = 0;
    FCS_CommissionInfo local_40;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if (!(local_8))
    {
        return;
    }
    local_8.SetMonitoredMonsterConfig(TDataObjectPtr<FMonsterMainConfig>(nullptr));
    local_8.SetbMonitoringHP(false);
    local_8.SetMonitoredMonsterEntity(ENTITY_NULL);
    FECSWorldPtr local_2_2 = ECS::GetECSWorld();
    if (local_40)
    {
        local_40.bMonsterHPBar = false;
    }
    FECSWorldPtr local_2_3 = ECS::GetECSWorld();
    Remove local_44;
    local_44.opCall();
    return;
}
void ActivateMonsterHPDualPhase(const TDataObjectPtr<FObjectiveConfig> &inout PlayerObjConfig, const TDataObjectPtr<FObjectiveConfig> &inout BossObjConfig, const TDataObjectPtr<FMonsterMainConfig> &inout MonsterConfig)
{
    int local_10 = 0;
    FCS_CommissionInfo local_16;
    int local_22 = 0;
    if (!(MonsterConfig.IsSet()))
    {
        XWarning(ELog(22), "[PVXPhase] ActivateMonsterHPDualPhase: MonsterConfig is null");
        return;
    }
    PVXPhaseTracking::ActivateDualPhase(PlayerObjConfig, BossObjConfig);
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    if (!(local_10))
    {
        return;
    }
    local_10.SetMonitoredMonsterConfig(MonsterConfig);
    local_10.SetbMonitoringHP(true);
    FECSWorldPtr local_4_2 = ECS::GetECSWorld();
    if (local_16)
    {
        local_16.bMonsterHPBar = true;
    }
    FECSWorldPtr local_4_3 = ECS::GetECSWorld();
    local_22.SetHPPercent(100);
    XLog(ELog(22), FString().Append("[PVXPhase] ActivateMonsterHPDualPhase: Player=").Append(PlayerObjConfig.GetDataName().ToString()).Append(" Boss=").Append(BossObjConfig.GetDataName().ToString()).Append(" Monster=").Append(MonsterConfig.GetDataName().ToString()));
    return;
}
void DeactivateMonsterHPDualPhase()
{
    PVXPhaseTracking::StopMonitoringHP();
    PVXPhaseTracking::DeactivateDualPhase();
    return;
}
void ActivateSingleFactionObjective(const TDataObjectPtr<FObjectiveConfig> &inout ObjConfig, uint &out OutInstanceId, TMap<uint, FCommissionTargetProgress> &out OutChildProgress, FCommissionTargetProgress &out OutProgress)
{
    FObjectiveInstance local_362;
    OutInstanceId = 0;
    TMap<uint, FCommissionTargetProgress> local_22;
    OutChildProgress = local_22;
    FCommissionTargetProgress local_24;
    OutProgress = local_24;
    OutInstanceId = 0;
    OutChildProgress.Empty(0);
    FCommissionTargetProgress local_28;
    OutProgress = local_28;
    if (!(ObjConfig.IsSet()))
    {
        return;
    }
    FObjectiveContext local_36;
    OutInstanceId = ObjectiveUtils::ActivateObjective(ObjConfig, local_36);
    XLog(ELog(22), FString().Append("[PVXPhase] ActivateSingleFactionObjective: ").Append(ObjConfig.GetDataName().ToString()).Append(", InstanceId=").Append(OutInstanceId));
    int local_25 = OutInstanceId;
    if ((local_25 > 0 && (0 == 1)))
    {
        FObjectiveInstance local_198;
        int local_48 = OutInstanceId;
        if (ObjectiveUtils::TryFindActivetedObjectiveInstance(local_48, local_198))
        {
            for (auto& local_216 : local_198.ChildObjectiveMap)
            {
                local_216;
                if (local_25 == 0)
                {
                    continue;
                }
                if (ObjectiveUtils::TryFindActivetedObjectiveInstance(local_48, local_362))
                {
                    FCommissionTargetProgress local_364;
                    local_364.SetSuccessProgressValue(local_362.GetFinishProgressValue());
                    local_364.SetFailedProgressValue(local_362.GetFailProgressValue());
                    OutChildProgress.Add(local_362.ObjectiveId, local_364);
                }
            }
        }
    }
    return;
}
void ActivateDualPhase(const TDataObjectPtr<FObjectiveConfig> &inout PlayerObjConfig, const TDataObjectPtr<FObjectiveConfig> &inout BossObjConfig)
{
    int local_8 = 0;
    int local_17;
    int local_41;
    int local_70 = 0;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if (local_8.GetPlayerObjectiveInstanceId() > 0)
    {
        ObjectiveUtils::DeactivateObjectives(local_8.GetPlayerObjectiveInstanceId());
    }
    if (local_8.GetBossObjectiveInstanceId() > 0)
    {
        ObjectiveUtils::DeactivateObjectives(local_8.GetBossObjectiveInstanceId());
    }
    TMap<uint, FCommissionTargetProgress> local_38;
    FCommissionTargetProgress local_40;
    PVXPhaseTracking::ActivateSingleFactionObjective(PlayerObjConfig, local_17, local_38, local_40);
    local_8.SetPlayerObjectiveInstanceId(local_17);
    local_8.SetPlayerProgress(local_40);
    local_8.SetPlayerChildProgress(local_38);
    local_8.SetPlayerObjective(PlayerObjConfig);
    TMap<uint, FCommissionTargetProgress> local_62;
    FCommissionTargetProgress local_64;
    PVXPhaseTracking::ActivateSingleFactionObjective(BossObjConfig, local_41, local_62, local_64);
    local_8.SetBossObjectiveInstanceId(local_41);
    local_8.SetBossProgress(local_64);
    local_8.SetBossChildProgress(local_62);
    local_8.SetBossObjective(BossObjConfig);
    FECSWorldPtr local_2_2 = ECS::GetECSWorld();
    if (local_70)
    {
        local_70.CommissionTargetObjective = PlayerObjConfig;
        local_70.Progress = local_40;
        local_70.ChildProgress = local_38;
    }
    local_8.SetPendingObjective(TDataObjectPtr<FObjectiveConfig>(nullptr));
    XLog(ELog(22), FString().Append("[PVXPhase] ActivateDualPhase: Player=").Append(PlayerObjConfig.GetDataName().ToString()).Append(" Boss=").Append(BossObjConfig.GetDataName().ToString()));
    return;
}
void DeactivateDualPhase()
{
    int local_8 = 0;
    int local_68 = 0;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if (!(local_8))
    {
        return;
    }
    if (local_8.GetPlayerObjectiveInstanceId() > 0)
    {
        ObjectiveUtils::DeactivateObjectives(local_8.GetPlayerObjectiveInstanceId());
        local_8.SetPlayerObjectiveInstanceId(0);
    }
    if (local_8.GetBossObjectiveInstanceId() > 0)
    {
        ObjectiveUtils::DeactivateObjectives(local_8.GetBossObjectiveInstanceId());
        local_8.SetBossObjectiveInstanceId(0);
    }
    local_8.SetPlayerObjective(TDataObjectPtr<FObjectiveConfig>(nullptr));
    local_8.SetBossObjective(TDataObjectPtr<FObjectiveConfig>(nullptr));
    FCommissionTargetProgress local_42;
    local_8.SetPlayerProgress(local_42);
    local_8.SetBossProgress(local_42);
    TMap<uint, FCommissionTargetProgress> local_62;
    local_8.SetPlayerChildProgress(local_62);
    local_8.SetBossChildProgress(local_62);
    FECSWorldPtr local_2_2 = ECS::GetECSWorld();
    if (local_68)
    {
        local_68.CommissionTargetObjective = TDataObjectPtr<FObjectiveConfig>(nullptr);
        local_68.Progress = local_42;
        local_68.ChildProgress.Empty(0);
    }
    return;
}
void Cleanup()
{
    PVXPhaseTracking::StopMonitoringHP();
    PVXPhaseTracking::DeactivateDualPhase();
    PVXPhaseTracking::DeactivatePhase();
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Remove local_6;
    local_6.opCall();
    return;
}
}
namespace BlueprintFunctions_PVXPhase
{
UFUNCTION()
void PVX_ActivatePhaseObjective(const TDataObjectPtr<FObjectiveConfig> &inout ObjectiveConfig)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    if (!(ObjectiveConfig.IsSet()))
    {
        XWarning(ELog(22), "[PVXPhase] ActivatePhaseObjective: ObjectiveConfig is invalid");
        return;
    }
    PVXPhaseTracking::ActivatePhase(ObjectiveConfig);
    return;
}
UFUNCTION()
void PVX_DeactivatePhaseObjective()
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    PVXPhaseTracking::DeactivatePhase();
    return;
}
UFUNCTION()
void PVX_ActivateFactionPhaseObjectives(const TDataObjectPtr<FObjectiveConfig> &inout PlayerObjective, const TDataObjectPtr<FObjectiveConfig> &inout BossObjective)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    if (!(PlayerObjective.IsSet()) && !(BossObjective.IsSet()))
    {
        XWarning(ELog(22), "[PVXPhase] ActivateFactionPhaseObjectives: both objectives are invalid");
        return;
    }
    PVXPhaseTracking::ActivateDualPhase(PlayerObjective, BossObjective);
    return;
}
UFUNCTION()
void PVX_DeactivateFactionPhaseObjectives()
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    PVXPhaseTracking::DeactivateDualPhase();
    return;
}
UFUNCTION()
void PVX_ActivateMonsterHPObjective(const TDataObjectPtr<FObjectiveConfig> &inout ObjectiveConfig, const TDataObjectPtr<FMonsterMainConfig> &inout MonsterConfig)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    if (!(ObjectiveConfig.IsSet()))
    {
        XWarning(ELog(22), "[PVXPhase] ActivateMonsterHPObjective: ObjectiveConfig is invalid");
        return;
    }
    if (!(MonsterConfig.IsSet()))
    {
        XWarning(ELog(22), "[PVXPhase] ActivateMonsterHPObjective: MonsterConfig is invalid");
        return;
    }
    PVXPhaseTracking::ActivateMonsterHPPhase(ObjectiveConfig, MonsterConfig);
    return;
}
UFUNCTION()
void PVX_ActivateMonsterHPFactionObjectives(const TDataObjectPtr<FObjectiveConfig> &inout PlayerObjective, const TDataObjectPtr<FObjectiveConfig> &inout BossObjective, const TDataObjectPtr<FMonsterMainConfig> &inout MonsterConfig)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    if (!(PlayerObjective.IsSet()) && !(BossObjective.IsSet()))
    {
        XWarning(ELog(22), "[PVXPhase] ActivateMonsterHPFactionObjectives: both objectives are invalid");
        return;
    }
    if (!(MonsterConfig.IsSet()))
    {
        XWarning(ELog(22), "[PVXPhase] ActivateMonsterHPFactionObjectives: MonsterConfig is invalid");
        return;
    }
    PVXPhaseTracking::ActivateMonsterHPDualPhase(PlayerObjective, BossObjective, MonsterConfig);
    return;
}
UFUNCTION()
void PVX_DeactivateMonsterHPFactionObjectives()
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    PVXPhaseTracking::DeactivateMonsterHPDualPhase();
    return;
}
UFUNCTION()
void PVX_SendPhaseCustomEvent(const FECSEntityAdapter &inout Entity, const FName &inout EventName)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    FLevelUtils::SendCustomLevelEvent(Entity.GetEntity(), EventName);
    return;
}
UFUNCTION()
void PVX_TriggerSettlementUI(const FECSEntityAdapter &inout PlayerEntity)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    if (!(PlayerEntity.GetEntity().IsValid()))
    {
        return;
    }
    SendEvent local_14;
    local_14.opCall(FFPTime(-1));
    return;
}
UFUNCTION()
bool PVX_IsBossFaction(const FECSEntityAdapter &inout PlayerEntity)
{
    return (int(PVXGameModeUtils::GetPVXCampFromMatchData(PlayerEntity.GetEntity())) == 6);
}
}

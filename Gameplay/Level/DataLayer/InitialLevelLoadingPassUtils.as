
namespace FInitialLevelLoadingPassUtils
{
FECSEntity ActivateLevelGroupAndGetGroupEntity(FCS_LevelDataManager &inout LevelDataManager, const FConfigGUID &inout GroupGUID)
{
    int local_24 = 0;
    LevelDataManager.SetGroupState(ECS::GetECSWorld(), GroupGUID, ELevelGroupState(2));
    FECSEntityId local_6 = FECSEntityId(ENTITY_ID_NULL);
    if (LevelDataManager.ExitedLevelGroupInstance.Find(GroupGUID, local_6))
    {
        FECSEntity local_14 = FECSEntity(local_6);
        if (local_14.IsValid())
        {
            const FLevelGroupConfig& local_16 = LevelConfig::FindLevelGroupConfig(GroupGUID);
            if (local_16.IsValid() && !(local_16.OccupyRule.IsEmpty()))
            {
                FECSWorldPtr local_4 = ECS::GetECSWorld();
                local_24.AddOccupyRule(local_16.OccupyRule);
                XLog(ELog(22), FString().Append("ActivateLevelGroup: Group [").Append(local_16.GroupName).Append("] injected OccupyRule: ").Append(local_16.OccupyRule.GetDescription()));
            }
        }
        return local_14;
    }
    return ENTITY_NULL;
}
void NotifyLBPGroupReady(const FName &inout GroupName)
{
    AKLLevelScriptActor local_2 = ULevelActorManager::Get().GetLBPByName(GroupName);
    if (local_2 != nullptr)
    {
        local_2.CallLevelGroupReady();
    }
    FKLFlowEvent_LevelGroup local_14;
    local_14.GroupName = GroupName;
    KLFlowLibrary::PostFlowEvent(KLFlowEventTags::Level_LevelGroupReady, FInstancedStruct::Make(local_14));
    return;
}
void NotifyLBPPassReady(const FName &inout Pass, FCS_InitialLevelLoadingData &inout InitialLevelLoadingData)
{
    int local_126 = 0;
    AKLLevelScriptActor local_128;
    TRawPtr<FPerPassLoadingGroups> local_2 = InitialLevelLoadingData.LoadingGroupsPerPass.Find(Pass);
    FECSRuntimeView local_22 = FECSRuntimeView(ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2)));
    Include local_48;
    local_48.opCall();
    FECSRuntimeViewIterator local_82 = local_22.Iterator();
    for (; local_82.CanProceed;)
    {
        local_82.Proceed();
        if (local_126.LevelScript.IsValid())
        {
            AActor local_130;
            local_128 = Cast<AKLLevelScriptActor>(local_130);
            if (local_128 != nullptr)
            {
                if (local_2 && (local_2.opArrow().GetLevelGroupStatusIndex(local_128.GetClass().GetFName()) != -1))
                {
                    local_128.CallLevelGroupPassReady();
                    FKLFlowEvent_LevelGroup local_146;
                    local_146.GroupName = local_128.GetClass().GetFName();
                    KLFlowLibrary::PostFlowEvent(KLFlowEventTags::Level_LevelGroupPassReady, FInstancedStruct::Make(local_146));
                }
                local_128.CallLevelGroupAnyPassReady(Pass);
                FKLFlowEvent_LevelGroup local_146;
                local_146.GroupName = local_128.GetClass().GetFName();
                local_146.PassName = Pass;
                KLFlowLibrary::PostFlowEvent(KLFlowEventTags::Level_LevelGroupAnyPassReady, FInstancedStruct::Make(local_146));
            }
        }
    }
    return;
}
void UnloadOccupiedLevelGroups()
{
    int local_8 = 0;
    int local_18 = 0;
    bool local_43;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if (!(local_8) || (local_8.OccupyRules.Num() == 0))
    {
        return;
    }
    FECSWorldPtr local_2_2 = ECS::GetECSWorld();
    if (!(local_18))
    {
        return;
    }
    const TArray<FConfigGUID>& local_20 = LevelConfig::GetAllLevelGroupConfigs(local_18.LevelName);
    int local_21 = 0;
    UWorld local_24 = ECS::GetUEWorld();
    for (auto& local_40 : local_20)
    {
        const FLevelGroupConfig& local_42 = LevelConfig::FindLevelGroupConfig(local_40);
        if (!(local_42.IsValid()))
        {
            continue;
        }
        if (!(local_8.IsGroupOccupied(local_42)))
        {
            continue;
        }
        local_43 = false;
        FECSEntityId local_44 = FECSEntityId(ENTITY_ID_NULL);
        if (local_18.ExitedLevelGroupInstance.Find(local_40, local_44))
        {
            if (FECSEntity(local_44).IsValid())
            {
                Get local_56;
                const FC_LevelGroupComponent& local_58 = local_56.opCall();
                if (local_58)
                {
                    local_43 = (int(local_58.State) == 2);
                }
            }
        }
        if (local_43)
        {
            continue;
        }
        FLevelDataLayerUtils::SetDatalayerRuntimeStateByName(local_24, local_42.GroupName, EDataLayerRuntimeState(0));
        ++local_21;
        XLog(ELog(22), FString().Append("UnloadOccupiedLevelGroups: Unloaded datalayer [").Append(local_42.GroupName).Append("] for occupied group (GUID=").Append(local_40).Append(")"));
    }
    XLog(ELog(22), FString().Append("UnloadOccupiedLevelGroups: done, unloaded ").Append(local_21).Append(" datalayers"));
    return;
}
bool IsGroupOccupied(const FLevelGroupConfig &inout GroupConfig)
{
    int local_8 = 0;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if (!(local_8) || (local_8.OccupyRules.Num() == 0))
    {
        return false;
    }
    return local_8.IsGroupOccupied(GroupConfig);
}
bool TryToAddGroupToInitialLoadingPass(const FName &inout Pass, const FName &inout LevelGroupName)
{
    int local_8 = 0;
    int local_16 = 0;
    int local_22 = 0;
    int local_36 = 0;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if (!(local_8))
    {
        return false;
    }
    FECSWorldPtr local_2_2 = ECS::GetECSWorld();
    if (!(local_16))
    {
        return false;
    }
    FECSWorldPtr local_2_3 = ECS::GetECSWorld();
    if (!(local_22))
    {
        return false;
    }
    if (!(local_22.LoadingPassNames.Contains(Pass)))
    {
        XWarning(ELog(22), FString().Append("TryToAddGroupToInitialLoadingPass: Pass ").Append(Pass).Append(" not in LoadingPassNames, rejected"));
        return false;
    }
    if (local_22.IsPassBeyond(local_8.CurrentLoadingPass, Pass))
    {
        return false;
    }
    const FLevelGroupConfig& local_30 = LevelConfig::FindLevelGroupConfigByName(local_16.LevelName, LevelGroupName);
    if (!(local_30.IsValid()))
    {
        return false;
    }
    FECSWorldPtr local_2_4 = ECS::GetECSWorld();
    FPerPassLoadingGroups& local_38 = local_36.LoadingGroupsPerPass.FindOrAdd(Pass);
    if (local_38.GetLevelGroupStatusIndex(LevelGroupName) != -1)
    {
        XLog(ELog(22), FString().Append("TryToAddGroupToInitialLoadingPass: Group ").Append(LevelGroupName).Append(" already in pass ").Append(Pass).Append(", skipped"));
        return true;
    }
    if (int(local_38.Status) == 0)
    {
        FLevelGroupLoadingStatus local_50;
        local_50.GroupGUID = local_30.GUID;
        local_50.GroupName = local_30.GroupName;
        local_50.GroupEntity = ENTITY_NULL;
        local_38.GroupStatus.Add(local_50);
        XLog(ELog(22), FString().Append("TryToAddGroupToInitialLoadingPass: Added group ").Append(LevelGroupName).Append(" to pass ").Append(Pass));
        return true;
    }
    if (int(local_38.Status) == 1)
    {
        local_38.NewlyAddedGroupNamesDuringLoading.AddUnique(LevelGroupName);
        XLog(ELog(22), FString().Append("TryToAddGroupToInitialLoadingPass: Added group ").Append(LevelGroupName).Append(" to pass ").Append(Pass).Append(" during loading"));
        return true;
    }
    return false;
}
}

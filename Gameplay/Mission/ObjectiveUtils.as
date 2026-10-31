enum EObjectiveItemUIState
{
    Pending,
    Success,
    Failed,
}

enum EObjectiveGuideDisplayState
{
    None,
    Distance,
    DifferentLevel,
}

namespace ObjectiveUtils
{
TDataObjectPtr<FObjectiveConfig> FindObjectiveConfig(const uint ObjectiveId)
{
    GetDataObjectByGSDataId<FObjectiveConfig> local_24;
    return local_24.opImplConv();
}
FConditionInstanceHandle RegisterLocalCondition(const TDataObjectPtr<FLocalConditionConfigBase> &inout LocalConfig, const FECSEntity &inout ContextEntity)
{
    FConditionInstanceHandle __r;
    if (ContextEntity.IsValid())
    {
        ConditionUtils::RegisterLocalConditionInstanceForEntity(ContextEntity, LocalConfig);
    }
    else
    {
        ConditionUtils::RegisterLocalConditionInstanceForServer(LocalConfig);
    }
    return __r;
}
void UnregisterLocalCondition(const FConditionInstanceHandle &inout ConditionInstance)
{
    if (ConditionInstance.IsValid())
    {
        ConditionUtils::UnregisterLocalConditionInstance(ConditionInstance);
    }
    return;
}
uint ObjectiveInstanceIdToGuideUniqueId(const uint ObjectiveInstanceId, const uint Index)
{
    return ((ObjectiveInstanceId * 100) + Index);
}
bool TryFindActivetedObjectiveInstance(const uint InstanceId, FObjectiveInstance &out Instance)
{
    FECSWorldPtr local_148 = ECS::GetECSWorld();
    Get local_152;
    const FCS_ObjectiveManager& local_154 = local_152.opCall();
    if (local_154)
    {
        return local_154.ActiveObjectives.Find(InstanceId, Instance);
    }
    return false;
}
void RegisterAndUpdateConditionInfo(FObjectiveConditionInfo &inout ConditionInfo, const TDataObjectPtr<FConditionConfigBase> &inout ConditionConfig, const FObjectiveContext &inout Context)
{
    ConditionInfo.ConditionConfig = ConditionConfig;
    ConditionInfo.ProgressValue = 0;
    ConditionInfo.TargetProgressValue = ConditionUtils::GetTargetValue(ConditionConfig);
    if (int(ConditionConfig.Get().ConfigType) == 2)
    {
        CastTo local_32;
        TDataObjectPtr<FLocalConditionConfigBase> local_56 = local_32.opCall();
        if (local_56)
        {
            ConditionInfo.ConditionIdentifier = FConditionIdentifier(ConditionConfig.Get().GetUniqueID(), int(Context.UniqueIdForUsage), Context.ConditionUsage);
            ObjectiveUtils::RegisterLocalCondition(local_56, Context.ContextEntity);
        }
        return;
    }
    if (int(ConditionConfig.Get().ConfigType) == 1)
    {
        CastTo local_142;
        TDataObjectPtr<FConditionConfig> local_166 = local_142.opCall();
        if (local_166)
        {
            ConditionInfo.GSCondDataId = local_166.Get().DataId;
            int64 local_88 = local_166.Get().DataId;
            ConditionInfo.ConditionIdentifier = FConditionIdentifier(local_88, int(Context.UniqueIdForUsage), Context.ConditionUsage);
            return;
        }
        CastTo local_196;
        TDataObjectPtr<FGsConditionGroupConfig> local_220 = local_196.opCall();
        if (local_220)
        {
            ConditionInfo.GSCondDataId = local_220.Get().DataId;
            int64 local_88_2 = local_220.Get().DataId;
            ConditionInfo.ConditionIdentifier = FConditionIdentifier(local_88_2, int(Context.UniqueIdForUsage), Context.ConditionUsage);
        }
    }
    return;
}
uint CreateObjectiveInstance(const TDataObjectPtr<FObjectiveConfig> &inout Objective, const FObjectiveContext &inout Context)
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    FCS_ObjectiveManager local_8;
    int local_9 = int(local_8.NextInstanceId);
    ++local_8.NextInstanceId;
    bool local_11 = !(local_8.ActiveObjectives.Contains(local_9));
    FObjectiveInstance& local_14 = local_8.ActiveObjectives.FindOrAdd(local_9);
    local_14.InstanceId = local_9;
    int local_10 = Objective.Get().DataId;
    local_14.ObjectiveId = local_10;
    local_14.Status = EObjectiveStatus(1);
    if (int(Objective.Get().ObjectiveType) == 0)
    {
        CastTo local_46;
        TDataObjectPtr<FObjectiveSingleConfig> local_70 = local_46.opCall();
        if (local_70.Get().GetFinishCondition().IsSet())
        {
            ObjectiveUtils::RegisterAndUpdateConditionInfo(local_14.FinishConditionInfo, local_70.Get().GetFinishCondition(), Context);
        }
        if (local_70.Get().GetFailCondition().IsSet())
        {
            ObjectiveUtils::RegisterAndUpdateConditionInfo(local_14.FailConditionInfo, local_70.Get().GetFailCondition(), Context);
        }
    }
    return local_9;
}
uint ActivateObjective(const TDataObjectPtr<FObjectiveConfig> &inout Objective, const FObjectiveContext &inout Context = FObjectiveContext())
{
    int local_74 = 0;
    int local_91;
    CastTo local_96;
    if (int(Objective.Get().ObjectiveType) == 0)
    {
        int local_6 = ObjectiveUtils::CreateObjectiveInstance(Objective, Context);
        XLog(ELog(65), FString().Append("Activate: ").Append(Objective.GetDataName()).Append("(").Append(local_6).Append(")"));
        return local_6;
    }
    if (int(Objective.Get().ObjectiveType) == 1)
    {
        CastTo local_42;
        TDataObjectPtr<FObjectiveGroupConfig> local_66 = local_42.opCall();
        int local_5 = ObjectiveUtils::CreateObjectiveInstance(Objective, Context);
        XLog(ELog(65), FString().Append("Activate Group: ").Append(Objective.GetDataName()).Append("(").Append(local_5).Append(")"));
        FECSWorldPtr local_68 = ECS::GetECSWorld();
        local_74.ActiveObjectives[local_5].FinishType = EObjectiveFinishType(local_66.Get().FinishType);
        if (int(local_66.Get().FinishType) == 2)
        {
            bool local_76;
            local_76 = true;
            for (auto& local_90 : local_66.Get().GetChildObjectives())
            {
                int local_6_2 = local_90.Get().DataId;
                local_91 = local_6_2;
                if (local_76)
                {
                    local_74.ActiveObjectives[local_5].ChildObjectiveMap.Add(local_91, ObjectiveUtils::ActivateObjective(local_96.opCall(), Context));
                    local_76 = false;
                    continue;
                }
                local_74.ActiveObjectives[local_5].ChildObjectiveMap.Add(local_91, 0);
            }
        }
        else
        {
            for (auto& local_90 : local_66.Get().GetChildObjectives())
            {
                local_74.ActiveObjectives[local_5].ChildObjectiveMap.Add(local_90.Get().DataId, ObjectiveUtils::ActivateObjective(local_96.opCall(), Context));
            }
        }
        return local_5;
    }
    int local_6_3 = 0;
    return local_6_3;
}
TArray<uint> DeactivateObjectives(const uint ObjectiveInstanceId)
{
    TArray<uint> local_4;
    int local_190 = 0;
    FObjectiveInstance local_150;
    if (!(ObjectiveUtils::TryFindActivetedObjectiveInstance(ObjectiveInstanceId, local_150)))
    {
        XWarning(ELog(65), FString().Append("Failed to find activated objective instance: ").Append(ObjectiveInstanceId));
        return local_4;
    }
    for (auto& local_176 : local_150.ChildObjectiveMap)
    {
        int local_177 = local_176.GetValue();
        if (local_177 != 0)
        {
            local_4.Append(ObjectiveUtils::DeactivateObjectives(local_176.GetValue()));
        }
    }
    XLog(ELog(65), FString().Append("Deactivate: ").Append(local_150.ObjectiveId).Append("(").Append(ObjectiveInstanceId).Append(")"));
    ObjectiveUtils::StopObjectiveGuide(ObjectiveInstanceId, ENTITY_NULL);
    ObjectiveUtils::UnregisterLocalCondition(local_150.FinishConditionInfo.ConditionHandle);
    ObjectiveUtils::UnregisterLocalCondition(local_150.FailConditionInfo.ConditionHandle);
    FECSWorldPtr local_184 = ECS::GetECSWorld();
    local_190.ActiveObjectives.Remove(ObjectiveInstanceId);
    local_4.Add(ObjectiveInstanceId);
    return local_4;
}
TArray<uint> DeactivateObjectivesForPlayer(const FECSEntity &inout PlayerEntity)
{
    TArray<uint> local_4;
    int local_14 = 0;
    if (!(PlayerEntity.IsValid()))
    {
        return local_4;
    }
    FECSWorldPtr local_8 = ECS::GetECSWorld();
    if (!(local_14))
    {
        return local_4;
    }
    TArray<uint> local_18;
    for (auto& local_36 : local_14.ActiveObjectives)
    {
        for (auto& local_54 : local_36.GetValue().ChildObjectiveMap)
        {
            int local_55 = local_54.GetValue();
            if (local_55 != 0)
            {
                local_18.AddUnique(local_54.GetValue());
            }
        }
    }
    TArray<uint> local_60;
    for (auto& local_36_2 : local_14.ActiveObjectives)
    {
        if ((!((FECSEntity(local_36_2.GetValue().Context.ContextEntity) == PlayerEntity))))
        {
            continue;
        }
        if (local_18.Contains(local_36_2.GetKey()))
        {
            continue;
        }
        local_60.Add(local_36_2.GetKey());
    }
    for (auto local_79 : local_60)
    {
        local_4.Append(ObjectiveUtils::DeactivateObjectives(local_79));
    }
    return local_4;
}
void SetObjectiveStatusManually(const uint ObjectiveInstanceId, const EObjectiveStatus Status)
{
    FObjectiveInstance local_146;
    int local_162 = 0;
    if (!(ObjectiveUtils::TryFindActivetedObjectiveInstance(ObjectiveInstanceId, local_146)))
    {
        XWarning(ELog(65), FString().Append("Failed to find ObjectiveInfo: ").Append(ObjectiveInstanceId));
        return;
    }
    FECSWorldPtr local_156 = ECS::GetECSWorld();
    if (local_162.ObjectiveStatusMap.Contains(ObjectiveInstanceId))
    {
        EObjectiveStatus local_163;
        XWarning(ELog(65), FString().Append("Status already setted: ").Append(ObjectiveInstanceId).Append(" = ").Append(Status));
        local_163 = local_162.ObjectiveStatusMap[ObjectiveInstanceId];
        if ((int(local_163)) != (int(Status)))
        {
            XLog(ELog(65), FString().Append("manually setted status changed: ").Append(ObjectiveInstanceId).Append(" ").Append(local_163).Append(" => ").Append(Status));
            local_162.ObjectiveStatusMap[ObjectiveInstanceId] = Status;
        }
    }
    else
    {
        FString local_152_2 = FString();
        XLog(ELog(65), local_152_2.Append("Status manually set: ").Append(ObjectiveInstanceId).Append(" = ").Append(Status));
        local_162.ObjectiveStatusMap.Add(ObjectiveInstanceId, Status);
    }
    return;
}
FText GetObjectiveTitle(const TDataObjectPtr<FObjectiveConfig> &inout ObjectiveConfig)
{
    CastTo local_28;
    TDataObjectPtr<FObjectiveSingleConfig> local_52 = local_28.opCall();
    if (local_52)
    {
        return local_52.Get().ObjectiveTitle;
    }
    XError(ELog(65), FString().Append("ObjectiveConfig is not a single objective"));
    return FText();
}
void GetObjectiveTargetValue(const TDataObjectPtr<FObjectiveConfig> &inout ObjectiveConfig, int &out TargetFinishValue, int &out TargetFailValue)
{
    int local_56;
    int local_57;
    TargetFinishValue = 0;
    TargetFailValue = 0;
    CastTo local_30;
    TDataObjectPtr<FObjectiveSingleConfig> local_54 = local_30.opCall();
    if (local_54)
    {
        if (local_54.Get().GetFinishCondition().IsSet())
        {
            local_57 = ConditionUtils::GetTargetValue(local_54.Get().GetFinishCondition());
        }
        else
        {
            local_57 = 1;
        }
        TargetFinishValue = local_57;
        if (local_54.Get().GetFailCondition().IsSet())
        {
            local_56 = ConditionUtils::GetTargetValue(local_54.Get().GetFailCondition());
        }
        else
        {
            local_56 = 1;
        }
        TargetFailValue = local_56;
        return;
    }
    local_57 = 1;
    TargetFinishValue = local_57;
    local_56 = 1;
    TargetFailValue = local_56;
    return;
}
bool TryCalculateGuideDistance(const TDataObjectPtr<FObjectiveConfig> &inout ObjectiveConfig, const FECSEntity &inout PlayerEntity, float &out Distance)
{
    Distance = 0.0;
    CastTo local_76;
    if (int(ObjectiveConfig.Get().ObjectiveType) == 1)
    {
        CastTo local_34;
        TDataObjectPtr<FObjectiveGroupConfig> local_58 = local_34.opCall();
        if (!(local_58))
        {
            return false;
        }
        for (auto& local_72 : local_58.Get().GetChildObjectives())
        {
            local_72;
            if (ObjectiveUtils::TryCalculateGuideDistance(local_76.opCall(), PlayerEntity, Distance))
            {
                return true;
            }
        }
    }
    if (int(ObjectiveConfig.Get().ObjectiveType) == 0)
    {
        TArray<FInstancedStruct> local_178;
        CastTo local_128;
        TDataObjectPtr<FObjectiveSingleConfig> local_152 = local_128.opCall();
        if (!(local_152))
        {
            return false;
        }
        TDataObjectPtr<FLevelInfoConfig> local_176;
        if (!(ObjectiveUtils::CanStartObjectiveGuideInLevel(ObjectiveConfig, local_176)))
        {
            return false;
        }
        if (GuideUtils::TryCalculateGuideDistance(local_178[0], PlayerEntity, Distance))
        {
            return true;
        }
        FGuideDataSourceConfig local_254 = FGuideDataSourceConfig(local_152, 0);
        FGuideContext local_394;
        if (GuideUtils::TryFindGuideContextBySource(PlayerEntity, local_254, local_394))
        {
            FECSEntity local_398 = FASCommonUtils::GetUniqueAvatarPawnEntity(PlayerEntity);
            if (local_398.IsValid())
            {
                Distance = FMath::Max(0.0, FASCommonUtils::GetEntityLocation(local_398).Dist2D(local_394.GetPrimaryTargetPosition()));
                return true;
            }
        }
        return false;
    }
    return false;
}
EObjectiveGuideDisplayState GetObjectiveGuideDisplayInfo(const TDataObjectPtr<FObjectiveConfig> &inout ObjectiveConfig, const FECSEntity &inout PlayerEntity, float &out Distance, TDataObjectPtr<FLevelInfoConfig> &out TargetLevelInfo)
{
    float local_200;
    Distance = 0.0;
    Distance = 0.0;
    TDataObjectPtr<FLevelInfoConfig> local_76 = TDataObjectPtr<FLevelInfoConfig>();
    TargetLevelInfo = local_76;
    if (!(ObjectiveConfig))
    {
        return EObjectiveGuideDisplayState::None;
    }
    if (int(ObjectiveConfig.Get().ObjectiveType) == 1)
    {
        EObjectiveGuideDisplayState local_159;
        CastTo local_134;
        TDataObjectPtr<FObjectiveGroupConfig> local_158 = local_134.opCall();
        if (!(local_158))
        {
            return EObjectiveGuideDisplayState::None;
        }
        local_159 = EObjectiveGuideDisplayState::None;
        TDataObjectPtr<FLevelInfoConfig> local_184;
        for (auto& local_198 : local_158.Get().GetChildObjectives())
        {
            local_198;
            TDataObjectPtr<FLevelInfoConfig> local_224;
            CastTo local_228;
            EObjectiveGuideDisplayState local_102 = ObjectiveUtils::GetObjectiveGuideDisplayInfo(local_228.opCall(), PlayerEntity, local_200, local_224);
            if (int(local_102) == 1)
            {
                Distance = local_200;
                return EObjectiveGuideDisplayState(1);
            }
            if ((int(local_102) == 2 && (int(local_159) == 0)))
            {
                local_159 = EObjectiveGuideDisplayState(2);
                local_184 = local_224;
            }
        }
        TargetLevelInfo = local_184;
        return local_159;
    }
    if (int(ObjectiveConfig.Get().ObjectiveType) == 0)
    {
        FGuideConfig local_308;
        CastTo local_282;
        if (!(local_282.opCall()))
        {
            return EObjectiveGuideDisplayState(0);
        }
        if (local_308.GuideDataList.IsEmpty())
        {
            return EObjectiveGuideDisplayState(0);
        }
        if (!(ObjectiveUtils::CanStartObjectiveGuideInLevel(ObjectiveConfig, local_76)))
        {
            if (local_308.LevelInfo.IsSet())
            {
                TargetLevelInfo = local_308.LevelInfo;
                return EObjectiveGuideDisplayState(2);
            }
            return EObjectiveGuideDisplayState(0);
        }
        if (ObjectiveUtils::TryCalculateGuideDistance(ObjectiveConfig, PlayerEntity, Distance))
        {
            return EObjectiveGuideDisplayState(1);
        }
        return EObjectiveGuideDisplayState(0);
    }
    return EObjectiveGuideDisplayState(0);
}
bool IsCommissionObjective(const TDataObjectPtr<FObjectiveConfig> &inout ObjectiveConfig, TDataObjectPtr<FCommissionConfig> &out CommissionConfig)
{
    CastTo local_76;
    TDataObjectPtr<FObjectiveSingleConfig> local_100 = local_76.opCall();
    if (local_100)
    {
        if (!(local_100.Get().GetFinishCondition().IsSet()))
        {
            return false;
        }
        CastTo local_178;
        TDataObjectPtr<FConditionConfig> local_202 = local_178.opCall();
        if (!(local_202))
        {
            return false;
        }
        if (int(local_202.Get().CondType) == 1 && (local_202.Get().GetRefData().Num() > 0))
        {
            CastTo local_210;
            CommissionConfig = local_210.opCall();
        }
    }
    return CommissionConfig.IsSet();
}
UFUNCTION()
FText GetObjectiveDesc(const TDataObjectPtr<FObjectiveConfig> &inout ObjectiveConfig, const int ProgressValue = 0, const int FailProgressValue = 0)
{
    // body not fully recovered — stub [opcode-uncovered]
    FText __r; return __r;
}
UFUNCTION()
FText GetObjectiveProgress(const TDataObjectPtr<FObjectiveConfig> &inout ObjectiveConfig, const int ProgressValue = 0, const int FailProgressValue = 0)
{
    // body not fully recovered — stub [opcode-uncovered]
    FText __r; return __r;
}
FGuideContext CreateGuideContext(const FECSEntity &inout RequesterPlayer, const TDataObjectPtr<FLevelInfoConfig> &inout LevelInfo, const TDataObjectPtr<FObjectiveSingleConfig> &inout ObjectiveSingle, const int GuideIndex, const FGuideDataSourceConfig &inout InGuideDataSource, const TDataObjectPtr<FGuidePresentationConfig> &inout GuidePresentationConfig, const bool bClientAutoSelectIcon = false, const bool bShowGuidingPath = false)
{
    TArray<FInstancedStruct> local_218;
    FGuideDataSourceConfig local_76 = InGuideDataSource;
    local_76.SetObjectiveConfig(ObjectiveSingle);
    local_76.SetGuideIndex(GuideIndex);
    FGuideContext local_216 = FGuideContext(RequesterPlayer, local_76);
    local_216.SetLevelInfo(LevelInfo);
    local_216.SetGuidePresentationConfig(GuidePresentationConfig);
    local_216.SetbClientAutoSelectIcon(bClientAutoSelectIcon);
    local_216.SetbShowGuidingPath(bShowGuidingPath);
    if (GuideIndex >= 0 && (GuideIndex < local_218.Num()))
    {
        TConstRawPtr<FGuideDataBase> local_228 = FInstancedStruct::GetPtr(local_218[GuideIndex]).opCall();
        if (local_228)
        {
            if (local_228.Get().OverridePresentation.IsSet())
            {
                local_216.SetGuidePresentationConfig(local_228.Get().OverridePresentation);
            }
        }
    }
    return local_216;
}
bool CanStartObjectiveGuideInLevel(const TDataObjectPtr<FObjectiveConfig> &inout ObjectiveConfig, const TDataObjectPtr<FLevelInfoConfig> &inout LevelInfo = TDataObjectPtr<FLevelInfoConfig>())
{
    FGuideConfig local_58;
    if (int(ObjectiveConfig.Get().ObjectiveType) == 1)
    {
        return false;
    }
    CastTo local_32;
    TDataObjectPtr<FObjectiveSingleConfig> local_56 = local_32.opCall();
    if (local_58.GuideDataList.IsEmpty())
    {
        return false;
    }
    if (!(local_58.LevelInfo.IsSet()))
    {
        return true;
    }
    TDataObjectPtr<FLevelInfoConfig> local_106;
    if (LevelInfo.IsSet())
    {
        local_106 = LevelInfo;
    }
    else
    {
        local_106 = FLevelUtils::GetCurrentLevelInfoConfig(nullptr);
    }
    if (!(local_106.IsSet()))
    {
        return false;
    }
    return (local_106.Get().DataId == local_58.LevelInfo.Get().DataId);
}
TArray<uint> GetObjectiveStartedGuideUniqueIds(const FECSEntity &inout RequesterPlayer, const uint ObjectiveInstanceId, const TDataObjectPtr<FObjectiveConfig> &inout ObjectiveConfig)
{
    TArray<uint> local_4;
    if (!(ObjectiveConfig.IsSet()) || (int(ObjectiveConfig.Get().ObjectiveType) == 1))
    {
        return local_4;
    }
    CastTo local_38;
    TDataObjectPtr<FObjectiveSingleConfig> local_62 = local_38.opCall();
    FGuideConfig local_64;
    TArray<FInstancedStruct> local_66 = local_64.GuideDataList;
    if (local_66.IsEmpty())
    {
        return local_4;
    }
    int local_67 = 0;
    for (; local_67 < local_66.Num(); ++local_67)
    {
        int local_69 = ObjectiveUtils::ObjectiveInstanceIdToGuideUniqueId(ObjectiveInstanceId, local_67);
        if (GuideUtils::IsGuideStarted(local_69, RequesterPlayer))
        {
            local_4.Add(local_69);
        }
    }
    return local_4;
}
bool StartObjectiveGuide(const uint ObjectiveInstanceId, const FECSEntity &inout RequesterPlayer, const TDataObjectPtr<FGuidePresentationConfig> &inout GuidePresentationConfig, const FGuideDataSourceConfig &inout GuideDataSource = FGuideDataSourceConfig(), const bool bClientAutoSelectIcon = false, const bool bShowGuidingPath = false)
{
    bool local_148;
    FObjectiveInstance local_146;
    if (!(ObjectiveUtils::TryFindActivetedObjectiveInstance(ObjectiveInstanceId, local_146)))
    {
        return false;
    }
    if (!(local_146.ChildObjectiveMap.IsEmpty()))
    {
        for (auto& local_166 : local_146.ChildObjectiveMap)
        {
            int local_167 = local_166.GetValue();
            if (local_167 == 0)
            {
                continue;
            }
            if (ObjectiveUtils::StartObjectiveGuide(local_166.GetValue(), RequesterPlayer, GuidePresentationConfig, GuideDataSource, bClientAutoSelectIcon, bShowGuidingPath))
            {
            }
        }
        return true;
    }
    ObjectiveUtils::FindObjectiveConfig(int(local_146.ObjectiveId));
    CastTo local_244;
    TDataObjectPtr<FObjectiveSingleConfig> local_268 = local_244.opCall();
    FGuideConfig local_270;
    TArray<FInstancedStruct> local_272 = local_270.GuideDataList;
    if (local_272.IsEmpty())
    {
        return false;
    }
    local_148 = false;
    TDataObjectPtr<FLevelInfoConfig> local_322;
    if (local_270.LevelInfo.IsSet())
    {
        local_322 = local_270.LevelInfo;
    }
    else
    {
        local_322 = FLevelUtils::GetCurrentLevelInfoConfig(nullptr);
    }
    bool local_147 = local_270.LevelInfo.IsSet() && !((local_270.LevelInfo == FLevelUtils::GetCurrentLevelInfoConfig(nullptr).opImplConv()));
    bool local_395 = bShowGuidingPath && !(local_147);
    int local_447 = 0;
    for (; local_447 < local_272.Num(); ++local_447)
    {
        if (GuideUtils::TryStartGuide(ObjectiveUtils::ObjectiveInstanceIdToGuideUniqueId(ObjectiveInstanceId, local_447), ObjectiveUtils::CreateGuideContext(RequesterPlayer, local_322, local_268, local_447, GuideDataSource, GuidePresentationConfig, bClientAutoSelectIcon, local_395)))
        {
            bool local_273;
            local_148 = true;
            local_273 = false;
            continue;
        }
        XError(ELog(65), FString().Append("Failed to start guide ").Append(local_447).Append(" for objective ").Append(ObjectiveInstanceId));
    }
    return local_148;
}
bool StartObjectiveGuide(const uint ObjectiveInstanceId, const FECSEntity &inout RequesterPlayer, const EGuideStyleType GuideStyle)
{
    FGuideDataSourceConfig local_100;
    return ObjectiveUtils::StartObjectiveGuide(ObjectiveInstanceId, RequesterPlayer, GuideUtils::GetGuidePresentationConfig(EGuideStyleType(GuideStyle)), local_100, false, false);
}
void StopObjectiveGuide(const uint ObjectiveInstanceId, const FECSEntity &inout RequesterPlayer = ENTITY_NULL)
{
    TArray<FInstancedStruct> local_274;
    FObjectiveInstance local_146;
    if (!(ObjectiveUtils::TryFindActivetedObjectiveInstance(ObjectiveInstanceId, local_146)))
    {
        return;
    }
    if (!(local_146.ChildObjectiveMap.IsEmpty()))
    {
        for (auto& local_166 : local_146.ChildObjectiveMap)
        {
            int local_167 = local_166.GetValue();
            if (local_167 != 0)
            {
                ObjectiveUtils::StopObjectiveGuide(local_166.GetValue(), RequesterPlayer);
            }
        }
        return;
    }
    int local_217 = int(ObjectiveUtils::FindObjectiveConfig(int(local_146.ObjectiveId)).Get().ObjectiveType);
    CastTo local_248;
    TDataObjectPtr<FObjectiveSingleConfig> local_272 = local_248.opCall();
    int local_275 = 0;
    for (; local_275 < local_274.Num(); ++local_275)
    {
        if (!(GuideUtils::TryStopGuide((ObjectiveInstanceId * 100) + local_275, local_274[local_275], RequesterPlayer)))
        {
            XError(ELog(65), FString().Append("Failed to stop guide ").Append(local_275).Append(" for objective ").Append(ObjectiveInstanceId));
        }
    }
    return;
}
EObjectiveItemUIState ConvertObjectiveStatusToUIState(const EObjectiveStatus InStatus)
{
    switch (int(InStatus))
    {
    case 0:
    case 1:
    {
        return EObjectiveItemUIState(0);
    }
    case 2:
    {
        return EObjectiveItemUIState(1);
    }
    case 3:
    {
        return EObjectiveItemUIState(2);
    }
    default:
    {
    }
    }
    return EObjectiveItemUIState(0);
}
uint ConvertToCondModule(const EConditionUsage ConditionUsage)
{
    if (int(ConditionUsage) == 0)
    {
        XError(ELog(58), "ConvertToCondModule: Invalid usage 'None'");
        return 0;
    }
    int local_1 = int(ConditionUsage);
    return (local_1 - 1);
}
EConditionUsage ConvertToConditionUsage(const uint CondModule)
{
    int local_1 = CondModule + 1;
    if (local_1 >= 2)
    {
        XError(ELog(58), FString().Append("ConvertToConditionUsage CondModule=").Append(CondModule).Append(" is invalid"));
        return EConditionUsage(0);
    }
    return EConditionUsage(local_1);
}
void SendProgressUpdatedEvent(const FObjectiveInstance &inout ObjectiveInstance, const bool bIsFinish, const int NewProgressValue)
{
    FFPTime local_8 = FFPTime(-1);
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    FCE_ObjectiveProgressUpdated local_12;
    local_12.ObjectiveInstanceId = int(ObjectiveInstance.InstanceId);
    local_12.ObjectiveId = int(ObjectiveInstance.ObjectiveId);
    local_12.bIsFinishProgress = bIsFinish;
    local_12.NewProgressValue = NewProgressValue;
    return;
}
bool TryFindConditionValueIndex(const FPbDsPlayerConditionInfo &inout CondtionInfo, const FObjectiveConditionInfo &inout ObjectiveConditionInfo, uint &out Index)
{
    Index = 0;
    int local_5 = ObjectiveUtils::ConvertToCondModule(ObjectiveConditionInfo.ConditionIdentifier.ConditionUsage);
    int local_6 = 0;
    for (; local_6 < CondtionInfo.GetDsCondValues_Num(); ++local_6)
    {
        FPbConditionInfo local_18 = CondtionInfo.GetDsCondValues_Index(local_6);
        if (local_18.GetCondModule() != local_5)
        {
            continue;
        }
        if (local_18.GetConditionId() != ObjectiveConditionInfo.ConditionIdentifier.ConditionId)
        {
            continue;
        }
        if (local_18.GetModuleInnerId() != ObjectiveConditionInfo.ConditionIdentifier.UniqueIdForUsage)
        {
            continue;
        }
        Index = local_6;
        return true;
    }
    return false;
}
void HandleGSConditionProgressNotify(const FECSEntity &inout PlayerEntity, const TArray<FPbUint32Pair> &inout GsCondValues, const TArray<FPbConditionInfo> &inout GsEventValues)
{
    int local_10 = 0;
    FFPTime local_6 = FFPTime(-1);
    for (auto& local_26 : GsCondValues)
    {
        local_10.GSConditionValueMap.Add(local_26.GetFirst(), local_26.GetSecond());
        XLog(ELog(65), FString().Append("HandleGSConditionProgressNotify ").Append(PlayerEntity).Append(" CondId=").Append(local_26.GetFirst()).Append(" CondValue=").Append(local_26.GetSecond()));
    }
    for (auto& local_48 : GsEventValues)
    {
        int local_49 = int(ObjectiveUtils::ConvertToConditionUsage(local_48.GetCondModule()));
        if (local_49 == 0)
        {
            XError(ELog(65), FString().Append("HandleGSConditionProgressNotify ").Append(PlayerEntity).Append(" ").Append(local_48.GetCondModule()).Append(" is invalid"));
            continue;
        }
        FConditionIdentifier local_56 = FConditionIdentifier(local_48.GetConditionId(), local_48.GetModuleInnerId(), EConditionUsage(local_49));
        if (local_10.GSEventValueMap.Contains(local_56))
        {
            XError(ELog(65), FString().Append("HandleGSConditionProgressNotify ").Append(PlayerEntity).Append(" ").Append(local_49).Append(" CondId=").Append(local_48.GetConditionId()).Append(" CondValue=").Append(local_48.GetValue()).Append(" already exists"));
            continue;
        }
        local_10.GSEventValueMap.Add(local_56, local_48.GetValue());
        XLog(ELog(65), FString().Append("HandleGSConditionProgressNotify ").Append(PlayerEntity).Append(" ").Append(local_49).Append(" CondId=").Append(local_48.GetConditionId()).Append(" CondValue=").Append(local_48.GetValue()));
    }
    return;
}
void SaveDsCondValue(FPbDsPlayerConditionInfo &inout CondtionInfo, const FObjectiveConditionInfo &inout ObjectiveConditionInfo)
{
    if (!(ObjectiveConditionInfo.IsSet()))
    {
        return;
    }
    if (int(ObjectiveConditionInfo.ProgressValue) == 0)
    {
        return;
    }
    if (ObjectiveConditionInfo.IsGSCondition())
    {
        return;
    }
    XLog(ELog(65), FString().Append("SaveDsCondValue ").Append(ObjectiveConditionInfo));
    FPbConditionInfo local_20 = CondtionInfo.AddDsCondValues();
    local_20.SetCondModule(ObjectiveUtils::ConvertToCondModule(ObjectiveConditionInfo.ConditionIdentifier.ConditionUsage));
    local_20.SetConditionId(ObjectiveConditionInfo.ConditionIdentifier.ConditionId);
    local_20.SetModuleInnerId(ObjectiveConditionInfo.ConditionIdentifier.UniqueIdForUsage);
    local_20.SetValue(ObjectiveConditionInfo.ProgressValue);
    return;
}
void SaveObjectiveDSConditionValue(const FECSEntity &inout PlayerEntity, const EConditionUsage ConditionUsage, FPbDsPlayerInfo &inout PlayerInfo)
{
    int local_25;
    if (!(PlayerInfo.IsValid()))
    {
        return;
    }
    int local_2 = ObjectiveUtils::ConvertToCondModule(EConditionUsage(ConditionUsage));
    FPbDsPlayerConditionInfo local_14 = PlayerInfo.GetConditionInfo();
    local_25 = local_14.GetDsCondValues_Num();
    int local_28 = local_25 - 1;
    for (; local_28 >= 0; --local_28)
    {
        if (local_14.GetDsCondValues_Index(local_28).GetCondModule() != local_2)
        {
            continue;
        }
        local_14.RemoveDsCondValues_Index(local_28);
    }
    FECSWorldPtr local_50 = ECS::GetECSWorld();
    Get local_54;
    const FCS_ObjectiveManager& local_56 = local_54.opCall();
    if (local_56)
    {
        for (auto& local_74 : local_56.ActiveObjectives)
        {
            const FObjectiveInstance& local_76 = local_74.GetValue();
            if ((!((local_76.Context.ContextEntity == PlayerEntity))))
            {
                continue;
            }
            if (int(local_76.Context.ConditionUsage) != int(ConditionUsage))
            {
                continue;
            }
            ObjectiveUtils::SaveDsCondValue(local_14, local_76.FinishConditionInfo);
            ObjectiveUtils::SaveDsCondValue(local_14, local_76.FailConditionInfo);
        }
    }
    return;
}
bool GroupContainsChildInstance(const FObjectiveInstance &inout GroupInstance, const uint ChildInstanceId)
{
    for (auto& local_20 : GroupInstance.ChildObjectiveMap)
    {
        if (local_20.GetValue() == ChildInstanceId)
        {
            return true;
        }
    }
    return false;
}
uint TryActivateNextSequenceChild(const uint GroupInstanceId, const FObjectiveContext &inout Context)
{
    FObjectiveInstance local_146;
    int local_236 = 0;
    int local_386;
    if (!(ObjectiveUtils::TryFindActivetedObjectiveInstance(GroupInstanceId, local_146)))
    {
        return 0;
    }
    if (int(local_146.FinishType) != 2)
    {
        return 0;
    }
    if (int(local_146.Status) != 1)
    {
        return 0;
    }
    ObjectiveUtils::FindObjectiveConfig(int(local_146.ObjectiveId));
    CastTo local_204;
    TDataObjectPtr<FObjectiveGroupConfig> local_228 = local_204.opCall();
    if (!(local_228.IsSet()))
    {
        return 0;
    }
    FECSWorldPtr local_230 = ECS::GetECSWorld();
    if (!(local_236))
    {
        return 0;
    }
    const TArray<TDataObjectPtr<FObjectiveSingleConfig>>& local_238 = local_228.Get().GetChildObjectives();
    FObjectiveInstance local_384;
    if (!(local_236.ActiveObjectives.Find(GroupInstanceId, local_384)))
    {
        return 0;
    }
    int local_385 = 0;
    for (; local_385 < local_238.Num(); ++local_385)
    {
        int local_148 = local_238[local_385].Get().DataId;
        local_386 = local_148;
        int local_387 = 0;
        if (!(local_384.ChildObjectiveMap.Find(local_386, local_387)))
        {
            continue;
        }
        if (local_387 != 0)
        {
            continue;
        }
        if (local_385 > 0)
        {
            int local_388;
            local_148 = local_238[(local_385 - 1)].Get().DataId;
            local_388 = local_148;
            int local_389 = 0;
            if (!(local_384.ChildObjectiveMap.Find(local_388, local_389)))
            {
                return 0;
            }
            if (local_389 == 0)
            {
                return 0;
            }
            FObjectiveInstance local_536;
            if (!(local_236.ActiveObjectives.Find(local_389, local_536)))
            {
                XWarning(ELog(65), FString().Append("TryActivateNextSequenceChild: prev instance ").Append(local_389).Append(" not found in ActiveObjectives"));
                return 0;
            }
            if (int(local_536.Status) != 2)
            {
                return 0;
            }
        }
        CastTo local_546;
        local_148 = ObjectiveUtils::ActivateObjective(local_546.opCall(), Context);
        if (local_148 == 0)
        {
            return 0;
        }
        if (!(local_236.ActiveObjectives.Contains(GroupInstanceId)))
        {
            XWarning(ELog(65), FString().Append("TryActivateNextSequenceChild: group instance ").Append(GroupInstanceId).Append(" lost after ActivateObjective"));
            return 0;
        }
        local_236.ActiveObjectives[GroupInstanceId].ChildObjectiveMap[local_386] = local_148;
        XLog(ELog(65), FString().Append("Sequence next child activated: Group(").Append(GroupInstanceId).Append(") ChildData=").Append(local_238[local_385].GetDataName()).Append(" NewInstance=").Append(local_148));
        return local_148;
    }
    int local_389_2 = 0;
    return local_389_2;
}
uint AddChildToObjectiveGroup(const uint GroupInstanceId, const TDataObjectPtr<FObjectiveSingleConfig> &inout ChildConfig)
{
    int local_228 = 0;
    if (!(ChildConfig.IsSet()))
    {
        return 0;
    }
    FObjectiveInstance local_148;
    if (!(ObjectiveUtils::TryFindActivetedObjectiveInstance(GroupInstanceId, local_148)))
    {
        XError(ELog(65), FString().Append("AddChildToObjectiveGroup: group instance ").Append(GroupInstanceId).Append(" not found"));
        return 0;
    }
    if (int(local_148.Status) != 1)
    {
        XError(ELog(65), FString().Append("AddChildToObjectiveGroup: group ").Append(GroupInstanceId).Append(" is not Activated"));
        return 0;
    }
    TDataObjectPtr<FObjectiveConfig> local_180 = ObjectiveUtils::FindObjectiveConfig(int(local_148.ObjectiveId));
    if (!(local_180.IsSet()) || (int(local_180.Get().ObjectiveType) != 1))
    {
        XError(ELog(65), FString().Append("AddChildToObjectiveGroup: instance ").Append(GroupInstanceId).Append(" is not an ObjectiveGroup"));
        return 0;
    }
    if ((int(local_148.FinishType) != 0 && (int(local_148.FinishType) != 1)))
    {
        XError(ELog(65), FString().Append("AddChildToObjectiveGroup: Sequence group not supported"));
        return 0;
    }
    int local_2 = ChildConfig.Get().DataId;
    int local_208 = local_2;
    if (local_148.ChildObjectiveMap.Contains(local_208))
    {
        XError(ELog(65), FString().Append("AddChildToObjectiveGroup: child DataId ").Append(local_208).Append(" already exists in group ").Append(GroupInstanceId));
        return 0;
    }
    FObjectiveContext local_214;
    CastTo local_220;
    int local_2_2 = ObjectiveUtils::ActivateObjective(local_220.opCall(), local_214);
    if (local_2_2 == 0)
    {
        return 0;
    }
    FECSWorldPtr local_222 = ECS::GetECSWorld();
    if (!(local_228))
    {
        return 0;
    }
    if (!(local_228.ActiveObjectives.Contains(GroupInstanceId)))
    {
        XError(ELog(65), FString().Append("AddChildToObjectiveGroup: group instance ").Append(GroupInstanceId).Append(" lost after ActivateObjective"));
        return 0;
    }
    local_228.ActiveObjectives[GroupInstanceId].ChildObjectiveMap.Add(local_208, local_2_2);
    XLog(ELog(65), FString().Append("AddChildToObjectiveGroup: Group(").Append(GroupInstanceId).Append(") ChildData=").Append(ChildConfig.GetDataName()).Append(" NewInstance=").Append(local_2_2));
    FFPTime local_236 = FFPTime(-1);
    FECSWorldPtr local_222_2 = ECS::GetECSWorld();
    FCE_ObjectiveGroupNewChildActivated local_238;
    local_238.GroupInstanceId = GroupInstanceId;
    local_238.NewChildInstanceId = local_2_2;
    return local_2_2;
}
bool RecoverDsConditionValue(const FPbDsPlayerConditionInfo &inout CondtionInfo, FObjectiveConditionInfo &inout ObjectiveConditionInfo)
{
    int local_2;
    if (!(ObjectiveConditionInfo.IsSet()))
    {
        return false;
    }
    if (ObjectiveConditionInfo.IsGSCondition())
    {
        return false;
    }
    if (!(ObjectiveUtils::TryFindConditionValueIndex(CondtionInfo, ObjectiveConditionInfo, local_2)))
    {
        return false;
    }
    FPbConditionInfo local_12 = CondtionInfo.GetDsCondValues_Index(local_2);
    if (!(ObjectiveConditionInfo.ConditionHandle.IsValid()))
    {
        return false;
    }
    ObjectiveConditionInfo.ProgressValue = local_12.GetValue();
    XLog(ELog(65), FString().Append("RecoverDsConditionValue ").Append(ObjectiveConditionInfo.ToString()));
    ConditionUtils::SetLocalConditionValueForInstance(ObjectiveConditionInfo.ConditionHandle, int(ObjectiveConditionInfo.ProgressValue));
    return true;
}
void RecoverObjectiveConditionValue(const FECSEntity &inout PlayerEntity, const EConditionUsage ConditionUsage, const FPbDsPlayerInfo &inout PlayerInfo)
{
    FPbDsPlayerConditionInfo local_10 = PlayerInfo.GetConditionInfo();
    if (local_10.GetGsCondValues_Num() > 0 || (local_10.GetGsEventValues_Num() > 0))
    {
        TArray<FPbUint32Pair> local_28;
        local_10.GetGsCondValues(local_28);
        TArray<FPbConditionInfo> local_32;
        local_10.GetGsEventValues(local_32);
        XLog(ELog(65), FString().Append("RecoverConditionValue ").Append(PlayerEntity).Append(" ").Append(ConditionUsage).Append(" GsCondNum=").Append(local_28.Num()).Append(" GsEventNum=").Append(local_32.Num()));
        ObjectiveUtils::HandleGSConditionProgressNotify(PlayerEntity, local_28, local_32);
    }
    if (local_10.GetDsCondValues_Num() > 0)
    {
        XLog(ELog(65), FString().Append("RecoverConditionValue ").Append(PlayerEntity).Append(" ").Append(ConditionUsage).Append(" DsCondNum=").Append(local_10.GetDsCondValues_Num()));
        FECSWorldPtr local_42 = ECS::GetECSWorld();
        Modify local_46;
        FCS_ObjectiveManager& local_48 = local_46.opCall();
        if (local_48)
        {
            for (auto& local_66 : local_48.ActiveObjectives)
            {
                FObjectiveInstance& local_68 = local_66.GetValue();
                if ((!((local_68.Context.ContextEntity == PlayerEntity))))
                {
                    continue;
                }
                if (int(local_68.Context.ConditionUsage) != int(ConditionUsage))
                {
                    continue;
                }
                if (ObjectiveUtils::RecoverDsConditionValue(local_10, local_68.FinishConditionInfo))
                {
                    ObjectiveUtils::SendProgressUpdatedEvent(local_68, true, local_68.GetFinishProgressValue());
                }
                if (ObjectiveUtils::RecoverDsConditionValue(local_10, local_68.FailConditionInfo))
                {
                    ObjectiveUtils::SendProgressUpdatedEvent(local_68, false, local_68.GetFailProgressValue());
                }
            }
        }
    }
    return;
}
}

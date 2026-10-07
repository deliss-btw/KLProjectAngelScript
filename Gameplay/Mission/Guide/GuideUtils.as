

namespace GuideUtils
{
struct FOpenMapData
{
    UPROPERTY()
    FVector2D MinimapCenter;
    UPROPERTY()
    TDataObjectPtr<FLevelInfoConfig> LevelInfoConfig;

    FOpenMapData()
    {
        return;
    }
}

bool IsGuideStarted(const uint CustomUniqueId, const FECSEntity &inout RequesterPlayer)
{
    if (RequesterPlayer.IsValid())
    {
        Get local_6;
        const FC_GuidingInfoList& local_8 = local_6.opCall();
        if (local_8)
        {
            return local_8.GetGuideInfoMap().Contains(CustomUniqueId);
        }
    }
    return false;
}
bool TryGetGuideBehavior(const FInstancedStruct &inout GuideData, UGuideBehavior &inout OutGuideBehavior)
{
    if (FInstancedStruct::GetPtr(GuideData).opCall())
    {
        UGuideBehavior local_12;
        OutGuideBehavior = local_12;
        return true;
    }
    return false;
}
bool TryFindGuideTargetEntity(const FECSEntity &inout PlayerEntity, const uint CustomUniqueId, FECSEntity &out GuideTargetEntity)
{
    FECSEntity local_4;
    GuideTargetEntity = local_4;
    Get local_8;
    const FC_GuidingInfoList& local_10 = local_8.opCall();
    if (local_10)
    {
        FGuideContext local_152;
        if (local_10.GetGuideInfoMap().Find(CustomUniqueId, local_152))
        {
            GuideTargetEntity = local_152.GetPrimaryTargetEntity();
            return true;
        }
    }
    return false;
}
bool TryFindGuideContext(const FECSEntity &inout PlayerEntity, const uint CustomUniqueId, FGuideContext &out GuideContext)
{
    FGuideContext local_140;
    GuideContext = local_140;
    Get local_144;
    const FC_GuidingInfoList& local_146 = local_144.opCall();
    if (local_146)
    {
        return local_146.GetGuideInfoMap().Find(CustomUniqueId, GuideContext);
    }
    return false;
}
bool TryStartGuide(const uint CustomUniqueId, const FGuideContext &inout Context)
{
    int local_18 = 0;
    if (!(Context.GetRequesterEntity().IsValid()))
    {
        XError(ELog(62), FString().Append("Failed to start guide for custom unique id ").Append(CustomUniqueId).Append(", requester entity is not valid"));
        return false;
    }
    if (!(Context.GetGuideData().IsValid()))
    {
        XError(ELog(62), FString().Append("Failed to start guide for custom unique id ").Append(CustomUniqueId).Append(", guide data is not valid"));
        return false;
    }
    if (GuideUtils::IsGuideStarted(CustomUniqueId, Context.GetRequesterEntity()))
    {
        XWarning(ELog(62), FString().Append("Guide already started for custom unique id ").Append(CustomUniqueId));
        return true;
    }
    local_18.GuideToStart.Add(CustomUniqueId, Context);
    return true;
}
bool StopGuideForPlayer(const uint CustomUniqueId, const FInstancedStruct &inout GuideData, const FECSEntity &inout PlayerEntity)
{
    int local_8 = 0;
    if (!(PlayerEntity.IsValid()))
    {
        return false;
    }
    if (local_8.GuideToStart.Contains(CustomUniqueId))
    {
        XLog(ELog(62), FString().Append("Remove guide from GuideToStart to stop guide id ").Append(CustomUniqueId).Append(" for player ").Append(PlayerEntity.GetEntityName()));
    }
    else
    {
        if (GuideUtils::IsGuideStarted(CustomUniqueId, PlayerEntity))
        {
            if (!(local_8.GuideToStop.Contains(CustomUniqueId)))
            {
                local_8.GuideToStop.Add(CustomUniqueId, GuideData);
            }
            else
            {
                XLog(ELog(62), FString().Append("guide id ").Append(CustomUniqueId).Append(" already in GuideToStop for player ").Append(PlayerEntity.GetEntityName()));
            }
        }
    }
    Modify local_20;
    FC_DeferredGuideList& local_22 = local_20.opCall();
    if (local_22)
    {
        if (local_22.DeferredGuides.IsEmpty())
        {
            Remove local_26;
            local_26.opCall();
        }
    }
    return true;
}
bool TryStopGuide(const uint CustomUniqueId, const FInstancedStruct &inout GuideData, const FECSEntity &inout RequesterEntity = ENTITY_NULL)
{
    if (RequesterEntity.IsValid())
    {
        return GuideUtils::StopGuideForPlayer(CustomUniqueId, GuideData, RequesterEntity);
    }
    TArray<FECSEntity> local_6;
    FECSWorldPtr local_8 = ECS::GetECSWorld();
    Modify local_12;
    FCS_GuideManager& local_14 = local_12.opCall();
    if (local_14)
    {
        XLog(ELog(62), FString().Append("Stop guide id ").Append(CustomUniqueId).Append(" for all players by GuideManager"));
        FGuideRuntimeInfoContainer local_24;
        if (local_14.GuideInfoMap.Find(CustomUniqueId, local_24))
        {
            auto local_30 = local_24.Requesters.Iterator();
            for (; local_30.CanProceed;)
            {
                FECSEntity local_38 = local_30.Proceed();
                GuideUtils::StopGuideForPlayer(CustomUniqueId, GuideData, local_38);
                local_6.Add(local_38);
            }
        }
    }
    XLog(ELog(62), FString().Append("Stop guide id ").Append(CustomUniqueId).Append(" for all players by World View"));
    FECSRuntimeView local_78 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
    Include local_82;
    local_82.opCall();
    FECSRuntimeViewIterator local_116 = local_78.Iterator();
    for (; local_116.CanProceed;)
    {
        FECSEntity local_38_2 = local_116.Proceed();
        if (local_6.Contains(local_38_2))
        {
            continue;
        }
        GuideUtils::StopGuideForPlayer(CustomUniqueId, GuideData, local_38_2);
    }
    return true;
}
bool TryFindGuideContextBySource(const FECSEntity &inout PlayerEntity, const FGuideDataSourceConfig &inout DataSource, FGuideContext &out Context)
{
    FDataObjectPtr local_240;
    FGuideContext local_140;
    Context = local_140;
    if (!(DataSource.GetObjectiveConfig()))
    {
        return false;
    }
    Get local_146;
    const FC_GuidingInfoList& local_148 = local_146.opCall();
    if (local_148)
    {
        for (auto& local_166 : local_148.GetGuideInfoMap())
        {
            local_166;
            const FGuideDataSourceConfig& local_168 = GetDataSourceConfig();
            TDataObjectPtr<FObjectiveSingleConfig> local_192;
            local_192 = local_168.GetObjectiveConfig();
            local_240;
            if ((local_192 == local_240) && (local_168.GetGuideIndex() == DataSource.GetGuideIndex()))
            {
                return true;
            }
        }
    }
    return false;
}
bool TryCalculateGuideDistance(const FInstancedStruct &inout GuideData, const FECSEntity &inout PlayerEntity, float &out Distance)
{
    UGuideBehavior local_16;
    Distance = 0.0;
    if (FInstancedStruct::GetPtr(GuideData).opCall())
    {
        if (local_16 != nullptr)
        {
            return local_16.TryCalculateDistance(GuideData, PlayerEntity, Distance);
        }
    }
    XError(ELog(62), FString().Append("Failed to calculate distance for guide, guide data is not valid"));
    return false;
}
bool ShouldShowGuideOnTargetLevelMinimap(const FGuideContext &inout GuideInfo, const TDataObjectPtr<FLevelInfoConfig> &inout CurrentLevelInfo)
{
    bool local_1 = !(GuideInfo.GetLevelInfo().IsSet());
    if (local_1)
    {
        local_1 = true;
    }
    else
    {
        FDataObjectPtr local_74;
        TDataObjectPtr<FLevelInfoConfig> local_26;
        local_26 = GuideInfo.GetLevelInfo();
        local_74 = CurrentLevelInfo.opImplConv();
        local_1 = (local_26 == local_74);
    }
    if (local_1)
    {
        return true;
    }
    bool local_1_2 = CommissionUtils::GetCurrentCommissionConfig().IsSet();
    if (local_1_2)
    {
        return false;
    }
    bool local_1_3 = CurrentLevelInfo.IsSet() && GetMapConfig().IsSet();
    if (!(local_1_3))
    {
        local_1_3 = false;
    }
    else
    {
        FDataObjectPtr local_74;
        TDataObjectPtr<FMapConfig> local_124;
        local_124 = GetMapConfig();
        local_74;
        local_1_3 = (local_124 == local_74);
    }
    if (local_1_3)
    {
        return true;
    }
    return false;
}
void OpenMinimap(const FVector &inout CenterWorldPosition)
{
    GuideUtils::FOpenMapData local_28;
    local_28.MinimapCenter = MinimapUtils::GamePositionToMapPosition(CenterWorldPosition);
    Make local_46;
    if (!(ECSWorldLifetimePage::Open(GameplayTags::UI_Type_Minimap, local_46.opImplConv()).IsValid()))
    {
        XError(ELog(62), FString().Append("Failed to open minimap, widget tag=").Append(GameplayTags::UI_Type_Minimap));
    }
    return;
}
void OpenRegionMap(const TDataObjectPtr<FLevelInfoConfig> &inout LevelInfoConfig)
{
    GuideUtils::FOpenMapData local_28;
    TDataObjectPtr<FLevelInfoConfig> local_78;
    if (LevelInfoConfig)
    {
        local_78 = LevelInfoConfig;
    }
    else
    {
        local_78 = FLevelUtils::GetCurrentLevelInfoConfig(nullptr);
    }
    local_28.LevelInfoConfig = local_78;
    Make local_140;
    if (!(ECSWorldLifetimePage::Open(GameplayTags::UI_Type_RegionMap, local_140.opImplConv()).IsValid()))
    {
        XError(ELog(62), FString().Append("Failed to open region map, widget tag=").Append(GameplayTags::UI_Type_RegionMap));
    }
    return;
}
TDataObjectPtr<FGuidePresentationConfig> GetGuidePresentationConfig(const EGuideStyleType GuideStyle)
{
    const UGuideSettings local_2;
    GetGameplaySettings<UGuideSettings> local_4;
    local_2 = local_4;
    if (local_2.GuidePresentationSettings.Contains(GuideStyle))
    {
        return local_2.GuidePresentationSettings[GuideStyle];
    }
    XError(ELog(65), FString().Append("GetGuidePresentationConfig: GuideStyle ").Append(GuideStyle).Append(" not found"));
    return TDataObjectPtr<FGuidePresentationConfig>();
}
}

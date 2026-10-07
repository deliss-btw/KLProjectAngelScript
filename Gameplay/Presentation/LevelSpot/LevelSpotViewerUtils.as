
namespace LevelSpotViewerUtils
{
void RemoveSpotFromViewers(const FLevelSpotId &inout SpotId, const FLevelSpotViewers &inout Viewers)
{
    if (Viewers.IsEmpty())
    {
        return;
    }
    for (auto& local_20 : LevelSpotViewerUtils::ParseViewersArray(Viewers))
    {
        local_20;
        Modify local_24;
        FC_LevelSpotPlayerViewer& local_26 = local_24.opCall();
        if (local_26)
        {
            local_26.GetViewerData().RemoveSpot(SpotId);
            continue;
        }
        Modify local_30;
        FC_LevelSpotTeamViewer& local_32 = local_30.opCall();
        if (local_32)
        {
            local_32.GetViewerData().RemoveSpot(SpotId);
        }
    }
    return;
}
void AddEntitySpotToViewers(const FLevelSpotId &inout SpotId, const FLevelSpotInfo &inout SpotInfo, const FECSEntity &inout OwnerEntity)
{
    for (auto& local_42 : LevelSpotViewerUtils::ParseViewersArray(SpotInfo.GetAllViewers()))
    {
        LevelSpotViewerUtils::TryAddEntitySpotToSpecifiedViewer(SpotId, SpotInfo, local_42, OwnerEntity);
    }
    return;
}
bool TryAddEntitySpotToSpecifiedViewer(const FLevelSpotId &inout SpotId, const FLevelSpotInfo &inout SpotInfo, const FECSEntity &inout Viewer, const FECSEntity &inout OwnerEntity)
{
    if (!(Viewer.IsValid()))
    {
        return false;
    }
    FLevelSpotData local_128 = SpotInfo.GetDataForViewer(Viewer);
    if (local_128)
    {
        Has local_258;
        bool local_1 = local_258.opCall();
        if (local_1)
        {
            ModifyOrAdd local_262;
            FC_LevelSpotPlayerViewer& local_264 = local_262.opCall();
            if (local_264)
            {
                local_264.GetViewerData().AddEntitySpot(SpotId, local_128, OwnerEntity.GetId());
            }
        }
        else
        {
            Has local_270;
            bool local_1_2 = local_270.opCall();
            if (local_1_2)
            {
                ModifyOrAdd local_274;
                FC_LevelSpotTeamViewer& local_276 = local_274.opCall();
                if (local_276)
                {
                    local_276.GetViewerData().AddEntitySpot(SpotId, local_128, OwnerEntity.GetId());
                }
            }
            else
            {
                XError(ELog(69), FString().Append("Failed to add spot ").Append(SpotId.ToString()).Append(" to viewer entity ").Append(Viewer.ToString()).Append(", the viewer entity is not a player or team."));
            }
        }
        return true;
    }
    return false;
}
void AddPositionSpotToViewers(const FLevelSpotId &inout SpotId, const FLevelSpotInfo &inout SpotInfo, const FVector &inout Position)
{
    for (auto& local_42 : LevelSpotViewerUtils::ParseViewersArray(SpotInfo.GetAllViewers()))
    {
        FLevelSpotData local_168 = SpotInfo.GetDataForViewer(local_42);
        if (local_168)
        {
            Has local_298;
            bool local_39 = local_298.opCall();
            if (local_39)
            {
                ModifyOrAdd local_302;
                FC_LevelSpotPlayerViewer& local_304 = local_302.opCall();
                if (local_304)
                {
                    local_304.GetViewerData().AddPositionSpot(SpotId, local_168, Position);
                }
            }
            else
            {
                Has local_308;
                local_39 = local_308.opCall();
                if (local_39)
                {
                    ModifyOrAdd local_312;
                    FC_LevelSpotTeamViewer& local_314 = local_312.opCall();
                    if (local_314)
                    {
                        local_314.GetViewerData().AddPositionSpot(SpotId, local_168, Position);
                    }
                }
                else
                {
                    XError(ELog(69), FString().Append("Failed to add spot ").Append(SpotId.ToString()).Append(" to viewer entity ").Append(local_42.ToString()).Append(", the viewer entity is not a player or team."));
                }
            }
        }
    }
    return;
}
TArray<FECSEntity> ParseViewersArray(const FLevelSpotViewers &inout Viewers)
{
    TArray<FECSEntity> local_4;
    if (Viewers.TryGetFiniteViewers(local_4))
    {
        int local_9 = local_4.Num() - 1;
        for (; local_9 >= 0; --local_9)
        {
            if (!(local_4[local_9].IsValid()))
            {
                local_4.RemoveAt(local_9);
            }
        }
        return local_4;
    }
    FECSWorldPtr local_12 = ECS::GetECSWorld();
    Get local_16;
    const FCS_LevelSpotViewerSummary& local_18 = local_16.opCall();
    if (local_18)
    {
        for (auto& local_36 : local_18.AllViewers)
        {
            if (local_36.IsValid() && Viewers.HasViewer(local_36))
            {
                local_4.Add(local_36);
            }
        }
    }
    return local_4;
}
TArray<FECSEntity> GetPlayerViewerEntities(const FECSEntity &inout Player)
{
    TArray<FECSEntity> local_4;
    Has local_8;
    bool local_9 = local_8.opCall();
    if (local_9)
    {
        local_4.Add(Player);
    }
    FECSEntity local_14 = FTeamUtils::GetTeamEntityForController(Player);
    if (local_14)
    {
        local_4.Add(local_14);
    }
    return local_4;
}
FLevelSpotViewers GetViewersFromNetRelevanceMask(const FNetPlayerMask &inout Mask)
{
    FLevelSpotViewers __r;
    if (Mask.IsEmpty())
    {
    }
    else
    {
        TArray<FECSEntity> local_6;
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        Get local_12;
        const FCS_LevelSpotViewerSummary& local_14 = local_12.opCall();
        if (local_14)
        {
            for (auto& local_32 : local_14.AllViewers)
            {
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                Get local_36;
                const FC_PlayerController& local_38 = local_36.opCall();
                if (local_38)
                {
                    if (Mask.GetBit(local_38.GetPlayerIndex()))
                    {
                        local_6.Add(local_32);
                    }
                }
            }
        }
        if (local_6.IsEmpty())
        {
        }
        else
        {
            FLevelSpotViewers local_62 = FLevelSpotViewers(local_6);
        }
    }
    return __r;
}
FLevelSpotViewers GetNetRelevantViewers(const FECSEntity &inout Entity)
{
    FLevelSpotViewers __r;
    Get local_4;
    const FC_NetRelevance& local_6 = local_4.opCall();
    if (local_6)
    {
        LevelSpotViewerUtils::GetViewersFromNetRelevanceMask(local_6.Mask);
    }
    else
    {
    }
    return __r;
}
FLevelSpotData GetLevelSpotDataFromSpotInfo(const FECSEntity &inout ViewerPlayer, const FLevelSpotInfo &inout SpotInfo)
{
    TArray<FECSEntity> local_4;
    FLevelSpotData __r;
    local_4.Add(ViewerPlayer);
    FECSEntity local_10 = FTeamUtils::GetTeamEntityForController(ViewerPlayer);
    if (local_10)
    {
        local_4.Add(local_10);
    }
    FLevelSpotData local_142 = SpotInfo.GetDataForAnyViewers(local_4);
    return __r;
}
const FLevelSpotData GetLevelSpotDataFromViewerData(const FLevelSpotViewerData &inout ViewerData, const FLevelSpotId &inout SpotId)
{
    const FLevelSpotData __r;
    TConstRawPtr<FEntityLevelSpotViewData> local_2 = ViewerData.GetEntitySpots().Find(SpotId);
    if (local_2)
    {
        return local_2.opArrow().GetData();
    }
    TConstRawPtr<FPositionLevelSpotViewData> local_8 = ViewerData.GetPositionSpots().Find(SpotId);
    if (local_8)
    {
        return local_8.opArrow().GetData();
    }
    return __r;
}
void GetTransformFromViewerData(const FECSEntity &inout ViewerPlayer, const FLevelSpotViewerData &inout ViewerData, const FLevelSpotId &inout SpotId, FPresentationSpotTransform &inout OutResult)
{
    OutResult = FPresentationSpotTransform();
    TConstRawPtr<FEntityLevelSpotViewData> local_10 = ViewerData.GetEntitySpots().Find(SpotId);
    if (local_10)
    {
        float32 local_25;
        FVector local_20;
        FVector2D local_24;
        if (AttributeSampleUtils::SamplePosition(ViewerPlayer, local_10.opArrow().GetOwnerEntityId(), local_20))
        {
            OutResult.SetPosition(local_20);
        }
        else
        {
            if (AttributeSampleUtils::SamplePosition2D(ViewerPlayer, local_10.opArrow().GetOwnerEntityId(), local_24))
            {
                OutResult.SetPosition2D(local_24);
            }
            else
            {
            }
        }
        FVector3f local_28;
        if (AttributeSampleUtils::SampleRotationAngle(ViewerPlayer, local_10.opArrow().GetOwnerEntityId(), local_25))
        {
            OutResult.SetAngle(local_25);
        }
        else
        {
            if (AttributeSampleUtils::SampleRotation(ViewerPlayer, local_10.opArrow().GetOwnerEntityId(), local_28))
            {
                OutResult.SetEulerRotation(local_28);
            }
        }
        return;
    }
    else
    {
        TConstRawPtr<FPositionLevelSpotViewData> local_30 = ViewerData.GetPositionSpots().Find(SpotId);
        if (local_30)
        {
            OutResult.SetPosition(local_30.opArrow().GetPosition());
            return;
        }
    }
}
}

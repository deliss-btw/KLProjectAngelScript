
namespace PositionLevelSpotUtils
{
FLevelSpotId CreateSpot(const FVector &inout Position, const FLevelSpotData &inout Data, const ELevelSpotDataSource ConfigSource = ELevelSpotDataSource::PositionSpot)
{
    FLevelSpotId __r;
    PositionLevelSpotUtils::CreateSpotForViewers(Position, FLevelSpotViewers::AllViewers, Data, ELevelSpotDataSource(ConfigSource));
    return __r;
}
FLevelSpotId CreateSpotForViewers(const FVector &inout Position, const FLevelSpotViewers &inout Viewers, const FLevelSpotData &inout Data, const ELevelSpotDataSource ConfigSource = ELevelSpotDataSource::PositionSpot)
{
    FLevelSpotId __r;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    ModifyOrAdd local_6;
    FCS_PositionLevelSpotManager& local_8 = local_6.opCall();
    if (local_8)
    {
        FLevelSpotId local_12 = FLevelSpotId::GenerateId();
        FLevelSpotInfo local_18;
        FLevelSpotOverrideInfo& local_20 = local_18.ModifyOrAddOverride(ELevelSpotDataSource(ConfigSource));
        local_20.SetData(Data);
        local_20.SetViewers(Viewers);
        local_8.LevelSpots.Add(local_12, local_18);
        LevelSpotViewerUtils::AddPositionSpotToViewers(local_12, local_18, Position);
    }
    else
    {
    }
    return __r;
}
void RemoveSpot(const FLevelSpotId &inout SpotId)
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Modify local_6;
    FCS_PositionLevelSpotManager& local_8 = local_6.opCall();
    if (local_8)
    {
        TRawPtr<FLevelSpotInfo> local_12 = local_8.LevelSpots.Find(SpotId);
        if (local_12)
        {
            LevelSpotViewerUtils::RemoveSpotFromViewers(SpotId, local_12.opArrow().GetAllViewers());
        }
    }
    return;
}
void ChangeSpotPosition(const FLevelSpotId &inout SpotId, const FVector &inout Position)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
}

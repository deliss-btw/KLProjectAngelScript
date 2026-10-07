
TDataObjectPtr<FLevelInfoConfig> GetLevelInfo(const FM_Spot &inout Spot, const FSpotViewAdapter &inout View = FSpotViewAdapter())
{
    if (!(Spot))
    {
        return TDataObjectPtr<FLevelInfoConfig>();
    }
    TEUIModelRef<FM_PresentationData_Teleporter> local_52 = GetTeleporterData(Spot, View);
    if (local_52)
    {
        if (local_52.opArrow().GetTeleporterConfig())
        {
            return local_52.opArrow().GetTeleporterConfig().opArrow().GetLevelInfoConfig();
        }
    }
    if (HasMissionData(Spot, View))
    {
        FMissionPresentationData local_152 = GetMissionData(Spot, View);
        if (local_152.LevelInfo)
        {
            return local_152.LevelInfo;
        }
    }
    if (GetPresentationConfig(Spot, View))
    {
        CastTo local_300;
        TDataObjectPtr<FNPCPresentationConfig> local_324 = local_300.opCall();
        if (local_324)
        {
            TDataObjectPtr<FNPCMainConfig> local_372;
            if (FMS_NPCSpotManager::Get(Spot.GetManager()).GetPresentationToMainConfig().Find(local_324, local_372))
            {
                return local_372.opArrow().GetWorldMapRegion();
            }
        }
    }
    return TDataObjectPtr<FLevelInfoConfig>();
}

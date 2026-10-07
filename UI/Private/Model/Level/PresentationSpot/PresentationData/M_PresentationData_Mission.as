

struct FMissionPresentationData
{
    UPROPERTY()
    FSoftBrush GuideIcon;
    UPROPERTY()
    TDataObjectPtr<FMissionConfig> MissionConfig;
    UPROPERTY()
    TDataObjectPtr<FLevelInfoConfig> LevelInfo;
    UPROPERTY()
    TWeakObjectPtr<AActor> GuideFXActor;

    FMissionPresentationData()
    {
        return;
    }
}

bool HasMissionData(const FM_Spot &inout Spot, const FSpotViewAdapter &inout View = FSpotViewAdapter())
{
    if (Spot)
    {
        return FInstancedStruct(PresentationDataUtils::GetPresentationData(Spot, EPresentationDataType(9), View)).IsValid();
    }
    return false;
}
FMissionPresentationData GetMissionData(const FM_Spot &inout Spot, const FSpotViewAdapter &inout View = FSpotViewAdapter())
{
    FMissionPresentationData __r;
    if (Spot)
    {
        if (FInstancedStruct(PresentationDataUtils::GetPresentationData(Spot, EPresentationDataType(9), View)).IsValid())
        {
            FInstancedStruct::GetPtr local_10;
            TConstRawPtr<FMissionPresentationData> local_12 = local_10.opCall();
        }
        else
        {
        }
    }
    return __r;
}
void AddMissionData(FM_Spot &inout Spot, const FMissionPresentationData &inout InMissionPresentationData, const TEUIModelRef<FM_SpotRegistry> &inout Registry = FEUIModelRef())
{
    bool local_9 = PresentationSpotUtils::GetDefaulted(Spot.GetManager(), Registry).HasPresentationData((TEUIModelRef<FM_Spot>(Spot)), EPresentationDataType(9));
    PresentationDataUtils::RemovePresentationData(Spot, EPresentationDataType(9), Registry);
    EPresentationDataType local_14;
    FInstancedStruct::Make(local_14);
    if (!(local_9))
    {
        Spot.AddDisplayScope(EPresentationSpotDisplayScope(0), EPresentationSpotDisplayScopeSource(0));
    }
    return;
}
void RemoveMissionData(FM_Spot &inout Spot, const TEUIModelRef<FM_SpotRegistry> &inout Registry = FEUIModelRef())
{
    if (Spot)
    {
        bool local_1 = PresentationSpotUtils::GetDefaulted(Spot.GetManager(), Registry).HasPresentationData((TEUIModelRef<FM_Spot>(Spot)), EPresentationDataType(9));
        PresentationDataUtils::RemovePresentationData(Spot, EPresentationDataType(9), Registry);
        if (local_1)
        {
            Spot.RemoveDisplayScope(EPresentationSpotDisplayScope(0), EPresentationSpotDisplayScopeSource(0));
        }
    }
    return;
}

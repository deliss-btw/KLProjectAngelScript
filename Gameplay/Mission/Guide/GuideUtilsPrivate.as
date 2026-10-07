

namespace GuideUtilsPrivate
{
struct FOpenMapWithSpotData
{
    UPROPERTY()
    TEUIModelRef<FM_Spot> Spot;
    UPROPERTY()
    TDataObjectPtr<FLevelInfoConfig> SpotLevel;

    FOpenMapWithSpotData()
    {
        return;
    }
}

void OpenRegionMap(const TEUIModelRef<FM_Spot> &inout Spot, const TDataObjectPtr<FLevelInfoConfig> &inout SpotLevel)
{
    if (!(Spot))
    {
        return;
    }
    GuideUtilsPrivate::FOpenMapWithSpotData local_28;
    local_28.Spot = Spot;
    local_28.SpotLevel = SpotLevel;
    Make local_66;
    if (!(ECSWorldLifetimePage::Open(GameplayTags::UI_Type_RegionMap, local_66.opImplConv()).IsValid()))
    {
        XError(ELog(62), FString().Append("Failed to open region map, widget tag=").Append(GameplayTags::UI_Type_RegionMap));
    }
    return;
}
}

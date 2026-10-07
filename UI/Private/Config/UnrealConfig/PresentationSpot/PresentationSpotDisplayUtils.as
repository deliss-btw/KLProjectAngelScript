

struct FPresentationSpotDisplayModelData
{
    UPROPERTY()
    TEUIModelRef<FM_Spot> Spot;
    UPROPERTY()
    EPresentationSpotUsage SpotUsage;


}

namespace PresentationSpotDisplayUtils
{
FSoftBrush GetSpotIcon(const TEUIModelRef<FM_Spot> &inout Spot, const EPresentationSpotUsage Usage)
{
    const UPresentationSpotDisplaySettings local_50;
    EPresentationSpotUsage local_56;
    const UPresentationSpotSettings local_174;
    if (!(Spot))
    {
        return FSoftBrush();
    }
    GetGameplaySettings<UPresentationSpotDisplaySettings> local_52;
    local_50 = local_52;
    if (local_50.DisplayConfigs.Find(Usage, local_56))
    {
        FSoftBrush local_48;
        local_48 = local_56.GetSpotIcon(Spot, FSpotViewAdapter(local_56.GetDesiredSpotView(Spot.opArrow().GetManager())));
        if (!(local_48.GetResourceObject().IsNull()))
        {
            return local_48;
        }
    }
    TDataObjectPtr<FPresentationConfig> local_148 = GetPresentationConfig(Spot.opArrow(), FSpotViewAdapter(PresentationSpotDisplayUtils::GetDesiredSpotView(Spot.opArrow().GetManager())));
    if (!(local_148))
    {
        GetGameplaySettings<UPresentationSpotSettings> local_176;
        local_174 = local_176;
        return local_174.NoConfigIcon;
    }
    return local_148.opArrow().GetDefaultIcon();
}
FMargin GetSpotIconPadding(const TEUIModelRef<FM_Spot> &inout Spot, const EPresentationSpotUsage Usage)
{
    const UPresentationSpotDisplaySettings local_8;
    EPresentationSpotUsage local_14;
    if (!(Spot))
    {
        return FMargin();
    }
    GetGameplaySettings<UPresentationSpotDisplaySettings> local_10;
    local_8 = local_10;
    if (local_8.DisplayConfigs.Find(Usage, local_14))
    {
        return local_14.GetSpotIconPadding(Spot, FSpotViewAdapter(local_14.GetDesiredSpotView(Spot.opArrow().GetManager())));
    }
    return FMargin();
}
FEUIModelContainer CreateDecoractor(const TEUIModelRef<FM_Spot> &inout Spot, const EPresentationSpotUsage SpotUsage)
{
    if (!(Spot))
    {
        return FEUIModelContainer();
    }
    FPresentationSpotDisplayModelData local_20;
    local_20.Spot = Spot;
    local_20.SpotUsage = SpotUsage;
    Make local_34;
    return local_34.opImplConv();
}
FSpotView GetDesiredSpotView(const UObject ContextObject, const EPresentationSpotUsage Usage)
{
    const UPresentationSpotDisplaySettings local_6;
    FSpotView __r;
    if (int(Usage) == 5)
    {
    }
    else
    {
        EPresentationSpotUsage local_12;
        GetGameplaySettings<UPresentationSpotDisplaySettings> local_8;
        local_6 = local_8;
        if (local_6.DisplayConfigs.Find(Usage, local_12))
        {
            FSpotView local_18 = local_12.GetDesiredSpotView(ContextObject);
        }
        else
        {
            FSpotView local_18_2 = PresentationSpotUtils::GetDefaultView(ContextObject);
        }
    }
    return __r;
}
}

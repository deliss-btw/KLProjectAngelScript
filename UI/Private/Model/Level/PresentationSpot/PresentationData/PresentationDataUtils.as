
namespace PresentationDataUtils
{
    const FInstancedStruct EmptyPresentationData = FInstancedStruct();

const FInstancedStruct& GetPresentationData(const FM_Spot &inout Spot, const EPresentationDataType DataType, const FSpotViewAdapter &inout View = FSpotViewAdapter())
{
    FSpotViewAdapter local_8;
    return (local_8.GetSpotView(Spot.GetManager()).GetPresentationData(Spot, local_8));
}
void AddPresentationData(FM_Spot &inout Spot, const EPresentationDataType DataType, const FInstancedStruct &inout Data, const TEUIModelRef<FM_SpotRegistry> &inout Registry = FEUIModelRef())
{
    TEUIModelRef<FM_Spot> local_4 = TEUIModelRef<FM_Spot>(Spot);
    UEUIManagerSubsystem local_2 = Spot.GetManager();
    return;
}
void RemovePresentationData(FM_Spot &inout Spot, const EPresentationDataType DataType, const TEUIModelRef<FM_SpotRegistry> &inout Registry = FEUIModelRef())
{
    if (Registry)
    {
        TEUIModelRef<FM_Spot> local_4 = TEUIModelRef<FM_Spot>(Spot);
        Registry.opArrow().RemovePresentationData(local_4);
        return;
    }
    TEUIModelRef<FM_Spot> local_4_2 = TEUIModelRef<FM_Spot>(Spot);
    PresentationSpotUtils::GetDefaultRegistry(Spot.GetManager()).RemovePresentationData(local_4_2);
    return;
}
void SetupSpotPresentationRuleConfigs(FM_Spot &inout InSpot, const TDataObjectPtr<FPresentationRuleConfig> &inout Config, const TEUIModelRef<FM_SpotRegistry> &inout Registry = FEUIModelRef())
{
    bool local_2;
    TDataObjectPtr<FMinimapIconConfig> local_50;
    if (!(Config))
    {
        local_2 = false;
    }
    else
    {
        local_2 = Config.opArrow().bShowMinimapIcon;
    }
    if (local_2)
    {
        local_50 = Config.opArrow().GetMinimapIconSettings();
    }
    else
    {
        local_50 = TDataObjectPtr<FMinimapIconConfig>();
    }
    SetMinimapIconConfig(InSpot, local_50);
    TDataObjectPtr<FIndicatorConfig> local_146;
    if (!(Config))
    {
        local_2 = false;
    }
    else
    {
        local_2 = Config.opArrow().bShowIndicator;
    }
    if (local_2)
    {
        local_146 = Config.opArrow().GetIndicatorConfig();
    }
    else
    {
        local_146 = TDataObjectPtr<FIndicatorConfig>();
    }
    SetIndicatorConfig(InSpot, local_146);
    TDataObjectPtr<FNavigationBarIconConfig> local_242;
    if (!(Config))
    {
        local_2 = false;
    }
    else
    {
        local_2 = Config.opArrow().bShowNavigationBarIcon;
    }
    if (local_2)
    {
        local_242 = Config.opArrow().GetNavigationBarIconConfig();
    }
    else
    {
        local_242 = TDataObjectPtr<FNavigationBarIconConfig>();
    }
    SetNavigationBarIconConfig(InSpot, local_242);
    TDataObjectPtr<FHeadsUpDisplayConfig> local_338;
    if (!(Config))
    {
        local_2 = false;
    }
    else
    {
        local_2 = Config.opArrow().bShowHeadsUpDisplay;
    }
    if (local_2)
    {
        local_338 = Config.opArrow().GetHeadsUpDisplayConfig();
    }
    else
    {
        local_338 = TDataObjectPtr<FHeadsUpDisplayConfig>();
    }
    SetHeadsUpDisplayConfig(InSpot, local_338);
    return;
}
void SetupSpotPresentationRuleConfigs(FM_Spot &inout InSpot, const FLevelSpotData &inout LevelSpotData, const TEUIModelRef<FM_SpotRegistry> &inout Registry = FEUIModelRef())
{
    SetPresentationConfig(InSpot, LevelSpotData.GetPresentationConfig(), Registry);
    SetMinimapIconConfig(InSpot, LevelSpotData.GetMinimapIconDisplaySettings(), Registry);
    SetIndicatorConfig(InSpot, LevelSpotData.GetIndicatorConfig(), Registry);
    SetNavigationBarIconConfig(InSpot, LevelSpotData.GetNavigationBarIconConfig(), Registry);
    SetHeadsUpDisplayConfig(InSpot, LevelSpotData.GetHeadsUpDisplayConfig(), Registry);
    return;
}
}

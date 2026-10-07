
FDataObjectPtr GetConfigData(const FM_Spot &inout Spot, const EPresentationDataType ConfigDataType, const FSpotViewAdapter &inout View = FSpotViewAdapter())
{
    if (Spot)
    {
        FSpotViewAdapter local_10;
        return local_10.GetConfigData(Spot, EPresentationDataType(ConfigDataType));
    }
    return FDataObjectPtr();
}
void SetConfigData(FM_Spot &inout Spot, const EPresentationDataType ConfigDataType, const FDataObjectPtr &inout ConfigData, const TEUIModelRef<FM_SpotRegistry> &inout Registry = FEUIModelRef())
{
    if (ConfigData)
    {
        TEUIModelRef<FM_Spot> local_6 = TEUIModelRef<FM_Spot>(Spot);
        UEUIManagerSubsystem local_4 = Spot.GetManager();
        return;
    }
    PresentationSpotUtils::GetDefaulted(Spot.GetManager(), Registry).RemoveConfigData(TEUIModelRef<FM_Spot>(Spot));
    return;
}
TDataObjectPtr<FPresentationConfig> GetPresentationConfig(const FM_Spot &inout Spot, const FSpotViewAdapter &inout View = FSpotViewAdapter())
{
    FSpotViewAdapter local_8;
    return TDataObjectPtr<FPresentationConfig>(local_8.GetPresentationConfigData(Spot));
}
TDataObjectPtr<FMinimapIconConfig> GetMinimapIconConfig(const FM_Spot &inout Spot, const FSpotViewAdapter &inout View = FSpotViewAdapter())
{
    FSpotViewAdapter local_8;
    return TDataObjectPtr<FMinimapIconConfig>(local_8.GetMinimapIconConfigData(Spot));
}
TDataObjectPtr<FIndicatorConfig> GetIndicatorConfig(const FM_Spot &inout Spot, const FSpotViewAdapter &inout View = FSpotViewAdapter())
{
    FSpotViewAdapter local_8;
    return TDataObjectPtr<FIndicatorConfig>(local_8.GetIndicatorConfigData(Spot));
}
TDataObjectPtr<FNavigationBarIconConfig> GetNavigationBarIconConfig(const FM_Spot &inout Spot, const FSpotViewAdapter &inout View = FSpotViewAdapter())
{
    FSpotViewAdapter local_8;
    return TDataObjectPtr<FNavigationBarIconConfig>(local_8.GetNavigationBarIconConfigData(Spot));
}
void SetPresentationConfig(FM_Spot &inout Spot, const TDataObjectPtr<FPresentationConfig> &inout PresentationConfig, const TEUIModelRef<FM_SpotRegistry> &inout Registry = FEUIModelRef())
{
    PresentationSpotUtils::GetDefaulted(Spot.GetManager(), Registry).SetPresentationConfigData(TEUIModelRef<FM_Spot>(Spot), PresentationConfig.opImplConv());
    return;
}
void SetMinimapIconConfig(FM_Spot &inout Spot, const TDataObjectPtr<FMinimapIconConfig> &inout MinimapIconConfig, const TEUIModelRef<FM_SpotRegistry> &inout Registry = FEUIModelRef())
{
    PresentationSpotUtils::GetDefaulted(Spot.GetManager(), Registry).SetMinimapIconConfigData(TEUIModelRef<FM_Spot>(Spot), MinimapIconConfig.opImplConv());
    return;
}
void SetIndicatorConfig(FM_Spot &inout Spot, const TDataObjectPtr<FIndicatorConfig> &inout IndicatorConfig, const TEUIModelRef<FM_SpotRegistry> &inout Registry = FEUIModelRef())
{
    PresentationSpotUtils::GetDefaulted(Spot.GetManager(), Registry).SetIndicatorConfigData(TEUIModelRef<FM_Spot>(Spot), IndicatorConfig.opImplConv());
    return;
}
void SetNavigationBarIconConfig(FM_Spot &inout Spot, const TDataObjectPtr<FNavigationBarIconConfig> &inout NavigationBarIconConfig, const TEUIModelRef<FM_SpotRegistry> &inout Registry = FEUIModelRef())
{
    PresentationSpotUtils::GetDefaulted(Spot.GetManager(), Registry).SetNavigationBarIconConfigData(TEUIModelRef<FM_Spot>(Spot), NavigationBarIconConfig.opImplConv());
    return;
}
TDataObjectPtr<FHeadsUpDisplayConfig> GetHeadsUpDisplayConfig(const FM_Spot &inout Spot, const FSpotViewAdapter &inout View = FSpotViewAdapter())
{
    FSpotViewAdapter local_8;
    return TDataObjectPtr<FHeadsUpDisplayConfig>(local_8.GetHeadsUpDisplayConfigData(Spot));
}
void SetHeadsUpDisplayConfig(FM_Spot &inout Spot, const TDataObjectPtr<FHeadsUpDisplayConfig> &inout HeadsUpDisplayConfig, const TEUIModelRef<FM_SpotRegistry> &inout Registry = FEUIModelRef())
{
    PresentationSpotUtils::GetDefaulted(Spot.GetManager(), Registry).SetHeadsUpDisplayConfigData(TEUIModelRef<FM_Spot>(Spot), HeadsUpDisplayConfig.opImplConv());
    return;
}

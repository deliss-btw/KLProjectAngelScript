

UCLASS(Abstract)
class USpotDisplayConfigBase : UObject
{
    USpotDisplayConfigBase()
    {
        return;
    }
    EPresentationDataType GetInterestedDataType() const
    {
        return EPresentationDataType(12);
    }
    bool GetDisplayRule(const TEUIModelRef<FM_Spot> &inout Spot, const FSpotViewAdapter &inout SpotView, FPresentationDisplayRule &out OutRule) const
    {
        return false;
    }
    FSoftBrush GetSpotIcon(const TEUIModelRef<FM_Spot> &inout Spot, const FSpotViewAdapter &inout SpotView) const
    {
        return FSoftBrush();
    }
    FMargin GetSpotIconPadding(const TEUIModelRef<FM_Spot> &inout Spot, const FSpotViewAdapter &inout SpotView) const
    {
        return FMargin();
    }
    FSpotView GetDesiredSpotView(const UObject WorldContext) const
    {
        FSpotView __r;
        ::PresentationSpotUtils::GetDefaultView(WorldContext);
        return __r;
    }
}

class USpotDisplayConfig_HeadsUpDisplay : USpotDisplayConfigBase
{
    USpotDisplayConfig_HeadsUpDisplay()
    {
        super();
        return;
    }
    EPresentationDataType GetInterestedDataType() const
    {
        return EPresentationDataType(4);
    }
    bool GetDisplayRule(const TEUIModelRef<FM_Spot> &inout Spot, const FSpotViewAdapter &inout SpotView, FPresentationDisplayRule &out OutRule) const
    {
        if (!(::GetHeadsUpDisplayConfig(Spot.opArrow(), SpotView)))
        {
            return false;
        }
        return true;
    }
    FSoftBrush GetSpotIcon(const TEUIModelRef<FM_Spot> &inout Spot, const FSpotViewAdapter &inout SpotView) const
    {
        TDataObjectPtr<FHeadsUpDisplayConfig> local_24 = ::GetHeadsUpDisplayConfig(Spot.opArrow(), SpotView);
        if (local_24)
        {
            return local_24.opArrow().Icon.GetIconBrush(::GetPresentationConfig(Spot.opArrow(), SpotView));
        }
        return FSoftBrush();
    }
    FMargin GetSpotIconPadding(const TEUIModelRef<FM_Spot> &inout Spot, const FSpotViewAdapter &inout SpotView) const
    {
        TDataObjectPtr<FHeadsUpDisplayConfig> local_24 = ::GetHeadsUpDisplayConfig(Spot.opArrow(), SpotView);
        if (local_24)
        {
            return local_24.opArrow().Icon.GetIconPadding(::GetPresentationConfig(Spot.opArrow(), SpotView));
        }
        return FMargin();
    }
}

class USpotDisplayConfig_Indicator : USpotDisplayConfigBase
{
    USpotDisplayConfig_Indicator()
    {
        super();
        return;
    }
    EPresentationDataType GetInterestedDataType() const
    {
        return EPresentationDataType(2);
    }
    bool GetDisplayRule(const TEUIModelRef<FM_Spot> &inout Spot, const FSpotViewAdapter &inout SpotView, FPresentationDisplayRule &out OutRule) const
    {
        if (!(::GetIndicatorConfig(Spot.opArrow(), SpotView)))
        {
            return false;
        }
        return true;
    }
    FSoftBrush GetSpotIcon(const TEUIModelRef<FM_Spot> &inout Spot, const FSpotViewAdapter &inout SpotView) const
    {
        TDataObjectPtr<FIndicatorConfig> local_24 = ::GetIndicatorConfig(Spot.opArrow(), SpotView);
        if (local_24)
        {
            return local_24.opArrow().Icon.GetIconBrush(::GetPresentationConfig(Spot.opArrow(), SpotView));
        }
        return FSoftBrush();
    }
    FMargin GetSpotIconPadding(const TEUIModelRef<FM_Spot> &inout Spot, const FSpotViewAdapter &inout SpotView) const
    {
        TDataObjectPtr<FIndicatorConfig> local_24 = ::GetIndicatorConfig(Spot.opArrow(), SpotView);
        if (local_24)
        {
            return local_24.opArrow().Icon.GetIconPadding(::GetPresentationConfig(Spot.opArrow(), SpotView));
        }
        return FMargin();
    }
}

class USpotDisplayConfig_NavigationBar : USpotDisplayConfigBase
{
    USpotDisplayConfig_NavigationBar()
    {
        super();
        return;
    }
    EPresentationDataType GetInterestedDataType() const
    {
        return EPresentationDataType(3);
    }
    bool GetDisplayRule(const TEUIModelRef<FM_Spot> &inout Spot, const FSpotViewAdapter &inout SpotView, FPresentationDisplayRule &out OutRule) const
    {
        if (!(::GetNavigationBarIconConfig(Spot.opArrow(), SpotView)))
        {
            return false;
        }
        return true;
    }
    FSoftBrush GetSpotIcon(const TEUIModelRef<FM_Spot> &inout Spot, const FSpotViewAdapter &inout SpotView) const
    {
        TDataObjectPtr<FNavigationBarIconConfig> local_24 = ::GetNavigationBarIconConfig(Spot.opArrow(), SpotView);
        if (local_24)
        {
            return local_24.opArrow().Icon.GetIconBrush(::GetPresentationConfig(Spot.opArrow(), SpotView));
        }
        return FSoftBrush();
    }
    FMargin GetSpotIconPadding(const TEUIModelRef<FM_Spot> &inout Spot, const FSpotViewAdapter &inout SpotView) const
    {
        TDataObjectPtr<FNavigationBarIconConfig> local_24 = ::GetNavigationBarIconConfig(Spot.opArrow(), SpotView);
        if (local_24)
        {
            return local_24.opArrow().Icon.GetIconPadding(::GetPresentationConfig(Spot.opArrow(), SpotView));
        }
        return FMargin();
    }
}

class USpotDisplayConfig_Minimap : USpotDisplayConfigBase
{
    USpotDisplayConfig_Minimap()
    {
        super();
        return;
    }
    EPresentationDataType GetInterestedDataType() const
    {
        return EPresentationDataType(1);
    }
    FSoftBrush GetSpotIcon(const TEUIModelRef<FM_Spot> &inout Spot, const FSpotViewAdapter &inout SpotView) const
    {
        TDataObjectPtr<FMinimapIconConfig> local_24 = ::GetMinimapIconConfig(Spot.opArrow(), SpotView);
        if (local_24)
        {
            if (int(local_24.opArrow().IconType) == 0)
            {
                CastTo local_104;
                return local_104.opCall().opArrow().Icon.GetIconBrush(::GetPresentationConfig(Spot.opArrow(), SpotView));
            }
        }
        return FSoftBrush();
    }
    FMargin GetSpotIconPadding(const TEUIModelRef<FM_Spot> &inout Spot, const FSpotViewAdapter &inout SpotView) const
    {
        TDataObjectPtr<FMinimapIconConfig> local_24 = ::GetMinimapIconConfig(Spot.opArrow(), SpotView);
        if (local_24)
        {
            if (int(local_24.opArrow().IconType) == 0)
            {
                CastTo local_104;
                return local_104.opCall().opArrow().Icon.GetIconPadding(::GetPresentationConfig(Spot.opArrow(), SpotView));
            }
        }
        return FMargin();
    }
}


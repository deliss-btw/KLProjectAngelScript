
namespace FPresentationDataOverride
{
    const FPresentationDataOverride None = FPresentationDataOverride();

}
struct FPresentationDataOverride
{
    UPROPERTY()
    bool bOverrideName;
    UPROPERTY()
    FText OverrideName;
    UPROPERTY()
    bool bOverrideDescription;
    UPROPERTY()
    FText OverrideDescription;


}

FText GetSpotName(const FM_Spot &inout Spot, const FSpotViewAdapter &inout SpotView = FSpotViewAdapter())
{
    const FPresentationDataOverride& local_2 = PresentationDataOverrideUtils::GetPresentationDataOverride(Spot, SpotView);
    if (local_2.bOverrideName)
    {
        return local_2.OverrideName;
    }
    TDataObjectPtr<FPresentationConfig> local_28 = GetPresentationConfig(Spot, SpotView);
    if (local_28)
    {
        return local_28.opArrow().Name;
    }
    return FText();
}
FText GetSpotDescription(const FM_Spot &inout Spot, const FSpotViewAdapter &inout SpotView = FSpotViewAdapter())
{
    const FPresentationDataOverride& local_2 = PresentationDataOverrideUtils::GetPresentationDataOverride(Spot, SpotView);
    if (local_2.bOverrideDescription)
    {
        return local_2.OverrideDescription;
    }
    TDataObjectPtr<FPresentationConfig> local_28 = GetPresentationConfig(Spot, SpotView);
    if (local_28)
    {
        return local_28.opArrow().Description;
    }
    return FText();
}
void SetSpotName(FM_Spot &inout Spot, const FText &inout Name, const TEUIModelRef<FM_SpotRegistry> &inout Registry = FEUIModelRef())
{
    FPresentationDataOverride local_20;
    FSpotViewAdapter local_8 = FSpotViewAdapter(Registry);
    local_20.bOverrideName = true;
    local_20.OverrideName = Name;
    EPresentationDataType local_38;
    FInstancedStruct::Make(local_38);
    return;
}
void ResetSpotName(FM_Spot &inout Spot, const TEUIModelRef<FM_SpotRegistry> &inout Registry = FEUIModelRef())
{
    FPresentationDataOverride local_20;
    FSpotViewAdapter local_8 = FSpotViewAdapter(Registry);
    if (!(local_20.bOverrideName))
    {
        return;
    }
    local_20.bOverrideName = false;
    local_20.OverrideName = FText();
    EPresentationDataType local_42;
    FInstancedStruct::Make(local_42);
    return;
}
void SetSpotDescription(FM_Spot &inout Spot, const FText &inout Description, const TEUIModelRef<FM_SpotRegistry> &inout Registry = FEUIModelRef())
{
    FPresentationDataOverride local_20;
    FSpotViewAdapter local_8 = FSpotViewAdapter(Registry);
    local_20.bOverrideDescription = true;
    local_20.OverrideDescription = Description;
    EPresentationDataType local_38;
    FInstancedStruct::Make(local_38);
    return;
}
namespace PresentationDataOverrideUtils
{
const FPresentationDataOverride GetPresentationDataOverride(const FM_Spot &inout Spot, const FSpotViewAdapter &inout SpotView)
{
    const FPresentationDataOverride __r;
    const FInstancedStruct& local_4 = PresentationDataUtils::GetPresentationData(Spot, EPresentationDataType(5), SpotView);
    if (local_4.IsValid())
    {
        TConstRawPtr<FPresentationDataOverride> local_12 = FInstancedStruct::GetPtr(local_4).opCall();
    }
    else
    {
    }
    return __r;
}
}

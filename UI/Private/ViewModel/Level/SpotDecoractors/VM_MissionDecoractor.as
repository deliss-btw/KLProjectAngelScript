
namespace FVM_MissionDecoractor
{
    const int ModelId = 0;

}
struct FVM_MissionDecoractor : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_Spot;
    UPROPERTY()
    EPresentationSpotUsage m_SpotUsage;
    UPROPERTY()
    FSoftBrush m_GuideIcon;
    UPROPERTY()
    bool m_bShowBackground;
    UPROPERTY()
    FLinearColor m_GuideColor;
    UPROPERTY()
    bool m_bIsTracking;

    FVM_MissionDecoractor()
    {
        this.m_SpotUsage = EPresentationSpotUsage(0);
        this.m_bShowBackground = false;
        this.m_bIsTracking = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_MissionDecoractor' by default constructor.");
        return;
    }
    FVM_MissionDecoractor(const FVM_MissionDecoractor &inout Other)
    {
        this.m_SpotUsage = EPresentationSpotUsage(0);
        this.m_bShowBackground = false;
        this.m_bIsTracking = false;
        this.m_Spot = Other.m_Spot;
        this.m_SpotUsage = Other.m_SpotUsage;
        this.m_GuideIcon = Other.m_GuideIcon;
        this.m_bShowBackground = Other.m_bShowBackground;
        this.m_GuideColor = Other.m_GuideColor;
        this.m_bIsTracking = Other.m_bIsTracking;
        return;
    }
    FVM_MissionDecoractor(const TEUIModelRef<FM_Spot> &inout InSpot, const EPresentationSpotUsage InSpotUsage)
    {
        this.m_SpotUsage = EPresentationSpotUsage(0);
        this.m_bShowBackground = false;
        this.m_bIsTracking = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSpot(InSpot);
        this.SetSpotUsage(EPresentationSpotUsage(InSpotUsage));
        return;
    }
    FVM_MissionDecoractor opAssign(const FVM_MissionDecoractor &inout Other)
    {
        FVM_MissionDecoractor __r;
        this.m_Spot = Other.m_Spot;
        this.m_SpotUsage = Other.m_SpotUsage;
        this.m_GuideIcon = Other.m_GuideIcon;
        this.m_bShowBackground = Other.m_bShowBackground;
        this.m_GuideColor = Other.m_GuideColor;
        this.m_bIsTracking = Other.m_bIsTracking;
        return __r;
    }
    void PostConstruct()
    {
        TEUIModelRef<FM_Spot> local_2 = this.GetSpot();
        FMissionPresentationData local_108;
        this.SetGuideIcon(local_108.GuideIcon);
        TDataObjectPtr<FMissionConfig> local_228 = local_108.MissionConfig;
        this.SetbShowBackground(::MissionUtils::IsMissionTracking(this.GetContext().GetLocalPlayer(), local_228));
        if (::MissionUtils::GetMissionPresentationRuleConfig(local_228).IsSet() && GetGuidePresentation().IsSet())
        {
        }
        return;
    }
    void UpdateTrackingState()
    {
        FSpotViewAdapter local_10;
        this.SetbIsTracking(::MissionUtils::IsMissionTracking(this.GetContext().GetLocalPlayer(), ::GetMissionData(this.GetSpot().opArrow(), local_10).MissionConfig));
        return;
    }
    TEUIModelRef<FM_Spot> GetSpot() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Spot;
    }
    void SetSpot(const TEUIModelRef<FM_Spot> &inout __Value) property
    {
        TEUIModelRef<FM_Spot> local_2;
        local_2 = this.m_Spot;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Spot = __Value;
        return;
    }
    EPresentationSpotUsage GetSpotUsage() const property
    {
        this.TrackPropertyRead(1);
        return this.m_SpotUsage;
    }
    void SetSpotUsage(const EPresentationSpotUsage __Value) property
    {
        if (int(this.m_SpotUsage) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SpotUsage = __Value;
        return;
    }
    FSoftBrush GetGuideIcon() const property
    {
        FSoftBrush __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FSoftBrush GetModify_GuideIcon() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetGuideIcon(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_GuideIcon = __Value;
        return;
    }
    bool GetbShowBackground() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bShowBackground;
    }
    void SetbShowBackground(const bool __Value) property
    {
        if (!(this.m_bShowBackground) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bShowBackground = __Value;
        return;
    }
    const FLinearColor GetGuideColor() const property
    {
        const FLinearColor __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FLinearColor GetModify_GuideColor() property
    {
        FLinearColor __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetGuideColor(const FLinearColor &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_GuideColor = __Value;
        return;
    }
    bool GetbIsTracking() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bIsTracking;
    }
    void SetbIsTracking(const bool __Value) property
    {
        if (!(this.m_bIsTracking) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bIsTracking = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MissionDecoractor
{
    UPROPERTY()
    TEUIModelRef<FVM_MissionDecoractor> Self;

    __GeneratedProperties_FVM_MissionDecoractor()
    {
        return;
    }
}

namespace FVM_MissionDecoractor
{
FVM_MissionDecoractor& Create(const UObject ContextObject, const TEUIModelRef<FM_Spot> &inout Spot, const EPresentationSpotUsage SpotUsage)
{
    return FVM_MissionDecoractor::CreateByManager(EUIInternal::GetContextManager(ContextObject), Spot);
}
FVM_MissionDecoractor CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Spot> &inout Spot, const EPresentationSpotUsage SpotUsage)
{
    FVM_MissionDecoractor __r;
    TEUIModelRef<FVM_MissionDecoractor> local_6 = TEUIModelRef<FVM_MissionDecoractor>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_MissionDecoractor::ModelId, 0, Spot, SpotUsage));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "GuideIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bShowBackground";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "GuideColor";
    local_14.TypeName = "FLinearColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MissionDecoractor>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MissionDecoractor;
    FEUIModelEffectDefine local_20;
    local_20.FunctionName = "UpdateTrackingState";
    Result.EffectFunctions.Add(local_20);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MissionDecoractor;
}
FSoftBrush __UIGetter_GuideIcon(const FVM_MissionDecoractor &inout Model)
{
    return Model.GetGuideIcon();
}
bool __UIGetter_bShowBackground(const FVM_MissionDecoractor &inout Model)
{
    return Model.GetbShowBackground();
}
FLinearColor __UIGetter_GuideColor(const FVM_MissionDecoractor &inout Model)
{
    return Model.GetGuideColor();
}
TEUIModelRef<FVM_MissionDecoractor> __UIGetter_Self(const FVM_MissionDecoractor &inout Model)
{
    return TEUIModelRef<FVM_MissionDecoractor>(Model);
}
int __IndexOf_Spot()
{
    return 0;
}
int __IndexOf_SpotUsage()
{
    return 1;
}
int __IndexOf_GuideIcon()
{
    return 2;
}
int __IndexOf_bShowBackground()
{
    return 3;
}
int __IndexOf_GuideColor()
{
    return 4;
}
int __IndexOf_bIsTracking()
{
    return 5;
}
}
namespace __GeneratedProperties_FVM_MissionDecoractor
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

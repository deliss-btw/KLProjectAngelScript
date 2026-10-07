
namespace FVM_NavigationBarIcon
{
    const int ModelId = 0;

}
struct FVM_NavigationBarIcon : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_Spot;
    UPROPERTY()
    TEUIModelRef<FVM_SpotInfo> m_SpotInfo;

    FVM_NavigationBarIcon()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_NavigationBarIcon' by default constructor.");
        return;
    }
    FVM_NavigationBarIcon(const FVM_NavigationBarIcon &inout Other)
    {
        this.m_Spot = Other.m_Spot;
        this.m_SpotInfo = Other.m_SpotInfo;
        return;
    }
    FVM_NavigationBarIcon(const TEUIModelRef<FM_Spot> &inout InSpot)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSpot(InSpot);
        return;
    }
    FVM_NavigationBarIcon& opAssign(const FVM_NavigationBarIcon &inout Other)
    {
        this.m_Spot = Other.m_Spot;
        return Other.m_SpotInfo;
    }
    void PostConstruct()
    {
        this.SetSpotInfo(TEUIModelRef<FVM_SpotInfo>(::FVM_SpotInfo::Create(this.GetContext().Manager, this.GetSpot(), EPresentationSpotUsage(2))));
        return;
    }
    float GetDistanceToPlayer() const
    {
        if (this.GetSpot().opArrow().GetTransform().Has3DPosition())
        {
            return ::PresentationSpotUtils::GetDistanceToPlayer(this.GetSpot());
        }
        return -1.0;
    }
    FText GetDistanceText() const
    {
        float local_2 = this.GetDistanceToPlayer();
        if (local_2 <= 0.0)
        {
            return FText();
        }
        FDistanceFormattingOptions local_12;
        return ::CommonPropertyConversions::DistanceToText(local_2, local_12);
    }
    bool IsGuidingTarget() const
    {
        return this.GetSpotInfo().opArrow().HasGuideDecoractor();
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
    TEUIModelRef<FVM_SpotInfo> GetSpotInfo() const property
    {
        this.TrackPropertyRead(1);
        return this.m_SpotInfo;
    }
    void SetSpotInfo(const TEUIModelRef<FVM_SpotInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_SpotInfo> local_2;
        local_2 = this.m_SpotInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SpotInfo = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_NavigationBarIcon
{
    UPROPERTY()
    float DistanceToPlayer;
    UPROPERTY()
    FText DistanceText;
    UPROPERTY()
    bool IsGuidingTarget;
    UPROPERTY()
    TEUIModelRef<FVM_NavigationBarIcon> Self;


}

namespace FVM_NavigationBarIcon
{
FVM_NavigationBarIcon& Create(const UObject ContextObject, const TEUIModelRef<FM_Spot> &inout Spot)
{
    return FVM_NavigationBarIcon::CreateByManager(EUIInternal::GetContextManager(ContextObject), Spot);
}
FVM_NavigationBarIcon CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Spot> &inout Spot)
{
    FVM_NavigationBarIcon __r;
    TEUIModelRef<FVM_NavigationBarIcon> local_6 = TEUIModelRef<FVM_NavigationBarIcon>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_NavigationBarIcon::ModelId, 0, Spot));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "SpotInfo";
    local_14.TypeName = "TEUIModelRef<FVM_SpotInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DistanceToPlayer";
    local_14.TypeName = "float64";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DistanceText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsGuidingTarget";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_NavigationBarIcon>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_NavigationBarIcon;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_NavigationBarIcon;
}
TEUIModelRef<FVM_SpotInfo> __UIGetter_SpotInfo(const FVM_NavigationBarIcon &inout Model)
{
    return Model.GetSpotInfo();
}
float __UIGetter_DistanceToPlayer(const FVM_NavigationBarIcon &inout Model)
{
    return Model.GetDistanceToPlayer();
}
FText __UIGetter_DistanceText(const FVM_NavigationBarIcon &inout Model)
{
    return Model.GetDistanceText();
}
bool __UIGetter_IsGuidingTarget(const FVM_NavigationBarIcon &inout Model)
{
    return Model.IsGuidingTarget();
}
TEUIModelRef<FVM_NavigationBarIcon> __UIGetter_Self(const FVM_NavigationBarIcon &inout Model)
{
    return TEUIModelRef<FVM_NavigationBarIcon>(Model);
}
int __IndexOf_Spot()
{
    return 0;
}
int __IndexOf_SpotInfo()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_NavigationBarIcon
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

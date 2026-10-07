
namespace FVM_GuideDecoractor
{
    const int ModelId = 0;

}
struct FVM_GuideDecoractor : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_Spot;
    UPROPERTY()
    EPresentationSpotUsage m_SpotUsage;

    FVM_GuideDecoractor()
    {
        this.m_SpotUsage = EPresentationSpotUsage(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_GuideDecoractor' by default constructor.");
        return;
    }
    FVM_GuideDecoractor(const FVM_GuideDecoractor &inout Other)
    {
        this.m_SpotUsage = EPresentationSpotUsage(0);
        this.m_Spot = Other.m_Spot;
        this.m_SpotUsage = Other.m_SpotUsage;
        return;
    }
    FVM_GuideDecoractor(const TEUIModelRef<FM_Spot> &inout InSpot, const EPresentationSpotUsage InSpotUsage)
    {
        this.m_SpotUsage = EPresentationSpotUsage(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSpot(InSpot);
        this.SetSpotUsage(EPresentationSpotUsage(InSpotUsage));
        return;
    }
    FVM_GuideDecoractor opAssign(const FVM_GuideDecoractor &inout Other)
    {
        FVM_GuideDecoractor __r;
        this.m_Spot = Other.m_Spot;
        this.m_SpotUsage = Other.m_SpotUsage;
        return __r;
    }
    bool ShowDistance() const
    {
        return (int(this.GetSpotUsage())) != 0 && (int(this.GetSpotUsage()) != 2);
    }
    float GetDistance() const
    {
        return ::PresentationSpotUtils::GetDistanceToPlayer2D(this.GetSpot());
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
}

struct __GeneratedProperties_FVM_GuideDecoractor
{
    UPROPERTY()
    bool ShowDistance;
    UPROPERTY()
    float Distance;
    UPROPERTY()
    TEUIModelRef<FVM_GuideDecoractor> Self;


}

namespace FVM_GuideDecoractor
{
FVM_GuideDecoractor& Create(const UObject ContextObject, const TEUIModelRef<FM_Spot> &inout Spot, const EPresentationSpotUsage SpotUsage)
{
    return FVM_GuideDecoractor::CreateByManager(EUIInternal::GetContextManager(ContextObject), Spot);
}
FVM_GuideDecoractor CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Spot> &inout Spot, const EPresentationSpotUsage SpotUsage)
{
    FVM_GuideDecoractor __r;
    TEUIModelRef<FVM_GuideDecoractor> local_6 = TEUIModelRef<FVM_GuideDecoractor>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_GuideDecoractor::ModelId, 0, Spot, SpotUsage));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ShowDistance";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Distance";
    local_14.TypeName = "double";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_GuideDecoractor>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_GuideDecoractor;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_GuideDecoractor;
}
bool __UIGetter_ShowDistance(const FVM_GuideDecoractor &inout Model)
{
    return Model.ShowDistance();
}
float __UIGetter_Distance(const FVM_GuideDecoractor &inout Model)
{
    return Model.GetDistance();
}
TEUIModelRef<FVM_GuideDecoractor> __UIGetter_Self(const FVM_GuideDecoractor &inout Model)
{
    return TEUIModelRef<FVM_GuideDecoractor>(Model);
}
int __IndexOf_Spot()
{
    return 0;
}
int __IndexOf_SpotUsage()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_GuideDecoractor
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}


namespace FVM_BossLowHpDecoractor
{
    const int ModelId = 0;

}
struct FVM_BossLowHpDecoractor : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_Spot;
    UPROPERTY()
    EPresentationSpotUsage m_SpotUsage;

    FVM_BossLowHpDecoractor()
    {
        this.m_SpotUsage = EPresentationSpotUsage(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_BossLowHpDecoractor' by default constructor.");
        return;
    }
    FVM_BossLowHpDecoractor(const FVM_BossLowHpDecoractor &inout Other)
    {
        this.m_SpotUsage = EPresentationSpotUsage(0);
        this.m_Spot = Other.m_Spot;
        this.m_SpotUsage = Other.m_SpotUsage;
        return;
    }
    FVM_BossLowHpDecoractor(const TEUIModelRef<FM_Spot> &inout InSpot, const EPresentationSpotUsage InSpotUsage)
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
    FVM_BossLowHpDecoractor opAssign(const FVM_BossLowHpDecoractor &inout Other)
    {
        FVM_BossLowHpDecoractor __r;
        this.m_Spot = Other.m_Spot;
        this.m_SpotUsage = Other.m_SpotUsage;
        return __r;
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

struct __GeneratedProperties_FVM_BossLowHpDecoractor
{
    UPROPERTY()
    TEUIModelRef<FVM_BossLowHpDecoractor> Self;

    __GeneratedProperties_FVM_BossLowHpDecoractor()
    {
        return;
    }
}

namespace FVM_BossLowHpDecoractor
{
FVM_BossLowHpDecoractor& Create(const UObject ContextObject, const TEUIModelRef<FM_Spot> &inout Spot, const EPresentationSpotUsage SpotUsage)
{
    return FVM_BossLowHpDecoractor::CreateByManager(EUIInternal::GetContextManager(ContextObject), Spot);
}
FVM_BossLowHpDecoractor CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Spot> &inout Spot, const EPresentationSpotUsage SpotUsage)
{
    FVM_BossLowHpDecoractor __r;
    TEUIModelRef<FVM_BossLowHpDecoractor> local_6 = TEUIModelRef<FVM_BossLowHpDecoractor>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_BossLowHpDecoractor::ModelId, 0, Spot, SpotUsage));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_BossLowHpDecoractor>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_BossLowHpDecoractor;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_BossLowHpDecoractor;
}
TEUIModelRef<FVM_BossLowHpDecoractor> __UIGetter_Self(const FVM_BossLowHpDecoractor &inout Model)
{
    return TEUIModelRef<FVM_BossLowHpDecoractor>(Model);
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
namespace __GeneratedProperties_FVM_BossLowHpDecoractor
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

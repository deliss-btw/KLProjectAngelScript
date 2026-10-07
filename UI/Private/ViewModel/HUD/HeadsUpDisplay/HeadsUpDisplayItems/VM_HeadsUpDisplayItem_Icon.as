
namespace FVM_HeadsUpDisplayItem_Icon
{
    const int ModelId = 0;

}
struct FVM_HeadsUpDisplayItem_Icon : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_Spot;
    UPROPERTY()
    TEUIModelRef<FVM_SpotInfo> m_SpotInfo;

    FVM_HeadsUpDisplayItem_Icon()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_HeadsUpDisplayItem_Icon' by default constructor.");
        return;
    }
    FVM_HeadsUpDisplayItem_Icon(const FVM_HeadsUpDisplayItem_Icon &inout Other)
    {
        this.m_Spot = Other.m_Spot;
        this.m_SpotInfo = Other.m_SpotInfo;
        return;
    }
    FVM_HeadsUpDisplayItem_Icon(const TEUIModelRef<FM_Spot> &inout InSpot)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSpot(InSpot);
        return;
    }
    FVM_HeadsUpDisplayItem_Icon& opAssign(const FVM_HeadsUpDisplayItem_Icon &inout Other)
    {
        this.m_Spot = Other.m_Spot;
        return Other.m_SpotInfo;
    }
    void PostConstruct()
    {
        this.SetSpotInfo(TEUIModelRef<FVM_SpotInfo>(::FVM_SpotInfo::Create(this.GetContext().Manager, this.GetSpot(), EPresentationSpotUsage(3))));
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

struct __GeneratedProperties_FVM_HeadsUpDisplayItem_Icon
{
    UPROPERTY()
    TEUIModelRef<FVM_HeadsUpDisplayItem_Icon> Self;

    __GeneratedProperties_FVM_HeadsUpDisplayItem_Icon()
    {
        return;
    }
}

namespace FVM_HeadsUpDisplayItem_Icon
{
FVM_HeadsUpDisplayItem_Icon& Create(const UObject ContextObject, const TEUIModelRef<FM_Spot> &inout Spot)
{
    return FVM_HeadsUpDisplayItem_Icon::CreateByManager(EUIInternal::GetContextManager(ContextObject), Spot);
}
FVM_HeadsUpDisplayItem_Icon CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Spot> &inout Spot)
{
    FVM_HeadsUpDisplayItem_Icon __r;
    TEUIModelRef<FVM_HeadsUpDisplayItem_Icon> local_6 = TEUIModelRef<FVM_HeadsUpDisplayItem_Icon>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_HeadsUpDisplayItem_Icon::ModelId, 0, Spot));
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
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_HeadsUpDisplayItem_Icon>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_HeadsUpDisplayItem_Icon;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_HeadsUpDisplayItem_Icon;
}
TEUIModelRef<FVM_SpotInfo> __UIGetter_SpotInfo(const FVM_HeadsUpDisplayItem_Icon &inout Model)
{
    return Model.GetSpotInfo();
}
TEUIModelRef<FVM_HeadsUpDisplayItem_Icon> __UIGetter_Self(const FVM_HeadsUpDisplayItem_Icon &inout Model)
{
    return TEUIModelRef<FVM_HeadsUpDisplayItem_Icon>(Model);
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
namespace __GeneratedProperties_FVM_HeadsUpDisplayItem_Icon
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

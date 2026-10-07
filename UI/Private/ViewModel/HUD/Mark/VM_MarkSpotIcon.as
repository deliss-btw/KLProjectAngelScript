
namespace FVM_MarkSpotIcon
{
    const int ModelId = 0;

}
struct FVM_MarkSpotIcon : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_Spot;
    UPROPERTY()
    TEUIModelRef<FVM_SpotInfo> m_SpotInfo;
    UPROPERTY()
    TEUIModelRef<FVM_MarkInfo> m_MarkInfo;

    FVM_MarkSpotIcon()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_MarkSpotIcon' by default constructor.");
        return;
    }
    FVM_MarkSpotIcon(const FVM_MarkSpotIcon &inout Other)
    {
        this.m_Spot = Other.m_Spot;
        this.m_SpotInfo = Other.m_SpotInfo;
        this.m_MarkInfo = Other.m_MarkInfo;
        return;
    }
    FVM_MarkSpotIcon(const TEUIModelRef<FM_Spot> &inout InSpot)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSpot(InSpot);
        return;
    }
    FVM_MarkSpotIcon& opAssign(const FVM_MarkSpotIcon &inout Other)
    {
        this.m_Spot = Other.m_Spot;
        this.m_SpotInfo = Other.m_SpotInfo;
        return Other.m_MarkInfo;
    }
    void PostConstruct()
    {
        this.SetSpotInfo(TEUIModelRef<FVM_SpotInfo>(::FVM_SpotInfo::Create(this.GetContext().Manager, this.GetSpot(), EPresentationSpotUsage(4))));
        this.SetMarkInfo(TEUIModelRef<FVM_MarkInfo>(::FVM_MarkInfo::Create(this.GetContext().Manager, this.GetSpot())));
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
    TEUIModelRef<FVM_MarkInfo> GetMarkInfo() const property
    {
        this.TrackPropertyRead(2);
        return this.m_MarkInfo;
    }
    void SetMarkInfo(const TEUIModelRef<FVM_MarkInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_MarkInfo> local_2;
        local_2 = this.m_MarkInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_MarkInfo = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MarkSpotIcon
{
    UPROPERTY()
    TEUIModelRef<FVM_MarkSpotIcon> Self;

    __GeneratedProperties_FVM_MarkSpotIcon()
    {
        return;
    }
}

namespace FVM_MarkSpotIcon
{
FVM_MarkSpotIcon& Create(const UObject ContextObject, const TEUIModelRef<FM_Spot> &inout Spot)
{
    return FVM_MarkSpotIcon::CreateByManager(EUIInternal::GetContextManager(ContextObject), Spot);
}
FVM_MarkSpotIcon CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Spot> &inout Spot)
{
    FVM_MarkSpotIcon __r;
    TEUIModelRef<FVM_MarkSpotIcon> local_6 = TEUIModelRef<FVM_MarkSpotIcon>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_MarkSpotIcon::ModelId, 0, Spot));
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
    local_14.PropertyName = "MarkInfo";
    local_14.TypeName = "TEUIModelRef<FVM_MarkInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MarkSpotIcon>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MarkSpotIcon;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MarkSpotIcon;
}
TEUIModelRef<FVM_SpotInfo> __UIGetter_SpotInfo(const FVM_MarkSpotIcon &inout Model)
{
    return Model.GetSpotInfo();
}
TEUIModelRef<FVM_MarkInfo> __UIGetter_MarkInfo(const FVM_MarkSpotIcon &inout Model)
{
    return Model.GetMarkInfo();
}
TEUIModelRef<FVM_MarkSpotIcon> __UIGetter_Self(const FVM_MarkSpotIcon &inout Model)
{
    return TEUIModelRef<FVM_MarkSpotIcon>(Model);
}
int __IndexOf_Spot()
{
    return 0;
}
int __IndexOf_SpotInfo()
{
    return 1;
}
int __IndexOf_MarkInfo()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_MarkSpotIcon
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

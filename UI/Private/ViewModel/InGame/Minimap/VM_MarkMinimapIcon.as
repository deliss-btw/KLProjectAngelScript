
namespace FVM_MarkMinimapIcon
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature RemoveMark = FEUIModelCallbackSignature();

}
struct FVM_MarkMinimapIcon : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_Spot;

    FVM_MarkMinimapIcon()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_MarkMinimapIcon(const FVM_MarkMinimapIcon &inout Other)
    {
        this.m_Spot = Other.m_Spot;
        return;
    }
    FVM_MarkMinimapIcon& opAssign(const FVM_MarkMinimapIcon &inout Other)
    {
        return Other.m_Spot;
    }
    void RemoveMark()
    {
        FECSEntityId local_3 = ::GetOwnerEntityId(this.GetSpot().opArrow());
        if ((!((local_3 == ENTITY_ID_NULL))))
        {
            ::MarkUtil::RequestRemoveMark(this.GetContext().GetLocalPlayer(), local_3);
        }
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
}

struct __GeneratedProperties_FVM_MarkMinimapIcon
{
    UPROPERTY()
    TEUIModelRef<FVM_MarkMinimapIcon> Self;

    __GeneratedProperties_FVM_MarkMinimapIcon()
    {
        return;
    }
}

namespace FVM_MarkMinimapIcon
{
FVM_MarkMinimapIcon& Create(const UObject ContextObject)
{
    return FVM_MarkMinimapIcon::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_MarkMinimapIcon CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_MarkMinimapIcon __r;
    TEUIModelRef<FVM_MarkMinimapIcon> local_6 = TEUIModelRef<FVM_MarkMinimapIcon>(EUIInternal::MakeModelWithManager(Manager, FVM_MarkMinimapIcon::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MarkMinimapIcon>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MarkMinimapIcon;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MarkMinimapIcon;
}
TEUIModelRef<FVM_MarkMinimapIcon> __UIGetter_Self(const FVM_MarkMinimapIcon &inout Model)
{
    return TEUIModelRef<FVM_MarkMinimapIcon>(Model);
}
int __IndexOf_Spot()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_MarkMinimapIcon
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

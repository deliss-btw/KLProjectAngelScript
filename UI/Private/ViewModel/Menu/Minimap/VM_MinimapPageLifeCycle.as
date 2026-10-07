
namespace FVM_MinimapPageLifeCycle
{
    const int ModelId = 0;

}
struct FVM_MinimapPageLifeCycle : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    bool m_bPlayedSelfIconAnim;

    FVM_MinimapPageLifeCycle()
    {
        this.m_bPlayedSelfIconAnim = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_MinimapPageLifeCycle(const FVM_MinimapPageLifeCycle &inout Other)
    {
        this.m_bPlayedSelfIconAnim = false;
        this.m_bPlayedSelfIconAnim = Other.m_bPlayedSelfIconAnim;
        return;
    }
    FVM_MinimapPageLifeCycle opAssign(const FVM_MinimapPageLifeCycle &inout Other)
    {
        FVM_MinimapPageLifeCycle __r;
        this.m_bPlayedSelfIconAnim = Other.m_bPlayedSelfIconAnim;
        return __r;
    }
    bool GetbPlayedSelfIconAnim() const property
    {
        this.TrackPropertyRead(0);
        return this.m_bPlayedSelfIconAnim;
    }
    void SetbPlayedSelfIconAnim(const bool __Value) property
    {
        if (!(this.m_bPlayedSelfIconAnim) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_bPlayedSelfIconAnim = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MinimapPageLifeCycle
{
    UPROPERTY()
    TEUIModelRef<FVM_MinimapPageLifeCycle> Self;

    __GeneratedProperties_FVM_MinimapPageLifeCycle()
    {
        return;
    }
}

namespace FVM_MinimapPageLifeCycle
{
FVM_MinimapPageLifeCycle& Create(const UObject ContextObject)
{
    return FVM_MinimapPageLifeCycle::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_MinimapPageLifeCycle CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_MinimapPageLifeCycle __r;
    TEUIModelRef<FVM_MinimapPageLifeCycle> local_6 = TEUIModelRef<FVM_MinimapPageLifeCycle>(EUIInternal::MakeModelWithManager(Manager, FVM_MinimapPageLifeCycle::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MinimapPageLifeCycle>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MinimapPageLifeCycle;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MinimapPageLifeCycle;
}
TEUIModelRef<FVM_MinimapPageLifeCycle> __UIGetter_Self(const FVM_MinimapPageLifeCycle &inout Model)
{
    return TEUIModelRef<FVM_MinimapPageLifeCycle>(Model);
}
int __IndexOf_bPlayedSelfIconAnim()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_MinimapPageLifeCycle
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

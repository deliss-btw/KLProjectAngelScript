
namespace FVM_PageDot
{
    const int ModelId = 0;

}
struct FVM_PageDot : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_PageIndex;
    UPROPERTY()
    bool m_bActive;

    FVM_PageDot()
    {
        this.m_PageIndex = 0;
        this.m_bActive = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_PageDot' by default constructor.");
        return;
    }
    FVM_PageDot(const FVM_PageDot &inout Other)
    {
        this.m_PageIndex = 0;
        this.m_bActive = false;
        this.m_PageIndex = int(Other.m_PageIndex);
        this.m_bActive = Other.m_bActive;
        return;
    }
    FVM_PageDot(const int InPageIndex)
    {
        this.m_PageIndex = 0;
        this.m_bActive = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetPageIndex(InPageIndex);
        return;
    }
    FVM_PageDot opAssign(const FVM_PageDot &inout Other)
    {
        FVM_PageDot __r;
        this.m_PageIndex = int(Other.m_PageIndex);
        this.m_bActive = Other.m_bActive;
        return __r;
    }
    int GetPageIndex() const property
    {
        this.TrackPropertyRead(0);
        return this.m_PageIndex;
    }
    void SetPageIndex(const int __Value) property
    {
        if (this.m_PageIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PageIndex = __Value;
        return;
    }
    bool GetbActive() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bActive;
    }
    void SetbActive(const bool __Value) property
    {
        if (!(this.m_bActive) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bActive = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_PageDot
{
    UPROPERTY()
    TEUIModelRef<FVM_PageDot> Self;

    __GeneratedProperties_FVM_PageDot()
    {
        return;
    }
}

namespace FVM_PageDot
{
FVM_PageDot& Create(const UObject ContextObject, const int PageIndex)
{
    return FVM_PageDot::CreateByManager(EUIInternal::GetContextManager(ContextObject), PageIndex);
}
FVM_PageDot CreateByManager(const UEUIManagerSubsystem Manager, const int PageIndex)
{
    FVM_PageDot __r;
    TEUIModelRef<FVM_PageDot> local_6 = TEUIModelRef<FVM_PageDot>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_PageDot::ModelId, 0, PageIndex));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "PageIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bActive";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_PageDot>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_PageDot;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_PageDot;
}
int __UIGetter_PageIndex(const FVM_PageDot &inout Model)
{
    return Model.GetPageIndex();
}
bool __UIGetter_bActive(const FVM_PageDot &inout Model)
{
    return Model.GetbActive();
}
TEUIModelRef<FVM_PageDot> __UIGetter_Self(const FVM_PageDot &inout Model)
{
    return TEUIModelRef<FVM_PageDot>(Model);
}
int __IndexOf_PageIndex()
{
    return 0;
}
int __IndexOf_bActive()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_PageDot
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}


namespace FVM_TestEUICanvasSlot
{
    const int ModelId = 0;

}
struct FVM_TestEUICanvasSlot : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_Index;

    FVM_TestEUICanvasSlot()
    {
        this.m_Index = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TestEUICanvasSlot' by default constructor.");
        return;
    }
    FVM_TestEUICanvasSlot(const FVM_TestEUICanvasSlot &inout Other)
    {
        this.m_Index = 0;
        this.m_Index = int(Other.m_Index);
        return;
    }
    FVM_TestEUICanvasSlot(const int InIndex)
    {
        this.m_Index = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetIndex(InIndex);
        return;
    }
    FVM_TestEUICanvasSlot opAssign(const FVM_TestEUICanvasSlot &inout Other)
    {
        FVM_TestEUICanvasSlot __r;
        this.m_Index = int(Other.m_Index);
        return __r;
    }
    int GetIndex() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Index;
    }
    void SetIndex(const int __Value) property
    {
        if (this.m_Index == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Index = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TestEUICanvasSlot
{
    UPROPERTY()
    TEUIModelRef<FVM_TestEUICanvasSlot> Self;

    __GeneratedProperties_FVM_TestEUICanvasSlot()
    {
        return;
    }
}

namespace FVM_TestEUICanvasSlot
{
FVM_TestEUICanvasSlot& Create(const UObject ContextObject, const int Index)
{
    return FVM_TestEUICanvasSlot::CreateByManager(EUIInternal::GetContextManager(ContextObject), Index);
}
FVM_TestEUICanvasSlot CreateByManager(const UEUIManagerSubsystem Manager, const int Index)
{
    FVM_TestEUICanvasSlot __r;
    TEUIModelRef<FVM_TestEUICanvasSlot> local_6 = TEUIModelRef<FVM_TestEUICanvasSlot>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TestEUICanvasSlot::ModelId, 0, Index));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Index";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TestEUICanvasSlot>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TestEUICanvasSlot;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TestEUICanvasSlot;
}
int __UIGetter_Index(const FVM_TestEUICanvasSlot &inout Model)
{
    return Model.GetIndex();
}
TEUIModelRef<FVM_TestEUICanvasSlot> __UIGetter_Self(const FVM_TestEUICanvasSlot &inout Model)
{
    return TEUIModelRef<FVM_TestEUICanvasSlot>(Model);
}
int __IndexOf_Index()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_TestEUICanvasSlot
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

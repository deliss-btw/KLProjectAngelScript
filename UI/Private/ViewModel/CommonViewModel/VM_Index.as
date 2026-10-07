
namespace FVM_Index
{
    const int ModelId = 0;

}
struct FVM_Index : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_IndexValue;

    FVM_Index()
    {
        this.m_IndexValue = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_Index' by default constructor.");
        return;
    }
    FVM_Index(const FVM_Index &inout Other)
    {
        this.m_IndexValue = 0;
        this.m_IndexValue = int(Other.m_IndexValue);
        return;
    }
    FVM_Index(const int InIndexValue)
    {
        this.m_IndexValue = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetIndexValue(InIndexValue);
        return;
    }
    FVM_Index opAssign(const FVM_Index &inout Other)
    {
        FVM_Index __r;
        this.m_IndexValue = int(Other.m_IndexValue);
        return __r;
    }
    int GetDisplayIndex() const
    {
        return (this.GetIndexValue() + 1);
    }
    int GetIndexValue() const property
    {
        this.TrackPropertyRead(0);
        return this.m_IndexValue;
    }
    void SetIndexValue(const int __Value) property
    {
        if (this.m_IndexValue == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_IndexValue = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_Index
{
    UPROPERTY()
    int DisplayIndex;
    UPROPERTY()
    TEUIModelRef<FVM_Index> Self;


}

namespace FVM_Index
{
FVM_Index& Create(const UObject ContextObject, const int IndexValue)
{
    return FVM_Index::CreateByManager(EUIInternal::GetContextManager(ContextObject), IndexValue);
}
FVM_Index CreateByManager(const UEUIManagerSubsystem Manager, const int IndexValue)
{
    FVM_Index __r;
    TEUIModelRef<FVM_Index> local_6 = TEUIModelRef<FVM_Index>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_Index::ModelId, 0, IndexValue));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "IndexValue";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_Index>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_Index;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_Index;
}
int __UIGetter_IndexValue(const FVM_Index &inout Model)
{
    return Model.GetIndexValue();
}
int __UIGetter_DisplayIndex(const FVM_Index &inout Model)
{
    return Model.GetDisplayIndex();
}
TEUIModelRef<FVM_Index> __UIGetter_Self(const FVM_Index &inout Model)
{
    return TEUIModelRef<FVM_Index>(Model);
}
int __IndexOf_IndexValue()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_Index
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

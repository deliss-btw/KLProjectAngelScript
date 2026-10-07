
enum EAttributeCompareResult
{
    Equal,
    Greater,
    Less,
}

namespace FVM_AttributeCompare
{
    const int ModelId = 0;

}
struct FVM_AttributeCompare : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    EAttributeCompareResult m_CompareResult;

    FVM_AttributeCompare()
    {
        this.m_CompareResult = EAttributeCompareResult(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_AttributeCompare' by default constructor.");
        return;
    }
    FVM_AttributeCompare(const FVM_AttributeCompare &inout Other)
    {
        this.m_CompareResult = EAttributeCompareResult(0);
        this.m_CompareResult = Other.m_CompareResult;
        return;
    }
    FVM_AttributeCompare(const EAttributeCompareResult InCompareResult)
    {
        this.m_CompareResult = EAttributeCompareResult(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetCompareResult(EAttributeCompareResult(InCompareResult));
        return;
    }
    FVM_AttributeCompare opAssign(const FVM_AttributeCompare &inout Other)
    {
        FVM_AttributeCompare __r;
        this.m_CompareResult = Other.m_CompareResult;
        return __r;
    }
    int GetWidgetIndex() const
    {
        return int(this.GetCompareResult());
    }
    EAttributeCompareResult GetCompareResult() const property
    {
        this.TrackPropertyRead(0);
        return this.m_CompareResult;
    }
    void SetCompareResult(const EAttributeCompareResult __Value) property
    {
        if (int(this.m_CompareResult) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CompareResult = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_AttributeCompare
{
    UPROPERTY()
    int WidgetIndex;
    UPROPERTY()
    TEUIModelRef<FVM_AttributeCompare> Self;


}

namespace FVM_AttributeCompare
{
FVM_AttributeCompare& Create(const UObject ContextObject, const EAttributeCompareResult CompareResult)
{
    return FVM_AttributeCompare::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_AttributeCompare CreateByManager(const UEUIManagerSubsystem Manager, const EAttributeCompareResult CompareResult)
{
    FVM_AttributeCompare __r;
    TEUIModelRef<FVM_AttributeCompare> local_6 = TEUIModelRef<FVM_AttributeCompare>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_AttributeCompare::ModelId, 0, CompareResult));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "CompareResult";
    local_14.TypeName = "EAttributeCompareResult";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "WidgetIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AttributeCompare>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AttributeCompare;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AttributeCompare;
}
EAttributeCompareResult __UIGetter_CompareResult(const FVM_AttributeCompare &inout Model)
{
    return Model.GetCompareResult();
}
int __UIGetter_WidgetIndex(const FVM_AttributeCompare &inout Model)
{
    return Model.GetWidgetIndex();
}
TEUIModelRef<FVM_AttributeCompare> __UIGetter_Self(const FVM_AttributeCompare &inout Model)
{
    return TEUIModelRef<FVM_AttributeCompare>(Model);
}
int __IndexOf_CompareResult()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_AttributeCompare
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

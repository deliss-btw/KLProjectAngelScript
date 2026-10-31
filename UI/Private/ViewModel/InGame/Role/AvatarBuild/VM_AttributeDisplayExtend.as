namespace FVM_AttributeDisplayExtend
{
    const int ModelId = 0;

}
struct FVM_AttributeDisplayExtend : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_AttributeCompareStateIndex;

    FVM_AttributeDisplayExtend()
    {
        this.m_AttributeCompareStateIndex = INDEX_NONE;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_AttributeDisplayExtend(const FVM_AttributeDisplayExtend &inout Other)
    {
        this.m_AttributeCompareStateIndex = INDEX_NONE;
        this.m_AttributeCompareStateIndex = int(Other.m_AttributeCompareStateIndex);
        return;
    }
    FVM_AttributeDisplayExtend opAssign(const FVM_AttributeDisplayExtend &inout Other)
    {
        FVM_AttributeDisplayExtend __r;
        this.m_AttributeCompareStateIndex = int(Other.m_AttributeCompareStateIndex);
        return __r;
    }
    ESlateVisibility GetCanAttributeCompareStateShow() const
    {
        int local_4;
        if (this.GetAttributeCompareStateIndex() != INDEX_NONE)
        {
            local_4 = 4;
        }
        else
        {
            local_4 = 1;
        }
        return ESlateVisibility(local_4);
    }
    int GetAttributeCompareStateIndex() const property
    {
        this.TrackPropertyRead(0);
        return this.m_AttributeCompareStateIndex;
    }
    void SetAttributeCompareStateIndex(const int __Value) property
    {
        if (this.m_AttributeCompareStateIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_AttributeCompareStateIndex = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_AttributeDisplayExtend
{
    UPROPERTY()
    ESlateVisibility CanAttributeCompareStateShow;
    UPROPERTY()
    TEUIModelRef<FVM_AttributeDisplayExtend> Self;

}

namespace FVM_AttributeDisplayExtend
{
FVM_AttributeDisplayExtend& Create(const UObject ContextObject)
{
    return FVM_AttributeDisplayExtend::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_AttributeDisplayExtend& CreateByManager(const UEUIManagerSubsystem Manager)
{
    return TEUIModelRef<FVM_AttributeDisplayExtend>(EUIInternal::MakeModelWithManager(Manager, FVM_AttributeDisplayExtend::ModelId)).Get();
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "AttributeCompareStateIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CanAttributeCompareStateShow";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AttributeDisplayExtend>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AttributeDisplayExtend;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AttributeDisplayExtend;
}
int __UIGetter_AttributeCompareStateIndex(const FVM_AttributeDisplayExtend &inout Model)
{
    return Model.GetAttributeCompareStateIndex();
}
ESlateVisibility __UIGetter_CanAttributeCompareStateShow(const FVM_AttributeDisplayExtend &inout Model)
{
    return Model.GetCanAttributeCompareStateShow();
}
TEUIModelRef<FVM_AttributeDisplayExtend> __UIGetter_Self(const FVM_AttributeDisplayExtend &inout Model)
{
    return TEUIModelRef<FVM_AttributeDisplayExtend>(Model);
}
int __IndexOf_AttributeCompareStateIndex()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_AttributeDisplayExtend
{
UScriptStruct StaticStruct()
{
    return __GeneratedProperties_FVM_AttributeDisplayExtend.Get();
}
}


namespace FVM_ItemFeature_Count
{
    const int ModelId = 0;

}
struct FVM_ItemFeature_Count : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_CommonItem> m_CommonItemVM;
    UPROPERTY()
    FText m_DisplayText;

    FVM_ItemFeature_Count()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ItemFeature_Count' by default constructor.");
        return;
    }
    FVM_ItemFeature_Count(const FVM_ItemFeature_Count &inout Other)
    {
        this.m_CommonItemVM = Other.m_CommonItemVM;
        this.m_DisplayText = Other.m_DisplayText;
        return;
    }
    FVM_ItemFeature_Count(const TEUIModelRef<FVM_CommonItem> &inout InCommonItemVM)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetCommonItemVM(InCommonItemVM);
        return;
    }
    FVM_ItemFeature_Count& opAssign(const FVM_ItemFeature_Count &inout Other)
    {
        this.m_CommonItemVM = Other.m_CommonItemVM;
        return Other.m_DisplayText;
    }
    TEUIModelRef<FVM_CommonItem> GetCommonItemVM() const property
    {
        this.TrackPropertyRead(0);
        return this.m_CommonItemVM;
    }
    void SetCommonItemVM(const TEUIModelRef<FVM_CommonItem> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonItem> local_2;
        local_2 = this.m_CommonItemVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CommonItemVM = __Value;
        return;
    }
    const FText GetDisplayText() const property
    {
        const FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_DisplayText() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetDisplayText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_DisplayText = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ItemFeature_Count
{
    UPROPERTY()
    TEUIModelRef<FVM_ItemFeature_Count> Self;

    __GeneratedProperties_FVM_ItemFeature_Count()
    {
        return;
    }
}

namespace ItemFeature_Count_Util
{
void SetDisplayText(const FEUIModelContainer &inout ItemModelContainer, const FText &inout DisplayText)
{
    FVM_ItemFeature_Count& local_2 = FEUIModelContainer::GetModel(ItemModelContainer).opCall();
    if (local_2)
    {
        local_2.SetDisplayText(DisplayText);
    }
    return;
}
}
namespace FVM_ItemFeature_Count
{
FVM_ItemFeature_Count& Create(const UObject ContextObject, const TEUIModelRef<FVM_CommonItem> &inout CommonItemVM)
{
    return FVM_ItemFeature_Count::CreateByManager(EUIInternal::GetContextManager(ContextObject), CommonItemVM);
}
FVM_ItemFeature_Count CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FVM_CommonItem> &inout CommonItemVM)
{
    FVM_ItemFeature_Count __r;
    TEUIModelRef<FVM_ItemFeature_Count> local_6 = TEUIModelRef<FVM_ItemFeature_Count>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ItemFeature_Count::ModelId, 0, CommonItemVM));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "DisplayText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ItemFeature_Count>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ItemFeature_Count;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ItemFeature_Count;
}
FText __UIGetter_DisplayText(const FVM_ItemFeature_Count &inout Model)
{
    return Model.GetDisplayText();
}
TEUIModelRef<FVM_ItemFeature_Count> __UIGetter_Self(const FVM_ItemFeature_Count &inout Model)
{
    return TEUIModelRef<FVM_ItemFeature_Count>(Model);
}
int __IndexOf_CommonItemVM()
{
    return 0;
}
int __IndexOf_DisplayText()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_ItemFeature_Count
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

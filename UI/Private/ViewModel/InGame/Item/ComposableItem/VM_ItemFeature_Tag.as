
namespace FVM_ItemFeature_Tag
{
    const int ModelId = 0;

}
struct FVM_ItemFeature_Tag : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_CommonItem> m_CommonItemVM;
    UPROPERTY()
    bool m_bShowTag;
    UPROPERTY()
    FText m_DisplayTagText;

    FVM_ItemFeature_Tag()
    {
        this.m_bShowTag = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ItemFeature_Tag' by default constructor.");
        return;
    }
    FVM_ItemFeature_Tag(const FVM_ItemFeature_Tag &inout Other)
    {
        this.m_bShowTag = false;
        this.m_CommonItemVM = Other.m_CommonItemVM;
        this.m_bShowTag = Other.m_bShowTag;
        this.m_DisplayTagText = Other.m_DisplayTagText;
        return;
    }
    FVM_ItemFeature_Tag(const TEUIModelRef<FVM_CommonItem> &inout InCommonItemVM)
    {
        this.m_bShowTag = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetCommonItemVM(InCommonItemVM);
        return;
    }
    FVM_ItemFeature_Tag& opAssign(const FVM_ItemFeature_Tag &inout Other)
    {
        this.m_CommonItemVM = Other.m_CommonItemVM;
        this.m_bShowTag = Other.m_bShowTag;
        return Other.m_DisplayTagText;
    }
    void PostConstruct()
    {
        return;
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
    bool GetbShowTag() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bShowTag;
    }
    void SetbShowTag(const bool __Value) property
    {
        if (!(this.m_bShowTag) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bShowTag = __Value;
        return;
    }
    const FText GetDisplayTagText() const property
    {
        const FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_DisplayTagText() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetDisplayTagText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_DisplayTagText = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ItemFeature_Tag
{
    UPROPERTY()
    TEUIModelRef<FVM_ItemFeature_Tag> Self;

    __GeneratedProperties_FVM_ItemFeature_Tag()
    {
        return;
    }
}

namespace ItemFeature_Tag_Util
{
void SetIsShowTag(const FEUIModelContainer &inout ItemModelContainer, const bool InIsShowTag)
{
    FVM_ItemFeature_Tag& local_2 = FEUIModelContainer::GetModel(ItemModelContainer).opCall();
    if (local_2)
    {
        local_2.SetbShowTag(InIsShowTag);
    }
    return;
}
void SetDisplayTagText(const FEUIModelContainer &inout ItemModelContainer, const FText &inout InDisplayTagText)
{
    FVM_ItemFeature_Tag& local_2 = FEUIModelContainer::GetModel(ItemModelContainer).opCall();
    if (local_2)
    {
        local_2.SetDisplayTagText(InDisplayTagText);
    }
    return;
}
}
namespace FVM_ItemFeature_Tag
{
FVM_ItemFeature_Tag& Create(const UObject ContextObject, const TEUIModelRef<FVM_CommonItem> &inout CommonItemVM)
{
    return FVM_ItemFeature_Tag::CreateByManager(EUIInternal::GetContextManager(ContextObject), CommonItemVM);
}
FVM_ItemFeature_Tag CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FVM_CommonItem> &inout CommonItemVM)
{
    FVM_ItemFeature_Tag __r;
    TEUIModelRef<FVM_ItemFeature_Tag> local_6 = TEUIModelRef<FVM_ItemFeature_Tag>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ItemFeature_Tag::ModelId, 0, CommonItemVM));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "bShowTag";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayTagText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ItemFeature_Tag>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ItemFeature_Tag;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ItemFeature_Tag;
}
bool __UIGetter_bShowTag(const FVM_ItemFeature_Tag &inout Model)
{
    return Model.GetbShowTag();
}
FText __UIGetter_DisplayTagText(const FVM_ItemFeature_Tag &inout Model)
{
    return Model.GetDisplayTagText();
}
TEUIModelRef<FVM_ItemFeature_Tag> __UIGetter_Self(const FVM_ItemFeature_Tag &inout Model)
{
    return TEUIModelRef<FVM_ItemFeature_Tag>(Model);
}
int __IndexOf_CommonItemVM()
{
    return 0;
}
int __IndexOf_bShowTag()
{
    return 1;
}
int __IndexOf_DisplayTagText()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_ItemFeature_Tag
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}


namespace FVM_Page
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature ClosePage = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature CloseGroup = FEUIModelCallbackSignature();

}
struct FVM_Page : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FEUIWidgetRef m_ViewInstance;

    FVM_Page()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_Page(const FVM_Page &inout Other)
    {
        this.m_ViewInstance = Other.m_ViewInstance;
        return;
    }
    FVM_Page& opAssign(const FVM_Page &inout Other)
    {
        return Other.m_ViewInstance;
    }
    void ClosePage()
    {
        FEUIWidget::RemoveWidget(this.GetViewInstance());
        return;
    }
    void CloseGroup()
    {
        FEUIWidget::RemoveWidget(this.GetViewInstance());
        return;
    }
    const FEUIWidgetRef GetViewInstance() const property
    {
        const FEUIWidgetRef __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FEUIWidgetRef GetModify_ViewInstance() property
    {
        FEUIWidgetRef __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetViewInstance(const FEUIWidgetRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ViewInstance = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_Page
{
    UPROPERTY()
    TEUIModelRef<FVM_Page> Self;

    __GeneratedProperties_FVM_Page()
    {
        return;
    }
}

namespace FVM_Page
{
FVM_Page& Create(const UObject ContextObject)
{
    return FVM_Page::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_Page CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_Page __r;
    TEUIModelRef<FVM_Page> local_6 = TEUIModelRef<FVM_Page>(EUIInternal::MakeModelWithManager(Manager, FVM_Page::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_Page>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_Page;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_Page;
}
TEUIModelRef<FVM_Page> __UIGetter_Self(const FVM_Page &inout Model)
{
    return TEUIModelRef<FVM_Page>(Model);
}
int __IndexOf_ViewInstance()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_Page
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

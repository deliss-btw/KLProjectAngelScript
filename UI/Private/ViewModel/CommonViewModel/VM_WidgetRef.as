
namespace FVM_WidgetRef
{
    const int ModelId = 0;

}
struct FVM_WidgetRef : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TWeakObjectPtr<UWidget> m_WeakWidget;

    FVM_WidgetRef()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_WidgetRef' by default constructor.");
        return;
    }
    FVM_WidgetRef(const FVM_WidgetRef &inout Other)
    {
        this.m_WeakWidget = Other.m_WeakWidget;
        return;
    }
    FVM_WidgetRef(const UWidget InWidget)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetWeakWidget(TWeakObjectPtr<UWidget>(InWidget));
        return;
    }
    FVM_WidgetRef& opAssign(const FVM_WidgetRef &inout Other)
    {
        return Other.m_WeakWidget;
    }
    UWidget GetWidget() const property
    {
        TWeakObjectPtr<UWidget> local_2 = this.GetWeakWidget();
        UWidget local_4;
        return local_4;
    }
    TEUIModelRef<FVM_WidgetRef> GetModelRef() const
    {
        return TEUIModelRef<FVM_WidgetRef>(this);
    }
    TWeakObjectPtr<UWidget> GetWeakWidget() const property
    {
        this.TrackPropertyRead(0);
        return this.m_WeakWidget;
    }
    void SetWeakWidget(const TWeakObjectPtr<UWidget> &inout __Value) property
    {
        if ((this.m_WeakWidget == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_WeakWidget = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_WidgetRef
{
    UPROPERTY()
    TEUIModelRef<FVM_WidgetRef> ModelRef;
    UPROPERTY()
    TEUIModelRef<FVM_WidgetRef> Self;

    __GeneratedProperties_FVM_WidgetRef()
    {
        return;
    }
}

namespace FVM_WidgetRef
{
FVM_WidgetRef& Create(const UObject ContextObject, const UWidget Widget)
{
    return FVM_WidgetRef::CreateByManager(EUIInternal::GetContextManager(ContextObject), Widget);
}
FVM_WidgetRef CreateByManager(const UEUIManagerSubsystem Manager, const UWidget Widget)
{
    FVM_WidgetRef __r;
    TEUIModelRef<FVM_WidgetRef> local_6 = TEUIModelRef<FVM_WidgetRef>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_WidgetRef::ModelId, 0, Widget));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ModelRef";
    local_14.TypeName = "TEUIModelRef<FVM_WidgetRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_WidgetRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_WidgetRef;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_WidgetRef;
}
TEUIModelRef<FVM_WidgetRef> __UIGetter_ModelRef(const FVM_WidgetRef &inout Model)
{
    return Model.GetModelRef();
}
TEUIModelRef<FVM_WidgetRef> __UIGetter_Self(const FVM_WidgetRef &inout Model)
{
    return TEUIModelRef<FVM_WidgetRef>(Model);
}
int __IndexOf_WeakWidget()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_WidgetRef
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

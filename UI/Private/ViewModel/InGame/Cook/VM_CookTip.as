
namespace FVM_CookTip
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnClickCook = FEUIModelCallbackSignature();

}
struct FVM_CookTip : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_InputAction> m_MainActionButton;

    FVM_CookTip()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_CookTip(const FVM_CookTip &inout Other)
    {
        this.m_MainActionButton = Other.m_MainActionButton;
        return;
    }
    FVM_CookTip& opAssign(const FVM_CookTip &inout Other)
    {
        return Other.m_MainActionButton;
    }
    void PostConstruct()
    {
        return;
    }
    void OnClickCook()
    {
        return;
    }
    TEUIModelRef<FVM_InputAction> GetMainActionButton() const property
    {
        this.TrackPropertyRead(0);
        return this.m_MainActionButton;
    }
    void SetMainActionButton(const TEUIModelRef<FVM_InputAction> &inout __Value) property
    {
        TEUIModelRef<FVM_InputAction> local_2;
        local_2 = this.m_MainActionButton;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_MainActionButton = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CookTip
{
    UPROPERTY()
    TEUIModelRef<FVM_CookTip> Self;

    __GeneratedProperties_FVM_CookTip()
    {
        return;
    }
}

namespace FVM_CookTip
{
FVM_CookTip& Create(const UObject ContextObject)
{
    return FVM_CookTip::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_CookTip CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_CookTip __r;
    TEUIModelRef<FVM_CookTip> local_6 = TEUIModelRef<FVM_CookTip>(EUIInternal::MakeModelWithManager(Manager, FVM_CookTip::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "MainActionButton";
    local_14.TypeName = "TEUIModelRef<FVM_InputAction>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CookTip>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CookTip;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CookTip;
}
TEUIModelRef<FVM_InputAction> __UIGetter_MainActionButton(const FVM_CookTip &inout Model)
{
    return Model.GetMainActionButton();
}
TEUIModelRef<FVM_CookTip> __UIGetter_Self(const FVM_CookTip &inout Model)
{
    return TEUIModelRef<FVM_CookTip>(Model);
}
int __IndexOf_MainActionButton()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_CookTip
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

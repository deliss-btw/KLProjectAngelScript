
namespace FVM_EscapeButton
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnClickEscapeButton = FEUIModelCallbackSignature();

}
struct FVM_EscapeButton : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_RedDot> m_RedDot;

    FVM_EscapeButton()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_EscapeButton(const FVM_EscapeButton &inout Other)
    {
        this.m_RedDot = Other.m_RedDot;
        return;
    }
    FVM_EscapeButton& opAssign(const FVM_EscapeButton &inout Other)
    {
        return Other.m_RedDot;
    }
    void PostConstruct()
    {
        this.SetRedDot(TEUIModelRef<FVM_RedDot>(::FVM_RedDot::Create(this.GetContext().Manager, FRedDotNodeData(GameplayTags::RedDotSystem_HUD_ESC, 0))));
        return;
    }
    bool ShouldDisplay() const
    {
        return !(::FMS_SystemControl::Get(this.GetManager()).IsWidgetLocked(GameplayTags::UI_Type_Menu));
    }
    void OnClickEscapeButton()
    {
        if (!(FEUIWidget::FindWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_Menu)))
        {
            FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_Menu);
        }
        return;
    }
    TEUIModelRef<FVM_RedDot> GetRedDot() const property
    {
        this.TrackPropertyRead(0);
        return this.m_RedDot;
    }
    void SetRedDot(const TEUIModelRef<FVM_RedDot> &inout __Value) property
    {
        TEUIModelRef<FVM_RedDot> local_2;
        local_2 = this.m_RedDot;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_RedDot = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_EscapeButton
{
    UPROPERTY()
    bool ShouldDisplay;
    UPROPERTY()
    TEUIModelRef<FVM_EscapeButton> Self;


}

namespace FVM_EscapeButton
{
FVM_EscapeButton& Create(const UObject ContextObject)
{
    return FVM_EscapeButton::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_EscapeButton CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_EscapeButton __r;
    TEUIModelRef<FVM_EscapeButton> local_6 = TEUIModelRef<FVM_EscapeButton>(EUIInternal::MakeModelWithManager(Manager, FVM_EscapeButton::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "RedDot";
    local_14.TypeName = "TEUIModelRef<FVM_RedDot>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShouldDisplay";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_EscapeButton>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_EscapeButton;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_EscapeButton;
}
TEUIModelRef<FVM_RedDot> __UIGetter_RedDot(const FVM_EscapeButton &inout Model)
{
    return Model.GetRedDot();
}
bool __UIGetter_ShouldDisplay(const FVM_EscapeButton &inout Model)
{
    return Model.ShouldDisplay();
}
TEUIModelRef<FVM_EscapeButton> __UIGetter_Self(const FVM_EscapeButton &inout Model)
{
    return TEUIModelRef<FVM_EscapeButton>(Model);
}
int __IndexOf_RedDot()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_EscapeButton
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}


namespace FVM_LoginButton
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnButtonClick = FEUIModelCallbackSignature();

}
struct FVM_LoginButton : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    ELoginButtonType m_ButtonType;
    UPROPERTY()
    FText m_ButtonText;
    UPROPERTY()
    bool m_bIsVisible;

    FVM_LoginButton()
    {
        this.m_ButtonType = ELoginButtonType(0);
        this.m_bIsVisible = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_LoginButton' by default constructor.");
        return;
    }
    FVM_LoginButton(const FVM_LoginButton &inout Other)
    {
        this.m_ButtonType = ELoginButtonType(0);
        this.m_bIsVisible = true;
        this.m_ButtonType = Other.m_ButtonType;
        this.m_ButtonText = Other.m_ButtonText;
        this.m_bIsVisible = Other.m_bIsVisible;
        return;
    }
    FVM_LoginButton(const ELoginButtonType InButtonType)
    {
        this.m_ButtonType = ELoginButtonType(0);
        this.m_bIsVisible = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetButtonType(ELoginButtonType(InButtonType));
        return;
    }
    FVM_LoginButton opAssign(const FVM_LoginButton &inout Other)
    {
        FVM_LoginButton __r;
        this.m_ButtonType = Other.m_ButtonType;
        this.m_ButtonText = Other.m_ButtonText;
        this.m_bIsVisible = Other.m_bIsVisible;
        return __r;
    }
    ESlateVisibility GetButtonVisibility() const
    {
        int local_2;
        if (this.GetbIsVisible())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
    }
    void Init(const FLoginButtonInfo &inout ButtonInfo)
    {
        this.SetButtonText(::LoginSystemUtil::ResolveLoginTextData(ButtonInfo.ButtonTextData));
        bool local_5 = !(ButtonInfo.bHidden);
        this.SetbIsVisible(local_5);
        return;
    }
    void SetVisible(const bool bInVisible)
    {
        if (!(this.GetbIsVisible()) == !(bInVisible))
        {
            return;
        }
        this.SetbIsVisible(bInVisible);
        return;
    }
    void OnButtonClick()
    {
        ::FVMS_Login::Get(this.GetContext().Manager).HandleLoginButtonClick(this.GetButtonType());
        return;
    }
    ELoginButtonType GetButtonType() const property
    {
        this.TrackPropertyRead(0);
        return this.m_ButtonType;
    }
    void SetButtonType(const ELoginButtonType __Value) property
    {
        if (int(this.m_ButtonType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ButtonType = __Value;
        return;
    }
    const FText GetButtonText() const property
    {
        const FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_ButtonText() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetButtonText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ButtonText = __Value;
        return;
    }
    bool GetbIsVisible() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bIsVisible;
    }
    void SetbIsVisible(const bool __Value) property
    {
        if (!(this.m_bIsVisible) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bIsVisible = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_LoginButton
{
    UPROPERTY()
    ESlateVisibility ButtonVisibility;
    UPROPERTY()
    TEUIModelRef<FVM_LoginButton> Self;


}

namespace FVM_LoginButton
{
FVM_LoginButton& Create(const UObject ContextObject, const ELoginButtonType ButtonType)
{
    return FVM_LoginButton::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_LoginButton CreateByManager(const UEUIManagerSubsystem Manager, const ELoginButtonType ButtonType)
{
    FVM_LoginButton __r;
    TEUIModelRef<FVM_LoginButton> local_6 = TEUIModelRef<FVM_LoginButton>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_LoginButton::ModelId, 0, ButtonType));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ButtonText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ButtonVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_LoginButton>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_LoginButton;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_LoginButton;
}
FText __UIGetter_ButtonText(const FVM_LoginButton &inout Model)
{
    return Model.GetButtonText();
}
ESlateVisibility __UIGetter_ButtonVisibility(const FVM_LoginButton &inout Model)
{
    return Model.GetButtonVisibility();
}
TEUIModelRef<FVM_LoginButton> __UIGetter_Self(const FVM_LoginButton &inout Model)
{
    return TEUIModelRef<FVM_LoginButton>(Model);
}
int __IndexOf_ButtonType()
{
    return 0;
}
int __IndexOf_ButtonText()
{
    return 1;
}
int __IndexOf_bIsVisible()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_LoginButton
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

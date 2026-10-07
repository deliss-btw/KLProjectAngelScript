
namespace FVM_CommonDialog
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnActionListCallback = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature CloseDialogWithoutOption = FEUIModelCallbackSignature();

}
struct FVM_CommonDialog : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_Title;
    UPROPERTY()
    FText m_Message;
    UPROPERTY()
    TArray<FCommonDialogOption> m_Options;
    UPROPERTY()
    FDialogCallback m_Callback;
    UPROPERTY()
    TEUIModelRef<FVM_InputActionList> m_ActionList;
    UPROPERTY()
    bool m_bShouldClose;
    UPROPERTY()
    bool m_bIsForbidIgnored;

    FVM_CommonDialog()
    {
        this.m_bShouldClose = false;
        this.m_bIsForbidIgnored = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommonDialog' by default constructor.");
        return;
    }
    FVM_CommonDialog(const FVM_CommonDialog &inout Other)
    {
        this.m_bShouldClose = false;
        this.m_bIsForbidIgnored = false;
        this.m_Title = Other.m_Title;
        this.m_Message = Other.m_Message;
        this.m_Options = Other.m_Options;
        this.m_ActionList = Other.m_ActionList;
        this.m_bShouldClose = Other.m_bShouldClose;
        this.m_bIsForbidIgnored = Other.m_bIsForbidIgnored;
        return;
    }
    FVM_CommonDialog(const FText &inout InTitle, const FText &inout InMessage, const TArray<FCommonDialogOption> &inout InOptions, const FDialogCallback &inout InCallback)
    {
        this.m_bShouldClose = false;
        this.m_bIsForbidIgnored = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTitle(InTitle);
        this.SetMessage(InMessage);
        this.SetOptions(InOptions);
        this.SetCallback(InCallback);
        return;
    }
    FVM_CommonDialog opAssign(const FVM_CommonDialog &inout Other)
    {
        FVM_CommonDialog __r;
        this.m_Title = Other.m_Title;
        this.m_Message = Other.m_Message;
        this.m_Options = Other.m_Options;
        this.m_ActionList = Other.m_ActionList;
        this.m_bShouldClose = Other.m_bShouldClose;
        this.m_bIsForbidIgnored = Other.m_bIsForbidIgnored;
        return __r;
    }
    void PostConstruct()
    {
        FInputActionListConstructParam local_4;
        for (auto& local_20 : this.GetOptions())
        {
            if (local_20.OptionTextOverride.IsEmpty())
            {
                local_4.InputActionListConstructParamItems.Add(FInputActionListConstructParamItem(local_20.OptionAction));
                continue;
            }
            local_4.InputActionListConstructParamItems.Add(FInputActionListConstructParamItem(local_20.OptionAction, local_20.OptionTextOverride));
        }
        FInputActionListCallback local_164;
        local_164.Add(this, FVM_CommonDialog::OnActionListCallback);
        this.SetActionList(TEUIModelRef<FVM_InputActionList>(::FVM_InputActionList::Create(this.GetContext().Manager, local_4, local_164)));
        return;
    }
    void OnActionListCallback(const int Index)
    {
        this.HandleAction(this.GetOptions()[Index].OptionType, Index);
        return;
    }
    void CloseDialogWithoutOption()
    {
        if (this.GetbIsForbidIgnored())
        {
            return;
        }
        this.HandleAction(ECommonDialogAnswerType(0), INDEX_NONE);
        return;
    }
    void ForceClose()
    {
        this.SetbShouldClose(true);
        return;
    }
    void HandleAction(const ECommonDialogAnswerType Type, const int Index)
    {
        FCommonDialogAnswer local_2;
        local_2.AnswerType = Type;
        local_2.OptionIndex = Index;
        if (this.GetCallback().Call(local_2))
        {
            this.SetbShouldClose(true);
        }
        return;
    }
    FText GetTitle() const property
    {
        FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_Title() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTitle(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Title = __Value;
        return;
    }
    FText GetMessage() const property
    {
        FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_Message() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetMessage(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Message = __Value;
        return;
    }
    TArray<FCommonDialogOption> GetOptions() const property
    {
        TArray<FCommonDialogOption> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<FCommonDialogOption> GetModify_Options() property
    {
        TArray<FCommonDialogOption> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetOptions(const TArray<FCommonDialogOption> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_Options = __Value;
        return;
    }
    const FDialogCallback GetCallback() const property
    {
        const FDialogCallback __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FDialogCallback GetModify_Callback() property
    {
        FDialogCallback __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetCallback(const FDialogCallback &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        return;
    }
    TEUIModelRef<FVM_InputActionList> GetActionList() const property
    {
        this.TrackPropertyRead(4);
        return this.m_ActionList;
    }
    void SetActionList(const TEUIModelRef<FVM_InputActionList> &inout __Value) property
    {
        TEUIModelRef<FVM_InputActionList> local_2;
        local_2 = this.m_ActionList;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_ActionList = __Value;
        return;
    }
    bool GetbShouldClose() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bShouldClose;
    }
    void SetbShouldClose(const bool __Value) property
    {
        if (!(this.m_bShouldClose) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bShouldClose = __Value;
        return;
    }
    bool GetbIsForbidIgnored() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bIsForbidIgnored;
    }
    void SetbIsForbidIgnored(const bool __Value) property
    {
        if (!(this.m_bIsForbidIgnored) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bIsForbidIgnored = __Value;
        return;
    }
}

delegate void FCommonDialogClose(const bool bCloseGroup);

struct __GeneratedProperties_FVM_CommonDialog
{
    UPROPERTY()
    TEUIModelRef<FVM_CommonDialog> Self;

    __GeneratedProperties_FVM_CommonDialog()
    {
        return;
    }
}

namespace FVM_CommonDialog
{
FVM_CommonDialog& Create(const UObject ContextObject, const FText &inout Title, const FText &inout Message, const TArray<FCommonDialogOption> &inout Options, const FDialogCallback &inout Callback)
{
    return FVM_CommonDialog::CreateByManager(EUIInternal::GetContextManager(ContextObject), Title, Message, Options, Callback);
}
FVM_CommonDialog CreateByManager(const UEUIManagerSubsystem Manager, const FText &inout Title, const FText &inout Message, const TArray<FCommonDialogOption> &inout Options, const FDialogCallback &inout Callback)
{
    FVM_CommonDialog __r;
    TEUIModelRef<FVM_CommonDialog> local_6 = TEUIModelRef<FVM_CommonDialog>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommonDialog::ModelId, 0, Title, Message, Options, Callback));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Title";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Message";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ActionList";
    local_14.TypeName = "TEUIModelRef<FVM_InputActionList>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonDialog>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonDialog;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonDialog;
}
FText __UIGetter_Title(const FVM_CommonDialog &inout Model)
{
    return Model.GetTitle();
}
FText __UIGetter_Message(const FVM_CommonDialog &inout Model)
{
    return Model.GetMessage();
}
TEUIModelRef<FVM_InputActionList> __UIGetter_ActionList(const FVM_CommonDialog &inout Model)
{
    return Model.GetActionList();
}
TEUIModelRef<FVM_CommonDialog> __UIGetter_Self(const FVM_CommonDialog &inout Model)
{
    return TEUIModelRef<FVM_CommonDialog>(Model);
}
int __IndexOf_Title()
{
    return 0;
}
int __IndexOf_Message()
{
    return 1;
}
int __IndexOf_Options()
{
    return 2;
}
int __IndexOf_Callback()
{
    return 3;
}
int __IndexOf_ActionList()
{
    return 4;
}
int __IndexOf_bShouldClose()
{
    return 5;
}
int __IndexOf_bIsForbidIgnored()
{
    return 6;
}
}
namespace __GeneratedProperties_FVM_CommonDialog
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

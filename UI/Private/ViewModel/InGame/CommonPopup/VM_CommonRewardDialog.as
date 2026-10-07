
namespace FVM_CommonRewardDialog
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnConfirm = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnCancel = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnClose = FEUIModelCallbackSignature();

}
struct FVM_CommonRewardDialog : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_Title;
    UPROPERTY()
    FText m_Description;
    UPROPERTY()
    TEUIModelRef<FVM_CommonRewardList> m_RewardList;
    UPROPERTY()
    TArray<FCommonDialogOption> m_Options;
    UPROPERTY()
    FDialogCallback m_Callback;
    UPROPERTY()
    FCommonRewardDialogClose m_CloseDelegate;
    UPROPERTY()
    FText m_RewardHint;

    FVM_CommonRewardDialog()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommonRewardDialog' by default constructor.");
        return;
    }
    FVM_CommonRewardDialog(const FVM_CommonRewardDialog &inout Other)
    {
        this.m_Title = Other.m_Title;
        this.m_Description = Other.m_Description;
        this.m_RewardList = Other.m_RewardList;
        this.m_Options = Other.m_Options;
        this.m_CloseDelegate = Other.m_CloseDelegate;
        this.m_RewardHint = Other.m_RewardHint;
        return;
    }
    FVM_CommonRewardDialog(const FText &inout InTitle, const FText &inout InDescription, const TEUIModelRef<FVM_CommonRewardList> &inout InRewardList, const TArray<FCommonDialogOption> &inout InOptions, const FDialogCallback &inout InCallback)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTitle(InTitle);
        this.SetDescription(InDescription);
        this.SetRewardList(InRewardList);
        this.SetOptions(InOptions);
        this.SetCallback(InCallback);
        return;
    }
    FVM_CommonRewardDialog& opAssign(const FVM_CommonRewardDialog &inout Other)
    {
        this.m_Title = Other.m_Title;
        this.m_Description = Other.m_Description;
        this.m_RewardList = Other.m_RewardList;
        this.m_Options = Other.m_Options;
        this.m_CloseDelegate = Other.m_CloseDelegate;
        return Other.m_RewardHint;
    }
    bool HasDescription() const
    {
        return !(this.GetDescription().IsEmpty());
    }
    void SetRewardHintText(const FText &inout InRewardHintText)
    {
        this.SetRewardHint(InRewardHintText);
        return;
    }
    bool HasRewardHint() const
    {
        return !(this.GetRewardHint().IsEmpty());
    }
    TArray<TEUIModelRef<FVM_CommonRewardItem>> GetRewards() const property
    {
        if (this.GetRewardList().IsValid())
        {
            TEUIModelRef<FVM_CommonRewardList> local_2 = this.GetRewardList();
            return GetRewards();
        }
        return TArray<TEUIModelRef<FVM_CommonRewardItem>>();
    }
    void OnConfirm()
    {
        this.HandleAction(ECommonDialogAnswerType(1));
        return;
    }
    void OnCancel()
    {
        this.HandleAction(ECommonDialogAnswerType(2));
        return;
    }
    void OnClose()
    {
        this.HandleAction(ECommonDialogAnswerType(0));
        return;
    }
    void HandleAction(const ECommonDialogAnswerType Type)
    {
        FCommonDialogAnswer local_2;
        local_2.AnswerType = Type;
        if (this.GetCallback().Call(local_2))
        {
            this.GetCloseDelegate().Execute(false);
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
    FText GetDescription() const property
    {
        FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_Description() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetDescription(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Description = __Value;
        return;
    }
    TEUIModelRef<FVM_CommonRewardList> GetRewardList() const property
    {
        this.TrackPropertyRead(2);
        return this.m_RewardList;
    }
    void SetRewardList(const TEUIModelRef<FVM_CommonRewardList> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonRewardList> local_2;
        local_2 = this.m_RewardList;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_RewardList = __Value;
        return;
    }
    TArray<FCommonDialogOption> GetOptions() const property
    {
        TArray<FCommonDialogOption> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<FCommonDialogOption> GetModify_Options() property
    {
        TArray<FCommonDialogOption> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetOptions(const TArray<FCommonDialogOption> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_Options = __Value;
        return;
    }
    const FDialogCallback GetCallback() const property
    {
        const FDialogCallback __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FDialogCallback GetModify_Callback() property
    {
        FDialogCallback __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetCallback(const FDialogCallback &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        return;
    }
    const FCommonRewardDialogClose GetCloseDelegate() const property
    {
        const FCommonRewardDialogClose __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FCommonRewardDialogClose GetModify_CloseDelegate() property
    {
        FCommonRewardDialogClose __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetCloseDelegate(const FCommonRewardDialogClose &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_CloseDelegate = __Value;
        return;
    }
    const FText GetRewardHint() const property
    {
        const FText __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FText GetModify_RewardHint() property
    {
        FText __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetRewardHint(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_RewardHint = __Value;
        return;
    }
}

delegate void FCommonRewardDialogClose(const bool bCloseGroup);

struct __GeneratedProperties_FVM_CommonRewardDialog
{
    UPROPERTY()
    bool HasDescription;
    UPROPERTY()
    bool HasRewardHint;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CommonRewardItem>> Rewards;
    UPROPERTY()
    TEUIModelRef<FVM_CommonRewardDialog> Self;


}

namespace FVM_CommonRewardDialog
{
FVM_CommonRewardDialog& Create(const UObject ContextObject, const FText &inout Title, const FText &inout Description, const TEUIModelRef<FVM_CommonRewardList> &inout RewardList, const TArray<FCommonDialogOption> &inout Options, const FDialogCallback &inout Callback)
{
    return FVM_CommonRewardDialog::CreateByManager(EUIInternal::GetContextManager(ContextObject), Title, Description, RewardList, Options, Callback);
}
FVM_CommonRewardDialog CreateByManager(const UEUIManagerSubsystem Manager, const FText &inout Title, const FText &inout Description, const TEUIModelRef<FVM_CommonRewardList> &inout RewardList, const TArray<FCommonDialogOption> &inout Options, const FDialogCallback &inout Callback)
{
    FVM_CommonRewardDialog __r;
    TEUIModelRef<FVM_CommonRewardDialog> local_6 = TEUIModelRef<FVM_CommonRewardDialog>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommonRewardDialog::ModelId, 0, Title, Description, RewardList, Options, Callback));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Title";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Description";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RewardList";
    local_14.TypeName = "TEUIModelRef<FVM_CommonRewardList>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RewardHint";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasDescription";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasRewardHint";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Rewards";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_CommonRewardItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonRewardDialog>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonRewardDialog;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonRewardDialog;
}
FText __UIGetter_Title(const FVM_CommonRewardDialog &inout Model)
{
    return Model.GetTitle();
}
FText __UIGetter_Description(const FVM_CommonRewardDialog &inout Model)
{
    return Model.GetDescription();
}
TEUIModelRef<FVM_CommonRewardList> __UIGetter_RewardList(const FVM_CommonRewardDialog &inout Model)
{
    return Model.GetRewardList();
}
FText __UIGetter_RewardHint(const FVM_CommonRewardDialog &inout Model)
{
    return Model.GetRewardHint();
}
bool __UIGetter_HasDescription(const FVM_CommonRewardDialog &inout Model)
{
    return Model.HasDescription();
}
bool __UIGetter_HasRewardHint(const FVM_CommonRewardDialog &inout Model)
{
    return Model.HasRewardHint();
}
TArray<TEUIModelRef<FVM_CommonRewardItem>> __UIGetter_Rewards(const FVM_CommonRewardDialog &inout Model)
{
    return Model.GetRewards();
}
TEUIModelRef<FVM_CommonRewardDialog> __UIGetter_Self(const FVM_CommonRewardDialog &inout Model)
{
    return TEUIModelRef<FVM_CommonRewardDialog>(Model);
}
int __IndexOf_Title()
{
    return 0;
}
int __IndexOf_Description()
{
    return 1;
}
int __IndexOf_RewardList()
{
    return 2;
}
int __IndexOf_Options()
{
    return 3;
}
int __IndexOf_Callback()
{
    return 4;
}
int __IndexOf_CloseDelegate()
{
    return 5;
}
int __IndexOf_RewardHint()
{
    return 6;
}
}
namespace __GeneratedProperties_FVM_CommonRewardDialog
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}


namespace FVM_GiveEcho
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature SetContent = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature ConfirmContent = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature CancelRename = FEUIModelCallbackSignature();

}
struct FVM_GiveEcho : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FString m_InputString;
    UPROPERTY()
    FStringValidationHelper m_StringValidationHelper;
    UPROPERTY()
    bool m_bWaitingForGSReply;
    UPROPERTY()
    bool m_bShouldClose;

    FVM_GiveEcho()
    {
        this.m_bWaitingForGSReply = false;
        this.m_bShouldClose = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_GiveEcho(const FVM_GiveEcho &inout Other)
    {
        this.m_bWaitingForGSReply = false;
        this.m_bShouldClose = false;
        this.m_InputString = Other.m_InputString;
        this.m_bWaitingForGSReply = Other.m_bWaitingForGSReply;
        this.m_bShouldClose = Other.m_bShouldClose;
        return;
    }
    FVM_GiveEcho opAssign(const FVM_GiveEcho &inout Other)
    {
        FVM_GiveEcho __r;
        this.m_InputString = Other.m_InputString;
        this.m_bWaitingForGSReply = Other.m_bWaitingForGSReply;
        this.m_bShouldClose = Other.m_bShouldClose;
        return __r;
    }
    bool HasErrorMessage() const
    {
        return (int(this.GetStringValidationHelper().GetValidationResult()) == 1);
    }
    FText GetErrorMessage() const
    {
        return this.GetStringValidationHelper().GetFailReason();
    }
    void SetContent(const FString &inout InName)
    {
        FString local_4 = InName;
        KLText::RemoveEmojiFromString(local_4);
        this.SetInputString(local_4);
        this.GetModify_StringValidationHelper().SetString(this.GetInputString());
        this.GetModify_StringValidationHelper().StartValidation();
        return;
    }
    void ConfirmContent()
    {
        this.SetbShouldClose(true);
        return;
    }
    void CancelRename()
    {
        this.GetModify_StringValidationHelper().StopValidation();
        this.SetbShouldClose(true);
        return;
    }
    void PostConstruct()
    {
        return;
    }
    void Tick()
    {
        this.GetModify_StringValidationHelper().TickValidation();
        return;
    }
    void OnChangeNameResult(const FMsg_LocalPlayerChangeNameRsp &inout Msg)
    {
        if (int(Msg.RetCode) == 0)
        {
            this.SetbShouldClose(true);
        }
        this.SetbWaitingForGSReply(false);
        return;
    }
    const FString GetInputString() const property
    {
        const FString __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FString GetModify_InputString() property
    {
        FString __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetInputString(const FString &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_InputString = __Value;
        return;
    }
    const FStringValidationHelper GetStringValidationHelper() const property
    {
        const FStringValidationHelper __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FStringValidationHelper GetModify_StringValidationHelper() property
    {
        FStringValidationHelper __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetStringValidationHelper(const FStringValidationHelper &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        return;
    }
    bool GetbWaitingForGSReply() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bWaitingForGSReply;
    }
    void SetbWaitingForGSReply(const bool __Value) property
    {
        if (!(this.m_bWaitingForGSReply) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bWaitingForGSReply = __Value;
        return;
    }
    bool GetbShouldClose() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bShouldClose;
    }
    void SetbShouldClose(const bool __Value) property
    {
        if (!(this.m_bShouldClose) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bShouldClose = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_GiveEcho
{
    UPROPERTY()
    bool HasErrorMessage;
    UPROPERTY()
    FText ErrorMessage;
    UPROPERTY()
    TEUIModelRef<FVM_GiveEcho> Self;


}

namespace FVM_GiveEcho
{
FVM_GiveEcho& Create(const UObject ContextObject)
{
    return FVM_GiveEcho::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_GiveEcho CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_GiveEcho __r;
    TEUIModelRef<FVM_GiveEcho> local_6 = TEUIModelRef<FVM_GiveEcho>(EUIInternal::MakeModelWithManager(Manager, FVM_GiveEcho::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "HasErrorMessage";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ErrorMessage";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_GiveEcho>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_GiveEcho;
    Result.TickFunction.FunctionName = "__Tick";
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__OnChangeNameResult";
    local_26.MessageTypeName = "Msg_LocalPlayerChangeNameRsp";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_GiveEcho;
}
void __Tick(FVM_GiveEcho &inout Model)
{
    Model.Tick();
    return;
}
void __OnChangeNameResult(FVM_GiveEcho &inout Model, const FMsg_LocalPlayerChangeNameRsp &inout Message)
{
    Model.OnChangeNameResult(Message);
    return;
}
bool __UIGetter_HasErrorMessage(const FVM_GiveEcho &inout Model)
{
    return Model.HasErrorMessage();
}
FText __UIGetter_ErrorMessage(const FVM_GiveEcho &inout Model)
{
    return Model.GetErrorMessage();
}
TEUIModelRef<FVM_GiveEcho> __UIGetter_Self(const FVM_GiveEcho &inout Model)
{
    return TEUIModelRef<FVM_GiveEcho>(Model);
}
int __IndexOf_InputString()
{
    return 0;
}
int __IndexOf_StringValidationHelper()
{
    return 1;
}
int __IndexOf_bWaitingForGSReply()
{
    return 2;
}
int __IndexOf_bShouldClose()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_GiveEcho
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

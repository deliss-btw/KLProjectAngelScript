
namespace FVM_PlayerRename
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature SetName = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature ConfirmRename = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature CancelRename = FEUIModelCallbackSignature();

}
struct FVM_PlayerRename : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FString m_InputName;
    UPROPERTY()
    FStringValidationHelper m_StringValidationHelper;
    UPROPERTY()
    bool m_bWaitingForGSReply;
    UPROPERTY()
    bool m_bShouldClose;

    FVM_PlayerRename()
    {
        this.m_bWaitingForGSReply = false;
        this.m_bShouldClose = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_PlayerRename(const FVM_PlayerRename &inout Other)
    {
        this.m_bWaitingForGSReply = false;
        this.m_bShouldClose = false;
        this.m_InputName = Other.m_InputName;
        this.m_bWaitingForGSReply = Other.m_bWaitingForGSReply;
        this.m_bShouldClose = Other.m_bShouldClose;
        return;
    }
    FVM_PlayerRename opAssign(const FVM_PlayerRename &inout Other)
    {
        FVM_PlayerRename __r;
        this.m_InputName = Other.m_InputName;
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
    void SetName(const FString &inout InName)
    {
        FString local_4 = InName;
        KLText::RemoveEmojiFromString(local_4);
        this.SetInputName(local_4);
        this.GetModify_StringValidationHelper().SetString(this.GetInputName());
        this.GetModify_StringValidationHelper().StartValidation();
        return;
    }
    void ConfirmRename()
    {
        if (this.GetbWaitingForGSReply())
        {
            return;
        }
        EStringValidationResult local_2 = this.GetStringValidationHelper().GetValidationResult();
        if ((int(local_2)) == 2)
        {
            if (!(this.GetStringValidationHelper().IsStarted()))
            {
                this.GetModify_StringValidationHelper().StartValidation();
            }
            return;
        }
        if ((int(local_2)) == 0)
        {
            this.SetbWaitingForGSReply(true);
            ::FM_LocalPlayerLevel::Get(this.GetManager()).GS_RequestChangePlayerName(this.GetInputName());
        }
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
        const UPlayerInfoSettings local_2;
        GetGameplaySettings<UPlayerInfoSettings> local_4;
        local_2 = local_4;
        if (local_2.PlayerNameValidator != nullptr)
        {
            this.GetModify_StringValidationHelper().SetConfigAsset(local_2.PlayerNameValidator);
            return;
        }
        XWarning(ELog(16), "Player name validator not set, will not check for name validate");
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
    const FString GetInputName() const property
    {
        const FString __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FString GetModify_InputName() property
    {
        FString __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetInputName(const FString &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_InputName = __Value;
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

struct __GeneratedProperties_FVM_PlayerRename
{
    UPROPERTY()
    bool HasErrorMessage;
    UPROPERTY()
    FText ErrorMessage;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerRename> Self;


}

namespace FVM_PlayerRename
{
FVM_PlayerRename& Create(const UObject ContextObject)
{
    return FVM_PlayerRename::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_PlayerRename CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_PlayerRename __r;
    TEUIModelRef<FVM_PlayerRename> local_6 = TEUIModelRef<FVM_PlayerRename>(EUIInternal::MakeModelWithManager(Manager, FVM_PlayerRename::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "InputName";
    local_14.TypeName = "FString";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
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
    local_14.TypeName = "TEUIModelRef<FVM_PlayerRename>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_PlayerRename;
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
    return FVM_PlayerRename;
}
void __Tick(FVM_PlayerRename &inout Model)
{
    Model.Tick();
    return;
}
void __OnChangeNameResult(FVM_PlayerRename &inout Model, const FMsg_LocalPlayerChangeNameRsp &inout Message)
{
    Model.OnChangeNameResult(Message);
    return;
}
FString __UIGetter_InputName(const FVM_PlayerRename &inout Model)
{
    return Model.GetInputName();
}
bool __UIGetter_HasErrorMessage(const FVM_PlayerRename &inout Model)
{
    return Model.HasErrorMessage();
}
FText __UIGetter_ErrorMessage(const FVM_PlayerRename &inout Model)
{
    return Model.GetErrorMessage();
}
TEUIModelRef<FVM_PlayerRename> __UIGetter_Self(const FVM_PlayerRename &inout Model)
{
    return TEUIModelRef<FVM_PlayerRename>(Model);
}
int __IndexOf_InputName()
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
namespace __GeneratedProperties_FVM_PlayerRename
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

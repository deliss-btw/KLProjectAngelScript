enum EChatMessageShowType
{
    Other,
    Self,
    SystemMiddle,
    SystemLeft,
}

namespace FVM_ChatMessage
{
    const int ModelId = 0;

}
struct FVM_ChatMessage : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_ChatMessage> m_Message;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerBasicItem> m_SenderBasicItem;
    UPROPERTY()
    FString m_MessageSenderName;
    UPROPERTY()
    FText m_MessageText;
    UPROPERTY()
    FString m_SendTime;
    UPROPERTY()
    int m_ContextTypeIndex;
    UPROPERTY()
    bool m_bIsPlayerSelf;
    UPROPERTY()
    EChatMessageShowType m_ShowMessageType;
    UPROPERTY()
    int m_ShowMessageTypeIndex;

    FVM_ChatMessage()
    {
        this.m_ContextTypeIndex = 0;
        this.m_bIsPlayerSelf = false;
        this.m_ShowMessageType = EChatMessageShowType(0);
        this.m_ShowMessageTypeIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ChatMessage' by default constructor.");
        return;
    }
    FVM_ChatMessage(const FVM_ChatMessage &inout Other)
    {
        this.m_ContextTypeIndex = 0;
        this.m_bIsPlayerSelf = false;
        this.m_ShowMessageType = EChatMessageShowType(0);
        this.m_ShowMessageTypeIndex = 0;
        this.m_Message = Other.m_Message;
        this.m_SenderBasicItem = Other.m_SenderBasicItem;
        this.m_MessageSenderName = Other.m_MessageSenderName;
        this.m_MessageText = Other.m_MessageText;
        this.m_SendTime = Other.m_SendTime;
        this.m_ContextTypeIndex = int(Other.m_ContextTypeIndex);
        this.m_bIsPlayerSelf = Other.m_bIsPlayerSelf;
        this.m_ShowMessageType = Other.m_ShowMessageType;
        this.m_ShowMessageTypeIndex = int(Other.m_ShowMessageTypeIndex);
        return;
    }
    FVM_ChatMessage(const TEUIModelRef<FM_ChatMessage> &inout InMessage)
    {
        this.m_ContextTypeIndex = 0;
        this.m_bIsPlayerSelf = false;
        this.m_ShowMessageType = EChatMessageShowType(0);
        this.m_ShowMessageTypeIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetMessage(InMessage);
        return;
    }
    FVM_ChatMessage opAssign(const FVM_ChatMessage &inout Other)
    {
        FVM_ChatMessage __r;
        this.m_Message = Other.m_Message;
        this.m_SenderBasicItem = Other.m_SenderBasicItem;
        this.m_MessageSenderName = Other.m_MessageSenderName;
        this.m_MessageText = Other.m_MessageText;
        this.m_SendTime = Other.m_SendTime;
        this.m_ContextTypeIndex = int(Other.m_ContextTypeIndex);
        this.m_bIsPlayerSelf = Other.m_bIsPlayerSelf;
        this.m_ShowMessageType = Other.m_ShowMessageType;
        this.m_ShowMessageTypeIndex = int(Other.m_ShowMessageTypeIndex);
        return __r;
    }
    void PostConstruct()
    {
        int local_43;
        int local_94;
        FPlayerBriefInfo local_18 = FPlayerBriefInfo(this.GetMessage().Get().GetSenderBrief());
        int local_21 = local_18.GetUid();
        if (local_21 != 0)
        {
            this.SetSenderBasicItem(TEUIModelRef<FVM_PlayerBasicItem>(::FVM_PlayerBasicItem::Create(this.GetManager(), local_18)));
        }
        if (local_18.GetNickname().IsEmpty())
        {
            this.SetMessageSenderName(FString().Append(local_18.GetUid()));
        }
        else
        {
            this.SetMessageSenderName(local_18.GetNickname());
        }
        int local_22 = this.GetMessage().Get().GetSystemContentDataId();
        if (local_22 != 0)
        {
            this.SetMessageText(::FMS_ChatDataModel::Get(this.GetManager()).BuildSystemBodyText(this.GetMessage().Get().GetSystemContentDataId(), this.GetMessage().Get().GetSystemContentArgs()));
        }
        else
        {
            this.SetMessageText(this.GetMessage().Get().GetContentFinalText());
        }
        this.SetContextTypeIndex(0);
        this.SetSendTime(::ChatSystemUtil::FormatUnixTimestampToHHmm(::ChatSystemUtil::MsToUnixSeconds(this.GetMessage().Get().GetSendTimeMs())));
        this.SetbIsPlayerSelf(this.GetMessage().Get().IsPlayerSelf());
        if (this.GetMessage().Get().GetbIsVirtualSystemMessage())
        {
            this.SetShowMessageType(EChatMessageShowType(2));
            this.SetContextTypeIndex(0);
        }
        else
        {
            if (this.GetMessage().Get().GetSenderType() == 1)
            {
                this.SetShowMessageType(EChatMessageShowType(3));
                this.SetContextTypeIndex(1);
                if (!(this.GetMessage().Get().GetbIsNpcDialogue()))
                {
                    int local_44;
                    local_44 = this.GetMessage().Get().GetSystemContentDataId();
                    TDataObjectPtr<FChatContentConfig> local_92 = ::FChatContentConfig::GetByDataId(local_44);
                    if (local_92.IsSet())
                    {
                        if (local_92.Get().bIsShowInMiddle)
                        {
                            local_43 = 2;
                        }
                        else
                        {
                            local_43 = 3;
                        }
                        this.SetShowMessageType(EChatMessageShowType(local_43));
                    }
                }
            }
            else
            {
                if (this.GetMessage().Get().GetChannelType() == 7)
                {
                    if (this.GetbIsPlayerSelf())
                    {
                        local_94 = 1;
                    }
                    else
                    {
                        local_94 = 0;
                    }
                    this.SetShowMessageType(EChatMessageShowType(local_94));
                }
                else
                {
                    if (this.GetbIsPlayerSelf())
                    {
                        local_94 = 1;
                    }
                    else
                    {
                        local_94 = 0;
                    }
                    this.SetShowMessageType(EChatMessageShowType(local_94));
                }
            }
        }
        this.SetShowMessageTypeIndex(int(this.GetShowMessageType()));
        return;
    }
    void PostLoad()
    {
        if (this.GetMessage())
        {
            this.GetMessage().Get().SetbIsRead(true);
            XLog(ELog(74), FString().Append("Message Read : ").Append(this.GetMessage().Get().GetbIsRead()).Append(" ").Append(this.GetMessage().Get().GetSenderBrief().GetUid()));
            if ((int(::ChatSystemUtil::TryPbChannelToChannelTab(this.GetMessage().Get().GetChannelType()))) == 6 || (this.GetMessage().Get().GetSenderType() == 2))
            {
                int local_17;
                local_17 = this.GetMessage().Get().GetSenderBrief().GetUid();
                ::FVMS_ChatMain::Get(this.GetManager()).TryConsumeRedDot(local_17);
            }
        }
        return;
    }
    int GetShotTypeIndex() const
    {
        return this.GetShowMessageTypeIndex();
    }
    bool IsPlayerMsgUnRead(const uint SenderUid) const
    {
        if (this.GetMessage().Get().GetSenderType() == 2 && (this.GetMessage().Get().GetSenderBrief().GetUid() == SenderUid))
        {
            return !(this.GetMessage().Get().GetbIsRead());
        }
        return true;
    }
    TEUIModelRef<FM_ChatMessage> GetMessage() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Message;
    }
    void SetMessage(const TEUIModelRef<FM_ChatMessage> &inout __Value) property
    {
        TEUIModelRef<FM_ChatMessage> local_2;
        local_2 = this.m_Message;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Message = __Value;
        return;
    }
    TEUIModelRef<FVM_PlayerBasicItem> GetSenderBasicItem() const property
    {
        this.TrackPropertyRead(1);
        return this.m_SenderBasicItem;
    }
    void SetSenderBasicItem(const TEUIModelRef<FVM_PlayerBasicItem> &inout __Value) property
    {
        TEUIModelRef<FVM_PlayerBasicItem> local_2;
        local_2 = this.m_SenderBasicItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SenderBasicItem = __Value;
        return;
    }
    const FString GetMessageSenderName() const property
    {
        const FString __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FString GetModify_MessageSenderName() property
    {
        FString __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetMessageSenderName(const FString &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_MessageSenderName = __Value;
        return;
    }
    const FText GetMessageText() const property
    {
        const FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_MessageText() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetMessageText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_MessageText = __Value;
        return;
    }
    FString GetSendTime() const property
    {
        FString __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FString GetModify_SendTime() property
    {
        FString __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetSendTime(const FString &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_SendTime = __Value;
        return;
    }
    int GetContextTypeIndex() const property
    {
        this.TrackPropertyRead(5);
        return this.m_ContextTypeIndex;
    }
    void SetContextTypeIndex(const int __Value) property
    {
        if (this.m_ContextTypeIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_ContextTypeIndex = __Value;
        return;
    }
    bool GetbIsPlayerSelf() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bIsPlayerSelf;
    }
    void SetbIsPlayerSelf(const bool __Value) property
    {
        if (!(this.m_bIsPlayerSelf) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bIsPlayerSelf = __Value;
        return;
    }
    EChatMessageShowType GetShowMessageType() const property
    {
        this.TrackPropertyRead(7);
        return this.m_ShowMessageType;
    }
    void SetShowMessageType(const EChatMessageShowType __Value) property
    {
        if (int(this.m_ShowMessageType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_ShowMessageType = __Value;
        return;
    }
    int GetShowMessageTypeIndex() const property
    {
        this.TrackPropertyRead(8);
        return this.m_ShowMessageTypeIndex;
    }
    void SetShowMessageTypeIndex(const int __Value) property
    {
        if (this.m_ShowMessageTypeIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_ShowMessageTypeIndex = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ChatMessage
{
    UPROPERTY()
    int ShotTypeIndex;
    UPROPERTY()
    TEUIModelRef<FVM_ChatMessage> Self;

}

namespace FVM_ChatMessage
{
FVM_ChatMessage& Create(const UObject ContextObject, const TEUIModelRef<FM_ChatMessage> &inout Message)
{
    return FVM_ChatMessage::CreateByManager(EUIInternal::GetContextManager(ContextObject), Message);
}
FVM_ChatMessage& CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_ChatMessage> &inout Message)
{
    return TEUIModelRef<FVM_ChatMessage>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ChatMessage::ModelId, 0, Message)).Get();
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasPostLoad(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "SenderBasicItem";
    local_14.TypeName = "TEUIModelRef<FVM_PlayerBasicItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MessageSenderName";
    local_14.TypeName = "FString";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MessageText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SendTime";
    local_14.TypeName = "FString";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ContextTypeIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShotTypeIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ChatMessage>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ChatMessage;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ChatMessage;
}
TEUIModelRef<FVM_PlayerBasicItem> __UIGetter_SenderBasicItem(const FVM_ChatMessage &inout Model)
{
    return Model.GetSenderBasicItem();
}
FString __UIGetter_MessageSenderName(const FVM_ChatMessage &inout Model)
{
    return Model.GetMessageSenderName();
}
FText __UIGetter_MessageText(const FVM_ChatMessage &inout Model)
{
    return Model.GetMessageText();
}
FString __UIGetter_SendTime(const FVM_ChatMessage &inout Model)
{
    return Model.GetSendTime();
}
int __UIGetter_ContextTypeIndex(const FVM_ChatMessage &inout Model)
{
    return Model.GetContextTypeIndex();
}
int __UIGetter_ShotTypeIndex(const FVM_ChatMessage &inout Model)
{
    return Model.GetShotTypeIndex();
}
TEUIModelRef<FVM_ChatMessage> __UIGetter_Self(const FVM_ChatMessage &inout Model)
{
    return TEUIModelRef<FVM_ChatMessage>(Model);
}
int __IndexOf_Message()
{
    return 0;
}
int __IndexOf_SenderBasicItem()
{
    return 1;
}
int __IndexOf_MessageSenderName()
{
    return 2;
}
int __IndexOf_MessageText()
{
    return 3;
}
int __IndexOf_SendTime()
{
    return 4;
}
int __IndexOf_ContextTypeIndex()
{
    return 5;
}
int __IndexOf_bIsPlayerSelf()
{
    return 6;
}
int __IndexOf_ShowMessageType()
{
    return 7;
}
int __IndexOf_ShowMessageTypeIndex()
{
    return 8;
}
}
namespace __GeneratedProperties_FVM_ChatMessage
{
UScriptStruct StaticStruct()
{
    return __GeneratedProperties_FVM_ChatMessage.Get();
}
}

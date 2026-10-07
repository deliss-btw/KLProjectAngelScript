
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
        EChatMessageShowType local_43;
        int local_94;
        TEUIModelRef<FM_ChatMessage> local_20 = this.GetMessage();
        FPlayerBriefInfo local_18 = FPlayerBriefInfo(GetSenderBrief());
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
        TEUIModelRef<FM_ChatMessage> local_20_2 = this.GetMessage();
        int local_22 = GetSystemContentDataId();
        if (local_22 != 0)
        {
            FText local_38;
            TEUIModelRef<FM_ChatMessage> local_20_3 = this.GetMessage();
            TEUIModelRef<FM_ChatMessage> local_34 = this.GetMessage();
            local_38 = ::FMS_ChatDataModel::Get(this.GetManager()).BuildSystemBodyText(GetSystemContentDataId(), GetSystemContentArgs());
            this.SetMessageText(local_38);
        }
        else
        {
            FText local_38;
            TEUIModelRef<FM_ChatMessage> local_34_2 = this.GetMessage();
            local_38.GetContentFinalText();
            this.SetMessageText(local_38);
        }
        this.SetContextTypeIndex(0);
        TEUIModelRef<FM_ChatMessage> local_20_4 = this.GetMessage();
        this.SetSendTime(::ChatSystemUtil::FormatUnixTimestampToHHmm(::ChatSystemUtil::MsToUnixSeconds(GetSendTimeMs())));
        TEUIModelRef<FM_ChatMessage> local_20_5 = this.GetMessage();
        this.SetbIsPlayerSelf(IsPlayerSelf());
        TEUIModelRef<FM_ChatMessage> local_34_3 = this.GetMessage();
        if (GetbIsVirtualSystemMessage())
        {
            local_43 = EChatMessageShowType(2);
            this.SetShowMessageType(EChatMessageShowType(local_43));
            this.SetContextTypeIndex(0);
        }
        else
        {
            TEUIModelRef<FM_ChatMessage> local_20_6 = this.GetMessage();
            if (GetSenderType() == 1)
            {
                local_43 = EChatMessageShowType(3);
                this.SetShowMessageType(EChatMessageShowType(local_43));
                this.SetContextTypeIndex(1);
                TEUIModelRef<FM_ChatMessage> local_20_7 = this.GetMessage();
                bool local_23 = !(GetbIsNpcDialogue());
                if (local_23)
                {
                    int local_44;
                    TEUIModelRef<FM_ChatMessage> local_34_4 = this.GetMessage();
                    local_44 = GetSystemContentDataId();
                    if (::FChatContentConfig::GetByDataId(local_44).IsSet())
                    {
                        if (local_23)
                        {
                            local_43 = EChatMessageShowType(2);
                        }
                        else
                        {
                            local_43 = EChatMessageShowType(3);
                        }
                        this.SetShowMessageType(EChatMessageShowType(local_43));
                    }
                }
            }
            else
            {
                TEUIModelRef<FM_ChatMessage> local_20_8 = this.GetMessage();
                if (GetChannelType() == 7)
                {
                    if (this.GetbIsPlayerSelf())
                    {
                        local_94 = EChatMessageShowType(1);
                    }
                    else
                    {
                        local_94 = EChatMessageShowType(0);
                    }
                    this.SetShowMessageType(EChatMessageShowType(local_94));
                }
                else
                {
                    if (this.GetbIsPlayerSelf())
                    {
                        local_94 = EChatMessageShowType(1);
                    }
                    else
                    {
                        local_94 = EChatMessageShowType(0);
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
            bool local_3 = true;
            TEUIModelRef<FM_ChatMessage> local_2 = this.GetMessage();
            local_3.SetbIsRead();
            TEUIModelRef<FM_ChatMessage> local_2_2 = this.GetMessage();
            int local_9 = GetSenderBrief().GetUid();
            TEUIModelRef<FM_ChatMessage> local_2_3 = this.GetMessage();
            bool local_3_2 = GetbIsRead();
            XLog(ELog(74), FString().Append("Message Read : ").Append(local_3_2).Append(" ").Append(local_9));
            TEUIModelRef<FM_ChatMessage> local_2_4 = this.GetMessage();
            if ((int(::ChatSystemUtil::TryPbChannelToChannelTab(GetChannelType()))) == 6)
            {
                local_3_2 = true;
            }
            else
            {
                TEUIModelRef<FM_ChatMessage> local_2_5 = this.GetMessage();
                local_3_2 = (GetSenderType() == 2);
            }
            if (local_3_2)
            {
                int local_17;
                TEUIModelRef<FM_ChatMessage> local_2_6 = this.GetMessage();
                local_17 = GetSenderBrief().GetUid();
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
        bool local_5;
        TEUIModelRef<FM_ChatMessage> local_2 = this.GetMessage();
        if (GetSenderType() != 2)
        {
            local_5 = false;
        }
        else
        {
            TEUIModelRef<FM_ChatMessage> local_2_2 = this.GetMessage();
            local_5 = (GetSenderBrief().GetUid() == SenderUid);
        }
        if (local_5)
        {
            TEUIModelRef<FM_ChatMessage> local_2_3 = this.GetMessage();
            return !(GetbIsRead());
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
FVM_ChatMessage CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_ChatMessage> &inout Message)
{
    FVM_ChatMessage __r;
    TEUIModelRef<FVM_ChatMessage> local_6 = TEUIModelRef<FVM_ChatMessage>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ChatMessage::ModelId, 0, Message));
    return __r;
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
    UScriptStruct local_2;
    return local_2;
}
}

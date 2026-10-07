
enum EChatSystemHyperlinkKind
{
    None,
    PlayerUid,
    ItemDataId,
    Recruit,
}

enum EChatDSDispatchKind
{
    ServerChat,
    NpcDialogue,
}

namespace __INTENRAL_FCE_ChatSendToDS_NS
{
    const TECSEventDerivedPtr<FCE_ChatSendToDS> DerivedPtr = TECSEventDerivedPtr<FCE_ChatSendToDS>();
}
namespace __INTENRAL_FCE_DSDispatchChat_NS
{
    const TECSEventDerivedPtr<FCE_DSDispatchChat> DerivedPtr = TECSEventDerivedPtr<FCE_DSDispatchChat>();
}
namespace __INTENRAL_FCE_DSChatMsgCommission_NS
{
    const TECSEventDerivedPtr<FCE_DSChatMsgCommission> DerivedPtr = TECSEventDerivedPtr<FCE_DSChatMsgCommission>();
}
namespace __INTENRAL_FCE_ServerSendChatMsgNotify_NS
{
    const TECSEventDerivedPtr<FCE_ServerSendChatMsgNotify> DerivedPtr = TECSEventDerivedPtr<FCE_ServerSendChatMsgNotify>();
}
namespace __INTENRAL_FCE_OnReceiveServerSendChat_NS
{
    const TECSEventDerivedPtr<FCE_OnReceiveServerSendChat> DerivedPtr = TECSEventDerivedPtr<FCE_OnReceiveServerSendChat>();

}
struct FPlayerBriefInfo
{
    FSubDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    uint m_Uid;
    UPROPERTY()
    FString m_m_Nickname;
    UPROPERTY()
    int m_m_Level;
    UPROPERTY()
    uint m_m_CurAvatarId;
    UPROPERTY()
    uint m_m_DivineSkillId;
    UPROPERTY()
    FString m_m_SignatureText;
    UPROPERTY()
    bool m_m_bIsOnline;
    UPROPERTY()
    bool m_bSetNickname;
    UPROPERTY()
    bool m_bSetLevel;
    UPROPERTY()
    bool m_bSetCurAvatarId;
    UPROPERTY()
    bool m_bSetDivineSkillId;
    UPROPERTY()
    bool m_bSetSignatureText;
    UPROPERTY()
    bool m_bSetIsOnline;

    FPlayerBriefInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FPlayerBriefInfo(const FPlayerBriefInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FPlayerBriefInfo opAssign(const FPlayerBriefInfo &inout Other)
    {
        FPlayerBriefInfo __r;
        this.SetUid(Other.GetUid());
        this.Setm_Nickname(Other.Getm_Nickname());
        this.Setm_Level(Other.Getm_Level());
        this.Setm_CurAvatarId(Other.Getm_CurAvatarId());
        this.Setm_DivineSkillId(Other.Getm_DivineSkillId());
        this.Setm_SignatureText(Other.Getm_SignatureText());
        this.Setm_bIsOnline(Other.Getm_bIsOnline());
        this.SetbSetNickname(Other.GetbSetNickname());
        this.SetbSetLevel(Other.GetbSetLevel());
        this.SetbSetCurAvatarId(Other.GetbSetCurAvatarId());
        this.SetbSetDivineSkillId(Other.GetbSetDivineSkillId());
        this.SetbSetSignatureText(Other.GetbSetSignatureText());
        this.SetbSetIsOnline(Other.GetbSetIsOnline());
        return __r;
    }
    FString GetNickname() const property
    {
        return this.Getm_Nickname();
    }
    void SetNickname(const FString &inout InNickname) property
    {
        this.Setm_Nickname(InNickname);
        this.SetbSetNickname(true);
        return;
    }
    bool IsNicknameSet() const
    {
        return this.GetbSetNickname();
    }
    int GetLevel() const property
    {
        return this.Getm_Level();
    }
    void SetLevel(const int InLevel) property
    {
        this.Setm_Level(InLevel);
        this.SetbSetLevel(true);
        return;
    }
    bool IsLevelSet() const
    {
        return this.GetbSetLevel();
    }
    uint GetCurAvatarId() const property
    {
        return this.Getm_CurAvatarId();
    }
    void SetCurAvatarId(const uint InCurAvatarId) property
    {
        this.Setm_CurAvatarId(InCurAvatarId);
        this.SetbSetCurAvatarId(true);
        return;
    }
    bool IsCurAvatarIdSet() const
    {
        return this.GetbSetCurAvatarId();
    }
    uint GetDivineSkillId() const property
    {
        return this.Getm_DivineSkillId();
    }
    void SetDivineSkillId(const uint InDivineSkillId) property
    {
        this.Setm_DivineSkillId(InDivineSkillId);
        this.SetbSetDivineSkillId(true);
        return;
    }
    bool IsDivineSkillIdSet() const
    {
        return this.GetbSetDivineSkillId();
    }
    FString GetSignatureText() const property
    {
        return this.Getm_SignatureText();
    }
    void SetSignatureText(const FString &inout InSignatureText) property
    {
        this.Setm_SignatureText(InSignatureText);
        this.SetbSetSignatureText(true);
        return;
    }
    bool IsSignatureTextSet() const
    {
        return this.GetbSetSignatureText();
    }
    bool GetbIsOnline() const property
    {
        return this.Getm_bIsOnline();
    }
    void SetbIsOnline(const bool InbIsOnline) property
    {
        this.Setm_bIsOnline(InbIsOnline);
        this.SetbSetIsOnline(true);
        return;
    }
    bool IsOnlineStateSet() const
    {
        return this.GetbSetIsOnline();
    }
    uint GetUid() const property
    {
        return this.m_Uid;
    }
    void SetUid(const uint __Value) property
    {
        if (this.m_Uid == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Uid = __Value;
        return;
    }
    FString Getm_Nickname() const property
    {
        return this.m_m_Nickname;
    }
    void Setm_Nickname(const FString &inout __Value) property
    {
        if ((this.m_m_Nickname == __Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_m_Nickname = __Value;
        return;
    }
    int Getm_Level() const property
    {
        return this.m_m_Level;
    }
    void Setm_Level(const int __Value) property
    {
        if (this.m_m_Level == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_m_Level = __Value;
        return;
    }
    uint Getm_CurAvatarId() const property
    {
        return this.m_m_CurAvatarId;
    }
    void Setm_CurAvatarId(const uint __Value) property
    {
        if (this.m_m_CurAvatarId == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_m_CurAvatarId = __Value;
        return;
    }
    uint Getm_DivineSkillId() const property
    {
        return this.m_m_DivineSkillId;
    }
    void Setm_DivineSkillId(const uint __Value) property
    {
        if (this.m_m_DivineSkillId == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_m_DivineSkillId = __Value;
        return;
    }
    FString Getm_SignatureText() const property
    {
        return this.m_m_SignatureText;
    }
    void Setm_SignatureText(const FString &inout __Value) property
    {
        if ((this.m_m_SignatureText == __Value))
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_m_SignatureText = __Value;
        return;
    }
    bool Getm_bIsOnline() const property
    {
        return this.m_m_bIsOnline;
    }
    void Setm_bIsOnline(const bool __Value) property
    {
        if (!(this.m_m_bIsOnline) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_m_bIsOnline = __Value;
        return;
    }
    bool GetbSetNickname() const property
    {
        return this.m_bSetNickname;
    }
    void SetbSetNickname(const bool __Value) property
    {
        if (!(this.m_bSetNickname) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_bSetNickname = __Value;
        return;
    }
    bool GetbSetLevel() const property
    {
        return this.m_bSetLevel;
    }
    void SetbSetLevel(const bool __Value) property
    {
        if (!(this.m_bSetLevel) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_bSetLevel = __Value;
        return;
    }
    bool GetbSetCurAvatarId() const property
    {
        return this.m_bSetCurAvatarId;
    }
    void SetbSetCurAvatarId(const bool __Value) property
    {
        if (!(this.m_bSetCurAvatarId) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_bSetCurAvatarId = __Value;
        return;
    }
    bool GetbSetDivineSkillId() const property
    {
        return this.m_bSetDivineSkillId;
    }
    void SetbSetDivineSkillId(const bool __Value) property
    {
        if (!(this.m_bSetDivineSkillId) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_bSetDivineSkillId = __Value;
        return;
    }
    bool GetbSetSignatureText() const property
    {
        return this.m_bSetSignatureText;
    }
    void SetbSetSignatureText(const bool __Value) property
    {
        if (!(this.m_bSetSignatureText) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(11);
        this.m_bSetSignatureText = __Value;
        return;
    }
    bool GetbSetIsOnline() const property
    {
        return this.m_bSetIsOnline;
    }
    void SetbSetIsOnline(const bool __Value) property
    {
        if (!(this.m_bSetIsOnline) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(12);
        this.m_bSetIsOnline = __Value;
        return;
    }
}

struct FChatServerSendChatSnapshot
{
    FSubDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    uint m_ChannelType;
    UPROPERTY()
    uint m_TargetUid;
    UPROPERTY()
    uint64 m_SendTimeMs;
    UPROPERTY()
    uint m_ContentType;
    UPROPERTY()
    uint m_SenderType;
    UPROPERTY()
    FString m_TextContent;
    UPROPERTY()
    uint m_SystemContentDataId;
    UPROPERTY()
    TArray<FChatSystemSerializedArg> m_SystemContentArgs;
    UPROPERTY()
    bool m_bIsNpcDialogue;
    UPROPERTY()
    TDataObjectPtr<FDialogueLineConfig> m_DialogueLineConfig;
    UPROPERTY()
    bool m_bUseSpotName;
    UPROPERTY()
    int m_NpcEntityId;

    FChatServerSendChatSnapshot()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FChatServerSendChatSnapshot(const FChatServerSendChatSnapshot &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FChatServerSendChatSnapshot opAssign(const FChatServerSendChatSnapshot &inout Other)
    {
        FChatServerSendChatSnapshot __r;
        this.SetChannelType(Other.GetChannelType());
        this.SetTargetUid(Other.GetTargetUid());
        this.SetSendTimeMs(Other.GetSendTimeMs());
        this.SetContentType(Other.GetContentType());
        this.SetSenderType(Other.GetSenderType());
        this.SetTextContent(Other.GetTextContent());
        this.SetSystemContentDataId(Other.GetSystemContentDataId());
        this.SetSystemContentArgs(Other.GetSystemContentArgs());
        this.SetbIsNpcDialogue(Other.GetbIsNpcDialogue());
        this.SetDialogueLineConfig(Other.GetDialogueLineConfig());
        this.SetbUseSpotName(Other.GetbUseSpotName());
        this.SetNpcEntityId(Other.GetNpcEntityId());
        return __r;
    }
    uint GetChannelType() const property
    {
        return this.m_ChannelType;
    }
    void SetChannelType(const uint __Value) property
    {
        if (this.m_ChannelType == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ChannelType = __Value;
        return;
    }
    uint GetTargetUid() const property
    {
        return this.m_TargetUid;
    }
    void SetTargetUid(const uint __Value) property
    {
        if (this.m_TargetUid == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_TargetUid = __Value;
        return;
    }
    uint64 GetSendTimeMs() const property
    {
        return this.m_SendTimeMs;
    }
    void SetSendTimeMs(const uint64 __Value) property
    {
        if (this.m_SendTimeMs == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_SendTimeMs = __Value;
        return;
    }
    uint GetContentType() const property
    {
        return this.m_ContentType;
    }
    void SetContentType(const uint __Value) property
    {
        if (this.m_ContentType == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_ContentType = __Value;
        return;
    }
    uint GetSenderType() const property
    {
        return this.m_SenderType;
    }
    void SetSenderType(const uint __Value) property
    {
        if (this.m_SenderType == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_SenderType = __Value;
        return;
    }
    FString GetTextContent() const property
    {
        return this.m_TextContent;
    }
    void SetTextContent(const FString &inout __Value) property
    {
        if ((this.m_TextContent == __Value))
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_TextContent = __Value;
        return;
    }
    uint GetSystemContentDataId() const property
    {
        return this.m_SystemContentDataId;
    }
    void SetSystemContentDataId(const uint __Value) property
    {
        if (this.m_SystemContentDataId == __Value)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_SystemContentDataId = __Value;
        return;
    }
    const TArray<FChatSystemSerializedArg> GetSystemContentArgs() const property
    {
        const TArray<FChatSystemSerializedArg> __r;
        return __r;
    }
    TArray<FChatSystemSerializedArg> GetModify_SystemContentArgs() property
    {
        TArray<FChatSystemSerializedArg> __r;
        this.__MarkDirty(7);
        return __r;
    }
    void SetSystemContentArgs(const TArray<FChatSystemSerializedArg> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_SystemContentArgs = __Value;
        return;
    }
    bool GetbIsNpcDialogue() const property
    {
        return this.m_bIsNpcDialogue;
    }
    void SetbIsNpcDialogue(const bool __Value) property
    {
        if (!(this.m_bIsNpcDialogue) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_bIsNpcDialogue = __Value;
        return;
    }
    const TDataObjectPtr<FDialogueLineConfig> GetDialogueLineConfig() const property
    {
        const TDataObjectPtr<FDialogueLineConfig> __r;
        return __r;
    }
    TDataObjectPtr<FDialogueLineConfig> GetModify_DialogueLineConfig() property
    {
        TDataObjectPtr<FDialogueLineConfig> __r;
        this.__MarkDirty(9);
        return __r;
    }
    void SetDialogueLineConfig(const TDataObjectPtr<FDialogueLineConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_DialogueLineConfig = __Value;
        return;
    }
    bool GetbUseSpotName() const property
    {
        return this.m_bUseSpotName;
    }
    void SetbUseSpotName(const bool __Value) property
    {
        if (!(this.m_bUseSpotName) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_bUseSpotName = __Value;
        return;
    }
    int GetNpcEntityId() const property
    {
        return this.m_NpcEntityId;
    }
    void SetNpcEntityId(const int __Value) property
    {
        if (this.m_NpcEntityId == __Value)
        {
            return;
        }
        this.__MarkDirty(11);
        this.m_NpcEntityId = __Value;
        return;
    }
}

struct FCE_ChatSendToDS : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    uint ChannelType = 0;
    UPROPERTY()
    uint TargetUid = 0;
    UPROPERTY()
    FString TextContent;


    bool Validate() const
    {
        return true;
    }
}

struct FCE_DSDispatchChat : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    EChatDSDispatchKind DispatchKind = EChatDSDispatchKind(0);
    UPROPERTY()
    FPlayerBriefInfo SenderBrief;
    UPROPERTY()
    FChatServerSendChatSnapshot SendChat;
    UPROPERTY()
    TDataObjectPtr<FDialogueLineConfig> DialogueLineConfig;
    UPROPERTY()
    bool bUseSpotName = false;


}

struct FCE_DSChatMsgCommission : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    uint BindPlayerUid = 0;
    UPROPERTY()
    uint Channel = 0;


}

struct FCE_ServerSendChatMsgNotify : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FPlayerBriefInfo SenderBrief;
    UPROPERTY()
    FChatServerSendChatSnapshot SendChat;

    FCE_ServerSendChatMsgNotify()
    {
        return;
    }
}

struct FCE_OnReceiveServerSendChat : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FPlayerBriefInfo SenderBrief;
    UPROPERTY()
    FChatServerSendChatSnapshot SendChat;

    FCE_OnReceiveServerSendChat()
    {
        return;
    }
}

struct FMsg_ChatWithPlayer : FEUIMessage
{
    UPROPERTY()
    uint PlayerUid = 0;


}

struct FMsg_OpenPlayerBasicInfo : FEUIMessage
{
    UPROPERTY()
    uint PlayerUid = 0;


}

struct FMsg_ChatSystemItemHyperlinkClicked : FEUIMessage
{
    UPROPERTY()
    uint ItemDataId = 0;


}

namespace AutoDelta
{
FSubDirtyFlags16 GetDirtyFlags(FPlayerBriefInfo &inout Data)
{
    FSubDirtyFlags16 __r;
    return __r;
}
void ClearDirtyFlags(FPlayerBriefInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FPlayerBriefInfo
{
int __IndexOf_Uid()
{
    return 0;
}
int __IndexOf_m_Nickname()
{
    return 1;
}
int __IndexOf_m_Level()
{
    return 2;
}
int __IndexOf_m_CurAvatarId()
{
    return 3;
}
int __IndexOf_m_DivineSkillId()
{
    return 4;
}
int __IndexOf_m_SignatureText()
{
    return 5;
}
int __IndexOf_m_bIsOnline()
{
    return 6;
}
int __IndexOf_bSetNickname()
{
    return 7;
}
int __IndexOf_bSetLevel()
{
    return 8;
}
int __IndexOf_bSetCurAvatarId()
{
    return 9;
}
int __IndexOf_bSetDivineSkillId()
{
    return 10;
}
int __IndexOf_bSetSignatureText()
{
    return 11;
}
int __IndexOf_bSetIsOnline()
{
    return 12;
}
}
namespace AutoDelta
{
FSubDirtyFlags16 GetDirtyFlags(FChatServerSendChatSnapshot &inout Data)
{
    FSubDirtyFlags16 __r;
    return __r;
}
void ClearDirtyFlags(FChatServerSendChatSnapshot &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FChatServerSendChatSnapshot
{
int __IndexOf_ChannelType()
{
    return 0;
}
int __IndexOf_TargetUid()
{
    return 1;
}
int __IndexOf_SendTimeMs()
{
    return 2;
}
int __IndexOf_ContentType()
{
    return 3;
}
int __IndexOf_SenderType()
{
    return 4;
}
int __IndexOf_TextContent()
{
    return 5;
}
int __IndexOf_SystemContentDataId()
{
    return 6;
}
int __IndexOf_SystemContentArgs()
{
    return 7;
}
int __IndexOf_bIsNpcDialogue()
{
    return 8;
}
int __IndexOf_DialogueLineConfig()
{
    return 9;
}
int __IndexOf_bUseSpotName()
{
    return 10;
}
int __IndexOf_NpcEntityId()
{
    return 11;
}
}

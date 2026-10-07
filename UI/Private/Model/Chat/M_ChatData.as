
const uint64 OfflinePrivateMsgRedDotPlaceholderId = 4294967296;
namespace FM_ChatMessage
{
    const int ModelId = 0;
}
namespace FMS_ChatDataModel
{
    const int ModelId = 0;

}
struct FM_ChatMessage : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    uint m_ChannelType;
    UPROPERTY()
    uint m_TargetUid;
    UPROPERTY()
    uint m_SenderType;
    UPROPERTY()
    FText m_BodyText;
    UPROPERTY()
    uint64 m_SendTimeMs;
    UPROPERTY()
    uint m_ContentType;
    UPROPERTY()
    uint m_SystemContentDataId;
    UPROPERTY()
    TArray<FChatSystemSerializedArg> m_SystemContentArgs;
    UPROPERTY()
    bool m_bIsNpcDialogue;
    UPROPERTY()
    FPlayerBriefInfo m_SenderBrief;
    UPROPERTY()
    bool m_bIsRead;
    UPROPERTY()
    bool m_bIsVirtualSystemMessage;

    FM_ChatMessage()
    {
        this.m_ChannelType = 0;
        this.m_TargetUid = 0;
        this.m_SenderType = 0;
        this.m_SendTimeMs = 0;
        this.m_ContentType = 0;
        this.m_SystemContentDataId = 0;
        this.m_bIsNpcDialogue = false;
        this.m_bIsRead = false;
        this.m_bIsVirtualSystemMessage = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FM_ChatMessage(const FM_ChatMessage &inout Other)
    {
        this.m_ChannelType = 0;
        this.m_TargetUid = 0;
        this.m_SenderType = 0;
        this.m_SendTimeMs = 0;
        this.m_ContentType = 0;
        this.m_SystemContentDataId = 0;
        this.m_bIsNpcDialogue = false;
        this.m_bIsRead = false;
        this.m_bIsVirtualSystemMessage = false;
        this.m_ChannelType = int(Other.m_ChannelType);
        this.m_TargetUid = int(Other.m_TargetUid);
        this.m_SenderType = int(Other.m_SenderType);
        this.m_BodyText = Other.m_BodyText;
        this.m_SendTimeMs = Other.m_SendTimeMs;
        this.m_ContentType = int(Other.m_ContentType);
        this.m_SystemContentDataId = int(Other.m_SystemContentDataId);
        this.m_SystemContentArgs = Other.m_SystemContentArgs;
        this.m_bIsNpcDialogue = Other.m_bIsNpcDialogue;
        this.m_SenderBrief = Other.m_SenderBrief;
        this.m_bIsRead = Other.m_bIsRead;
        this.m_bIsVirtualSystemMessage = Other.m_bIsVirtualSystemMessage;
        return;
    }
    FM_ChatMessage opAssign(const FM_ChatMessage &inout Other)
    {
        FM_ChatMessage __r;
        this.m_ChannelType = int(Other.m_ChannelType);
        this.m_TargetUid = int(Other.m_TargetUid);
        this.m_SenderType = int(Other.m_SenderType);
        this.m_BodyText = Other.m_BodyText;
        this.m_SendTimeMs = Other.m_SendTimeMs;
        this.m_ContentType = int(Other.m_ContentType);
        this.m_SystemContentDataId = int(Other.m_SystemContentDataId);
        this.m_SystemContentArgs = Other.m_SystemContentArgs;
        this.m_bIsNpcDialogue = Other.m_bIsNpcDialogue;
        this.m_SenderBrief = Other.m_SenderBrief;
        this.m_bIsRead = Other.m_bIsRead;
        this.m_bIsVirtualSystemMessage = Other.m_bIsVirtualSystemMessage;
        return __r;
    }
    FText GetContentFinalText()
    {
        return this.GetBodyText();
    }
    bool IsPlayerSelf()
    {
        int local_1 = this.GetSenderType();
        if (local_1 == 1)
        {
            return false;
        }
        int local_1_2 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(this.GetContext().GetLocalPlayer());
        return (this.GetSenderBrief().GetUid() == local_1_2);
    }
    void FullToTimeSystemMessage(const uint InChannelType, const uint64 InUnixTimestampMs)
    {
        this.SetbIsRead(true);
        this.SetChannelType(InChannelType);
        this.SetSenderType(1);
        this.SetSendTimeMs(InUnixTimestampMs);
        this.SetContentType(1);
        this.SetbIsVirtualSystemMessage(true);
        this.SetBodyText(FText::FromString(::ChatSystemUtil::FormatUnixTimestampToYyyyMmDd(::ChatSystemUtil::MsToUnixSeconds(InUnixTimestampMs))));
        return;
    }
    uint GetChannelType() const property
    {
        this.TrackPropertyRead(0);
        return this.m_ChannelType;
    }
    void SetChannelType(const uint __Value) property
    {
        if (this.m_ChannelType == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ChannelType = __Value;
        return;
    }
    uint GetTargetUid() const property
    {
        this.TrackPropertyRead(1);
        return this.m_TargetUid;
    }
    void SetTargetUid(const uint __Value) property
    {
        if (this.m_TargetUid == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TargetUid = __Value;
        return;
    }
    uint GetSenderType() const property
    {
        this.TrackPropertyRead(2);
        return this.m_SenderType;
    }
    void SetSenderType(const uint __Value) property
    {
        if (this.m_SenderType == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_SenderType = __Value;
        return;
    }
    const FText GetBodyText() const property
    {
        const FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_BodyText() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetBodyText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_BodyText = __Value;
        return;
    }
    uint64 GetSendTimeMs() const property
    {
        this.TrackPropertyRead(4);
        return this.m_SendTimeMs;
    }
    void SetSendTimeMs(const uint64 __Value) property
    {
        if (this.m_SendTimeMs == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_SendTimeMs = __Value;
        return;
    }
    uint GetContentType() const property
    {
        this.TrackPropertyRead(5);
        return this.m_ContentType;
    }
    void SetContentType(const uint __Value) property
    {
        if (this.m_ContentType == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_ContentType = __Value;
        return;
    }
    uint GetSystemContentDataId() const property
    {
        this.TrackPropertyRead(6);
        return this.m_SystemContentDataId;
    }
    void SetSystemContentDataId(const uint __Value) property
    {
        if (this.m_SystemContentDataId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_SystemContentDataId = __Value;
        return;
    }
    const TArray<FChatSystemSerializedArg> GetSystemContentArgs() const property
    {
        const TArray<FChatSystemSerializedArg> __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    TArray<FChatSystemSerializedArg> GetModify_SystemContentArgs() property
    {
        TArray<FChatSystemSerializedArg> __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetSystemContentArgs(const TArray<FChatSystemSerializedArg> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_SystemContentArgs = __Value;
        return;
    }
    bool GetbIsNpcDialogue() const property
    {
        this.TrackPropertyRead(8);
        return this.m_bIsNpcDialogue;
    }
    void SetbIsNpcDialogue(const bool __Value) property
    {
        if (!(this.m_bIsNpcDialogue) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_bIsNpcDialogue = __Value;
        return;
    }
    const FPlayerBriefInfo GetSenderBrief() const property
    {
        const FPlayerBriefInfo __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    FPlayerBriefInfo GetModify_SenderBrief() property
    {
        FPlayerBriefInfo __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetSenderBrief(const FPlayerBriefInfo &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_SenderBrief = __Value;
        return;
    }
    bool GetbIsRead() const property
    {
        this.TrackPropertyRead(10);
        return this.m_bIsRead;
    }
    void SetbIsRead(const bool __Value) property
    {
        if (!(this.m_bIsRead) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_bIsRead = __Value;
        return;
    }
    bool GetbIsVirtualSystemMessage() const property
    {
        this.TrackPropertyRead(11);
        return this.m_bIsVirtualSystemMessage;
    }
    void SetbIsVirtualSystemMessage(const bool __Value) property
    {
        if (!(this.m_bIsVirtualSystemMessage) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_bIsVirtualSystemMessage = __Value;
        return;
    }
}

struct FMsg_SubmitChatText : FEUIMessage
{
    UPROPERTY()
    uint ChannelType = 0;
    UPROPERTY()
    uint TargetUid = 0;
    UPROPERTY()
    FString Text;


}

struct FMsg_ChatDataUpdated : FEUIMessage
{
    FMsg_ChatDataUpdated()
    {
        return;
    }
}

struct FMsg_ChatPersistenceBoundPlayerChanged : FEUIMessage
{
    FMsg_ChatPersistenceBoundPlayerChanged()
    {
        return;
    }
}

struct FMsg_OnReceiveChatMessage : FEUIMessage
{
    UPROPERTY()
    uint ChannelType = 0;
    UPROPERTY()
    TEUIModelRef<FM_ChatMessage> MessageRef;


}

struct FMsg_ChatReadAllMessages : FEUIMessage
{
    UPROPERTY()
    EChatChannelTab ChannelTab;
    UPROPERTY()
    uint PeerUid;


}

struct FMsg_ChatReadAllMessagesUpdate : FEUIMessage
{
    FMsg_ChatReadAllMessagesUpdate()
    {
        return;
    }
}

struct FMsg_PrivateChatUpdated : FEUIMessage
{
    UPROPERTY()
    uint PeerUid = 0;


}

struct FMsg_GenSystemMsg : FEUIMessage
{
    UPROPERTY()
    uint ChannelType = 0;
    UPROPERTY()
    uint SystemContentDataId = 0;
    UPROPERTY()
    TArray<FChatSystemSerializedArg> SystemContentArgs;


}

struct FChatChannelRecentMessageList
{
    UPROPERTY()
    uint ChannelType = 0;
    UPROPERTY()
    TArray<TEUIModelRef<FM_ChatMessage>> Messages;

    FChatChannelRecentMessageList(const uint InChannelType)
    {
        this.ChannelType = InChannelType;
        return;
    }
}

struct FChatPrivatePeerThread
{
    UPROPERTY()
    uint PeerUid = 0;
    UPROPERTY()
    TArray<TEUIModelRef<FM_ChatMessage>> Messages;
    UPROPERTY()
    FPlayerBriefInfo CachedPeerBrief;
    UPROPERTY()
    FString CachedLastMessagePreview;
    UPROPERTY()
    uint64 LastActivitySendTime = 0;


}

struct FMS_ChatDataModel : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TArray<TEUIModelRef<FM_ChatMessage>> m_RecentMessages;
    UPROPERTY()
    TMap<uint, FChatChannelRecentMessageList> m_RecentMessagesByChannel;
    UPROPERTY()
    TMap<uint, FChatPrivatePeerThread> m_PrivateChatThreadsByPeer;
    UPROPERTY()
    TArray<uint> m_PrivateChatPeerOrder;
    UPROPERTY()
    uint m_PersistedBoundPlayerUid;
    UPROPERTY()
    TMap<uint, FPlayerBriefInfo> m_StrangerPeerBriefByUid;
    UPROPERTY()
    TArray<uint> m_PendingOfflineChannels;
    UPROPERTY()
    uint m_PendingOfflineChannelsOwnerUid;
    UPROPERTY()
    bool m_bChatHistoryReqInFlight;
    UPROPERTY()
    uint m_ChatHistoryReqOwnerUid;
    UPROPERTY()
    uint m_OfflineChatReqOwnerUid;
    UPROPERTY()
    UChatRecentHistorySaveGame m_CachedSaveGame;

    FMS_ChatDataModel()
    {
        this.m_CachedSaveGame = nullptr;
        this.m_PersistedBoundPlayerUid = 0;
        this.m_PendingOfflineChannelsOwnerUid = 0;
        this.m_bChatHistoryReqInFlight = false;
        this.m_ChatHistoryReqOwnerUid = 0;
        this.m_OfflineChatReqOwnerUid = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_ChatDataModel(const FMS_ChatDataModel &inout Other)
    {
        this.m_CachedSaveGame = nullptr;
        this.m_PersistedBoundPlayerUid = 0;
        this.m_PendingOfflineChannelsOwnerUid = 0;
        this.m_bChatHistoryReqInFlight = false;
        this.m_ChatHistoryReqOwnerUid = 0;
        this.m_OfflineChatReqOwnerUid = 0;
        this.m_RecentMessages = Other.m_RecentMessages;
        this.m_RecentMessagesByChannel = Other.m_RecentMessagesByChannel;
        this.m_PrivateChatThreadsByPeer = Other.m_PrivateChatThreadsByPeer;
        this.m_PrivateChatPeerOrder = Other.m_PrivateChatPeerOrder;
        this.m_PersistedBoundPlayerUid = int(Other.m_PersistedBoundPlayerUid);
        this.m_StrangerPeerBriefByUid = Other.m_StrangerPeerBriefByUid;
        this.m_PendingOfflineChannels = Other.m_PendingOfflineChannels;
        this.m_PendingOfflineChannelsOwnerUid = int(Other.m_PendingOfflineChannelsOwnerUid);
        this.m_bChatHistoryReqInFlight = Other.m_bChatHistoryReqInFlight;
        this.m_ChatHistoryReqOwnerUid = int(Other.m_ChatHistoryReqOwnerUid);
        this.m_OfflineChatReqOwnerUid = int(Other.m_OfflineChatReqOwnerUid);
        this.m_CachedSaveGame = Other.m_CachedSaveGame;
        return;
    }
    FMS_ChatDataModel opAssign(const FMS_ChatDataModel &inout Other)
    {
        FMS_ChatDataModel __r;
        this.m_RecentMessages = Other.m_RecentMessages;
        this.m_RecentMessagesByChannel = Other.m_RecentMessagesByChannel;
        this.m_PrivateChatThreadsByPeer = Other.m_PrivateChatThreadsByPeer;
        this.m_PrivateChatPeerOrder = Other.m_PrivateChatPeerOrder;
        this.m_PersistedBoundPlayerUid = int(Other.m_PersistedBoundPlayerUid);
        this.m_StrangerPeerBriefByUid = Other.m_StrangerPeerBriefByUid;
        this.m_PendingOfflineChannels = Other.m_PendingOfflineChannels;
        this.m_PendingOfflineChannelsOwnerUid = int(Other.m_PendingOfflineChannelsOwnerUid);
        this.m_bChatHistoryReqInFlight = Other.m_bChatHistoryReqInFlight;
        this.m_ChatHistoryReqOwnerUid = int(Other.m_ChatHistoryReqOwnerUid);
        this.m_OfflineChatReqOwnerUid = int(Other.m_OfflineChatReqOwnerUid);
        this.m_CachedSaveGame = Other.m_CachedSaveGame;
        return __r;
    }
    void PostConstruct()
    {
        this.OnLocalPlayerUidContextMaybeChanged();
        return;
    }
    void OnLocalPlayerEntityChanged(const FC_PlayerController &inout PlayerController)
    {
        if (!(PlayerController))
        {
            return;
        }
        if (PlayerController.GetPlayerId() != this.GetPersistedBoundPlayerUid())
        {
            this.OnLocalPlayerUidContextMaybeChanged();
        }
        return;
    }
    void PublishGetItemSystemMsg(const TDataObjectPtr<FItemConfig> &inout ItemConfig, const int IncreaseNum)
    {
        const UChatSettings local_4;
        int local_10 = 0;
        if (!(ItemConfig.IsSet()))
        {
            return;
        }
        if (IncreaseNum <= 0)
        {
            return;
        }
        GetGameplaySettings<UChatSettings> local_6;
        local_4 = local_6;
        if ((!((local_4 != nullptr))))
        {
            return;
        }
        if (!(local_4.ChatSettingsConfig.IsSet()))
        {
            return;
        }
        if (!(GetGetItemChatId().IsSet()))
        {
            return;
        }
        int local_9 = local_10;
        int local_11 = local_10;
        TArray<FChatSystemSerializedArg> local_16;
        local_16.Add(FChatSystemSerializedArg(EChatSystemPbArgKind(3), FString().Append(local_11)));
        local_16.Add(FChatSystemSerializedArg(EChatSystemPbArgKind(2), FString().Append(IncreaseNum)));
        FEUIModelRef local_38 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        local_10 = 4;
        FMsg_GenSystemMsg local_40;
        local_40.ChannelType = local_10;
        local_40.SystemContentDataId = local_9;
        local_40.SystemContentArgs = local_16;
        return;
    }
    void PublishCombatTeamMemberSystemMsg(const TDataObjectPtr<FChatContentConfig> &inout ContentRow, const uint PlayerUid)
    {
        int local_6 = 0;
        XLog(ELog(74), FString().Append("PublishCombatTeamMemberSystemMsg PlayerUid=").Append(PlayerUid));
        if (PlayerUid == 0 || !(ContentRow.IsSet()))
        {
            return;
        }
        FString local_4 = FString();
        int local_9 = local_6;
        TArray<FChatSystemSerializedArg> local_14;
        local_14.Add(FChatSystemSerializedArg(EChatSystemPbArgKind(3), FString().Append(PlayerUid)));
        FEUIModelRef local_32 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        local_6 = 3;
        FMsg_GenSystemMsg local_34;
        local_34.ChannelType = local_6;
        local_34.SystemContentDataId = local_9;
        local_34.SystemContentArgs = local_14;
        return;
    }
    void PublishCombatTeamMemberJoinOrLeaveSystemMsg(const bool bJoin, const uint PlayerUid)
    {
        const UChatSettings local_2;
        GetGameplaySettings<UChatSettings> local_4;
        local_2 = local_4;
        if (!((local_2 != nullptr)) || !(local_2.ChatSettingsConfig.IsSet()))
        {
            return;
        }
        if (bJoin)
        {
        }
        else
        {
        }
        TDataObjectPtr<FChatContentConfig> local_58;
        this.PublishCombatTeamMemberSystemMsg(local_58, PlayerUid);
        return;
    }
    void GS_SendChatText(const uint ChannelType, const uint TargetUid, const FString &inout Text)
    {
        UGameClientConnectionSubsystem local_4 = ::UGameClientConnectionSubsystem::Get();
        if (!((local_4 != nullptr)) || !(local_4.IsConnectedToGameServer()))
        {
            if (ChannelType == 3 || (ChannelType == 1))
            {
                FCE_ChatSendToDS local_28;
                FECSEntity local_12 = FECSEntity(this.GetContext().GetLocalPlayer());
                if (!(local_12.IsValid()))
                {
                    XError(ELog(74), FString().Append("[FMS_ChatDataModel] GS_SendChatText: LocalPlayerEntity is invalid"));
                    return;
                }
                FECSWorldPtr local_24 = local_12.GetWorld();
                FFPTime local_34 = FFPTime(-1);
                local_28.ChannelType = ChannelType;
                local_28.TargetUid = TargetUid;
                local_28.TextContent = Text;
            }
            return;
        }
        this.SendProto(this.BuildSendChatTextReq(ChannelType, TargetUid, Text).ToWrapper());
        return;
    }
    void GS_OnSendChatMsgRsp(const FPbSendChatMsgRsp &inout Rsp)
    {
        if (Rsp.GetRetcode() != 0)
        {
            XLog(ELog(74), FString().Append("[FMS_ChatDataModel] SendChatMsg failed retcode=").Append(Rsp.GetRetcode()));
            return;
        }
        this.AppendFromRsp(Rsp);
        FEUIModelRef local_16 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus).opCall(local_16);
        return;
    }
    void GS_OnSyncChatMsgNotify(const FPbSyncChatMsgNotify &inout Notify)
    {
        this.AppendFromSyncNotify(Notify);
        return;
    }
    void GS_OnSyncOfflineChatMsgNotify(const FPbSyncOfflineChatMsgNotify &inout N)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void GS_OnGetChatHistoryRsp(const FPbGetChatHistoryRsp &inout Rsp)
    {
        int local_2;
        int local_56;
        this.SetbChatHistoryReqInFlight(false);
        int local_3 = this.GetChatHistoryReqOwnerUid();
        local_2 = local_3;
        this.SetChatHistoryReqOwnerUid(0);
        if (local_2 == 0 || ((local_2 != this.GetPersistedBoundPlayerUid())))
        {
            int local_3_2 = this.GetPersistedBoundPlayerUid();
            XLog(ELog(74), FString().Append("[FMS_ChatDataModel] GetChatHistory rsp dropped: owner mismatch req=").Append(local_2).Append(" bound=").Append(local_3_2));
            return;
        }
        if (Rsp.GetRetcode() != 0)
        {
            XLog(ELog(74), FString().Append("[FMS_ChatDataModel] GetChatHistory failed retcode=").Append(Rsp.GetRetcode()));
            return;
        }
        int local_3_3 = Rsp.GetMsgList_Num();
        bool local_13 = false;
        int local_14 = 0;
        for (; local_14 < local_3_3; ++local_14)
        {
            FPbChatMsgInfo local_34 = Rsp.GetMsgList_Index(local_14);
            FPbChatContent local_54 = local_34.GetContent();
            if (!(this.CheckContentValid(local_54)))
            {
                continue;
            }
            local_56 = local_54.GetSendTimeMs();
            if (this.IsDuplicateChannelMessageByTimeMs(local_34.GetChannelType(), local_56, local_54))
            {
                continue;
            }
            FM_ChatMessage& local_62 = ::FM_ChatMessage::Create(this.GetContext().Manager);
            this.FillChatMessageFromPbMsgInfo(local_62, local_34);
            local_62.SetbIsRead(true);
            this.TrimAndPush(local_62, true, true, true);
            local_13 = true;
        }
        if (local_13)
        {
            this.RefreshPrivateChatDerivedState();
            this.PersistRecentChatAfterMutation();
        }
        FEUIModelRef local_70 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus).opCall(local_70);
        XLog(ELog(74), FString().Append("GS_OnGetChatHistoryRsp num=").Append(local_3_3).Append(" inserted=").Append(local_13));
        return;
    }
    void GS_OnGetOfflineChatMsgRsp(const FPbGetOfflineChatMsgRsp &inout Rsp)
    {
        int local_1;
        int local_56;
        int local_2 = this.GetOfflineChatReqOwnerUid();
        local_1 = local_2;
        this.SetOfflineChatReqOwnerUid(0);
        if (local_1 == 0 || ((local_1 != this.GetPersistedBoundPlayerUid())))
        {
            int local_2_2 = this.GetPersistedBoundPlayerUid();
            XLog(ELog(74), FString().Append("[FMS_ChatDataModel] GetOfflineChatMsg rsp dropped: owner mismatch req=").Append(local_1).Append(" bound=").Append(local_2_2));
            return;
        }
        if (Rsp.GetRetcode() != 0)
        {
            XLog(ELog(74), FString().Append("[FMS_ChatDataModel] GetOfflineChatMsg failed retcode=").Append(Rsp.GetRetcode()));
            return;
        }
        this.ClearPendingOfflineState();
        int local_2_3 = Rsp.GetMsgList_Num();
        bool local_13 = false;
        int local_14 = 0;
        for (; local_14 < local_2_3; ++local_14)
        {
            FPbChatMsgInfo local_34 = Rsp.GetMsgList_Index(local_14);
            FPbChatContent local_54 = local_34.GetContent();
            if (!(this.CheckContentValid(local_54)))
            {
                continue;
            }
            local_56 = local_54.GetSendTimeMs();
            if (this.IsDuplicateChannelMessageByTimeMs(local_34.GetChannelType(), local_56, local_54))
            {
                continue;
            }
            FM_ChatMessage& local_62 = ::FM_ChatMessage::Create(this.GetContext().Manager);
            this.FillChatMessageFromPbMsgInfo(local_62, local_34);
            this.TrimAndPush(local_62, true, false, false);
            local_13 = true;
        }
        if (local_13)
        {
            this.PersistRecentChatAfterMutation();
        }
        FEUIModelRef local_70 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus).opCall(local_70);
        XLog(ELog(74), FString().Append("GS_OnGetOfflineChatMsgRsp num=").Append(local_2_3).Append(" inserted=").Append(local_13));
        return;
    }
    void GS_RequestChatHistory()
    {
        const UChatSettings local_8;
        TArray<EChatChannelTab> local_14;
        UGameClientConnectionSubsystem local_4 = ::UGameClientConnectionSubsystem::Get();
        if (!((local_4 != nullptr)) || !(local_4.IsConnectedToGameServer()))
        {
            return;
        }
        if (this.GetbChatHistoryReqInFlight())
        {
            return;
        }
        GetGameplaySettings<UChatSettings> local_10;
        local_8 = local_10;
        if (!((local_8 != nullptr)) || !(local_8.ChatSettingsConfig.IsSet()))
        {
            return;
        }
        FPbGetChatHistoryReq local_18;
        int local_19 = 0;
        for (; local_19 < local_14.Num(); ++local_19)
        {
            int local_24 = ::ChatSystemUtil::ResolveToProtoByChannelType(EChatChannelTab(local_14[local_19]));
            if (local_24 == 0)
            {
                continue;
            }
            FPbChatHistoryReqParam local_44 = local_18.AddParamList();
            local_44.SetChannelType(local_24);
            local_44.SetHistoryFromTimeMs(this.GetLocalLatestSendTimeMsForChannel(local_24));
        }
        int local_22 = local_18.GetParamList_Num();
        if (local_22 == 0)
        {
            return;
        }
        this.SetbChatHistoryReqInFlight(true);
        this.SetChatHistoryReqOwnerUid(this.GetPersistedBoundPlayerUid());
        this.SendProto(local_18.ToWrapper());
        XLog(ELog(74), FString().Append("GS_RequestChatHistory channels=").Append(local_18.GetParamList_Num()).Append(" owner=").Append(this.GetChatHistoryReqOwnerUid()));
        return;
    }
    void GS_RequestOfflineChatMsg()
    {
        if (this.GetPendingOfflineChannels().Num() == 0)
        {
            return;
        }
        UGameClientConnectionSubsystem local_8 = ::UGameClientConnectionSubsystem::Get();
        if (!((local_8 != nullptr)) || !(local_8.IsConnectedToGameServer()))
        {
            return;
        }
        FPbGetOfflineChatMsgReq local_14;
        this.SetOfflineChatReqOwnerUid(this.GetPersistedBoundPlayerUid());
        this.SendProto(local_14.ToWrapper());
        XLog(ELog(74), FString().Append("GS_RequestOfflineChatMsg pending=").Append(this.GetPendingOfflineChannels().Num()).Append(" owner=").Append(this.GetOfflineChatReqOwnerUid()));
        return;
    }
    void OnReceiveServerSendChat(const FCE_OnReceiveServerSendChat &inout Event)
    {
        int local_1 = Event.SenderBrief.GetUid();
        if (local_1 != 0)
        {
            ::FMS_PlayerData::Get(this.GetContext().Manager).UpdateOrCreateByBriefInfo(Event.SenderBrief, EPlayerInfoTrust(1));
        }
        this.AppendFromServerSendChatNotify(Event);
        FEUIModelRef local_12 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus).opCall(local_12);
        return;
    }
    void OnFriendDataUpdated(const FMsg_FriendDataUpdated &inout Msg)
    {
        const FChatPrivatePeerThread& local_22;
        for (auto& local_20 : this.GetPrivateChatThreadsByPeer())
        {
            local_20;
            FPlayerBriefInfo local_40 = FPlayerBriefInfo(local_22.CachedPeerBrief);
            bool local_17 = this.RebuildPlayerBrief(int(local_22.PeerUid), local_40);
            if (!(local_17))
            {
                local_40.SetUid(int(local_22.PeerUid));
            }
            this.GetModify_PrivateChatThreadsByPeer()[local_22.PeerUid].CachedPeerBrief = local_40;
        }
        return;
    }
    void OnChatInputPanelSubmitChatText(const FMsg_SubmitChatText &inout Msg)
    {
        this.GS_SendChatText(int(Msg.ChannelType), int(Msg.TargetUid), Msg.Text);
        return;
    }
    void HandleChatReadAllMessages(const FMsg_ChatReadAllMessages &inout Msg)
    {
        EChatChannelTab local_1 = Msg.ChannelTab;
        if ((int(local_1)) == 6)
        {
            int local_6;
            local_6 = int(Msg.PeerUid);
            if (this.GetPrivateChatThreadsByPeer().Contains(local_6))
            {
                const FChatPrivatePeerThread& local_10 = this.GetPrivateChatThreadsByPeer()[local_6];
                for (auto& local_24 : local_10.Messages)
                {
                    local_24;
                    true.SetbIsRead();
                }
            }
        }
        else
        {
            int local_7 = ::ChatSystemUtil::ResolveToProtoByChannelType(EChatChannelTab(local_1));
            if (this.GetRecentMessagesByChannel().Contains(local_7))
            {
                const FChatChannelRecentMessageList& local_26 = this.GetRecentMessagesByChannel()[local_7];
                for (auto& local_24 : local_26.Messages)
                {
                    local_24;
                    true.SetbIsRead();
                }
            }
        }
        FEUIModelRef local_32 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus).opCall(local_32);
        return;
    }
    void OnGenSystemMsg(const FMsg_GenSystemMsg &inout SystemMsg)
    {
        XLog(ELog(74), FString().Append("OnGenSystemMsg SystemMsg=").Append(SystemMsg.SystemContentDataId).Append(" SystemMsg.SystemContentArgs=").Append(SystemMsg.SystemContentArgs.Num()));
        FM_ChatMessage& local_8 = ::FM_ChatMessage::Create(this.GetContext().Manager);
        local_8.SetChannelType((int(SystemMsg.ChannelType) == 0 ? 4 : int(SystemMsg.ChannelType)));
        local_8.SetSenderType(1);
        local_8.SetSendTimeMs(FDateTime::UtcNow().ToUnixTimestamp() * 1000);
        local_8.SetSystemContentDataId(int(SystemMsg.SystemContentDataId));
        local_8.SetSystemContentArgs(SystemMsg.SystemContentArgs);
        this.ApplySystemBodyAndSnapshot(local_8);
        this.TrimAndPush(local_8, false, false, false);
        return;
    }
    FPbSendChatMsgReq BuildSendChatTextReq(const uint ChannelType, const uint TargetUid, const FString &inout Text)
    {
        FPbSendChatMsgReq local_4;
        local_4.SetChannelType(ChannelType);
        local_4.SetTargetUid(TargetUid);
        FPbChatContent local_24 = local_4.GetContent();
        local_24.SetContentType(1);
        local_24.SetSendTimeMs(FDateTime::UtcNow().ToUnixTimestamp() * 1000);
        local_24.GetText().SetText(Text);
        return local_4;
    }
    void FullChatSenderFromProto(const FPbChatSender &inout Sender, const uint ChannelType, FM_ChatMessage &inout Msg)
    {
        Msg.SetSenderType(Sender.GetSenderType());
        FPbPlayerBriefInfo local_22 = Sender.GetPlayerBriefInfo();
        if (!(local_22.IsValid()))
        {
            XError(ELog(74), FString().Append("[FMS_ChatDataModel] FullChatSenderFromProto: Sender has no PlayerBriefInfo"));
            return;
        }
        int local_1 = local_22.GetUid();
        if (local_1 != 0)
        {
            FPlayerBriefInfo local_48;
            local_48 = ::FMS_PlayerBriefInfo::Get(this.GetContext().Manager).CacheFromProto(local_22);
            Msg.SetSenderBrief(local_48);
        }
        return;
    }
    FPlayerBriefInfo BuildLocalPlayerSenderBrief()
    {
        if (!(this.GetContext().GetLocalPlayer().IsValid()))
        {
            return FPlayerBriefInfo();
        }
        return ::FMS_PlayerBriefInfo::Get(this.GetContext().Manager).CacheFromDSPlayerEntity(this.GetLocalPlayerUidForPersistence());
    }
    void AppendFromRsp(const FPbSendChatMsgRsp &inout Rsp)
    {
        FPbChatContent local_20 = Rsp.GetContent();
        if (!(this.CheckContentValid(local_20)))
        {
            return;
        }
        FM_ChatMessage& local_24 = ::FM_ChatMessage::Create(this.GetContext().Manager);
        local_24.SetChannelType(Rsp.GetChannelType());
        local_24.SetTargetUid(Rsp.GetTargetUid());
        local_24.SetSenderType(2);
        local_24.SetSendTimeMs(local_20.GetSendTimeMs());
        local_24.SetSenderBrief(this.BuildLocalPlayerSenderBrief());
        this.FillBodyFromContent(local_24, local_20);
        this.TrimAndPush(local_24, false, false, false);
        return;
    }
    void AppendFromSyncNotify(const FPbSyncChatMsgNotify &inout Notify)
    {
        FPbChatContent local_20 = Notify.GetContent();
        if (!(this.CheckContentValid(local_20)))
        {
            return;
        }
        FM_ChatMessage& local_24 = ::FM_ChatMessage::Create(this.GetContext().Manager);
        local_24.SetChannelType(Notify.GetChannelType());
        local_24.SetSendTimeMs(local_20.GetSendTimeMs());
        this.FullChatSenderFromProto(Notify.GetSender(), Notify.GetChannelType(), local_24);
        this.FillBodyFromContent(local_24, local_20);
        this.TrimAndPush(local_24, false, false, false);
        FEUIModelRef local_48 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus).opCall(local_48);
        return;
    }
    void AppendFromServerSendChatNotify(const FCE_OnReceiveServerSendChat &inout Event)
    {
        FChatServerSendChatSnapshot local_2 = Event.SendChat;
        int local_3 = local_2.GetContentType();
        if (local_3 == 0)
        {
            return;
        }
        FM_ChatMessage& local_8 = ::FM_ChatMessage::Create(this.GetContext().Manager);
        local_8.SetChannelType(local_2.GetChannelType());
        local_8.SetTargetUid(local_2.GetTargetUid());
        local_8.SetSenderType(local_2.GetSenderType());
        local_8.SetContentType(local_2.GetContentType());
        local_8.SetSendTimeMs(local_2.GetSendTimeMs());
        if (local_2.GetbIsNpcDialogue())
        {
            local_8.SetbIsNpcDialogue(true);
            local_8.SetBodyText(this.MakeNpcChatBodyText(local_2));
        }
        else
        {
            local_8.SetSenderBrief(Event.SenderBrief);
            this.ApplySendChatSnapshotToMessage(local_8, local_2);
        }
        this.TrimAndPush(local_8, false, false, false);
        return;
    }
    void ApplySendChatSnapshotToMessage(FM_ChatMessage &inout Msg, const FChatServerSendChatSnapshot &inout S)
    {
        TArray<FChatSystemSerializedArg> local_4;
        if (S.GetContentType() == 1)
        {
            FText local_16;
            local_16 = FText::FromString(S.GetTextContent());
            Msg.SetBodyText(local_16);
            Msg.SetSystemContentDataId(0);
            Msg.SetSystemContentArgs(local_4);
            return;
        }
        else
        {
            FText local_16;
            if (S.GetContentType() == 2)
            {
                Msg.SetSystemContentDataId(S.GetSystemContentDataId());
                Msg.SetSystemContentArgs(S.GetSystemContentArgs());
                this.ApplySystemBodyAndSnapshot(Msg);
                return;
            }
            else
            {
                Msg.SetBodyText(local_16);
                Msg.SetSystemContentDataId(0);
                Msg.SetSystemContentArgs(local_4);
                XError(ELog(74), FString().Append("[FMS_ChatDataModel] ApplySendChatSnapshotToMessage: ContentType is invalid"));
                return;
            }
        }
    }
    void ApplyChatSystemContentFromProto(FM_ChatMessage &inout Msg, const FPbChatSystemContent &inout Sys)
    {
        int local_1 = Sys.GetDataId();
        Msg.SetSystemContentDataId(local_1);
        TArray<FChatSystemSerializedArg> local_6;
        int local_1_2 = Sys.GetArgList_Num();
        int local_8 = 0;
        for (; local_8 < local_1_2; )
        {
            local_6.Add(::ChatSystemUtil::ChatSerializedArgFromPb(Sys.GetArgList_Index(local_8)));
            ++local_8;
        }
        Msg.SetSystemContentArgs(local_6);
        this.ApplySystemBodyAndSnapshot(Msg);
        return;
    }
    void FillBodyFromContent(FM_ChatMessage &inout Msg, const FPbChatContent &inout Content)
    {
        Msg.SetContentType(Content.GetContentType());
        TArray<FChatSystemSerializedArg> local_6;
        FText local_10;
        Msg.SetBodyText(local_10);
        Msg.SetSystemContentDataId(0);
        Msg.SetSystemContentArgs(local_6);
        if (Content.GetContentType() == 1)
        {
            Msg.SetBodyText(FText::FromString(Content.GetText().GetText()));
            Msg.SetSystemContentDataId(0);
            Msg.SetSystemContentArgs(local_6);
            return;
        }
        else
        {
            if (Content.GetContentType() == 2)
            {
                this.ApplyChatSystemContentFromProto(Msg, Content.GetSystem());
                return;
            }
            else
            {
                XError(ELog(74), FString().Append("[FMS_ChatDataModel] FillBodyFromContent: ContentType is invalid"));
                return;
            }
        }
    }
    bool CheckContentValid(const FPbChatContent &inout Content)
    {
        if (!(Content.IsValid()))
        {
            XError(ELog(74), FString().Append("[FMS_ChatDataModel] CheckContentValid: Content is invalid"));
            return false;
        }
        if (Content.GetContentType() == 1)
        {
            if (!(Content.HasText()))
            {
                XError(ELog(74), FString().Append("[FMS_ChatDataModel] CheckContentValid: CHAT_CONTENT_TEXT but HasText is false"));
                return false;
            }
            if (Content.GetText().GetText().IsEmpty())
            {
                XError(ELog(74), FString().Append("[FMS_ChatDataModel] CheckContentValid: CHAT_CONTENT_TEXT but Text is empty"));
                return false;
            }
        }
        else
        {
            if (Content.GetContentType() == 2)
            {
                if (!(Content.HasSystem()))
                {
                    XError(ELog(74), FString().Append("[FMS_ChatDataModel] CheckContentValid: CHAT_CONTENT_SYSTEM but HasSystem is false"));
                    return false;
                }
                int local_9 = Content.GetSystem().GetDataId();
                if (local_9 == 0)
                {
                    XError(ELog(74), FString().Append("[FMS_ChatDataModel] CheckContentValid: CHAT_CONTENT_SYSTEM but DataId is 0"));
                    return false;
                }
            }
            else
            {
                int local_8 = Content.GetContentType();
                if (local_8 == 0)
                {
                    XError(ELog(74), FString().Append("[FMS_ChatDataModel] CheckContentValid: CHAT_CONTENT_NONE"));
                    return false;
                }
            }
        }
        return true;
    }
    uint GetLocalPlayerUidForPersistence() const
    {
        int local_1 = 0;
        if (this.GetContext().GetLocalPlayer().IsValid())
        {
            local_1 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(this.GetContext().GetLocalPlayer());
        }
        return local_1;
    }
    void FillChatMessageFromPbMsgInfo(FM_ChatMessage &inout Msg, const FPbChatMsgInfo &inout Info)
    {
        bool local_35;
        FPbChatContent local_20 = Info.GetContent();
        Msg.SetChannelType(Info.GetChannelType());
        Msg.SetSendTimeMs(local_20.GetSendTimeMs());
        this.FullChatSenderFromProto(Info.GetSender(), Info.GetChannelType(), Msg);
        this.FillBodyFromContent(Msg, local_20);
        if (::ChatSystemUtil::IsPrivateChatPbChannel(Info.GetChannelType()))
        {
            FPbPlayerBriefInfo local_56 = Info.GetTargetBrief();
            if (!(local_56.IsValid()))
            {
                local_35 = false;
            }
            else
            {
                int local_21 = local_56.GetUid();
                local_35 = (local_21 != 0);
            }
            if (local_35)
            {
                Msg.SetTargetUid(local_56.GetUid());
                ::FMS_PlayerBriefInfo::Get(this.GetContext().Manager).CacheFromProto(local_56);
            }
        }
        return;
    }
    bool IsDuplicateChannelMessageByTimeMs(const uint Ch, const uint64 SendTimeMs, const FPbChatContent &inout Content)
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        bool __r; return __r;
    }
    bool IsSameChannelMessageContent(const FM_ChatMessage &inout M, const FPbChatContent &inout Content)
    {
        int local_2;
        if (M.GetContentType() != Content.GetContentType())
        {
            return false;
        }
        if (Content.GetContentType() == 1)
        {
            FString local_26;
            if (Content.HasText())
            {
                local_26 = Content.GetText().GetText();
            }
            else
            {
                local_26 = "";
            }
            return (M.GetBodyText().ToString() == local_26);
        }
        if (Content.GetContentType() == 2)
        {
            if (Content.HasSystem())
            {
                local_2 = Content.GetSystem().GetDataId();
            }
            else
            {
                local_2 = 0;
            }
            return (M.GetSystemContentDataId() == local_2);
        }
        return true;
    }
    uint64 GetLocalLatestSendTimeMsForChannel(const uint PbChannel)
    {
        TArray<TEUIModelRef<FM_ChatMessage>> local_6;
        if (!(this.GetRecentMessagesByChannel().Contains(PbChannel)))
        {
            return 0;
        }
        if (local_6.Num() == 0)
        {
            return 0;
        }
        int local_8 = local_6.Num() - 1;
        return GetSendTimeMs();
    }
    bool IsClientSaveHistoryChannel(const uint PbChannel)
    {
        const UChatSettings local_2;
        GetGameplaySettings<UChatSettings> local_4;
        local_2 = local_4;
        if ((!((local_2 != nullptr))))
        {
            return false;
        }
        EChatChannelTab local_9 = ::ChatSystemUtil::TryPbChannelToChannelTab(PbChannel);
        if ((int(local_9)) == 0)
        {
            return false;
        }
        return local_2.ClientSaveHistoryChannels.Contains(local_9);
    }
    void ClearRecentChatMemory()
    {
        this.GetModify_RecentMessages().Empty(0);
        this.GetModify_RecentMessagesByChannel().Empty(0);
        this.GetModify_PrivateChatThreadsByPeer().Empty(0);
        this.GetModify_PrivateChatPeerOrder().Empty(0);
        this.GetModify_StrangerPeerBriefByUid().Empty(0);
        ::FMS_PlayerBriefInfo::Get(this.GetContext().Manager).InvalidateAll();
        this.SetbChatHistoryReqInFlight(false);
        this.SetCachedSaveGame(nullptr);
        return;
    }
    void ClearPendingOfflineState()
    {
        this.GetModify_PendingOfflineChannels().Empty(0);
        this.SetPendingOfflineChannelsOwnerUid(0);
        ::FMS_RedDotSystem::Get(this.GetContext().Manager).ConsumeRedDot(GameplayTags::RedDotSystem_Chat_PrivateMsg, 4294967296);
        return;
    }
    void OnLocalPlayerUidContextMaybeChanged()
    {
        bool local_11;
        int local_2 = this.GetLocalPlayerUidForPersistence();
        if (local_2 == 0)
        {
            int local_1 = this.GetPersistedBoundPlayerUid();
            if (local_1 != 0)
            {
                this.ClearRecentChatMemory();
                this.ClearPendingOfflineState();
                ::FMS_ChatRuntimeData::Get(this.GetContext().Manager).ResetForLocalPlayerContextChange();
                this.SetPersistedBoundPlayerUid(0);
                FEUIModelRef local_10 = FEUIModelRef(this);
                FEUIMessageBus::Publish(EUIMessageBus).opCall(local_10);
            }
            return;
        }
        if (this.GetPersistedBoundPlayerUid() == local_2)
        {
            return;
        }
        this.ClearRecentChatMemory();
        int local_1_2 = this.GetPendingOfflineChannelsOwnerUid();
        if (local_1_2 != 0 && (this.GetPendingOfflineChannelsOwnerUid() != local_2))
        {
            this.ClearPendingOfflineState();
        }
        else
        {
            if (this.GetPendingOfflineChannels().Num() > 0)
            {
                this.SetPendingOfflineChannelsOwnerUid(local_2);
            }
        }
        if (local_2 == 0)
        {
            local_11 = false;
        }
        else
        {
            local_1_2 = this.GetPersistedBoundPlayerUid();
            local_11 = (local_1_2 != 0);
        }
        if (local_11)
        {
            ::FMS_ChatRuntimeData::Get(this.GetContext().Manager).ResetForLocalPlayerContextChange();
        }
        this.SetPersistedBoundPlayerUid(local_2);
        this.LoadRecentChatHistoryFromLocal(local_2);
        FEUIModelRef local_10_2 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus).opCall(local_10_2);
        this.GS_RequestChatHistory();
        return;
    }
    UChatRecentHistorySaveGame EnsureCachedSaveGameForUid(const uint PlayerUid)
    {
        if (PlayerUid == 0)
        {
            return nullptr;
        }
        if (this.GetCachedSaveGame() != nullptr && (int(this.GetCachedSaveGame().OwnerPlayerUid) == PlayerUid))
        {
            return this.GetCachedSaveGame();
        }
        UChatRecentHistorySaveGame local_8 = ::ChatRecentHistorySaveGame::Get(PlayerUid);
        if ((!((local_8 != nullptr))))
        {
            return nullptr;
        }
        local_8.Version = 0;
        local_8.OwnerPlayerUid = PlayerUid;
        this.SetCachedSaveGame(local_8);
        return this.GetCachedSaveGame();
    }
    void FillPersistRecordFromMessage(const FM_ChatMessage &inout M, FChatMessagePersistRecord &inout R)
    {
        R.ChannelType = M.GetChannelType();
        R.TargetUid = M.GetTargetUid();
        R.SenderType = M.GetSenderType();
        R.SenderUid = M.GetSenderBrief().GetUid();
        R.SenderNickname = M.GetSenderBrief().GetNickname();
        R.SenderLevel = M.GetSenderBrief().GetLevel();
        R.SenderCurAvatarId = M.GetSenderBrief().GetCurAvatarId();
        R.BodyTextStr = M.GetBodyText().ToString();
        R.SendTimeMs = M.GetSendTimeMs();
        R.ContentType = M.GetContentType();
        R.SystemContentDataId = M.GetSystemContentDataId();
        R.SystemContentArgs = M.GetSystemContentArgs();
        R.SystemContentArgStrings.Empty(0);
        return;
    }
    void RebuildChatSaveMessages(const UChatRecentHistorySaveGame SaveGame)
    {
        FM_ChatMessage& local_6;
        SaveGame.Messages.Empty(0);
        int local_2 = 0;
        for (; local_2 < this.GetRecentMessages().Num(); ++local_2)
        {
            if (!(this.IsClientSaveHistoryChannel(local_6.GetChannelType())))
            {
                continue;
            }
            FChatMessagePersistRecord local_34;
            this.FillPersistRecordFromMessage(local_6, local_34);
            SaveGame.Messages.Add(local_34);
        }
        return;
    }
    void WritebackChatSaveSmallState(const UChatRecentHistorySaveGame SaveGame, const uint PlayerUid)
    {
        const FPlayerBriefInfo& local_34;
        SaveGame.Version = 0;
        SaveGame.OwnerPlayerUid = PlayerUid;
        SaveGame.PrivatePeerOrderUids.Empty(0);
        int local_3 = 0;
        for (; local_3 < this.GetPrivateChatPeerOrder().Num(); )
        {
            SaveGame.PrivatePeerOrderUids.Add(this.GetPrivateChatPeerOrder()[local_3]);
            ++local_3;
        }
        SaveGame.StrangerPeerBriefs.Empty(0);
        for (auto& local_24 : this.GetStrangerPeerBriefByUid())
        {
            FChatStrangerPeerBriefRecord local_32;
            local_32.PeerUid = local_24.GetKey();
            local_32.Nickname = local_34.GetNickname();
            local_32.Level = local_34.GetLevel();
            local_32.CurAvatarId = local_34.GetCurAvatarId();
            SaveGame.StrangerPeerBriefs.Add(local_32);
        }
        return;
    }
    void SaveRecentChatHistoryToLocalForUid(const uint PlayerUid)
    {
        if (PlayerUid == 0)
        {
            return;
        }
        UChatRecentHistorySaveGame local_4 = this.EnsureCachedSaveGameForUid(PlayerUid);
        if ((!((local_4 != nullptr))))
        {
            return;
        }
        this.RebuildChatSaveMessages(local_4);
        this.WritebackChatSaveSmallState(local_4, PlayerUid);
        ::ChatRecentHistorySaveGame::Save(PlayerUid, local_4, false);
        return;
    }
    void PersistAppendedMessageToLocal(const FM_ChatMessage &inout M)
    {
        int local_1 = this.GetPersistedBoundPlayerUid();
        if (local_1 == 0)
        {
            local_1 = this.GetLocalPlayerUidForPersistence();
        }
        if (local_1 == 0)
        {
            return;
        }
        UChatRecentHistorySaveGame local_6 = this.EnsureCachedSaveGameForUid(local_1);
        if ((!((local_6 != nullptr))))
        {
            return;
        }
        if (this.IsClientSaveHistoryChannel(M.GetChannelType()))
        {
            FChatMessagePersistRecord local_34;
            this.FillPersistRecordFromMessage(M, local_34);
            local_6.Messages.Add(local_34);
        }
        this.WritebackChatSaveSmallState(local_6, local_1);
        ::ChatRecentHistorySaveGame::Save(local_1, local_6, false);
        return;
    }
    void LoadRecentChatHistoryFromLocal(const uint PlayerUid)
    {
        if (PlayerUid == 0)
        {
            return;
        }
        FString local_10 = ::ChatRecentHistorySaveGame::GetSaveGameName(PlayerUid);
        if (!(Gameplay::DoesSaveGameExist(local_10, 0)))
        {
            return;
        }
        UChatRecentHistorySaveGame local_14 = (Cast<UChatRecentHistorySaveGame>(Gameplay::LoadGameFromSlot(local_10, 0)));
        if ((!((local_14 != nullptr))))
        {
            return;
        }
        if (int(local_14.Version) > 0)
        {
            XLog(ELog(74), FString().Append("[FMS_ChatDataModel] Chat history version unsupported file=").Append(local_14.Version).Append(" max=").Append(0));
            return;
        }
        if (int(local_14.OwnerPlayerUid) != PlayerUid)
        {
            XLog(ELog(74), FString().Append("[FMS_ChatDataModel] Chat history owner uid mismatch file=").Append(local_14.OwnerPlayerUid).Append(" current=").Append(PlayerUid));
            return;
        }
        this.SetCachedSaveGame(local_14);
        this.GetModify_PrivateChatPeerOrder().Empty(0);
        int local_21 = 0;
        for (; local_21 < local_14.PrivatePeerOrderUids.Num(); )
        {
            this.GetModify_PrivateChatPeerOrder().Add(local_14.PrivatePeerOrderUids[local_21]);
            ++local_21;
        }
        this.GetModify_StrangerPeerBriefByUid().Empty(0);
        int local_21_2 = 0;
        for (; local_21_2 < local_14.StrangerPeerBriefs.Num(); ++local_21_2)
        {
            FChatStrangerPeerBriefRecord& local_24 = local_14.StrangerPeerBriefs[local_21_2];
            if (int(local_24.PeerUid) == 0)
            {
                continue;
            }
            FPlayerBriefInfo local_42;
            local_42.SetUid(int(local_24.PeerUid));
            local_42.SetNickname(local_24.Nickname);
            local_42.SetLevel(int(local_24.Level));
            local_42.SetCurAvatarId(int(local_24.CurAvatarId));
            this.GetModify_StrangerPeerBriefByUid().Add(local_24.PeerUid, local_42);
            ::FMS_PlayerBriefInfo::Get(this.GetContext().Manager).UpsertPlayerBrief(local_42);
        }
        if (local_14.Messages.Num() == 0)
        {
            return;
        }
        int local_21_3 = 0;
        for (; local_21_3 < local_14.Messages.Num(); )
        {
            FChatMessagePersistRecord& local_44 = local_14.Messages[local_21_3];
            FM_ChatMessage& local_46 = ::FM_ChatMessage::Create(this.GetContext().Manager);
            local_46.SetbIsRead(true);
            local_46.SetChannelType(int(local_44.ChannelType));
            local_46.SetTargetUid(int(local_44.TargetUid));
            local_46.SetSenderType(int(local_44.SenderType));
            local_46.SetSenderBrief(::FMS_PlayerBriefInfo::Get(this.GetContext().Manager).CacheFromMessageRecord(local_44));
            local_46.SetBodyText(FText::FromString(local_44.BodyTextStr));
            local_46.SetSendTimeMs(local_44.SendTimeMs);
            local_46.SetContentType(int(local_44.ContentType));
            local_46.SetSystemContentDataId(int(local_44.SystemContentDataId));
            TArray<FChatSystemSerializedArg> local_74 = local_44.SystemContentArgs;
            if (local_74.Num() == 0 && (local_44.SystemContentArgStrings.Num() > 0))
            {
                TArray<FString> local_80 = local_44.SystemContentArgStrings;
                int local_81 = 0;
                for (; local_81 < local_80.Num(); )
                {
                    local_74.Add(::ChatSystemUtil::ChatSerializedArgFromLegacyDisplayString(local_80[local_81]));
                    ++local_81;
                }
            }
            local_46.SetSystemContentArgs(local_74);
            int local_19 = local_46.GetSystemContentDataId();
            if (local_19 != 0)
            {
                this.ApplySystemBodyAndSnapshot(local_46);
            }
            this.TrimAndPush(local_46, true, true, true);
            ++local_21_3;
        }
        this.RefreshPrivateChatDerivedState();
        FEUIModelRef local_100 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus).opCall(local_100);
        return;
    }
    void PersistRecentChatAfterMutation()
    {
        int local_1 = this.GetPersistedBoundPlayerUid();
        if (local_1 == 0)
        {
            local_1 = this.GetLocalPlayerUidForPersistence();
        }
        if (local_1 == 0)
        {
            return;
        }
        this.SaveRecentChatHistoryToLocalForUid(local_1);
        return;
    }
    int FindInsertIndexBySendTimeAscending(TArray<TEUIModelRef<FM_ChatMessage>> &inout Arr, const uint64 SendTimeMs)
    {
        int local_1 = 0;
        for (; local_1 < Arr.Num(); ++local_1)
        {
            if (GetSendTimeMs() > SendTimeMs)
            {
                return local_1;
            }
        }
        return Arr.Num();
    }
    bool ShouldUseStrangerBriefForPrivatePeer(const uint PeerUid) const
    {
        return PeerUid != 0 && !(::FriendUtil::IsFriend(PeerUid));
    }
    void TryUpsertStrangerWhenPeerSenderMidOrder(const FChatPrivatePeerThread &inout Thread, const FM_ChatMessage &inout M)
    {
        if (M.GetSenderBrief().GetUid() != int(Thread.PeerUid))
        {
            return;
        }
        int local_1 = M.GetSenderBrief().GetUid();
        if (local_1 != 0 && this.ShouldUseStrangerBriefForPrivatePeer(M.GetSenderBrief().GetUid()))
        {
            this.UpsertStrangerPeerBriefToLocal(M.GetSenderBrief());
        }
        return;
    }
    void IncrementalPrivateChatAfterPush(const TEUIModelRef<FM_ChatMessage> &inout PushedRef)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    int TrimAndPush(FM_ChatMessage &inout Msg, const bool bSkipPersist = false, const bool bSkipPrivateChatDerivedRefresh = false, const bool ForbidAutoPublishMsg = false)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    void RefreshPrivateChatDerivedState()
    {
        TArray<uint> local_4;
        int local_5 = 0;
        for (; local_5 < this.GetPrivateChatPeerOrder().Num(); )
        {
            local_4.Add(this.GetPrivateChatPeerOrder()[local_5]);
            ++local_5;
        }
        this.GetModify_PrivateChatThreadsByPeer().Empty(0);
        TArray<TEUIModelRef<FM_ChatMessage>> local_12;
        this.AppendPrivateChannelMessagesTo(local_12, 6);
        if (local_12.Num() == 0)
        {
            this.GetModify_PrivateChatPeerOrder().Empty(0);
            return;
        }
        int local_5_2 = 0;
        for (; local_5_2 < local_12.Num(); ++local_5_2)
        {
            FM_ChatMessage local_16;
            int local_13 = this.ResolvePrivateChatPeerUid(local_16);
            if (local_13 == 0)
            {
                continue;
            }
            FChatPrivatePeerThread& local_20 = this.GetModify_PrivateChatThreadsByPeer().FindOrAdd(local_13);
            local_20.PeerUid = local_13;
            local_20.Messages.Add(local_12[local_5_2]);
        }
        for (auto& local_38 : this.GetPrivateChatThreadsByPeer())
        {
            FChatPrivatePeerThread& local_20_2 = this.GetModify_PrivateChatThreadsByPeer()[local_38.GetKey()];
            this.SortMessageRefsBySendTimeAscending(local_20_2.Messages);
            int local_5_3 = 0;
            for (; local_5_3 < local_20_2.Messages.Num(); )
            {
                this.UpdatePrivatePeerCachesFromMessage(local_20_2);
                ++local_5_3;
            }
        }
        this.RebuildPrivatePeerDisplayOrder(local_4);
        return;
    }
    void RebuildPrivatePeerDisplayOrder(const TArray<uint> &inout PreviousPeerOrder)
    {
        int local_29;
        TSet<uint> local_20;
        TArray<uint> local_24;
        int local_25 = 0;
        for (; local_25 < PreviousPeerOrder.Num(); ++local_25)
        {
            local_29 = PreviousPeerOrder[local_25];
            if (local_29 == 0 || !(this.GetPrivateChatThreadsByPeer().Contains(local_29)))
            {
                continue;
            }
            if (local_20.Contains(local_29))
            {
                continue;
            }
            local_24.Add(local_29);
            local_20.Add(local_29);
        }
        TArray<uint> local_36;
        for (auto& local_54 : this.GetPrivateChatThreadsByPeer())
        {
            local_29 = local_54.GetKey();
            if (local_29 == 0 || local_20.Contains(local_29))
            {
                continue;
            }
            local_36.Add(local_29);
        }
        this.SortPeerUidsByLastActivityDescending(local_36);
        this.GetModify_PrivateChatPeerOrder().Empty(0);
        int local_25_2 = 0;
        for (; local_25_2 < local_36.Num(); )
        {
            this.GetModify_PrivateChatPeerOrder().Add(local_36[local_25_2]);
            ++local_25_2;
        }
        int local_25_3 = 0;
        for (; local_25_3 < local_24.Num(); )
        {
            this.GetModify_PrivateChatPeerOrder().Add(local_24[local_25_3]);
            ++local_25_3;
        }
        return;
    }
    void SortPeerUidsByLastActivityDescending(TArray<uint> &inout PeerUids)
    {
        int64 local_10;
        int local_2 = PeerUids.Num();
        int local_3 = 0;
        for (; local_3 < local_2; ++local_3)
        {
            int local_7 = local_3 + 1;
            for (; local_7 < local_2; ++local_7)
            {
                local_10 = this.GetPrivateChatThreadsByPeer()[PeerUids[local_3]].LastActivitySendTime;
                int64 local_12 = this.GetPrivateChatThreadsByPeer()[PeerUids[local_7]].LastActivitySendTime;
                if (local_12 > local_10)
                {
                    int local_15;
                    local_15 = PeerUids[local_3];
                    PeerUids[local_3] = PeerUids[local_7];
                    PeerUids[local_7] = local_15;
                }
            }
        }
        return;
    }
    void AppendPrivateChannelMessagesTo(TArray<TEUIModelRef<FM_ChatMessage>> &out OutRefs, const uint ChannelType)
    {
        TArray<TEUIModelRef<FM_ChatMessage>> local_8;
        TArray<TEUIModelRef<FM_ChatMessage>> local_4;
        OutRefs = local_4;
        if (!(this.GetModify_RecentMessagesByChannel().Contains(ChannelType)))
        {
            return;
        }
        int local_9 = 0;
        for (; local_9 < local_8.Num(); )
        {
            OutRefs.Add(local_8[local_9]);
            ++local_9;
        }
        return;
    }
    void SortMessageRefsBySendTimeAscending(TArray<TEUIModelRef<FM_ChatMessage>> &inout Arr)
    {
        int local_2 = Arr.Num();
        int local_3 = 0;
        for (; local_3 < local_2; ++local_3)
        {
            int local_7 = local_3 + 1;
            for (; local_7 < local_2; ++local_7)
            {
                if (GetSendTimeMs() < GetSendTimeMs())
                {
                    TEUIModelRef<FM_ChatMessage> local_14 = TEUIModelRef<FM_ChatMessage>(Arr[local_3]);
                    Arr[local_3] = Arr[local_7];
                    Arr[local_7] = local_14;
                }
            }
        }
        return;
    }
    bool IsBriefDisplayable(const FPlayerBriefInfo &inout Brief) const
    {
        int local_1 = Brief.GetUid();
        return local_1 != 0 && !(Brief.GetNickname().IsEmpty());
    }
    bool TryFillStrangerPeerBriefFromDS(const uint PeerUid, FPlayerBriefInfo &inout OutBrief)
    {
        if (PeerUid == 0)
        {
            return false;
        }
        FPlayerBriefInfo local_38 = ::FMS_PlayerBriefInfo::Get(this.GetContext().Manager).CacheFromDSPlayerEntity(PeerUid);
        if (!(this.IsBriefDisplayable(local_38)))
        {
            return false;
        }
        OutBrief = local_38;
        return true;
    }
    bool TryGetStrangerPeerBriefFromLocalStorage(const uint PeerUid, FPlayerBriefInfo &inout OutBrief)
    {
        if (PeerUid == 0)
        {
            return false;
        }
        if (this.GetStrangerPeerBriefByUid().Contains(PeerUid))
        {
            OutBrief = this.GetStrangerPeerBriefByUid()[PeerUid];
            return true;
        }
        return ::FMS_PlayerBriefInfo::Get(this.GetContext().Manager).TryGetCachedBrief(PeerUid, OutBrief);
    }
    void UpsertStrangerPeerBriefToLocal(const FPlayerBriefInfo &inout Brief)
    {
        if (!(this.IsBriefDisplayable(Brief)))
        {
            return;
        }
        this.GetModify_StrangerPeerBriefByUid().Add(Brief.GetUid(), Brief);
        return;
    }
    void UpdatePrivatePeerCachesFromMessage(FChatPrivatePeerThread &inout Thread, const FM_ChatMessage &inout M)
    {
        Thread.LastActivitySendTime = M.GetSendTimeMs();
        if (!(M.GetBodyText().IsEmpty()) && ((M.GetContentType() == 1)))
        {
            Thread.CachedLastMessagePreview = M.GetBodyText().ToString();
        }
        int local_4 = this.GetLocalPlayerUidForPersistence();
        if ((M.GetSenderBrief().GetUid() == int(Thread.PeerUid)))
        {
            Thread.CachedPeerBrief = M.GetSenderBrief();
            this.UpsertStrangerPeerBriefToLocal(M.GetSenderBrief());
            return;
        }
        bool local_6 = (local_4 != 0) && (M.GetSenderBrief().GetUid() == local_4) && (M.GetTargetUid() == int(Thread.PeerUid));
        if (!(local_6))
        {
            local_6 = false;
        }
        else
        {
            int local_11 = M.GetTargetUid();
            local_6 = (local_11 != 0);
        }
        if (local_6)
        {
            FPlayerBriefInfo local_32;
            if (Thread.CachedPeerBrief.GetUid() == int(Thread.PeerUid) && !(Thread.CachedPeerBrief.GetNickname().IsEmpty()))
            {
                return;
            }
            if (::FriendUtil::TryGetFriendBrief(M.GetTargetUid(), local_32))
            {
                Thread.CachedPeerBrief = local_32;
                this.UpsertStrangerPeerBriefToLocal(local_32);
            }
            else
            {
                if (this.ShouldUseStrangerBriefForPrivatePeer(M.GetTargetUid()))
                {
                    if (this.TryFillStrangerPeerBriefFromDS(M.GetTargetUid(), local_32))
                    {
                        this.UpsertStrangerPeerBriefToLocal(local_32);
                        Thread.CachedPeerBrief = local_32;
                    }
                    else
                    {
                        if (this.TryGetStrangerPeerBriefFromLocalStorage(M.GetTargetUid(), local_32))
                        {
                            Thread.CachedPeerBrief = local_32;
                        }
                        else
                        {
                            local_32.SetUid(M.GetTargetUid());
                            Thread.CachedPeerBrief = local_32;
                        }
                    }
                }
                else
                {
                    local_32.SetUid(M.GetTargetUid());
                    Thread.CachedPeerBrief = local_32;
                }
            }
        }
        return;
    }
    uint ResolvePrivateChatPeerUid(const FM_ChatMessage &inout M) const
    {
        int local_1;
        int local_2 = M.GetChannelType();
        local_1 = local_2;
        if (!(::ChatSystemUtil::IsPrivateChatPbChannel(local_1)))
        {
            return 0;
        }
        int local_2_2 = this.GetLocalPlayerUidForPersistence();
        if (local_2_2 != 0 && (M.GetSenderBrief().GetUid() == local_2_2))
        {
            return M.GetTargetUid();
        }
        return M.GetSenderBrief().GetUid();
    }
    uint GetResolvedPrivateChatPeerUidForNavigation(const FM_ChatMessage &inout M) const
    {
        return this.ResolvePrivateChatPeerUid(M);
    }
    void EnsurePrivatePeerThreadForPlayerEntry(const uint PeerUid)
    {
        if (PeerUid == 0)
        {
            return;
        }
        FPlayerBriefInfo local_20;
        bool local_2 = this.RebuildPlayerBrief(PeerUid, local_20);
        if (!(local_2))
        {
            local_20.SetUid(PeerUid);
        }
        bool local_21 = this.GetPrivateChatThreadsByPeer().Contains(PeerUid);
        FChatPrivatePeerThread& local_24 = this.GetModify_PrivateChatThreadsByPeer().FindOrAdd(PeerUid);
        local_24.PeerUid = PeerUid;
        local_24.CachedPeerBrief = local_20;
        if (!(local_21))
        {
            local_24.Messages.Empty(0);
            local_24.CachedLastMessagePreview = "";
            local_24.LastActivitySendTime = 0;
            this.GetModify_PrivateChatPeerOrder().Insert(PeerUid, 0);
        }
        return;
    }
    bool TryGetPrivateChatThreadMessages(const uint PeerUid, TArray<TEUIModelRef<FM_ChatMessage>> &out OutMsgs)
    {
        TArray<TEUIModelRef<FM_ChatMessage>> local_4;
        OutMsgs = local_4;
        if (!(this.GetPrivateChatThreadsByPeer().Contains(PeerUid)))
        {
            return false;
        }
        OutMsgs = this.GetPrivateChatThreadsByPeer()[PeerUid].Messages;
        return true;
    }
    FPlayerBriefInfo GetPrivatePeerCachedBrief(const uint PeerUid)
    {
        if (!(this.GetPrivateChatThreadsByPeer().Contains(PeerUid)))
        {
            return FPlayerBriefInfo();
        }
        return this.GetPrivateChatThreadsByPeer()[PeerUid].CachedPeerBrief;
    }
    FString GetPrivatePeerCachedPreview(const uint PeerUid)
    {
        if (!(this.GetPrivateChatThreadsByPeer().Contains(PeerUid)))
        {
            return FString();
        }
        return this.GetPrivateChatThreadsByPeer()[PeerUid].CachedLastMessagePreview;
    }
    bool RebuildPlayerBrief(const uint PlayerID, FPlayerBriefInfo &inout OutBrief)
    {
        if (PlayerID == 0)
        {
            return false;
        }
        FPlayerBriefInfo local_20;
        bool local_21 = false;
        if (::FriendUtil::TryGetFriendBrief(PlayerID, local_20))
        {
            local_21 = true;
            this.UpsertStrangerPeerBriefToLocal(local_20);
        }
        else
        {
            if (this.TryGetStrangerPeerBriefFromLocalStorage(PlayerID, local_20))
            {
                local_21 = true;
            }
            else
            {
                if (this.TryFillStrangerPeerBriefFromDS(PlayerID, local_20))
                {
                    this.UpsertStrangerPeerBriefToLocal(local_20);
                    local_21 = true;
                }
            }
        }
        if (local_21 && this.IsBriefDisplayable(local_20))
        {
            OutBrief = local_20;
            return true;
        }
        if (this.IsBriefDisplayable(OutBrief))
        {
            return true;
        }
        OutBrief.SetUid(PlayerID);
        return false;
    }
    FChatSystemSerializedArg ChatSerializedArgFromPb(const FPbChatArgument &inout Arg)
    {
        FChatSystemSerializedArg local_10;
        if (!(Arg.IsValid()))
        {
            return local_10;
        }
        if (Arg.HasStringValue())
        {
            local_10.SetKind(EChatSystemPbArgKind(1));
            FString local_16 = Arg.GetStringValue();
            local_10.SetValue(local_16);
            return local_10;
        }
        if (Arg.HasIntValue())
        {
            local_10.SetKind(EChatSystemPbArgKind(2));
            local_10.SetValue(FString().Append(Arg.GetIntValue()));
            return local_10;
        }
        if (Arg.HasUintValue())
        {
            local_10.SetKind(EChatSystemPbArgKind(3));
            local_10.SetValue(FString().Append(Arg.GetUintValue()));
            return local_10;
        }
        if (Arg.HasFloatValue())
        {
            local_10.SetKind(EChatSystemPbArgKind(4));
            local_10.SetValue(FString().Append(Arg.GetFloatValue()));
            return local_10;
        }
        if (Arg.HasDoubleValue())
        {
            local_10.SetKind(EChatSystemPbArgKind(5));
            local_10.SetValue(FString().Append(Arg.GetDoubleValue()));
            return local_10;
        }
        return local_10;
    }
    FText BuildSystemBodyText(const uint SystemContentDataId, const TArray<FChatSystemSerializedArg> &inout SystemContentArgs)
    {
        return this.MakeSystemChatBodyText(SystemContentDataId, SystemContentArgs);
    }
    FString TryResolvePlayerNickname(const uint PlayerUid)
    {
        if (PlayerUid == 0)
        {
            return FString();
        }
        FPlayerBriefInfo local_42 = ::FMS_PlayerBriefInfo::Get(this.GetContext().Manager).GetPlayerBriefInfo(PlayerUid);
        if (!(local_42.GetNickname().IsEmpty()))
        {
            return local_42.GetNickname();
        }
        FPlayerBriefInfo local_60;
        if (::FriendUtil::TryGetFriendBrief(PlayerUid, local_60) && !(local_60.GetNickname().IsEmpty()))
        {
            return local_60.GetNickname();
        }
        FPlayerFullInfo local_98 = ::FMS_PlayerData::Get(this.GetContext().Manager).GetCachedPlayerInfo(PlayerUid);
        if (local_98.GetbHasNickName() && !(local_98.GetNickName().IsEmpty()))
        {
            return local_98.GetNickName();
        }
        return FString();
    }
    FString ResolveSystemMessagePlayerName(const uint PlayerUid)
    {
        FString local_6;
        if (PlayerUid == 0)
        {
            return local_6;
        }
        local_6 = this.TryResolvePlayerNickname(PlayerUid);
        FString local_14;
        if (local_6.IsEmpty())
        {
            local_14 = FString().Append(PlayerUid);
        }
        else
        {
            local_14 = local_6;
        }
        return local_14;
    }
    FString ResolveSystemMessageDisplayName(const uint PlayerUid, const FString &inout SnapshotName)
    {
        FString local_6;
        if (PlayerUid == 0)
        {
            return local_6;
        }
        local_6 = this.TryResolvePlayerNickname(PlayerUid);
        if (!(local_6.IsEmpty()))
        {
            return local_6;
        }
        if (!(SnapshotName.IsEmpty()))
        {
            return SnapshotName;
        }
        return local_6.Append(PlayerUid);
    }
    TArray<FChatSystemSerializedArg> FillPlayerNameSnapshots(const uint SystemContentDataId, const TArray<FChatSystemSerializedArg> &inout SystemContentArgs)
    {
        if (!(::FChatContentConfig::GetByDataId(SystemContentDataId).IsSet()) || ((0 != 2)))
        {
            return SystemContentArgs;
        }
        TArray<FChatSystemSerializedArg> local_58;
        local_58.Reserve(SystemContentArgs.Num());
        int local_59 = 0;
        for (; local_59 < SystemContentArgs.Num(); )
        {
            FChatSystemSerializedArg local_70 = FChatSystemSerializedArg(SystemContentArgs[local_59].GetKind(), SystemContentArgs[local_59].GetValue());
            local_70.SetDisplayName(SystemContentArgs[local_59].GetDisplayName());
            FString local_74 = this.TryResolvePlayerNickname(String::Conv_StringToInt(local_70.GetValue()));
            if (!(local_74.IsEmpty()))
            {
                local_70.SetDisplayName(local_74);
            }
            local_58.Add(local_70);
            ++local_59;
        }
        return local_58;
    }
    void ApplySystemBodyAndSnapshot(FM_ChatMessage &inout Msg)
    {
        Msg.SetSystemContentArgs(this.FillPlayerNameSnapshots(Msg.GetSystemContentDataId(), Msg.GetSystemContentArgs()));
        Msg.SetBodyText(this.MakeSystemChatBodyText(Msg.GetSystemContentDataId(), Msg.GetSystemContentArgs()));
        return;
    }
    FText MakeSystemChatBodyText(const uint SystemContentDataId, const TArray<FChatSystemSerializedArg> &inout SystemContentArgs)
    {
        FText local_126;
        FText local_184;
        Make local_274;
        Make local_286;
        GetDataObjectByGSDataId<FCommissionConfig> local_364;
        const UChatSettings local_446;
        FText __return;
        if (!(::FChatContentConfig::GetByDataId(SystemContentDataId).IsSet()))
        {
            return FText::FromString(FString().Append("[System] data_id=").Append(SystemContentDataId));
        }
        EChatSystemContentType local_60;
        EChatSystemContentType local_59 = local_60;
        TArray<FTextArgument> local_64;
        int local_65 = int(local_59);
        FText local_72;
        FText local_460;
        if (local_65 == 0 || (SystemContentArgs.Num() == 0))
        {
        }
        else
        {
            if (int(local_59) == 1)
            {
                int local_65_2 = SystemContentArgs.Num();
                if (local_65_2 >= 2)
                {
                    EItemRarity local_127;
                    int local_73 = String::Conv_StringToInt(SystemContentArgs[0].GetValue());
                    if (!(::FItemConfig::GetByDataId(local_73)))
                    {
                        return FText::FromString(FString().Append("[System] unknown_item data_id=").Append(local_73));
                    }
                    EItemRarity local_128;
                    local_127 = local_128;
                    if (::UGlobalItemSettings::Get().GetRarityConfig())
                    {
                    }
                    else
                    {
                        XError(ELog(74), FString().Append("Rarity config not found for rarity ").Append(local_127));
                    }
                    ::ChatSystemUtil::MakeSystemChatItemWithRarityHyperlinkText(local_126);
                    int local_66 = String::Conv_StringToInt(SystemContentArgs[1].GetValue());
                    FText local_58;
                    local_72 = FText::Format(local_184, local_58, local_126);
                    __return = local_184;
                }
                else
                {
                }
            }
            else
            {
                if (int(local_59) == 2)
                {
                    TMap<FString, FFormatArgumentValue> local_206;
                    if (local_72.ToString().Contains("{PlayerName}", ESearchCase(1), ESearchDir(0)))
                    {
                        FPlayerBriefInfo local_244 = this.BuildLocalPlayerSenderBrief();
                        if (local_244.GetNickname().IsEmpty())
                        {
                            FString local_258 = FString().Append(local_244.GetUid());
                        }
                        else
                        {
                            FString local_258_2 = local_244.GetNickname();
                        }
                        ::ChatSystemUtil::MakeSystemChatPlayerUidHyperlinkText(local_244.GetUid(), local_184);
                        local_206.Add("PlayerName", FFormatArgumentValue());
                    }
                    int local_65_3 = SystemContentArgs.Num();
                    int local_267 = 0;
                    for (; local_267 < local_65_3; )
                    {
                        int local_73_2 = String::Conv_StringToInt(SystemContentArgs[local_267].GetValue());
                        this.ResolveSystemMessageDisplayName(local_73_2, SystemContentArgs[local_267].GetDisplayName());
                        ::ChatSystemUtil::MakeSystemChatPlayerUidHyperlinkText(local_73_2, local_184);
                        local_206.Add(FString().Append(local_267), FFormatArgumentValue());
                        ++local_267;
                    }
                    local_72 = FText::Format(local_184);
                    return local_184;
                }
                if (int(local_59) == 3 || (int(local_59) == 4))
                {
                    if (SystemContentArgs.Num() >= 2)
                    {
                        int local_185 = String::Conv_StringToInt(SystemContentArgs[0].GetValue());
                        local_64.Add(local_274.opImplConv());
                        ::FItemConfig::GetByDataId(String::Conv_StringToInt(SystemContentArgs[1].GetValue()));
                        local_64.Add(local_286.opImplConv());
                        ::FChatContentConfig::ParseText(local_184);
                        return local_184;
                    }
                }
                else
                {
                    if (int(local_59) == 6)
                    {
                        int local_185_2 = String::Conv_StringToInt(SystemContentArgs[0].GetValue());
                        local_64.Add(local_274.opImplConv());
                        ::FItemConfig::GetByDataId(String::Conv_StringToInt(SystemContentArgs[1].GetValue()));
                        local_64.Add(local_286.opImplConv());
                        GetDataObjectByGSDataId<FExpOverflowConfig> local_310;
                        TDataObjectPtr<FExpOverflowConfig> local_340 = local_310.opImplConv();
                        Make local_316;
                        local_64.Add(local_316.opImplConv());
                        ::FChatContentConfig::ParseText(local_184);
                        return local_184;
                    }
                    if (int(local_59) == 5)
                    {
                        if (SystemContentArgs.Num() >= 3)
                        {
                            int local_73_3 = String::Conv_StringToInt(SystemContentArgs[0].GetValue());
                            TDataObjectPtr<FCommissionConfig> local_394 = local_364.opImplConv();
                            Make local_370;
                            local_64.Add(local_370.opImplConv());
                            int local_66_2 = String::Conv_StringToInt(SystemContentArgs[1].GetValue());
                            local_64.Add(local_274.opImplConv());
                            ::FItemConfig::GetByDataId(String::Conv_StringToInt(SystemContentArgs[2].GetValue()));
                            local_64.Add(local_286.opImplConv());
                            ::FChatContentConfig::ParseText(local_184);
                            return local_184;
                        }
                    }
                    else
                    {
                        if (int(local_59) == 7)
                        {
                            if (SystemContentArgs.Num() >= 2)
                            {
                                int local_73_4 = String::Conv_StringToInt(SystemContentArgs[0].GetValue());
                                int local_395 = String::Conv_StringToInt(SystemContentArgs[1].GetValue());
                                TDataObjectPtr<FCommissionConfig> local_394_2 = local_364.opImplConv();
                                if (!(local_394_2.IsSet()))
                                {
                                    FString local_248 = FString();
                                    FText::FromString(local_184);
                                    return local_184;
                                }
                                GetGameplaySettings<UChatSettings> local_448;
                                local_446 = local_448;
                                FName local_456;
                                if (local_446 != nullptr)
                                {
                                    local_456 = local_446.RecruitCommissionNameStyle;
                                }
                                else
                                {
                                    local_456 = FName();
                                }
                                FString local_258_3 = FString();
                                FText::AsCultureInvariant(local_184);
                                local_460 = FText::Format(local_72, local_184, local_126, ::ChatSystemUtil::MakeRecruitCommissionTeamHyperlinkText(local_395));
                                __return = local_460;
                            }
                            else
                            {
                            }
                        }
                    }
                }
            }
            __return = local_460;
        }
        return __return;
    }
    FText MakeNpcChatBodyText(const FChatServerSendChatSnapshot &inout S)
    {
        FText local_12;
        if (!(S.GetDialogueLineConfig().IsSet()))
        {
            return FText();
        }
        else
        {
            const FDialogueLineConfig& local_8;
            FText local_6;
            if (S.GetbUseSpotName() && (S.GetNpcEntityId() != 0))
            {
                TEUIModelRef<FM_Spot> local_18 = ::PresentationSpotUtils::GetEntitySpot(this.GetContext().Manager, FECSEntityId(S.GetNpcEntityId()));
                if (local_18)
                {
                    FSpotViewAdapter local_28;
                    local_12 = ::GetSpotName(local_18.opArrow(), local_28);
                    local_6 = local_12;
                }
            }
            if (local_6.IsEmpty() && local_8.GetSpeakerNPC().IsSet())
            {
                local_12.GetNpcName();
                local_6 = local_12;
            }
            if (local_6.IsEmpty())
            {
                return local_8.LineText;
            }
            else
            {
                local_12 = NSLOCTEXT("Chat", "NpcChatBodyFormat", "{0}: {1}");
                return FText::Format(local_12, local_6, local_8.LineText);
            }
        }
    }
    const TArray<TEUIModelRef<FM_ChatMessage>> GetRecentMessages() const property
    {
        const TArray<TEUIModelRef<FM_ChatMessage>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<TEUIModelRef<FM_ChatMessage>> GetModify_RecentMessages() property
    {
        TArray<TEUIModelRef<FM_ChatMessage>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetRecentMessages(const TArray<TEUIModelRef<FM_ChatMessage>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_RecentMessages = __Value;
        return;
    }
    const TMap<uint, FChatChannelRecentMessageList> GetRecentMessagesByChannel() const property
    {
        const TMap<uint, FChatChannelRecentMessageList> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TMap<uint, FChatChannelRecentMessageList> GetModify_RecentMessagesByChannel() property
    {
        TMap<uint, FChatChannelRecentMessageList> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetRecentMessagesByChannel(const TMap<uint, FChatChannelRecentMessageList> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_RecentMessagesByChannel = __Value;
        return;
    }
    const TMap<uint, FChatPrivatePeerThread> GetPrivateChatThreadsByPeer() const property
    {
        const TMap<uint, FChatPrivatePeerThread> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TMap<uint, FChatPrivatePeerThread> GetModify_PrivateChatThreadsByPeer() property
    {
        TMap<uint, FChatPrivatePeerThread> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetPrivateChatThreadsByPeer(const TMap<uint, FChatPrivatePeerThread> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_PrivateChatThreadsByPeer = __Value;
        return;
    }
    const TArray<uint> GetPrivateChatPeerOrder() const property
    {
        const TArray<uint> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<uint> GetModify_PrivateChatPeerOrder() property
    {
        TArray<uint> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetPrivateChatPeerOrder(const TArray<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_PrivateChatPeerOrder = __Value;
        return;
    }
    uint GetPersistedBoundPlayerUid() const property
    {
        this.TrackPropertyRead(4);
        return this.m_PersistedBoundPlayerUid;
    }
    void SetPersistedBoundPlayerUid(const uint __Value) property
    {
        if (this.m_PersistedBoundPlayerUid == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_PersistedBoundPlayerUid = __Value;
        return;
    }
    const TMap<uint, FPlayerBriefInfo> GetStrangerPeerBriefByUid() const property
    {
        const TMap<uint, FPlayerBriefInfo> __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    TMap<uint, FPlayerBriefInfo> GetModify_StrangerPeerBriefByUid() property
    {
        TMap<uint, FPlayerBriefInfo> __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetStrangerPeerBriefByUid(const TMap<uint, FPlayerBriefInfo> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_StrangerPeerBriefByUid = __Value;
        return;
    }
    const TArray<uint> GetPendingOfflineChannels() const property
    {
        const TArray<uint> __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    TArray<uint> GetModify_PendingOfflineChannels() property
    {
        TArray<uint> __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetPendingOfflineChannels(const TArray<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_PendingOfflineChannels = __Value;
        return;
    }
    uint GetPendingOfflineChannelsOwnerUid() const property
    {
        this.TrackPropertyRead(7);
        return this.m_PendingOfflineChannelsOwnerUid;
    }
    void SetPendingOfflineChannelsOwnerUid(const uint __Value) property
    {
        if (this.m_PendingOfflineChannelsOwnerUid == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_PendingOfflineChannelsOwnerUid = __Value;
        return;
    }
    bool GetbChatHistoryReqInFlight() const property
    {
        this.TrackPropertyRead(8);
        return this.m_bChatHistoryReqInFlight;
    }
    void SetbChatHistoryReqInFlight(const bool __Value) property
    {
        if (!(this.m_bChatHistoryReqInFlight) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_bChatHistoryReqInFlight = __Value;
        return;
    }
    uint GetChatHistoryReqOwnerUid() const property
    {
        this.TrackPropertyRead(9);
        return this.m_ChatHistoryReqOwnerUid;
    }
    void SetChatHistoryReqOwnerUid(const uint __Value) property
    {
        if (this.m_ChatHistoryReqOwnerUid == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_ChatHistoryReqOwnerUid = __Value;
        return;
    }
    uint GetOfflineChatReqOwnerUid() const property
    {
        this.TrackPropertyRead(10);
        return this.m_OfflineChatReqOwnerUid;
    }
    void SetOfflineChatReqOwnerUid(const uint __Value) property
    {
        if (this.m_OfflineChatReqOwnerUid == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_OfflineChatReqOwnerUid = __Value;
        return;
    }
    UChatRecentHistorySaveGame GetCachedSaveGame() const property
    {
        this.TrackPropertyRead(11);
        return this.m_CachedSaveGame;
    }
    void SetCachedSaveGame(const UChatRecentHistorySaveGame __Value) property
    {
        if (this.m_CachedSaveGame == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        return;
    }
}

namespace FM_ChatMessage
{
FM_ChatMessage& Create(const UObject ContextObject)
{
    return FM_ChatMessage::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FM_ChatMessage CreateByManager(const UEUIManagerSubsystem Manager)
{
    FM_ChatMessage __r;
    TEUIModelRef<FM_ChatMessage> local_6 = TEUIModelRef<FM_ChatMessage>(EUIInternal::MakeModelWithManager(Manager, FM_ChatMessage::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_ChatMessage;
}
int __IndexOf_ChannelType()
{
    return 0;
}
int __IndexOf_TargetUid()
{
    return 1;
}
int __IndexOf_SenderType()
{
    return 2;
}
int __IndexOf_BodyText()
{
    return 3;
}
int __IndexOf_SendTimeMs()
{
    return 4;
}
int __IndexOf_ContentType()
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
int __IndexOf_SenderBrief()
{
    return 9;
}
int __IndexOf_bIsRead()
{
    return 10;
}
int __IndexOf_bIsVirtualSystemMessage()
{
    return 11;
}
}
namespace FMS_ChatDataModel
{
FMS_ChatDataModel& Get(const UObject ContextObject)
{
    return FMS_ChatDataModel::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_ChatDataModel GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_ChatDataModel __r;
    TEUIModelRef<FMS_ChatDataModel> local_6 = TEUIModelRef<FMS_ChatDataModel>(EUIInternal::MakeModelWithManager(Manager, FMS_ChatDataModel::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMonitorDefine local_14;
    local_14.FunctionName = "__OnLocalPlayerEntityChanged";
    local_14.ComponentType = FC_PlayerController;
    Result.MonitorFunctions.Add(local_14);
    FEUIModelProtoRspDefine local_24;
    local_24.FunctionName = "__GS_OnSendChatMsgRsp";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnSyncChatMsgNotify";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnSyncOfflineChatMsgNotify";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnGetChatHistoryRsp";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnGetOfflineChatMsgRsp";
    Result.ProtoRspDefines.Add(local_24);
    FEUIModelEventDefine local_32;
    local_32.FunctionName = "__OnReceiveServerSendChat";
    local_32.EventType = FCE_OnReceiveServerSendChat;
    Result.EventFunctions.Add(local_32);
    FEUIModelMsgHandleDefine local_42;
    local_42.FunctionName = "__OnFriendDataUpdated";
    local_42.MessageTypeName = "Msg_FriendDataUpdated";
    local_42.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_42);
    local_42.FunctionName = "__OnChatInputPanelSubmitChatText";
    local_42.MessageTypeName = "Msg_SubmitChatText";
    local_42.SourcePropertyModelRefs = FBitSet64(-1);
    Result.MessageHandleFunctions.Add(local_42);
    local_42.FunctionName = "__HandleChatReadAllMessages";
    local_42.MessageTypeName = "Msg_ChatReadAllMessages";
    local_42.SourcePropertyModelRefs = FBitSet64(-1);
    Result.MessageHandleFunctions.Add(local_42);
    local_42.FunctionName = "__OnGenSystemMsg";
    local_42.MessageTypeName = "Msg_GenSystemMsg";
    local_42.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_42);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_ChatDataModel;
}
void __OnLocalPlayerEntityChanged(FMS_ChatDataModel &inout Model, const FECSEntity &inout Entity, const FC_PlayerController &inout Component)
{
    Model.OnLocalPlayerEntityChanged(Component);
    return;
}
void __GS_OnSendChatMsgRsp(FMS_ChatDataModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnSendChatMsgRsp(FPbSendChatMsgRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnSyncChatMsgNotify(FMS_ChatDataModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnSyncChatMsgNotify(FPbSyncChatMsgNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnSyncOfflineChatMsgNotify(FMS_ChatDataModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnSyncOfflineChatMsgNotify(FPbSyncOfflineChatMsgNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnGetChatHistoryRsp(FMS_ChatDataModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnGetChatHistoryRsp(FPbGetChatHistoryRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnGetOfflineChatMsgRsp(FMS_ChatDataModel &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnGetOfflineChatMsgRsp(FPbGetOfflineChatMsgRsp::FromWrapper(ProtoWrapper));
    return;
}
void __OnReceiveServerSendChat(FMS_ChatDataModel &inout Model, const FCE_OnReceiveServerSendChat &inout Event)
{
    Model.OnReceiveServerSendChat(Event);
    return;
}
void __OnFriendDataUpdated(FMS_ChatDataModel &inout Model, const FMsg_FriendDataUpdated &inout Message)
{
    Model.OnFriendDataUpdated(Message);
    return;
}
void __OnChatInputPanelSubmitChatText(FMS_ChatDataModel &inout Model, const FMsg_SubmitChatText &inout Message)
{
    Model.OnChatInputPanelSubmitChatText(Message);
    return;
}
void __HandleChatReadAllMessages(FMS_ChatDataModel &inout Model, const FMsg_ChatReadAllMessages &inout Message)
{
    Model.HandleChatReadAllMessages(Message);
    return;
}
void __OnGenSystemMsg(FMS_ChatDataModel &inout Model, const FMsg_GenSystemMsg &inout Message)
{
    Model.OnGenSystemMsg(Message);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
int __IndexOf_RecentMessages()
{
    return 0;
}
int __IndexOf_RecentMessagesByChannel()
{
    return 1;
}
int __IndexOf_PrivateChatThreadsByPeer()
{
    return 2;
}
int __IndexOf_PrivateChatPeerOrder()
{
    return 3;
}
int __IndexOf_PersistedBoundPlayerUid()
{
    return 4;
}
int __IndexOf_StrangerPeerBriefByUid()
{
    return 5;
}
int __IndexOf_PendingOfflineChannels()
{
    return 6;
}
int __IndexOf_PendingOfflineChannelsOwnerUid()
{
    return 7;
}
int __IndexOf_bChatHistoryReqInFlight()
{
    return 8;
}
int __IndexOf_ChatHistoryReqOwnerUid()
{
    return 9;
}
int __IndexOf_OfflineChatReqOwnerUid()
{
    return 10;
}
int __IndexOf_CachedSaveGame()
{
    return 11;
}
}

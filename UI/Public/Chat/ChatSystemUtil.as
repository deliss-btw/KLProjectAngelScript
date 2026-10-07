
namespace ChatSystemUtil
{
FText ResolveKLTextData(const TDataObjectPtr<FKLTextData> &inout TextData)
{
    bool local_1;
    bool local_2 = false;
    FText __return;
    if (!(TextData.IsSet()))
    {
        local_1 = false;
    }
    else
    {
        local_2 = !local_2;
        local_1 = local_2;
    }
    if (local_1)
    {
    }
    else
    {
        __return = FText();
    }
    return __return;
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
FChatSystemSerializedArg ChatSerializedArgFromLegacyDisplayString(const FString &inout LegacyFormatted)
{
    FChatSystemSerializedArg local_10;
    local_10.SetKind(EChatSystemPbArgKind(1));
    local_10.SetValue(LegacyFormatted);
    return local_10;
}
void FillSnapshotContentFromPb(FChatServerSendChatSnapshot &inout S, const FPbChatContent &inout C)
{
    if (!(C.IsValid()))
    {
        return;
    }
    S.SetSendTimeMs(C.GetSendTimeMs());
    S.SetContentType(C.GetContentType());
    if (C.GetContentType() == 1)
    {
        S.SetSenderType(2);
        if (C.HasText())
        {
            S.SetTextContent(C.GetText().GetText());
        }
        return;
    }
    int local_6 = C.GetContentType();
    if (local_6 == 2)
    {
        S.SetSenderType(1);
        if (C.HasSystem())
        {
            FPbChatSystemContent local_40 = C.GetSystem();
            S.SetSystemContentDataId(local_40.GetDataId());
            int local_6_2 = local_40.GetArgList_Num();
            int local_42 = 0;
            for (; local_42 < local_6_2; )
            {
                S.GetModify_SystemContentArgs().Add(ChatSystemUtil::ChatSerializedArgFromPb(local_40.GetArgList_Index(local_42)));
                ++local_42;
            }
        }
    }
    return;
}
FChatServerSendChatSnapshot MakeTextSnapshot(const uint ChannelType, const FString &inout Text)
{
    FChatServerSendChatSnapshot local_46;
    local_46.SetChannelType(ChannelType);
    local_46.SetTargetUid(0);
    local_46.SetContentType(1);
    local_46.SetSenderType(2);
    local_46.SetSendTimeMs(FDateTime::UtcNow().ToUnixTimestamp() * 1000);
    local_46.SetTextContent(Text);
    return local_46;
}
FChatServerSendChatSnapshot MakeSnapshotFromPbBroadcast(const FPbServerBroadcastChatMsgNotify &inout Notify)
{
    FChatServerSendChatSnapshot local_46;
    local_46.SetChannelType(Notify.GetChannelType());
    local_46.SetTargetUid(0);
    ChatSystemUtil::FillSnapshotContentFromPb(local_46, Notify.GetContent());
    local_46.SetSenderType(Notify.GetSender().GetSenderType());
    return local_46;
}
void ApplyFromPbBrief(FPlayerBriefInfo &inout Out, const FPbPlayerBriefInfo &inout Brief)
{
    Out.SetUid(Brief.GetUid());
    Out.SetNickname(Brief.GetNickname());
    Out.SetLevel(Brief.GetLevel());
    Out.SetCurAvatarId(Brief.GetCurAvatarId());
    Out.SetbIsOnline(Brief.GetIsOnline());
    return;
}
FChatServerSendChatSnapshot MakeSnapshotFromNpcDialogue(const FECSEntity &inout NpcEntity, const TDataObjectPtr<FDialogueLineConfig> &inout DialogueLineConfig, const bool bUseSpotName = false)
{
    int local_57;
    FChatServerSendChatSnapshot local_46;
    local_46.SetChannelType(1);
    local_46.SetTargetUid(0);
    local_46.SetSenderType(1);
    local_46.SetSendTimeMs(FDateTime::UtcNow().ToUnixTimestamp() * 1000);
    local_46.SetContentType(1);
    local_46.SetbIsNpcDialogue(true);
    local_46.SetDialogueLineConfig(DialogueLineConfig);
    local_46.SetbUseSpotName(bUseSpotName);
    if (NpcEntity.IsValid())
    {
        local_57 = NpcEntity.GetId();
    }
    else
    {
        local_57 = 0;
    }
    local_46.SetNpcEntityId(local_57);
    return local_46;
}
bool ShouldShowMessageOnChatHud(const uint ChannelType)
{
    const UChatSettings local_8;
    EChatChannelTab local_2 = ChatSystemUtil::TryPbChannelToChannelTab(ChannelType);
    if ((int(local_2)) == 0)
    {
        return false;
    }
    GetGameplaySettings<UChatSettings> local_10;
    local_8 = local_10;
    bool local_5 = !((local_8 != nullptr));
    if (local_5)
    {
        return true;
    }
    bool local_5_2 = local_8.InnerLevelTypes.Contains(FLevelUtils::GetCurrentLevelType());
    if (local_5_2)
    {
        return local_8.ChatHudConfig.ShowChannelsInner.Contains(local_2);
    }
    return local_8.ChatHudConfig.ShowChannels.Contains(local_2);
}
FText GetChannelTabDisplayName(const EChatChannelTab ChannelTab)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    FText __r; return __r;
}
FText GetChatHudChannelPrefix(const EChatChannelTab ChannelTab)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    FText __r; return __r;
}
bool CanSendByChannelType(const EChatChannelTab Tab)
{
    if ((int(Tab) == 1 || (int(Tab) == 3) || (int(Tab) == 2)))
    {
        return true;
    }
    return false;
}
uint ResolveToProtoByChannelType(const EChatChannelTab Tab)
{
    if (int(Tab) == 1)
    {
        return 1;
    }
    if (int(Tab) == 3)
    {
        return 3;
    }
    if (int(Tab) == 2)
    {
        return 2;
    }
    if (int(Tab) == 4)
    {
        return 4;
    }
    if (int(Tab) == 5)
    {
        return 5;
    }
    if (int(Tab) == 7)
    {
        return 7;
    }
    if (int(Tab) == 6)
    {
        return 6;
    }
    return 0;
}
bool IsPrivateChatPbChannel(const uint PbChannelType)
{
    return (PbChannelType == 6);
}
EChatChannelTab TryPbChannelToChannelTab(const uint PbChannelType)
{
    switch (PbChannelType)
    {
    case 5:
    {
        return EChatChannelTab(5);
    }
    case 1:
    {
        return EChatChannelTab(1);
    }
    case 2:
    {
        return EChatChannelTab(2);
    }
    case 3:
    {
        return EChatChannelTab(3);
    }
    case 4:
    {
        return EChatChannelTab(4);
    }
    case 6:
    {
        return EChatChannelTab(6);
    }
    case 7:
    {
        return EChatChannelTab(7);
    }
    default:
    {
    }
    }
    return EChatChannelTab(0);
}
FText GetChatHudChannelPrefixFromPbChannelType(const uint PbChannelType)
{
    return ChatSystemUtil::GetChatHudChannelPrefix(ChatSystemUtil::TryPbChannelToChannelTab(PbChannelType));
}
int64 GetLocalUtcOffsetSeconds()
{
    return (FDateTime::Now().ToUnixTimestamp() - FDateTime::UtcNow().ToUnixTimestamp());
}
FDateTime UnixUtcSecondsToLocalDateTime(const uint UnixTimestamp)
{
    return FDateTime::FromUnixTimestamp((UnixTimestamp + ChatSystemUtil::GetLocalUtcOffsetSeconds()));
}
uint MsToUnixSeconds(const uint64 UnixTimestampMs)
{
    int local_5 = FMath::IntegerDivisionTrunc(UnixTimestampMs, 1000);
    return local_5;
}
FString FormatUnixTimestampToHHmm(const uint UnixTimestamp)
{
    return ChatSystemUtil::UnixUtcSecondsToLocalDateTime(UnixTimestamp).ToString("%H:%M");
}
FString FormatUnixTimestampToYyyyMmDd(const uint UnixTimestamp)
{
    return ChatSystemUtil::UnixUtcSecondsToLocalDateTime(UnixTimestamp).ToString("%Y/%m/%d");
}
int GetUnixTimestampDisplayDayKey(const uint UnixTimestamp)
{
    FDateTime local_4 = ChatSystemUtil::UnixUtcSecondsToLocalDateTime(UnixTimestamp);
    int local_7 = (local_4.GetYear() * 10000) + (local_4.GetMonth() * 100);
    return (local_7 + local_4.GetDay());
}
FName ResolveChatHudSenderNameStyle(const uint SenderUid, const uint LocalPlayerUid, const bool bSenderIsTeammate)
{
    const UChatSettings local_2;
    GetGameplaySettings<UChatSettings> local_4;
    local_2 = local_4;
    if ((!((local_2 != nullptr))))
    {
        return FName();
    }
    FChatHudConfig local_12 = local_2.ChatHudConfig;
    if ((LocalPlayerUid != 0 && (SenderUid == LocalPlayerUid)))
    {
        return local_12.PlayerNameColor;
    }
    if (SenderUid != 0 && bSenderIsTeammate)
    {
        return local_12.TeammateNameColor;
    }
    return local_12.OtherNameColor;
}
FString FormatHex(const uint8 Value)
{
    FString local_4 = "0123456789ABCDEF";
    FString local_8;
    int local_9 = (Value >> 4) & 15;
    int local_13 = Value & 15;
    local_8 += String::GetSubstring(local_4, local_9, 1);
    local_8 += String::GetSubstring(local_4, local_13, 1);
    return local_8;
}
FString LinearColorToRichTag(const FLinearColor &inout Lin)
{
    FColor local_3 = Lin.ToFColor(true);
    FString local_12 = ((FString("<#") + ChatSystemUtil::FormatHex(uint8(int(local_3.R)))) + ChatSystemUtil::FormatHex(uint8(int(local_3.G))));
    FString local_16_2 = (local_12 + ChatSystemUtil::FormatHex(uint8(int(local_3.DWColor))));
    FString local_12_2 = (local_16_2 + ChatSystemUtil::FormatHex(uint8(int(local_3.A))));
    return (local_12_2 + ">");
}
FString WrapStringWithColorRichText(const FString &inout InText, const FLinearColor &inout NameColor)
{
    FString local_4;
    local_4 += ChatSystemUtil::LinearColorToRichTag(NameColor);
    local_4 += InText;
    local_4 += "</>";
    return local_4;
}
FString WrapStringWithRichTextStyleRow(const FString &inout InText, const FName &inout StyleRowHandle)
{
    FString local_8 = StyleRowHandle.ToString();
    if (local_8.IsEmpty())
    {
        return InText;
    }
    return FString().Append("<").Append(local_8).Append(">").Append(InText).Append("</>");
}
FText WrapTextWithRichTextStyleRow(const FText &inout InText, const FName &inout StyleRowHandle)
{
    FString local_8 = StyleRowHandle.ToString();
    if (local_8.IsEmpty())
    {
        return InText;
    }
    FString local_4 = "<";
    FString local_4_2 = ((local_4 + local_8) + ">{0}</>");
    return FText::Format(FText::AsCultureInvariant(local_4_2), InText);
}
FString BuildStyledActionHyperlink(const FString &inout InnerEscaped, const FName &inout StyleRow, const FString &inout Action, const FString &inout Param)
{
    FString local_8 = StyleRow.ToString();
    if (!(local_8.IsEmpty()))
    {
        return FString().Append("<a style=\"").Append(local_8).Append("\" action=\"").Append(Action).Append("\" param=\"").Append(Param).Append("\">").Append(InnerEscaped).Append("</>");
    }
    return FString().Append("<a action=\"").Append(Action).Append("\" param=\"").Append(Param).Append("\">").Append(InnerEscaped).Append("</>");
}
FText BuildStyledActionHyperlinkText(const FText &inout Inner, const FName &inout StyleRow, const FString &inout Action, const FString &inout Param)
{
    FString local_8 = StyleRow.ToString();
    FString local_12;
    if (!(local_8.IsEmpty()))
    {
        FString local_18_2 = (((FString("<a style=\"") + local_8) + "\" action=\"") + Action);
        FString local_4_2 = (local_18_2 + "\" param=\"");
        FString local_18_3 = (local_4_2 + Param);
        local_12 = (local_18_3 + "\">{0}</>");
    }
    else
    {
        FString local_4_3 = (FString("<a action=\"") + Action);
        FString local_18_4 = (local_4_3 + "\" param=\"");
        FString local_4_4 = (local_18_4 + Param);
        local_12 = (local_4_4 + "\">{0}</>");
    }
    return FText::Format(FText::AsCultureInvariant(local_12), Inner);
}
FString GetChatSystemHyperlinkActionString(const EChatSystemHyperlinkKind Kind)
{
    int64 local_6 = int(Kind);
    return UEnum::GetEnumType(n"EChatSystemHyperlinkKind").GetNameStringByValue(local_6);
}
FText MakeSystemChatPlayerUidHyperlinkText(const uint PlayerUid, const FString &inout DisplayNicknameOrUid)
{
    const UChatSettings local_2;
    GetGameplaySettings<UChatSettings> local_4;
    local_2 = local_4;
    FName local_13 = local_2 != nullptr ? local_2.SystemChatPlayerHyperlinkRichStyle : FName();
    return FText::AsCultureInvariant(ChatSystemUtil::BuildStyledActionHyperlink(DisplayNicknameOrUid, local_13, ChatSystemUtil::GetChatSystemHyperlinkActionString(EChatSystemHyperlinkKind(1)), FString().Append(PlayerUid)));
}
FText MakeRecruitCommissionTeamHyperlinkText(const uint RecruiterUid)
{
    const UChatSettings local_2;
    GetGameplaySettings<UChatSettings> local_4;
    local_2 = local_4;
    FText local_12;
    if ((!((local_2 != nullptr))))
    {
        return local_12;
    }
    local_12 = ChatSystemUtil::ResolveKLTextData(local_2.RecruitCommissionTeamTextData);
    FString local_20 = FString();
    return FText();
}
FText MakeSystemChatItemWithRarityHyperlinkText(const TDataObjectPtr<FItemConfig> &inout ItemPtr)
{
    const UChatSettings local_2;
    GetGameplaySettings<UChatSettings> local_4;
    int local_34 = 0;
    local_2 = local_4;
    if ((!((local_2 != nullptr))))
    {
        return FText();
    }
    if (!(ItemPtr.IsSet()))
    {
        return FText();
    }
    EItemRarity local_14;
    EItemRarity local_13 = local_14;
    FName local_18;
    if (local_2.SystemChatItemHyperlinkStyleByRarity.Contains(local_13))
    {
        local_18 = local_2.SystemChatItemHyperlinkStyleByRarity[local_13];
    }
    FText local_32;
    return ChatSystemUtil::BuildStyledActionHyperlinkText(local_32, local_18, ChatSystemUtil::GetChatSystemHyperlinkActionString(EChatSystemHyperlinkKind(2)), FString().Append(local_34));
}
int GetChatWeightedCharLength(const FString &inout S, const int NonAsciiCharCountNum)
{
    int local_1 = 0;
    int local_2 = String::Len(S);
    int local_4 = 0;
    for (; local_4 < local_2; ++local_4)
    {
        if (String::GetCharacterAsNumber(S, local_4) > 255)
        {
            local_1 = local_1 + NonAsciiCharCountNum;
            continue;
        }
        ++local_1;
    }
    return local_1;
}
FString TruncateChatTextToCharNumLimit(const FString &inout TrimmedText)
{
    const UChatSettings local_2;
    int local_70;
    GetGameplaySettings<UChatSettings> local_4;
    local_2 = local_4;
    if (!((local_2 != nullptr)) || !(local_2.ChatSettingsConfig.IsSet()))
    {
        return TrimmedText;
    }
    FStringCheckerConfig local_52;
    if (!(ChatSystemUtil::TryGetChatStringCheckerFromSettings(local_2, local_52)) || !(local_52.CharNum.bEnable))
    {
        return TrimmedText;
    }
    FStringCheckerCharNumConfig local_54 = local_52.CharNum;
    int local_56 = int(local_54.MaxNum);
    int local_55 = local_56;
    int local_56_2 = int(local_54.NonAsciiCharCountNum);
    int local_57 = local_56_2;
    FString local_62;
    int local_63 = 0;
    int local_64 = 0;
    int local_56_3 = String::Len(TrimmedText);
    int local_66 = 0;
    for (; local_66 < local_56_3; )
    {
        if (String::GetCharacterAsNumber(TrimmedText, local_66) > 255)
        {
            local_70 = local_57;
        }
        else
        {
            local_70 = 1;
        }
        if ((local_63 + 1) > local_55 || ((local_64 + local_70) > local_55))
        {
            break;
        }
        local_62 = (local_62 + TrimmedText.Mid(local_66, 1));
        ++local_63;
        local_64 = local_64 + local_70;
        ++local_66;
    }
    return local_62;
}
FText FormatCharNumCheckerError(const FText &inout Template, const int MinNum, const int MaxNum)
{
    if (Template.ToString().IsEmpty())
    {
        return FText();
    }
    TMap<FString, FFormatArgumentValue> local_30;
    local_30.Add("MinNum", FFormatArgumentValue(MinNum));
    local_30.Add("MaxNum", FFormatArgumentValue(MaxNum));
    return FText::Format(Template, local_30);
}
bool TryGetChatStringCheckerFromSettings(const UChatSettings Settings, FStringCheckerConfig &inout OutChecker)
{
    if (!((Settings != nullptr)) || !(Settings.ChatSettingsConfig.IsSet()))
    {
        return false;
    }
    return true;
}
bool TryValidateChatTextForSend(const FString &inout TrimmedText, FText &inout OutError)
{
    const UChatSettings local_2;
    GetGameplaySettings<UChatSettings> local_4;
    local_2 = local_4;
    FText local_10;
    OutError = local_10;
    FStringCheckerConfig local_54;
    if (!(ChatSystemUtil::TryGetChatStringCheckerFromSettings(local_2, local_54)) || !(local_54.CharNum.bEnable))
    {
        return true;
    }
    FStringCheckerCharNumConfig local_58 = local_54.CharNum;
    if (String::Len(TrimmedText) > int(local_58.MaxNum))
    {
        OutError = ChatSystemUtil::FormatCharNumCheckerError(local_58.LargerThanMaxNumErrorMessage, int(local_58.MinNum), int(local_58.MaxNum));
        return false;
    }
    int local_61 = ChatSystemUtil::GetChatWeightedCharLength(TrimmedText, int(local_58.NonAsciiCharCountNum));
    if (local_61 < int(local_58.MinNum))
    {
        OutError = ChatSystemUtil::FormatCharNumCheckerError(local_58.LessThanMinNumErrorMessage, int(local_58.MinNum), int(local_58.MaxNum));
        return false;
    }
    if (local_61 > int(local_58.MaxNum))
    {
        OutError = ChatSystemUtil::FormatCharNumCheckerError(local_58.LargerThanMaxNumErrorMessage, int(local_58.MinNum), int(local_58.MaxNum));
        return false;
    }
    return true;
}
bool ValidateChatTextCount(const FString &inout TrimmedText, FText &inout OutError, int &inout MaxCount)
{
    const UChatSettings local_2;
    GetGameplaySettings<UChatSettings> local_4;
    local_2 = local_4;
    if (!((local_2 != nullptr)) || !(local_2.ChatSettingsConfig.IsSet()))
    {
        return true;
    }
    MaxCount = 0;
    FText local_14;
    OutError = local_14;
    FStringCheckerConfig local_58;
    if (!(ChatSystemUtil::TryGetChatStringCheckerFromSettings(local_2, local_58)) || !(local_58.CharNum.bEnable))
    {
        return true;
    }
    FStringCheckerCharNumConfig local_60 = local_58.CharNum;
    MaxCount = int(local_60.MaxNum);
    if (String::Len(TrimmedText) > MaxCount)
    {
        OutError = ChatSystemUtil::FormatCharNumCheckerError(local_60.LargerThanMaxNumErrorMessage, int(local_60.MinNum), int(local_60.MaxNum));
        return false;
    }
    if (ChatSystemUtil::GetChatWeightedCharLength(TrimmedText, int(local_60.NonAsciiCharCountNum)) > MaxCount)
    {
        OutError = ChatSystemUtil::FormatCharNumCheckerError(local_60.LargerThanMaxNumErrorMessage, int(local_60.MinNum), int(local_60.MaxNum));
        return false;
    }
    return true;
}
void ApplyFromDSPlayerEntity(FPlayerBriefInfo &inout Out, const FECSEntity &inout PlayerEntity, const uint PlayerUid)
{
    int local_8 = 0;
    int local_22 = 0;
    if (!(PlayerEntity.IsValid()))
    {
        return;
    }
    Out.SetUid(PlayerUid);
    Out.SetNickname(local_8.GetNickName());
    int local_13 = 0;
    Get local_20;
    const FC_PlayerInGameState& local_16 = local_20.opCall();
    if (local_16)
    {
        local_13 = local_16.GetCurLevel();
    }
    Out.SetLevel(local_13);
    int local_21 = 0;
    Get local_28;
    const FC_PlayerController& local_24 = local_28.opCall();
    if (local_24)
    {
        if (local_24.GetPlayerPawnEntity().IsValid())
        {
            if (TDataObjectPtr<FAvatarPrefabConfig>(GetPrefabConfigPtr(local_24.GetPlayerPawnEntity()).opImplConv()).IsSet())
            {
                local_21 = local_22;
            }
        }
    }
    if (local_21 == 0)
    {
        local_21 = local_8.GetPlayerSpecialtyID();
    }
    Out.SetCurAvatarId(local_21);
    return;
}
}

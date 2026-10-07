
enum EChatMainTab
{
    Channel,
    PrivateChat,
    Friend,
}

enum EChatFriendTab
{
    FriendList,
    AddFriend,
    ApplyList,
}

enum EChatChannelTabStateInLevel
{
    All,
    OnlyOuterLevel,
    OnlyInnerLevel,
}


struct FChatTabInfoConfig
{
    UPROPERTY()
    EChatMainTab ChatMainTabType;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> TabNameTextData;
    UPROPERTY()
    bool bHide;
    UPROPERTY()
    FGameplayTag RedDotTabTag;
    UPROPERTY()
    ESystemModule SystemModule;
    UPROPERTY()
    FSoftBrush TabIcon;


}

struct FChatChannelNameInfoConfig
{
    UPROPERTY()
    TDataObjectPtr<FKLTextData> ChannelNameTextData;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> ChannelNameShortTextData;

    FChatChannelNameInfoConfig()
    {
        return;
    }
}

struct FChatChannelTabInfoConfig
{
    UPROPERTY()
    EChatChannelTab ChannelTab;
    UPROPERTY()
    FSoftBrush ChannelTabIcon;
    UPROPERTY()
    bool bHide;
    UPROPERTY()
    EChatChannelTabStateInLevel StateInLevel;


}

struct FChatHudConfig
{
    UPROPERTY()
    float32 ChatHudMessageShowTime = 10.0f;
    UPROPERTY()
    int ChatHudMessageMaxCount = 5;
    UPROPERTY()
    FName PlayerNameColor;
    UPROPERTY()
    FName TeammateNameColor;
    UPROPERTY()
    FName OtherNameColor;
    UPROPERTY()
    TArray<EChatChannelTab> ShowChannels;
    UPROPERTY()
    TArray<EChatChannelTab> ShowChannelsInner;


}

struct FFriendTabInfoConfig
{
    UPROPERTY()
    EChatFriendTab FriendTab;
    UPROPERTY()
    FSoftBrush FriendTabIcon;
    UPROPERTY()
    FGameplayTag RedDotTag;
    UPROPERTY()
    bool bHide;


}

class UChatSettings : UGameplaySettingsBase
{
    UPROPERTY()
    TDataObjectPtr<FChatSettingsConfig> ChatSettingsConfig;
    UPROPERTY()
    TArray<EChatChannelTab> ClientSaveHistoryChannels;
    UPROPERTY()
    TArray<ELevelType> InnerLevelTypes;
    UPROPERTY()
    TMap<EChatChannelTab, FChatChannelNameInfoConfig> ChannelNameMap;
    UPROPERTY()
    TArray<FChatTabInfoConfig> ChatTabInfoConfigs;
    UPROPERTY()
    TArray<FChatChannelTabInfoConfig> ChatChannelTabInfoConfigs;
    UPROPERTY()
    FChatHudConfig ChatHudConfig;
    UPROPERTY()
    FName SystemChatPlayerHyperlinkRichStyle;
    UPROPERTY()
    TMap<EItemRarity, FName> SystemChatItemHyperlinkStyleByRarity;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> SelfBriefTipsTextData;
    UPROPERTY()
    int ShowChatUnreadTipsMaxMessageCount = 99;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> ChatUnreadTipsTextData;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> ChatInputBanTipsBattleTeamTextData;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> ChatInputBanTipsSocialTeamTextData;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> ChatInputBanTipsSystemTabTextData;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> ChatInputBanTipsRecruitTabTextData;
    UPROPERTY()
    TDataObjectPtr<FFriendSettingsConfig> FriendSettingsConfig;
    UPROPERTY()
    TMap<EChatFriendTab, TDataObjectPtr<FKLTextData>> FriendTabNameTextDataMap;
    UPROPERTY()
    TArray<FFriendTabInfoConfig> FriendTabInfoConfigs;
    UPROPERTY()
    float32 FriendItemOfflineAlpha = 0.65f;
    UPROPERTY()
    TDataObjectPtr<FSystemControlConfig> FriendSystemControlConfig;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> NoFriendTipsTextData;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> FriendSystemOpenTipsTextData;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> FriendNumTipsTextData;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> DeleteFriendConfirmTitleTextData;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> DeleteFriendConfirmMessageTextData;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> DeleteFriendConfirmButtonTextData;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> DeleteFriendCancelButtonTextData;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> AddFriendSuccessTitleTextData;
    UPROPERTY()
    float32 AddFriendSuccessTimeDuration = 10.0f;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> AddSelfAsFriendTipsTextData;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> SearchFriendEmptyTipsTextData;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> AddFriendSuccessContentFormatTextData;
    UPROPERTY()
    FEUIInputActionDataRow AddFriendSuccessConfirmAction;
    UPROPERTY()
    FName RecruitCommissionNameStyle;
    UPROPERTY()
    FName RecruitCommissionTeamStyle;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> RecruitCommissionTeamTextData;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> RecruitSendSuccessTipsTextData;


}


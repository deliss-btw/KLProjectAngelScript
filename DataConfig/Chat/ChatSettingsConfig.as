
enum EChatChannelTab
{
    None,
    Nearby,
    SocialTeam,
    BattleTeam,
    System,
    World,
    PrivateChat,
    Recruit,
}


struct FChatSettingsConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FStringCheckerConfig StringChecker;
    UPROPERTY()
    FDataObjectPtr m_GetItemChatId;
    UPROPERTY()
    FDataObjectPtr m_JoinTeamChatId;
    UPROPERTY()
    FDataObjectPtr m_LeaveTeamChatId;
    UPROPERTY()
    FDataObjectPtr m_JoinCombatTeamChatId;
    UPROPERTY()
    FDataObjectPtr m_LeaveCombatTeamChatId;
    UPROPERTY()
    FDataObjectPtr m_CreateTeamChatId;
    UPROPERTY()
    FDataObjectPtr m_EndTeamChatId;
    UPROPERTY()
    FDataObjectPtr m_KickTeamMemberChatId;
    UPROPERTY()
    FDataObjectPtr m_KickOutTeamChatId;
    UPROPERTY()
    FDataObjectPtr m_TeamCaptainTransferChatId;
    UPROPERTY()
    FDataObjectPtr m_AddFriendChatId;
    UPROPERTY()
    FDataObjectPtr m_AddExpChatId;
    UPROPERTY()
    FDataObjectPtr m_AddExpOverflowChatId;
    UPROPERTY()
    FDataObjectPtr m_AddExpConvertChatId;
    UPROPERTY()
    int StrangerChatOfflineMaxCount;
    UPROPERTY()
    int FriendChatOfflineMaxCount;
    UPROPERTY()
    int FriendChatHistoryMaxCount;
    UPROPERTY()
    int FriendChatHistoryMaxDays;
    UPROPERTY()
    int RecruitSendCDSeconds;
    UPROPERTY()
    FDataObjectPtr m_RecruitChatId;
    UPROPERTY()
    TArray<EChatChannelTab> ServerHistoryChannels;
    UPROPERTY()
    int ChatSendCDMilliseconds;


    const TDataObjectPtr<FChatContentConfig> GetGetItemChatId() const property
    {
        const TDataObjectPtr<FChatContentConfig> __r;
        return __r;
    }
    void SetGetItemChatId(const TDataObjectPtr<FChatContentConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FChatContentConfig>> local_2;
        this.m_GetItemChatId = local_2;
        return;
    }
    const TDataObjectPtr<FChatContentConfig> GetJoinTeamChatId() const property
    {
        const TDataObjectPtr<FChatContentConfig> __r;
        return __r;
    }
    void SetJoinTeamChatId(const TDataObjectPtr<FChatContentConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FChatContentConfig>> local_2;
        this.m_JoinTeamChatId = local_2;
        return;
    }
    const TDataObjectPtr<FChatContentConfig> GetLeaveTeamChatId() const property
    {
        const TDataObjectPtr<FChatContentConfig> __r;
        return __r;
    }
    void SetLeaveTeamChatId(const TDataObjectPtr<FChatContentConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FChatContentConfig>> local_2;
        this.m_LeaveTeamChatId = local_2;
        return;
    }
    const TDataObjectPtr<FChatContentConfig> GetJoinCombatTeamChatId() const property
    {
        const TDataObjectPtr<FChatContentConfig> __r;
        return __r;
    }
    void SetJoinCombatTeamChatId(const TDataObjectPtr<FChatContentConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FChatContentConfig>> local_2;
        this.m_JoinCombatTeamChatId = local_2;
        return;
    }
    const TDataObjectPtr<FChatContentConfig> GetLeaveCombatTeamChatId() const property
    {
        const TDataObjectPtr<FChatContentConfig> __r;
        return __r;
    }
    void SetLeaveCombatTeamChatId(const TDataObjectPtr<FChatContentConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FChatContentConfig>> local_2;
        this.m_LeaveCombatTeamChatId = local_2;
        return;
    }
    const TDataObjectPtr<FChatContentConfig> GetCreateTeamChatId() const property
    {
        const TDataObjectPtr<FChatContentConfig> __r;
        return __r;
    }
    void SetCreateTeamChatId(const TDataObjectPtr<FChatContentConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FChatContentConfig>> local_2;
        this.m_CreateTeamChatId = local_2;
        return;
    }
    const TDataObjectPtr<FChatContentConfig> GetEndTeamChatId() const property
    {
        const TDataObjectPtr<FChatContentConfig> __r;
        return __r;
    }
    void SetEndTeamChatId(const TDataObjectPtr<FChatContentConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FChatContentConfig>> local_2;
        this.m_EndTeamChatId = local_2;
        return;
    }
    const TDataObjectPtr<FChatContentConfig> GetKickTeamMemberChatId() const property
    {
        const TDataObjectPtr<FChatContentConfig> __r;
        return __r;
    }
    void SetKickTeamMemberChatId(const TDataObjectPtr<FChatContentConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FChatContentConfig>> local_2;
        this.m_KickTeamMemberChatId = local_2;
        return;
    }
    const TDataObjectPtr<FChatContentConfig> GetKickOutTeamChatId() const property
    {
        const TDataObjectPtr<FChatContentConfig> __r;
        return __r;
    }
    void SetKickOutTeamChatId(const TDataObjectPtr<FChatContentConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FChatContentConfig>> local_2;
        this.m_KickOutTeamChatId = local_2;
        return;
    }
    const TDataObjectPtr<FChatContentConfig> GetTeamCaptainTransferChatId() const property
    {
        const TDataObjectPtr<FChatContentConfig> __r;
        return __r;
    }
    void SetTeamCaptainTransferChatId(const TDataObjectPtr<FChatContentConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FChatContentConfig>> local_2;
        this.m_TeamCaptainTransferChatId = local_2;
        return;
    }
    const TDataObjectPtr<FChatContentConfig> GetAddFriendChatId() const property
    {
        const TDataObjectPtr<FChatContentConfig> __r;
        return __r;
    }
    void SetAddFriendChatId(const TDataObjectPtr<FChatContentConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FChatContentConfig>> local_2;
        this.m_AddFriendChatId = local_2;
        return;
    }
    const TDataObjectPtr<FChatContentConfig> GetAddExpChatId() const property
    {
        const TDataObjectPtr<FChatContentConfig> __r;
        return __r;
    }
    void SetAddExpChatId(const TDataObjectPtr<FChatContentConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FChatContentConfig>> local_2;
        this.m_AddExpChatId = local_2;
        return;
    }
    const TDataObjectPtr<FChatContentConfig> GetAddExpOverflowChatId() const property
    {
        const TDataObjectPtr<FChatContentConfig> __r;
        return __r;
    }
    void SetAddExpOverflowChatId(const TDataObjectPtr<FChatContentConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FChatContentConfig>> local_2;
        this.m_AddExpOverflowChatId = local_2;
        return;
    }
    const TDataObjectPtr<FChatContentConfig> GetAddExpConvertChatId() const property
    {
        const TDataObjectPtr<FChatContentConfig> __r;
        return __r;
    }
    void SetAddExpConvertChatId(const TDataObjectPtr<FChatContentConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FChatContentConfig>> local_2;
        this.m_AddExpConvertChatId = local_2;
        return;
    }
    const TDataObjectPtr<FChatContentConfig> GetRecruitChatId() const property
    {
        const TDataObjectPtr<FChatContentConfig> __r;
        return __r;
    }
    void SetRecruitChatId(const TDataObjectPtr<FChatContentConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FChatContentConfig>> local_2;
        this.m_RecruitChatId = local_2;
        return;
    }
}


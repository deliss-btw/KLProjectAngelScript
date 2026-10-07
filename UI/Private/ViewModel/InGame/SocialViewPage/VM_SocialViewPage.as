
enum ESocialViewPageTargetTeamStatus
{
    WaitingQuery,
    HasTeam,
    NoTeam,
}

namespace FVMS_SocialViewPage
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature ShowMore = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature ShowLess = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature CopyUid = FEUIModelCallbackSignature();

}
struct FVMS_SocialViewPage : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    TArray<FEUIModelRef> m_BigButtonTabs;
    UPROPERTY()
    TArray<FEUIModelRef> m_SmallButtonTabs;
    UPROPERTY()
    FSoftBrush m_PlayerBackground;
    UPROPERTY()
    TArray<FName> m_AllRowNames;
    UPROPERTY()
    TEUIModelRef<FM_Player> m_TargetPlayerModel;
    UPROPERTY()
    ESocialViewPageTargetTeamStatus m_TargetTeamStatus;
    UPROPERTY()
    float32 m_TargetTeamStatusQueryPollAccumulator;
    UPROPERTY()
    FECSEntity m_InteractTarget;
    UPROPERTY()
    TEUIModelRef<FVM_ChatCommonAvatar> m_ChatCommonAvatar;
    UPROPERTY()
    ESocialViewPageOpenType m_OpenType;
    UPROPERTY()
    uint m_InteractTargetPlayerUid;
    UPROPERTY()
    TDataObjectPtr<FSocialViewPageData> m_SocialViewPageData;
    UPROPERTY()
    bool m_bCurShowHideSmallButton;

    FVMS_SocialViewPage()
    {
        this.m_TargetTeamStatus = ESocialViewPageTargetTeamStatus(0);
        this.m_TargetTeamStatusQueryPollAccumulator = 0.0f;
        this.m_OpenType = ESocialViewPageOpenType(0);
        this.m_InteractTargetPlayerUid = 0;
        this.m_bCurShowHideSmallButton = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_SocialViewPage(const FVMS_SocialViewPage &inout Other)
    {
        this.m_TargetTeamStatus = ESocialViewPageTargetTeamStatus(0);
        this.m_TargetTeamStatusQueryPollAccumulator = 0.0f;
        this.m_OpenType = ESocialViewPageOpenType(0);
        this.m_InteractTargetPlayerUid = 0;
        this.m_bCurShowHideSmallButton = false;
        this.m_BigButtonTabs = Other.m_BigButtonTabs;
        this.m_SmallButtonTabs = Other.m_SmallButtonTabs;
        this.m_PlayerBackground = Other.m_PlayerBackground;
        this.m_AllRowNames = Other.m_AllRowNames;
        this.m_TargetPlayerModel = Other.m_TargetPlayerModel;
        this.m_TargetTeamStatus = Other.m_TargetTeamStatus;
        this.m_TargetTeamStatusQueryPollAccumulator = Other.m_TargetTeamStatusQueryPollAccumulator;
        this.m_InteractTarget = Other.m_InteractTarget;
        this.m_ChatCommonAvatar = Other.m_ChatCommonAvatar;
        this.m_OpenType = Other.m_OpenType;
        this.m_InteractTargetPlayerUid = int(Other.m_InteractTargetPlayerUid);
        this.m_SocialViewPageData = Other.m_SocialViewPageData;
        this.m_bCurShowHideSmallButton = Other.m_bCurShowHideSmallButton;
        return;
    }
    FVMS_SocialViewPage opAssign(const FVMS_SocialViewPage &inout Other)
    {
        FVMS_SocialViewPage __r;
        this.m_BigButtonTabs = Other.m_BigButtonTabs;
        this.m_SmallButtonTabs = Other.m_SmallButtonTabs;
        this.m_PlayerBackground = Other.m_PlayerBackground;
        this.m_AllRowNames = Other.m_AllRowNames;
        this.m_TargetPlayerModel = Other.m_TargetPlayerModel;
        this.m_TargetTeamStatus = Other.m_TargetTeamStatus;
        this.m_TargetTeamStatusQueryPollAccumulator = Other.m_TargetTeamStatusQueryPollAccumulator;
        this.m_InteractTarget = Other.m_InteractTarget;
        this.m_ChatCommonAvatar = Other.m_ChatCommonAvatar;
        this.m_OpenType = Other.m_OpenType;
        this.m_InteractTargetPlayerUid = int(Other.m_InteractTargetPlayerUid);
        this.m_SocialViewPageData = Other.m_SocialViewPageData;
        this.m_bCurShowHideSmallButton = Other.m_bCurShowHideSmallButton;
        return __r;
    }
    int GetShowMoreButtonSwitchIndex() const
    {
        if (this.GetSocialViewPageData())
        {
            if (this.GetSocialViewPageData().opArrow().GetHiddenSmallButtons().Num() <= 0)
            {
                return 2;
            }
        }
        if (this.GetbCurShowHideSmallButton())
        {
            return 1;
        }
        return 0;
    }
    FSocialViewPageOperatorContext BuildOperatorContext() const
    {
        FSocialViewPageOperatorContext local_10;
        FSocialViewPageOperatorContext __r;
        local_10.LocalPlayerEntity = this.GetContext().GetLocalPlayer();
        local_10.TargetPlayerModel = this.GetTargetPlayerModel();
        local_10.TargetPlayerUid = this.GetPlayerUid();
        local_10.bIsSelf = (int(local_10.TargetPlayerUid) == ::FASCommonUtils::GetPlayerUidFromPlayerEntity(this.GetContext().GetLocalPlayer()));
        local_10.bIsFriend = ::FriendUtil::IsFriend(int(local_10.TargetPlayerUid));
        local_10.TargetTeamStatus = this.GetTargetTeamStatus();
        return __r;
    }
    FText GetTargetPlayerName() const
    {
        if (!(this.GetTargetPlayerModel().IsValid()))
        {
            return NSLOCTEXT("SocialViewPage", "SocialViewPage_UnknownPlayer", "жњЄзџҐ");
        }
        return FText::FromString(this.GetTargetPlayerModel().opArrow().GetNickName());
    }
    uint GetTargetPlayerUID() const
    {
        int local_5;
        if (this.GetTargetPlayerModel().IsValid())
        {
            local_5 = this.GetTargetPlayerModel().opArrow().GetPlayerUid();
        }
        else
        {
            local_5 = 0;
        }
        return local_5;
    }
    FText GetTargetPlayerUIDText() const
    {
        if (!(this.GetTargetPlayerModel().IsValid()))
        {
            return INVTEXT("0");
        }
        return FText::FromString(String::Conv_IntToString(this.GetTargetPlayerModel().opArrow().GetPlayerUid()));
    }
    FSoftBrush GetTargetPlayerIcon() const
    {
        FSoftBrush __return;
        if (!(!(this.GetTargetPlayerModel().IsValid())) && this.GetTargetPlayerModel().opArrow().GetCurrentAvatar())
        {
            TDataObjectPtr<FAvatarPrefabConfig> local_28 = this.GetTargetPlayerModel().opArrow().GetCurrentAvatar();
        }
        else
        {
            __return = FSoftBrush();
        }
        return __return;
    }
    int GetTargetPlayerLevel() const
    {
        int local_5;
        if (this.GetTargetPlayerModel().IsValid())
        {
            local_5 = this.GetTargetPlayerModel().opArrow().GetLevel();
        }
        else
        {
            local_5 = 0;
        }
        return local_5;
    }
    void OnTargetTeamStatusChange()
    {
        if (int(this.GetTargetTeamStatus()) == 0)
        {
            if (this.GetTargetPlayerModel().IsValid())
            {
                this.SetTargetTeamStatusQueryPollAccumulator(0.0f);
                ::FMS_PlayerSocialTeamData::Get(this.GetContext().Manager).GS_QueryTargetTeamStatusReq(this.GetTargetPlayerModel().opArrow().GetPlayerUid());
                return;
            }
            XWarning(ELog(46), FString().Append("[SocialView] Skip CMD428: TargetPlayerModel invalid. CachedUid=").Append(this.GetInteractTargetPlayerUid()).Append(" OpenType=").Append(int(this.GetOpenType())));
        }
        return;
    }
    void UpdateChatCommonAvatar()
    {
        if (this.GetTargetPlayerModel())
        {
            if (this.GetTargetPlayerModel().opArrow().GetCurrentAvatar())
            {
                this.SetChatCommonAvatar(TEUIModelRef<FVM_ChatCommonAvatar>(::FVM_ChatCommonAvatar::Create(this.GetManager(), this.GetTargetPlayerModel().opArrow().GetCurrentAvatar())));
            }
            else
            {
                this.SetChatCommonAvatar(TEUIModelRef<FVM_ChatCommonAvatar>());
            }
            return;
        }
        this.SetChatCommonAvatar(TEUIModelRef<FVM_ChatCommonAvatar>());
        return;
    }
    void Tick()
    {
        if (!(this.GetTargetPlayerModel().IsValid()))
        {
            return;
        }
        int local_4 = 1092616192;
        float32 local_9 = this.GetTargetTeamStatusQueryPollAccumulator() + float32(this.GetContext().DeltaTime.ToSeconds());
        this.SetTargetTeamStatusQueryPollAccumulator(local_9);
        if (this.GetTargetTeamStatusQueryPollAccumulator() >= 10.0f)
        {
            this.SetTargetTeamStatusQueryPollAccumulator(0.0f);
            ::FMS_PlayerSocialTeamData::Get(this.GetContext().Manager).GS_QueryTargetTeamStatusReq(this.GetTargetPlayerModel().opArrow().GetPlayerUid());
        }
        return;
    }
    void OnQueryTargetTeamStatusRsp(const FMsg_QueryTargetTeamStatusRsp &inout Msg)
    {
        int local_6;
        int local_7;
        if (this.GetTargetPlayerModel())
        {
            if (int(Msg.TargetPlayerUid) == this.GetTargetPlayerModel().opArrow().GetPlayerUid())
            {
                if (Msg.bHasTeam)
                {
                    local_7 = 1;
                    local_6 = local_7;
                }
                else
                {
                    local_7 = 2;
                    local_6 = local_7;
                }
                this.SetTargetTeamStatus(ESocialViewPageTargetTeamStatus(local_6));
            }
            this.RefreshButtons();
        }
        return;
    }
    void ShowMore()
    {
        this.SetbCurShowHideSmallButton(true);
        this.RefreshButtons();
        return;
    }
    void ShowLess()
    {
        this.SetbCurShowHideSmallButton(false);
        this.RefreshButtons();
        return;
    }
    void CopyUid()
    {
        FPlatformApplicationMisc::ClipboardCopy(String::Conv_Int64ToString(this.GetPlayerUid()));
        FCommonTipsParam local_16;
        ::CommonPopup::Tips(NSLOCTEXT("SocialViewPage", "CopyTargetUID", "е·Іе¤Ќе€¶зЋ©е®¶UIDе€°е‰Єиґґжќї"), local_16);
        return;
    }
    void OnFriendDataUpdated(const FMsg_FriendDataUpdated &inout Msg)
    {
        this.RefreshButtons();
        return;
    }
    uint GetPlayerUid() const
    {
        int local_2;
        if (this.GetInteractTargetPlayerUid() > 0)
        {
            return this.GetInteractTargetPlayerUid();
        }
        if (this.GetTargetPlayerModel().IsValid())
        {
            local_2 = this.GetTargetPlayerModel().opArrow().GetPlayerUid();
        }
        else
        {
            local_2 = 0;
        }
        return local_2;
    }
    void OnSelectSocialViewPageInteraction(const FCE_SelectSocialViewPageInteraction &inout Event)
    {
        if (Event.bInInteract)
        {
            this.SetInteractTarget(Event.InteractTarget);
            this.SetOpenType(Event.OpenType);
            this.SetTargetTeamStatus(ESocialViewPageTargetTeamStatus(0));
            this.SetTargetTeamStatusQueryPollAccumulator(0.0f);
            this.RefreshInteractPagePlayerInfo();
            this.RefreshPage();
            return;
        }
        if ((FECSEntity(this.GetInteractTarget()) == Event.InteractTarget))
        {
            this.SetInteractTarget(FECSEntity());
            this.SetOpenType(ESocialViewPageOpenType(0));
            this.SetTargetTeamStatus(ESocialViewPageTargetTeamStatus(0));
            this.SetTargetTeamStatusQueryPollAccumulator(0.0f);
            this.RefreshInteractPagePlayerInfo();
            this.RefreshPage();
        }
        return;
    }
    void RefreshPage()
    {
        TDataObjectIterator<FSocialViewPageData> local_16;
        for (; local_16; )
        {
            TDataObjectPtr<FSocialViewPageData> local_42 = local_16.GetDataPtr();
            if (int(local_42.opArrow().EnterPageType) == (int(this.GetOpenType())))
            {
                this.SetSocialViewPageData(local_42);
                this.RefreshButtons();
                break;
            }
            local_16.opPreInc();
        }
        return;
    }
    void RefreshButtons()
    {
        USocialViewPageOperator local_44;
        FEUIModelRef local_48;
        if (!(this.GetSocialViewPageData()))
        {
            return;
        }
        FSocialViewPageOperatorContext local_22 = this.BuildOperatorContext();
        this.GetModify_BigButtonTabs().Empty(0);
        for (auto& local_38 : this.GetSocialViewPageData().opArrow().GetBigButtons())
        {
            if (!(local_38))
            {
                continue;
            }
            local_44 = ::SocialViewPageOperatorUtils::GetOperator(local_38.opArrow().OperatorType);
            if (local_44 != nullptr && local_44.ShouldShow(local_22))
            {
                this.GetModify_BigButtonTabs().Add(local_48);
            }
        }
        this.GetModify_SmallButtonTabs().Empty(0);
        for (auto& local_38 : this.GetSocialViewPageData().opArrow().GetSmallButtons())
        {
            if (!(local_38))
            {
                continue;
            }
            local_44 = ::SocialViewPageOperatorUtils::GetOperator(local_38.opArrow().OperatorType);
            if (local_44 != nullptr && local_44.ShouldShow(local_22))
            {
                this.GetModify_SmallButtonTabs().Add(local_48);
            }
        }
        if (this.GetbCurShowHideSmallButton())
        {
            for (auto& local_38 : this.GetSocialViewPageData().opArrow().GetHiddenSmallButtons())
            {
                if (!(local_38))
                {
                    continue;
                }
                local_44 = ::SocialViewPageOperatorUtils::GetOperator(local_38.opArrow().OperatorType);
                if (local_44 != nullptr && local_44.ShouldShow(local_22))
                {
                    this.GetModify_SmallButtonTabs().Add(local_48);
                }
            }
        }
        return;
    }
    void RefreshInteractPagePlayerInfo()
    {
        FECSEntity local_4 = ::FASCommonUtils::GetUniquePlayerEntity(this.GetInteractTarget());
        if (local_4)
        {
            FPlayerBriefInfo local_28;
            ::PlayerBriefInfoBuild::ApplyFromDSPlayerEntity(local_28, local_4, ::FASCommonUtils::GetPlayerUidFromPlayerEntity(local_4));
            this.SetTargetPlayerModel(::FMS_PlayerData::Get(this.GetContext().Manager).GetOrCreatePlayerByEntity(local_4));
            this.SetTargetPlayerModel(::FMS_PlayerData::Get(this.GetContext().Manager).UpdateOrCreateByBriefInfo(local_28, EPlayerInfoTrust(2)));
            TEUIModelRef<FM_Player> local_32;
            local_32 = this.GetTargetPlayerModel();
            if (local_32.IsValid())
            {
                local_32 = this.GetTargetPlayerModel();
                this.SetInteractTargetPlayerUid(local_32.opArrow().GetPlayerUid());
            }
            else
            {
                this.SetInteractTargetPlayerUid(0);
            }
        }
        else
        {
            TEUIModelRef<FM_Player> local_32;
            if (!(this.TryRefreshTargetPlayerByCachedUid()))
            {
                XWarning(ELog(46), FString().Append("[SocialView] Clear namecard: entity resolve fail and cache miss. CachedUidWas=").Append(this.GetInteractTargetPlayerUid()));
                this.SetTargetPlayerModel(local_32);
                this.SetInteractTargetPlayerUid(0);
            }
        }
        return;
    }
    bool TryRefreshTargetPlayerByCachedUid()
    {
        int local_1 = this.GetInteractTargetPlayerUid();
        if (local_1 == 0)
        {
            return false;
        }
        this.SetTargetPlayerModel(::FMS_PlayerData::Get(this.GetContext().Manager).GetCachedPlayerData(this.GetInteractTargetPlayerUid()));
        return this.GetTargetPlayerModel().IsValid();
    }
    void PrepareFromWorldInteract(const FECSEntity &inout InInteractTarget, const ESocialViewPageOpenType InOpenType)
    {
        int local_11;
        this.SetInteractTarget(InInteractTarget);
        this.SetOpenType(ESocialViewPageOpenType(InOpenType));
        this.SetTargetTeamStatus(ESocialViewPageTargetTeamStatus(0));
        this.SetTargetTeamStatusQueryPollAccumulator(0.0f);
        this.RefreshInteractPagePlayerInfo();
        this.RefreshPage();
        bool local_7 = this.GetTargetPlayerModel().IsValid();
        if (local_7)
        {
            local_11 = this.GetTargetPlayerModel().opArrow().GetPlayerUid();
        }
        else
        {
            local_11 = this.GetInteractTargetPlayerUid();
        }
        FString local_28;
        if (local_7)
        {
            local_28 = this.GetTargetPlayerModel().opArrow().GetNickName();
        }
        else
        {
            local_28 = FString("INVALID");
        }
        if (!(local_7))
        {
            bool local_55;
            local_55 = false;
        }
        else
        {
            bool local_55;
            local_55 = this.GetTargetPlayerModel().opArrow().GetCurrentAvatar();
        }
        if (local_7 && (local_11 > 0))
        {
            bool local_55;
            XLog(ELog(46), FString().Append("[SocialView] Open prepare OK Uid=").Append(local_11).Append(" Nick=").Append(local_28).Append(" HasAvatar=").Append(local_55).Append(" OpenType=").Append(int(this.GetOpenType())));
        }
        else
        {
            XWarning(ELog(46), local_28.Append("[SocialView] Open prepare FAIL ModelValid=").Append(local_7).Append(" Uid=").Append(local_11).Append(" TargetValid=").Append(InInteractTarget.IsValid()).Append(" OpenType=").Append(int(this.GetOpenType())));
        }
        return;
    }
    const TArray<FEUIModelRef> GetBigButtonTabs() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_BigButtonTabs() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetBigButtonTabs(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_BigButtonTabs = __Value;
        return;
    }
    const TArray<FEUIModelRef> GetSmallButtonTabs() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_SmallButtonTabs() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetSmallButtonTabs(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SmallButtonTabs = __Value;
        return;
    }
    const FSoftBrush GetPlayerBackground() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FSoftBrush GetModify_PlayerBackground() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetPlayerBackground(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_PlayerBackground = __Value;
        return;
    }
    const TArray<FName> GetAllRowNames() const property
    {
        const TArray<FName> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<FName> GetModify_AllRowNames() property
    {
        TArray<FName> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetAllRowNames(const TArray<FName> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_AllRowNames = __Value;
        return;
    }
    TEUIModelRef<FM_Player> GetTargetPlayerModel() const property
    {
        this.TrackPropertyRead(4);
        return this.m_TargetPlayerModel;
    }
    void SetTargetPlayerModel(const TEUIModelRef<FM_Player> &inout __Value) property
    {
        TEUIModelRef<FM_Player> local_2;
        local_2 = this.m_TargetPlayerModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_TargetPlayerModel = __Value;
        return;
    }
    ESocialViewPageTargetTeamStatus GetTargetTeamStatus() const property
    {
        this.TrackPropertyRead(5);
        return this.m_TargetTeamStatus;
    }
    void SetTargetTeamStatus(const ESocialViewPageTargetTeamStatus __Value) property
    {
        if (int(this.m_TargetTeamStatus) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_TargetTeamStatus = __Value;
        return;
    }
    const float32 GetTargetTeamStatusQueryPollAccumulator() const property
    {
        const float32 __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    float32 GetModify_TargetTeamStatusQueryPollAccumulator() property
    {
        float32 __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetTargetTeamStatusQueryPollAccumulator(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_TargetTeamStatusQueryPollAccumulator = __Value;
        return;
    }
    const FECSEntity GetInteractTarget() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FECSEntity GetModify_InteractTarget() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetInteractTarget(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_InteractTarget = __Value;
        return;
    }
    TEUIModelRef<FVM_ChatCommonAvatar> GetChatCommonAvatar() const property
    {
        this.TrackPropertyRead(8);
        return this.m_ChatCommonAvatar;
    }
    void SetChatCommonAvatar(const TEUIModelRef<FVM_ChatCommonAvatar> &inout __Value) property
    {
        TEUIModelRef<FVM_ChatCommonAvatar> local_2;
        local_2 = this.m_ChatCommonAvatar;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_ChatCommonAvatar = __Value;
        return;
    }
    ESocialViewPageOpenType GetOpenType() const property
    {
        this.TrackPropertyRead(9);
        return this.m_OpenType;
    }
    void SetOpenType(const ESocialViewPageOpenType __Value) property
    {
        if (int(this.m_OpenType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_OpenType = __Value;
        return;
    }
    uint GetInteractTargetPlayerUid() const property
    {
        this.TrackPropertyRead(10);
        return this.m_InteractTargetPlayerUid;
    }
    void SetInteractTargetPlayerUid(const uint __Value) property
    {
        if (this.m_InteractTargetPlayerUid == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_InteractTargetPlayerUid = __Value;
        return;
    }
    const TDataObjectPtr<FSocialViewPageData> GetSocialViewPageData() const property
    {
        const TDataObjectPtr<FSocialViewPageData> __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    TDataObjectPtr<FSocialViewPageData> GetModify_SocialViewPageData() property
    {
        TDataObjectPtr<FSocialViewPageData> __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetSocialViewPageData(const TDataObjectPtr<FSocialViewPageData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_SocialViewPageData = __Value;
        return;
    }
    bool GetbCurShowHideSmallButton() const property
    {
        this.TrackPropertyRead(12);
        return this.m_bCurShowHideSmallButton;
    }
    void SetbCurShowHideSmallButton(const bool __Value) property
    {
        if (!(this.m_bCurShowHideSmallButton) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_bCurShowHideSmallButton = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_SocialViewPage
{
    UPROPERTY()
    int ShowMoreButtonSwitchIndex;
    UPROPERTY()
    FText TargetPlayerName;
    UPROPERTY()
    uint TargetPlayerUID;
    UPROPERTY()
    FText TargetPlayerUIDText;
    UPROPERTY()
    FSoftBrush TargetPlayerIcon;
    UPROPERTY()
    int TargetPlayerLevel;
    UPROPERTY()
    TEUIModelRef<FVMS_SocialViewPage> Self;


}

namespace FVM_SocialViewPage
{
ESocialViewPageOpenType ResolveOpenTypeFromCurrentLevel()
{
    TDataObjectPtr<FLevelInfoConfig> local_24 = FLevelUtils::GetCurrentLevelInfoConfig(nullptr);
    if (local_24)
    {
        if (int(local_24.opArrow().LevelType) == 2)
        {
            return ESocialViewPageOpenType(2);
        }
        if (int(local_24.opArrow().LevelType) == 1)
        {
            return ESocialViewPageOpenType(1);
        }
        if (int(local_24.opArrow().LevelType) == 3 || (int(local_24.opArrow().LevelType) == 5))
        {
            return ESocialViewPageOpenType(3);
        }
    }
    return ESocialViewPageOpenType(2);
}
void PrepareFromWorldInteract(const UObject ContextObject, const FECSEntity &inout InInteractTarget)
{
    int local_5 = int(FVM_SocialViewPage::ResolveOpenTypeFromCurrentLevel());
    TEUIModelRef<FVMS_SocialViewPage>(FVMS_SocialViewPage::Get(ContextObject)).opArrow().PrepareFromWorldInteract(InInteractTarget);
    return;
}
void GotoPage(const ULocalPlayer InLocalPlayer, const TEUIModelRef<FM_Player> &inout InTargetPlayerModel, const ESocialViewPageOpenType InOpenType = ESocialViewPageOpenType::Default, const uint InInteractTargetPlayerUid = 0)
{
    FVM_SocialViewPage::SetupPage(InLocalPlayer, InTargetPlayerModel, ESocialViewPageOpenType(InOpenType), InInteractTargetPlayerUid);
    FGameplayTag local_2 = FGameplayTag(GameplayTags::UI_Type_SocialViewPage);
    if (!(FEUIWidget::FindWidget(InLocalPlayer, local_2)))
    {
        FEUIWidget::AddWidget(InLocalPlayer, local_2);
    }
    return;
}
void GotoPage(const ULocalPlayer InLocalPlayer)
{
    FGameplayTag local_2 = FGameplayTag(GameplayTags::UI_Type_SocialViewPage);
    if (!(FEUIWidget::FindWidget(InLocalPlayer, local_2)))
    {
        FEUIWidget::AddWidget(InLocalPlayer, local_2);
    }
    return;
}
void ClosePage(const ULocalPlayer InLocalPlayer)
{
    FEUIWidgetRef local_4 = FEUIWidget::FindWidget(InLocalPlayer, FGameplayTag(GameplayTags::UI_Type_SocialViewPage));
    if (local_4)
    {
        FEUIWidget::RemoveWidget(local_4);
    }
    return;
}
void SetupPage(const UObject ContextObject, const TEUIModelRef<FM_Player> &inout InTargetPlayerModel, const ESocialViewPageOpenType InOpenType = ESocialViewPageOpenType::Default, const uint InInteractTargetPlayerUid = 0)
{
    TEUIModelRef<FVMS_SocialViewPage> local_2 = TEUIModelRef<FVMS_SocialViewPage>(FVMS_SocialViewPage::Get(ContextObject));
    local_2.opArrow().SetTargetPlayerModel(InTargetPlayerModel);
    local_2.opArrow().SetOpenType();
    local_2.opArrow().SetInteractTargetPlayerUid(InInteractTargetPlayerUid);
    local_2.opArrow().SetTargetTeamStatus(ESocialViewPageTargetTeamStatus(0));
    float32 local_6 = 0.0f;
    local_2.opArrow().SetTargetTeamStatusQueryPollAccumulator(local_6);
    local_2.opArrow().RefreshPage();
    return;
}
}
namespace FVMS_SocialViewPage
{
FVMS_SocialViewPage& Get(const UObject ContextObject)
{
    return FVMS_SocialViewPage::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_SocialViewPage GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_SocialViewPage __r;
    TEUIModelRef<FVMS_SocialViewPage> local_6 = TEUIModelRef<FVMS_SocialViewPage>(EUIInternal::MakeModelWithManager(Manager, FVMS_SocialViewPage::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "BigButtonTabs";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SmallButtonTabs";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerBackground";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ChatCommonAvatar";
    local_14.TypeName = "TEUIModelRef<FVM_ChatCommonAvatar>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowMoreButtonSwitchIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TargetPlayerName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TargetPlayerUID";
    local_14.TypeName = "uint32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TargetPlayerUIDText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TargetPlayerIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TargetPlayerLevel";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_SocialViewPage>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_SocialViewPage;
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__OnTargetTeamStatusChange";
    local_24.DirtyFlags.Set(FVMS_SocialViewPage::__IndexOf_TargetPlayerModel());
    Result.DirtyFunctions.Add(local_24);
    FEUIModelEffectDefine local_28;
    local_28.FunctionName = "UpdateChatCommonAvatar";
    Result.EffectFunctions.Add(local_28);
    Result.TickFunction.FunctionName = "__Tick";
    FEUIModelMsgHandleDefine local_38;
    local_38.FunctionName = "__OnQueryTargetTeamStatusRsp";
    local_38.MessageTypeName = "Msg_QueryTargetTeamStatusRsp";
    local_38.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_38);
    local_38.FunctionName = "__OnFriendDataUpdated";
    local_38.MessageTypeName = "Msg_FriendDataUpdated";
    local_38.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_38);
    FEUIModelEventDefine local_48;
    local_48.FunctionName = "__OnSelectSocialViewPageInteraction";
    local_48.EventType = FCE_SelectSocialViewPageInteraction;
    Result.EventFunctions.Add(local_48);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_SocialViewPage;
}
void __OnTargetTeamStatusChange(FVMS_SocialViewPage &inout Model)
{
    Model.OnTargetTeamStatusChange();
    return;
}
void __Tick(FVMS_SocialViewPage &inout Model)
{
    Model.Tick();
    return;
}
void __OnQueryTargetTeamStatusRsp(FVMS_SocialViewPage &inout Model, const FMsg_QueryTargetTeamStatusRsp &inout Message)
{
    Model.OnQueryTargetTeamStatusRsp(Message);
    return;
}
void __OnFriendDataUpdated(FVMS_SocialViewPage &inout Model, const FMsg_FriendDataUpdated &inout Message)
{
    Model.OnFriendDataUpdated(Message);
    return;
}
void __OnSelectSocialViewPageInteraction(FVMS_SocialViewPage &inout Model, const FCE_SelectSocialViewPageInteraction &inout Event)
{
    Model.OnSelectSocialViewPageInteraction(Event);
    return;
}
TArray<FEUIModelRef> __UIGetter_BigButtonTabs(const FVMS_SocialViewPage &inout Model)
{
    return Model.GetBigButtonTabs();
}
TArray<FEUIModelRef> __UIGetter_SmallButtonTabs(const FVMS_SocialViewPage &inout Model)
{
    return Model.GetSmallButtonTabs();
}
FSoftBrush __UIGetter_PlayerBackground(const FVMS_SocialViewPage &inout Model)
{
    return Model.GetPlayerBackground();
}
TEUIModelRef<FVM_ChatCommonAvatar> __UIGetter_ChatCommonAvatar(const FVMS_SocialViewPage &inout Model)
{
    return Model.GetChatCommonAvatar();
}
int __UIGetter_ShowMoreButtonSwitchIndex(const FVMS_SocialViewPage &inout Model)
{
    return Model.GetShowMoreButtonSwitchIndex();
}
FText __UIGetter_TargetPlayerName(const FVMS_SocialViewPage &inout Model)
{
    return Model.GetTargetPlayerName();
}
uint __UIGetter_TargetPlayerUID(const FVMS_SocialViewPage &inout Model)
{
    return Model.GetTargetPlayerUID();
}
FText __UIGetter_TargetPlayerUIDText(const FVMS_SocialViewPage &inout Model)
{
    return Model.GetTargetPlayerUIDText();
}
FSoftBrush __UIGetter_TargetPlayerIcon(const FVMS_SocialViewPage &inout Model)
{
    return Model.GetTargetPlayerIcon();
}
int __UIGetter_TargetPlayerLevel(const FVMS_SocialViewPage &inout Model)
{
    return Model.GetTargetPlayerLevel();
}
TEUIModelRef<FVMS_SocialViewPage> __UIGetter_Self(const FVMS_SocialViewPage &inout Model)
{
    return TEUIModelRef<FVMS_SocialViewPage>(Model);
}
int __IndexOf_BigButtonTabs()
{
    return 0;
}
int __IndexOf_SmallButtonTabs()
{
    return 1;
}
int __IndexOf_PlayerBackground()
{
    return 2;
}
int __IndexOf_AllRowNames()
{
    return 3;
}
int __IndexOf_TargetPlayerModel()
{
    return 4;
}
int __IndexOf_TargetTeamStatus()
{
    return 5;
}
int __IndexOf_TargetTeamStatusQueryPollAccumulator()
{
    return 6;
}
int __IndexOf_InteractTarget()
{
    return 7;
}
int __IndexOf_ChatCommonAvatar()
{
    return 8;
}
int __IndexOf_OpenType()
{
    return 9;
}
int __IndexOf_InteractTargetPlayerUid()
{
    return 10;
}
int __IndexOf_SocialViewPageData()
{
    return 11;
}
int __IndexOf_bCurShowHideSmallButton()
{
    return 12;
}
}
namespace __GeneratedProperties_FVMS_SocialViewPage
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

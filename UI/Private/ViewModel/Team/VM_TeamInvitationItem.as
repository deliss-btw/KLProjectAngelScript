
namespace FVM_TeamInvitationItem
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnButtonClick = FEUIModelCallbackSignature();

}
struct FTeamInvitationItemData
{
    UPROPERTY()
    TEUIModelRef<FVM_PlayerInfo> PlayerInfo;
    UPROPERTY()
    ETeamInvitationType InvitationType;
    UPROPERTY()
    FPlayerBriefInfo PlayerBrief;
    UPROPERTY()
    float32 CurDistance = 0.0f;


}

struct FVM_TeamInvitationItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerInfo> m_PlayerInfo;
    UPROPERTY()
    ETeamInvitationType m_InvitationType;
    UPROPERTY()
    FPlayerBriefInfo m_PlayerBrief;
    UPROPERTY()
    float32 m_CurDistance;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerBasicItem> m_BasicItem;

    FVM_TeamInvitationItem()
    {
        this.m_InvitationType = ETeamInvitationType(0);
        this.m_CurDistance = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TeamInvitationItem' by default constructor.");
        return;
    }
    FVM_TeamInvitationItem(const FVM_TeamInvitationItem &inout Other)
    {
        this.m_InvitationType = ETeamInvitationType(0);
        this.m_CurDistance = 0.0f;
        this.m_PlayerInfo = Other.m_PlayerInfo;
        this.m_InvitationType = Other.m_InvitationType;
        this.m_PlayerBrief = Other.m_PlayerBrief;
        this.m_CurDistance = Other.m_CurDistance;
        this.m_BasicItem = Other.m_BasicItem;
        return;
    }
    FVM_TeamInvitationItem(const TEUIModelRef<FVM_PlayerInfo> &inout InPlayerInfo, const ETeamInvitationType InInvitationType, const FPlayerBriefInfo &inout InPlayerBrief, const float32 InCurDistance)
    {
        this.m_InvitationType = ETeamInvitationType(0);
        this.m_CurDistance = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetPlayerInfo(InPlayerInfo);
        this.SetInvitationType(ETeamInvitationType(InInvitationType));
        this.SetPlayerBrief(InPlayerBrief);
        this.SetCurDistance(InCurDistance);
        return;
    }
    FVM_TeamInvitationItem& opAssign(const FVM_TeamInvitationItem &inout Other)
    {
        this.m_PlayerInfo = Other.m_PlayerInfo;
        this.m_InvitationType = Other.m_InvitationType;
        this.m_PlayerBrief = Other.m_PlayerBrief;
        this.m_CurDistance = Other.m_CurDistance;
        return Other.m_BasicItem;
    }
    void PostConstruct()
    {
        this.SetBasicItem(TEUIModelRef<FVM_PlayerBasicItem>(::FVM_PlayerBasicItem::Create(this.GetManager(), this.GetPlayerBrief())));
        return;
    }
    void OnButtonClick()
    {
        TEUIModelRef<FVM_PlayerInfo> local_2 = this.GetPlayerInfo();
        TEUIModelRef<FM_Player> local_4;
        local_4.GetPlayer();
        ::FSocialTeamUtils::ClientSendTeamUp(this.GetContext().GetLocalPlayer(), GetPlayerUid());
        FCommonTipsParam local_18;
        ::CommonPopup::Tips(NSLOCTEXT("TeamInvitationItem", "SendTeamUpRequest", "й‚ЂиЇ·иЇ·ж±‚е·ІеЏ‘йЂЃ"), local_18);
        return;
    }
    FText GetPlayerName() const
    {
        TEUIModelRef<FVM_PlayerInfo> local_2 = this.GetPlayerInfo();
        FText local_6;
        local_6.GetPlayerName();
        return local_6;
    }
    bool bIsShowFriendIcon() const
    {
        if ((int(this.GetInvitationType())) == 1)
        {
            TEUIModelRef<FVM_PlayerInfo> local_6 = this.GetPlayerInfo();
            TEUIModelRef<FM_Player> local_8;
            local_8.GetPlayer();
            return ::FriendUtil::IsFriend(GetPlayerUid());
        }
        return false;
    }
    bool bIsNearbyPlayerList() const
    {
        return (int(this.GetInvitationType()) == 1);
    }
    FText GetCurDistanceText() const
    {
        FNumberFormattingOptions local_6 = FNumberFormattingOptions();
        FText local_14;
        FText::AsNumber(local_14, (this.GetCurDistance() / 100.0f));
        return FText::Format(NSLOCTEXT("TeamInvitationItem", "CurDistanceText", "и·ќз¦»пјљ{0}з±і"), local_14);
    }
    TEUIModelRef<FVM_PlayerInfo> GetPlayerInfo() const property
    {
        this.TrackPropertyRead(0);
        return this.m_PlayerInfo;
    }
    void SetPlayerInfo(const TEUIModelRef<FVM_PlayerInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_PlayerInfo> local_2;
        local_2 = this.m_PlayerInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PlayerInfo = __Value;
        return;
    }
    ETeamInvitationType GetInvitationType() const property
    {
        this.TrackPropertyRead(1);
        return this.m_InvitationType;
    }
    void SetInvitationType(const ETeamInvitationType __Value) property
    {
        if (int(this.m_InvitationType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_InvitationType = __Value;
        return;
    }
    const FPlayerBriefInfo GetPlayerBrief() const property
    {
        const FPlayerBriefInfo __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FPlayerBriefInfo GetModify_PlayerBrief() property
    {
        FPlayerBriefInfo __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetPlayerBrief(const FPlayerBriefInfo &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_PlayerBrief = __Value;
        return;
    }
    const float32 GetCurDistance() const property
    {
        const float32 __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    float32 GetModify_CurDistance() property
    {
        float32 __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetCurDistance(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CurDistance = __Value;
        return;
    }
    TEUIModelRef<FVM_PlayerBasicItem> GetBasicItem() const property
    {
        this.TrackPropertyRead(4);
        return this.m_BasicItem;
    }
    void SetBasicItem(const TEUIModelRef<FVM_PlayerBasicItem> &inout __Value) property
    {
        TEUIModelRef<FVM_PlayerBasicItem> local_2;
        local_2 = this.m_BasicItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_BasicItem = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TeamInvitationItem
{
    UPROPERTY()
    FText PlayerName;
    UPROPERTY()
    bool bIsShowFriendIcon;
    UPROPERTY()
    bool bIsNearbyPlayerList;
    UPROPERTY()
    FText CurDistanceText;
    UPROPERTY()
    TEUIModelRef<FVM_TeamInvitationItem> Self;


}

namespace FVM_TeamInvitationItem
{
FVM_TeamInvitationItem Create(const UObject ContextObject, const TEUIModelRef<FVM_PlayerInfo> &inout PlayerInfo, const ETeamInvitationType InvitationType, const FPlayerBriefInfo &inout PlayerBrief, const float32 CurDistance)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    FVM_TeamInvitationItem __r; return __r;
}
FVM_TeamInvitationItem CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FVM_PlayerInfo> &inout PlayerInfo, const ETeamInvitationType InvitationType, const FPlayerBriefInfo &inout PlayerBrief, const float32 CurDistance)
{
    FVM_TeamInvitationItem __r;
    TEUIModelRef<FVM_TeamInvitationItem> local_6 = TEUIModelRef<FVM_TeamInvitationItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TeamInvitationItem::ModelId, 0, PlayerInfo, InvitationType, PlayerBrief, CurDistance));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "PlayerInfo";
    local_14.TypeName = "TEUIModelRef<FVM_PlayerInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BasicItem";
    local_14.TypeName = "TEUIModelRef<FVM_PlayerBasicItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsShowFriendIcon";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsNearbyPlayerList";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurDistanceText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TeamInvitationItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TeamInvitationItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TeamInvitationItem;
}
TEUIModelRef<FVM_PlayerInfo> __UIGetter_PlayerInfo(const FVM_TeamInvitationItem &inout Model)
{
    return Model.GetPlayerInfo();
}
TEUIModelRef<FVM_PlayerBasicItem> __UIGetter_BasicItem(const FVM_TeamInvitationItem &inout Model)
{
    return Model.GetBasicItem();
}
FText __UIGetter_PlayerName(const FVM_TeamInvitationItem &inout Model)
{
    return Model.GetPlayerName();
}
bool __UIGetter_bIsShowFriendIcon(const FVM_TeamInvitationItem &inout Model)
{
    return Model.bIsShowFriendIcon();
}
bool __UIGetter_bIsNearbyPlayerList(const FVM_TeamInvitationItem &inout Model)
{
    return Model.bIsNearbyPlayerList();
}
FText __UIGetter_CurDistanceText(const FVM_TeamInvitationItem &inout Model)
{
    return Model.GetCurDistanceText();
}
TEUIModelRef<FVM_TeamInvitationItem> __UIGetter_Self(const FVM_TeamInvitationItem &inout Model)
{
    return TEUIModelRef<FVM_TeamInvitationItem>(Model);
}
int __IndexOf_PlayerInfo()
{
    return 0;
}
int __IndexOf_InvitationType()
{
    return 1;
}
int __IndexOf_PlayerBrief()
{
    return 2;
}
int __IndexOf_CurDistance()
{
    return 3;
}
int __IndexOf_BasicItem()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_TeamInvitationItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

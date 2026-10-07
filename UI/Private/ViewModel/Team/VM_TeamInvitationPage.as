
enum ETeamInvitationType
{
    InvitationFriend,
    InvitationNearbyPlayer,
}

namespace FVM_TeamInvitationPage
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature SetMenuIndex = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature NextMenu = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature PrevMenu = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature UpdateFriendPlayer = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature FindNearbyPlayer = FEUIModelCallbackSignature();

}
struct FVM_TeamInvitationPage : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_CurrentMenuIndex;
    UPROPERTY()
    TArray<FEUIModelContainer> m_BarTextImageEntries;
    UPROPERTY()
    TArray<FEUIModelContainer> m_FriendPlayerInfoList;
    UPROPERTY()
    TArray<FEUIModelContainer> m_NearbyPlayerInfoList;

    FVM_TeamInvitationPage()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_TeamInvitationPage(const FVM_TeamInvitationPage &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_TeamInvitationPage& opAssign(const FVM_TeamInvitationPage &inout Other)
    {
        this.m_CurrentMenuIndex = int(Other.m_CurrentMenuIndex);
        this.m_BarTextImageEntries = Other.m_BarTextImageEntries;
        this.m_FriendPlayerInfoList = Other.m_FriendPlayerInfoList;
        return Other.m_NearbyPlayerInfoList;
    }
    void PostConstruct()
    {
        const UTeamSettings local_2;
        GetGameplaySettings<UTeamSettings> local_4;
        local_2 = local_4;
        if (local_2.InvitationIconConfigs.Contains(ETeamInvitationType(0)))
        {
            FEUIModelRef local_24;
            FEUIModelContainer local_22;
            local_22.AddModel(local_24, false);
            FVM_CommonTabItem& local_26 = ::FVM_CommonTabItem::Create(this.GetContext().Manager);
            local_26.SetTitleText(NSLOCTEXT("TeamInvitationPage", "InvitationFriend", "еҐЅеЏ‹"));
            local_24 = FEUIModelRef(local_26);
            local_22.AddModel(local_24, false);
            this.GetModify_BarTextImageEntries().Add(FEUIModelContainer());
        }
        if (local_2.InvitationIconConfigs.Contains(ETeamInvitationType(1)))
        {
            FEUIModelRef local_24;
            FEUIModelContainer local_22;
            local_22.AddModel(local_24, false);
            FVM_CommonTabItem& local_26_2 = ::FVM_CommonTabItem::Create(this.GetContext().Manager);
            local_26_2.SetTitleText(NSLOCTEXT("TeamInvitationPage", "InvitationNearbyPlayer", "й™„иї‘зЋ©е®¶"));
            local_22.AddModel(FEUIModelRef(local_26_2), false);
            this.GetModify_BarTextImageEntries().Add(local_22);
        }
        if (local_2.InvitationIconConfigs.Num() > 0)
        {
            this.SetCurrentMenuIndex(0);
        }
        this.OnSelectChange();
        return;
    }
    FEUIModelContainer GetSelectedBarItem() const
    {
        if (this.GetBarTextImageEntries().IsValidIndex(this.GetCurrentMenuIndex()))
        {
            return this.GetBarTextImageEntries()[this.GetCurrentMenuIndex()];
        }
        return FEUIModelContainer();
    }
    void SetMenuIndex(const int Index)
    {
        if (this.GetCurrentMenuIndex() != Index)
        {
            this.SetCurrentMenuIndex(Index);
            this.OnSelectChange();
        }
        return;
    }
    void NextMenu()
    {
        this.SetCurrentMenuIndex((this.GetCurrentMenuIndex() + 1));
        if (this.GetCurrentMenuIndex() >= this.GetBarTextImageEntries().Num())
        {
            this.SetCurrentMenuIndex(0);
        }
        this.OnSelectChange();
        return;
    }
    void PrevMenu()
    {
        this.SetCurrentMenuIndex((this.GetCurrentMenuIndex() - 1));
        if (this.GetCurrentMenuIndex() < 0)
        {
            this.SetCurrentMenuIndex((this.GetBarTextImageEntries().Num() - 1));
        }
        this.OnSelectChange();
        return;
    }
    void OnSelectChange()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void UpdateFriendPlayer()
    {
        int local_14;
        this.GetModify_FriendPlayerInfoList().Empty(0);
        TArray<uint> local_10 = ::FriendUtil::GetAllOnlineFriend();
        int local_11 = 0;
        for (; local_11 < local_10.Num(); ++local_11)
        {
            local_14 = local_10[local_11];
            if (::FMS_LocalPlayerTeamData::Get(this.GetContext().Manager).IsTeamMember(local_14, ETeamType(1)))
            {
                continue;
            }
            TEUIModelRef<FM_Player> local_20 = ::FMS_PlayerData::Get(this.GetContext().Manager).GetCachedPlayerData(local_14);
            if (!(local_20.IsValid()))
            {
                continue;
            }
            FTeamInvitationItemData local_44;
            local_44.PlayerInfo = TEUIModelRef<FVM_PlayerInfo>(::FVM_PlayerInfo::Create(this.GetContext().Manager, local_20));
            local_44.InvitationType = ETeamInvitationType(0);
            FPlayerBriefInfo local_66;
            if (::FriendUtil::TryGetFriendBrief(local_14, local_66))
            {
                local_44.PlayerBrief = local_66;
            }
            FEUIModelContainer::MakeCached local_80;
            this.GetModify_FriendPlayerInfoList().Add(local_80.opImplConv());
        }
        return;
    }
    void FindNearbyPlayer()
    {
        ::FSocialTeamUtils::ClinetToServerGetNearbyNoTeamPlayerList(this.GetContext().GetLocalPlayer());
        return;
    }
    void ClientHandleNearbyPlayerList(const FCE_S2CNearbyrPlayerListRsp &inout Event)
    {
        int local_10;
        float32 local_53;
        this.GetModify_NearbyPlayerInfoList().Empty(0);
        TArray<FPlayerBriefInfo> local_6 = Event.NearbyPlayerList;
        int local_7 = 0;
        for (; local_7 < local_6.Num(); ++local_7)
        {
            local_10 = local_6[local_7].GetUid();
            if (local_10 == ::FASCommonUtils::GetPlayerUidFromPlayerEntity(this.GetContext().GetLocalPlayer()))
            {
                continue;
            }
            if (::FMS_LocalPlayerTeamData::Get(this.GetContext().Manager).IsTeamMember(local_10, ETeamType(1)))
            {
                continue;
            }
            TEUIModelRef<FM_Player> local_24 = ::FMS_PlayerData::Get(this.GetContext().Manager).UpdateOrCreateByBriefInfo(local_6[local_7], EPlayerInfoTrust(2));
            if (!(local_24.IsValid()))
            {
                continue;
            }
            FTeamInvitationItemData local_48;
            local_48.PlayerInfo = TEUIModelRef<FVM_PlayerInfo>(::FVM_PlayerInfo::Create(this.GetContext().Manager, local_24));
            local_48.InvitationType = ETeamInvitationType(1);
            local_48.PlayerBrief = local_6[local_7];
            if (Event.PlayerDistanceMap.Contains(local_10))
            {
                local_53 = Event.PlayerDistanceMap[local_10];
            }
            else
            {
                local_53 = 0.0f;
            }
            if (local_53 > 0.0f)
            {
                local_48.CurDistance = local_53;
            }
            FEUIModelContainer::MakeCached local_68;
            this.GetModify_NearbyPlayerInfoList().Add(local_68.opImplConv());
        }
        return;
    }
    void OnPlayerInfoModelChange(const FMsg_FriendDataUpdated &inout Msg)
    {
        this.UpdateFriendPlayer();
        return;
    }
    void HandleSocialTeamMemberChanged(const FMsg_SocialTeamMemberChanged &inout Msg)
    {
        this.FilterTeamMembersFromList(this.GetModify_FriendPlayerInfoList());
        this.FilterTeamMembersFromList(this.GetModify_NearbyPlayerInfoList());
        return;
    }
    void HandleSocialTeamChanged(const FMsg_SocialTeamChanged &inout Msg)
    {
        this.FilterTeamMembersFromList(this.GetModify_FriendPlayerInfoList());
        this.FilterTeamMembersFromList(this.GetModify_NearbyPlayerInfoList());
        return;
    }
    void FilterTeamMembersFromList(TArray<FEUIModelContainer> &inout List)
    {
        int local_16 = 0;
        int local_4 = List.Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            if (FInstancedStruct::GetPtr(List[local_4].GetFactoryStruct()).opCall())
            {
                if (::FMS_LocalPlayerTeamData::Get(this.GetContext().Manager).IsTeamMember(local_16, ETeamType(1)))
                {
                    List.RemoveAtSwap(local_4);
                }
            }
        }
        return;
    }
    TArray<FEUIModelContainer> GetPlayerInfoList() const
    {
        if (this.GetCurrentMenuIndex() == 0)
        {
            return this.GetFriendPlayerInfoList();
        }
        if (this.GetCurrentMenuIndex() == 1)
        {
            return this.GetNearbyPlayerInfoList();
        }
        return TArray<FEUIModelContainer>();
    }
    int GetCurrentMenuIndex() const property
    {
        this.TrackPropertyRead(0);
        return this.m_CurrentMenuIndex;
    }
    void SetCurrentMenuIndex(const int __Value) property
    {
        if (this.m_CurrentMenuIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CurrentMenuIndex = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetBarTextImageEntries() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_BarTextImageEntries() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetBarTextImageEntries(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_BarTextImageEntries = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetFriendPlayerInfoList() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_FriendPlayerInfoList() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetFriendPlayerInfoList(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_FriendPlayerInfoList = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetNearbyPlayerInfoList() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_NearbyPlayerInfoList() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetNearbyPlayerInfoList(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_NearbyPlayerInfoList = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TeamInvitationPage
{
    UPROPERTY()
    FEUIModelContainer SelectedBarItem;
    UPROPERTY()
    TArray<FEUIModelContainer> PlayerInfoList;
    UPROPERTY()
    TEUIModelRef<FVM_TeamInvitationPage> Self;

    __GeneratedProperties_FVM_TeamInvitationPage()
    {
        return;
    }
}

namespace FVM_TeamInvitationPage
{
FVM_TeamInvitationPage& Create(const UObject ContextObject)
{
    return FVM_TeamInvitationPage::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_TeamInvitationPage CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_TeamInvitationPage __r;
    TEUIModelRef<FVM_TeamInvitationPage> local_6 = TEUIModelRef<FVM_TeamInvitationPage>(EUIInternal::MakeModelWithManager(Manager, FVM_TeamInvitationPage::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "BarTextImageEntries";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedBarItem";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerInfoList";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TeamInvitationPage>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TeamInvitationPage;
    FEUIModelEventDefine local_22;
    local_22.FunctionName = "__ClientHandleNearbyPlayerList";
    local_22.EventType = FCE_S2CNearbyrPlayerListRsp;
    Result.EventFunctions.Add(local_22);
    FEUIModelMsgHandleDefine local_32;
    local_32.FunctionName = "__OnPlayerInfoModelChange";
    local_32.MessageTypeName = "Msg_FriendDataUpdated";
    local_32.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_32);
    local_32.FunctionName = "__HandleSocialTeamMemberChanged";
    local_32.MessageTypeName = "Msg_SocialTeamMemberChanged";
    local_32.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_32);
    local_32.FunctionName = "__HandleSocialTeamChanged";
    local_32.MessageTypeName = "Msg_SocialTeamChanged";
    local_32.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_32);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TeamInvitationPage;
}
void __ClientHandleNearbyPlayerList(FVM_TeamInvitationPage &inout Model, const FCE_S2CNearbyrPlayerListRsp &inout Event)
{
    Model.ClientHandleNearbyPlayerList(Event);
    return;
}
void __OnPlayerInfoModelChange(FVM_TeamInvitationPage &inout Model, const FMsg_FriendDataUpdated &inout Message)
{
    Model.OnPlayerInfoModelChange(Message);
    return;
}
void __HandleSocialTeamMemberChanged(FVM_TeamInvitationPage &inout Model, const FMsg_SocialTeamMemberChanged &inout Message)
{
    Model.HandleSocialTeamMemberChanged(Message);
    return;
}
void __HandleSocialTeamChanged(FVM_TeamInvitationPage &inout Model, const FMsg_SocialTeamChanged &inout Message)
{
    Model.HandleSocialTeamChanged(Message);
    return;
}
TArray<FEUIModelContainer> __UIGetter_BarTextImageEntries(const FVM_TeamInvitationPage &inout Model)
{
    return Model.GetBarTextImageEntries();
}
FEUIModelContainer __UIGetter_SelectedBarItem(const FVM_TeamInvitationPage &inout Model)
{
    return Model.GetSelectedBarItem();
}
TArray<FEUIModelContainer> __UIGetter_PlayerInfoList(const FVM_TeamInvitationPage &inout Model)
{
    return Model.GetPlayerInfoList();
}
TEUIModelRef<FVM_TeamInvitationPage> __UIGetter_Self(const FVM_TeamInvitationPage &inout Model)
{
    return TEUIModelRef<FVM_TeamInvitationPage>(Model);
}
int __IndexOf_CurrentMenuIndex()
{
    return 0;
}
int __IndexOf_BarTextImageEntries()
{
    return 1;
}
int __IndexOf_FriendPlayerInfoList()
{
    return 2;
}
int __IndexOf_NearbyPlayerInfoList()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_TeamInvitationPage
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

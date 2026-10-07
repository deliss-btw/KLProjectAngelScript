
namespace FVM_CommonAvatarTeamEnterItem
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnClickAdd = FEUIModelCallbackSignature();
}
namespace FVM_CommonAvatarTeamEnter
{
    const int ModelId = 0;

}
struct FVM_CommonAvatarTeamEnterItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_SlotIndex;
    UPROPERTY()
    bool m_bIsAddSlot;
    UPROPERTY()
    TEUIModelRef<FM_Player> m_Player;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerBasicItem> m_PlayerBasicItem;

    FVM_CommonAvatarTeamEnterItem()
    {
        this.m_SlotIndex = 0;
        this.m_bIsAddSlot = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommonAvatarTeamEnterItem' by default constructor.");
        return;
    }
    FVM_CommonAvatarTeamEnterItem(const FVM_CommonAvatarTeamEnterItem &inout Other)
    {
        this.m_SlotIndex = 0;
        this.m_bIsAddSlot = false;
        this.m_SlotIndex = int(Other.m_SlotIndex);
        this.m_bIsAddSlot = Other.m_bIsAddSlot;
        this.m_Player = Other.m_Player;
        this.m_PlayerBasicItem = Other.m_PlayerBasicItem;
        return;
    }
    FVM_CommonAvatarTeamEnterItem(const int InSlotIndex, const bool InbIsAddSlot, const TEUIModelRef<FM_Player> &inout InPlayer)
    {
        this.m_SlotIndex = 0;
        this.m_bIsAddSlot = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSlotIndex(InSlotIndex);
        this.SetbIsAddSlot(InbIsAddSlot);
        this.SetPlayer(InPlayer);
        return;
    }
    FVM_CommonAvatarTeamEnterItem& opAssign(const FVM_CommonAvatarTeamEnterItem &inout Other)
    {
        this.m_SlotIndex = int(Other.m_SlotIndex);
        this.m_bIsAddSlot = Other.m_bIsAddSlot;
        this.m_Player = Other.m_Player;
        return Other.m_PlayerBasicItem;
    }
    int GetSlotSwitcherIndex() const
    {
        return this.GetbIsAddSlot() ? 1 : 0;
    }
    void PostConstruct()
    {
        this.RefreshPlayerBasicItem();
        return;
    }
    void RefreshPlayerBasicItem()
    {
        if (this.GetbIsAddSlot() || !(this.GetPlayer().IsValid()))
        {
            this.SetPlayerBasicItem(TEUIModelRef<FVM_PlayerBasicItem>());
            return;
        }
        TEUIModelRef<FM_Player> local_2 = this.GetPlayer();
        this.SetPlayerBasicItem(TEUIModelRef<FVM_PlayerBasicItem>(::FVM_PlayerBasicItem::Create(this.GetContext().Manager, ::FMS_PlayerBriefInfo::Get(this.GetContext().Manager).CacheFromPlayer())));
        return;
    }
    void OnPlayerNickNameChanged()
    {
        this.RefreshPlayerBasicItem();
        return;
    }
    void OnPlayerAvatarChanged()
    {
        this.RefreshPlayerBasicItem();
        return;
    }
    void OnPlayerLevelChanged()
    {
        this.RefreshPlayerBasicItem();
        return;
    }
    void OnPlayerDivineSkillChanged()
    {
        this.RefreshPlayerBasicItem();
        return;
    }
    void OnLocalPlayerLevelRefresh(const FMsg_LocalPlayerLevelRefresh &inout Msg)
    {
        if (this.GetPlayer().IsValid() && this.GetPlayer().opArrow().IsLocalPlayer())
        {
            this.RefreshPlayerBasicItem();
        }
        return;
    }
    void OnClickAdd()
    {
        if (!(this.GetbIsAddSlot()))
        {
            return;
        }
        FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_TeamInvitation);
        return;
    }
    int GetSlotIndex() const property
    {
        this.TrackPropertyRead(0);
        return this.m_SlotIndex;
    }
    void SetSlotIndex(const int __Value) property
    {
        if (this.m_SlotIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_SlotIndex = __Value;
        return;
    }
    bool GetbIsAddSlot() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bIsAddSlot;
    }
    void SetbIsAddSlot(const bool __Value) property
    {
        if (!(this.m_bIsAddSlot) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bIsAddSlot = __Value;
        return;
    }
    TEUIModelRef<FM_Player> GetPlayer() const property
    {
        this.TrackPropertyRead(2);
        return this.m_Player;
    }
    void SetPlayer(const TEUIModelRef<FM_Player> &inout __Value) property
    {
        TEUIModelRef<FM_Player> local_2;
        local_2 = this.m_Player;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_Player = __Value;
        return;
    }
    TEUIModelRef<FVM_PlayerBasicItem> GetPlayerBasicItem() const property
    {
        this.TrackPropertyRead(3);
        return this.m_PlayerBasicItem;
    }
    void SetPlayerBasicItem(const TEUIModelRef<FVM_PlayerBasicItem> &inout __Value) property
    {
        TEUIModelRef<FVM_PlayerBasicItem> local_2;
        local_2 = this.m_PlayerBasicItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_PlayerBasicItem = __Value;
        return;
    }
}

struct FVM_CommonAvatarTeamEnter : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CommonAvatarTeamEnterItem>> m_TeamEntrySlots;

    FVM_CommonAvatarTeamEnter()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_CommonAvatarTeamEnter(const FVM_CommonAvatarTeamEnter &inout Other)
    {
        this.m_TeamEntrySlots = Other.m_TeamEntrySlots;
        return;
    }
    FVM_CommonAvatarTeamEnter& opAssign(const FVM_CommonAvatarTeamEnter &inout Other)
    {
        return Other.m_TeamEntrySlots;
    }
    void PostConstruct()
    {
        this.RebuildSlots();
        return;
    }
    void OnSocialTeamChanged(const FMsg_SocialTeamChanged &inout Msg)
    {
        this.RebuildSlots();
        return;
    }
    void OnSocialTeamMemberChanged(const FMsg_SocialTeamMemberChanged &inout Msg)
    {
        this.RebuildSlots();
        return;
    }
    void RebuildSlots()
    {
        TArray<TEUIModelRef<FVM_CommonAvatarTeamEnterItem>> local_4;
        int local_5 = 0;
        int local_7 = 0;
        TEUIModelRef<FM_SocialTeam> local_10 = ::FMS_PlayerSocialTeamData::Get(this.GetContext().Manager).GetLocalPlayerTeam();
        if (local_10.IsValid())
        {
            for (auto& local_28 : local_10.opArrow().GetMembers())
            {
                if (local_28.IsValid() && local_28.opArrow().GetPlayer().IsValid())
                {
                    TEUIModelRef<FM_Player> local_30 = local_28.opArrow().GetPlayer();
                    local_4.Add(TEUIModelRef<FVM_CommonAvatarTeamEnterItem>(::FVM_CommonAvatarTeamEnterItem::Create(this.GetContext().Manager, local_5, false, local_30)));
                    local_5 = local_5 + 1;
                    local_7 = local_7 + 1;
                }
            }
        }
        else
        {
            TEUIModelRef<FM_Player> local_30_2 = ::FMS_PlayerData::Get(this.GetContext().Manager).GetLocalPlayerData();
            if (local_30_2.IsValid())
            {
                local_4.Add(TEUIModelRef<FVM_CommonAvatarTeamEnterItem>(::FVM_CommonAvatarTeamEnterItem::Create(this.GetContext().Manager, local_5, false, local_30_2)));
                local_5 = local_5 + 1;
                local_7 = 1;
            }
        }
        if (this.CanInviteMore(local_7))
        {
            int local_6 = ::FSocialTeamUtils::GetMaxSocialMember();
            int local_38 = local_7;
            for (; local_38 < local_6; )
            {
                TEUIModelRef<FM_Player> local_36;
                local_4.Add(TEUIModelRef<FVM_CommonAvatarTeamEnterItem>(::FVM_CommonAvatarTeamEnterItem::Create(this.GetContext().Manager, local_5, true, local_36)));
                local_5 = local_5 + 1;
                ++local_38;
            }
        }
        this.SetTeamEntrySlots(local_4);
        return;
    }
    bool CanInviteMore(const int MemberCount) const
    {
        if (!(::FTeamUtils::GetIsInCityTeamState()))
        {
            return false;
        }
        if (MemberCount >= ::FSocialTeamUtils::GetMaxSocialMember())
        {
            return false;
        }
        return true;
    }
    const TArray<TEUIModelRef<FVM_CommonAvatarTeamEnterItem>> GetTeamEntrySlots() const property
    {
        const TArray<TEUIModelRef<FVM_CommonAvatarTeamEnterItem>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<TEUIModelRef<FVM_CommonAvatarTeamEnterItem>> GetModify_TeamEntrySlots() property
    {
        TArray<TEUIModelRef<FVM_CommonAvatarTeamEnterItem>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTeamEntrySlots(const TArray<TEUIModelRef<FVM_CommonAvatarTeamEnterItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TeamEntrySlots = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommonAvatarTeamEnterItem
{
    UPROPERTY()
    int SlotSwitcherIndex;
    UPROPERTY()
    TEUIModelRef<FVM_CommonAvatarTeamEnterItem> Self;


}

struct __GeneratedProperties_FVM_CommonAvatarTeamEnter
{
    UPROPERTY()
    TEUIModelRef<FVM_CommonAvatarTeamEnter> Self;

    __GeneratedProperties_FVM_CommonAvatarTeamEnter()
    {
        return;
    }
}

namespace FVM_CommonAvatarTeamEnterItem
{
FVM_CommonAvatarTeamEnterItem& Create(const UObject ContextObject, const int SlotIndex, const bool bIsAddSlot, const TEUIModelRef<FM_Player> &inout Player)
{
    return FVM_CommonAvatarTeamEnterItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), SlotIndex, bIsAddSlot, Player);
}
FVM_CommonAvatarTeamEnterItem CreateByManager(const UEUIManagerSubsystem Manager, const int SlotIndex, const bool bIsAddSlot, const TEUIModelRef<FM_Player> &inout Player)
{
    FVM_CommonAvatarTeamEnterItem __r;
    TEUIModelRef<FVM_CommonAvatarTeamEnterItem> local_6 = TEUIModelRef<FVM_CommonAvatarTeamEnterItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommonAvatarTeamEnterItem::ModelId, 0, SlotIndex, bIsAddSlot, Player));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonAvatarTeamEnterItem;
}
void __OnPlayerNickNameChanged(FVM_CommonAvatarTeamEnterItem &inout Model)
{
    Model.OnPlayerNickNameChanged();
    return;
}
void __OnPlayerAvatarChanged(FVM_CommonAvatarTeamEnterItem &inout Model)
{
    Model.OnPlayerAvatarChanged();
    return;
}
void __OnPlayerLevelChanged(FVM_CommonAvatarTeamEnterItem &inout Model)
{
    Model.OnPlayerLevelChanged();
    return;
}
void __OnPlayerDivineSkillChanged(FVM_CommonAvatarTeamEnterItem &inout Model)
{
    Model.OnPlayerDivineSkillChanged();
    return;
}
void __OnLocalPlayerLevelRefresh(FVM_CommonAvatarTeamEnterItem &inout Model, const FMsg_LocalPlayerLevelRefresh &inout Message)
{
    Model.OnLocalPlayerLevelRefresh(Message);
    return;
}
TEUIModelRef<FVM_PlayerBasicItem> __UIGetter_PlayerBasicItem(const FVM_CommonAvatarTeamEnterItem &inout Model)
{
    return Model.GetPlayerBasicItem();
}
int __UIGetter_SlotSwitcherIndex(const FVM_CommonAvatarTeamEnterItem &inout Model)
{
    return Model.GetSlotSwitcherIndex();
}
TEUIModelRef<FVM_CommonAvatarTeamEnterItem> __UIGetter_Self(const FVM_CommonAvatarTeamEnterItem &inout Model)
{
    return TEUIModelRef<FVM_CommonAvatarTeamEnterItem>(Model);
}
int __IndexOf_SlotIndex()
{
    return 0;
}
int __IndexOf_bIsAddSlot()
{
    return 1;
}
int __IndexOf_Player()
{
    return 2;
}
int __IndexOf_PlayerBasicItem()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_CommonAvatarTeamEnterItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_CommonAvatarTeamEnter
{
FVM_CommonAvatarTeamEnter& Create(const UObject ContextObject)
{
    return FVM_CommonAvatarTeamEnter::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_CommonAvatarTeamEnter CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_CommonAvatarTeamEnter __r;
    TEUIModelRef<FVM_CommonAvatarTeamEnter> local_6 = TEUIModelRef<FVM_CommonAvatarTeamEnter>(EUIInternal::MakeModelWithManager(Manager, FVM_CommonAvatarTeamEnter::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TeamEntrySlots";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_CommonAvatarTeamEnterItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonAvatarTeamEnter>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonAvatarTeamEnter;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__OnSocialTeamChanged";
    local_26.MessageTypeName = "Msg_SocialTeamChanged";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    local_26.FunctionName = "__OnSocialTeamMemberChanged";
    local_26.MessageTypeName = "Msg_SocialTeamMemberChanged";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonAvatarTeamEnter;
}
void __OnSocialTeamChanged(FVM_CommonAvatarTeamEnter &inout Model, const FMsg_SocialTeamChanged &inout Message)
{
    Model.OnSocialTeamChanged(Message);
    return;
}
void __OnSocialTeamMemberChanged(FVM_CommonAvatarTeamEnter &inout Model, const FMsg_SocialTeamMemberChanged &inout Message)
{
    Model.OnSocialTeamMemberChanged(Message);
    return;
}
TArray<TEUIModelRef<FVM_CommonAvatarTeamEnterItem>> __UIGetter_TeamEntrySlots(const FVM_CommonAvatarTeamEnter &inout Model)
{
    return Model.GetTeamEntrySlots();
}
TEUIModelRef<FVM_CommonAvatarTeamEnter> __UIGetter_Self(const FVM_CommonAvatarTeamEnter &inout Model)
{
    return TEUIModelRef<FVM_CommonAvatarTeamEnter>(Model);
}
int __IndexOf_TeamEntrySlots()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_CommonAvatarTeamEnter
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

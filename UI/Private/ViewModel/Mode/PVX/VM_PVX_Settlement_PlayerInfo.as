
const int SettlementPlayerState_InGame = 0;
const int SettlementPlayerState_Success = 1;
const int SettlementPlayerState_Failure = 2;
namespace FVM_PVX_Settlement_PlayerInfo
{
    const int ModelId = 0;

}
struct FVM_PVX_Settlement_PlayerInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FECSEntity m_PlayerEntity;
    UPROPERTY()
    FPVX_PlayerData m_PlayerData;
    UPROPERTY()
    EFaction m_PlayerFaction;
    UPROPERTY()
    TEUIModelRef<FVM_TeammateInfo> m_TeammateInfo;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerBasicItem> m_PlayerBasicItem;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerBasicItemExtend> m_PlayerBasicItemExtend;
    UPROPERTY()
    TEUIModelRef<FVM_ChatCommonAvatar> m_Avatar;
    UPROPERTY()
    bool m_bIsLocalPlayer;
    UPROPERTY()
    int m_CurrentPlayerStateIndex;
    UPROPERTY()
    FText m_PlayerName;
    UPROPERTY()
    FText m_PlayerLevel;
    UPROPERTY()
    FText m_PlayerExperience;
    UPROPERTY()
    FText m_PlayerKDA;
    UPROPERTY()
    FText m_PlayerCoinValue;

    FVM_PVX_Settlement_PlayerInfo()
    {
        this.m_PlayerFaction = EFaction(0);
        this.m_bIsLocalPlayer = false;
        this.m_CurrentPlayerStateIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_PVX_Settlement_PlayerInfo' by default constructor.");
        return;
    }
    FVM_PVX_Settlement_PlayerInfo(const FVM_PVX_Settlement_PlayerInfo &inout Other)
    {
        this.m_PlayerFaction = EFaction(0);
        this.m_bIsLocalPlayer = false;
        this.m_CurrentPlayerStateIndex = 0;
        this.m_PlayerEntity = Other.m_PlayerEntity;
        this.m_PlayerData = Other.m_PlayerData;
        this.m_PlayerFaction = Other.m_PlayerFaction;
        this.m_TeammateInfo = Other.m_TeammateInfo;
        this.m_PlayerBasicItem = Other.m_PlayerBasicItem;
        this.m_PlayerBasicItemExtend = Other.m_PlayerBasicItemExtend;
        this.m_Avatar = Other.m_Avatar;
        this.m_bIsLocalPlayer = Other.m_bIsLocalPlayer;
        this.m_CurrentPlayerStateIndex = int(Other.m_CurrentPlayerStateIndex);
        this.m_PlayerName = Other.m_PlayerName;
        this.m_PlayerLevel = Other.m_PlayerLevel;
        this.m_PlayerExperience = Other.m_PlayerExperience;
        this.m_PlayerKDA = Other.m_PlayerKDA;
        this.m_PlayerCoinValue = Other.m_PlayerCoinValue;
        return;
    }
    FVM_PVX_Settlement_PlayerInfo(const FECSEntity &inout InPlayerEntity, const FPVX_PlayerData &inout InPlayerData)
    {
        this.m_PlayerFaction = EFaction(0);
        this.m_bIsLocalPlayer = false;
        this.m_CurrentPlayerStateIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetPlayerEntity(InPlayerEntity);
        this.SetPlayerData(InPlayerData);
        return;
    }
    FVM_PVX_Settlement_PlayerInfo& opAssign(const FVM_PVX_Settlement_PlayerInfo &inout Other)
    {
        this.m_PlayerEntity = Other.m_PlayerEntity;
        this.m_PlayerData = Other.m_PlayerData;
        this.m_PlayerFaction = Other.m_PlayerFaction;
        this.m_TeammateInfo = Other.m_TeammateInfo;
        this.m_PlayerBasicItem = Other.m_PlayerBasicItem;
        this.m_PlayerBasicItemExtend = Other.m_PlayerBasicItemExtend;
        this.m_Avatar = Other.m_Avatar;
        this.m_bIsLocalPlayer = Other.m_bIsLocalPlayer;
        this.m_CurrentPlayerStateIndex = int(Other.m_CurrentPlayerStateIndex);
        this.m_PlayerName = Other.m_PlayerName;
        this.m_PlayerLevel = Other.m_PlayerLevel;
        this.m_PlayerExperience = Other.m_PlayerExperience;
        this.m_PlayerKDA = Other.m_PlayerKDA;
        return Other.m_PlayerCoinValue;
    }
    void PostConstruct()
    {
        int local_18 = 0;
        int local_164 = 0;
        FPvxRewardFactorData local_230;
        this.SetbIsLocalPlayer((FECSEntity(this.GetPlayerEntity()) == this.GetContext().GetLocalPlayer()));
        int local_10 = this.GetPlayerData().GetPlayerAvatarID();
        if (local_10 == 0)
        {
            if (local_18)
            {
                local_10 = local_18.GetPlayerAvatarID();
            }
        }
        TDataObjectPtr<FAvatarPrefabConfig> local_42;
        if (local_10 > 0)
        {
            GetDataObjectByGSDataId<FAvatarPrefabConfig> local_66;
            local_42 = local_66.opImplConv();
        }
        this.SetAvatar(TEUIModelRef<FVM_ChatCommonAvatar>(::FVM_ChatCommonAvatar::Create(this.GetContext().Manager, local_42)));
        this.SetPlayerBasicItemExtend(TEUIModelRef<FVM_PlayerBasicItemExtend>(::FVM_PlayerBasicItemExtend::Create(this.GetManager())));
        TEUIModelRef<FVM_PlayerBasicItemExtend> local_120 = this.GetPlayerBasicItemExtend();
        false.SetbShowLevelText();
        int local_11 = this.GetPlayerData().GetPlayerAvatarID();
        TEUIModelRef<FVM_PlayerBasicItemExtend> local_120_2 = this.GetPlayerBasicItemExtend();
        local_11.SetOverrideAvatarID();
        int local_11_2 = this.GetPlayerData().GetPlayerDivineSkillID();
        TEUIModelRef<FVM_PlayerBasicItemExtend> local_120_3 = this.GetPlayerBasicItemExtend();
        local_11_2.SetOverrideDivineSkillID();
        int local_121 = this.GetPlayerData().GetPlayerUID();
        if (local_121 == 0)
        {
            local_121 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(this.GetPlayerEntity());
        }
        TEUIModelRef<FM_Player> local_126 = ::FMS_PlayerData::Get(this.GetContext().Manager).GetCachedPlayerData(local_121);
        if (!(local_126.IsValid()) && (local_121 != 0))
        {
            FPlayerBriefInfo local_146;
            local_146.SetUid(local_121);
            local_146.SetNickname(this.GetPlayerData().GetPlayerName());
            local_146.SetLevel(this.GetPlayerData().GetLevel());
            local_146.SetCurAvatarId(this.GetPlayerData().GetPlayerAvatarID());
            local_146.SetDivineSkillId(this.GetPlayerData().GetPlayerDivineSkillID());
            local_126 = ::FMS_PlayerData::Get(this.GetContext().Manager).UpdateOrCreateByBriefInfo(local_146, EPlayerInfoTrust(2));
        }
        if (local_126.IsValid())
        {
            TEUIModelRef<FVM_PlayerBasicItem> local_170;
            TEUIModelRef<FM_SocialTeam> local_154 = TEUIModelRef<FM_SocialTeam>(::FM_SocialTeam::Create(this.GetContext().Manager, this.GetPlayerData().GetTeamId()));
            FEUIModelWeakRef local_160 = FEUIModelWeakRef(FEUIModelRef());
            local_164.SetPlayer(local_126);
            local_164.SetMemberIndex(this.GetPlayerData().GetPlayerInTeamIndex());
            TEUIModelRef<FVM_TeammateInfo> local_168 = TEUIModelRef<FVM_TeammateInfo>(::FVM_TeammateInfo::Create(this.GetContext().Manager, (TEUIModelRef<FM_TeamMember>(local_164))));
            this.SetTeammateInfo(local_168);
            TEUIModelRef<FVM_TeammateInfo> local_168_2 = this.GetTeammateInfo();
            local_170.GetPlayerBasicItem();
            this.SetPlayerBasicItem(local_170);
            if (this.GetPlayerBasicItem().IsValid())
            {
                TEUIModelRef<FVM_PlayerBasicItemExtend> local_120_4 = this.GetPlayerBasicItemExtend();
                local_170 = this.GetPlayerBasicItem();
                local_120_4.SetOverrideSource();
            }
        }
        FECSWorldPtr local_174 = ECS::GetECSWorld();
        if (local_174.IsValid())
        {
            this.SetPlayerFaction(::FGameModeDataBridge::GetPVXPlayerFaction(local_174, this.GetPlayerEntity()));
            int local_151 = int(this.GetPlayerData().GetFinalState());
            if (local_151 <= 1)
            {
                if (local_151 != 0)
                {
                    if (local_151 != 1)
                    {
                    }
                }
                else
                {
                    this.SetCurrentPlayerStateIndex(0);
                    this.SetCurrentPlayerStateIndex(1);
                }
            }
            this.SetCurrentPlayerStateIndex(2);
            this.SetPlayerName(FText::FromString(this.GetPlayerData().GetPlayerName()));
            this.SetPlayerLevel(FText::Format(FText::AsCultureInvariant("Lv.{0}"), this.GetPlayerData().GetLevel()));
            int local_175_2 = int(this.GetPlayerFaction());
            int local_177 = ::PVXGameModeUtils::GetLevelRequiredExp((this.GetPlayerData().GetLevel() + 1));
            if (local_177 != -1)
            {
                this.SetPlayerExperience(FText::Format(FText::AsCultureInvariant("{0}/{1}"), this.GetPlayerData().GetExp(), local_177));
            }
            else
            {
                this.SetPlayerExperience(FText::Format(FText::AsCultureInvariant("{0}/MAX"), this.GetPlayerData().GetExp()));
            }
            if (this.GetCurrentPlayerStateIndex() == 0)
            {
                this.SetPlayerKDA(FText::AsCultureInvariant("-/-/-"));
                this.SetPlayerCoinValue(FText::AsCultureInvariant("--"));
            }
            else
            {
                this.SetPlayerKDA(FText::Format(FText::AsCultureInvariant("{0}/{1}/{2}"), this.GetPlayerData().GetKills(), this.GetPlayerData().GetDeaths(), this.GetPlayerData().GetAssists()));
                float32 local_189 = 1.0f;
                auto local_196 = this.GetPlayerData().GetPendingSettlementEvents().Iterator();
                for (; local_196.CanProceed;)
                {
                    FPVXGameModeFlowSettings local_648 = ::PVXGameModeUtils::GetFlowSettings();
                    if (local_648.PvxRewardArray.Find(local_196.Proceed(), local_230))
                    {
                        local_189 = local_189 * local_230.Coefficient;
                    }
                }
                this.SetPlayerCoinValue(FText::AsNumber(uint((this.GetPlayerData().GetCurrencyAmount() * local_189)), FNumberFormattingOptions::DefaultNoGrouping()));
            }
        }
        return;
    }
    void OnTeammatePlayerBasicItemChanged()
    {
        if (this.GetTeammateInfo().IsValid())
        {
            TEUIModelRef<FVM_PlayerBasicItem> local_6;
            TEUIModelRef<FVM_TeammateInfo> local_2 = this.GetTeammateInfo();
            local_6.GetPlayerBasicItem();
            this.SetPlayerBasicItem(local_6);
            if (this.GetPlayerBasicItem().IsValid() && this.GetPlayerBasicItemExtend().IsValid())
            {
                local_6 = this.GetPlayerBasicItem();
                this.GetPlayerBasicItemExtend().SetOverrideSource();
            }
        }
        return;
    }
    FECSEntity GetPlayerEntity() const property
    {
        FECSEntity __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FECSEntity GetModify_PlayerEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetPlayerEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PlayerEntity = __Value;
        return;
    }
    const FPVX_PlayerData GetPlayerData() const property
    {
        const FPVX_PlayerData __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FPVX_PlayerData GetModify_PlayerData() property
    {
        FPVX_PlayerData __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetPlayerData(const FPVX_PlayerData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_PlayerData = __Value;
        return;
    }
    EFaction GetPlayerFaction() const property
    {
        this.TrackPropertyRead(2);
        return this.m_PlayerFaction;
    }
    void SetPlayerFaction(const EFaction __Value) property
    {
        if (int(this.m_PlayerFaction) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_PlayerFaction = __Value;
        return;
    }
    TEUIModelRef<FVM_TeammateInfo> GetTeammateInfo() const property
    {
        this.TrackPropertyRead(3);
        return this.m_TeammateInfo;
    }
    void SetTeammateInfo(const TEUIModelRef<FVM_TeammateInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_TeammateInfo> local_2;
        local_2 = this.m_TeammateInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_TeammateInfo = __Value;
        return;
    }
    TEUIModelRef<FVM_PlayerBasicItem> GetPlayerBasicItem() const property
    {
        this.TrackPropertyRead(4);
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
        this.MarkPropertyDirty(4);
        this.m_PlayerBasicItem = __Value;
        return;
    }
    TEUIModelRef<FVM_PlayerBasicItemExtend> GetPlayerBasicItemExtend() const property
    {
        this.TrackPropertyRead(5);
        return this.m_PlayerBasicItemExtend;
    }
    void SetPlayerBasicItemExtend(const TEUIModelRef<FVM_PlayerBasicItemExtend> &inout __Value) property
    {
        TEUIModelRef<FVM_PlayerBasicItemExtend> local_2;
        local_2 = this.m_PlayerBasicItemExtend;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_PlayerBasicItemExtend = __Value;
        return;
    }
    TEUIModelRef<FVM_ChatCommonAvatar> GetAvatar() const property
    {
        this.TrackPropertyRead(6);
        return this.m_Avatar;
    }
    void SetAvatar(const TEUIModelRef<FVM_ChatCommonAvatar> &inout __Value) property
    {
        TEUIModelRef<FVM_ChatCommonAvatar> local_2;
        local_2 = this.m_Avatar;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_Avatar = __Value;
        return;
    }
    bool GetbIsLocalPlayer() const property
    {
        this.TrackPropertyRead(7);
        return this.m_bIsLocalPlayer;
    }
    void SetbIsLocalPlayer(const bool __Value) property
    {
        if (!(this.m_bIsLocalPlayer) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_bIsLocalPlayer = __Value;
        return;
    }
    int GetCurrentPlayerStateIndex() const property
    {
        this.TrackPropertyRead(8);
        return this.m_CurrentPlayerStateIndex;
    }
    void SetCurrentPlayerStateIndex(const int __Value) property
    {
        if (this.m_CurrentPlayerStateIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_CurrentPlayerStateIndex = __Value;
        return;
    }
    FText GetPlayerName() const property
    {
        FText __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    FText GetModify_PlayerName() property
    {
        FText __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetPlayerName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_PlayerName = __Value;
        return;
    }
    FText GetPlayerLevel() const property
    {
        FText __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    FText GetModify_PlayerLevel() property
    {
        FText __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetPlayerLevel(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_PlayerLevel = __Value;
        return;
    }
    const FText GetPlayerExperience() const property
    {
        const FText __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    FText GetModify_PlayerExperience() property
    {
        FText __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetPlayerExperience(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_PlayerExperience = __Value;
        return;
    }
    const FText GetPlayerKDA() const property
    {
        const FText __r;
        this.TrackPropertyRead(12);
        return __r;
    }
    FText GetModify_PlayerKDA() property
    {
        FText __r;
        this.MarkPropertyDirty(12);
        return __r;
    }
    void SetPlayerKDA(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_PlayerKDA = __Value;
        return;
    }
    const FText GetPlayerCoinValue() const property
    {
        const FText __r;
        this.TrackPropertyRead(13);
        return __r;
    }
    FText GetModify_PlayerCoinValue() property
    {
        FText __r;
        this.MarkPropertyDirty(13);
        return __r;
    }
    void SetPlayerCoinValue(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_PlayerCoinValue = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_PVX_Settlement_PlayerInfo
{
    UPROPERTY()
    TEUIModelRef<FVM_PVX_Settlement_PlayerInfo> Self;

    __GeneratedProperties_FVM_PVX_Settlement_PlayerInfo()
    {
        return;
    }
}

namespace FVM_PVX_Settlement_PlayerInfo
{
FVM_PVX_Settlement_PlayerInfo& Create(const UObject ContextObject, const FECSEntity &inout PlayerEntity, const FPVX_PlayerData &inout PlayerData)
{
    return FVM_PVX_Settlement_PlayerInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject), PlayerEntity, PlayerData);
}
FVM_PVX_Settlement_PlayerInfo CreateByManager(const UEUIManagerSubsystem Manager, const FECSEntity &inout PlayerEntity, const FPVX_PlayerData &inout PlayerData)
{
    FVM_PVX_Settlement_PlayerInfo __r;
    TEUIModelRef<FVM_PVX_Settlement_PlayerInfo> local_6 = TEUIModelRef<FVM_PVX_Settlement_PlayerInfo>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_PVX_Settlement_PlayerInfo::ModelId, 0, PlayerEntity, PlayerData));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_PVX_Settlement_PlayerInfo;
}
void __OnTeammatePlayerBasicItemChanged(FVM_PVX_Settlement_PlayerInfo &inout Model)
{
    Model.OnTeammatePlayerBasicItemChanged();
    return;
}
TEUIModelRef<FVM_TeammateInfo> __UIGetter_TeammateInfo(const FVM_PVX_Settlement_PlayerInfo &inout Model)
{
    return Model.GetTeammateInfo();
}
TEUIModelRef<FVM_PlayerBasicItem> __UIGetter_PlayerBasicItem(const FVM_PVX_Settlement_PlayerInfo &inout Model)
{
    return Model.GetPlayerBasicItem();
}
TEUIModelRef<FVM_PlayerBasicItemExtend> __UIGetter_PlayerBasicItemExtend(const FVM_PVX_Settlement_PlayerInfo &inout Model)
{
    return Model.GetPlayerBasicItemExtend();
}
TEUIModelRef<FVM_ChatCommonAvatar> __UIGetter_Avatar(const FVM_PVX_Settlement_PlayerInfo &inout Model)
{
    return Model.GetAvatar();
}
bool __UIGetter_bIsLocalPlayer(const FVM_PVX_Settlement_PlayerInfo &inout Model)
{
    return Model.GetbIsLocalPlayer();
}
int __UIGetter_CurrentPlayerStateIndex(const FVM_PVX_Settlement_PlayerInfo &inout Model)
{
    return Model.GetCurrentPlayerStateIndex();
}
FText __UIGetter_PlayerName(const FVM_PVX_Settlement_PlayerInfo &inout Model)
{
    return Model.GetPlayerName();
}
FText __UIGetter_PlayerLevel(const FVM_PVX_Settlement_PlayerInfo &inout Model)
{
    return Model.GetPlayerLevel();
}
FText __UIGetter_PlayerExperience(const FVM_PVX_Settlement_PlayerInfo &inout Model)
{
    return Model.GetPlayerExperience();
}
FText __UIGetter_PlayerKDA(const FVM_PVX_Settlement_PlayerInfo &inout Model)
{
    return Model.GetPlayerKDA();
}
FText __UIGetter_PlayerCoinValue(const FVM_PVX_Settlement_PlayerInfo &inout Model)
{
    return Model.GetPlayerCoinValue();
}
TEUIModelRef<FVM_PVX_Settlement_PlayerInfo> __UIGetter_Self(const FVM_PVX_Settlement_PlayerInfo &inout Model)
{
    return TEUIModelRef<FVM_PVX_Settlement_PlayerInfo>(Model);
}
int __IndexOf_PlayerEntity()
{
    return 0;
}
int __IndexOf_PlayerData()
{
    return 1;
}
int __IndexOf_PlayerFaction()
{
    return 2;
}
int __IndexOf_TeammateInfo()
{
    return 3;
}
int __IndexOf_PlayerBasicItem()
{
    return 4;
}
int __IndexOf_PlayerBasicItemExtend()
{
    return 5;
}
int __IndexOf_Avatar()
{
    return 6;
}
int __IndexOf_bIsLocalPlayer()
{
    return 7;
}
int __IndexOf_CurrentPlayerStateIndex()
{
    return 8;
}
int __IndexOf_PlayerName()
{
    return 9;
}
int __IndexOf_PlayerLevel()
{
    return 10;
}
int __IndexOf_PlayerExperience()
{
    return 11;
}
int __IndexOf_PlayerKDA()
{
    return 12;
}
int __IndexOf_PlayerCoinValue()
{
    return 13;
}
}
namespace __GeneratedProperties_FVM_PVX_Settlement_PlayerInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

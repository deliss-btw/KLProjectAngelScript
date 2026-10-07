
namespace FVM_PlayerBasicItemExtend
{
    const int ModelId = 0;
}
namespace FVM_PlayerBasicItem
{
    const int ModelId = 0;

}
struct FVM_PlayerBasicItemExtend : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    bool m_bShowLevelText;
    UPROPERTY()
    uint m_OverrideAvatarID;
    UPROPERTY()
    uint m_OverrideDivineSkillID;

    FVM_PlayerBasicItemExtend()
    {
        this.m_bShowLevelText = true;
        this.m_OverrideAvatarID = 0;
        this.m_OverrideDivineSkillID = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_PlayerBasicItemExtend(const FVM_PlayerBasicItemExtend &inout Other)
    {
        this.m_bShowLevelText = true;
        this.m_OverrideAvatarID = 0;
        this.m_OverrideDivineSkillID = 0;
        this.m_bShowLevelText = Other.m_bShowLevelText;
        this.m_OverrideAvatarID = int(Other.m_OverrideAvatarID);
        this.m_OverrideDivineSkillID = int(Other.m_OverrideDivineSkillID);
        return;
    }
    FVM_PlayerBasicItemExtend opAssign(const FVM_PlayerBasicItemExtend &inout Other)
    {
        FVM_PlayerBasicItemExtend __r;
        this.m_bShowLevelText = Other.m_bShowLevelText;
        this.m_OverrideAvatarID = int(Other.m_OverrideAvatarID);
        this.m_OverrideDivineSkillID = int(Other.m_OverrideDivineSkillID);
        return __r;
    }
    bool GetbShowLevelText() const property
    {
        this.TrackPropertyRead(0);
        return this.m_bShowLevelText;
    }
    void SetbShowLevelText(const bool __Value) property
    {
        if (!(this.m_bShowLevelText) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_bShowLevelText = __Value;
        return;
    }
    uint GetOverrideAvatarID() const property
    {
        this.TrackPropertyRead(1);
        return this.m_OverrideAvatarID;
    }
    void SetOverrideAvatarID(const uint __Value) property
    {
        if (this.m_OverrideAvatarID == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_OverrideAvatarID = __Value;
        return;
    }
    uint GetOverrideDivineSkillID() const property
    {
        this.TrackPropertyRead(2);
        return this.m_OverrideDivineSkillID;
    }
    void SetOverrideDivineSkillID(const uint __Value) property
    {
        if (this.m_OverrideDivineSkillID == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_OverrideDivineSkillID = __Value;
        return;
    }
}

struct FVM_PlayerBasicItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FPlayerBriefInfo m_PlayerBrief;
    UPROPERTY()
    TEUIModelRef<FVM_ChatCommonAvatar> m_ChatCommonAvatar;
    UPROPERTY()
    uint m_PlayerUID;
    UPROPERTY()
    uint m_AvatarID;
    UPROPERTY()
    uint m_DivineSkillID;
    UPROPERTY()
    TDataObjectPtr<FAvatarPrefabConfig> m_AvatarConfig;
    UPROPERTY()
    TDataObjectPtr<FDivineSkillConfig> m_DivineSkillConfig;
    UPROPERTY()
    FSoftBrush m_DivineSkillIcon;
    UPROPERTY()
    int m_Level;
    UPROPERTY()
    bool m_bShowLevel;
    UPROPERTY()
    TEUIModelRef<FM_Player> m_PlayerModel;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerBasicItemExtend> m_OverrideSource;

    FVM_PlayerBasicItem()
    {
        this.m_PlayerUID = 0;
        this.m_AvatarID = 0;
        this.m_DivineSkillID = 0;
        this.m_Level = 0;
        this.m_bShowLevel = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_PlayerBasicItem' by default constructor.");
        return;
    }
    FVM_PlayerBasicItem(const FVM_PlayerBasicItem &inout Other)
    {
        this.m_PlayerUID = 0;
        this.m_AvatarID = 0;
        this.m_DivineSkillID = 0;
        this.m_Level = 0;
        this.m_bShowLevel = true;
        this.m_PlayerBrief = Other.m_PlayerBrief;
        this.m_ChatCommonAvatar = Other.m_ChatCommonAvatar;
        this.m_PlayerUID = int(Other.m_PlayerUID);
        this.m_AvatarID = int(Other.m_AvatarID);
        this.m_DivineSkillID = int(Other.m_DivineSkillID);
        this.m_AvatarConfig = Other.m_AvatarConfig;
        this.m_DivineSkillConfig = Other.m_DivineSkillConfig;
        this.m_DivineSkillIcon = Other.m_DivineSkillIcon;
        this.m_Level = int(Other.m_Level);
        this.m_bShowLevel = Other.m_bShowLevel;
        this.m_PlayerModel = Other.m_PlayerModel;
        this.m_OverrideSource = Other.m_OverrideSource;
        return;
    }
    FVM_PlayerBasicItem(const FPlayerBriefInfo &inout InPlayerBrief)
    {
        this.m_PlayerUID = 0;
        this.m_AvatarID = 0;
        this.m_DivineSkillID = 0;
        this.m_Level = 0;
        this.m_bShowLevel = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetPlayerBrief(InPlayerBrief);
        return;
    }
    FVM_PlayerBasicItem& opAssign(const FVM_PlayerBasicItem &inout Other)
    {
        this.m_PlayerBrief = Other.m_PlayerBrief;
        this.m_ChatCommonAvatar = Other.m_ChatCommonAvatar;
        this.m_PlayerUID = int(Other.m_PlayerUID);
        this.m_AvatarID = int(Other.m_AvatarID);
        this.m_DivineSkillID = int(Other.m_DivineSkillID);
        this.m_AvatarConfig = Other.m_AvatarConfig;
        this.m_DivineSkillConfig = Other.m_DivineSkillConfig;
        this.m_DivineSkillIcon = Other.m_DivineSkillIcon;
        this.m_Level = int(Other.m_Level);
        this.m_bShowLevel = Other.m_bShowLevel;
        this.m_PlayerModel = Other.m_PlayerModel;
        return Other.m_OverrideSource;
    }
    FText GetPlayerNameText() const
    {
        return FText::FromString(this.GetPlayerBrief().GetNickname());
    }
    FText GetPlayerLevelText() const
    {
        int local_8;
        if (this.GetPlayerModel().IsValid())
        {
            local_8 = this.GetPlayerModel().opArrow().GetLevel();
        }
        else
        {
            local_8 = this.GetLevel();
        }
        return FText::FromString(FString().Append(local_8));
    }
    bool IsNoInfo() const
    {
        if (!(this.GetPlayerModel().IsValid()))
        {
            return false;
        }
        if (!(this.GetPlayerModel().opArrow().GetIsOnline()))
        {
            return true;
        }
        if (!(this.GetPlayerModel().opArrow().IsInSameMapWithLocalPlayer()))
        {
            return true;
        }
        FECSEntity local_8 = this.GetPlayerModel().opArrow().GetPlayerPawnEntity();
        Has local_12;
        if (local_12.opCall())
        {
            return true;
        }
        return false;
    }
    bool IsSocialTeamCaptain() const
    {
        int local_10 = 0;
        FMS_LocalPlayerTeamData& local_4 = ::FMS_LocalPlayerTeamData::Get(this.GetManager());
        if (!(local_4.GetLocalPlayerSocialTeam().IsValid()))
        {
            return false;
        }
        TEUIModelWeakRef<FM_SocialTeam> local_6 = local_4.GetLocalPlayerSocialTeam();
        if (!(local_10.IsValid()) || !(local_10.opArrow().GetPlayer().IsValid()))
        {
            return false;
        }
        return (local_10.opArrow().GetPlayer().opArrow().GetPlayerUid() == this.GetPlayerUID());
    }
    bool IsLocalPlayer() const
    {
        return (this.GetPlayerUID() == ::FMS_PlayerData::Get(this.GetManager()).GetLocalPlayerData().opArrow().GetPlayerUid());
    }
    void UpdateChatCommonAvatar()
    {
        TDataObjectPtr<FAvatarPrefabConfig> local_24;
        int local_29 = 0;
        if (this.GetOverrideSource().IsValid() && (this.GetOverrideSource().opArrow().GetOverrideAvatarID() > 0))
        {
            int local_28 = this.GetOverrideSource().opArrow().GetOverrideAvatarID();
            GetDataObjectByGSDataId<FAvatarPrefabConfig> local_54;
            local_24 = local_54.opImplConv();
        }
        else
        {
            if (!(!(this.GetPlayerModel().IsValid())) && this.GetPlayerModel().opArrow().GetCurrentAvatar())
            {
                local_24 = this.GetPlayerModel().opArrow().GetCurrentAvatar();
            }
            else
            {
                local_29 = this.GetPlayerBrief().GetCurAvatarId();
                local_24 = ::FAvatarPrefabConfig::GetByDataId(local_29);
            }
        }
        if (local_24.IsSet())
        {
            this.SetAvatarConfig(local_24);
            this.SetAvatarID(local_29);
            this.SetChatCommonAvatar(TEUIModelRef<FVM_ChatCommonAvatar>(::FVM_ChatCommonAvatar::Create(this.GetManager(), local_24)));
        }
        return;
    }
    void UpdateDivineSkill()
    {
        int local_1 = this.GetPlayerBrief().GetDivineSkillId();
        if (this.GetOverrideSource().IsValid() && (this.GetOverrideSource().opArrow().GetOverrideDivineSkillID() > 0))
        {
            local_1 = this.GetOverrideSource().opArrow().GetOverrideDivineSkillID();
        }
        this.SetDivineSkillID(local_1);
        GetDataObjectByGSDataId<FDivineSkillConfig> local_32;
        this.SetDivineSkillConfig(local_32.opImplConv());
        if (this.GetDivineSkillConfig().IsSet())
        {
            this.SetDivineSkillIcon(this.GetDivineSkillConfig().opArrow().DisplayIcon);
        }
        return;
    }
    void PostConstruct()
    {
        this.SetPlayerUID(this.GetPlayerBrief().GetUid());
        this.SetAvatarID(this.GetPlayerBrief().GetCurAvatarId());
        this.SetLevel(this.GetPlayerBrief().GetLevel());
        this.SetDivineSkillID(this.GetPlayerBrief().GetDivineSkillId());
        int local_1 = this.GetDivineSkillID();
        GetDataObjectByGSDataId<FDivineSkillConfig> local_26;
        this.SetDivineSkillConfig(local_26.opImplConv());
        if (this.GetDivineSkillConfig().IsSet())
        {
            this.SetDivineSkillIcon(this.GetDivineSkillConfig().opArrow().DisplayIcon);
        }
        this.SetbShowLevel((this.GetLevel() > 0));
        if (!(::FMS_PlayerData::Get(this.GetManager()).HasCachedPlayerData(this.GetPlayerUID())))
        {
            this.SetPlayerModel(::FMS_PlayerData::Get(this.GetManager()).UpdateOrCreateByBriefInfo(this.GetPlayerBrief(), EPlayerInfoTrust(2)));
        }
        this.SetPlayerModel(::FMS_PlayerData::Get(this.GetManager()).GetCachedPlayerData(this.GetPlayerUID()));
        return;
    }
    void RefreshFromBrief(const FPlayerBriefInfo &inout NewBrief)
    {
        this.SetPlayerBrief(NewBrief);
        this.SetPlayerUID(NewBrief.GetUid());
        this.SetLevel(NewBrief.GetLevel());
        this.SetDivineSkillID(NewBrief.GetDivineSkillId());
        this.SetbShowLevel((this.GetLevel() > 0));
        if (!(::FMS_PlayerData::Get(this.GetManager()).HasCachedPlayerData(this.GetPlayerUID())))
        {
            this.SetPlayerModel(::FMS_PlayerData::Get(this.GetManager()).UpdateOrCreateByBriefInfo(this.GetPlayerBrief(), EPlayerInfoTrust(2)));
        }
        this.SetPlayerModel(::FMS_PlayerData::Get(this.GetManager()).GetCachedPlayerData(this.GetPlayerUID()));
        return;
    }
    const FPlayerBriefInfo GetPlayerBrief() const property
    {
        const FPlayerBriefInfo __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FPlayerBriefInfo GetModify_PlayerBrief() property
    {
        FPlayerBriefInfo __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetPlayerBrief(const FPlayerBriefInfo &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PlayerBrief = __Value;
        return;
    }
    TEUIModelRef<FVM_ChatCommonAvatar> GetChatCommonAvatar() const property
    {
        this.TrackPropertyRead(1);
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
        this.MarkPropertyDirty(1);
        this.m_ChatCommonAvatar = __Value;
        return;
    }
    uint GetPlayerUID() const property
    {
        this.TrackPropertyRead(2);
        return this.m_PlayerUID;
    }
    void SetPlayerUID(const uint __Value) property
    {
        if (this.m_PlayerUID == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_PlayerUID = __Value;
        return;
    }
    uint GetAvatarID() const property
    {
        this.TrackPropertyRead(3);
        return this.m_AvatarID;
    }
    void SetAvatarID(const uint __Value) property
    {
        if (this.m_AvatarID == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_AvatarID = __Value;
        return;
    }
    uint GetDivineSkillID() const property
    {
        this.TrackPropertyRead(4);
        return this.m_DivineSkillID;
    }
    void SetDivineSkillID(const uint __Value) property
    {
        if (this.m_DivineSkillID == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_DivineSkillID = __Value;
        return;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetAvatarConfig() const property
    {
        TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetModify_AvatarConfig() property
    {
        TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetAvatarConfig(const TDataObjectPtr<FAvatarPrefabConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_AvatarConfig = __Value;
        return;
    }
    TDataObjectPtr<FDivineSkillConfig> GetDivineSkillConfig() const property
    {
        TDataObjectPtr<FDivineSkillConfig> __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    TDataObjectPtr<FDivineSkillConfig> GetModify_DivineSkillConfig() property
    {
        TDataObjectPtr<FDivineSkillConfig> __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetDivineSkillConfig(const TDataObjectPtr<FDivineSkillConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_DivineSkillConfig = __Value;
        return;
    }
    FSoftBrush GetDivineSkillIcon() const property
    {
        FSoftBrush __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FSoftBrush GetModify_DivineSkillIcon() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetDivineSkillIcon(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_DivineSkillIcon = __Value;
        return;
    }
    int GetLevel() const property
    {
        this.TrackPropertyRead(8);
        return this.m_Level;
    }
    void SetLevel(const int __Value) property
    {
        if (this.m_Level == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_Level = __Value;
        return;
    }
    bool GetbShowLevel() const property
    {
        this.TrackPropertyRead(9);
        return this.m_bShowLevel;
    }
    void SetbShowLevel(const bool __Value) property
    {
        if (!(this.m_bShowLevel) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_bShowLevel = __Value;
        return;
    }
    TEUIModelRef<FM_Player> GetPlayerModel() const property
    {
        this.TrackPropertyRead(10);
        return this.m_PlayerModel;
    }
    void SetPlayerModel(const TEUIModelRef<FM_Player> &inout __Value) property
    {
        TEUIModelRef<FM_Player> local_2;
        local_2 = this.m_PlayerModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_PlayerModel = __Value;
        return;
    }
    TEUIModelRef<FVM_PlayerBasicItemExtend> GetOverrideSource() const property
    {
        this.TrackPropertyRead(11);
        return this.m_OverrideSource;
    }
    void SetOverrideSource(const TEUIModelRef<FVM_PlayerBasicItemExtend> &inout __Value) property
    {
        TEUIModelRef<FVM_PlayerBasicItemExtend> local_2;
        local_2 = this.m_OverrideSource;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_OverrideSource = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_PlayerBasicItemExtend
{
    UPROPERTY()
    TEUIModelRef<FVM_PlayerBasicItemExtend> Self;

    __GeneratedProperties_FVM_PlayerBasicItemExtend()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_PlayerBasicItem
{
    UPROPERTY()
    FText PlayerNameText;
    UPROPERTY()
    FText PlayerLevelText;
    UPROPERTY()
    bool IsNoInfo;
    UPROPERTY()
    bool IsSocialTeamCaptain;
    UPROPERTY()
    bool IsLocalPlayer;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerBasicItem> Self;


}

namespace FVM_PlayerBasicItemExtend
{
FVM_PlayerBasicItemExtend& Create(const UObject ContextObject)
{
    return FVM_PlayerBasicItemExtend::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_PlayerBasicItemExtend CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_PlayerBasicItemExtend __r;
    TEUIModelRef<FVM_PlayerBasicItemExtend> local_6 = TEUIModelRef<FVM_PlayerBasicItemExtend>(EUIInternal::MakeModelWithManager(Manager, FVM_PlayerBasicItemExtend::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "bShowLevelText";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_PlayerBasicItemExtend>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_PlayerBasicItemExtend;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_PlayerBasicItemExtend;
}
bool __UIGetter_bShowLevelText(const FVM_PlayerBasicItemExtend &inout Model)
{
    return Model.GetbShowLevelText();
}
TEUIModelRef<FVM_PlayerBasicItemExtend> __UIGetter_Self(const FVM_PlayerBasicItemExtend &inout Model)
{
    return TEUIModelRef<FVM_PlayerBasicItemExtend>(Model);
}
int __IndexOf_bShowLevelText()
{
    return 0;
}
int __IndexOf_OverrideAvatarID()
{
    return 1;
}
int __IndexOf_OverrideDivineSkillID()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_PlayerBasicItemExtend
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_PlayerBasicItem
{
FVM_PlayerBasicItem& Create(const UObject ContextObject, const FPlayerBriefInfo &inout PlayerBrief)
{
    return FVM_PlayerBasicItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), PlayerBrief);
}
FVM_PlayerBasicItem CreateByManager(const UEUIManagerSubsystem Manager, const FPlayerBriefInfo &inout PlayerBrief)
{
    FVM_PlayerBasicItem __r;
    TEUIModelRef<FVM_PlayerBasicItem> local_6 = TEUIModelRef<FVM_PlayerBasicItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_PlayerBasicItem::ModelId, 0, PlayerBrief));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ChatCommonAvatar";
    local_14.TypeName = "TEUIModelRef<FVM_ChatCommonAvatar>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DivineSkillIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bShowLevel";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerNameText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerLevelText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsNoInfo";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsSocialTeamCaptain";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsLocalPlayer";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_PlayerBasicItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_PlayerBasicItem;
    FEUIModelEffectDefine local_20;
    local_20.FunctionName = "UpdateChatCommonAvatar";
    Result.EffectFunctions.Add(local_20);
    local_20.FunctionName = "UpdateDivineSkill";
    Result.EffectFunctions.Add(local_20);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_PlayerBasicItem;
}
TEUIModelRef<FVM_ChatCommonAvatar> __UIGetter_ChatCommonAvatar(const FVM_PlayerBasicItem &inout Model)
{
    return Model.GetChatCommonAvatar();
}
FSoftBrush __UIGetter_DivineSkillIcon(const FVM_PlayerBasicItem &inout Model)
{
    return Model.GetDivineSkillIcon();
}
bool __UIGetter_bShowLevel(const FVM_PlayerBasicItem &inout Model)
{
    return Model.GetbShowLevel();
}
FText __UIGetter_PlayerNameText(const FVM_PlayerBasicItem &inout Model)
{
    return Model.GetPlayerNameText();
}
FText __UIGetter_PlayerLevelText(const FVM_PlayerBasicItem &inout Model)
{
    return Model.GetPlayerLevelText();
}
bool __UIGetter_IsNoInfo(const FVM_PlayerBasicItem &inout Model)
{
    return Model.IsNoInfo();
}
bool __UIGetter_IsSocialTeamCaptain(const FVM_PlayerBasicItem &inout Model)
{
    return Model.IsSocialTeamCaptain();
}
bool __UIGetter_IsLocalPlayer(const FVM_PlayerBasicItem &inout Model)
{
    return Model.IsLocalPlayer();
}
TEUIModelRef<FVM_PlayerBasicItem> __UIGetter_Self(const FVM_PlayerBasicItem &inout Model)
{
    return TEUIModelRef<FVM_PlayerBasicItem>(Model);
}
int __IndexOf_PlayerBrief()
{
    return 0;
}
int __IndexOf_ChatCommonAvatar()
{
    return 1;
}
int __IndexOf_PlayerUID()
{
    return 2;
}
int __IndexOf_AvatarID()
{
    return 3;
}
int __IndexOf_DivineSkillID()
{
    return 4;
}
int __IndexOf_AvatarConfig()
{
    return 5;
}
int __IndexOf_DivineSkillConfig()
{
    return 6;
}
int __IndexOf_DivineSkillIcon()
{
    return 7;
}
int __IndexOf_Level()
{
    return 8;
}
int __IndexOf_bShowLevel()
{
    return 9;
}
int __IndexOf_PlayerModel()
{
    return 10;
}
int __IndexOf_OverrideSource()
{
    return 11;
}
}
namespace __GeneratedProperties_FVM_PlayerBasicItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

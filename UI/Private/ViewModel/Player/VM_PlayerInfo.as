
namespace FVM_PlayerInfo
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature CopyUidToClipboard = FEUIModelCallbackSignature();

}
struct FVM_PlayerInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Player> m_Player;

    FVM_PlayerInfo()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_PlayerInfo' by default constructor.");
        return;
    }
    FVM_PlayerInfo(const FVM_PlayerInfo &inout Other)
    {
        this.m_Player = Other.m_Player;
        return;
    }
    FVM_PlayerInfo(const TEUIModelRef<FM_Player> &inout InPlayer)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetPlayer(InPlayer);
        return;
    }
    FVM_PlayerInfo& opAssign(const FVM_PlayerInfo &inout Other)
    {
        return Other.m_Player;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetPlayerAvatar() const property
    {
        TEUIModelRef<FM_Player> local_2 = this.GetPlayer();
        return TDataObjectPtr<FAvatarPrefabConfig>();
    }
    FText GetPlayerName() const property
    {
        TEUIModelRef<FM_Player> local_2 = this.GetPlayer();
        return FText::FromString();
    }
    int GetPlayerLevel() const property
    {
        return this.GetPlayer().opArrow().GetLevel();
    }
    FSlateBrush GetAvatarIcon() const
    {
        if (this.GetPlayerAvatar())
        {
            return this.GetPlayerAvatar().opArrow().AvatarIcon.LoadBrush();
        }
        return FSlateBrush();
    }
    FSoftBrush GetDivineSkillIcon() const
    {
        TDataObjectPtr<FDivineSkillConfig> local_26 = this.GetPlayer().opArrow().GetDivineSkill();
        if (local_26)
        {
            return local_26.opArrow().DisplayIcon;
        }
        return FSoftBrush();
    }
    FSoftBrush GetDivineSkillTypeIcon() const
    {
        TDataObjectPtr<FDivineSkillConfig> local_26 = this.GetPlayer().opArrow().GetDivineSkill();
        if (local_26)
        {
            return local_26.opArrow().GetTypeConfig().opArrow().TypeIcon;
        }
        return FSoftBrush();
    }
    int GetCurrentExp() const property
    {
        return this.GetPlayer().opArrow().GetCurrentExp();
    }
    int GetUpgradeExp() const property
    {
        const UPlayerInfoSettings local_2;
        GetGameplaySettings<UPlayerInfoSettings> local_4;
        local_2 = local_4;
        TDataObjectPtr<FPlayerLevelConfig> local_58 = local_2.GetLevelConfig(this.GetPlayer().opArrow().GetLevel());
        if (local_58)
        {
            return ::NumericUtils::AsInt32(local_58.opArrow().UpgradeExp);
        }
        return 0;
    }
    FText GetEXPText() const
    {
        return FText::Format(NSLOCTEXT("EXPFormat", "{0}/{1}"), this.GetCurrentExp(), this.GetUpgradeExp());
    }
    FText GetLvlText() const
    {
        return FText::Format(NSLOCTEXT("LvlFormat", "Lv {0}"), this.GetPlayerLevel());
    }
    FText GetPlayerStatusText() const
    {
        if (this.GetPlayer().opArrow().GetIsOnline())
        {
            if (this.GetPlayer().opArrow().IsInSameMapWithLocalPlayer())
            {
                return NSLOCTEXT("PlayerStatusText_OnlineInSameWorld", "ењЁзєї");
            }
            else
            {
                return NSLOCTEXT("PlayerStatusText_OnlineInDifferentWorld", "дёЌењЁеђЊдёЂењ°е›ѕ");
            }
        }
        else
        {
            return NSLOCTEXT("PlayerStatusText_Offline", "з¦»зєї");
        }
    }
    uint GetPlayerUid() const
    {
        return ::FMS_PlayerData::Get(this.GetContext().Manager).GetPlayerId(this.GetPlayer());
    }
    FText GetPlayerUidText() const
    {
        FText local_6;
        FText::AsNumber(this.GetPlayerUid(), local_6);
        return FText::Format(INVTEXT("UID {0}"), local_6);
    }
    void CopyUidToClipboard() const
    {
        FPlatformApplicationMisc::ClipboardCopy(FString().Append(this.GetPlayerUid()));
        FCommonTipsParam local_14;
        ::CommonPopup::WeakTips(NSLOCTEXT("CopyToClipboard", "е¤Ќе€¶ж€ђеЉџ"), local_14);
        return;
    }
    TEUIModelRef<FM_Player> GetPlayer() const property
    {
        this.TrackPropertyRead(0);
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
        this.MarkPropertyDirty(0);
        this.m_Player = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_PlayerInfo
{
    UPROPERTY()
    TDataObjectPtr<FAvatarPrefabConfig> PlayerAvatar;
    UPROPERTY()
    FText PlayerName;
    UPROPERTY()
    int PlayerLevel;
    UPROPERTY()
    FSlateBrush AvatarIcon;
    UPROPERTY()
    FSoftBrush DivineSkillIcon;
    UPROPERTY()
    FSoftBrush DivineSkillTypeIcon;
    UPROPERTY()
    int CurrentExp;
    UPROPERTY()
    int UpgradeExp;
    UPROPERTY()
    FText EXPText;
    UPROPERTY()
    FText LvlText;
    UPROPERTY()
    FText PlayerStatusText;
    UPROPERTY()
    uint PlayerUid;
    UPROPERTY()
    FText PlayerUidText;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerInfo> Self;


}

namespace FVM_PlayerInfo
{
FVM_PlayerInfo& Create(const UObject ContextObject, const TEUIModelRef<FM_Player> &inout Player)
{
    return FVM_PlayerInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject), Player);
}
FVM_PlayerInfo CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Player> &inout Player)
{
    FVM_PlayerInfo __r;
    TEUIModelRef<FVM_PlayerInfo> local_6 = TEUIModelRef<FVM_PlayerInfo>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_PlayerInfo::ModelId, 0, Player));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "PlayerAvatar";
    local_14.TypeName = "TDataObjectPtr<FAvatarPrefabConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerLevel";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AvatarIcon";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DivineSkillIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DivineSkillTypeIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentExp";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "UpgradeExp";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EXPText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LvlText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerStatusText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerUid";
    local_14.TypeName = "uint32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerUidText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_PlayerInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_PlayerInfo;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_PlayerInfo;
}
TDataObjectPtr<FAvatarPrefabConfig> __UIGetter_PlayerAvatar(const FVM_PlayerInfo &inout Model)
{
    return Model.GetPlayerAvatar();
}
FText __UIGetter_PlayerName(const FVM_PlayerInfo &inout Model)
{
    return Model.GetPlayerName();
}
int __UIGetter_PlayerLevel(const FVM_PlayerInfo &inout Model)
{
    return Model.GetPlayerLevel();
}
FSlateBrush __UIGetter_AvatarIcon(const FVM_PlayerInfo &inout Model)
{
    return Model.GetAvatarIcon();
}
FSoftBrush __UIGetter_DivineSkillIcon(const FVM_PlayerInfo &inout Model)
{
    return Model.GetDivineSkillIcon();
}
FSoftBrush __UIGetter_DivineSkillTypeIcon(const FVM_PlayerInfo &inout Model)
{
    return Model.GetDivineSkillTypeIcon();
}
int __UIGetter_CurrentExp(const FVM_PlayerInfo &inout Model)
{
    return Model.GetCurrentExp();
}
int __UIGetter_UpgradeExp(const FVM_PlayerInfo &inout Model)
{
    return Model.GetUpgradeExp();
}
FText __UIGetter_EXPText(const FVM_PlayerInfo &inout Model)
{
    return Model.GetEXPText();
}
FText __UIGetter_LvlText(const FVM_PlayerInfo &inout Model)
{
    return Model.GetLvlText();
}
FText __UIGetter_PlayerStatusText(const FVM_PlayerInfo &inout Model)
{
    return Model.GetPlayerStatusText();
}
uint __UIGetter_PlayerUid(const FVM_PlayerInfo &inout Model)
{
    return Model.GetPlayerUid();
}
FText __UIGetter_PlayerUidText(const FVM_PlayerInfo &inout Model)
{
    return Model.GetPlayerUidText();
}
TEUIModelRef<FVM_PlayerInfo> __UIGetter_Self(const FVM_PlayerInfo &inout Model)
{
    return TEUIModelRef<FVM_PlayerInfo>(Model);
}
int __IndexOf_Player()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_PlayerInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

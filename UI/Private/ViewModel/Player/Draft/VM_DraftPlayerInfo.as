
enum EDraftPlayerReplyDisplayType
{
    None,
    Agree,
    Disagree,
}

namespace FVM_DraftPlayerInfo
{
    const int ModelId = 0;

}
struct FVM_DraftPlayerInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_DraftPlayer> m_DraftPlayer;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerInfo> m_PlayerInfo;

    FVM_DraftPlayerInfo()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_DraftPlayerInfo' by default constructor.");
        return;
    }
    FVM_DraftPlayerInfo(const FVM_DraftPlayerInfo &inout Other)
    {
        this.m_DraftPlayer = Other.m_DraftPlayer;
        this.m_PlayerInfo = Other.m_PlayerInfo;
        return;
    }
    FVM_DraftPlayerInfo(const TEUIModelRef<FM_DraftPlayer> &inout InDraftPlayer)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetDraftPlayer(InDraftPlayer);
        return;
    }
    FVM_DraftPlayerInfo& opAssign(const FVM_DraftPlayerInfo &inout Other)
    {
        this.m_DraftPlayer = Other.m_DraftPlayer;
        return Other.m_PlayerInfo;
    }
    void PostConstruct()
    {
        if (this.GetDraftPlayer().opArrow().GetPlayer())
        {
            this.SetPlayerInfo(TEUIModelRef<FVM_PlayerInfo>(::FVM_PlayerInfo::Create(this.GetContext().Manager, this.GetDraftPlayer().opArrow().GetPlayer())));
        }
        return;
    }
    EDraftPlayerReplyDisplayType GetReplyDisplayType() const
    {
        if (this.GetDraftPlayer().opArrow().GetDraftInviteReply() == 1)
        {
            return EDraftPlayerReplyDisplayType(1);
        }
        if (this.GetDraftPlayer().opArrow().GetDraftInviteReply() == 2)
        {
            return EDraftPlayerReplyDisplayType(2);
        }
        return EDraftPlayerReplyDisplayType(0);
    }
    int GetReplyDisplayTypeValue() const
    {
        return int(this.GetReplyDisplayType());
    }
    FText GetPlayerName() const
    {
        return this.GetPlayerInfo().opArrow().GetPlayerName();
    }
    FSlateBrush GetPlayerAvatarIcon() const
    {
        return this.GetPlayerInfo().opArrow().GetAvatarIcon();
    }
    FSoftBrush GetDivineSkillIcon() const
    {
        TDataObjectPtr<FDivineSkillConfig> local_28 = this.GetDraftPlayer().opArrow().GetPlayer().opArrow().GetDivineSkill();
        if (local_28)
        {
            return local_28.opArrow().DisplayIcon;
        }
        return FSoftBrush();
    }
    FSoftBrush GetDivineSkillTypeIcon() const
    {
        TDataObjectPtr<FDivineSkillConfig> local_28 = this.GetDraftPlayer().opArrow().GetPlayer().opArrow().GetDivineSkill();
        if (local_28)
        {
            TDataObjectPtr<FDivineSkillTypeConfig> local_78 = local_28.opArrow().GetTypeConfig();
            if (local_78)
            {
                return local_78.opArrow().TypeIcon;
            }
        }
        return FSoftBrush();
    }
    TEUIModelRef<FM_DraftPlayer> GetDraftPlayer() const property
    {
        this.TrackPropertyRead(0);
        return this.m_DraftPlayer;
    }
    void SetDraftPlayer(const TEUIModelRef<FM_DraftPlayer> &inout __Value) property
    {
        TEUIModelRef<FM_DraftPlayer> local_2;
        local_2 = this.m_DraftPlayer;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_DraftPlayer = __Value;
        return;
    }
    TEUIModelRef<FVM_PlayerInfo> GetPlayerInfo() const property
    {
        this.TrackPropertyRead(1);
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
        this.MarkPropertyDirty(1);
        this.m_PlayerInfo = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_DraftPlayerInfo
{
    UPROPERTY()
    EDraftPlayerReplyDisplayType ReplyDisplayType;
    UPROPERTY()
    int ReplyDisplayTypeValue;
    UPROPERTY()
    FText PlayerName;
    UPROPERTY()
    FSlateBrush PlayerAvatarIcon;
    UPROPERTY()
    FSoftBrush DivineSkillIcon;
    UPROPERTY()
    FSoftBrush DivineSkillTypeIcon;
    UPROPERTY()
    TEUIModelRef<FVM_DraftPlayerInfo> Self;


}

namespace FVM_DraftPlayerInfo
{
FVM_DraftPlayerInfo& Create(const UObject ContextObject, const TEUIModelRef<FM_DraftPlayer> &inout DraftPlayer)
{
    return FVM_DraftPlayerInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject), DraftPlayer);
}
FVM_DraftPlayerInfo CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_DraftPlayer> &inout DraftPlayer)
{
    FVM_DraftPlayerInfo __r;
    TEUIModelRef<FVM_DraftPlayerInfo> local_6 = TEUIModelRef<FVM_DraftPlayerInfo>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_DraftPlayerInfo::ModelId, 0, DraftPlayer));
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
    local_14.PropertyName = "ReplyDisplayType";
    local_14.TypeName = "EDraftPlayerReplyDisplayType";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ReplyDisplayTypeValue";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerAvatarIcon";
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
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_DraftPlayerInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_DraftPlayerInfo;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_DraftPlayerInfo;
}
TEUIModelRef<FVM_PlayerInfo> __UIGetter_PlayerInfo(const FVM_DraftPlayerInfo &inout Model)
{
    return Model.GetPlayerInfo();
}
EDraftPlayerReplyDisplayType __UIGetter_ReplyDisplayType(const FVM_DraftPlayerInfo &inout Model)
{
    return Model.GetReplyDisplayType();
}
int __UIGetter_ReplyDisplayTypeValue(const FVM_DraftPlayerInfo &inout Model)
{
    return Model.GetReplyDisplayTypeValue();
}
FText __UIGetter_PlayerName(const FVM_DraftPlayerInfo &inout Model)
{
    return Model.GetPlayerName();
}
FSlateBrush __UIGetter_PlayerAvatarIcon(const FVM_DraftPlayerInfo &inout Model)
{
    return Model.GetPlayerAvatarIcon();
}
FSoftBrush __UIGetter_DivineSkillIcon(const FVM_DraftPlayerInfo &inout Model)
{
    return Model.GetDivineSkillIcon();
}
FSoftBrush __UIGetter_DivineSkillTypeIcon(const FVM_DraftPlayerInfo &inout Model)
{
    return Model.GetDivineSkillTypeIcon();
}
TEUIModelRef<FVM_DraftPlayerInfo> __UIGetter_Self(const FVM_DraftPlayerInfo &inout Model)
{
    return TEUIModelRef<FVM_DraftPlayerInfo>(Model);
}
int __IndexOf_DraftPlayer()
{
    return 0;
}
int __IndexOf_PlayerInfo()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_DraftPlayerInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

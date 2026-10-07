
namespace FVM_TeamInfo
{
    const int ModelId = 0;

}
struct FVM_TeamInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FECSEntity m_TargetEntity;
    UPROPERTY()
    FECSEntity m_TargetPlayerProxy;
    UPROPERTY()
    int m_TargetPlayerUid;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerHpBar> m_PlayerHpBar;
    UPROPERTY()
    UTexture2D m_PlayerIcon;
    UPROPERTY()
    UTexture2D m_NextPlayerIcon;
    UPROPERTY()
    UTexture2D m_LinkSkillIcon;
    UPROPERTY()
    FText m_PlayerName;
    UPROPERTY()
    bool m_bOffline;
    UPROPERTY()
    bool m_bOtherMap;
    UPROPERTY()
    bool m_bNearDeath;
    UPROPERTY()
    bool m_bDeath;
    UPROPERTY()
    bool m_bTaunting;
    UPROPERTY()
    UTexture2D m_EmojiIcon;
    UPROPERTY()
    float32 m_PlayerHPRatio;
    UPROPERTY()
    FTeamMemberInfo m_CambatTeamMemberInfo;
    UPROPERTY()
    int m_SocialTeamMemberIdx;
    UPROPERTY()
    FEUIModelRef m_VM_BuffInfo;

    FVM_TeamInfo()
    {
        this.m_TargetPlayerUid = 0;
        this.m_PlayerIcon = nullptr;
        this.m_NextPlayerIcon = nullptr;
        this.m_LinkSkillIcon = nullptr;
        this.m_bOffline = false;
        this.m_bOtherMap = false;
        this.m_bNearDeath = false;
        this.m_bDeath = false;
        this.m_EmojiIcon = nullptr;
        this.m_bTaunting = false;
        this.m_PlayerHPRatio = 1.0f;
        this.m_SocialTeamMemberIdx = -1;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TeamInfo' by default constructor.");
        return;
    }
    FVM_TeamInfo(const FVM_TeamInfo &inout Other)
    {
        this.m_TargetPlayerUid = 0;
        this.m_PlayerIcon = nullptr;
        this.m_NextPlayerIcon = nullptr;
        this.m_LinkSkillIcon = nullptr;
        this.m_bOffline = false;
        this.m_bOtherMap = false;
        this.m_bNearDeath = false;
        this.m_bDeath = false;
        this.m_EmojiIcon = nullptr;
        this.m_bTaunting = false;
        this.m_PlayerHPRatio = 1.0f;
        this.m_SocialTeamMemberIdx = -1;
        this.m_TargetEntity = Other.m_TargetEntity;
        this.m_TargetPlayerProxy = Other.m_TargetPlayerProxy;
        this.m_TargetPlayerUid = int(Other.m_TargetPlayerUid);
        this.m_PlayerHpBar = Other.m_PlayerHpBar;
        this.m_PlayerIcon = Other.m_PlayerIcon;
        this.m_NextPlayerIcon = Other.m_NextPlayerIcon;
        this.m_LinkSkillIcon = Other.m_LinkSkillIcon;
        this.m_PlayerName = Other.m_PlayerName;
        this.m_bOffline = Other.m_bOffline;
        this.m_bOtherMap = Other.m_bOtherMap;
        this.m_bNearDeath = Other.m_bNearDeath;
        this.m_bDeath = Other.m_bDeath;
        this.m_bTaunting = Other.m_bTaunting;
        this.m_EmojiIcon = Other.m_EmojiIcon;
        this.m_PlayerHPRatio = Other.m_PlayerHPRatio;
        this.m_CambatTeamMemberInfo = Other.m_CambatTeamMemberInfo;
        this.m_SocialTeamMemberIdx = int(Other.m_SocialTeamMemberIdx);
        this.m_VM_BuffInfo = Other.m_VM_BuffInfo;
        return;
    }
    FVM_TeamInfo(const FECSEntity &inout InTargetPlayerProxy, const int InTargetPlayerUid)
    {
        this.m_TargetPlayerUid = 0;
        this.m_PlayerIcon = nullptr;
        this.m_NextPlayerIcon = nullptr;
        this.m_LinkSkillIcon = nullptr;
        this.m_bOffline = false;
        this.m_bOtherMap = false;
        this.m_bNearDeath = false;
        this.m_bDeath = false;
        this.m_EmojiIcon = nullptr;
        this.m_bTaunting = false;
        this.m_PlayerHPRatio = 1.0f;
        this.m_SocialTeamMemberIdx = -1;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTargetPlayerProxy(InTargetPlayerProxy);
        this.SetTargetPlayerUid(InTargetPlayerUid);
        return;
    }
    FVM_TeamInfo& opAssign(const FVM_TeamInfo &inout Other)
    {
        this.m_TargetEntity = Other.m_TargetEntity;
        this.m_TargetPlayerProxy = Other.m_TargetPlayerProxy;
        this.m_TargetPlayerUid = int(Other.m_TargetPlayerUid);
        this.m_PlayerHpBar = Other.m_PlayerHpBar;
        this.m_PlayerIcon = Other.m_PlayerIcon;
        this.m_NextPlayerIcon = Other.m_NextPlayerIcon;
        this.m_LinkSkillIcon = Other.m_LinkSkillIcon;
        this.m_PlayerName = Other.m_PlayerName;
        this.m_bOffline = Other.m_bOffline;
        this.m_bOtherMap = Other.m_bOtherMap;
        this.m_bNearDeath = Other.m_bNearDeath;
        this.m_bDeath = Other.m_bDeath;
        this.m_bTaunting = Other.m_bTaunting;
        this.m_EmojiIcon = Other.m_EmojiIcon;
        this.m_PlayerHPRatio = Other.m_PlayerHPRatio;
        this.m_CambatTeamMemberInfo = Other.m_CambatTeamMemberInfo;
        this.m_SocialTeamMemberIdx = int(Other.m_SocialTeamMemberIdx);
        return Other.m_VM_BuffInfo;
    }
    void PostConstruct()
    {
        this.SetPlayerHpBar(TEUIModelRef<FVM_PlayerHpBar>(::FVM_PlayerHpBar::Create(this.GetContext().Manager, this.GetTargetEntity())));
        return;
    }
    void OnTargetPlayerChanged()
    {
        this.UpdateCombatTeamMember();
        return;
    }
    void UpdateCombatTeamMember()
    {
        this.SetTargetEntity(::FTeamUtils::GetPawnEntityFromTeamMember(this.GetTargetPlayerProxy(), true));
        if (this.GetTargetPlayerProxy().IsValid())
        {
            FECSEntity local_6 = this.GetContext().GetLocalPlayer();
            GetDefaulted local_10;
            if (FECSEntity(local_10.opCall().GetTeamEntity()).IsValid())
            {
                int local_20;
                for (auto& local_34 : local_20.GetMembers())
                {
                    if ((FECSEntity(local_34.GetEntity()) == this.GetTargetPlayerProxy()))
                    {
                        this.SetCambatTeamMemberInfo(local_34);
                        break;
                    }
                }
            }
        }
        else
        {
            FTeamMemberInfo local_72;
            this.SetCambatTeamMemberInfo(local_72);
        }
        if (this.GetTargetEntity().IsValid())
        {
            this.SetVM_BuffInfo(FEUIModelRef());
            TEUIModelRef<FVM_PlayerHpBar> local_76 = this.GetPlayerHpBar();
            this.GetTargetEntity().SetEntity();
        }
        return;
    }
    void UpdatePlayerInfo()
    {
        int local_12 = 0;
        UObject local_78;
        UObject local_82;
        UObject local_134;
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            FText local_20;
            if (local_12)
            {
                local_20 = FText::FromString(local_12.GetNickName());
                this.SetPlayerName(local_20);
            }
        }
        else
        {
            FText local_20;
            if (this.GetSocialTeamMemberIdx() >= 0)
            {
                FClientSocialTeamInfo& local_24 = ::FSocialTeamUtils::ClientGetSocialTeamInfo();
                if (local_24.Members.Num() > this.GetSocialTeamMemberIdx())
                {
                    local_20 = FText::FromString(local_24.Members[this.GetSocialTeamMemberIdx()].MemberName);
                    this.SetPlayerName(local_20);
                }
            }
            else
            {
                bool local_5_2 = FECSEntity::Has<FC_AIController>(this.GetTargetPlayerProxy()).opCall();
                if (!(local_5_2))
                {
                    local_5_2 = false;
                }
                else
                {
                    local_5_2 = this.GetCambatTeamMemberInfo().GetAvatarConfig();
                }
                if (local_5_2)
                {
                }
                else
                {
                    this.SetPlayerName(local_20);
                }
            }
        }
        if (this.GetTargetEntity().IsValid())
        {
            FSlateBrush local_76;
            local_76 = ::GetDefaultedAvatarConfig(this.GetTargetEntity()).AvatarIcon.LoadBrush();
            local_78 = local_76.ResourceObject;
            this.SetPlayerIcon(Cast<UTexture2D>(local_78));
        }
        else
        {
            FSlateBrush local_76;
            if (this.GetCambatTeamMemberInfo().GetAvatarConfig())
            {
                local_82 = local_76.ResourceObject;
                this.SetPlayerIcon(Cast<UTexture2D>(local_82));
            }
            else
            {
                if (this.GetSocialTeamMemberIdx() >= 0)
                {
                    FClientSocialTeamInfo& local_24_2 = ::FSocialTeamUtils::ClientGetSocialTeamInfo();
                    if (local_24_2.Members.Num() > this.GetSocialTeamMemberIdx())
                    {
                        int local_83;
                        int local_84 = local_24_2.Members[this.GetSocialTeamMemberIdx()].CharacterKey;
                        local_83 = local_84;
                        if (::FAvatarPrefabConfig::GetByDataId(local_83))
                        {
                            local_134 = local_76.ResourceObject;
                            this.SetPlayerIcon(Cast<UTexture2D>(local_134));
                        }
                    }
                }
            }
        }
        Get local_138;
        if (local_138.opCall())
        {
            this.SetbTaunting(true);
        }
        else
        {
            this.SetbTaunting(false);
        }
        Has local_144;
        bool local_5_3 = local_144.opCall();
        if (local_5_3)
        {
            this.SetbNearDeath(true);
        }
        else
        {
            this.SetbNearDeath(false);
        }
        Has local_148;
        bool local_29 = local_148.opCall();
        if (local_29)
        {
            this.SetbDeath(true);
            return;
        }
        this.SetbDeath(false);
        return;
    }
    void UpdateOfflineOrOtherMap()
    {
        this.SetbOffline(false);
        this.SetbOtherMap(false);
        if (this.GetSocialTeamMemberIdx() >= 0)
        {
            FClientSocialTeamInfo& local_6 = ::FSocialTeamUtils::ClientGetSocialTeamInfo();
            if (local_6.Members.Num() > this.GetSocialTeamMemberIdx())
            {
                this.SetbOffline(local_6.Members[this.GetSocialTeamMemberIdx()].bOffline);
            }
        }
        if (!(this.GetbOffline()))
        {
            this.SetbOtherMap(!(this.GetTargetPlayerProxy().IsValid()));
        }
        return;
    }
    void OnTargetEntityChanged()
    {
        this.UpdatePlayerInfo();
        return;
    }
    void Tick()
    {
        UObject local_106;
        if (!(ECS::GetECSWorld().IsValid()))
        {
            return;
        }
        this.UpdateCombatTeamMember();
        this.UpdatePlayerInfo();
        this.UpdateOfflineOrOtherMap();
        if (::DivineSkillUtils::GetDivineSkill(::FASCommonUtils::GetUniquePlayerEntity(this.GetTargetEntity())))
        {
            FSlateBrush local_104;
            local_106 = local_104.ResourceObject;
            this.SetLinkSkillIcon(Cast<UTexture2D>(local_106));
        }
        if ((!((FECSEntity(this.GetTargetEntity()) == ENTITY_NULL))))
        {
            this.SetPlayerHPRatio(this.GetCambatTeamMemberInfo().GetHealthRation());
        }
        return;
    }
    void ShowTeammateMessage(const FCE_ShowHeadBubble &inout Event)
    {
        if ((::FASCommonUtils::GetUniquePlayerEntity(Event.Sender) == this.GetTargetPlayerProxy()))
        {
            FEmojiData local_76;
            ::UCombatGlobalSettings::Get().EmojiDataTable.FindRow(Event.EmojiData, local_76);
            this.SetEmojiIcon(local_76.EmojiIcon);
        }
        return;
    }
    ESlateVisibility bTauntingAsSlateVisibility() const
    {
        int local_2;
        if (this.bTauntingAsBool())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
    }
    bool bTauntingAsBool() const
    {
        return this.GetbTaunting() || false;
    }
    const FECSEntity GetTargetEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FECSEntity GetModify_TargetEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTargetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TargetEntity = __Value;
        return;
    }
    const FECSEntity GetTargetPlayerProxy() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FECSEntity GetModify_TargetPlayerProxy() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetTargetPlayerProxy(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TargetPlayerProxy = __Value;
        return;
    }
    int GetTargetPlayerUid() const property
    {
        this.TrackPropertyRead(2);
        return this.m_TargetPlayerUid;
    }
    void SetTargetPlayerUid(const int __Value) property
    {
        if (this.m_TargetPlayerUid == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_TargetPlayerUid = __Value;
        return;
    }
    TEUIModelRef<FVM_PlayerHpBar> GetPlayerHpBar() const property
    {
        this.TrackPropertyRead(3);
        return this.m_PlayerHpBar;
    }
    void SetPlayerHpBar(const TEUIModelRef<FVM_PlayerHpBar> &inout __Value) property
    {
        TEUIModelRef<FVM_PlayerHpBar> local_2;
        local_2 = this.m_PlayerHpBar;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_PlayerHpBar = __Value;
        return;
    }
    UTexture2D GetPlayerIcon() const property
    {
        this.TrackPropertyRead(4);
        return this.m_PlayerIcon;
    }
    void SetPlayerIcon(const UTexture2D __Value) property
    {
        if (this.m_PlayerIcon == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        return;
    }
    UTexture2D GetNextPlayerIcon() const property
    {
        this.TrackPropertyRead(5);
        return this.m_NextPlayerIcon;
    }
    void SetNextPlayerIcon(const UTexture2D __Value) property
    {
        if (this.m_NextPlayerIcon == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        return;
    }
    UTexture2D GetLinkSkillIcon() const property
    {
        this.TrackPropertyRead(6);
        return this.m_LinkSkillIcon;
    }
    void SetLinkSkillIcon(const UTexture2D __Value) property
    {
        if (this.m_LinkSkillIcon == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        return;
    }
    FText GetPlayerName() const property
    {
        FText __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FText GetModify_PlayerName() property
    {
        FText __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetPlayerName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_PlayerName = __Value;
        return;
    }
    bool GetbOffline() const property
    {
        this.TrackPropertyRead(8);
        return this.m_bOffline;
    }
    void SetbOffline(const bool __Value) property
    {
        if (!(this.m_bOffline) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_bOffline = __Value;
        return;
    }
    bool GetbOtherMap() const property
    {
        this.TrackPropertyRead(9);
        return this.m_bOtherMap;
    }
    void SetbOtherMap(const bool __Value) property
    {
        if (!(this.m_bOtherMap) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_bOtherMap = __Value;
        return;
    }
    bool GetbNearDeath() const property
    {
        this.TrackPropertyRead(10);
        return this.m_bNearDeath;
    }
    void SetbNearDeath(const bool __Value) property
    {
        if (!(this.m_bNearDeath) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_bNearDeath = __Value;
        return;
    }
    bool GetbDeath() const property
    {
        this.TrackPropertyRead(11);
        return this.m_bDeath;
    }
    void SetbDeath(const bool __Value) property
    {
        if (!(this.m_bDeath) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_bDeath = __Value;
        return;
    }
    bool GetbTaunting() const property
    {
        this.TrackPropertyRead(12);
        return this.m_bTaunting;
    }
    void SetbTaunting(const bool __Value) property
    {
        if (!(this.m_bTaunting) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_bTaunting = __Value;
        return;
    }
    UTexture2D GetEmojiIcon() const property
    {
        this.TrackPropertyRead(13);
        return this.m_EmojiIcon;
    }
    void SetEmojiIcon(const UTexture2D __Value) property
    {
        if (this.m_EmojiIcon == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        return;
    }
    const float32 GetPlayerHPRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(14);
        return __r;
    }
    float32 GetModify_PlayerHPRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(14);
        return __r;
    }
    void SetPlayerHPRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_PlayerHPRatio = __Value;
        return;
    }
    const FTeamMemberInfo GetCambatTeamMemberInfo() const property
    {
        const FTeamMemberInfo __r;
        this.TrackPropertyRead(15);
        return __r;
    }
    FTeamMemberInfo GetModify_CambatTeamMemberInfo() property
    {
        FTeamMemberInfo __r;
        this.MarkPropertyDirty(15);
        return __r;
    }
    void SetCambatTeamMemberInfo(const FTeamMemberInfo &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_CambatTeamMemberInfo = __Value;
        return;
    }
    int GetSocialTeamMemberIdx() const property
    {
        this.TrackPropertyRead(16);
        return this.m_SocialTeamMemberIdx;
    }
    void SetSocialTeamMemberIdx(const int __Value) property
    {
        if (this.m_SocialTeamMemberIdx == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_SocialTeamMemberIdx = __Value;
        return;
    }
    FEUIModelRef GetVM_BuffInfo() const property
    {
        FEUIModelRef __r;
        this.TrackPropertyRead(17);
        return __r;
    }
    FEUIModelRef GetModify_VM_BuffInfo() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(17);
        return __r;
    }
    void SetVM_BuffInfo(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_VM_BuffInfo = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TeamInfo
{
    UPROPERTY()
    TEUIModelRef<FVM_TeamInfo> Self;

    __GeneratedProperties_FVM_TeamInfo()
    {
        return;
    }
}

namespace FVM_TeamInfo
{
FVM_TeamInfo& Create(const UObject ContextObject, const FECSEntity &inout TargetPlayerProxy, const int TargetPlayerUid)
{
    return FVM_TeamInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject), TargetPlayerProxy, TargetPlayerUid);
}
FVM_TeamInfo CreateByManager(const UEUIManagerSubsystem Manager, const FECSEntity &inout TargetPlayerProxy, const int TargetPlayerUid)
{
    FVM_TeamInfo __r;
    TEUIModelRef<FVM_TeamInfo> local_6 = TEUIModelRef<FVM_TeamInfo>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TeamInfo::ModelId, 0, TargetPlayerProxy, TargetPlayerUid));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "PlayerHpBar";
    local_14.TypeName = "TEUIModelRef<FVM_PlayerHpBar>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerIcon";
    local_14.TypeName = "UTexture2D";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "NextPlayerIcon";
    local_14.TypeName = "UTexture2D";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LinkSkillIcon";
    local_14.TypeName = "UTexture2D";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bOffline";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bOtherMap";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bNearDeath";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bDeath";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bTaunting";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerHPRatio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VM_BuffInfo";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TeamInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TeamInfo;
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__OnTargetPlayerChanged";
    local_24.DirtyFlags.Set(FVM_TeamInfo::__IndexOf_TargetPlayerProxy());
    Result.DirtyFunctions.Add(local_24);
    local_24.FunctionName = "__OnTargetEntityChanged";
    local_24.DirtyFlags.Set(FVM_TeamInfo::__IndexOf_TargetEntity());
    Result.DirtyFunctions.Add(local_24);
    Result.TickFunction.FunctionName = "__Tick";
    FEUIModelEventDefine local_30;
    local_30.FunctionName = "__ShowTeammateMessage";
    local_30.EventType = FCE_ShowHeadBubble;
    Result.EventFunctions.Add(local_30);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TeamInfo;
}
void __OnTargetPlayerChanged(FVM_TeamInfo &inout Model)
{
    Model.OnTargetPlayerChanged();
    return;
}
void __OnTargetEntityChanged(FVM_TeamInfo &inout Model)
{
    Model.OnTargetEntityChanged();
    return;
}
void __Tick(FVM_TeamInfo &inout Model)
{
    Model.Tick();
    return;
}
void __ShowTeammateMessage(FVM_TeamInfo &inout Model, const FCE_ShowHeadBubble &inout Event)
{
    Model.ShowTeammateMessage(Event);
    return;
}
TEUIModelRef<FVM_PlayerHpBar> __UIGetter_PlayerHpBar(const FVM_TeamInfo &inout Model)
{
    return Model.GetPlayerHpBar();
}
UTexture2D __UIGetter_PlayerIcon(const FVM_TeamInfo &inout Model)
{
    return Model.GetPlayerIcon();
}
UTexture2D __UIGetter_NextPlayerIcon(const FVM_TeamInfo &inout Model)
{
    return Model.GetNextPlayerIcon();
}
UTexture2D __UIGetter_LinkSkillIcon(const FVM_TeamInfo &inout Model)
{
    return Model.GetLinkSkillIcon();
}
FText __UIGetter_PlayerName(const FVM_TeamInfo &inout Model)
{
    return Model.GetPlayerName();
}
bool __UIGetter_bOffline(const FVM_TeamInfo &inout Model)
{
    return Model.GetbOffline();
}
bool __UIGetter_bOtherMap(const FVM_TeamInfo &inout Model)
{
    return Model.GetbOtherMap();
}
bool __UIGetter_bNearDeath(const FVM_TeamInfo &inout Model)
{
    return Model.GetbNearDeath();
}
bool __UIGetter_bDeath(const FVM_TeamInfo &inout Model)
{
    return Model.GetbDeath();
}
bool __UIGetter_bTaunting(const FVM_TeamInfo &inout Model)
{
    return Model.GetbTaunting();
}
float32 __UIGetter_PlayerHPRatio(const FVM_TeamInfo &inout Model)
{
    return Model.GetPlayerHPRatio();
}
FEUIModelRef __UIGetter_VM_BuffInfo(const FVM_TeamInfo &inout Model)
{
    return Model.GetVM_BuffInfo();
}
TEUIModelRef<FVM_TeamInfo> __UIGetter_Self(const FVM_TeamInfo &inout Model)
{
    return TEUIModelRef<FVM_TeamInfo>(Model);
}
int __IndexOf_TargetEntity()
{
    return 0;
}
int __IndexOf_TargetPlayerProxy()
{
    return 1;
}
int __IndexOf_TargetPlayerUid()
{
    return 2;
}
int __IndexOf_PlayerHpBar()
{
    return 3;
}
int __IndexOf_PlayerIcon()
{
    return 4;
}
int __IndexOf_NextPlayerIcon()
{
    return 5;
}
int __IndexOf_LinkSkillIcon()
{
    return 6;
}
int __IndexOf_PlayerName()
{
    return 7;
}
int __IndexOf_bOffline()
{
    return 8;
}
int __IndexOf_bOtherMap()
{
    return 9;
}
int __IndexOf_bNearDeath()
{
    return 10;
}
int __IndexOf_bDeath()
{
    return 11;
}
int __IndexOf_bTaunting()
{
    return 12;
}
int __IndexOf_EmojiIcon()
{
    return 13;
}
int __IndexOf_PlayerHPRatio()
{
    return 14;
}
int __IndexOf_CambatTeamMemberInfo()
{
    return 15;
}
int __IndexOf_SocialTeamMemberIdx()
{
    return 16;
}
int __IndexOf_VM_BuffInfo()
{
    return 17;
}
}
namespace __GeneratedProperties_FVM_TeamInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

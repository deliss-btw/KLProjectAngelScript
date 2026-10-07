
namespace FVM_AvatarInfo
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnChangeSpecialty = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnCurrentAvatarsChanged = FEUIModelCallbackSignature();
}
namespace FVM_AvatarInfoExtend
{
    const int ModelId = 0;
}
namespace FVM_AvatarSpecialtyInfo
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature ExecuteOnHoverChanged = FEUIModelCallbackSignature();
}
namespace FVM_AvatarDetailInfo_SkillSelect
{
    const int ModelId = 0;
}
namespace FVM_AvatarDetailSkillSelect
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature SetHoverSkill = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature GoToSkillDetial = FEUIModelCallbackSignature();
}
namespace FVM_AvatarDetailPopInfo
{
    const int ModelId = 0;
}
namespace FVM_AvatarDetailInfo
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature SwitchDisplayAttributeOrSkill = FEUIModelCallbackSignature();
}
namespace FVMS_PlayerOwnedAvatarInfo
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OpenUnlockAvatar = FEUIModelCallbackSignature();

}
struct FVM_AvatarInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Avatar> m_Avatar;
    UPROPERTY()
    int m_SlotIndex;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarEquipment> m_AvatarEquipment;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_AvatarEquipment>> m_TalismanEquipments;
    UPROPERTY()
    TEUIModelRef<FM_TalentNode> m_FoundationNode;
    UPROPERTY()
    TDataObjectPtr<FAvatarPrefabConfig> m_AvatarConfig;
    UPROPERTY()
    FSlateBrush m_DisplayIconLarge;
    UPROPERTY()
    FSlateBrush m_UnlockedDisplayIconLarge;
    UPROPERTY()
    EAvatarIllustrate m_Illustrate;
    UPROPERTY()
    FSlateBrush m_IllustrateIcon;
    UPROPERTY()
    FText m_IllustrateDisplayName;
    UPROPERTY()
    FSoftBrush m_IllustrateBackgroundIcon;
    UPROPERTY()
    FSoftBrush m_IllustrateBackgroundActiveIcon;
    UPROPERTY()
    FSoftBrush m_ClassIcon;
    UPROPERTY()
    FSlateBrush m_DamageTypeIcon;
    UPROPERTY()
    FSoftBrush m_WeaponTypeIcon;
    UPROPERTY()
    FText m_WeaponTypeDisplayName;
    UPROPERTY()
    FText m_NickName;
    UPROPERTY()
    TEUIModelRef<FMS_PlayerAvatarData> m_PlayerAvatarData;
    UPROPERTY()
    TEUIModelRef<FMS_CombatSettingData> m_CombatSettingData;

    FVM_AvatarInfo()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_AvatarInfo(const FVM_AvatarInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_AvatarInfo(const TEUIModelRef<FM_Avatar> &inout InAvatar)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_AvatarInfo& opAssign(const FVM_AvatarInfo &inout Other)
    {
        this.m_Avatar = Other.m_Avatar;
        this.m_SlotIndex = int(Other.m_SlotIndex);
        this.m_AvatarEquipment = Other.m_AvatarEquipment;
        this.m_TalismanEquipments = Other.m_TalismanEquipments;
        this.m_FoundationNode = Other.m_FoundationNode;
        this.m_AvatarConfig = Other.m_AvatarConfig;
        this.m_DisplayIconLarge = Other.m_DisplayIconLarge;
        this.m_UnlockedDisplayIconLarge = Other.m_UnlockedDisplayIconLarge;
        this.m_Illustrate = Other.m_Illustrate;
        this.m_IllustrateIcon = Other.m_IllustrateIcon;
        this.m_IllustrateDisplayName = Other.m_IllustrateDisplayName;
        this.m_IllustrateBackgroundIcon = Other.m_IllustrateBackgroundIcon;
        this.m_IllustrateBackgroundActiveIcon = Other.m_IllustrateBackgroundActiveIcon;
        this.m_ClassIcon = Other.m_ClassIcon;
        this.m_DamageTypeIcon = Other.m_DamageTypeIcon;
        this.m_WeaponTypeIcon = Other.m_WeaponTypeIcon;
        this.m_WeaponTypeDisplayName = Other.m_WeaponTypeDisplayName;
        this.m_NickName = Other.m_NickName;
        this.m_PlayerAvatarData = Other.m_PlayerAvatarData;
        return Other.m_CombatSettingData;
    }
    void PostConstruct()
    {
        this.SetPlayerAvatarData(TEUIModelRef<FMS_PlayerAvatarData>(::FMS_PlayerAvatarData::Get(this.GetManager())));
        this.SetCombatSettingData(TEUIModelRef<FMS_CombatSettingData>(::FMS_CombatSettingData::Get(this.GetManager())));
        if (this.GetAvatar())
        {
            this.SetAvatarConfig(this.GetAvatar().opArrow().GetAvatarConfig());
            this.RefreshSlotIndex();
            this.RefreshAvatarEquipment();
            FText local_14;
            this.SetNickName(local_14);
            if (this.GetAvatarConfig())
            {
                const FAvatarPrefabConfig& local_16;
                this.SetDisplayIconLarge(local_16.AvatarLargeIcon.LoadBrush());
                this.SetUnlockedDisplayIconLarge(local_16.UnlockedAvatarLargeIcon.LoadBrush());
                this.SetClassIcon(local_16.PlayerClassIcon);
                this.RefreshAvatarIllustrateInfo();
                TRawPtr<FDamageTypeInfoConfig> local_62 = local_16.GetDamageTypeInfo();
                if (local_62)
                {
                    if (UICommonUtil::CVar_UI_UseAttributePresentation.GetBool())
                    {
                        this.SetDamageTypeIcon(local_62.opArrow().DamagePresentation.GetIcon().LoadBrush());
                    }
                    else
                    {
                        this.SetDamageTypeIcon(local_62.opArrow().DamageIcon.LoadBrush());
                    }
                }
                this.SetWeaponTypeIcon(::FASCommonUtils::GetWeaponTypeDisplayBrush(EWeaponType(local_16.WeaponType)));
                this.SetWeaponTypeDisplayName(::FASCommonUtils::GetWeaponTypeDisplayName(EWeaponType(local_16.WeaponType)));
                FText local_118;
                if (this.GetAvatarConfig().opArrow().bIsMainPlayer)
                {
                    local_118 = ::FASCommonUtils::GetPlayerName(::FASCommonUtils::GetLocalUniquePlayerEntity());
                }
                else
                {
                    local_118 = this.GetAvatarConfig().opArrow().DisplayName;
                }
                this.SetNickName(local_118);
            }
        }
        return;
    }
    FText GetAvatarBackgroundDesc() const
    {
        // body not fully recovered вЂ” stub [no-return]
        FText __r; return __r;
    }
    bool GetIsUnLocked() const
    {
        return this.GetAvatar().opArrow().GetbIsUnlocked();
    }
    FText GetSlotIndexDisplayText() const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        FText __r; return __r;
    }
    FText GetDisplayName() const
    {
        FText __return;
        if (this.GetAvatarConfig().IsSet())
        {
        }
        else
        {
            __return = this.GetNickName();
        }
        return __return;
    }
    FText GetNickNameText() const
    {
        return this.GetNickName();
    }
    bool IsCombatAvatar() const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        bool __r; return __r;
    }
    int GetCombatIndex() const
    {
        if (this.IsCombatAvatar())
        {
            return this.GetSlotIndex();
        }
        return 0;
    }
    int GetAvatarLockStateIndex() const
    {
        if (this.GetAvatar().opArrow().GetbIsUnlocked())
        {
            return 0;
        }
        return 1;
    }
    void OnAvatarEquipmentChanged(const FC_DSPlayerAvatarInfo &inout C_PlayerAvatarInfo)
    {
        this.RefreshAvatarEquipment();
        return;
    }
    void OnTalentDataUpdated(const FMsg_TalentTreeDataUpdate &inout Msg)
    {
        this.SetFoundationNode(::FMS_Talent::Get(this.GetManager()).GetFoundationNodeByAvatarID(0));
        return;
    }
    bool IsSpecialtyActive() const
    {
        ::FMS_PlayerData::Get(this.GetManager()).GetLocalPlayerData();
        return (this.GetAvatar().opArrow().GetAvatarConfig().opArrow().DataId == GetPlayerSpecialtyID());
    }
    void OnChangeSpecialty()
    {
        this.ChangeToSpecialty(false);
        return;
    }
    void ChangeToSpecialty(const bool bForceChangeRole = false)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void RefreshAvatarIllustrateInfo()
    {
        int local_1 = 0;
        int local_55 = 0;
        const UAvatarBuildSettings local_58;
        this.SetIllustrate(EAvatarIllustrate(local_1));
        if (this.GetFoundationNode().IsValid())
        {
            TDataObjectPtr<FTalentConfig> local_30;
            TEUIModelRef<FM_TalentNode> local_4 = this.GetFoundationNode();
            local_30.GetNodeConfig(0);
            if (local_30.IsSet())
            {
                local_1 = int(::FASCommonUtils::TalentDivisionToIllustrate(ETalentDivision(local_55)));
                this.SetIllustrate(EAvatarIllustrate(local_1));
            }
        }
        GetGameplaySettings<UAvatarBuildSettings> local_60;
        local_58 = local_60;
        if (local_58 != nullptr)
        {
            local_1 = int(this.GetIllustrate());
            if (local_58.AvatarIllustrateInfos.Find(EAvatarIllustrate(local_1)))
            {
                FSlateBrush local_112;
                this.SetIllustrateIcon(local_112);
            }
        }
        return;
    }
    void OnCurrentAvatarsChanged()
    {
        this.RefreshSlotIndex();
        return;
    }
    void RefreshSlotIndexByMsg(const FMsg_CombatSettingPresetUpdated &inout Msg)
    {
        this.RefreshSlotIndex();
        return;
    }
    void RefreshSlotIndex()
    {
        int local_16 = 0;
        this.SetSlotIndex(INDEX_NONE);
        UGameClientConnectionSubsystem local_6 = ::UGameClientConnectionSubsystem::Get();
        if (local_6 != nullptr)
        {
            if (local_6.IsConnectedToGameServer())
            {
                if (this.GetCombatSettingData().IsValid())
                {
                    TEUIModelRef<FM_Avatar> local_12 = this.GetAvatar();
                    TEUIModelRef<FMS_CombatSettingData> local_10 = this.GetCombatSettingData();
                    if (GetAvatarConfig().IsMainAvatar())
                    {
                        this.SetSlotIndex(0);
                    }
                    else
                    {
                        TEUIModelRef<FM_Avatar> local_12_2 = this.GetAvatar();
                        TEUIModelRef<FMS_CombatSettingData> local_10_2 = this.GetCombatSettingData();
                        if (GetAvatarConfig().IsAssistAvatar())
                        {
                            this.SetSlotIndex(1);
                        }
                    }
                }
                return;
            }
        }
        if (this.GetPlayerAvatarData().IsValid())
        {
            TEUIModelRef<FMS_PlayerAvatarData> local_14 = this.GetPlayerAvatarData();
            int local_17 = 0;
            for (; local_17 < local_16.Num(); ++local_17)
            {
                if (local_16[local_17].IsValid() && GetAvatarConfig().IsSet())
                {
                    TEUIModelRef<FM_Avatar> local_12_3 = this.GetAvatar();
                    if (0 == 0)
                    {
                        this.SetSlotIndex(local_17);
                        break;
                    }
                }
            }
        }
        return;
    }
    void RefreshAvatarEquipment()
    {
        int local_14 = 0;
        int local_17 = 0;
        this.GetAvatar();
        this.SetAvatarEquipment(TEUIModelRef<FVM_AvatarEquipment>());
        int local_7 = 2;
        int local_9 = 5;
        this.GetModify_TalismanEquipments().Empty(0);
        int local_10 = local_7;
        for (; local_10 <= local_9; )
        {
            this.GetAvatar();
            this.GetModify_TalismanEquipments().Add(TEUIModelRef<FVM_AvatarEquipment>(local_14));
            ++local_10;
        }
        this.SetFoundationNode(::FMS_Talent::Get(this.GetManager()).GetFoundationNodeByAvatarID(local_17));
        return;
    }
    TEUIModelRef<FM_Avatar> GetAvatar() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Avatar;
    }
    void SetAvatar(const TEUIModelRef<FM_Avatar> &inout __Value) property
    {
        TEUIModelRef<FM_Avatar> local_2;
        local_2 = this.m_Avatar;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Avatar = __Value;
        return;
    }
    int GetSlotIndex() const property
    {
        this.TrackPropertyRead(1);
        return this.m_SlotIndex;
    }
    void SetSlotIndex(const int __Value) property
    {
        if (this.m_SlotIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SlotIndex = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarEquipment> GetAvatarEquipment() const property
    {
        this.TrackPropertyRead(2);
        return this.m_AvatarEquipment;
    }
    void SetAvatarEquipment(const TEUIModelRef<FVM_AvatarEquipment> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarEquipment> local_2;
        local_2 = this.m_AvatarEquipment;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_AvatarEquipment = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_AvatarEquipment>> GetTalismanEquipments() const property
    {
        const TArray<TEUIModelRef<FVM_AvatarEquipment>> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<TEUIModelRef<FVM_AvatarEquipment>> GetModify_TalismanEquipments() property
    {
        TArray<TEUIModelRef<FVM_AvatarEquipment>> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetTalismanEquipments(const TArray<TEUIModelRef<FVM_AvatarEquipment>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_TalismanEquipments = __Value;
        return;
    }
    TEUIModelRef<FM_TalentNode> GetFoundationNode() const property
    {
        this.TrackPropertyRead(4);
        return this.m_FoundationNode;
    }
    void SetFoundationNode(const TEUIModelRef<FM_TalentNode> &inout __Value) property
    {
        TEUIModelRef<FM_TalentNode> local_2;
        local_2 = this.m_FoundationNode;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_FoundationNode = __Value;
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
    const FSlateBrush GetDisplayIconLarge() const property
    {
        const FSlateBrush __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FSlateBrush GetModify_DisplayIconLarge() property
    {
        FSlateBrush __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetDisplayIconLarge(const FSlateBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_DisplayIconLarge = __Value;
        return;
    }
    const FSlateBrush GetUnlockedDisplayIconLarge() const property
    {
        const FSlateBrush __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FSlateBrush GetModify_UnlockedDisplayIconLarge() property
    {
        FSlateBrush __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetUnlockedDisplayIconLarge(const FSlateBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_UnlockedDisplayIconLarge = __Value;
        return;
    }
    EAvatarIllustrate GetIllustrate() const property
    {
        this.TrackPropertyRead(8);
        return this.m_Illustrate;
    }
    void SetIllustrate(const EAvatarIllustrate __Value) property
    {
        if (int(this.m_Illustrate) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_Illustrate = __Value;
        return;
    }
    const FSlateBrush GetIllustrateIcon() const property
    {
        const FSlateBrush __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    FSlateBrush GetModify_IllustrateIcon() property
    {
        FSlateBrush __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetIllustrateIcon(const FSlateBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_IllustrateIcon = __Value;
        return;
    }
    const FText GetIllustrateDisplayName() const property
    {
        const FText __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    FText GetModify_IllustrateDisplayName() property
    {
        FText __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetIllustrateDisplayName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_IllustrateDisplayName = __Value;
        return;
    }
    const FSoftBrush GetIllustrateBackgroundIcon() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    FSoftBrush GetModify_IllustrateBackgroundIcon() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetIllustrateBackgroundIcon(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_IllustrateBackgroundIcon = __Value;
        return;
    }
    const FSoftBrush GetIllustrateBackgroundActiveIcon() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(12);
        return __r;
    }
    FSoftBrush GetModify_IllustrateBackgroundActiveIcon() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(12);
        return __r;
    }
    void SetIllustrateBackgroundActiveIcon(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_IllustrateBackgroundActiveIcon = __Value;
        return;
    }
    const FSoftBrush GetClassIcon() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(13);
        return __r;
    }
    FSoftBrush GetModify_ClassIcon() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(13);
        return __r;
    }
    void SetClassIcon(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_ClassIcon = __Value;
        return;
    }
    const FSlateBrush GetDamageTypeIcon() const property
    {
        const FSlateBrush __r;
        this.TrackPropertyRead(14);
        return __r;
    }
    FSlateBrush GetModify_DamageTypeIcon() property
    {
        FSlateBrush __r;
        this.MarkPropertyDirty(14);
        return __r;
    }
    void SetDamageTypeIcon(const FSlateBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_DamageTypeIcon = __Value;
        return;
    }
    const FSoftBrush GetWeaponTypeIcon() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(15);
        return __r;
    }
    FSoftBrush GetModify_WeaponTypeIcon() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(15);
        return __r;
    }
    void SetWeaponTypeIcon(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_WeaponTypeIcon = __Value;
        return;
    }
    const FText GetWeaponTypeDisplayName() const property
    {
        const FText __r;
        this.TrackPropertyRead(16);
        return __r;
    }
    FText GetModify_WeaponTypeDisplayName() property
    {
        FText __r;
        this.MarkPropertyDirty(16);
        return __r;
    }
    void SetWeaponTypeDisplayName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_WeaponTypeDisplayName = __Value;
        return;
    }
    FText GetNickName() const property
    {
        FText __r;
        this.TrackPropertyRead(17);
        return __r;
    }
    FText GetModify_NickName() property
    {
        FText __r;
        this.MarkPropertyDirty(17);
        return __r;
    }
    void SetNickName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_NickName = __Value;
        return;
    }
    TEUIModelRef<FMS_PlayerAvatarData> GetPlayerAvatarData() const property
    {
        this.TrackPropertyRead(18);
        return this.m_PlayerAvatarData;
    }
    void SetPlayerAvatarData(const TEUIModelRef<FMS_PlayerAvatarData> &inout __Value) property
    {
        TEUIModelRef<FMS_PlayerAvatarData> local_2;
        local_2 = this.m_PlayerAvatarData;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(18);
        this.m_PlayerAvatarData = __Value;
        return;
    }
    TEUIModelRef<FMS_CombatSettingData> GetCombatSettingData() const property
    {
        this.TrackPropertyRead(19);
        return this.m_CombatSettingData;
    }
    void SetCombatSettingData(const TEUIModelRef<FMS_CombatSettingData> &inout __Value) property
    {
        TEUIModelRef<FMS_CombatSettingData> local_2;
        local_2 = this.m_CombatSettingData;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(19);
        this.m_CombatSettingData = __Value;
        return;
    }
}

struct FVM_AvatarInfoExtend : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_AvatarInfoDisplayState;
    UPROPERTY()
    bool m_bShowDisplayState;

    FVM_AvatarInfoExtend()
    {
        this.m_AvatarInfoDisplayState = 0;
        this.m_bShowDisplayState = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_AvatarInfoExtend(const FVM_AvatarInfoExtend &inout Other)
    {
        this.m_AvatarInfoDisplayState = 0;
        this.m_bShowDisplayState = true;
        this.m_AvatarInfoDisplayState = int(Other.m_AvatarInfoDisplayState);
        this.m_bShowDisplayState = Other.m_bShowDisplayState;
        return;
    }
    FVM_AvatarInfoExtend opAssign(const FVM_AvatarInfoExtend &inout Other)
    {
        FVM_AvatarInfoExtend __r;
        this.m_AvatarInfoDisplayState = int(Other.m_AvatarInfoDisplayState);
        this.m_bShowDisplayState = Other.m_bShowDisplayState;
        return __r;
    }
    int GetAvatarInfoDisplayState() const property
    {
        this.TrackPropertyRead(0);
        return this.m_AvatarInfoDisplayState;
    }
    void SetAvatarInfoDisplayState(const int __Value) property
    {
        if (this.m_AvatarInfoDisplayState == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_AvatarInfoDisplayState = __Value;
        return;
    }
    bool GetbShowDisplayState() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bShowDisplayState;
    }
    void SetbShowDisplayState(const bool __Value) property
    {
        if (!(this.m_bShowDisplayState) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bShowDisplayState = __Value;
        return;
    }
}

struct FVM_AvatarSpecialtyInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FAvatarPrefabConfig> m_AvatarConfig;
    UPROPERTY()
    FText m_DisplayName;
    UPROPERTY()
    FSoftBrush m_WeaponTypeIcon;
    UPROPERTY()
    FSoftBrush m_PlayerClassIcon;
    UPROPERTY()
    bool m_bIsMainPlayer;
    UPROPERTY()
    bool m_bIsHover;
    UPROPERTY()
    FOnHoverCommonChanged m_OnHoverChanged;

    FVM_AvatarSpecialtyInfo()
    {
        this.m_bIsMainPlayer = false;
        this.m_bIsHover = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_AvatarSpecialtyInfo' by default constructor.");
        return;
    }
    FVM_AvatarSpecialtyInfo(const FVM_AvatarSpecialtyInfo &inout Other)
    {
        this.m_bIsMainPlayer = false;
        this.m_bIsHover = false;
        this.m_AvatarConfig = Other.m_AvatarConfig;
        this.m_DisplayName = Other.m_DisplayName;
        this.m_WeaponTypeIcon = Other.m_WeaponTypeIcon;
        this.m_PlayerClassIcon = Other.m_PlayerClassIcon;
        this.m_bIsMainPlayer = Other.m_bIsMainPlayer;
        this.m_bIsHover = Other.m_bIsHover;
        return;
    }
    FVM_AvatarSpecialtyInfo(const TDataObjectPtr<FAvatarPrefabConfig> &inout InAvatarConfig)
    {
        this.m_bIsMainPlayer = false;
        this.m_bIsHover = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetAvatarConfig(InAvatarConfig);
        return;
    }
    FVM_AvatarSpecialtyInfo opAssign(const FVM_AvatarSpecialtyInfo &inout Other)
    {
        FVM_AvatarSpecialtyInfo __r;
        this.m_AvatarConfig = Other.m_AvatarConfig;
        this.m_DisplayName = Other.m_DisplayName;
        this.m_WeaponTypeIcon = Other.m_WeaponTypeIcon;
        this.m_PlayerClassIcon = Other.m_PlayerClassIcon;
        this.m_bIsMainPlayer = Other.m_bIsMainPlayer;
        this.m_bIsHover = Other.m_bIsHover;
        return __r;
    }
    void PostConstruct()
    {
        int local_2 = 0;
        if (this.GetAvatarConfig().IsSet())
        {
            bool local_1 = false;
            this.SetbIsHover(local_1);
            this.SetbIsMainPlayer(local_1);
            this.SetWeaponTypeIcon(::FASCommonUtils::GetWeaponTypeDisplayBrush(EWeaponType(local_2)));
        }
        return;
    }
    void OnHoverChanged(const bool bHovered)
    {
        this.SetbIsHover(bHovered);
        FEUIWidgetModelCallbackBuilder::MakeCallback(FEUIModelRef(this), FVM_AvatarSpecialtyInfo::ExecuteOnHoverChanged).EnqueueCallback();
        return;
    }
    void ExecuteOnHoverChanged()
    {
        if (this.GetOnHoverChanged().IsBound())
        {
            this.GetOnHoverChanged().Execute(this.GetbIsHover());
        }
        return;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetAvatarConfig() const property
    {
        TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetModify_AvatarConfig() property
    {
        TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetAvatarConfig(const TDataObjectPtr<FAvatarPrefabConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_AvatarConfig = __Value;
        return;
    }
    FText GetDisplayName() const property
    {
        FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_DisplayName() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetDisplayName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_DisplayName = __Value;
        return;
    }
    const FSoftBrush GetWeaponTypeIcon() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FSoftBrush GetModify_WeaponTypeIcon() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetWeaponTypeIcon(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_WeaponTypeIcon = __Value;
        return;
    }
    const FSoftBrush GetPlayerClassIcon() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FSoftBrush GetModify_PlayerClassIcon() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetPlayerClassIcon(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_PlayerClassIcon = __Value;
        return;
    }
    bool GetbIsMainPlayer() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bIsMainPlayer;
    }
    void SetbIsMainPlayer(const bool __Value) property
    {
        if (!(this.m_bIsMainPlayer) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bIsMainPlayer = __Value;
        return;
    }
    bool GetbIsHover() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bIsHover;
    }
    void SetbIsHover(const bool __Value) property
    {
        if (!(this.m_bIsHover) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bIsHover = __Value;
        return;
    }
    const FOnHoverCommonChanged GetOnHoverChanged() const property
    {
        const FOnHoverCommonChanged __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FOnHoverCommonChanged GetModify_OnHoverChanged() property
    {
        FOnHoverCommonChanged __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetOnHoverChanged(const FOnHoverCommonChanged &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        return;
    }
}

struct FVM_AvatarDetailInfo_SkillSelect : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_TalentEditSkillBtn> m_SkillInfo;

    FVM_AvatarDetailInfo_SkillSelect()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_AvatarDetailInfo_SkillSelect(const FVM_AvatarDetailInfo_SkillSelect &inout Other)
    {
        this.m_SkillInfo = Other.m_SkillInfo;
        return;
    }
    FVM_AvatarDetailInfo_SkillSelect& opAssign(const FVM_AvatarDetailInfo_SkillSelect &inout Other)
    {
        return Other.m_SkillInfo;
    }
    TEUIModelRef<FVM_TalentEditSkillBtn> GetSkillInfo() const property
    {
        this.TrackPropertyRead(0);
        return this.m_SkillInfo;
    }
    void SetSkillInfo(const TEUIModelRef<FVM_TalentEditSkillBtn> &inout __Value) property
    {
        TEUIModelRef<FVM_TalentEditSkillBtn> local_2;
        local_2 = this.m_SkillInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_SkillInfo = __Value;
        return;
    }
}

struct FVM_AvatarDetailSkillSelect : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_TalentEditSkillBtn> m_SkillInfo;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarDetailInfo_SkillSelect> m_SelectInfo;
    UPROPERTY()
    bool m_bHover;

    FVM_AvatarDetailSkillSelect()
    {
        this.m_bHover = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_AvatarDetailSkillSelect' by default constructor.");
        return;
    }
    FVM_AvatarDetailSkillSelect(const FVM_AvatarDetailSkillSelect &inout Other)
    {
        this.m_bHover = false;
        this.m_SkillInfo = Other.m_SkillInfo;
        this.m_SelectInfo = Other.m_SelectInfo;
        this.m_bHover = Other.m_bHover;
        return;
    }
    FVM_AvatarDetailSkillSelect(const TEUIModelRef<FVM_TalentEditSkillBtn> &inout InSkillInfo, const TEUIModelRef<FVM_AvatarDetailInfo_SkillSelect> &inout InSelectInfo)
    {
        this.m_bHover = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSkillInfo(InSkillInfo);
        this.SetSelectInfo(InSelectInfo);
        return;
    }
    FVM_AvatarDetailSkillSelect opAssign(const FVM_AvatarDetailSkillSelect &inout Other)
    {
        FVM_AvatarDetailSkillSelect __r;
        this.m_SkillInfo = Other.m_SkillInfo;
        this.m_SelectInfo = Other.m_SelectInfo;
        this.m_bHover = Other.m_bHover;
        return __r;
    }
    FText GetSkillName() const
    {
        TEUIModelRef<FVM_TalentEditSkillBtn> local_2 = this.GetSkillInfo();
        FText local_6;
        local_6.GetSkillName();
        return local_6;
    }
    FText GetSkillDesc() const
    {
        TEUIModelRef<FVM_TalentEditSkillBtn> local_2 = this.GetSkillInfo();
        FText local_6;
        local_6.GetSkillDesc();
        return local_6;
    }
    FText GetSkillShotDesc() const
    {
        TEUIModelRef<FVM_TalentEditSkillBtn> local_2 = this.GetSkillInfo();
        FText local_6;
        local_6.GetSkillTypeShotDesc();
        return local_6;
    }
    void SetHoverSkill(const bool InbHover)
    {
        if (InbHover)
        {
            TEUIModelRef<FVM_TalentEditSkillBtn> local_4;
            local_4 = this.GetSkillInfo();
            TEUIModelRef<FVM_AvatarDetailInfo_SkillSelect> local_2 = this.GetSelectInfo();
            local_4.SetSkillInfo();
        }
        else
        {
            TEUIModelRef<FVM_TalentEditSkillBtn> local_4;
            TEUIModelRef<FVM_AvatarDetailInfo_SkillSelect> local_2_2 = this.GetSelectInfo();
            local_4.SetSkillInfo();
        }
        this.SetbHover(InbHover);
        return;
    }
    void GoToSkillDetial()
    {
        if (!(this.GetSkillInfo().IsValid()))
        {
            return;
        }
        TEUIModelRef<FVM_TalentEditSkillBtn> local_2 = this.GetSkillInfo();
        if (!(::FVM_TalentEditPage::CanViewAvatarTalent(this.GetContext().Manager, GetAvatarConfig())))
        {
            return;
        }
        TEUIModelRef<FVM_TalentEditSkillBtn> local_2_2 = this.GetSkillInfo();
        OnAvatarSkillDetialSelect();
        return;
    }
    TEUIModelRef<FVM_TalentEditSkillBtn> GetSkillInfo() const property
    {
        this.TrackPropertyRead(0);
        return this.m_SkillInfo;
    }
    void SetSkillInfo(const TEUIModelRef<FVM_TalentEditSkillBtn> &inout __Value) property
    {
        TEUIModelRef<FVM_TalentEditSkillBtn> local_2;
        local_2 = this.m_SkillInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_SkillInfo = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarDetailInfo_SkillSelect> GetSelectInfo() const property
    {
        this.TrackPropertyRead(1);
        return this.m_SelectInfo;
    }
    void SetSelectInfo(const TEUIModelRef<FVM_AvatarDetailInfo_SkillSelect> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarDetailInfo_SkillSelect> local_2;
        local_2 = this.m_SelectInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SelectInfo = __Value;
        return;
    }
    bool GetbHover() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bHover;
    }
    void SetbHover(const bool __Value) property
    {
        if (!(this.m_bHover) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bHover = __Value;
        return;
    }
}

struct FMsg_AvatarDetailInfoChanged : FEUIMessage
{
    UPROPERTY()
    bool bDisplayAttributeOrSkill = false;


}

struct FMsg_AvatarDetailPopInfo : FEUIMessage
{
    UPROPERTY()
    bool bIsOpen = false;


}

struct FVM_AvatarDetailPopInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarInfo> m_AvatarInfo;
    UPROPERTY()
    int m_PopIndex;

    FVM_AvatarDetailPopInfo()
    {
        this.m_PopIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_AvatarDetailPopInfo' by default constructor.");
        return;
    }
    FVM_AvatarDetailPopInfo(const FVM_AvatarDetailPopInfo &inout Other)
    {
        this.m_PopIndex = 0;
        this.m_AvatarInfo = Other.m_AvatarInfo;
        this.m_PopIndex = int(Other.m_PopIndex);
        return;
    }
    FVM_AvatarDetailPopInfo(const TEUIModelRef<FVM_AvatarInfo> &inout InAvatarInfo)
    {
        this.m_PopIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetAvatarInfo(InAvatarInfo);
        return;
    }
    FVM_AvatarDetailPopInfo opAssign(const FVM_AvatarDetailPopInfo &inout Other)
    {
        FVM_AvatarDetailPopInfo __r;
        this.m_AvatarInfo = Other.m_AvatarInfo;
        this.m_PopIndex = int(Other.m_PopIndex);
        return __r;
    }
    void PostConstruct()
    {
        FEUIModelRef local_6 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        FMsg_AvatarDetailPopInfo local_8;
        local_8.bIsOpen = true;
        return;
    }
    void BeginDestroy()
    {
        FEUIModelRef local_6 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        FMsg_AvatarDetailPopInfo local_8;
        local_8.bIsOpen = false;
        return;
    }
    FText GetPopTitleName() const
    {
        FText local_10;
        if (this.GetPopIndex() == 0)
        {
            TEUIModelRef<FVM_AvatarInfo> local_6 = this.GetAvatarInfo();
            local_10.GetNickNameText();
            return local_10;
        }
        if (this.GetPopIndex() == 1)
        {
            return NSLOCTEXT("Avatar", "AvatarDetailPopInfoSkill", "е±ћжЂ§иЇ¦жѓ…");
        }
        if (this.GetPopIndex() == 2)
        {
            return NSLOCTEXT("Avatar", "AvatarDetailPopInfoTrait", "иЇЌжќЎиЇ¦жѓ…");
        }
        return local_10;
    }
    FText GetPopContent() const
    {
        FText local_10;
        if (this.GetPopIndex() == 0)
        {
            TEUIModelRef<FVM_AvatarInfo> local_6 = this.GetAvatarInfo();
            local_10.GetAvatarBackgroundDesc();
            return local_10;
        }
        return local_10;
    }
    TEUIModelRef<FVM_AvatarInfo> GetAvatarInfo() const property
    {
        this.TrackPropertyRead(0);
        return this.m_AvatarInfo;
    }
    void SetAvatarInfo(const TEUIModelRef<FVM_AvatarInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarInfo> local_2;
        local_2 = this.m_AvatarInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_AvatarInfo = __Value;
        return;
    }
    int GetPopIndex() const property
    {
        this.TrackPropertyRead(1);
        return this.m_PopIndex;
    }
    void SetPopIndex(const int __Value) property
    {
        if (this.m_PopIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_PopIndex = __Value;
        return;
    }
}

struct FVM_AvatarDetailInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_TraitInfo>> m_AvatarTraitList;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_TraitInfoHover>> m_TraitHoverList;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_AttributeDisplay>> m_AvatarAttributeList;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_AttributeDisplay>> m_AvatarAllAttributeList;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_AvatarDetailSkillSelect>> m_AvatarSkillInfoList;
    UPROPERTY()
    TEUIModelRef<FVM_TalentSkillInfoItem> m_SelectSkillInfo;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarDetailInfo_SkillSelect> m_SelectInfoVM;
    UPROPERTY()
    TEUIModelRef<FM_Avatar> m_CurrentAvatar;
    UPROPERTY()
    EGameModeType m_PanelGameMode;
    UPROPERTY()
    bool m_bCanDisplayAttribute;
    UPROPERTY()
    bool m_bCanDisplayTrait;
    UPROPERTY()
    bool m_bDisplayAttributeOrSkill;
    UPROPERTY()
    bool m_bHasHoverSkill;

    FVM_AvatarDetailInfo()
    {
        this.m_PanelGameMode = EGameModeType(0);
        this.m_bCanDisplayAttribute = true;
        this.m_bCanDisplayTrait = true;
        this.m_bDisplayAttributeOrSkill = false;
        this.m_bHasHoverSkill = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_AvatarDetailInfo(const FVM_AvatarDetailInfo &inout Other)
    {
        this.m_PanelGameMode = EGameModeType(0);
        this.m_bCanDisplayAttribute = true;
        this.m_bCanDisplayTrait = true;
        this.m_bDisplayAttributeOrSkill = false;
        this.m_bHasHoverSkill = false;
        this.m_AvatarTraitList = Other.m_AvatarTraitList;
        this.m_TraitHoverList = Other.m_TraitHoverList;
        this.m_AvatarAttributeList = Other.m_AvatarAttributeList;
        this.m_AvatarAllAttributeList = Other.m_AvatarAllAttributeList;
        this.m_AvatarSkillInfoList = Other.m_AvatarSkillInfoList;
        this.m_SelectSkillInfo = Other.m_SelectSkillInfo;
        this.m_SelectInfoVM = Other.m_SelectInfoVM;
        this.m_CurrentAvatar = Other.m_CurrentAvatar;
        this.m_PanelGameMode = Other.m_PanelGameMode;
        this.m_bCanDisplayAttribute = Other.m_bCanDisplayAttribute;
        this.m_bCanDisplayTrait = Other.m_bCanDisplayTrait;
        this.m_bDisplayAttributeOrSkill = Other.m_bDisplayAttributeOrSkill;
        this.m_bHasHoverSkill = Other.m_bHasHoverSkill;
        return;
    }
    FVM_AvatarDetailInfo opAssign(const FVM_AvatarDetailInfo &inout Other)
    {
        FVM_AvatarDetailInfo __r;
        this.m_AvatarTraitList = Other.m_AvatarTraitList;
        this.m_TraitHoverList = Other.m_TraitHoverList;
        this.m_AvatarAttributeList = Other.m_AvatarAttributeList;
        this.m_AvatarAllAttributeList = Other.m_AvatarAllAttributeList;
        this.m_AvatarSkillInfoList = Other.m_AvatarSkillInfoList;
        this.m_SelectSkillInfo = Other.m_SelectSkillInfo;
        this.m_SelectInfoVM = Other.m_SelectInfoVM;
        this.m_CurrentAvatar = Other.m_CurrentAvatar;
        this.m_PanelGameMode = Other.m_PanelGameMode;
        this.m_bCanDisplayAttribute = Other.m_bCanDisplayAttribute;
        this.m_bCanDisplayTrait = Other.m_bCanDisplayTrait;
        this.m_bDisplayAttributeOrSkill = Other.m_bDisplayAttributeOrSkill;
        this.m_bHasHoverSkill = Other.m_bHasHoverSkill;
        return __r;
    }
    void PostConstruct()
    {
        this.SetSelectInfoVM(TEUIModelRef<FVM_AvatarDetailInfo_SkillSelect>(::FVM_AvatarDetailInfo_SkillSelect::Create(this.GetContext().Manager)));
        return;
    }
    void OnSkillItemHover(const FVM_TalentEditSkillBtn &inout SkillItem)
    {
        if (SkillItem && SkillItem.GetTalentNode().IsValid())
        {
            UAvatarMappingSettings local_8 = ::UAvatarMappingSettings::Get();
            TDataObjectPtr<FAvatarMappingConfig> local_32;
            if (local_8 != nullptr)
            {
                TEUIModelRef<FM_Avatar> local_34 = this.GetCurrentAvatar();
                local_32 = local_8.GetMappingConfigOfAvatar(GetAvatarConfig());
            }
            TEUIModelWeakRef<FM_TalentNode> local_2 = SkillItem.GetTalentNode();
            TEUIModelRef<FM_TalentNode> local_86;
            TEUIModelRef<FVM_TalentSkillInfoItem> local_88 = TEUIModelRef<FVM_TalentSkillInfoItem>(::FVM_TalentSkillInfoItem::Create(this.GetContext().Manager, local_32, local_86, ESkillSlot(0), ETalentInfoShowPageType(0)));
            this.SetSelectSkillInfo(local_88);
            int local_84 = int(SkillItem.GetSkillButtonSlot());
            TEUIModelRef<FVM_TalentSkillInfoItem> local_88_2 = this.GetSelectSkillInfo();
            SetEnterButtonSlot();
            if (SkillItem.GetForceSetSkillInitConfig().IsSet())
            {
                TEUIModelRef<FVM_TalentSkillInfoItem> local_88_3 = this.GetSelectSkillInfo();
                SkillItem.GetForceSetSkillInitConfig().SetSkillInitConfigOverride();
            }
        }
        return;
    }
    void RefreshSelectSkill()
    {
        this.UpdateSkillDetialInfo();
        return;
    }
    void UpdateSkillDetialInfo()
    {
        bool local_1 = false;
        for (auto& local_16 : this.GetAvatarSkillInfoList())
        {
            local_16;
            if (GetbHover())
            {
                local_1 = true;
                TEUIModelRef<FVM_TalentEditSkillBtn> local_18;
                local_18.GetSkillInfo();
                this.OnSkillItemHover();
                break;
            }
        }
        if (!(this.GetbHasHoverSkill()) != !(local_1))
        {
            this.SetbHasHoverSkill(local_1);
        }
        return;
    }
    void TrySetShowAttributeOrSkill(const bool bShowAttributeOrSkill)
    {
        this.SetbDisplayAttributeOrSkill(bShowAttributeOrSkill);
        if (this.GetCurrentAvatar().IsValid())
        {
            TEUIModelRef<FM_Avatar> local_2 = this.GetCurrentAvatar();
            if (!(GetbIsUnlocked()))
            {
                this.SetbDisplayAttributeOrSkill(false);
            }
        }
        return;
    }
    TEUIModelRef<FVM_DivineSkillInfo> GetPvpEquipedDivineSkill() const
    {
        if (!(!(this.GetCurrentAvatar().IsValid())) && this.GetCurrentAvatar().opArrow().GetAvatarConfig())
        {
            FMS_DivineSkillData& local_6 = ::FMS_DivineSkillData::Get(this.GetContext().Manager);
            TDataObjectPtr<FDivineSkillConfig> local_32 = local_6.GetPvpAvatarEquipedDivineSkill(this.GetCurrentAvatar().opArrow().GetAvatarConfig().opArrow().DataId);
            if (local_32)
            {
                return TEUIModelRef<FVM_DivineSkillInfo>(::FVM_DivineSkillInfo::Create(this.GetContext().Manager, local_6.GetLocalPlayerDivineSkillModel(local_32)));
            }
        }
        return TEUIModelRef<FVM_DivineSkillInfo>(nullptr);
    }
    void OnAvatarSkillChanged(const FMsg_AvatarEquipmentChanged &inout Msg)
    {
        this.DoRefresh();
        return;
    }
    void Monitor_OnPlayerSkillChange(const FC_Skill &inout Skill)
    {
        this.DoRefresh();
        return;
    }
    void DoRefresh()
    {
        this.UpdateAvatarTraitList();
        this.UpdateAvatarAttributeList();
        this.UpdateAvatarSkillList();
        return;
    }
    void OnTalentDataUpdated(const FMsg_TalentTreeDataUpdate &inout Msg)
    {
        this.UpdateAvatarSkillList();
        return;
    }
    void UpdateAvatarAttributeList()
    {
        int local_110 = 0;
        if (!(this.GetCurrentAvatar()))
        {
            return;
        }
        this.GetModify_AvatarAllAttributeList().Reset(0);
        this.GetModify_AvatarAttributeList().Reset(0);
        FECSEntity local_8 = FECSEntity(ENTITY_NULL);
        TDataObjectPtr<FAvatarPrefabConfig> local_36 = ::GetAvatarConfig(this.GetContext().GetLocalPlayerPawn());
        TEUIModelRef<FM_Avatar> local_2 = this.GetCurrentAvatar();
        FDataObjectPtr local_60;
        local_60;
        if ((local_36 == local_60))
        {
            local_8 = this.GetContext().GetLocalPlayerPawn();
        }
        TArray<TEUIModelRef<FVM_AttributeDisplay>> local_64;
        TArray<TDataObjectPtr<FAttributeConfig>> local_70 = ::FAttributeConfig::GetAttributeConfigsByShowType(4 | 2);
        for (auto& local_88 : local_70)
        {
            if (local_88.IsSet())
            {
                FM_Attribute& local_108;
                if (local_8.IsValid())
                {
                }
                UEUIManagerSubsystem local_106 = this.GetManager();
                local_108.SetAttributeConfig(local_88);
                TEUIModelRef<FM_Attribute> local_112 = TEUIModelRef<FM_Attribute>(local_108);
                if (0 == 2)
                {
                    this.GetModify_AvatarAttributeList().Add(TEUIModelRef<FVM_AttributeDisplay>(local_110));
                }
                else
                {
                    local_64.Add(TEUIModelRef<FVM_AttributeDisplay>(local_110));
                }
                if (!(this.GetbCanDisplayAttribute()))
                {
                    this.SetbCanDisplayAttribute(true);
                }
            }
        }
        this.GetModify_AvatarAllAttributeList().Append(this.GetAvatarAttributeList());
        this.GetModify_AvatarAllAttributeList().Append(local_64);
        return;
    }
    void UpdateAvatarTraitList()
    {
        int local_5 = 0;
        FM_Trait& local_112;
        int local_161;
        int64 local_190;
        FDataObjectPtr local_238;
        int local_252 = 0;
        this.SetbCanDisplayTrait(false);
        if (!(this.GetCurrentAvatar()))
        {
            return;
        }
        this.GetModify_AvatarTraitList().Reset(0);
        TMap<EEquipSlotType, FDSAvatarEquipmentInfo> local_26;
        FECSEntity local_30 = this.GetContext().GetLocalPlayer();
        Get local_34;
        const FC_DSPlayerAvatarInfo& local_36 = local_34.opCall();
        if (local_36)
        {
            for (auto& local_50 : local_36.GetAvatarList())
            {
                TEUIModelRef<FM_Avatar> local_4 = this.GetCurrentAvatar();
                if (local_50.GetAvatarId() == GetAvatarConfig().opArrow().DataId)
                {
                    local_26 = local_50.GetEquipmentInfos();
                    break;
                }
            }
        }
        TMap<TDataObjectPtr<FTraitConfig>, int> local_72;
        for (auto& local_90 : local_26)
        {
            local_90;
            TEUIModelRef<FM_Equipment> local_94 = ::FMS_EquipmentDataCache::Get(this.GetContext().Manager).GetEquipment(GetGuid());
            for (auto& local_110 : GetEquipmentTraits())
            {
                local_110;
                TDataObjectPtr<FTraitConfig> local_136 = local_112.GetTraitConfig();
                local_161 = local_112.GetTraitLevel();
                int local_164 = local_72.FindOrAdd(local_136);
                local_5 = int(local_164);
                local_5 = local_5 + local_161;
                local_164 = local_5;
            }
        }
        TEUIModelRef<FM_Trait> local_186;
        for (auto& local_182 : local_72)
        {
            local_186 = TEUIModelRef<FM_Trait>(::FM_Trait::Create(this.GetContext().Manager, local_182.GetKey(), local_5));
            TEUIModelRef<FVM_TraitInfo> local_184 = TEUIModelRef<FVM_TraitInfo>(::FVM_TraitInfo::Create(this.GetContext().Manager, local_186));
            GetModify_TraitSourceList().Reset(0);
            for (auto& local_90 : local_26)
            {
                local_90;
                local_190 = GetGuid();
                TEUIModelRef<FM_Equipment> local_96 = ::FMS_EquipmentDataCache::Get(this.GetContext().Manager).GetEquipment(local_190);
                for (auto& local_110 : GetEquipmentTraits())
                {
                    local_110;
                    TDataObjectPtr<FTraitConfig> local_160;
                    local_160 = GetTraitConfig();
                    local_238;
                    if ((!((local_160 == local_238))))
                    {
                        continue;
                    }
                    TEUIModelRef<FVM_TraitSourceInfo> local_240 = TEUIModelRef<FVM_TraitSourceInfo>(::FVM_TraitSourceInfo::Create(this.GetContext().Manager, local_96, GetTraitLevel()));
                    if (local_190 != 0)
                    {
                        TEUIModelRef<FVM_CommonItem> local_246 = TEUIModelRef<FVM_CommonItem>(::FVM_CommonItem::Create(this.GetContext().Manager, ::FMS_ItemDataCache::Get(this.GetContext().Manager).RequireItemData(local_190)));
                        local_246.SetCommonItem();
                    }
                    GetModify_TraitSourceList().Add(local_240);
                }
            }
            this.GetModify_AvatarTraitList().Add(local_184);
        }
        this.GetModify_TraitHoverList().Reset(0);
        local_161 = 0;
        for (; local_161 < this.GetAvatarTraitList().Num(); )
        {
            local_186.GetTrait();
            TEUIModelRef<FVM_AvatarEquipmentTraitHoverTips> local_254 = local_252.GetTraitHoverTips();
            GetTraitSourceList().SetTraitSourceList();
            this.GetModify_TraitHoverList().Add(TEUIModelRef<FVM_TraitInfoHover>(local_252));
            ++local_161;
        }
        this.SetbCanDisplayTrait((this.GetModify_AvatarTraitList().Num() > 0));
        return;
    }
    void UpdateAvatarSkillList()
    {
        const FSkillInitConfig& local_142;
        int local_227 = 0;
        int local_254;
        this.SetbHasHoverSkill(false);
        if (!(this.GetCurrentAvatar()))
        {
            return;
        }
        TEUIModelRef<FM_Avatar> local_4 = this.GetCurrentAvatar();
        TDataObjectPtr<FAvatarPrefabConfig> local_28 = GetAvatarConfig();
        this.GetModify_AvatarSkillInfoList().Reset(0);
        TMap<ESkillSlot, TDataObjectPtr<FSkillInitConfig>> local_74;
        if (local_28 && (int(this.GetPanelGameMode()) == 1))
        {
            TDataObjectPtr<FPVPOverrideAvatarConfig> local_102 = GetPVPOverride();
            if (local_102)
            {
                for (auto& local_140 : GetSkills())
                {
                    if (!(local_140))
                    {
                        continue;
                    }
                    if (local_74.Contains(local_142.DefaultSkillSlot))
                    {
                        continue;
                    }
                    local_74.Add(local_142.DefaultSkillSlot, local_140);
                }
            }
        }
        FMS_Talent& local_144 = ::FMS_Talent::Get(this.GetContext().Manager);
        UAvatarMappingSettings local_148 = ::UAvatarMappingSettings::Get();
        bool local_1 = !((local_148 != nullptr));
        if (local_1)
        {
            return;
        }
        TDataObjectPtr<FAvatarMappingConfig> local_172 = local_148.GetMappingConfigOfAvatar(local_28);
        if (!(local_172))
        {
            return;
        }
        TEUIModelRef<FM_Avatar> local_4_2 = this.GetCurrentAvatar();
        bool local_77 = GetbIsUnlocked();
        bool local_197 = local_77;
        FAvatarEquippedTalentInfo local_226;
        if (local_197)
        {
            local_144.GetAvatarEquippedTalentInfo(local_227, local_226);
        }
        TArray<ESkillSlot> local_232 = ::FSkillUIUtils::GetAvatarAllSkillSlots(local_28);
        for (auto local_249 : local_232)
        {
            TEUIModelWeakRef<FM_TalentNode> local_252;
            if (local_197)
            {
                if (int(local_249) == 1 || (int(local_249) == 2))
                {
                    if (int(local_249) == 1)
                    {
                        local_254 = ESkillType(3);
                    }
                    else
                    {
                        local_254 = ESkillType(4);
                    }
                    TArray<TEUIModelRef<FM_TalentNode>> local_260 = local_144.GetActiveTalentNodeListByType(local_172, ESkillType(local_254));
                    for (auto& local_278 : local_260)
                    {
                        local_278;
                        if (int(GetTalentType()) != 6)
                        {
                            local_1 = false;
                        }
                        else
                        {
                            TDataObjectPtr<FTalentConfig> local_304;
                            local_304.GetConfig(0);
                            local_1 = (local_227 == int(local_226.FoundationId));
                        }
                        if (local_1)
                        {
                            TEUIModelWeakRef<FM_TalentNode> local_308;
                            local_252 = local_308;
                            break;
                        }
                    }
                }
                else
                {
                    int local_309 = int(local_249);
                    if (local_226.SlotToTalentId.Contains(local_309))
                    {
                        local_252 = local_144.GetNodeByTalentId(local_226.SlotToTalentId[local_309]);
                    }
                }
            }
            else
            {
                local_252 = local_144.GetPreviewTalentNodeBySlot(local_28, ESkillSlot(local_249));
            }
            TEUIModelRef<FVM_TalentEditSkillBtn> local_312 = TEUIModelRef<FVM_TalentEditSkillBtn>(::FVM_TalentEditSkillBtn::Create(this.GetContext().Manager, local_28, local_252));
            TDataObjectPtr<FSkillInitConfig> local_338;
            if (!(local_74.Find(local_249, local_338)))
            {
                local_77 = false;
            }
            else
            {
                local_77 = local_338;
            }
            if (local_77)
            {
                local_338.SetForceSkillInitConfig();
            }
            if (local_197 && local_252.IsValid())
            {
                ESkillType local_255 = GetEffectiveSkillType();
                if (int(local_255) != 0)
                {
                    (local_144.GetActiveTalentNodeListByType(local_172, ESkillType(local_255)).Num() > 1).SetbCanChange();
                }
            }
            else
            {
                false.SetbCanChange();
            }
            TEUIModelRef<FVM_AvatarDetailSkillSelect> local_340 = TEUIModelRef<FVM_AvatarDetailSkillSelect>(::FVM_AvatarDetailSkillSelect::Create(this.GetContext().Manager, local_312, this.GetSelectInfoVM()));
            this.GetModify_AvatarSkillInfoList().Add(local_340);
        }
        return;
    }
    void SwitchDisplayAttributeOrSkill()
    {
        this.SetbDisplayAttributeOrSkill(!(this.GetbDisplayAttributeOrSkill()));
        this.PublishAvatarDetailInfoChanged();
        return;
    }
    void PublishAvatarDetailInfoChanged()
    {
        FEUIModelRef local_6 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        FMsg_AvatarDetailInfoChanged local_8;
        local_8.bDisplayAttributeOrSkill = this.GetbDisplayAttributeOrSkill();
        return;
    }
    const TArray<TEUIModelRef<FVM_TraitInfo>> GetAvatarTraitList() const property
    {
        const TArray<TEUIModelRef<FVM_TraitInfo>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<TEUIModelRef<FVM_TraitInfo>> GetModify_AvatarTraitList() property
    {
        TArray<TEUIModelRef<FVM_TraitInfo>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetAvatarTraitList(const TArray<TEUIModelRef<FVM_TraitInfo>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_AvatarTraitList = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_TraitInfoHover>> GetTraitHoverList() const property
    {
        const TArray<TEUIModelRef<FVM_TraitInfoHover>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FVM_TraitInfoHover>> GetModify_TraitHoverList() property
    {
        TArray<TEUIModelRef<FVM_TraitInfoHover>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetTraitHoverList(const TArray<TEUIModelRef<FVM_TraitInfoHover>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TraitHoverList = __Value;
        return;
    }
    TArray<TEUIModelRef<FVM_AttributeDisplay>> GetAvatarAttributeList() const property
    {
        TArray<TEUIModelRef<FVM_AttributeDisplay>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<TEUIModelRef<FVM_AttributeDisplay>> GetModify_AvatarAttributeList() property
    {
        TArray<TEUIModelRef<FVM_AttributeDisplay>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetAvatarAttributeList(const TArray<TEUIModelRef<FVM_AttributeDisplay>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_AvatarAttributeList = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_AttributeDisplay>> GetAvatarAllAttributeList() const property
    {
        const TArray<TEUIModelRef<FVM_AttributeDisplay>> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<TEUIModelRef<FVM_AttributeDisplay>> GetModify_AvatarAllAttributeList() property
    {
        TArray<TEUIModelRef<FVM_AttributeDisplay>> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetAvatarAllAttributeList(const TArray<TEUIModelRef<FVM_AttributeDisplay>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_AvatarAllAttributeList = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_AvatarDetailSkillSelect>> GetAvatarSkillInfoList() const property
    {
        const TArray<TEUIModelRef<FVM_AvatarDetailSkillSelect>> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<TEUIModelRef<FVM_AvatarDetailSkillSelect>> GetModify_AvatarSkillInfoList() property
    {
        TArray<TEUIModelRef<FVM_AvatarDetailSkillSelect>> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetAvatarSkillInfoList(const TArray<TEUIModelRef<FVM_AvatarDetailSkillSelect>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_AvatarSkillInfoList = __Value;
        return;
    }
    TEUIModelRef<FVM_TalentSkillInfoItem> GetSelectSkillInfo() const property
    {
        this.TrackPropertyRead(5);
        return this.m_SelectSkillInfo;
    }
    void SetSelectSkillInfo(const TEUIModelRef<FVM_TalentSkillInfoItem> &inout __Value) property
    {
        TEUIModelRef<FVM_TalentSkillInfoItem> local_2;
        local_2 = this.m_SelectSkillInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_SelectSkillInfo = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarDetailInfo_SkillSelect> GetSelectInfoVM() const property
    {
        this.TrackPropertyRead(6);
        return this.m_SelectInfoVM;
    }
    void SetSelectInfoVM(const TEUIModelRef<FVM_AvatarDetailInfo_SkillSelect> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarDetailInfo_SkillSelect> local_2;
        local_2 = this.m_SelectInfoVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_SelectInfoVM = __Value;
        return;
    }
    TEUIModelRef<FM_Avatar> GetCurrentAvatar() const property
    {
        this.TrackPropertyRead(7);
        return this.m_CurrentAvatar;
    }
    void SetCurrentAvatar(const TEUIModelRef<FM_Avatar> &inout __Value) property
    {
        TEUIModelRef<FM_Avatar> local_2;
        local_2 = this.m_CurrentAvatar;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_CurrentAvatar = __Value;
        return;
    }
    EGameModeType GetPanelGameMode() const property
    {
        this.TrackPropertyRead(8);
        return this.m_PanelGameMode;
    }
    void SetPanelGameMode(const EGameModeType __Value) property
    {
        if (int(this.m_PanelGameMode) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_PanelGameMode = __Value;
        return;
    }
    bool GetbCanDisplayAttribute() const property
    {
        this.TrackPropertyRead(9);
        return this.m_bCanDisplayAttribute;
    }
    void SetbCanDisplayAttribute(const bool __Value) property
    {
        if (!(this.m_bCanDisplayAttribute) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_bCanDisplayAttribute = __Value;
        return;
    }
    bool GetbCanDisplayTrait() const property
    {
        this.TrackPropertyRead(10);
        return this.m_bCanDisplayTrait;
    }
    void SetbCanDisplayTrait(const bool __Value) property
    {
        if (!(this.m_bCanDisplayTrait) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_bCanDisplayTrait = __Value;
        return;
    }
    bool GetbDisplayAttributeOrSkill() const property
    {
        this.TrackPropertyRead(11);
        return this.m_bDisplayAttributeOrSkill;
    }
    void SetbDisplayAttributeOrSkill(const bool __Value) property
    {
        if (!(this.m_bDisplayAttributeOrSkill) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_bDisplayAttributeOrSkill = __Value;
        return;
    }
    bool GetbHasHoverSkill() const property
    {
        this.TrackPropertyRead(12);
        return this.m_bHasHoverSkill;
    }
    void SetbHasHoverSkill(const bool __Value) property
    {
        if (!(this.m_bHasHoverSkill) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_bHasHoverSkill = __Value;
        return;
    }
}

struct FAvatarListSorter
{
    FAvatarListSorter()
    {
        return;
    }
    bool opCall(const TEUIModelRef<FVM_AvatarInfo> &inout AvatarA, const TEUIModelRef<FVM_AvatarInfo> &inout AvatarB)
    {
        bool local_7;
        int local_9 = 0;
        int local_89 = 0;
        TEUIModelRef<FM_Avatar> local_4;
        local_4.GetAvatar();
        if (local_4)
        {
            local_4.GetAvatar();
            local_7 = GetbIsUnlocked();
        }
        else
        {
            local_7 = false;
        }
        int local_8 = local_7 ? 1 : 0;
        local_4.GetAvatar();
        bool local_6 = local_4;
        if (local_6)
        {
            local_4.GetAvatar();
            local_7 = GetbIsUnlocked();
        }
        else
        {
            local_6 = false;
            local_7 = local_6;
        }
        int local_1 = local_7 ? 1 : 0;
        if (local_8 != local_1)
        {
            return (local_8 > local_1);
        }
        TDataObjectPtr<FAvatarPrefabConfig> local_34 = GetAvatarConfig();
        TDataObjectPtr<FAvatarPrefabConfig> local_82 = GetAvatarConfig();
        int local_10 = (local_34 && local_6) ? 1 : 0;
        int local_83 = (local_82 && local_6) ? 1 : 0;
        if (local_10 != local_83)
        {
            return (local_10 > local_83);
        }
        int local_84 = local_34 ? local_9 : 0;
        int local_85 = local_82 ? local_9 : 0;
        if (local_84 != local_85)
        {
            return (local_84 > local_85);
        }
        int local_88 = local_34 ? local_89 : 0;
        int local_87 = local_82 ? local_89 : 0;
        return (local_88 < local_87);
    }
}

struct FVMS_PlayerOwnedAvatarInfo : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    TEUIModelRef<FVMS_PlayerOwnedAvatarInfo> m_Instance;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_AvatarInfo>> m_UnLockAvatarList;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_AvatarInfo>> m_CurrentTeamAvatars;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_AvatarInfo>> m_AllConfigAvatars;
    UPROPERTY()
    TEUIModelRef<FMS_PlayerAvatarData> m_PlayerAvatarData;
    UPROPERTY()
    EGenderType m_Gender;
    UPROPERTY()
    uint m_PendingShowTIpsAvatarDataId;

    FVMS_PlayerOwnedAvatarInfo()
    {
        this.m_Gender = EGenderType(0);
        this.m_PendingShowTIpsAvatarDataId = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_PlayerOwnedAvatarInfo(const FVMS_PlayerOwnedAvatarInfo &inout Other)
    {
        this.m_Gender = EGenderType(0);
        this.m_PendingShowTIpsAvatarDataId = 0;
        this.m_Instance = Other.m_Instance;
        this.m_UnLockAvatarList = Other.m_UnLockAvatarList;
        this.m_CurrentTeamAvatars = Other.m_CurrentTeamAvatars;
        this.m_AllConfigAvatars = Other.m_AllConfigAvatars;
        this.m_PlayerAvatarData = Other.m_PlayerAvatarData;
        this.m_Gender = Other.m_Gender;
        this.m_PendingShowTIpsAvatarDataId = int(Other.m_PendingShowTIpsAvatarDataId);
        return;
    }
    FVMS_PlayerOwnedAvatarInfo opAssign(const FVMS_PlayerOwnedAvatarInfo &inout Other)
    {
        FVMS_PlayerOwnedAvatarInfo __r;
        this.m_Instance = Other.m_Instance;
        this.m_UnLockAvatarList = Other.m_UnLockAvatarList;
        this.m_CurrentTeamAvatars = Other.m_CurrentTeamAvatars;
        this.m_AllConfigAvatars = Other.m_AllConfigAvatars;
        this.m_PlayerAvatarData = Other.m_PlayerAvatarData;
        this.m_Gender = Other.m_Gender;
        this.m_PendingShowTIpsAvatarDataId = int(Other.m_PendingShowTIpsAvatarDataId);
        return __r;
    }
    void PostConstruct()
    {
        this.SetGender(::FASCommonUtils::GetLocalPlayerGender());
        this.SetPlayerAvatarData(TEUIModelRef<FMS_PlayerAvatarData>(::FMS_PlayerAvatarData::Get(this.GetManager())));
        this.InitAllAvatars();
        this.UpdateAvatarList();
        this.UpdateTeamAvatars();
        this.SetInstance(TEUIModelRef<FVMS_PlayerOwnedAvatarInfo>(this));
        return;
    }
    void OnDSPlayerInfoChanged(const FC_DSPlayerInfo &inout PlayerInfo)
    {
        this.SetGender(::FASCommonUtils::GetLocalPlayerGender());
        this.InitAllAvatars();
        this.UpdateAvatarList();
        this.UpdateTeamAvatars();
        return;
    }
    void UpdateAvatarList()
    {
        ::FMS_PlayerData::Get(this.GetManager()).GetLocalPlayerData();
        int local_8 = GetPlayerSpecialtyID();
        TArray<TEUIModelRef<FVM_AvatarInfo>> local_12;
        TEUIModelRef<FMS_PlayerAvatarData> local_14 = this.GetPlayerAvatarData();
        for (auto& local_34 : GetOwnedAvatars())
        {
            local_34;
            FAvatarPrefabConfig local_700;
            if (local_700.bAlwaysHidden)
            {
                continue;
            }
            if (local_700.bIsMainPlayer && (int(local_700.GenderType) != (int(this.GetGender())) || (int(local_700.DataId) != local_8)))
            {
                continue;
            }
            local_12.Add(TEUIModelRef<FVM_AvatarInfo>(::FVM_AvatarInfo::Create(this.GetManager())));
        }
        if (!((local_12 == this.GetUnLockAvatarList())))
        {
            this.SetUnLockAvatarList(local_12);
        }
        return;
    }
    void UpdateTeamAvatars()
    {
        this.GetModify_CurrentTeamAvatars().Empty(0);
        TEUIModelRef<FMS_PlayerAvatarData> local_4 = this.GetPlayerAvatarData();
        for (auto& local_20 : GetCurrentAvatars())
        {
            TEUIModelRef<FVM_AvatarInfo> local_22 = TEUIModelRef<FVM_AvatarInfo>(::FVM_AvatarInfo::Create(this.GetManager(), local_20));
            this.GetModify_CurrentTeamAvatars().Add(local_22);
        }
        for (auto& local_40 : this.GetUnLockAvatarList())
        {
            local_40;
            RefreshSlotIndex();
        }
        return;
    }
    void OnUnlockAvatar(const FMsg_UnlockAvatar &inout Msg)
    {
        TDataObjectPtr<FAvatarPrefabConfig> local_26 = ::FAvatarPrefabConfig::GetByDataId(int(Msg.AvatarDataId));
        if (local_26.IsSet())
        {
            this.ShowUnlockAvatarTips(local_26);
        }
        return;
    }
    void InitAllAvatars()
    {
        TEUIModelRef<FM_Avatar> local_96;
        TArray<FAvatarPrefabConfig> local_8 = ::FAvatarPrefabConfig::GetAll();
        ::FMS_PlayerData::Get(this.GetManager()).GetLocalPlayerData();
        int local_16 = GetPlayerSpecialtyID();
        TArray<TEUIModelRef<FVM_AvatarInfo>> local_20;
        for (auto& local_36 : local_8)
        {
            if (local_36.bAlwaysHidden)
            {
                continue;
            }
            if (local_36.bIsMainPlayer && (int(local_36.GenderType) != int(this.GetGender())))
            {
                continue;
            }
            TDataObjectPtr<FAvatarPrefabConfig> local_90 = ::FAvatarPrefabConfig::GetByDataId(int(local_36.DataId));
            TEUIModelRef<FMS_PlayerAvatarData> local_94 = this.GetPlayerAvatarData();
            local_96.FindAvatar(local_90);
            if (local_96)
            {
                local_20.Add(TEUIModelRef<FVM_AvatarInfo>(::FVM_AvatarInfo::Create(this.GetManager(), local_96)));
            }
            else
            {
                TEUIModelRef<FM_Avatar> local_100 = TEUIModelRef<FM_Avatar>(::FM_Avatar::Create(this.GetManager(), local_90));
                false.SetbIsUnlocked();
                local_20.Add(TEUIModelRef<FVM_AvatarInfo>(::FVM_AvatarInfo::Create(this.GetManager(), local_100)));
            }
        }
        this.SetAllConfigAvatars(local_20);
        return;
    }
    void OpenUnlockAvatar()
    {
        int local_1 = this.GetPendingShowTIpsAvatarDataId();
        if (local_1 != 0)
        {
            TEUIModelRef<FVM_AvatarInfo> local_6;
            for (auto& local_20 : this.GetAllConfigAvatars())
            {
                if (0 == this.GetPendingShowTIpsAvatarDataId())
                {
                    local_6 = local_20;
                    break;
                }
            }
            if (local_6.IsValid())
            {
                FVM_MainMenuAvatar& local_22 = ::FVM_MainMenuAvatar::Create(this.GetManager());
                local_22.SetCurrentSelectedAvatar(local_6);
                FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_Avatar_Main, FEUIModelRef(local_22));
            }
        }
        this.SetPendingShowTIpsAvatarDataId(0);
        return;
    }
    void ShowUnlockAvatarTips(const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig)
    {
        const UAvatarBuildSettings local_4;
        int local_9 = 0;
        if (!(AvatarConfig.IsSet()))
        {
            return;
        }
        GetGameplaySettings<UAvatarBuildSettings> local_6;
        local_4 = local_6;
        if ((!((local_4 != nullptr))))
        {
            return;
        }
        this.SetPendingShowTIpsAvatarDataId(local_9);
        FSimpleModelEvent local_86;
        local_86.Add(this, FVMS_PlayerOwnedAvatarInfo::OpenUnlockAvatar);
        FInputActionListConstructParam local_90;
        local_90.InputActionListConstructParamItems.Add(FInputActionListConstructParamItem(FEUIInputAction(local_4.UnlockNewAvatarTipsConfirmAction), local_86));
        FCommonHintParam local_220;
        local_220.LifetimeOverride = local_4.UnlockNewAvatarTipsTimeDuration;
        return;
    }
    TEUIModelRef<FVMS_PlayerOwnedAvatarInfo> GetInstance() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Instance;
    }
    void SetInstance(const TEUIModelRef<FVMS_PlayerOwnedAvatarInfo> &inout __Value) property
    {
        TEUIModelRef<FVMS_PlayerOwnedAvatarInfo> local_2;
        local_2 = this.m_Instance;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Instance = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_AvatarInfo>> GetUnLockAvatarList() const property
    {
        const TArray<TEUIModelRef<FVM_AvatarInfo>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FVM_AvatarInfo>> GetModify_UnLockAvatarList() property
    {
        TArray<TEUIModelRef<FVM_AvatarInfo>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetUnLockAvatarList(const TArray<TEUIModelRef<FVM_AvatarInfo>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_UnLockAvatarList = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_AvatarInfo>> GetCurrentTeamAvatars() const property
    {
        const TArray<TEUIModelRef<FVM_AvatarInfo>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<TEUIModelRef<FVM_AvatarInfo>> GetModify_CurrentTeamAvatars() property
    {
        TArray<TEUIModelRef<FVM_AvatarInfo>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetCurrentTeamAvatars(const TArray<TEUIModelRef<FVM_AvatarInfo>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CurrentTeamAvatars = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_AvatarInfo>> GetAllConfigAvatars() const property
    {
        const TArray<TEUIModelRef<FVM_AvatarInfo>> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<TEUIModelRef<FVM_AvatarInfo>> GetModify_AllConfigAvatars() property
    {
        TArray<TEUIModelRef<FVM_AvatarInfo>> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetAllConfigAvatars(const TArray<TEUIModelRef<FVM_AvatarInfo>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_AllConfigAvatars = __Value;
        return;
    }
    TEUIModelRef<FMS_PlayerAvatarData> GetPlayerAvatarData() const property
    {
        this.TrackPropertyRead(4);
        return this.m_PlayerAvatarData;
    }
    void SetPlayerAvatarData(const TEUIModelRef<FMS_PlayerAvatarData> &inout __Value) property
    {
        TEUIModelRef<FMS_PlayerAvatarData> local_2;
        local_2 = this.m_PlayerAvatarData;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_PlayerAvatarData = __Value;
        return;
    }
    EGenderType GetGender() const property
    {
        this.TrackPropertyRead(5);
        return this.m_Gender;
    }
    void SetGender(const EGenderType __Value) property
    {
        if (int(this.m_Gender) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_Gender = __Value;
        return;
    }
    uint GetPendingShowTIpsAvatarDataId() const property
    {
        this.TrackPropertyRead(6);
        return this.m_PendingShowTIpsAvatarDataId;
    }
    void SetPendingShowTIpsAvatarDataId(const uint __Value) property
    {
        if (this.m_PendingShowTIpsAvatarDataId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_PendingShowTIpsAvatarDataId = __Value;
        return;
    }
}

struct __Lambda_UI_Private_ViewModel_InGame_Role_VM_AvatarInfo_802
{
    __Lambda_UI_Private_ViewModel_InGame_Role_VM_AvatarInfo_802()
    {
        return;
    }
    bool opCall(const TEUIModelRef<FVM_TraitInfo> &inout A, const TEUIModelRef<FVM_TraitInfo> &inout B)
    {
        int local_2 = GetTraitLevel();
        int local_1 = GetTraitLevel();
        if (local_2 != local_1)
        {
            return (local_2 > local_1);
        }
        TEUIModelRef<FM_Trait> local_6;
        local_6.GetTrait();
        TEUIModelRef<FM_Trait> local_8;
        local_8.GetTrait();
        return (0 > 0);
    }
}

struct __GeneratedProperties_FVM_AvatarInfo
{
    UPROPERTY()
    FText AvatarBackgroundDesc;
    UPROPERTY()
    bool IsUnLocked;
    UPROPERTY()
    FText SlotIndexDisplayText;
    UPROPERTY()
    FText DisplayName;
    UPROPERTY()
    FText NickNameText;
    UPROPERTY()
    bool IsCombatAvatar;
    UPROPERTY()
    int CombatIndex;
    UPROPERTY()
    int AvatarLockStateIndex;
    UPROPERTY()
    bool IsSpecialtyActive;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarInfo> Self;


}

struct __GeneratedProperties_FVM_AvatarInfoExtend
{
    UPROPERTY()
    TEUIModelRef<FVM_AvatarInfoExtend> Self;

    __GeneratedProperties_FVM_AvatarInfoExtend()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_AvatarSpecialtyInfo
{
    UPROPERTY()
    TEUIModelRef<FVM_AvatarSpecialtyInfo> Self;

    __GeneratedProperties_FVM_AvatarSpecialtyInfo()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_AvatarDetailInfo_SkillSelect
{
    UPROPERTY()
    TEUIModelRef<FVM_AvatarDetailInfo_SkillSelect> Self;

    __GeneratedProperties_FVM_AvatarDetailInfo_SkillSelect()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_AvatarDetailSkillSelect
{
    UPROPERTY()
    FText SkillName;
    UPROPERTY()
    FText SkillDesc;
    UPROPERTY()
    FText SkillShotDesc;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarDetailSkillSelect> Self;

    __GeneratedProperties_FVM_AvatarDetailSkillSelect()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_AvatarDetailPopInfo
{
    UPROPERTY()
    FText PopTitleName;
    UPROPERTY()
    FText PopContent;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarDetailPopInfo> Self;

    __GeneratedProperties_FVM_AvatarDetailPopInfo()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_AvatarDetailInfo
{
    UPROPERTY()
    TEUIModelRef<FVM_DivineSkillInfo> PvpEquipedDivineSkill;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarDetailInfo> Self;

    __GeneratedProperties_FVM_AvatarDetailInfo()
    {
        return;
    }
}

struct __GeneratedProperties_FVMS_PlayerOwnedAvatarInfo
{
    UPROPERTY()
    TEUIModelRef<FVMS_PlayerOwnedAvatarInfo> Self;

    __GeneratedProperties_FVMS_PlayerOwnedAvatarInfo()
    {
        return;
    }
}

namespace FVM_AvatarInfo
{
FVM_AvatarInfo& Create(const UObject ContextObject, const TEUIModelRef<FM_Avatar> &inout Avatar)
{
    return FVM_AvatarInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject), Avatar);
}
FVM_AvatarInfo CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Avatar> &inout Avatar)
{
    FVM_AvatarInfo __r;
    TEUIModelRef<FVM_AvatarInfo> local_6 = TEUIModelRef<FVM_AvatarInfo>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_AvatarInfo::ModelId, 0, Avatar));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "AvatarConfig";
    local_14.TypeName = "TDataObjectPtr<FAvatarPrefabConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayIconLarge";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "UnlockedDisplayIconLarge";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Illustrate";
    local_14.TypeName = "EAvatarIllustrate";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IllustrateIcon";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IllustrateDisplayName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IllustrateBackgroundIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IllustrateBackgroundActiveIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ClassIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DamageTypeIcon";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "WeaponTypeIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "WeaponTypeDisplayName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AvatarBackgroundDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsUnLocked";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SlotIndexDisplayText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "NickNameText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsCombatAvatar";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CombatIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AvatarLockStateIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsSpecialtyActive";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarInfo;
    FEUIModelMonitorDefine local_26;
    local_26.FunctionName = "__OnAvatarEquipmentChanged";
    local_26.ComponentType = FC_DSPlayerAvatarInfo;
    Result.MonitorFunctions.Add(local_26);
    FEUIModelMsgHandleDefine local_38;
    local_38.FunctionName = "__OnTalentDataUpdated";
    local_38.MessageTypeName = "Msg_TalentTreeDataUpdate";
    local_38.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_38);
    FEUIModelDirtyDefine local_50;
    local_50.FunctionName = "__RefreshAvatarIllustrateInfo";
    local_50.DirtyFlags.Set(FVM_AvatarInfo::__IndexOf_FoundationNode());
    Result.DirtyFunctions.Add(local_50);
    local_38.FunctionName = "__RefreshSlotIndexByMsg";
    local_38.MessageTypeName = "Msg_CombatSettingPresetUpdated";
    local_38.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_38);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarInfo;
}
void __OnAvatarEquipmentChanged(FVM_AvatarInfo &inout Model, const FECSEntity &inout Entity, const FC_DSPlayerAvatarInfo &inout Component)
{
    Model.OnAvatarEquipmentChanged(Component);
    return;
}
void __OnTalentDataUpdated(FVM_AvatarInfo &inout Model, const FMsg_TalentTreeDataUpdate &inout Message)
{
    Model.OnTalentDataUpdated(Message);
    return;
}
void __RefreshAvatarIllustrateInfo(FVM_AvatarInfo &inout Model)
{
    Model.RefreshAvatarIllustrateInfo();
    return;
}
void __RefreshSlotIndexByMsg(FVM_AvatarInfo &inout Model, const FMsg_CombatSettingPresetUpdated &inout Message)
{
    Model.RefreshSlotIndexByMsg(Message);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
TDataObjectPtr<FAvatarPrefabConfig> __UIGetter_AvatarConfig(const FVM_AvatarInfo &inout Model)
{
    return Model.GetAvatarConfig();
}
FSlateBrush __UIGetter_DisplayIconLarge(const FVM_AvatarInfo &inout Model)
{
    return Model.GetDisplayIconLarge();
}
FSlateBrush __UIGetter_UnlockedDisplayIconLarge(const FVM_AvatarInfo &inout Model)
{
    return Model.GetUnlockedDisplayIconLarge();
}
EAvatarIllustrate __UIGetter_Illustrate(const FVM_AvatarInfo &inout Model)
{
    return Model.GetIllustrate();
}
FSlateBrush __UIGetter_IllustrateIcon(const FVM_AvatarInfo &inout Model)
{
    return Model.GetIllustrateIcon();
}
FText __UIGetter_IllustrateDisplayName(const FVM_AvatarInfo &inout Model)
{
    return Model.GetIllustrateDisplayName();
}
FSoftBrush __UIGetter_IllustrateBackgroundIcon(const FVM_AvatarInfo &inout Model)
{
    return Model.GetIllustrateBackgroundIcon();
}
FSoftBrush __UIGetter_IllustrateBackgroundActiveIcon(const FVM_AvatarInfo &inout Model)
{
    return Model.GetIllustrateBackgroundActiveIcon();
}
FSoftBrush __UIGetter_ClassIcon(const FVM_AvatarInfo &inout Model)
{
    return Model.GetClassIcon();
}
FSlateBrush __UIGetter_DamageTypeIcon(const FVM_AvatarInfo &inout Model)
{
    return Model.GetDamageTypeIcon();
}
FSoftBrush __UIGetter_WeaponTypeIcon(const FVM_AvatarInfo &inout Model)
{
    return Model.GetWeaponTypeIcon();
}
FText __UIGetter_WeaponTypeDisplayName(const FVM_AvatarInfo &inout Model)
{
    return Model.GetWeaponTypeDisplayName();
}
FText __UIGetter_AvatarBackgroundDesc(const FVM_AvatarInfo &inout Model)
{
    return Model.GetAvatarBackgroundDesc();
}
bool __UIGetter_IsUnLocked(const FVM_AvatarInfo &inout Model)
{
    return Model.GetIsUnLocked();
}
FText __UIGetter_SlotIndexDisplayText(const FVM_AvatarInfo &inout Model)
{
    return Model.GetSlotIndexDisplayText();
}
FText __UIGetter_DisplayName(const FVM_AvatarInfo &inout Model)
{
    return Model.GetDisplayName();
}
FText __UIGetter_NickNameText(const FVM_AvatarInfo &inout Model)
{
    return Model.GetNickNameText();
}
bool __UIGetter_IsCombatAvatar(const FVM_AvatarInfo &inout Model)
{
    return Model.IsCombatAvatar();
}
int __UIGetter_CombatIndex(const FVM_AvatarInfo &inout Model)
{
    return Model.GetCombatIndex();
}
int __UIGetter_AvatarLockStateIndex(const FVM_AvatarInfo &inout Model)
{
    return Model.GetAvatarLockStateIndex();
}
bool __UIGetter_IsSpecialtyActive(const FVM_AvatarInfo &inout Model)
{
    return Model.IsSpecialtyActive();
}
TEUIModelRef<FVM_AvatarInfo> __UIGetter_Self(const FVM_AvatarInfo &inout Model)
{
    return TEUIModelRef<FVM_AvatarInfo>(Model);
}
int __IndexOf_Avatar()
{
    return 0;
}
int __IndexOf_SlotIndex()
{
    return 1;
}
int __IndexOf_AvatarEquipment()
{
    return 2;
}
int __IndexOf_TalismanEquipments()
{
    return 3;
}
int __IndexOf_FoundationNode()
{
    return 4;
}
int __IndexOf_AvatarConfig()
{
    return 5;
}
int __IndexOf_DisplayIconLarge()
{
    return 6;
}
int __IndexOf_UnlockedDisplayIconLarge()
{
    return 7;
}
int __IndexOf_Illustrate()
{
    return 8;
}
int __IndexOf_IllustrateIcon()
{
    return 9;
}
int __IndexOf_IllustrateDisplayName()
{
    return 10;
}
int __IndexOf_IllustrateBackgroundIcon()
{
    return 11;
}
int __IndexOf_IllustrateBackgroundActiveIcon()
{
    return 12;
}
int __IndexOf_ClassIcon()
{
    return 13;
}
int __IndexOf_DamageTypeIcon()
{
    return 14;
}
int __IndexOf_WeaponTypeIcon()
{
    return 15;
}
int __IndexOf_WeaponTypeDisplayName()
{
    return 16;
}
int __IndexOf_NickName()
{
    return 17;
}
int __IndexOf_PlayerAvatarData()
{
    return 18;
}
int __IndexOf_CombatSettingData()
{
    return 19;
}
}
namespace __GeneratedProperties_FVM_AvatarInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_AvatarInfoExtend
{
FVM_AvatarInfoExtend& Create(const UObject ContextObject)
{
    return FVM_AvatarInfoExtend::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_AvatarInfoExtend CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_AvatarInfoExtend __r;
    TEUIModelRef<FVM_AvatarInfoExtend> local_6 = TEUIModelRef<FVM_AvatarInfoExtend>(EUIInternal::MakeModelWithManager(Manager, FVM_AvatarInfoExtend::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "AvatarInfoDisplayState";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bShowDisplayState";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarInfoExtend>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarInfoExtend;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarInfoExtend;
}
int __UIGetter_AvatarInfoDisplayState(const FVM_AvatarInfoExtend &inout Model)
{
    return Model.GetAvatarInfoDisplayState();
}
bool __UIGetter_bShowDisplayState(const FVM_AvatarInfoExtend &inout Model)
{
    return Model.GetbShowDisplayState();
}
TEUIModelRef<FVM_AvatarInfoExtend> __UIGetter_Self(const FVM_AvatarInfoExtend &inout Model)
{
    return TEUIModelRef<FVM_AvatarInfoExtend>(Model);
}
int __IndexOf_AvatarInfoDisplayState()
{
    return 0;
}
int __IndexOf_bShowDisplayState()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_AvatarInfoExtend
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_AvatarSpecialtyInfo
{
FVM_AvatarSpecialtyInfo& Create(const UObject ContextObject, const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig)
{
    return FVM_AvatarSpecialtyInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject), AvatarConfig);
}
FVM_AvatarSpecialtyInfo CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig)
{
    FVM_AvatarSpecialtyInfo __r;
    TEUIModelRef<FVM_AvatarSpecialtyInfo> local_6 = TEUIModelRef<FVM_AvatarSpecialtyInfo>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_AvatarSpecialtyInfo::ModelId, 0, AvatarConfig));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "DisplayName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "WeaponTypeIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerClassIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsMainPlayer";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarSpecialtyInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarSpecialtyInfo;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarSpecialtyInfo;
}
FText __UIGetter_DisplayName(const FVM_AvatarSpecialtyInfo &inout Model)
{
    return Model.GetDisplayName();
}
FSoftBrush __UIGetter_WeaponTypeIcon(const FVM_AvatarSpecialtyInfo &inout Model)
{
    return Model.GetWeaponTypeIcon();
}
FSoftBrush __UIGetter_PlayerClassIcon(const FVM_AvatarSpecialtyInfo &inout Model)
{
    return Model.GetPlayerClassIcon();
}
bool __UIGetter_bIsMainPlayer(const FVM_AvatarSpecialtyInfo &inout Model)
{
    return Model.GetbIsMainPlayer();
}
TEUIModelRef<FVM_AvatarSpecialtyInfo> __UIGetter_Self(const FVM_AvatarSpecialtyInfo &inout Model)
{
    return TEUIModelRef<FVM_AvatarSpecialtyInfo>(Model);
}
int __IndexOf_AvatarConfig()
{
    return 0;
}
int __IndexOf_DisplayName()
{
    return 1;
}
int __IndexOf_WeaponTypeIcon()
{
    return 2;
}
int __IndexOf_PlayerClassIcon()
{
    return 3;
}
int __IndexOf_bIsMainPlayer()
{
    return 4;
}
int __IndexOf_bIsHover()
{
    return 5;
}
int __IndexOf_OnHoverChanged()
{
    return 6;
}
}
namespace __GeneratedProperties_FVM_AvatarSpecialtyInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_AvatarDetailInfo_SkillSelect
{
FVM_AvatarDetailInfo_SkillSelect& Create(const UObject ContextObject)
{
    return FVM_AvatarDetailInfo_SkillSelect::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_AvatarDetailInfo_SkillSelect CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_AvatarDetailInfo_SkillSelect __r;
    TEUIModelRef<FVM_AvatarDetailInfo_SkillSelect> local_6 = TEUIModelRef<FVM_AvatarDetailInfo_SkillSelect>(EUIInternal::MakeModelWithManager(Manager, FVM_AvatarDetailInfo_SkillSelect::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarDetailInfo_SkillSelect>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarDetailInfo_SkillSelect;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarDetailInfo_SkillSelect;
}
TEUIModelRef<FVM_AvatarDetailInfo_SkillSelect> __UIGetter_Self(const FVM_AvatarDetailInfo_SkillSelect &inout Model)
{
    return TEUIModelRef<FVM_AvatarDetailInfo_SkillSelect>(Model);
}
int __IndexOf_SkillInfo()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_AvatarDetailInfo_SkillSelect
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_AvatarDetailSkillSelect
{
FVM_AvatarDetailSkillSelect& Create(const UObject ContextObject, const TEUIModelRef<FVM_TalentEditSkillBtn> &inout SkillInfo, const TEUIModelRef<FVM_AvatarDetailInfo_SkillSelect> &inout SelectInfo)
{
    return FVM_AvatarDetailSkillSelect::CreateByManager(EUIInternal::GetContextManager(ContextObject), SkillInfo, SelectInfo);
}
FVM_AvatarDetailSkillSelect CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FVM_TalentEditSkillBtn> &inout SkillInfo, const TEUIModelRef<FVM_AvatarDetailInfo_SkillSelect> &inout SelectInfo)
{
    FVM_AvatarDetailSkillSelect __r;
    TEUIModelRef<FVM_AvatarDetailSkillSelect> local_6 = TEUIModelRef<FVM_AvatarDetailSkillSelect>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_AvatarDetailSkillSelect::ModelId, 0, SkillInfo, SelectInfo));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "SkillInfo";
    local_14.TypeName = "TEUIModelRef<FVM_TalentEditSkillBtn>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectInfo";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarDetailInfo_SkillSelect>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bHover";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillShotDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarDetailSkillSelect>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarDetailSkillSelect;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarDetailSkillSelect;
}
TEUIModelRef<FVM_TalentEditSkillBtn> __UIGetter_SkillInfo(const FVM_AvatarDetailSkillSelect &inout Model)
{
    return Model.GetSkillInfo();
}
TEUIModelRef<FVM_AvatarDetailInfo_SkillSelect> __UIGetter_SelectInfo(const FVM_AvatarDetailSkillSelect &inout Model)
{
    return Model.GetSelectInfo();
}
bool __UIGetter_bHover(const FVM_AvatarDetailSkillSelect &inout Model)
{
    return Model.GetbHover();
}
FText __UIGetter_SkillName(const FVM_AvatarDetailSkillSelect &inout Model)
{
    return Model.GetSkillName();
}
FText __UIGetter_SkillDesc(const FVM_AvatarDetailSkillSelect &inout Model)
{
    return Model.GetSkillDesc();
}
FText __UIGetter_SkillShotDesc(const FVM_AvatarDetailSkillSelect &inout Model)
{
    return Model.GetSkillShotDesc();
}
TEUIModelRef<FVM_AvatarDetailSkillSelect> __UIGetter_Self(const FVM_AvatarDetailSkillSelect &inout Model)
{
    return TEUIModelRef<FVM_AvatarDetailSkillSelect>(Model);
}
int __IndexOf_SkillInfo()
{
    return 0;
}
int __IndexOf_SelectInfo()
{
    return 1;
}
int __IndexOf_bHover()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_AvatarDetailSkillSelect
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_AvatarDetailPopInfo
{
FVM_AvatarDetailPopInfo& Create(const UObject ContextObject, const TEUIModelRef<FVM_AvatarInfo> &inout AvatarInfo)
{
    return FVM_AvatarDetailPopInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject), AvatarInfo);
}
FVM_AvatarDetailPopInfo CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FVM_AvatarInfo> &inout AvatarInfo)
{
    FVM_AvatarDetailPopInfo __r;
    TEUIModelRef<FVM_AvatarDetailPopInfo> local_6 = TEUIModelRef<FVM_AvatarDetailPopInfo>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_AvatarDetailPopInfo::ModelId, 0, AvatarInfo));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "PopIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PopTitleName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PopContent";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarDetailPopInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarDetailPopInfo;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarDetailPopInfo;
}
int __UIGetter_PopIndex(const FVM_AvatarDetailPopInfo &inout Model)
{
    return Model.GetPopIndex();
}
FText __UIGetter_PopTitleName(const FVM_AvatarDetailPopInfo &inout Model)
{
    return Model.GetPopTitleName();
}
FText __UIGetter_PopContent(const FVM_AvatarDetailPopInfo &inout Model)
{
    return Model.GetPopContent();
}
TEUIModelRef<FVM_AvatarDetailPopInfo> __UIGetter_Self(const FVM_AvatarDetailPopInfo &inout Model)
{
    return TEUIModelRef<FVM_AvatarDetailPopInfo>(Model);
}
int __IndexOf_AvatarInfo()
{
    return 0;
}
int __IndexOf_PopIndex()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_AvatarDetailPopInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_AvatarDetailInfo
{
FVM_AvatarDetailInfo& Create(const UObject ContextObject)
{
    return FVM_AvatarDetailInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_AvatarDetailInfo CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_AvatarDetailInfo __r;
    TEUIModelRef<FVM_AvatarDetailInfo> local_6 = TEUIModelRef<FVM_AvatarDetailInfo>(EUIInternal::MakeModelWithManager(Manager, FVM_AvatarDetailInfo::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarDetailInfo;
}
void __RefreshSelectSkill(FVM_AvatarDetailInfo &inout Model)
{
    Model.RefreshSelectSkill();
    return;
}
void __OnAvatarSkillChanged(FVM_AvatarDetailInfo &inout Model, const FMsg_AvatarEquipmentChanged &inout Message)
{
    Model.OnAvatarSkillChanged(Message);
    return;
}
void __Monitor_OnPlayerSkillChange(FVM_AvatarDetailInfo &inout Model, const FECSEntity &inout Entity, const FC_Skill &inout Component)
{
    Model.Monitor_OnPlayerSkillChange(Component);
    return;
}
void __DoRefresh(FVM_AvatarDetailInfo &inout Model)
{
    Model.DoRefresh();
    return;
}
void __OnTalentDataUpdated(FVM_AvatarDetailInfo &inout Model, const FMsg_TalentTreeDataUpdate &inout Message)
{
    Model.OnTalentDataUpdated(Message);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
TArray<TEUIModelRef<FVM_TraitInfo>> __UIGetter_AvatarTraitList(const FVM_AvatarDetailInfo &inout Model)
{
    return Model.GetAvatarTraitList();
}
TArray<TEUIModelRef<FVM_TraitInfoHover>> __UIGetter_TraitHoverList(const FVM_AvatarDetailInfo &inout Model)
{
    return Model.GetTraitHoverList();
}
TArray<TEUIModelRef<FVM_AttributeDisplay>> __UIGetter_AvatarAttributeList(const FVM_AvatarDetailInfo &inout Model)
{
    return Model.GetAvatarAttributeList();
}
TArray<TEUIModelRef<FVM_AttributeDisplay>> __UIGetter_AvatarAllAttributeList(const FVM_AvatarDetailInfo &inout Model)
{
    return Model.GetAvatarAllAttributeList();
}
TArray<TEUIModelRef<FVM_AvatarDetailSkillSelect>> __UIGetter_AvatarSkillInfoList(const FVM_AvatarDetailInfo &inout Model)
{
    return Model.GetAvatarSkillInfoList();
}
TEUIModelRef<FVM_TalentSkillInfoItem> __UIGetter_SelectSkillInfo(const FVM_AvatarDetailInfo &inout Model)
{
    return Model.GetSelectSkillInfo();
}
bool __UIGetter_bCanDisplayAttribute(const FVM_AvatarDetailInfo &inout Model)
{
    return Model.GetbCanDisplayAttribute();
}
bool __UIGetter_bCanDisplayTrait(const FVM_AvatarDetailInfo &inout Model)
{
    return Model.GetbCanDisplayTrait();
}
bool __UIGetter_bDisplayAttributeOrSkill(const FVM_AvatarDetailInfo &inout Model)
{
    return Model.GetbDisplayAttributeOrSkill();
}
bool __UIGetter_bHasHoverSkill(const FVM_AvatarDetailInfo &inout Model)
{
    return Model.GetbHasHoverSkill();
}
TEUIModelRef<FVM_DivineSkillInfo> __UIGetter_PvpEquipedDivineSkill(const FVM_AvatarDetailInfo &inout Model)
{
    return Model.GetPvpEquipedDivineSkill();
}
TEUIModelRef<FVM_AvatarDetailInfo> __UIGetter_Self(const FVM_AvatarDetailInfo &inout Model)
{
    return TEUIModelRef<FVM_AvatarDetailInfo>(Model);
}
int __IndexOf_AvatarTraitList()
{
    return 0;
}
int __IndexOf_TraitHoverList()
{
    return 1;
}
int __IndexOf_AvatarAttributeList()
{
    return 2;
}
int __IndexOf_AvatarAllAttributeList()
{
    return 3;
}
int __IndexOf_AvatarSkillInfoList()
{
    return 4;
}
int __IndexOf_SelectSkillInfo()
{
    return 5;
}
int __IndexOf_SelectInfoVM()
{
    return 6;
}
int __IndexOf_CurrentAvatar()
{
    return 7;
}
int __IndexOf_PanelGameMode()
{
    return 8;
}
int __IndexOf_bCanDisplayAttribute()
{
    return 9;
}
int __IndexOf_bCanDisplayTrait()
{
    return 10;
}
int __IndexOf_bDisplayAttributeOrSkill()
{
    return 11;
}
int __IndexOf_bHasHoverSkill()
{
    return 12;
}
}
namespace __GeneratedProperties_FVM_AvatarDetailInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVMS_PlayerOwnedAvatarInfo
{
FVMS_PlayerOwnedAvatarInfo& Get(const UObject ContextObject)
{
    return FVMS_PlayerOwnedAvatarInfo::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_PlayerOwnedAvatarInfo GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_PlayerOwnedAvatarInfo __r;
    TEUIModelRef<FVMS_PlayerOwnedAvatarInfo> local_6 = TEUIModelRef<FVMS_PlayerOwnedAvatarInfo>(EUIInternal::MakeModelWithManager(Manager, FVMS_PlayerOwnedAvatarInfo::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVMS_PlayerOwnedAvatarInfo;
}
void __OnDSPlayerInfoChanged(FVMS_PlayerOwnedAvatarInfo &inout Model, const FECSEntity &inout Entity, const FC_DSPlayerInfo &inout Component)
{
    Model.OnDSPlayerInfoChanged(Component);
    return;
}
void __UpdateAvatarList(FVMS_PlayerOwnedAvatarInfo &inout Model)
{
    Model.UpdateAvatarList();
    return;
}
void __UpdateTeamAvatars(FVMS_PlayerOwnedAvatarInfo &inout Model)
{
    Model.UpdateTeamAvatars();
    return;
}
void __OnUnlockAvatar(FVMS_PlayerOwnedAvatarInfo &inout Model, const FMsg_UnlockAvatar &inout Message)
{
    Model.OnUnlockAvatar(Message);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
TArray<TEUIModelRef<FVM_AvatarInfo>> __UIGetter_UnLockAvatarList(const FVMS_PlayerOwnedAvatarInfo &inout Model)
{
    return Model.GetUnLockAvatarList();
}
TArray<TEUIModelRef<FVM_AvatarInfo>> __UIGetter_CurrentTeamAvatars(const FVMS_PlayerOwnedAvatarInfo &inout Model)
{
    return Model.GetCurrentTeamAvatars();
}
TArray<TEUIModelRef<FVM_AvatarInfo>> __UIGetter_AllConfigAvatars(const FVMS_PlayerOwnedAvatarInfo &inout Model)
{
    return Model.GetAllConfigAvatars();
}
EGenderType __UIGetter_Gender(const FVMS_PlayerOwnedAvatarInfo &inout Model)
{
    return Model.GetGender();
}
TEUIModelRef<FVMS_PlayerOwnedAvatarInfo> __UIGetter_Self(const FVMS_PlayerOwnedAvatarInfo &inout Model)
{
    return TEUIModelRef<FVMS_PlayerOwnedAvatarInfo>(Model);
}
int __IndexOf_Instance()
{
    return 0;
}
int __IndexOf_UnLockAvatarList()
{
    return 1;
}
int __IndexOf_CurrentTeamAvatars()
{
    return 2;
}
int __IndexOf_AllConfigAvatars()
{
    return 3;
}
int __IndexOf_PlayerAvatarData()
{
    return 4;
}
int __IndexOf_Gender()
{
    return 5;
}
int __IndexOf_PendingShowTIpsAvatarDataId()
{
    return 6;
}
}
namespace __GeneratedProperties_FVMS_PlayerOwnedAvatarInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

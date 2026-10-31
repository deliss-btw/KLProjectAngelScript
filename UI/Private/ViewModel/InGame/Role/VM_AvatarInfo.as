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
        this.m_Illustrate = EAvatarIllustrate(0);
        this.m_SlotIndex = INDEX_NONE;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_AvatarInfo' by default constructor.");
        return;
    }
    FVM_AvatarInfo(const FVM_AvatarInfo &inout Other)
    {
        this.m_Illustrate = EAvatarIllustrate(0);
        this.m_SlotIndex = INDEX_NONE;
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
        this.m_CombatSettingData = Other.m_CombatSettingData;
        return;
    }
    FVM_AvatarInfo(const TEUIModelRef<FM_Avatar> &inout InAvatar)
    {
        this.m_Illustrate = EAvatarIllustrate(0);
        this.m_SlotIndex = INDEX_NONE;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetAvatar(InAvatar);
        return;
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
                const FAvatarPrefabConfig& local_16 = this.GetAvatarConfig().Get();
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
        return this.GetAvatarConfig().Get().AvatarBackgroundDesc;
    }
    bool GetIsUnLocked() const
    {
        return this.GetAvatar().opArrow().GetbIsUnlocked();
    }
    FText GetSlotIndexDisplayText() const
    {
        FText local_20;
        if (this.GetSlotIndex() == INDEX_NONE)
        {
            local_20 = FText();
        }
        else
        {
            local_20 = FText::Format(NSLOCTEXT("Avatar", "AvatarSlotIndex", "{0}."), (this.GetSlotIndex() + 1));
        }
        return local_20;
    }
    FText GetDisplayName() const
    {
        if (this.GetAvatarConfig().IsSet())
        {
            return this.GetAvatarConfig().Get().DisplayName;
        }
        return this.GetNickName();
    }
    FText GetNickNameText() const
    {
        return this.GetNickName();
    }
    bool IsCombatAvatar() const
    {
        int local_2 = INDEX_NONE;
        return (this.GetSlotIndex() != local_2);
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
        this.SetFoundationNode(::FMS_Talent::Get(this.GetManager()).GetFoundationNodeByAvatarID(this.GetAvatarConfig().Get().DataId));
        return;
    }
    bool IsSpecialtyActive() const
    {
        TEUIModelRef<FM_Player> local_4 = ::FMS_PlayerData::Get(this.GetManager()).GetLocalPlayerData();
        return (this.GetAvatar().opArrow().GetAvatarConfig().opArrow().DataId == local_4.Get().GetPlayerSpecialtyID());
    }
    void OnChangeSpecialty()
    {
        this.ChangeToSpecialty(false);
        return;
    }
    void ChangeToSpecialty(const bool bForceChangeRole = false)
    {
        int local_12 = 0;
        TEUIModelRef<FM_Avatar> local_2 = this.GetAvatar();
        if (local_2.IsNull() || !(this.GetAvatar().Get().GetAvatarConfig().IsSet()))
        {
            return;
        }
        bool local_5 = false;
        int local_7 = INDEX_NONE;
        int local_6 = local_7;
        TEUIModelRef<FMS_PlayerAvatarData> local_10 = this.GetPlayerAvatarData();
        int local_13 = 0;
        for (; local_13 < local_12.Num(); ++local_13)
        {
            if (local_12[local_13].IsValid() && local_12[local_13].Get().GetAvatarConfig().IsSet())
            {
                bool local_4 = local_12[local_13].Get().GetAvatarConfig().Get().bIsMainPlayer;
                if (local_4)
                {
                    local_5 = true;
                    local_6 = local_13;
                    break;
                }
            }
        }
        TEUIModelRef<FM_Avatar> local_2_2 = this.GetAvatar();
        int local_16 = local_2_2.Get().GetAvatarConfig().Get().DataId;
        int local_15 = local_16;
        TEUIModelRef<FM_Player> local_20 = ::FMS_PlayerData::Get(this.GetManager()).GetLocalPlayerData();
        if (local_20.IsNull())
        {
            return;
        }
        int local_16_2 = local_20.Get().GetPlayerSpecialtyID();
        if (local_5)
        {
            if (this.GetContext().GetLocalPlayer().IsValid())
            {
                FCE_ClientToServerChangeRole local_36;
                FFPTime local_34 = FFPTime(-1);
                FECSEntity local_28 = this.GetContext().GetLocalPlayer();
                local_36.SlotIndex = local_6;
                local_36.AvatarId = local_15;
                local_36.bForceChangeRole = bForceChangeRole;
            }
        }
        UGameClientConnectionSubsystem local_40 = ::UGameClientConnectionSubsystem::Get();
        if (!((local_40 != nullptr)) || !(local_40.IsConnectedToGameServer()))
        {
            FCE_ClientChangeSpecialty local_46;
            FFPTime local_34_2 = FFPTime(-1);
            FECSEntity local_28_2 = this.GetContext().GetLocalPlayer();
            local_46.FromAvatarId = local_16_2;
            local_46.ToAvatarId = local_15;
        }
        if (this.GetCombatSettingData().IsValid())
        {
            this.GetCombatSettingData().Get().GS_RequestSaveChangeMainAvatarSpecialty(local_16_2, local_15);
        }
        return;
    }
    void RefreshAvatarIllustrateInfo()
    {
        const UAvatarBuildSettings local_58;
        this.SetIllustrate(this.GetAvatarConfig().Get().AvatarIllustrate);
        if (this.GetFoundationNode().IsValid())
        {
            TDataObjectPtr<FTalentConfig> local_30 = this.GetFoundationNode().Get().GetNodeConfig(0);
            if (local_30.IsSet())
            {
                this.SetIllustrate(::FASCommonUtils::TalentDivisionToIllustrate(local_30.Get().TalentDivision));
            }
        }
        GetGameplaySettings<UAvatarBuildSettings> local_60;
        local_58 = local_60;
        if (local_58 != nullptr)
        {
            TRawPtr<FAvatarIllustrateInfo> local_66 = local_58.AvatarIllustrateInfos.Find(this.GetIllustrate());
            if (local_66)
            {
                this.SetIllustrateDisplayName(local_66.Get().DisplayName);
                this.SetIllustrateIcon(local_66.Get().Icon.LoadBrush());
                this.SetIllustrateBackgroundIcon(local_66.Get().BackgroundIcon);
                this.SetIllustrateBackgroundActiveIcon(local_66.Get().BackgroundActiveIcon);
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
                    if (this.GetCombatSettingData().Get().IsMainAvatar(this.GetAvatar().Get().GetAvatarConfig()))
                    {
                        this.SetSlotIndex(0);
                    }
                    else
                    {
                        if (this.GetCombatSettingData().Get().IsAssistAvatar(this.GetAvatar().Get().GetAvatarConfig()))
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
                if (local_16[local_17].IsValid() && local_16[local_17].Get().GetAvatarConfig().IsSet())
                {
                    if (local_16[local_17].Get().GetAvatarConfig().Get().DataId == this.GetAvatar().Get().GetAvatarConfig().Get().DataId)
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
        TEUIModelRef<FVM_AvatarEquipment> local_6 = TEUIModelRef<FVM_AvatarEquipment>(::FVM_AvatarEquipment::Create(this.GetContext().Manager, EEquipSlotType(1), this.GetAvatar()));
        this.SetAvatarEquipment(local_6);
        int local_7 = 2;
        int local_9 = 5;
        this.GetModify_TalismanEquipments().Empty(0);
        int local_10 = local_7;
        for (; local_10 <= local_9; )
        {
            TEUIModelRef<FM_Avatar> local_2 = this.GetAvatar();
            int local_3 = local_10;
            TEUIModelRef<FVM_AvatarEquipment> local_6_2 = TEUIModelRef<FVM_AvatarEquipment>(local_14);
            this.GetModify_TalismanEquipments().Add(local_6_2);
            ++local_10;
        }
        this.SetFoundationNode(::FMS_Talent::Get(this.GetManager()).GetFoundationNodeByAvatarID(this.GetAvatarConfig().Get().DataId));
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
        if (this.GetAvatarConfig().IsSet())
        {
            this.SetbIsHover(false);
            int local_1 = this.GetAvatarConfig().Get().bIsMainPlayer;
            this.SetbIsMainPlayer((local_1 != 0));
            this.SetDisplayName(this.GetAvatarConfig().Get().DisplayName);
            this.SetWeaponTypeIcon(::FASCommonUtils::GetWeaponTypeDisplayBrush(this.GetAvatarConfig().Get().WeaponType));
            this.SetPlayerClassIcon(this.GetAvatarConfig().Get().PlayerClassIcon);
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
        return this.GetSkillInfo().Get().GetSkillName();
    }
    FText GetSkillDesc() const
    {
        return this.GetSkillInfo().Get().GetSkillDesc();
    }
    FText GetSkillShotDesc() const
    {
        return this.GetSkillInfo().Get().GetSkillTypeShotDesc();
    }
    void SetHoverSkill(const bool InbHover)
    {
        if (InbHover)
        {
            TEUIModelRef<FVM_TalentEditSkillBtn> local_4;
            local_4 = this.GetSkillInfo();
            this.GetSelectInfo().Get().SetSkillInfo(local_4);
        }
        else
        {
            TEUIModelRef<FVM_TalentEditSkillBtn> local_4;
            this.GetSelectInfo().Get().SetSkillInfo(local_4);
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
        if (!(::FVM_TalentEditPage::CanViewAvatarTalent(this.GetContext().Manager, this.GetSkillInfo().Get().GetAvatarConfig())))
        {
            return;
        }
        this.GetSkillInfo().Get().OnAvatarSkillDetialSelect();
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
        if (this.GetPopIndex() == 0)
        {
            return this.GetAvatarInfo().Get().GetNickNameText();
        }
        if (this.GetPopIndex() == 1)
        {
            return NSLOCTEXT("Avatar", "AvatarDetailPopInfoSkill", "属性详情");
        }
        if (this.GetPopIndex() == 2)
        {
            return NSLOCTEXT("Avatar", "AvatarDetailPopInfoTrait", "词条详情");
        }
        return FText();
    }
    FText GetPopContent() const
    {
        if (this.GetPopIndex() == 0)
        {
            return this.GetAvatarInfo().Get().GetAvatarBackgroundDesc();
        }
        return FText();
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
                local_32 = local_8.GetMappingConfigOfAvatar(this.GetCurrentAvatar().Get().GetAvatarConfig());
            }
            TEUIModelRef<FM_TalentNode> local_86 = TEUIModelRef<FM_TalentNode>(SkillItem.GetTalentNode().Get());
            TEUIModelRef<FVM_TalentSkillInfoItem> local_88 = TEUIModelRef<FVM_TalentSkillInfoItem>(::FVM_TalentSkillInfoItem::Create(this.GetContext().Manager, local_32, local_86, ESkillSlot(0), ETalentInfoShowPageType(0)));
            this.SetSelectSkillInfo(local_88);
            TEUIModelRef<FVM_TalentSkillInfoItem> local_88_2 = this.GetSelectSkillInfo();
            local_88_2.Get().SetEnterButtonSlot(SkillItem.GetSkillButtonSlot());
            if (SkillItem.GetForceSetSkillInitConfig().IsSet())
            {
                TEUIModelRef<FVM_TalentSkillInfoItem> local_88_3 = this.GetSelectSkillInfo();
                local_88_3.Get().SetSkillInitConfigOverride(SkillItem.GetForceSetSkillInitConfig());
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
            if (local_16.Get().GetbHover())
            {
                local_1 = true;
                this.OnSkillItemHover(local_16.Get().GetSkillInfo().Get());
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
            if (!(this.GetCurrentAvatar().Get().GetbIsUnlocked()))
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
                float32 local_89 = 0.0f;
                if (local_8.IsValid())
                {
                    local_89 = FGameAttributeUtils::GetAttributeValue(local_8, local_88.Get().Attribute, this.GetContext().Time, false, 0.0f, false, FGameAttributeModificationValue());
                }
                FM_Attribute& local_108 = ::FM_Attribute::Create(this.GetManager(), local_88.Get().Attribute, EAttributeDisplayType(local_88.Get().DisplayType), local_89);
                local_108.SetAttributeConfig(local_88);
                TEUIModelRef<FM_Attribute> local_112 = TEUIModelRef<FM_Attribute>(local_108);
                if (int(local_88.Get().ShowType) == 2)
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
                if (local_50.GetAvatarId() == this.GetCurrentAvatar().Get().GetAvatarConfig().opArrow().DataId)
                {
                    local_26 = local_50.GetEquipmentInfos();
                    break;
                }
            }
        }
        TMap<TDataObjectPtr<FTraitConfig>, int> local_72;
        for (auto& local_90 : local_26)
        {
            for (auto& local_110 : ::FMS_EquipmentDataCache::Get(this.GetContext().Manager).GetEquipment(local_80.Proceed().GetValue().GetGuid()).Get().GetEquipmentTraits())
            {
                FM_Trait& local_112 = local_110.Get();
                TDataObjectPtr<FTraitConfig> local_136 = local_112.GetTraitConfig();
                local_161 = local_112.GetTraitLevel();
                int local_164 = (int(local_72.FindOrAdd(local_136)) + local_161);
            }
        }
        for (auto& local_182 : local_72)
        {
            TEUIModelRef<FVM_TraitInfo> local_184 = TEUIModelRef<FVM_TraitInfo>(::FVM_TraitInfo::Create(this.GetContext().Manager, (TEUIModelRef<FM_Trait>(::FM_Trait::Create(this.GetContext().Manager, local_182.GetKey(), local_182.GetValue())))));
            local_184.Get().GetModify_TraitSourceList().Reset(0);
            for (auto& local_90 : local_26)
            {
                local_190 = local_90.GetValue().GetGuid();
                TEUIModelRef<FM_Equipment> local_96 = ::FMS_EquipmentDataCache::Get(this.GetContext().Manager).GetEquipment(local_190);
                for (auto& local_110 : local_96.Get().GetEquipmentTraits())
                {
                    TDataObjectPtr<FTraitConfig> local_160;
                    local_160 = local_110.Get().GetTraitConfig();
                    local_238;
                    if ((!((local_160 == local_238))))
                    {
                        continue;
                    }
                    TEUIModelRef<FVM_TraitSourceInfo> local_240 = TEUIModelRef<FVM_TraitSourceInfo>(::FVM_TraitSourceInfo::Create(this.GetContext().Manager, local_96, local_110.Get().GetTraitLevel()));
                    if (local_190 != 0)
                    {
                        TEUIModelRef<FVM_CommonItem> local_246 = TEUIModelRef<FVM_CommonItem>(::FVM_CommonItem::Create(this.GetContext().Manager, ::FMS_ItemDataCache::Get(this.GetContext().Manager).RequireItemData(local_190)));
                        local_240.Get().SetCommonItem(local_246);
                    }
                    local_184.Get().GetModify_TraitSourceList().Add(local_240);
                }
            }
            this.GetModify_AvatarTraitList().Add(local_184);
        }
        __Lambda_UI_Private_ViewModel_InGame_Role_VM_AvatarInfo_802 local_248;
        this.GetModify_AvatarTraitList().Sort(local_248);
        this.GetModify_TraitHoverList().Reset(0);
        local_161 = 0;
        for (; local_161 < this.GetAvatarTraitList().Num(); )
        {
            TEUIModelRef<FM_Trait> local_186 = this.GetAvatarTraitList()[local_161].Get().GetTrait();
            local_252.GetTraitHoverTips().Get().SetTraitSourceList(this.GetAvatarTraitList()[local_161].Get().GetTraitSourceList());
            this.GetModify_TraitHoverList().Add(TEUIModelRef<FVM_TraitInfoHover>(local_252));
            ++local_161;
        }
        this.SetbCanDisplayTrait((this.GetModify_AvatarTraitList().Num() > 0));
        return;
    }
    void UpdateAvatarSkillList()
    {
        int local_254;
        this.SetbHasHoverSkill(false);
        if (!(this.GetCurrentAvatar()))
        {
            return;
        }
        TDataObjectPtr<FAvatarPrefabConfig> local_28 = this.GetCurrentAvatar().Get().GetAvatarConfig();
        this.GetModify_AvatarSkillInfoList().Reset(0);
        TMap<ESkillSlot, TDataObjectPtr<FSkillInitConfig>> local_74;
        if (local_28 && (int(this.GetPanelGameMode()) == 1))
        {
            TDataObjectPtr<FPVPOverrideAvatarConfig> local_102 = local_28.Get().GetPVPOverride();
            if (local_102)
            {
                for (auto& local_140 : local_102.Get().GetSkills())
                {
                    if (!(local_140))
                    {
                        continue;
                    }
                    const FSkillInitConfig& local_142 = local_140.Get();
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
        if (!((local_148 != nullptr)))
        {
            return;
        }
        TDataObjectPtr<FAvatarMappingConfig> local_172 = local_148.GetMappingConfigOfAvatar(local_28);
        if (!(local_172))
        {
            return;
        }
        bool local_77 = this.GetCurrentAvatar().Get().GetbIsUnlocked();
        bool local_197 = local_77;
        FAvatarEquippedTalentInfo local_226;
        if (local_197)
        {
            local_144.GetAvatarEquippedTalentInfo(local_172.Get().DataId, local_226);
        }
        TArray<ESkillSlot> local_232 = ::FSkillUIUtils::GetAvatarAllSkillSlots(local_28);
        for (auto local_249 : local_232)
        {
            TEUIModelWeakRef<FM_TalentNode> local_252;
            if (local_197)
            {
                int local_76 = local_249;
                if (local_76 == 1 || (local_249 == 2))
                {
                    local_76 = local_249;
                    if (local_76 == 1)
                    {
                        int local_255 = 3;
                        local_254 = local_255;
                    }
                    else
                    {
                        int local_255_2 = 4;
                        local_254 = local_255_2;
                    }
                    TArray<TEUIModelRef<FM_TalentNode>> local_260 = local_144.GetActiveTalentNodeListByType(local_172, ESkillType(local_254));
                    for (auto& local_278 : local_260)
                    {
                        if (int(local_278.Get().GetTalentType()) == 6 && (local_278.Get().GetConfig(0).Get().GetFoundationTalent().Get().DataId == int(local_226.FoundationId)))
                        {
                            local_252 = TEUIModelWeakRef<FM_TalentNode>(local_278.Get());
                            break;
                        }
                    }
                }
                else
                {
                    local_76 = local_249;
                    int local_309 = local_76;
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
            TEUIModelRef<FVM_TalentEditSkillBtn> local_312 = TEUIModelRef<FVM_TalentEditSkillBtn>(::FVM_TalentEditSkillBtn::Create(this.GetContext().Manager, local_28, local_252, ESkillSlot(local_249)));
            TDataObjectPtr<FSkillInitConfig> local_338;
            if (!(local_74.Find(ESkillSlot(local_249), local_338)))
            {
                local_77 = false;
            }
            else
            {
                local_77 = local_338;
            }
            if (local_77)
            {
                local_312.Get().SetForceSkillInitConfig(local_338);
            }
            if (local_197 && local_252.IsValid())
            {
                int local_255_3 = int(local_252.Get().GetEffectiveSkillType());
                if (local_255_3 != 0)
                {
                    local_312.Get().SetbCanChange((local_144.GetActiveTalentNodeListByType(local_172, ESkillType(local_255_3)).Num() > 1));
                }
            }
            else
            {
                local_312.Get().SetbCanChange(false);
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
        int local_84;
        int local_85;
        int local_87;
        int local_88;
        if (AvatarA.Get().GetAvatar())
        {
            local_7 = AvatarA.Get().GetAvatar().Get().GetbIsUnlocked();
        }
        else
        {
            local_7 = false;
        }
        int local_8 = local_7 ? 1 : 0;
        if (AvatarB.Get().GetAvatar())
        {
            local_7 = AvatarB.Get().GetAvatar().Get().GetbIsUnlocked();
        }
        else
        {
            local_7 = false;
        }
        int local_1 = local_7 ? 1 : 0;
        if (local_8 != local_1)
        {
            return (local_8 > local_1);
        }
        TDataObjectPtr<FAvatarPrefabConfig> local_34 = AvatarA.Get().GetAvatarConfig();
        TDataObjectPtr<FAvatarPrefabConfig> local_82 = AvatarB.Get().GetAvatarConfig();
        if (!(local_34))
        {
            local_7 = false;
        }
        else
        {
            local_7 = local_34.Get().bIsMainPlayer;
        }
        int local_10 = local_7 ? 1 : 0;
        if (!(local_82))
        {
            local_7 = false;
        }
        else
        {
            local_7 = local_82.Get().bIsMainPlayer;
        }
        int local_83 = local_7 ? 1 : 0;
        if (local_10 != local_83)
        {
            return (local_10 > local_83);
        }
        if (local_34)
        {
            local_84 = local_34.Get().SortPriority;
        }
        else
        {
            local_84 = 0;
        }
        if (local_82)
        {
            local_85 = local_82.Get().SortPriority;
        }
        else
        {
            local_85 = 0;
        }
        if (local_84 != local_85)
        {
            return (local_84 > local_85);
        }
        if (local_34)
        {
            local_88 = local_34.Get().DataId;
        }
        else
        {
            local_88 = 0;
        }
        if (local_82)
        {
            local_87 = local_82.Get().DataId;
        }
        else
        {
            local_87 = 0;
        }
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
        int local_8 = ::FMS_PlayerData::Get(this.GetManager()).GetLocalPlayerData().Get().GetPlayerSpecialtyID();
        TArray<TEUIModelRef<FVM_AvatarInfo>> local_12;
        for (auto& local_34 : this.GetPlayerAvatarData().Get().GetOwnedAvatars())
        {
            FAvatarPrefabConfig local_700;
            if (local_700.bAlwaysHidden)
            {
                continue;
            }
            if (local_700.bIsMainPlayer && (int(local_700.GenderType) != (int(this.GetGender())) || (int(local_700.DataId) != local_8)))
            {
                continue;
            }
            local_12.Add(TEUIModelRef<FVM_AvatarInfo>(::FVM_AvatarInfo::Create(this.GetManager(), local_34.GetValue())));
        }
        FAvatarListSorter local_1374;
        local_12.Sort(local_1374);
        if (!((local_12 == this.GetUnLockAvatarList())))
        {
            this.SetUnLockAvatarList(local_12);
        }
        return;
    }
    void UpdateTeamAvatars()
    {
        this.GetModify_CurrentTeamAvatars().Empty(0);
        for (auto& local_20 : this.GetPlayerAvatarData().Get().GetCurrentAvatars())
        {
            TEUIModelRef<FVM_AvatarInfo> local_22 = TEUIModelRef<FVM_AvatarInfo>(::FVM_AvatarInfo::Create(this.GetManager(), local_20));
            this.GetModify_CurrentTeamAvatars().Add(local_22);
        }
        for (auto& local_40 : this.GetUnLockAvatarList())
        {
            local_40.Get().RefreshSlotIndex();
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
        int local_41;
        TArray<FAvatarPrefabConfig> local_8 = ::FAvatarPrefabConfig::GetAll();
        int local_16 = ::FMS_PlayerData::Get(this.GetManager()).GetLocalPlayerData().Get().GetPlayerSpecialtyID();
        TArray<TEUIModelRef<FVM_AvatarInfo>> local_20;
        for (auto& local_36 : local_8)
        {
            if (local_36.bAlwaysHidden)
            {
                continue;
            }
            if (int(local_36.bIsMainPlayer) == 0)
            {
                local_41 = 0;
            }
            else
            {
                local_41 = (int(local_36.GenderType) != int(this.GetGender()));
            }
            if (local_41 != 0)
            {
                continue;
            }
            TDataObjectPtr<FAvatarPrefabConfig> local_90 = ::FAvatarPrefabConfig::GetByDataId(int(local_36.DataId));
            TEUIModelRef<FM_Avatar> local_96 = this.GetPlayerAvatarData().Get().FindAvatar(local_90);
            if (local_96)
            {
                local_20.Add(TEUIModelRef<FVM_AvatarInfo>(::FVM_AvatarInfo::Create(this.GetManager(), local_96)));
            }
            else
            {
                TEUIModelRef<FM_Avatar> local_100 = TEUIModelRef<FM_Avatar>(::FM_Avatar::Create(this.GetManager(), local_90));
                local_100.Get().SetbIsUnlocked(false);
                local_20.Add(TEUIModelRef<FVM_AvatarInfo>(::FVM_AvatarInfo::Create(this.GetManager(), local_100)));
            }
        }
        FAvatarListSorter local_102;
        local_20.Sort(local_102);
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
                if (local_20.Get().GetAvatarConfig().Get().DataId == this.GetPendingShowTIpsAvatarDataId())
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
        this.SetPendingShowTIpsAvatarDataId(AvatarConfig.Get().DataId);
        FSoftBrush local_56 = FSoftBrush(AvatarConfig.Get().AvatarIcon);
        FText local_64 = FText::Format(local_4.UnlockNewAvatarTipsContentFormat, AvatarConfig.Get().DisplayName);
        FSimpleModelEvent local_86;
        local_86.Add(this, FVMS_PlayerOwnedAvatarInfo::OpenUnlockAvatar);
        FInputActionListConstructParam local_90;
        local_90.InputActionListConstructParamItems.Add(FInputActionListConstructParamItem(FEUIInputAction(local_4.UnlockNewAvatarTipsConfirmAction), local_86));
        FCommonHintParam local_220;
        local_220.LifetimeOverride = local_4.UnlockNewAvatarTipsTimeDuration;
        ::CommonPopup::LargeHintWithAction(local_56, local_4.UnlockNewAvatarTipsTitle, local_64, local_90, local_220, 0);
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
        int local_2 = A.Get().GetTraitLevel();
        int local_1 = B.Get().GetTraitLevel();
        if (local_2 != local_1)
        {
            return (local_2 > local_1);
        }
        return (A.Get().GetTrait().Get().GetTraitConfig().Get().DataId > B.Get().GetTrait().Get().GetTraitConfig().Get().DataId);
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
FVM_AvatarInfo& CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Avatar> &inout Avatar)
{
    return TEUIModelRef<FVM_AvatarInfo>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_AvatarInfo::ModelId, 0, Avatar)).Get();
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
    __MonitorDSPlayerAvatarInfoLifetime(ECSWorld, EECSRegType(0), false, false, FECSMonitorDetail::All(NAME_None, FName("EJG_OutputBackend::TickUIModel")));
    __MonitorDSPlayerAvatarInfoModification(ECSWorld, EECSRegType(0), false, FECSMonitorDetail::All(NAME_None, FName("EJG_OutputBackend::TickUIModel")));
    return;
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
    return __GeneratedProperties_FVM_AvatarInfo.Get();
}
}
namespace FVM_AvatarInfoExtend
{
FVM_AvatarInfoExtend& Create(const UObject ContextObject)
{
    return FVM_AvatarInfoExtend::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_AvatarInfoExtend& CreateByManager(const UEUIManagerSubsystem Manager)
{
    return TEUIModelRef<FVM_AvatarInfoExtend>(EUIInternal::MakeModelWithManager(Manager, FVM_AvatarInfoExtend::ModelId)).Get();
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
    return __GeneratedProperties_FVM_AvatarInfoExtend.Get();
}
}
namespace FVM_AvatarSpecialtyInfo
{
FVM_AvatarSpecialtyInfo& Create(const UObject ContextObject, const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig)
{
    return FVM_AvatarSpecialtyInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject), AvatarConfig);
}
FVM_AvatarSpecialtyInfo& CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig)
{
    return TEUIModelRef<FVM_AvatarSpecialtyInfo>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_AvatarSpecialtyInfo::ModelId, 0, AvatarConfig)).Get();
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
    return __GeneratedProperties_FVM_AvatarSpecialtyInfo.Get();
}
}
namespace FVM_AvatarDetailInfo_SkillSelect
{
FVM_AvatarDetailInfo_SkillSelect& Create(const UObject ContextObject)
{
    return FVM_AvatarDetailInfo_SkillSelect::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_AvatarDetailInfo_SkillSelect& CreateByManager(const UEUIManagerSubsystem Manager)
{
    return TEUIModelRef<FVM_AvatarDetailInfo_SkillSelect>(EUIInternal::MakeModelWithManager(Manager, FVM_AvatarDetailInfo_SkillSelect::ModelId)).Get();
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
    return __GeneratedProperties_FVM_AvatarDetailInfo_SkillSelect.Get();
}
}
namespace FVM_AvatarDetailSkillSelect
{
FVM_AvatarDetailSkillSelect& Create(const UObject ContextObject, const TEUIModelRef<FVM_TalentEditSkillBtn> &inout SkillInfo, const TEUIModelRef<FVM_AvatarDetailInfo_SkillSelect> &inout SelectInfo)
{
    return FVM_AvatarDetailSkillSelect::CreateByManager(EUIInternal::GetContextManager(ContextObject), SkillInfo, SelectInfo);
}
FVM_AvatarDetailSkillSelect& CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FVM_TalentEditSkillBtn> &inout SkillInfo, const TEUIModelRef<FVM_AvatarDetailInfo_SkillSelect> &inout SelectInfo)
{
    return TEUIModelRef<FVM_AvatarDetailSkillSelect>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_AvatarDetailSkillSelect::ModelId, 0, SkillInfo, SelectInfo)).Get();
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
    return __GeneratedProperties_FVM_AvatarDetailSkillSelect.Get();
}
}
namespace FVM_AvatarDetailPopInfo
{
FVM_AvatarDetailPopInfo& Create(const UObject ContextObject, const TEUIModelRef<FVM_AvatarInfo> &inout AvatarInfo)
{
    return FVM_AvatarDetailPopInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject), AvatarInfo);
}
FVM_AvatarDetailPopInfo& CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FVM_AvatarInfo> &inout AvatarInfo)
{
    return TEUIModelRef<FVM_AvatarDetailPopInfo>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_AvatarDetailPopInfo::ModelId, 0, AvatarInfo)).Get();
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
    return __GeneratedProperties_FVM_AvatarDetailPopInfo.Get();
}
}
namespace FVM_AvatarDetailInfo
{
FVM_AvatarDetailInfo& Create(const UObject ContextObject)
{
    return FVM_AvatarDetailInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_AvatarDetailInfo& CreateByManager(const UEUIManagerSubsystem Manager)
{
    return TEUIModelRef<FVM_AvatarDetailInfo>(EUIInternal::MakeModelWithManager(Manager, FVM_AvatarDetailInfo::ModelId)).Get();
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "AvatarTraitList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_TraitInfo>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TraitHoverList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_TraitInfoHover>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AvatarAttributeList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_AttributeDisplay>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AvatarAllAttributeList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_AttributeDisplay>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AvatarSkillInfoList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_AvatarDetailSkillSelect>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectSkillInfo";
    local_14.TypeName = "TEUIModelRef<FVM_TalentSkillInfoItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bCanDisplayAttribute";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bCanDisplayTrait";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bDisplayAttributeOrSkill";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bHasHoverSkill";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PvpEquipedDivineSkill";
    local_14.TypeName = "TEUIModelRef<FVM_DivineSkillInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarDetailInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarDetailInfo;
    FEUIModelRefPropertyDirtyIndexer local_22 = FEUIModelRefPropertyDirtyIndexer(13);
    local_22.AddRefPropertyDirty(0, 6, FVM_AvatarDetailInfo_SkillSelect::__IndexOf_SkillInfo());
    local_22.ApplySort();
    FEUIModelRefPropertyDirty local_30;
    local_30.PropertyName = FName("SelectInfoVM");
    int local_2_2 = FVM_AvatarDetailInfo_SkillSelect::ModelId;
    int local_2_3 = local_22.GetMappingDirtyOffset(6);
    local_30.RelatedDirtyMask.SetBit(FVM_AvatarDetailInfo_SkillSelect::__IndexOf_SkillInfo(), true);
    Result.ListeningModelRefDirties.Add(local_30);
    FEUIModelDirtyDefine local_40;
    local_40.FunctionName = "__RefreshSelectSkill";
    local_40.DirtyFlags.Set(FVM_AvatarDetailInfo::__IndexOf_SelectInfoVM());
    local_40.DirtyFlags.Set(local_22.GetMappingDirtyIndex(0));
    Result.DirtyFunctions.Add(local_40);
    FEUIModelMsgHandleDefine local_50;
    local_50.FunctionName = "__OnAvatarSkillChanged";
    local_50.MessageTypeName = "Msg_AvatarEquipmentChanged";
    local_50.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_50);
    FEUIModelMonitorDefine local_64;
    local_64.FunctionName = "__Monitor_OnPlayerSkillChange";
    local_64.ComponentType = FC_Skill;
    Result.MonitorFunctions.Add(local_64);
    local_40.FunctionName = "__DoRefresh";
    local_40.DirtyFlags.Set(FVM_AvatarDetailInfo::__IndexOf_CurrentAvatar());
    Result.DirtyFunctions.Add(local_40);
    local_50.FunctionName = "__OnTalentDataUpdated";
    local_50.MessageTypeName = "Msg_TalentTreeDataUpdate";
    local_50.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_50);
    return;
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
    ECSWorld.__MonitorSkillLifetime(EECSRegType(0), false, false, FECSMonitorDetail::All(NAME_None, FName("EJG_OutputBackend::TickUIModel")));
    ECSWorld.__MonitorSkillModification(EECSRegType(0), false, FECSMonitorDetail::All(NAME_None, FName("EJG_OutputBackend::TickUIModel")));
    return;
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
    return __GeneratedProperties_FVM_AvatarDetailInfo.Get();
}
}
namespace FVMS_PlayerOwnedAvatarInfo
{
FVMS_PlayerOwnedAvatarInfo& Get(const UObject ContextObject)
{
    return FVMS_PlayerOwnedAvatarInfo::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_PlayerOwnedAvatarInfo& GetByManager(const UEUIManagerSubsystem Manager)
{
    return TEUIModelRef<FVMS_PlayerOwnedAvatarInfo>(EUIInternal::MakeModelWithManager(Manager, FVMS_PlayerOwnedAvatarInfo::ModelId)).Get();
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "UnLockAvatarList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_AvatarInfo>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentTeamAvatars";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_AvatarInfo>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AllConfigAvatars";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_AvatarInfo>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Gender";
    local_14.TypeName = "EGenderType";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_PlayerOwnedAvatarInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_PlayerOwnedAvatarInfo;
    FEUIModelRefPropertyDirtyIndexer local_22 = FEUIModelRefPropertyDirtyIndexer(7);
    local_22.AddRefPropertyDirty(0, 4, FMS_PlayerAvatarData::__IndexOf_CurrentAvatars());
    local_22.AddRefPropertyDirty(1, 4, FMS_PlayerAvatarData::__IndexOf_OwnedAvatars());
    local_22.ApplySort();
    FEUIModelRefPropertyDirty local_30;
    local_30.PropertyName = FName("PlayerAvatarData");
    int local_2_2 = FMS_PlayerAvatarData::ModelId;
    int local_2_3 = local_22.GetMappingDirtyOffset(4);
    local_30.RelatedDirtyMask.SetBit(FMS_PlayerAvatarData::__IndexOf_CurrentAvatars(), true);
    local_30.RelatedDirtyMask.SetBit(FMS_PlayerAvatarData::__IndexOf_OwnedAvatars(), true);
    Result.ListeningModelRefDirties.Add(local_30);
    FEUIModelMonitorDefine local_42;
    local_42.FunctionName = "__OnDSPlayerInfoChanged";
    local_42.ComponentType = FC_DSPlayerInfo;
    Result.MonitorFunctions.Add(local_42);
    FEUIModelDirtyDefine local_52;
    local_52.FunctionName = "__UpdateAvatarList";
    local_52.DirtyFlags.Set(FVMS_PlayerOwnedAvatarInfo::__IndexOf_PlayerAvatarData());
    local_52.DirtyFlags.Set(local_22.GetMappingDirtyIndex(1));
    local_52.DirtyFlags.Set(FVMS_PlayerOwnedAvatarInfo::__IndexOf_AllConfigAvatars());
    Result.DirtyFunctions.Add(local_52);
    local_52.FunctionName = "__UpdateTeamAvatars";
    local_52.DirtyFlags.Set(FVMS_PlayerOwnedAvatarInfo::__IndexOf_PlayerAvatarData());
    local_52.DirtyFlags.Set(local_22.GetMappingDirtyIndex(0));
    Result.DirtyFunctions.Add(local_52);
    FEUIModelMsgHandleDefine local_62;
    local_62.FunctionName = "__OnUnlockAvatar";
    local_62.MessageTypeName = "Msg_UnlockAvatar";
    local_62.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_62);
    return;
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
    __MonitorDSPlayerInfoLifetime(ECSWorld, EECSRegType(0), false, false, FECSMonitorDetail::All(NAME_None, FName("EJG_OutputBackend::TickUIModel")));
    __MonitorDSPlayerInfoModification(ECSWorld, EECSRegType(0), false, FECSMonitorDetail::All(NAME_None, FName("EJG_OutputBackend::TickUIModel")));
    return;
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
    return __GeneratedProperties_FVMS_PlayerOwnedAvatarInfo.Get();
}
}


namespace FVM_SpecialtyItem
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnClickItem = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnHoverEnter = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnHoverExit = FEUIModelCallbackSignature();

}
struct FMsg_SpecialtyItemSelected : FEUIMessage
{
    UPROPERTY()
    uint AvatarId;


}

struct FVM_SpecialtyItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarInfo> m_AvatarInfo;
    UPROPERTY()
    bool m_bSelected;
    UPROPERTY()
    FText m_DisplayName;
    UPROPERTY()
    FSoftBrush m_ClassIcon;
    UPROPERTY()
    FSoftBrush m_IllustrateBackgroundIcon;
    UPROPERTY()
    FSlateBrush m_IllustrateIcon;
    UPROPERTY()
    FSlateBrush m_DamageTypeIcon;
    UPROPERTY()
    FText m_WeaponTypeDisplayName;
    UPROPERTY()
    FText m_AvatarBackgroundDesc;
    UPROPERTY()
    FText m_SpecialtyDesc;
    UPROPERTY()
    FSoftBrush m_DefaultWeaponIcon;
    UPROPERTY()
    FText m_SpecialtyBackgroundDesc;
    UPROPERTY()
    FText m_DefaultDivineSkillName;
    UPROPERTY()
    FText m_AvatarIllustrateDesc;
    UPROPERTY()
    FText m_AvatarPowerName;
    UPROPERTY()
    bool m_bIsHover;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_AvatarUnlockCondition>> m_UnlockConditions;
    UPROPERTY()
    int m_UnLockStateIndex;
    UPROPERTY()
    bool m_bUseBtnSelect;
    UPROPERTY()
    bool m_bIsActive;
    UPROPERTY()
    bool m_bNeverActive;

    FVM_SpecialtyItem()
    {
        this.m_bSelected = false;
        this.m_bIsHover = false;
        this.m_UnLockStateIndex = 0;
        this.m_bUseBtnSelect = false;
        this.m_bIsActive = false;
        this.m_bNeverActive = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_SpecialtyItem' by default constructor.");
        return;
    }
    FVM_SpecialtyItem(const FVM_SpecialtyItem &inout Other)
    {
        this.m_bSelected = false;
        this.m_bIsHover = false;
        this.m_UnLockStateIndex = 0;
        this.m_bUseBtnSelect = false;
        this.m_bIsActive = false;
        this.m_bNeverActive = false;
        this.m_AvatarInfo = Other.m_AvatarInfo;
        this.m_bSelected = Other.m_bSelected;
        this.m_DisplayName = Other.m_DisplayName;
        this.m_ClassIcon = Other.m_ClassIcon;
        this.m_IllustrateBackgroundIcon = Other.m_IllustrateBackgroundIcon;
        this.m_IllustrateIcon = Other.m_IllustrateIcon;
        this.m_DamageTypeIcon = Other.m_DamageTypeIcon;
        this.m_WeaponTypeDisplayName = Other.m_WeaponTypeDisplayName;
        this.m_AvatarBackgroundDesc = Other.m_AvatarBackgroundDesc;
        this.m_SpecialtyDesc = Other.m_SpecialtyDesc;
        this.m_DefaultWeaponIcon = Other.m_DefaultWeaponIcon;
        this.m_SpecialtyBackgroundDesc = Other.m_SpecialtyBackgroundDesc;
        this.m_DefaultDivineSkillName = Other.m_DefaultDivineSkillName;
        this.m_AvatarIllustrateDesc = Other.m_AvatarIllustrateDesc;
        this.m_AvatarPowerName = Other.m_AvatarPowerName;
        this.m_bIsHover = Other.m_bIsHover;
        this.m_UnlockConditions = Other.m_UnlockConditions;
        this.m_UnLockStateIndex = int(Other.m_UnLockStateIndex);
        this.m_bUseBtnSelect = Other.m_bUseBtnSelect;
        this.m_bIsActive = Other.m_bIsActive;
        this.m_bNeverActive = Other.m_bNeverActive;
        return;
    }
    FVM_SpecialtyItem(const TEUIModelRef<FVM_AvatarInfo> &inout InAvatarInfo)
    {
        this.m_bSelected = false;
        this.m_bIsHover = false;
        this.m_UnLockStateIndex = 0;
        this.m_bUseBtnSelect = false;
        this.m_bIsActive = false;
        this.m_bNeverActive = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetAvatarInfo(InAvatarInfo);
        return;
    }
    FVM_SpecialtyItem opAssign(const FVM_SpecialtyItem &inout Other)
    {
        FVM_SpecialtyItem __r;
        this.m_AvatarInfo = Other.m_AvatarInfo;
        this.m_bSelected = Other.m_bSelected;
        this.m_DisplayName = Other.m_DisplayName;
        this.m_ClassIcon = Other.m_ClassIcon;
        this.m_IllustrateBackgroundIcon = Other.m_IllustrateBackgroundIcon;
        this.m_IllustrateIcon = Other.m_IllustrateIcon;
        this.m_DamageTypeIcon = Other.m_DamageTypeIcon;
        this.m_WeaponTypeDisplayName = Other.m_WeaponTypeDisplayName;
        this.m_AvatarBackgroundDesc = Other.m_AvatarBackgroundDesc;
        this.m_SpecialtyDesc = Other.m_SpecialtyDesc;
        this.m_DefaultWeaponIcon = Other.m_DefaultWeaponIcon;
        this.m_SpecialtyBackgroundDesc = Other.m_SpecialtyBackgroundDesc;
        this.m_DefaultDivineSkillName = Other.m_DefaultDivineSkillName;
        this.m_AvatarIllustrateDesc = Other.m_AvatarIllustrateDesc;
        this.m_AvatarPowerName = Other.m_AvatarPowerName;
        this.m_bIsHover = Other.m_bIsHover;
        this.m_UnlockConditions = Other.m_UnlockConditions;
        this.m_UnLockStateIndex = int(Other.m_UnLockStateIndex);
        this.m_bUseBtnSelect = Other.m_bUseBtnSelect;
        this.m_bIsActive = Other.m_bIsActive;
        this.m_bNeverActive = Other.m_bNeverActive;
        return __r;
    }
    void PostConstruct()
    {
        if (this.GetAvatarInfo().IsValid())
        {
            FText local_8;
            TEUIModelRef<FVM_AvatarInfo> local_2 = this.GetAvatarInfo();
            local_8.GetDisplayName();
            this.SetDisplayName(local_8);
            TEUIModelRef<FVM_AvatarInfo> local_2_2 = this.GetAvatarInfo();
            this.SetClassIcon(GetClassIcon());
            TEUIModelRef<FVM_AvatarInfo> local_2_3 = this.GetAvatarInfo();
            this.SetIllustrateBackgroundIcon(GetIllustrateBackgroundIcon());
            TEUIModelRef<FVM_AvatarInfo> local_2_4 = this.GetAvatarInfo();
            this.SetIllustrateIcon(GetIllustrateIcon());
            TEUIModelRef<FVM_AvatarInfo> local_2_5 = this.GetAvatarInfo();
            this.SetDamageTypeIcon(GetDamageTypeIcon());
            TEUIModelRef<FVM_AvatarInfo> local_2_6 = this.GetAvatarInfo();
            this.SetWeaponTypeDisplayName(GetWeaponTypeDisplayName());
            TEUIModelRef<FVM_AvatarInfo> local_2_7 = this.GetAvatarInfo();
            local_8.GetAvatarBackgroundDesc();
            this.SetAvatarBackgroundDesc(local_8);
            TEUIModelRef<FVM_AvatarInfo> local_2_8 = this.GetAvatarInfo();
            if (GetAvatarConfig().IsSet())
            {
                FAvatarPrefabConfig local_10;
                TEUIModelRef<FVM_AvatarInfo> local_2_9 = this.GetAvatarInfo();
                this.SetSpecialtyDesc(local_10.SpecialtyDesc);
                this.SetAvatarIllustrateDesc(local_10.PlayerIllustrate1);
                GetGameplaySettings<UAvatarBuildSettings> local_14;
                if (local_14 != nullptr)
                {
                    TDataObjectPtr<FDivineSkillConfig> local_68;
                    bool local_3 = (int(local_10.CombatType) == 1);
                    if (local_3)
                    {
                    }
                    else
                    {
                    }
                    this.SetDefaultWeaponIcon();
                    if (local_3)
                    {
                    }
                    else
                    {
                    }
                    this.SetSpecialtyBackgroundDesc();
                    if (local_3)
                    {
                    }
                    else
                    {
                    }
                    if (local_68.IsSet())
                    {
                    }
                }
            }
        }
        this.RefreshIsActive();
        return;
    }
    ESlateVisibility SelectBtnVisibility() const
    {
        bool local_5 = (int(::UICommonUtil::GetCurrentInputType(this.GetContext().UELocalPlayer)) == 0);
        if (local_5)
        {
            return ESlateVisibility(0);
        }
        else
        {
            return ESlateVisibility(2);
        }
    }
    void RefreshIsLocked()
    {
        bool local_3 = this.GetAvatarInfo().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelRef<FVM_AvatarInfo> local_2 = this.GetAvatarInfo();
            local_3 = GetAvatarConfig().IsSet();
        }
        if (local_3)
        {
            TEUIModelRef<FVM_AvatarInfo> local_2_2 = this.GetAvatarInfo();
            int local_5 = GetIsUnLocked() ? 0 : 1;
            this.SetUnLockStateIndex(local_5);
        }
        return;
    }
    void RefreshAvatarPowerName()
    {
        int local_9;
        if (!(this.GetAvatarInfo().IsValid()))
        {
            FText local_8;
            this.SetAvatarPowerName(local_8);
            return;
        }
        TEUIModelRef<FVM_AvatarInfo> local_2 = this.GetAvatarInfo();
        local_9 = int(GetIllustrate());
        TEUIModelRef<FVM_AvatarInfo> local_2_2 = this.GetAvatarInfo();
        FText local_14 = FText(GetIllustrateDisplayName());
        switch (local_9)
        {
        case 0:
        {
            this.SetAvatarPowerName(FText::Format(INVTEXT("<Red24>{0}</>"), local_14));
            break;
        }
        case 1:
        {
            this.SetAvatarPowerName(FText::Format(INVTEXT("<Blue24F>{0}</>"), local_14));
            break;
        }
        case 2:
        {
            this.SetAvatarPowerName(FText::Format(INVTEXT("<Green24>{0}</>"), local_14));
            break;
        }
        default:
        {
            this.SetAvatarPowerName(local_14);
        }
        }
        return;
    }
    void RefreshCondition()
    {
        this.GetModify_UnlockConditions().Empty(0);
        bool local_5 = this.GetAvatarInfo().IsValid();
        if (!(local_5))
        {
            local_5 = false;
        }
        else
        {
            TEUIModelRef<FVM_AvatarInfo> local_4 = this.GetAvatarInfo();
            local_5 = GetAvatarConfig().IsSet();
        }
        if (local_5)
        {
            TEUIModelRef<FVM_AvatarInfo> local_4_2 = this.GetAvatarInfo();
            for (auto& local_20 : GetUnlockCondition())
            {
                TEUIModelRef<FVM_AvatarUnlockCondition> local_22 = TEUIModelRef<FVM_AvatarUnlockCondition>(::FVM_AvatarUnlockCondition::Create(this.GetManager(), local_20));
                this.GetModify_UnlockConditions().Add(local_22);
            }
        }
        return;
    }
    void OnPlayerSpecialtyChanged(const FC_DSPlayerInfo &inout DSPlayerInfo)
    {
        if (this.GetbNeverActive())
        {
            return;
        }
        this.RefreshIsActive();
        return;
    }
    void SetNeverActive(const bool bInNeverActive)
    {
        this.SetbNeverActive(bInNeverActive);
        this.RefreshIsActive();
        return;
    }
    void RefreshIsActive()
    {
        int local_7 = 0;
        if (this.GetbNeverActive())
        {
            this.SetbIsActive(false);
            return;
        }
        bool local_2 = false;
        TEUIModelRef<FVM_AvatarInfo> local_4 = this.GetAvatarInfo();
        bool local_1 = local_4.IsValid();
        if (!(local_1))
        {
            local_1 = false;
        }
        else
        {
            TEUIModelRef<FVM_AvatarInfo> local_4_2 = this.GetAvatarInfo();
            local_1 = GetAvatarConfig().IsSet();
        }
        if (local_1)
        {
            int local_6;
            TEUIModelRef<FVM_AvatarInfo> local_4_3 = this.GetAvatarInfo();
            local_6 = local_7;
            TEUIModelRef<FM_Player> local_14 = ::FMS_PlayerData::Get(this.GetManager()).GetLocalPlayerData();
            if (local_6 != 0 && local_14.IsValid())
            {
                local_2 = (local_6 == GetPlayerSpecialtyID());
            }
        }
        this.SetbIsActive(local_2);
        return;
    }
    void OnClickItem()
    {
        this.SelectSpecialty();
        return;
    }
    void OnHoverEnter()
    {
        this.SetbIsHover(true);
        if ((int(::UICommonUtil::GetCurrentInputType(this.GetContext().UELocalPlayer))) != 1)
        {
            return;
        }
        this.SelectSpecialty();
        return;
    }
    void OnHoverExit()
    {
        this.SetbIsHover(false);
        return;
    }
    void SelectSpecialty()
    {
        int local_2 = 0;
        int local_1 = 0;
        if (!(this.GetbSelected()) && this.GetAvatarInfo().IsValid())
        {
            TEUIModelRef<FVM_AvatarInfo> local_6 = this.GetAvatarInfo();
            if (GetAvatarConfig().IsSet())
            {
                local_1 = local_2;
            }
        }
        FEUIModelRef local_62 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        FMsg_SpecialtyItemSelected local_64;
        local_64.AvatarId = local_1;
        return;
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
    bool GetbSelected() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bSelected;
    }
    void SetbSelected(const bool __Value) property
    {
        if (!(this.m_bSelected) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bSelected = __Value;
        return;
    }
    FText GetDisplayName() const property
    {
        FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_DisplayName() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetDisplayName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_DisplayName = __Value;
        return;
    }
    const FSoftBrush GetClassIcon() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FSoftBrush GetModify_ClassIcon() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetClassIcon(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_ClassIcon = __Value;
        return;
    }
    const FSoftBrush GetIllustrateBackgroundIcon() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FSoftBrush GetModify_IllustrateBackgroundIcon() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetIllustrateBackgroundIcon(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_IllustrateBackgroundIcon = __Value;
        return;
    }
    const FSlateBrush GetIllustrateIcon() const property
    {
        const FSlateBrush __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FSlateBrush GetModify_IllustrateIcon() property
    {
        FSlateBrush __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetIllustrateIcon(const FSlateBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_IllustrateIcon = __Value;
        return;
    }
    const FSlateBrush GetDamageTypeIcon() const property
    {
        const FSlateBrush __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FSlateBrush GetModify_DamageTypeIcon() property
    {
        FSlateBrush __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetDamageTypeIcon(const FSlateBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_DamageTypeIcon = __Value;
        return;
    }
    const FText GetWeaponTypeDisplayName() const property
    {
        const FText __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FText GetModify_WeaponTypeDisplayName() property
    {
        FText __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetWeaponTypeDisplayName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_WeaponTypeDisplayName = __Value;
        return;
    }
    FText GetAvatarBackgroundDesc() const property
    {
        FText __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    FText GetModify_AvatarBackgroundDesc() property
    {
        FText __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetAvatarBackgroundDesc(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_AvatarBackgroundDesc = __Value;
        return;
    }
    const FText GetSpecialtyDesc() const property
    {
        const FText __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    FText GetModify_SpecialtyDesc() property
    {
        FText __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetSpecialtyDesc(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_SpecialtyDesc = __Value;
        return;
    }
    const FSoftBrush GetDefaultWeaponIcon() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    FSoftBrush GetModify_DefaultWeaponIcon() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetDefaultWeaponIcon(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_DefaultWeaponIcon = __Value;
        return;
    }
    const FText GetSpecialtyBackgroundDesc() const property
    {
        const FText __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    FText GetModify_SpecialtyBackgroundDesc() property
    {
        FText __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetSpecialtyBackgroundDesc(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_SpecialtyBackgroundDesc = __Value;
        return;
    }
    const FText GetDefaultDivineSkillName() const property
    {
        const FText __r;
        this.TrackPropertyRead(12);
        return __r;
    }
    FText GetModify_DefaultDivineSkillName() property
    {
        FText __r;
        this.MarkPropertyDirty(12);
        return __r;
    }
    void SetDefaultDivineSkillName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_DefaultDivineSkillName = __Value;
        return;
    }
    const FText GetAvatarIllustrateDesc() const property
    {
        const FText __r;
        this.TrackPropertyRead(13);
        return __r;
    }
    FText GetModify_AvatarIllustrateDesc() property
    {
        FText __r;
        this.MarkPropertyDirty(13);
        return __r;
    }
    void SetAvatarIllustrateDesc(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_AvatarIllustrateDesc = __Value;
        return;
    }
    const FText GetAvatarPowerName() const property
    {
        const FText __r;
        this.TrackPropertyRead(14);
        return __r;
    }
    FText GetModify_AvatarPowerName() property
    {
        FText __r;
        this.MarkPropertyDirty(14);
        return __r;
    }
    void SetAvatarPowerName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_AvatarPowerName = __Value;
        return;
    }
    bool GetbIsHover() const property
    {
        this.TrackPropertyRead(15);
        return this.m_bIsHover;
    }
    void SetbIsHover(const bool __Value) property
    {
        if (!(this.m_bIsHover) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_bIsHover = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_AvatarUnlockCondition>> GetUnlockConditions() const property
    {
        const TArray<TEUIModelRef<FVM_AvatarUnlockCondition>> __r;
        this.TrackPropertyRead(16);
        return __r;
    }
    TArray<TEUIModelRef<FVM_AvatarUnlockCondition>> GetModify_UnlockConditions() property
    {
        TArray<TEUIModelRef<FVM_AvatarUnlockCondition>> __r;
        this.MarkPropertyDirty(16);
        return __r;
    }
    void SetUnlockConditions(const TArray<TEUIModelRef<FVM_AvatarUnlockCondition>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_UnlockConditions = __Value;
        return;
    }
    int GetUnLockStateIndex() const property
    {
        this.TrackPropertyRead(17);
        return this.m_UnLockStateIndex;
    }
    void SetUnLockStateIndex(const int __Value) property
    {
        if (this.m_UnLockStateIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_UnLockStateIndex = __Value;
        return;
    }
    bool GetbUseBtnSelect() const property
    {
        this.TrackPropertyRead(18);
        return this.m_bUseBtnSelect;
    }
    void SetbUseBtnSelect(const bool __Value) property
    {
        if (!(this.m_bUseBtnSelect) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(18);
        this.m_bUseBtnSelect = __Value;
        return;
    }
    bool GetbIsActive() const property
    {
        this.TrackPropertyRead(19);
        return this.m_bIsActive;
    }
    void SetbIsActive(const bool __Value) property
    {
        if (!(this.m_bIsActive) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(19);
        this.m_bIsActive = __Value;
        return;
    }
    bool GetbNeverActive() const property
    {
        this.TrackPropertyRead(20);
        return this.m_bNeverActive;
    }
    void SetbNeverActive(const bool __Value) property
    {
        if (!(this.m_bNeverActive) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(20);
        this.m_bNeverActive = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_SpecialtyItem
{
    UPROPERTY()
    ESlateVisibility SelectBtnVisibility;
    UPROPERTY()
    TEUIModelRef<FVM_SpecialtyItem> Self;


}

namespace FVM_SpecialtyItem
{
FVM_SpecialtyItem& Create(const UObject ContextObject, const TEUIModelRef<FVM_AvatarInfo> &inout AvatarInfo)
{
    return FVM_SpecialtyItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), AvatarInfo);
}
FVM_SpecialtyItem CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FVM_AvatarInfo> &inout AvatarInfo)
{
    FVM_SpecialtyItem __r;
    TEUIModelRef<FVM_SpecialtyItem> local_6 = TEUIModelRef<FVM_SpecialtyItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_SpecialtyItem::ModelId, 0, AvatarInfo));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "bSelected";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ClassIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IllustrateBackgroundIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IllustrateIcon";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DamageTypeIcon";
    local_14.TypeName = "FSlateBrush";
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
    local_14.PropertyName = "SpecialtyDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DefaultWeaponIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SpecialtyBackgroundDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DefaultDivineSkillName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AvatarIllustrateDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AvatarPowerName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsHover";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "UnlockConditions";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_AvatarUnlockCondition>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "UnLockStateIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bUseBtnSelect";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsActive";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectBtnVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_SpecialtyItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_SpecialtyItem;
    FEUIModelEffectDefine local_20;
    local_20.FunctionName = "RefreshIsLocked";
    Result.EffectFunctions.Add(local_20);
    local_20.FunctionName = "RefreshAvatarPowerName";
    Result.EffectFunctions.Add(local_20);
    local_20.FunctionName = "RefreshCondition";
    Result.EffectFunctions.Add(local_20);
    FEUIModelMonitorDefine local_30;
    local_30.FunctionName = "__OnPlayerSpecialtyChanged";
    local_30.ComponentType = FC_DSPlayerInfo;
    Result.MonitorFunctions.Add(local_30);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_SpecialtyItem;
}
void __OnPlayerSpecialtyChanged(FVM_SpecialtyItem &inout Model, const FECSEntity &inout Entity, const FC_DSPlayerInfo &inout Component)
{
    Model.OnPlayerSpecialtyChanged(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
bool __UIGetter_bSelected(const FVM_SpecialtyItem &inout Model)
{
    return Model.GetbSelected();
}
FText __UIGetter_DisplayName(const FVM_SpecialtyItem &inout Model)
{
    return Model.GetDisplayName();
}
FSoftBrush __UIGetter_ClassIcon(const FVM_SpecialtyItem &inout Model)
{
    return Model.GetClassIcon();
}
FSoftBrush __UIGetter_IllustrateBackgroundIcon(const FVM_SpecialtyItem &inout Model)
{
    return Model.GetIllustrateBackgroundIcon();
}
FSlateBrush __UIGetter_IllustrateIcon(const FVM_SpecialtyItem &inout Model)
{
    return Model.GetIllustrateIcon();
}
FSlateBrush __UIGetter_DamageTypeIcon(const FVM_SpecialtyItem &inout Model)
{
    return Model.GetDamageTypeIcon();
}
FText __UIGetter_WeaponTypeDisplayName(const FVM_SpecialtyItem &inout Model)
{
    return Model.GetWeaponTypeDisplayName();
}
FText __UIGetter_AvatarBackgroundDesc(const FVM_SpecialtyItem &inout Model)
{
    return Model.GetAvatarBackgroundDesc();
}
FText __UIGetter_SpecialtyDesc(const FVM_SpecialtyItem &inout Model)
{
    return Model.GetSpecialtyDesc();
}
FSoftBrush __UIGetter_DefaultWeaponIcon(const FVM_SpecialtyItem &inout Model)
{
    return Model.GetDefaultWeaponIcon();
}
FText __UIGetter_SpecialtyBackgroundDesc(const FVM_SpecialtyItem &inout Model)
{
    return Model.GetSpecialtyBackgroundDesc();
}
FText __UIGetter_DefaultDivineSkillName(const FVM_SpecialtyItem &inout Model)
{
    return Model.GetDefaultDivineSkillName();
}
FText __UIGetter_AvatarIllustrateDesc(const FVM_SpecialtyItem &inout Model)
{
    return Model.GetAvatarIllustrateDesc();
}
FText __UIGetter_AvatarPowerName(const FVM_SpecialtyItem &inout Model)
{
    return Model.GetAvatarPowerName();
}
bool __UIGetter_bIsHover(const FVM_SpecialtyItem &inout Model)
{
    return Model.GetbIsHover();
}
TArray<TEUIModelRef<FVM_AvatarUnlockCondition>> __UIGetter_UnlockConditions(const FVM_SpecialtyItem &inout Model)
{
    return Model.GetUnlockConditions();
}
int __UIGetter_UnLockStateIndex(const FVM_SpecialtyItem &inout Model)
{
    return Model.GetUnLockStateIndex();
}
bool __UIGetter_bUseBtnSelect(const FVM_SpecialtyItem &inout Model)
{
    return Model.GetbUseBtnSelect();
}
bool __UIGetter_bIsActive(const FVM_SpecialtyItem &inout Model)
{
    return Model.GetbIsActive();
}
ESlateVisibility __UIGetter_SelectBtnVisibility(const FVM_SpecialtyItem &inout Model)
{
    return Model.SelectBtnVisibility();
}
TEUIModelRef<FVM_SpecialtyItem> __UIGetter_Self(const FVM_SpecialtyItem &inout Model)
{
    return TEUIModelRef<FVM_SpecialtyItem>(Model);
}
int __IndexOf_AvatarInfo()
{
    return 0;
}
int __IndexOf_bSelected()
{
    return 1;
}
int __IndexOf_DisplayName()
{
    return 2;
}
int __IndexOf_ClassIcon()
{
    return 3;
}
int __IndexOf_IllustrateBackgroundIcon()
{
    return 4;
}
int __IndexOf_IllustrateIcon()
{
    return 5;
}
int __IndexOf_DamageTypeIcon()
{
    return 6;
}
int __IndexOf_WeaponTypeDisplayName()
{
    return 7;
}
int __IndexOf_AvatarBackgroundDesc()
{
    return 8;
}
int __IndexOf_SpecialtyDesc()
{
    return 9;
}
int __IndexOf_DefaultWeaponIcon()
{
    return 10;
}
int __IndexOf_SpecialtyBackgroundDesc()
{
    return 11;
}
int __IndexOf_DefaultDivineSkillName()
{
    return 12;
}
int __IndexOf_AvatarIllustrateDesc()
{
    return 13;
}
int __IndexOf_AvatarPowerName()
{
    return 14;
}
int __IndexOf_bIsHover()
{
    return 15;
}
int __IndexOf_UnlockConditions()
{
    return 16;
}
int __IndexOf_UnLockStateIndex()
{
    return 17;
}
int __IndexOf_bUseBtnSelect()
{
    return 18;
}
int __IndexOf_bIsActive()
{
    return 19;
}
int __IndexOf_bNeverActive()
{
    return 20;
}
}
namespace __GeneratedProperties_FVM_SpecialtyItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

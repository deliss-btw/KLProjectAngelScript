
namespace FVMS_ChangeRole
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnCancel = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnConfirm = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature GotoAvatarBuildPage = FEUIModelCallbackSignature();

}
struct FVMS_ChangeRole : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    int m_SlotIndex;
    UPROPERTY()
    int m_CurrentSelectedRoleIndex;
    UPROPERTY()
    bool m_bShouldClose;
    UPROPERTY()
    TArray<FEUIModelRef> m_AllRoles;
    UPROPERTY()
    FEUIModelRef m_SelectedAvatar;
    UPROPERTY()
    FEUIModelRef m_AvatarEquipment;
    UPROPERTY()
    TArray<FName> m_CurrentRoleNames;
    UPROPERTY()
    TArray<int> m_SelectedIdxToConfigIdx;
    UPROPERTY()
    TArray<int> m_MainPlayerSlots;
    UPROPERTY()
    FSlateBrush m_SelectAvatarBrush;
    UPROPERTY()
    FText m_SelectAvatarClass;
    UPROPERTY()
    FText m_SelectAvatarIllustrate;
    UPROPERTY()
    FText m_SelectAvatarAttack;
    UPROPERTY()
    FText m_SelectAvatarPostureAttack;
    UPROPERTY()
    FSlateBrush m_OtherAvatarBrush;

    FVMS_ChangeRole()
    {
        this.m_SlotIndex = 0;
        this.m_CurrentSelectedRoleIndex = -1;
        this.m_bShouldClose = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_ChangeRole(const FVMS_ChangeRole &inout Other)
    {
        this.m_SlotIndex = 0;
        this.m_CurrentSelectedRoleIndex = -1;
        this.m_bShouldClose = false;
        this.m_SlotIndex = int(Other.m_SlotIndex);
        this.m_CurrentSelectedRoleIndex = int(Other.m_CurrentSelectedRoleIndex);
        this.m_bShouldClose = Other.m_bShouldClose;
        this.m_AllRoles = Other.m_AllRoles;
        this.m_SelectedAvatar = Other.m_SelectedAvatar;
        this.m_AvatarEquipment = Other.m_AvatarEquipment;
        this.m_CurrentRoleNames = Other.m_CurrentRoleNames;
        this.m_SelectedIdxToConfigIdx = Other.m_SelectedIdxToConfigIdx;
        this.m_MainPlayerSlots = Other.m_MainPlayerSlots;
        this.m_SelectAvatarBrush = Other.m_SelectAvatarBrush;
        this.m_SelectAvatarClass = Other.m_SelectAvatarClass;
        this.m_SelectAvatarIllustrate = Other.m_SelectAvatarIllustrate;
        this.m_SelectAvatarAttack = Other.m_SelectAvatarAttack;
        this.m_SelectAvatarPostureAttack = Other.m_SelectAvatarPostureAttack;
        this.m_OtherAvatarBrush = Other.m_OtherAvatarBrush;
        return;
    }
    FVMS_ChangeRole& opAssign(const FVMS_ChangeRole &inout Other)
    {
        this.m_SlotIndex = int(Other.m_SlotIndex);
        this.m_CurrentSelectedRoleIndex = int(Other.m_CurrentSelectedRoleIndex);
        this.m_bShouldClose = Other.m_bShouldClose;
        this.m_AllRoles = Other.m_AllRoles;
        this.m_SelectedAvatar = Other.m_SelectedAvatar;
        this.m_AvatarEquipment = Other.m_AvatarEquipment;
        this.m_CurrentRoleNames = Other.m_CurrentRoleNames;
        this.m_SelectedIdxToConfigIdx = Other.m_SelectedIdxToConfigIdx;
        this.m_MainPlayerSlots = Other.m_MainPlayerSlots;
        this.m_SelectAvatarBrush = Other.m_SelectAvatarBrush;
        this.m_SelectAvatarClass = Other.m_SelectAvatarClass;
        this.m_SelectAvatarIllustrate = Other.m_SelectAvatarIllustrate;
        this.m_SelectAvatarAttack = Other.m_SelectAvatarAttack;
        this.m_SelectAvatarPostureAttack = Other.m_SelectAvatarPostureAttack;
        return Other.m_OtherAvatarBrush;
    }
    void PostConstruct()
    {
        bool local_1;
        TDataObjectPtr<FAvatarPrefabConfig> local_52;
        UDataTable local_148;
        UDataTable local_834;
        UClass local_858;
        ACharacterPrefab local_862;
        this.SetbShouldClose(false);
        FVMS_CurrentRole& local_4 = ::FVMS_CurrentRole::Get(this.GetContext().Manager);
        TDataObjectPtr<FAvatarPrefabConfig> local_28 = local_4.GetSubAvatarConfig();
        if (!(!((local_28 == nullptr)) && !((local_4.GetMainAvatarConfig() == nullptr))))
        {
            return;
        }
        this.SetSlotIndex(local_4.GetSlotIndex());
        FAvatarPrefabConfig local_56;
        TDataObjectPtr<FGameAttribute_DefaultConfig> local_82 = TDataObjectPtr<FGameAttribute_DefaultConfig>(local_56.InitValues);
        FAvatarPrefabConfig local_58;
        TDataObjectPtr<FGameAttribute_DefaultConfig> local_82_2 = TDataObjectPtr<FGameAttribute_DefaultConfig>(local_58.InitValues);
        if (this.GetSlotIndex() == 0)
        {
            FEUIModelRef local_134;
            FSlateBrush local_132;
            FGameAttribute_DefaultConfig local_86;
            this.SetOtherAvatarBrush(local_56.PlayerTachieBack.LoadBrush());
            local_132 = local_58.PlayerTachie.LoadBrush();
            this.SetSelectAvatarBrush(local_132);
            local_28 = TDataObjectPtr<FAvatarPrefabConfig>(local_58);
            this.SetSelectedAvatar(local_134);
            this.SetSelectAvatarClass(local_58.PlayerPowerName);
            this.SetSelectAvatarIllustrate(local_58.PlayerIllustrate1);
            this.SetSelectAvatarAttack(this.MakeAttackDisplayText(local_86.Attack));
            this.SetSelectAvatarPostureAttack(this.MakePostureAttackDisplayText(local_86.PostureAttack));
        }
        else
        {
            FEUIModelRef local_134;
            FSlateBrush local_132;
            FGameAttribute_DefaultConfig local_84;
            this.SetOtherAvatarBrush(local_132);
            this.SetSelectAvatarBrush(local_132);
            local_52 = TDataObjectPtr<FAvatarPrefabConfig>(local_56);
            this.SetSelectedAvatar(local_134);
            this.SetSelectAvatarAttack(this.MakeAttackDisplayText(local_84.Attack));
            this.SetSelectAvatarPostureAttack(this.MakePostureAttackDisplayText(local_84.PostureAttack));
        }
        GetDefaulted local_144;
        TWeakObjectPtr<UDataTable> local_146 = TWeakObjectPtr<UDataTable>(local_144.opCall().DTRoles);
        if (!((local_148 != nullptr)))
        {
            XError(ELog(0), "DTRoles is null");
            return;
        }
        this.GetModify_CurrentRoleNames().Reset(0);
        this.GetModify_MainPlayerSlots().Reset(0);
        if (this.GetContext().GetLocalPlayer().IsValid())
        {
            FAvatarPrefabConfig local_828;
            FECSEntity local_154 = this.GetContext().GetLocalPlayer();
            Get local_158;
            const FC_PlayerController& local_160 = local_158.opCall();
            if (local_160)
            {
                int local_161 = 0;
                for (; local_161 < local_160.GetAllPlayerPawnEntities().Num(); ++local_161)
                {
                    FName local_832 = ::GetPrefabAvatarName(local_160.GetAllPlayerPawnEntities()[local_161]);
                    this.GetModify_CurrentRoleNames().Add(local_832);
                    if (local_834.FindRow(local_832, local_828))
                    {
                        if (local_828.bIsMainPlayer)
                        {
                            this.GetModify_MainPlayerSlots().Add(local_161);
                        }
                    }
                }
            }
        }
        TArray<FEUIModelRef>& local_836 = this.GetModify_AllRoles();
        this.GetModify_SelectedIdxToConfigIdx().Reset(0);
        local_836.Reset(0);
        TArray<TDataObjectPtr<FAvatarPrefabConfig>> local_844 = this.GetChangeRoleDataObjects();
        int local_161_2 = 0;
        for (; local_161_2 < local_844.Num(); ++local_161_2)
        {
            FAvatarPrefabConfig local_828;
            FSoftObjectPath local_852;
            local_858 = Cast<UClass>(local_852.TryLoad());
            if (local_858 == nullptr)
            {
                continue;
            }
            local_862 = Cast<ACharacterPrefab>(local_858.GetDefaultObject());
            if (local_862 == nullptr)
            {
                continue;
            }
            FName local_830 = local_862.PrefabConfig.Config_FC_PrefabConfig.GetPrefabAvatarName();
            if (local_834.FindRow(local_830, local_828))
            {
                bool local_863;
                local_863 = this.GetCurrentRoleNames().Contains(local_830);
                bool local_53 = (this.GetMainPlayerSlots().Num() > 0) && !(this.GetMainPlayerSlots().Contains(this.GetSlotIndex()));
                local_1 = !(local_863);
                local_1 = (local_1 && local_53) && local_828.bIsMainPlayer;
                if (local_1)
                {
                    continue;
                }
                FVM_RoleItem& local_868 = ::FVM_RoleItem::Create(this.GetContext().Manager);
                local_836.Add(FEUIModelRef(local_868));
                this.GetModify_SelectedIdxToConfigIdx().Add(local_161_2);
                local_868.SetSelectedRoleIndex((local_836.Num() - 1));
                local_868.SetAvatarConfig(local_52);
                local_868.SetbIsCurrent(local_863);
                local_868.SetbIsSelected((FName(this.GetCurrentRoleNames()[this.GetSlotIndex()]) == local_830));
                if (local_868.GetbIsSelected())
                {
                    this.SetCurrentSelectedRoleIndex(local_868.GetSelectedRoleIndex());
                }
            }
        }
        return;
    }
    TArray<TDataObjectPtr<FAvatarPrefabConfig>> GetChangeRoleDataObjects()
    {
        UGameClientConnectionSubsystem local_4 = ::UGameClientConnectionSubsystem::Get();
        if (local_4 != nullptr && local_4.IsConnectedToGameServer())
        {
            FECSEntity local_10 = this.GetContext().GetLocalPlayer();
            Get local_14;
            const FC_DSPlayerAvatarInfo& local_16 = local_14.opCall();
            if (local_16)
            {
                TArray<TDataObjectPtr<FAvatarPrefabConfig>> local_20;
                for (auto& local_34 : local_16.GetAvatarList())
                {
                    TDataObjectPtr<FAvatarPrefabConfig> local_60 = ::FAvatarPrefabConfig::GetByDataId(local_34.GetAvatarId());
                    if (local_60)
                    {
                        local_20.Add(local_60);
                    }
                }
                return local_20;
            }
        }
        const UAS_GameModeSettings local_88 = ::GameModeSettings::GetGameModeSettings(this.GetContext().Manager.GetWorld());
        if ((!((local_88 != nullptr))))
        {
            XError(ELog(0), "GameModeSettings is null");
            return local_20;
        }
        return local_88.ChangeRoleDataObjects;
    }
    void SelectRoleIndex(const int Idx)
    {
        int local_10 = 0;
        int local_1 = 0;
        for (; local_1 < this.GetAllRoles().Num(); )
        {
            local_10.SetbIsSelected((local_1 == Idx));
            ++local_1;
        }
        this.SetCurrentSelectedRoleIndex(Idx);
        return;
    }
    void OnCancel()
    {
        this.SetbShouldClose(true);
        ::FVMS_CurrentRole::Get(this.GetContext().Manager).SetbChangeRoleClicked(false);
        return;
    }
    void OnConfirm()
    {
        int local_28 = 0;
        int local_41 = 0;
        if (this.GetCurrentSelectedRoleIndex() < 0 || (this.GetCurrentSelectedRoleIndex() >= this.GetAllRoles().Num()))
        {
            return;
        }
        FECSWorldPtr local_10 = this.GetContext().GetLocalPlayer().GetWorld();
        Get local_14;
        if (!(::FSwitchPlayerUtils::CheckSwitchPlayerCondition(this.GetContext().GetLocalPlayer(), local_14.opCall().Time)))
        {
            FCommonTipsParam local_22;
            ::CommonPopup::Tips(NSLOCTEXT("ChangeRole", "ChangeRole_CheckConditionFailed", "еЅ“е‰ЌзЉ¶жЂЃж— жі•е€‡жЌўи§’и‰І"), local_22);
            return;
        }
        int local_2 = this.GetCurrentSelectedRoleIndex();
        if (local_28.GetbIsCurrent())
        {
            FCommonTipsParam local_22;
            if ((FName(this.GetCurrentRoleNames()[this.GetSlotIndex()]) == local_28.GetAvatarConfig().GetDataName()))
            {
                this.OnCancel();
                return;
            }
            ::CommonPopup::Tips(NSLOCTEXT("ChangeRole", "ChangeRole_IsCurrent", "еЅ“е‰Ќи§’и‰Іе·Із»ЏењЁењєдёЉ"), local_22);
            return;
        }
        FFPTime local_38 = FFPTime(-1);
        FECSEntity local_8 = this.GetContext().GetLocalPlayer();
        FCE_ClientToServerChangeRole local_40;
        local_40.SlotIndex = this.GetSlotIndex();
        int local_1 = this.GetCurrentSelectedRoleIndex();
        local_40.AvatarId = local_41;
        return;
    }
    void OnChangeRoleResult(const FCE_ServerToClientChangeRole &inout Event)
    {
        this.SetbShouldClose(true);
        ::FVMS_CurrentRole::Get(this.GetContext().Manager).RefreshRoleInfo();
        return;
    }
    void OnSelectIndexChanged()
    {
        EEquipSlotType local_140;
        int local_1 = this.GetCurrentSelectedRoleIndex();
        Get local_6;
        TDataObjectPtr<FAvatarPrefabConfig> local_30 = local_6.opCall().GetAvatarConfig();
        FAvatarPrefabConfig local_56;
        TDataObjectPtr<FGameAttribute_DefaultConfig> local_80 = TDataObjectPtr<FGameAttribute_DefaultConfig>(local_56.InitValues);
        this.SetSelectAvatarBrush(local_56.PlayerTachie.LoadBrush());
        TDataObjectPtr<FAvatarPrefabConfig> local_54 = TDataObjectPtr<FAvatarPrefabConfig>(local_56);
        this.SetSelectedAvatar(FEUIModelRef());
        this.SetSelectAvatarClass(local_56.PlayerPowerName);
        this.SetSelectAvatarIllustrate(local_56.PlayerIllustrate1);
        FGameAttribute_DefaultConfig local_82;
        this.SetSelectAvatarAttack(this.MakeAttackDisplayText(local_82.Attack));
        this.SetSelectAvatarPostureAttack(this.MakePostureAttackDisplayText(local_82.PostureAttack));
        if (!(local_140))
        {
            local_140 = TEUIModelRef<FM_Avatar>(::FM_Avatar::Create(this.GetContext().Manager, local_30));
        }
        this.SetAvatarEquipment(FEUIModelRef());
        return;
    }
    void GotoAvatarBuildPage()
    {
        int local_1 = this.GetCurrentSelectedRoleIndex();
        Get local_6;
        TDataObjectPtr<FAvatarPrefabConfig> local_30 = local_6.opCall().GetAvatarConfig();
        ::FVM_AvatarBuildPage::GotoPage(this.GetContext().UELocalPlayer, local_30);
        return;
    }
    FText MakeAttackDisplayText(const float32 Attack)
    {
        FText local_4;
        FText::AsNumber(local_4, Attack);
        return FText::Format(NSLOCTEXT("ChangeRole", "ChangeRole_AttackFmt", "ж”»е‡»:{0}"), local_4);
    }
    FText MakePostureAttackDisplayText(const float32 PostureAttack)
    {
        FText local_4;
        FText::AsNumber(local_4, PostureAttack);
        return FText::Format(NSLOCTEXT("ChangeRole", "ChangeRole_PostureAttackFmt", "жћ¶еЉїж”»е‡»:{0}"), local_4);
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
    int GetCurrentSelectedRoleIndex() const property
    {
        this.TrackPropertyRead(1);
        return this.m_CurrentSelectedRoleIndex;
    }
    void SetCurrentSelectedRoleIndex(const int __Value) property
    {
        if (this.m_CurrentSelectedRoleIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CurrentSelectedRoleIndex = __Value;
        return;
    }
    bool GetbShouldClose() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bShouldClose;
    }
    void SetbShouldClose(const bool __Value) property
    {
        if (!(this.m_bShouldClose) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bShouldClose = __Value;
        return;
    }
    const TArray<FEUIModelRef> GetAllRoles() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_AllRoles() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetAllRoles(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_AllRoles = __Value;
        return;
    }
    FEUIModelRef GetSelectedAvatar() const property
    {
        FEUIModelRef __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FEUIModelRef GetModify_SelectedAvatar() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetSelectedAvatar(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_SelectedAvatar = __Value;
        return;
    }
    FEUIModelRef GetAvatarEquipment() const property
    {
        FEUIModelRef __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FEUIModelRef GetModify_AvatarEquipment() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetAvatarEquipment(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_AvatarEquipment = __Value;
        return;
    }
    const TArray<FName> GetCurrentRoleNames() const property
    {
        const TArray<FName> __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    TArray<FName> GetModify_CurrentRoleNames() property
    {
        TArray<FName> __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetCurrentRoleNames(const TArray<FName> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_CurrentRoleNames = __Value;
        return;
    }
    const TArray<int> GetSelectedIdxToConfigIdx() const property
    {
        const TArray<int> __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    TArray<int> GetModify_SelectedIdxToConfigIdx() property
    {
        TArray<int> __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetSelectedIdxToConfigIdx(const TArray<int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_SelectedIdxToConfigIdx = __Value;
        return;
    }
    const TArray<int> GetMainPlayerSlots() const property
    {
        const TArray<int> __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    TArray<int> GetModify_MainPlayerSlots() property
    {
        TArray<int> __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetMainPlayerSlots(const TArray<int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_MainPlayerSlots = __Value;
        return;
    }
    const FSlateBrush GetSelectAvatarBrush() const property
    {
        const FSlateBrush __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    FSlateBrush GetModify_SelectAvatarBrush() property
    {
        FSlateBrush __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetSelectAvatarBrush(const FSlateBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_SelectAvatarBrush = __Value;
        return;
    }
    const FText GetSelectAvatarClass() const property
    {
        const FText __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    FText GetModify_SelectAvatarClass() property
    {
        FText __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetSelectAvatarClass(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_SelectAvatarClass = __Value;
        return;
    }
    const FText GetSelectAvatarIllustrate() const property
    {
        const FText __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    FText GetModify_SelectAvatarIllustrate() property
    {
        FText __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetSelectAvatarIllustrate(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_SelectAvatarIllustrate = __Value;
        return;
    }
    const FText GetSelectAvatarAttack() const property
    {
        const FText __r;
        this.TrackPropertyRead(12);
        return __r;
    }
    FText GetModify_SelectAvatarAttack() property
    {
        FText __r;
        this.MarkPropertyDirty(12);
        return __r;
    }
    void SetSelectAvatarAttack(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_SelectAvatarAttack = __Value;
        return;
    }
    const FText GetSelectAvatarPostureAttack() const property
    {
        const FText __r;
        this.TrackPropertyRead(13);
        return __r;
    }
    FText GetModify_SelectAvatarPostureAttack() property
    {
        FText __r;
        this.MarkPropertyDirty(13);
        return __r;
    }
    void SetSelectAvatarPostureAttack(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_SelectAvatarPostureAttack = __Value;
        return;
    }
    const FSlateBrush GetOtherAvatarBrush() const property
    {
        const FSlateBrush __r;
        this.TrackPropertyRead(14);
        return __r;
    }
    FSlateBrush GetModify_OtherAvatarBrush() property
    {
        FSlateBrush __r;
        this.MarkPropertyDirty(14);
        return __r;
    }
    void SetOtherAvatarBrush(const FSlateBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_OtherAvatarBrush = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_ChangeRole
{
    UPROPERTY()
    TEUIModelRef<FVMS_ChangeRole> Self;

    __GeneratedProperties_FVMS_ChangeRole()
    {
        return;
    }
}

namespace FVMS_ChangeRole
{
FVMS_ChangeRole& Get(const UObject ContextObject)
{
    return FVMS_ChangeRole::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_ChangeRole GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_ChangeRole __r;
    TEUIModelRef<FVMS_ChangeRole> local_6 = TEUIModelRef<FVMS_ChangeRole>(EUIInternal::MakeModelWithManager(Manager, FVMS_ChangeRole::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "AllRoles";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedAvatar";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AvatarEquipment";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectAvatarBrush";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectAvatarClass";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectAvatarIllustrate";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectAvatarAttack";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectAvatarPostureAttack";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "OtherAvatarBrush";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_ChangeRole>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_ChangeRole;
    FEUIModelEventDefine local_22;
    local_22.FunctionName = "__OnChangeRoleResult";
    local_22.EventType = FCE_ServerToClientChangeRole;
    Result.EventFunctions.Add(local_22);
    FEUIModelDirtyDefine local_30;
    local_30.FunctionName = "__OnSelectIndexChanged";
    local_30.DirtyFlags.Set(FVMS_ChangeRole::__IndexOf_CurrentSelectedRoleIndex());
    Result.DirtyFunctions.Add(local_30);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_ChangeRole;
}
void __OnChangeRoleResult(FVMS_ChangeRole &inout Model, const FCE_ServerToClientChangeRole &inout Event)
{
    Model.OnChangeRoleResult(Event);
    return;
}
void __OnSelectIndexChanged(FVMS_ChangeRole &inout Model)
{
    Model.OnSelectIndexChanged();
    return;
}
TArray<FEUIModelRef> __UIGetter_AllRoles(const FVMS_ChangeRole &inout Model)
{
    return Model.GetAllRoles();
}
FEUIModelRef __UIGetter_SelectedAvatar(const FVMS_ChangeRole &inout Model)
{
    return Model.GetSelectedAvatar();
}
FEUIModelRef __UIGetter_AvatarEquipment(const FVMS_ChangeRole &inout Model)
{
    return Model.GetAvatarEquipment();
}
FSlateBrush __UIGetter_SelectAvatarBrush(const FVMS_ChangeRole &inout Model)
{
    return Model.GetSelectAvatarBrush();
}
FText __UIGetter_SelectAvatarClass(const FVMS_ChangeRole &inout Model)
{
    return Model.GetSelectAvatarClass();
}
FText __UIGetter_SelectAvatarIllustrate(const FVMS_ChangeRole &inout Model)
{
    return Model.GetSelectAvatarIllustrate();
}
FText __UIGetter_SelectAvatarAttack(const FVMS_ChangeRole &inout Model)
{
    return Model.GetSelectAvatarAttack();
}
FText __UIGetter_SelectAvatarPostureAttack(const FVMS_ChangeRole &inout Model)
{
    return Model.GetSelectAvatarPostureAttack();
}
FSlateBrush __UIGetter_OtherAvatarBrush(const FVMS_ChangeRole &inout Model)
{
    return Model.GetOtherAvatarBrush();
}
TEUIModelRef<FVMS_ChangeRole> __UIGetter_Self(const FVMS_ChangeRole &inout Model)
{
    return TEUIModelRef<FVMS_ChangeRole>(Model);
}
int __IndexOf_SlotIndex()
{
    return 0;
}
int __IndexOf_CurrentSelectedRoleIndex()
{
    return 1;
}
int __IndexOf_bShouldClose()
{
    return 2;
}
int __IndexOf_AllRoles()
{
    return 3;
}
int __IndexOf_SelectedAvatar()
{
    return 4;
}
int __IndexOf_AvatarEquipment()
{
    return 5;
}
int __IndexOf_CurrentRoleNames()
{
    return 6;
}
int __IndexOf_SelectedIdxToConfigIdx()
{
    return 7;
}
int __IndexOf_MainPlayerSlots()
{
    return 8;
}
int __IndexOf_SelectAvatarBrush()
{
    return 9;
}
int __IndexOf_SelectAvatarClass()
{
    return 10;
}
int __IndexOf_SelectAvatarIllustrate()
{
    return 11;
}
int __IndexOf_SelectAvatarAttack()
{
    return 12;
}
int __IndexOf_SelectAvatarPostureAttack()
{
    return 13;
}
int __IndexOf_OtherAvatarBrush()
{
    return 14;
}
}
namespace __GeneratedProperties_FVMS_ChangeRole
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

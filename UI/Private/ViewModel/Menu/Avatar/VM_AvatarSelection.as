
namespace FVM_AvatarSelection
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnSelectIllustrateFilter = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnSelectAvatar = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature ApplySelection = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature GotoAvatarBuildPage = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature GotoAvatarWeaponPage = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature GotoAvatarTalentPage = FEUIModelCallbackSignature();
}
namespace FVM_AvatarSelectionShowcase
{
    const int ModelId = 0;

}
struct FMsg_AvatarSelectionSelectedChanged : FEUIMessage
{
    UPROPERTY()
    TEUIModelRef<FVM_AvatarInfo> SelectedAvatar;

    FMsg_AvatarSelectionSelectedChanged()
    {
        return;
    }
}

struct FVM_AvatarSelection : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_SelectedAvatarIndex;
    UPROPERTY()
    int m_SelectionTargetSlotIndex;
    UPROPERTY()
    FSoftBrush m_AvatarIllustrateIconAll;
    UPROPERTY()
    FGameplayTag m_RedDotNewAvatarTag;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarInfo> m_SelectedAvatar;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_AvatarInfo>> m_AllAvatars;
    UPROPERTY()
    TArray<FEUIModelContainer> m_FilteredAvatars;
    UPROPERTY()
    TArray<FEUIModelContainer> m_IllustrateTypes;
    UPROPERTY()
    EAvatarIllustrate m_FilterByIllustrate;
    UPROPERTY()
    FAvatarApplySelection m_OnApply;
    UPROPERTY()
    TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> m_WeaponEntry;
    UPROPERTY()
    TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> m_TalentEntry;
    UPROPERTY()
    TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> m_RelicEntry;
    UPROPERTY()
    TEUIModelRef<FVM_TitleAndDesc> m_TitleHoverTipsVM;
    UPROPERTY()
    TArray<EAvatarIllustrate> m_AvailableIllustrateTypes;

    FVM_AvatarSelection()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_AvatarSelection(const FVM_AvatarSelection &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_AvatarSelection& opAssign(const FVM_AvatarSelection &inout Other)
    {
        this.m_SelectedAvatarIndex = int(Other.m_SelectedAvatarIndex);
        this.m_SelectionTargetSlotIndex = int(Other.m_SelectionTargetSlotIndex);
        this.m_AvatarIllustrateIconAll = Other.m_AvatarIllustrateIconAll;
        this.m_RedDotNewAvatarTag = Other.m_RedDotNewAvatarTag;
        this.m_SelectedAvatar = Other.m_SelectedAvatar;
        this.m_AllAvatars = Other.m_AllAvatars;
        this.m_FilteredAvatars = Other.m_FilteredAvatars;
        this.m_IllustrateTypes = Other.m_IllustrateTypes;
        this.m_FilterByIllustrate = Other.m_FilterByIllustrate;
        this.m_WeaponEntry = Other.m_WeaponEntry;
        this.m_TalentEntry = Other.m_TalentEntry;
        this.m_RelicEntry = Other.m_RelicEntry;
        this.m_TitleHoverTipsVM = Other.m_TitleHoverTipsVM;
        return Other.m_AvailableIllustrateTypes;
    }
    void LoadConfig(const FConfigVM_AvatarSelection &inout InConfig)
    {
        this.SetRedDotNewAvatarTag(InConfig.RedDotNewAvatarTag);
        this.SetAvatarIllustrateIconAll(InConfig.AvatarIllustrateIconAll);
        return;
    }
    FText GetSelectedAvatarName() const
    {
        FText local_12;
        if (this.GetSelectedAvatar())
        {
            TEUIModelRef<FVM_AvatarInfo> local_2 = this.GetSelectedAvatar();
        }
        else
        {
            local_12 = FText();
        }
        return local_12;
    }
    int GetSelectAvatarSlotIndex() const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    bool IsSelectCombatAvatar() const
    {
        if (this.GetSelectedAvatar())
        {
            TEUIModelRef<FVM_AvatarInfo> local_2 = this.GetSelectedAvatar();
            return IsCombatAvatar();
        }
        return false;
    }
    void PostConstruct()
    {
        const UUtilitySettings local_14;
        const UAvatarBuildSettings local_42;
        this.SetTitleHoverTipsVM(TEUIModelRef<FVM_TitleAndDesc>(::FVM_TitleAndDesc::Create(this.GetManager(), NSLOCTEXT("AssaultAvatarTitle", "еЌЏж€и§’и‰ІиЇґжЋ"), NSLOCTEXT("AssaultAvatarDesc", "еЌЏж€и§’и‰Ід»…еЏЇењЁйѓЁе€†зЋ©жі•дё­е€‡жЌўе‡єж€пјЊдёЋдё»ж€и§’и‰Іж€ж–—зЉ¶жЂЃеђЊж­ҐпјЊдёЌеЅ±е“ЌзҐћж јжЉЂжїЂжґ»"))));
        GetGameplaySettings<UUtilitySettings> local_16;
        local_14 = local_16;
        FEUIModelContainer local_32;
        UEUIManagerSubsystem local_10 = this.GetManager();
        FEUIModelRef local_36;
        local_32.AddModel(local_36, false);
        FVM_CommonTabItem& local_38 = ::FVM_CommonTabItem::Create(this.GetManager());
        local_38.SetTitleText(NSLOCTEXT("AvatarIllustrateAll", "е…ЁйѓЁ"));
        local_36 = FEUIModelRef(local_38);
        local_32.AddModel(local_36, false);
        this.GetModify_IllustrateTypes().Add(local_32);
        this.GetModify_AvailableIllustrateTypes().Add(EAvatarIllustrate(3));
        GetGameplaySettings<UAvatarBuildSettings> local_44;
        local_42 = local_44;
        if (local_42 != nullptr)
        {
            int local_48 = 0;
            for (; local_48 < 3; ++local_48)
            {
                if (local_42.AvatarIllustrateInfos.Find(EAvatarIllustrate(local_48)))
                {
                    FEUIModelContainer local_66;
                    UEUIManagerSubsystem local_10_2 = this.GetManager();
                    local_66.AddModel(local_36, false);
                    local_66.AddModel(FEUIModelRef(::FVM_CommonTabItem::Create(this.GetManager())), false);
                    this.GetModify_IllustrateTypes().Add(local_66);
                    this.GetModify_AvailableIllustrateTypes().Add(EAvatarIllustrate(local_48));
                }
            }
        }
        return;
    }
    void PostLoad()
    {
        for (auto& local_16 : this.GetIllustrateTypes())
        {
            FVM_Image& local_22 = FEUIModelContainer::GetModel(local_16).opCall();
            if (local_22)
            {
                TSoftObjectPtr<UObject> local_32;
                local_32 = local_22.GetImage().GetResourceObject();
                if ((local_32 == nullptr))
                {
                    local_22.SetImage(this.GetAvatarIllustrateIconAll());
                }
            }
        }
        return;
    }
    bool IsIllustrateFilterNotReachMax() const
    {
        if (this.GetAvailableIllustrateTypes().IndexOfByKey(this.GetFilterByIllustrate()) == (this.GetAvailableIllustrateTypes().Num() - 1))
        {
            return false;
        }
        return true;
    }
    bool IsIllustrateFilterNotReachMin() const
    {
        if (this.GetAvailableIllustrateTypes().IndexOfByKey(EAvatarIllustrate(this.GetFilterByIllustrate())) == 0)
        {
            return false;
        }
        return true;
    }
    void OnSelectIllustrateFilter(const int IllustrateFilterItemIndex)
    {
        if (!(this.GetAvailableIllustrateTypes().IsValidIndex(IllustrateFilterItemIndex)))
        {
            return;
        }
        this.SetFilterByIllustrate(EAvatarIllustrate(this.GetAvailableIllustrateTypes()[IllustrateFilterItemIndex]));
        return;
    }
    void OnSelectAvatar(const int AvatarIndex)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void RefreshFilteredAvatarList()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void RefreshSelectedAvatar()
    {
        int local_9 = 0;
        int local_20 = 0;
        if (this.GetFilteredAvatars().IsValidIndex(this.GetSelectedAvatarIndex()))
        {
            this.SetSelectedAvatar(TEUIModelRef<FVM_AvatarInfo>(nullptr));
            this.SetSelectedAvatar(TEUIModelRef<FVM_AvatarInfo>(FEUIModelContainer::GetModel(this.GetFilteredAvatars()[this.GetSelectedAvatarIndex()]).opCall()));
            TEUIModelRef<FVM_AvatarInfo> local_4 = this.GetSelectedAvatar();
            int64 local_12 = local_9;
            ::FMS_RedDotSystem::Get(this.GetContext().Manager).ConsumeRedDot(this.GetRedDotNewAvatarTag(), local_12);
            FEUIModelRef local_18 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus);
            local_20.SelectedAvatar = this.GetSelectedAvatar();
        }
        return;
    }
    void ApplySelection()
    {
        if (this.GetOnApply().IsBound())
        {
            this.GetOnApply().Execute(this.GetSelectedAvatar().opImplConv());
        }
        return;
    }
    void GotoAvatarBuildPage()
    {
        ::FVM_AvatarBuildPage::GotoPage(this.GetContext().UELocalPlayer, this.GetSelectedAvatar().opArrow().GetAvatarConfig());
        return;
    }
    bool GotoAvatarWeaponPage()
    {
        ::FVM_EquipmentEditPage::GotoPage(this.GetContext().UELocalPlayer, EEquipSlotType(1), this.GetSelectedAvatar().opArrow().GetAvatarConfig());
        return true;
    }
    bool GotoAvatarTalentPage()
    {
        if (!(::FVM_TalentEditPage::CanViewAvatarTalent(this.GetContext().Manager, this.GetSelectedAvatar().opArrow().GetAvatarConfig())))
        {
            return true;
        }
        ::FVM_TalentEditPage::GotoPage(this.GetContext().UELocalPlayer, this.GetSelectedAvatar().opArrow().GetAvatarConfig());
        return true;
    }
    void OnSelectedAvatarChanged()
    {
        this.RefreshEquipmentWeapon();
        return;
    }
    void HandleEquipmentChanged(const FMsg_AvatarEquipmentChanged &inout Changed)
    {
        this.RefreshEquipmentWeapon();
        return;
    }
    void RefreshEquipmentWeapon()
    {
        TEUIModelRef<FVM_EquipmentInfo> local_2;
        if (this.GetSelectedAvatar())
        {
            if (this.GetSelectedAvatar().opArrow().GetAvatarEquipment())
            {
                TEUIModelRef<FVM_EquipmentInfo> local_10;
                TEUIModelRef<FVM_AvatarEquipment> local_8 = this.GetSelectedAvatar().opArrow().GetAvatarEquipment();
                local_10.GetEquipment();
                local_2 = local_10;
            }
        }
        if (this.GetWeaponEntry().IsValid())
        {
            TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> local_12 = this.GetWeaponEntry();
            local_2.InitialzeAsWeapon();
        }
        return;
    }
    int GetSelectedAvatarIndex() const property
    {
        this.TrackPropertyRead(0);
        return this.m_SelectedAvatarIndex;
    }
    void SetSelectedAvatarIndex(const int __Value) property
    {
        if (this.m_SelectedAvatarIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_SelectedAvatarIndex = __Value;
        return;
    }
    int GetSelectionTargetSlotIndex() const property
    {
        this.TrackPropertyRead(1);
        return this.m_SelectionTargetSlotIndex;
    }
    void SetSelectionTargetSlotIndex(const int __Value) property
    {
        if (this.m_SelectionTargetSlotIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SelectionTargetSlotIndex = __Value;
        return;
    }
    const FSoftBrush GetAvatarIllustrateIconAll() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FSoftBrush GetModify_AvatarIllustrateIconAll() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetAvatarIllustrateIconAll(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_AvatarIllustrateIconAll = __Value;
        return;
    }
    const FGameplayTag GetRedDotNewAvatarTag() const property
    {
        const FGameplayTag __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FGameplayTag GetModify_RedDotNewAvatarTag() property
    {
        FGameplayTag __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetRedDotNewAvatarTag(const FGameplayTag &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_RedDotNewAvatarTag = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarInfo> GetSelectedAvatar() const property
    {
        this.TrackPropertyRead(4);
        return this.m_SelectedAvatar;
    }
    void SetSelectedAvatar(const TEUIModelRef<FVM_AvatarInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarInfo> local_2;
        local_2 = this.m_SelectedAvatar;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_SelectedAvatar = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_AvatarInfo>> GetAllAvatars() const property
    {
        const TArray<TEUIModelRef<FVM_AvatarInfo>> __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    TArray<TEUIModelRef<FVM_AvatarInfo>> GetModify_AllAvatars() property
    {
        TArray<TEUIModelRef<FVM_AvatarInfo>> __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetAllAvatars(const TArray<TEUIModelRef<FVM_AvatarInfo>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_AllAvatars = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetFilteredAvatars() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_FilteredAvatars() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetFilteredAvatars(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_FilteredAvatars = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetIllustrateTypes() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_IllustrateTypes() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetIllustrateTypes(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_IllustrateTypes = __Value;
        return;
    }
    EAvatarIllustrate GetFilterByIllustrate() const property
    {
        this.TrackPropertyRead(8);
        return this.m_FilterByIllustrate;
    }
    void SetFilterByIllustrate(const EAvatarIllustrate __Value) property
    {
        if (int(this.m_FilterByIllustrate) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_FilterByIllustrate = __Value;
        return;
    }
    const FAvatarApplySelection GetOnApply() const property
    {
        const FAvatarApplySelection __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    FAvatarApplySelection GetModify_OnApply() property
    {
        FAvatarApplySelection __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetOnApply(const FAvatarApplySelection &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        return;
    }
    TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> GetWeaponEntry() const property
    {
        this.TrackPropertyRead(10);
        return this.m_WeaponEntry;
    }
    void SetWeaponEntry(const TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> &inout __Value) property
    {
        TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> local_2;
        local_2 = this.m_WeaponEntry;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_WeaponEntry = __Value;
        return;
    }
    TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> GetTalentEntry() const property
    {
        this.TrackPropertyRead(11);
        return this.m_TalentEntry;
    }
    void SetTalentEntry(const TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> &inout __Value) property
    {
        TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> local_2;
        local_2 = this.m_TalentEntry;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_TalentEntry = __Value;
        return;
    }
    TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> GetRelicEntry() const property
    {
        this.TrackPropertyRead(12);
        return this.m_RelicEntry;
    }
    void SetRelicEntry(const TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> &inout __Value) property
    {
        TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> local_2;
        local_2 = this.m_RelicEntry;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_RelicEntry = __Value;
        return;
    }
    TEUIModelRef<FVM_TitleAndDesc> GetTitleHoverTipsVM() const property
    {
        this.TrackPropertyRead(13);
        return this.m_TitleHoverTipsVM;
    }
    void SetTitleHoverTipsVM(const TEUIModelRef<FVM_TitleAndDesc> &inout __Value) property
    {
        TEUIModelRef<FVM_TitleAndDesc> local_2;
        local_2 = this.m_TitleHoverTipsVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_TitleHoverTipsVM = __Value;
        return;
    }
    const TArray<EAvatarIllustrate> GetAvailableIllustrateTypes() const property
    {
        const TArray<EAvatarIllustrate> __r;
        this.TrackPropertyRead(14);
        return __r;
    }
    TArray<EAvatarIllustrate> GetModify_AvailableIllustrateTypes() property
    {
        TArray<EAvatarIllustrate> __r;
        this.MarkPropertyDirty(14);
        return __r;
    }
    void SetAvailableIllustrateTypes(const TArray<EAvatarIllustrate> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_AvailableIllustrateTypes = __Value;
        return;
    }
}

struct FVM_AvatarSelectionShowcase : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_SelectionApplyIndex;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_AvatarInfo>> m_TeamAvatars;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarShowcase> m_Showcase;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarSelection> m_Selection;
    UPROPERTY()
    bool m_bIsShowcaseAvatarChange;
    UPROPERTY()
    bool m_bIsDivineSkillNotSuit;

    FVM_AvatarSelectionShowcase()
    {
        this.m_SelectionApplyIndex = 0;
        this.m_bIsShowcaseAvatarChange = false;
        this.m_bIsDivineSkillNotSuit = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_AvatarSelectionShowcase(const FVM_AvatarSelectionShowcase &inout Other)
    {
        this.m_SelectionApplyIndex = 0;
        this.m_bIsShowcaseAvatarChange = false;
        this.m_bIsDivineSkillNotSuit = false;
        this.m_SelectionApplyIndex = int(Other.m_SelectionApplyIndex);
        this.m_TeamAvatars = Other.m_TeamAvatars;
        this.m_Showcase = Other.m_Showcase;
        this.m_Selection = Other.m_Selection;
        this.m_bIsShowcaseAvatarChange = Other.m_bIsShowcaseAvatarChange;
        this.m_bIsDivineSkillNotSuit = Other.m_bIsDivineSkillNotSuit;
        return;
    }
    FVM_AvatarSelectionShowcase opAssign(const FVM_AvatarSelectionShowcase &inout Other)
    {
        FVM_AvatarSelectionShowcase __r;
        this.m_SelectionApplyIndex = int(Other.m_SelectionApplyIndex);
        this.m_TeamAvatars = Other.m_TeamAvatars;
        this.m_Showcase = Other.m_Showcase;
        this.m_Selection = Other.m_Selection;
        this.m_bIsShowcaseAvatarChange = Other.m_bIsShowcaseAvatarChange;
        this.m_bIsDivineSkillNotSuit = Other.m_bIsDivineSkillNotSuit;
        return __r;
    }
    void Setup(const TEUIModelRef<FVM_AvatarShowcase> &inout InShowcase)
    {
        this.SetShowcase(InShowcase);
        this.RefreshShowcaseAvatars();
        return;
    }
    void OnAvatarSelectionSelectedChanged(const FMsg_AvatarSelectionSelectedChanged &inout Msg)
    {
        this.RefreshShowcaseAvatars();
        return;
    }
    void OnCombatSettingPresetUpdated(const FMsg_CombatSettingPresetUpdated &inout Msg)
    {
        this.RefreshShowcaseAvatars();
        return;
    }
    void RefreshShowcaseAvatars()
    {
        bool local_5;
        int local_280 = 0;
        TEUIModelRef<FM_DivineSkill> local_2 = ::FMS_DivineSkillData::Get(this.GetContext().Manager).GetLocalPlayerDivineSkill();
        TDataObjectPtr<FDivineSkillConfig> local_54;
        if (local_2)
        {
            local_54 = GetConfig();
        }
        else
        {
            local_54 = TDataObjectPtr<FDivineSkillConfig>();
        }
        if (!(this.GetShowcase()))
        {
            local_5 = false;
        }
        else
        {
            local_5 = this.GetSelection();
        }
        TEUIModelRef<FVM_AvatarInfo> local_134;
        if (local_5)
        {
            this.SetbIsShowcaseAvatarChange(false);
            TEUIModelRef<FVM_AvatarSelection> local_130 = this.GetSelection();
            TEUIModelRef<FVM_AvatarInfo> local_136;
            local_136.GetSelectedAvatar();
            TArray<FAvatarShowcaseEntry> local_140;
            int local_141 = 0;
            for (; local_141 < this.GetTeamAvatars().Num(); ++local_141)
            {
                TEUIModelRef<FVM_AvatarInfo> local_146;
                if (local_141 == this.GetSelectionApplyIndex())
                {
                    local_146 = local_134;
                }
                else
                {
                    if ((this.GetTeamAvatars()[local_141] == local_134.opImplConv()))
                    {
                        local_146 = this.GetTeamAvatars()[this.GetSelectionApplyIndex()];
                    }
                    else
                    {
                        local_146 = this.GetTeamAvatars()[local_141];
                    }
                }
                if (local_146)
                {
                    local_140.Add(::FAvatarShowcaseEntryUtils::FromAvatarInfo(local_146));
                }
            }
            if (local_140.Num() > this.GetSelectionApplyIndex() && (this.GetTeamAvatars().Num() > this.GetSelectionApplyIndex()))
            {
                FDataObjectPtr local_270;
                TDataObjectPtr<FAvatarPrefabConfig> local_222;
                local_222 = local_140[this.GetSelectionApplyIndex()].AvatarConfig;
                int local_197 = this.GetSelectionApplyIndex();
                local_270;
                if ((!((local_222 == local_270))))
                {
                    this.SetbIsShowcaseAvatarChange(true);
                }
            }
            if (local_54)
            {
                FECSEntity local_274 = this.GetContext().GetLocalPlayer();
                if (local_280.GetAllPlayerPawnEntities().IsValidIndex(0))
                {
                    FECSEntity local_284 = FECSEntity(local_280.GetAllPlayerPawnEntities()[0]);
                    if (local_284.IsValid())
                    {
                        if (::DivineSkillUtils::SuitForAvatar(local_54, local_284))
                        {
                            this.SetbIsDivineSkillNotSuit(false);
                        }
                    }
                }
            }
            TEUIModelRef<FVM_AvatarShowcase> local_128 = this.GetShowcase();
            local_140.SetNextAvatarEntries();
        }
        return;
    }
    int GetSelectionApplyIndex() const property
    {
        this.TrackPropertyRead(0);
        return this.m_SelectionApplyIndex;
    }
    void SetSelectionApplyIndex(const int __Value) property
    {
        if (this.m_SelectionApplyIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_SelectionApplyIndex = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_AvatarInfo>> GetTeamAvatars() const property
    {
        const TArray<TEUIModelRef<FVM_AvatarInfo>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FVM_AvatarInfo>> GetModify_TeamAvatars() property
    {
        TArray<TEUIModelRef<FVM_AvatarInfo>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetTeamAvatars(const TArray<TEUIModelRef<FVM_AvatarInfo>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TeamAvatars = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarShowcase> GetShowcase() const property
    {
        this.TrackPropertyRead(2);
        return this.m_Showcase;
    }
    void SetShowcase(const TEUIModelRef<FVM_AvatarShowcase> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarShowcase> local_2;
        local_2 = this.m_Showcase;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_Showcase = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarSelection> GetSelection() const property
    {
        this.TrackPropertyRead(3);
        return this.m_Selection;
    }
    void SetSelection(const TEUIModelRef<FVM_AvatarSelection> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarSelection> local_2;
        local_2 = this.m_Selection;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_Selection = __Value;
        return;
    }
    bool GetbIsShowcaseAvatarChange() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bIsShowcaseAvatarChange;
    }
    void SetbIsShowcaseAvatarChange(const bool __Value) property
    {
        if (!(this.m_bIsShowcaseAvatarChange) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bIsShowcaseAvatarChange = __Value;
        return;
    }
    bool GetbIsDivineSkillNotSuit() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bIsDivineSkillNotSuit;
    }
    void SetbIsDivineSkillNotSuit(const bool __Value) property
    {
        if (!(this.m_bIsDivineSkillNotSuit) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bIsDivineSkillNotSuit = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_AvatarSelection
{
    UPROPERTY()
    FText SelectedAvatarName;
    UPROPERTY()
    int SelectAvatarSlotIndex;
    UPROPERTY()
    bool IsSelectCombatAvatar;
    UPROPERTY()
    bool IsIllustrateFilterNotReachMax;
    UPROPERTY()
    bool IsIllustrateFilterNotReachMin;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarSelection> Self;


}

struct __GeneratedProperties_FVM_AvatarSelectionShowcase
{
    UPROPERTY()
    TEUIModelRef<FVM_AvatarSelectionShowcase> Self;

    __GeneratedProperties_FVM_AvatarSelectionShowcase()
    {
        return;
    }
}

namespace FVM_AvatarSelection
{
FVM_AvatarSelection& Create(const UObject ContextObject)
{
    return FVM_AvatarSelection::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_AvatarSelection CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_AvatarSelection __r;
    TEUIModelRef<FVM_AvatarSelection> local_6 = TEUIModelRef<FVM_AvatarSelection>(EUIInternal::MakeModelWithManager(Manager, FVM_AvatarSelection::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasPostLoad(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "SelectionTargetSlotIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedAvatar";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FilteredAvatars";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IllustrateTypes";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FilterByIllustrate";
    local_14.TypeName = "EAvatarIllustrate";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "WeaponEntry";
    local_14.TypeName = "TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TalentEntry";
    local_14.TypeName = "TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RelicEntry";
    local_14.TypeName = "TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TitleHoverTipsVM";
    local_14.TypeName = "TEUIModelRef<FVM_TitleAndDesc>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedAvatarName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectAvatarSlotIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsSelectCombatAvatar";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsIllustrateFilterNotReachMax";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsIllustrateFilterNotReachMin";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarSelection>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarSelection;
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__RefreshFilteredAvatarList";
    local_24.DirtyFlags.Set(FVM_AvatarSelection::__IndexOf_FilterByIllustrate());
    local_24.DirtyFlags.Set(FVM_AvatarSelection::__IndexOf_AllAvatars());
    Result.DirtyFunctions.Add(local_24);
    local_24.FunctionName = "__RefreshSelectedAvatar";
    local_24.DirtyFlags.Set(FVM_AvatarSelection::__IndexOf_SelectedAvatarIndex());
    local_24.DirtyFlags.Set(FVM_AvatarSelection::__IndexOf_FilteredAvatars());
    Result.DirtyFunctions.Add(local_24);
    local_24.FunctionName = "__OnSelectedAvatarChanged";
    local_24.DirtyFlags.Set(FVM_AvatarSelection::__IndexOf_SelectedAvatar());
    Result.DirtyFunctions.Add(local_24);
    FEUIModelMsgHandleDefine local_34;
    local_34.FunctionName = "__HandleEquipmentChanged";
    local_34.MessageTypeName = "Msg_AvatarEquipmentChanged";
    local_34.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_34);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarSelection;
}
void __RefreshFilteredAvatarList(FVM_AvatarSelection &inout Model)
{
    Model.RefreshFilteredAvatarList();
    return;
}
void __RefreshSelectedAvatar(FVM_AvatarSelection &inout Model)
{
    Model.RefreshSelectedAvatar();
    return;
}
void __OnSelectedAvatarChanged(FVM_AvatarSelection &inout Model)
{
    Model.OnSelectedAvatarChanged();
    return;
}
void __HandleEquipmentChanged(FVM_AvatarSelection &inout Model, const FMsg_AvatarEquipmentChanged &inout Message)
{
    Model.HandleEquipmentChanged(Message);
    return;
}
int __UIGetter_SelectionTargetSlotIndex(const FVM_AvatarSelection &inout Model)
{
    return Model.GetSelectionTargetSlotIndex();
}
TEUIModelRef<FVM_AvatarInfo> __UIGetter_SelectedAvatar(const FVM_AvatarSelection &inout Model)
{
    return Model.GetSelectedAvatar();
}
TArray<FEUIModelContainer> __UIGetter_FilteredAvatars(const FVM_AvatarSelection &inout Model)
{
    return Model.GetFilteredAvatars();
}
TArray<FEUIModelContainer> __UIGetter_IllustrateTypes(const FVM_AvatarSelection &inout Model)
{
    return Model.GetIllustrateTypes();
}
EAvatarIllustrate __UIGetter_FilterByIllustrate(const FVM_AvatarSelection &inout Model)
{
    return Model.GetFilterByIllustrate();
}
TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> __UIGetter_WeaponEntry(const FVM_AvatarSelection &inout Model)
{
    return Model.GetWeaponEntry();
}
TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> __UIGetter_TalentEntry(const FVM_AvatarSelection &inout Model)
{
    return Model.GetTalentEntry();
}
TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> __UIGetter_RelicEntry(const FVM_AvatarSelection &inout Model)
{
    return Model.GetRelicEntry();
}
TEUIModelRef<FVM_TitleAndDesc> __UIGetter_TitleHoverTipsVM(const FVM_AvatarSelection &inout Model)
{
    return Model.GetTitleHoverTipsVM();
}
FText __UIGetter_SelectedAvatarName(const FVM_AvatarSelection &inout Model)
{
    return Model.GetSelectedAvatarName();
}
int __UIGetter_SelectAvatarSlotIndex(const FVM_AvatarSelection &inout Model)
{
    return Model.GetSelectAvatarSlotIndex();
}
bool __UIGetter_IsSelectCombatAvatar(const FVM_AvatarSelection &inout Model)
{
    return Model.IsSelectCombatAvatar();
}
bool __UIGetter_IsIllustrateFilterNotReachMax(const FVM_AvatarSelection &inout Model)
{
    return Model.IsIllustrateFilterNotReachMax();
}
bool __UIGetter_IsIllustrateFilterNotReachMin(const FVM_AvatarSelection &inout Model)
{
    return Model.IsIllustrateFilterNotReachMin();
}
TEUIModelRef<FVM_AvatarSelection> __UIGetter_Self(const FVM_AvatarSelection &inout Model)
{
    return TEUIModelRef<FVM_AvatarSelection>(Model);
}
int __IndexOf_SelectedAvatarIndex()
{
    return 0;
}
int __IndexOf_SelectionTargetSlotIndex()
{
    return 1;
}
int __IndexOf_AvatarIllustrateIconAll()
{
    return 2;
}
int __IndexOf_RedDotNewAvatarTag()
{
    return 3;
}
int __IndexOf_SelectedAvatar()
{
    return 4;
}
int __IndexOf_AllAvatars()
{
    return 5;
}
int __IndexOf_FilteredAvatars()
{
    return 6;
}
int __IndexOf_IllustrateTypes()
{
    return 7;
}
int __IndexOf_FilterByIllustrate()
{
    return 8;
}
int __IndexOf_OnApply()
{
    return 9;
}
int __IndexOf_WeaponEntry()
{
    return 10;
}
int __IndexOf_TalentEntry()
{
    return 11;
}
int __IndexOf_RelicEntry()
{
    return 12;
}
int __IndexOf_TitleHoverTipsVM()
{
    return 13;
}
int __IndexOf_AvailableIllustrateTypes()
{
    return 14;
}
}
namespace __GeneratedProperties_FVM_AvatarSelection
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_AvatarSelectionShowcase
{
FVM_AvatarSelectionShowcase& Create(const UObject ContextObject)
{
    return FVM_AvatarSelectionShowcase::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_AvatarSelectionShowcase CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_AvatarSelectionShowcase __r;
    TEUIModelRef<FVM_AvatarSelectionShowcase> local_6 = TEUIModelRef<FVM_AvatarSelectionShowcase>(EUIInternal::MakeModelWithManager(Manager, FVM_AvatarSelectionShowcase::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "SelectionApplyIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsShowcaseAvatarChange";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsDivineSkillNotSuit";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarSelectionShowcase>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarSelectionShowcase;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__OnAvatarSelectionSelectedChanged";
    local_26.MessageTypeName = "Msg_AvatarSelectionSelectedChanged";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    local_26.FunctionName = "__OnCombatSettingPresetUpdated";
    local_26.MessageTypeName = "Msg_CombatSettingPresetUpdated";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarSelectionShowcase;
}
void __OnAvatarSelectionSelectedChanged(FVM_AvatarSelectionShowcase &inout Model, const FMsg_AvatarSelectionSelectedChanged &inout Message)
{
    Model.OnAvatarSelectionSelectedChanged(Message);
    return;
}
void __OnCombatSettingPresetUpdated(FVM_AvatarSelectionShowcase &inout Model, const FMsg_CombatSettingPresetUpdated &inout Message)
{
    Model.OnCombatSettingPresetUpdated(Message);
    return;
}
int __UIGetter_SelectionApplyIndex(const FVM_AvatarSelectionShowcase &inout Model)
{
    return Model.GetSelectionApplyIndex();
}
bool __UIGetter_bIsShowcaseAvatarChange(const FVM_AvatarSelectionShowcase &inout Model)
{
    return Model.GetbIsShowcaseAvatarChange();
}
bool __UIGetter_bIsDivineSkillNotSuit(const FVM_AvatarSelectionShowcase &inout Model)
{
    return Model.GetbIsDivineSkillNotSuit();
}
TEUIModelRef<FVM_AvatarSelectionShowcase> __UIGetter_Self(const FVM_AvatarSelectionShowcase &inout Model)
{
    return TEUIModelRef<FVM_AvatarSelectionShowcase>(Model);
}
int __IndexOf_SelectionApplyIndex()
{
    return 0;
}
int __IndexOf_TeamAvatars()
{
    return 1;
}
int __IndexOf_Showcase()
{
    return 2;
}
int __IndexOf_Selection()
{
    return 3;
}
int __IndexOf_bIsShowcaseAvatarChange()
{
    return 4;
}
int __IndexOf_bIsDivineSkillNotSuit()
{
    return 5;
}
}
namespace __GeneratedProperties_FVM_AvatarSelectionShowcase
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

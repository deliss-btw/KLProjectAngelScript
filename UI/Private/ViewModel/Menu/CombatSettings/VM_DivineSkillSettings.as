
namespace FVM_DivineSkillSettings
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature SetCurrentShowcase = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnSelectedEquipableSkillItemChanged = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnSelectedEquipableSkillCategoryItemIndexChanged = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SelectPreviousCategory = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SelectNextCategory = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature ChangeToSelectedEquipableSkill = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OpenDivineSkillDescriptionFromHoverTips = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OpenDivineSkillDescription = FEUIModelCallbackSignature();

}
struct FVM_DivineSkillSettings : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FLinearColor m_NotSuitTintColor;
    UPROPERTY()
    TArray<FEUIModelContainer> m_EquipableSkillCategories;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_DivineSkillInfo>> m_EquipableSkills;
    UPROPERTY()
    TArray<TDataObjectPtr<FDivineSkillTypeConfig>> m_EquipableSkillTypes;
    UPROPERTY()
    int m_SelectedCategoryIndex;
    UPROPERTY()
    TEUIModelRef<FVM_DivineSkillInfo> m_SelectedEquipableSkill;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarShowcase> m_AvatarShowcase;
    UPROPERTY()
    bool m_bShouldClosePage;
    UPROPERTY()
    bool m_bPendingSelectEditingDivineSkill;
    UPROPERTY()
    bool m_bCanChangeToSelectedEquipableSkill;

    FVM_DivineSkillSettings()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_DivineSkillSettings(const FVM_DivineSkillSettings &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_DivineSkillSettings opAssign(const FVM_DivineSkillSettings &inout Other)
    {
        FVM_DivineSkillSettings __r;
        this.m_NotSuitTintColor = Other.m_NotSuitTintColor;
        this.m_EquipableSkillCategories = Other.m_EquipableSkillCategories;
        this.m_EquipableSkills = Other.m_EquipableSkills;
        this.m_EquipableSkillTypes = Other.m_EquipableSkillTypes;
        this.m_SelectedCategoryIndex = int(Other.m_SelectedCategoryIndex);
        this.m_SelectedEquipableSkill = Other.m_SelectedEquipableSkill;
        this.m_AvatarShowcase = Other.m_AvatarShowcase;
        this.m_bShouldClosePage = Other.m_bShouldClosePage;
        this.m_bPendingSelectEditingDivineSkill = Other.m_bPendingSelectEditingDivineSkill;
        this.m_bCanChangeToSelectedEquipableSkill = Other.m_bCanChangeToSelectedEquipableSkill;
        return __r;
    }
    void LoadConfig(const FConfigVM_DivineSkillSettings &inout InConfig)
    {
        this.SetNotSuitTintColor(InConfig.NotSuitTintColor);
        return;
    }
    void PostConstruct()
    {
        TDataObjectIterator<FDivineSkillTypeConfig> local_16;
        for (; local_16; )
        {
            TDataObjectPtr<FDivineSkillTypeConfig> local_58;
            this.GetModify_EquipableSkillTypes().Add(local_58);
            local_16.Next();
        }
        this.UpdateDivineSkillCategories();
        this.SelectEditingDivineSkill();
        return;
    }
    void PostLoad()
    {
        this.UpdateDivineSkillCategories();
        this.SelectEditingDivineSkill();
        return;
    }
    void BeginDestroy()
    {
        FMS_RedDotSystem& local_2 = ::FMS_RedDotSystem::Get(this.GetContext().Manager);
        TDataObjectIterator<FDivineSkillConfig> local_18;
        for (; local_18; )
        {
            TDataObjectPtr<FDivineSkillConfig> local_60;
            bool local_35 = ::FMS_DivineSkillData::Get(this.GetContext().Manager).IsUnlocked(local_60);
            if (local_35)
            {
                int64 local_64 = local_18.GetData().DataId;
                local_2.ConsumeRedDot(GameplayTags::RedDotSystem_Partner_NewDivineSkill, local_64);
            }
            local_18.Next();
        }
        return;
    }
    void SetCurrentShowcase(const TEUIModelRef<FVM_AvatarShowcase> &inout InShowcase)
    {
        this.SetAvatarShowcase(InShowcase);
        this.RefreshShowcaseAvatars();
        return;
    }
    void OnSelectedEquipableSkillChanged()
    {
        this.UpdateCanChangeToSelectedEquipableSkill();
        return;
    }
    void OnDivineSkillDataUpdated(const FMsg_DivineSkillUnlockUpdate &inout Msg)
    {
        this.UpdateCanChangeToSelectedEquipableSkill();
        return;
    }
    void UpdateCanChangeToSelectedEquipableSkill()
    {
        if (!(this.GetSelectedEquipableSkill()))
        {
            this.SetbCanChangeToSelectedEquipableSkill(false);
            return;
        }
        FMS_PvpModeState& local_6 = ::FMS_PvpModeState::Get(this.GetContext().Manager);
        if (local_6.GetbIsPvpMode())
        {
            this.SetbCanChangeToSelectedEquipableSkill(!((this.GetSelectedEquipableSkill().opArrow().GetEquipableSkillConfig() == ::FMS_DivineSkillData::Get(this.GetContext().Manager).GetPvpAvatarEquipedDivineSkill(local_6.GetCurrentPvpAvatarId()).opImplConv())));
            return;
        }
        this.SetbCanChangeToSelectedEquipableSkill(!((::FMS_DivineSkillData::Get(this.GetContext().Manager).GetEditingDivineSkill() == this.GetSelectedEquipableSkill().opArrow().GetEquipableSkill().opImplConv())));
        return;
    }
    FEUIModelContainer GetSelectedEquipableSkillCategoryItem() const
    {
        if (this.GetEquipableSkillCategories().IsValidIndex((this.GetSelectedCategoryIndex() + 1)))
        {
            return this.GetEquipableSkillCategories()[(this.GetSelectedCategoryIndex() + 1)];
        }
        return FEUIModelContainer();
    }
    void OnSelectedEquipableSkillItemChanged(const FEUIModelContainer &inout InSelectedEquipableSkillItem)
    {
        this.SetSelectedEquipableSkill(TEUIModelRef<FVM_DivineSkillInfo>(FEUIModelContainer::GetModel(InSelectedEquipableSkillItem).opCall()));
        return;
    }
    void OnSelectedEquipableSkillCategoryItemIndexChanged(const int InSelectedEquipableSkillCategoryItemIndex)
    {
        this.SetSelectedCategoryIndex(InSelectedEquipableSkillCategoryItemIndex - 1);
        return;
    }
    void SelectPreviousCategory()
    {
        this.SelectCategoryByOffset(-1);
        return;
    }
    void SelectNextCategory()
    {
        this.SelectCategoryByOffset(1);
        return;
    }
    bool CanSelectPreviousCategory() const
    {
        return (this.GetEquipableSkillCategories().Num() > 1);
    }
    bool CanSelectNextCategory() const
    {
        return (this.GetEquipableSkillCategories().Num() > 1);
    }
    void SelectCategoryByOffset(const int Offset)
    {
        int local_2 = this.GetEquipableSkillCategories().Num();
        if (local_2 <= 0)
        {
            return;
        }
        this.SetSelectedCategoryIndex((((((this.GetSelectedCategoryIndex() + 1) + Offset) % local_2) + local_2) % local_2) - 1);
        return;
    }
    void ChangeToSelectedEquipableSkill()
    {
        if (this.GetSelectedEquipableSkill())
        {
            if (::FASCommonUtils::IsInCombat(this.GetContext().GetLocalPlayerPawn()))
            {
                FCommonTipsParam local_16;
                ::CommonPopup::WeakTips(NSLOCTEXT("CannotChangeEquipableSkillInCombat", "ж€ж–—дё­ж— жі•ж›ґжЌўзҐћж јжЉЂ"), local_16);
                return;
            }
            FMS_PvpModeState& local_18 = ::FMS_PvpModeState::Get(this.GetContext().Manager);
            if (local_18.GetbIsPvpMode())
            {
                ::FMS_DivineSkillData::Get(this.GetContext().Manager).GS_RequestChangePvpDivineSkill(local_18.GetCurrentPvpAvatarId(), this.GetSelectedEquipableSkill().opArrow().GetEquipableSkillConfig());
                return;
            }
            ::FMS_DivineSkillData::Get(this.GetContext().Manager).GS_RequestChangeDivineSkill(this.GetSelectedEquipableSkill().opArrow().GetEquipableSkillConfig());
        }
        return;
    }
    void OnSelectedCategoryIndexChanged()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void OnCombatSettingPresetUpdated(const FMsg_CombatSettingPresetUpdated &inout Msg)
    {
        this.UpdateCanChangeToSelectedEquipableSkill();
        FCommonTipsParam local_8;
        ::CommonPopup::Tips(NSLOCTEXT("EquipableSkillChanged", "иЈ…й…Ќж€ђеЉџ"), local_8);
        this.SetbShouldClosePage(true);
        return;
    }
    void UpdateDivineSkillCategories()
    {
        const UUtilitySettings local_4;
        this.GetModify_EquipableSkillCategories().Empty(0);
        GetGameplaySettings<UUtilitySettings> local_6;
        local_4 = local_6;
        FEUIModelContainer local_22;
        FEUIModelRef local_26;
        local_22.AddModel(local_26, false);
        local_22.AddModel(local_26, false);
        FVM_CommonTabItem& local_28 = ::FVM_CommonTabItem::Create(this.GetContext().Manager);
        local_28.SetTitleText(NSLOCTEXT("DivineSkillCategoryAll", "е…ЁйѓЁ"));
        local_26 = FEUIModelRef(local_28);
        local_22.AddModel(local_26, false);
        this.GetModify_EquipableSkillCategories().Add(local_22);
        int local_33 = 0;
        for (; local_33 < this.GetEquipableSkillTypes().Num(); )
        {
            const TDataObjectPtr<FDivineSkillTypeConfig>& local_36 = this.GetEquipableSkillTypes()[local_33];
            FEUIModelContainer local_50;
            local_50.AddModel(local_26, false);
            FSoftBrush local_96 = FSoftBrush(local_36.opArrow().TypeIcon);
            if (!(::DivineSkillUtils::SuitForPlayerCurrentAvatars(local_36, this.GetContext().GetLocalPlayer())))
            {
                local_96.TintColor = FSlateColor(this.GetNotSuitTintColor());
            }
            local_50.AddModel(local_26, false);
            FVM_CommonTabItem& local_108 = ::FVM_CommonTabItem::Create(this.GetContext().Manager);
            local_108.SetTitleText(local_36.opArrow().TypeName);
            local_50.AddModel(FEUIModelRef(local_108), false);
            this.GetModify_EquipableSkillCategories().Add(local_50);
            ++local_33;
        }
        return;
    }
    void AddEquipableSkillsByType(const TDataObjectPtr<FDivineSkillTypeConfig> &inout EquipableSkillType)
    {
        TDataObjectPtr<FDivineSkillConfig> local_56;
        FMS_DivineSkillData& local_2 = ::FMS_DivineSkillData::Get(this.GetContext().Manager);
        TDataObjectPtr<FDivineSkillConfig> local_26;
        TEUIModelRef<FM_DivineSkill> local_28 = local_2.GetEditingDivineSkill();
        if (local_28)
        {
            local_26 = local_28.opArrow().GetConfig();
        }
        TArray<TEUIModelRef<FM_DivineSkill>> local_60;
        TDataObjectIterator<FDivineSkillConfig> local_76;
        for (; local_76; )
        {
            if (!(local_2.IsUnlocked(local_56)))
            {
            }
            else
            {
                bool local_31 = this.IsAnyUpgradeSkillUnlocked(local_56);
                if (local_31)
                {
                }
                else
                {
                    int local_95;
                    const FDivineSkillConfig& local_94 = local_76.GetData();
                    int local_96 = 0;
                    local_95 = local_96;
                    if (::FMS_PvpModeState::Get(this.GetContext().Manager).GetbIsPvpMode())
                    {
                        local_96 = 1;
                        local_95 = local_96;
                    }
                    else
                    {
                        local_96 = 0;
                        local_95 = local_96;
                    }
                    if (int(local_94.DivineSkillType) != local_95)
                    {
                    }
                    else
                    {
                        local_31 = !(EquipableSkillType);
                        if (local_31)
                        {
                            local_31 = true;
                        }
                        else
                        {
                            TDataObjectPtr<FDivineSkillTypeConfig> local_122;
                            local_122 = local_94.GetTypeConfig();
                            local_31 = (local_122 == EquipableSkillType.opImplConv());
                        }
                        if (local_31)
                        {
                            local_60.Add(local_2.GetLocalPlayerDivineSkillModel(local_56));
                        }
                    }
                }
            }
            local_76.Next();
        }
        for (auto& local_186 : local_60)
        {
            this.GetModify_EquipableSkills().Add(TEUIModelRef<FVM_DivineSkillInfo>(::FVM_DivineSkillInfo::Create(this.GetContext().Manager, local_186)));
        }
        return;
    }
    bool IsAnyUpgradeSkillUnlocked(const TDataObjectPtr<FDivineSkillConfig> &inout Config) const
    {
        if (!(Config))
        {
            return false;
        }
        FMS_DivineSkillData& local_4 = ::FMS_DivineSkillData::Get(this.GetContext().Manager);
        TDataObjectPtr<FDivineSkillConfig> local_28 = Config.opArrow().GetUpgradeSkill();
        int local_53 = 0;
        while ((local_28 && (local_53 < 64)))
        {
            if (local_4.IsUnlocked(local_28))
            {
                return true;
            }
            local_28 = local_28.opArrow().GetUpgradeSkill();
            ++local_53;
        }
        return false;
    }
    void RefreshShowcaseAvatars()
    {
        if (this.GetAvatarShowcase())
        {
            TArray<TDataObjectPtr<FAvatarPrefabConfig>> local_8;
            FECSEntity local_12 = this.GetContext().GetLocalPlayer();
            Get local_16;
            const FC_PlayerController& local_18 = local_16.opCall();
            if (local_18)
            {
                for (auto& local_32 : local_18.GetAllPlayerPawnEntities())
                {
                    local_8.Add(::GetAvatarConfig(local_32));
                }
            }
            this.GetAvatarShowcase().opArrow().SetNextAvatars(local_8);
        }
        return;
    }
    void SelectEditingDivineSkill()
    {
        this.SetbPendingSelectEditingDivineSkill(true);
        return;
    }
    bool SelectEditingDivineSkillInternal()
    {
        FMS_DivineSkillData& local_2 = ::FMS_DivineSkillData::Get(this.GetContext().Manager);
        FMS_PvpModeState& local_4 = ::FMS_PvpModeState::Get(this.GetContext().Manager);
        bool local_5 = false;
        TEUIModelRef<FM_DivineSkill> local_8;
        if (local_4.GetbIsPvpMode())
        {
            TDataObjectPtr<FDivineSkillConfig> local_34 = local_2.GetPvpAvatarEquipedDivineSkill(local_4.GetCurrentPvpAvatarId());
            if (local_34)
            {
                local_8 = local_2.GetLocalPlayerDivineSkillModel(local_34);
            }
        }
        else
        {
            local_8 = local_2.GetEditingDivineSkill();
        }
        if (local_8)
        {
            for (auto& local_74 : this.GetEquipableSkills())
            {
                if ((local_74.opArrow().GetEquipableSkill() == local_8.opImplConv()))
                {
                    this.SetSelectedEquipableSkill(local_74);
                    local_5 = true;
                    break;
                }
            }
        }
        this.SetbPendingSelectEditingDivineSkill(false);
        return local_5;
    }
    bool OpenDivineSkillDescriptionFromHoverTips(const FEUIModelRef &inout ModelRef)
    {
        this.OpenDivineSkillDescription();
        return true;
    }
    bool OpenDivineSkillDescription()
    {
        FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_Divine_InfoPop);
        return true;
    }
    TEUIModelRef<FVM_EquipHoverTips> GetHoverTips()
    {
        FVM_EquipHoverTips& local_2 = ::FVM_EquipHoverTips::Create(this.GetContext().Manager);
        local_2.SetDisplayName(NSLOCTEXT("DivineSkillDescTitle", "зҐћж јиЇґжЋ"));
        local_2.SetEquipLevel(0);
        local_2.SetbIsShowLevel(false);
        local_2.SetClickModelRef(FEUIModelRef(this));
        local_2.SetbIsShowContent(true);
        local_2.SetContentIndex(0);
        local_2.GetOnClickGoToCallback().Bind(this, FVM_DivineSkillSettings::OpenDivineSkillDescriptionFromHoverTips);
        return TEUIModelRef<FVM_EquipHoverTips>(local_2);
    }
    const FLinearColor GetNotSuitTintColor() const property
    {
        const FLinearColor __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FLinearColor GetModify_NotSuitTintColor() property
    {
        FLinearColor __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetNotSuitTintColor(const FLinearColor &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_NotSuitTintColor = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetEquipableSkillCategories() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_EquipableSkillCategories() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetEquipableSkillCategories(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_EquipableSkillCategories = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_DivineSkillInfo>> GetEquipableSkills() const property
    {
        const TArray<TEUIModelRef<FVM_DivineSkillInfo>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<TEUIModelRef<FVM_DivineSkillInfo>> GetModify_EquipableSkills() property
    {
        TArray<TEUIModelRef<FVM_DivineSkillInfo>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetEquipableSkills(const TArray<TEUIModelRef<FVM_DivineSkillInfo>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_EquipableSkills = __Value;
        return;
    }
    const TArray<TDataObjectPtr<FDivineSkillTypeConfig>> GetEquipableSkillTypes() const property
    {
        const TArray<TDataObjectPtr<FDivineSkillTypeConfig>> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<TDataObjectPtr<FDivineSkillTypeConfig>> GetModify_EquipableSkillTypes() property
    {
        TArray<TDataObjectPtr<FDivineSkillTypeConfig>> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetEquipableSkillTypes(const TArray<TDataObjectPtr<FDivineSkillTypeConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_EquipableSkillTypes = __Value;
        return;
    }
    int GetSelectedCategoryIndex() const property
    {
        this.TrackPropertyRead(4);
        return this.m_SelectedCategoryIndex;
    }
    void SetSelectedCategoryIndex(const int __Value) property
    {
        if (this.m_SelectedCategoryIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_SelectedCategoryIndex = __Value;
        return;
    }
    TEUIModelRef<FVM_DivineSkillInfo> GetSelectedEquipableSkill() const property
    {
        this.TrackPropertyRead(5);
        return this.m_SelectedEquipableSkill;
    }
    void SetSelectedEquipableSkill(const TEUIModelRef<FVM_DivineSkillInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_DivineSkillInfo> local_2;
        local_2 = this.m_SelectedEquipableSkill;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_SelectedEquipableSkill = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarShowcase> GetAvatarShowcase() const property
    {
        this.TrackPropertyRead(6);
        return this.m_AvatarShowcase;
    }
    void SetAvatarShowcase(const TEUIModelRef<FVM_AvatarShowcase> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarShowcase> local_2;
        local_2 = this.m_AvatarShowcase;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_AvatarShowcase = __Value;
        return;
    }
    bool GetbShouldClosePage() const property
    {
        this.TrackPropertyRead(7);
        return this.m_bShouldClosePage;
    }
    void SetbShouldClosePage(const bool __Value) property
    {
        if (!(this.m_bShouldClosePage) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_bShouldClosePage = __Value;
        return;
    }
    bool GetbPendingSelectEditingDivineSkill() const property
    {
        this.TrackPropertyRead(8);
        return this.m_bPendingSelectEditingDivineSkill;
    }
    void SetbPendingSelectEditingDivineSkill(const bool __Value) property
    {
        if (!(this.m_bPendingSelectEditingDivineSkill) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_bPendingSelectEditingDivineSkill = __Value;
        return;
    }
    bool GetbCanChangeToSelectedEquipableSkill() const property
    {
        this.TrackPropertyRead(9);
        return this.m_bCanChangeToSelectedEquipableSkill;
    }
    void SetbCanChangeToSelectedEquipableSkill(const bool __Value) property
    {
        if (!(this.m_bCanChangeToSelectedEquipableSkill) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_bCanChangeToSelectedEquipableSkill = __Value;
        return;
    }
}

struct __Lambda_UI_Private_ViewModel_Menu_CombatSettings_VM_DivineSkillSettings_323
{
    __Lambda_UI_Private_ViewModel_Menu_CombatSettings_VM_DivineSkillSettings_323()
    {
        return;
    }
    bool opCall(const TEUIModelRef<FM_DivineSkill> &inout A, const TEUIModelRef<FM_DivineSkill> &inout B)
    {
        return (A.opArrow().GetConfig().opArrow().DataId < B.opArrow().GetConfig().opArrow().DataId);
    }
}

struct __GeneratedProperties_FVM_DivineSkillSettings
{
    UPROPERTY()
    FEUIModelContainer SelectedEquipableSkillCategoryItem;
    UPROPERTY()
    bool CanSelectPreviousCategory;
    UPROPERTY()
    bool CanSelectNextCategory;
    UPROPERTY()
    TEUIModelRef<FVM_DivineSkillSettings> Self;


}

namespace FVM_DivineSkillSettings
{
FVM_DivineSkillSettings& Create(const UObject ContextObject)
{
    return FVM_DivineSkillSettings::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_DivineSkillSettings CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_DivineSkillSettings __r;
    TEUIModelRef<FVM_DivineSkillSettings> local_6 = TEUIModelRef<FVM_DivineSkillSettings>(EUIInternal::MakeModelWithManager(Manager, FVM_DivineSkillSettings::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasPostLoad(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "EquipableSkillCategories";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipableSkills";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_DivineSkillInfo>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedEquipableSkill";
    local_14.TypeName = "TEUIModelRef<FVM_DivineSkillInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedEquipableSkillCategoryItem";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CanSelectPreviousCategory";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CanSelectNextCategory";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_DivineSkillSettings>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_DivineSkillSettings;
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__OnSelectedEquipableSkillChanged";
    local_24.DirtyFlags.Set(FVM_DivineSkillSettings::__IndexOf_SelectedEquipableSkill());
    Result.DirtyFunctions.Add(local_24);
    FEUIModelMsgHandleDefine local_34;
    local_34.FunctionName = "__OnDivineSkillDataUpdated";
    local_34.MessageTypeName = "Msg_DivineSkillUnlockUpdate";
    local_34.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_34);
    local_24.FunctionName = "__OnSelectedCategoryIndexChanged";
    local_24.DirtyFlags.Set(FVM_DivineSkillSettings::__IndexOf_SelectedCategoryIndex());
    local_24.DirtyFlags.Set(FVM_DivineSkillSettings::__IndexOf_EquipableSkillCategories());
    Result.DirtyFunctions.Add(local_24);
    local_34.FunctionName = "__OnCombatSettingPresetUpdated";
    local_34.MessageTypeName = "Msg_CombatSettingPresetUpdated";
    local_34.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_34);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_DivineSkillSettings;
}
void __OnSelectedEquipableSkillChanged(FVM_DivineSkillSettings &inout Model)
{
    Model.OnSelectedEquipableSkillChanged();
    return;
}
void __OnDivineSkillDataUpdated(FVM_DivineSkillSettings &inout Model, const FMsg_DivineSkillUnlockUpdate &inout Message)
{
    Model.OnDivineSkillDataUpdated(Message);
    return;
}
void __OnSelectedCategoryIndexChanged(FVM_DivineSkillSettings &inout Model)
{
    Model.OnSelectedCategoryIndexChanged();
    return;
}
void __OnCombatSettingPresetUpdated(FVM_DivineSkillSettings &inout Model, const FMsg_CombatSettingPresetUpdated &inout Message)
{
    Model.OnCombatSettingPresetUpdated(Message);
    return;
}
TArray<FEUIModelContainer> __UIGetter_EquipableSkillCategories(const FVM_DivineSkillSettings &inout Model)
{
    return Model.GetEquipableSkillCategories();
}
TArray<TEUIModelRef<FVM_DivineSkillInfo>> __UIGetter_EquipableSkills(const FVM_DivineSkillSettings &inout Model)
{
    return Model.GetEquipableSkills();
}
TEUIModelRef<FVM_DivineSkillInfo> __UIGetter_SelectedEquipableSkill(const FVM_DivineSkillSettings &inout Model)
{
    return Model.GetSelectedEquipableSkill();
}
FEUIModelContainer __UIGetter_SelectedEquipableSkillCategoryItem(const FVM_DivineSkillSettings &inout Model)
{
    return Model.GetSelectedEquipableSkillCategoryItem();
}
bool __UIGetter_CanSelectPreviousCategory(const FVM_DivineSkillSettings &inout Model)
{
    return Model.CanSelectPreviousCategory();
}
bool __UIGetter_CanSelectNextCategory(const FVM_DivineSkillSettings &inout Model)
{
    return Model.CanSelectNextCategory();
}
TEUIModelRef<FVM_DivineSkillSettings> __UIGetter_Self(const FVM_DivineSkillSettings &inout Model)
{
    return TEUIModelRef<FVM_DivineSkillSettings>(Model);
}
int __IndexOf_NotSuitTintColor()
{
    return 0;
}
int __IndexOf_EquipableSkillCategories()
{
    return 1;
}
int __IndexOf_EquipableSkills()
{
    return 2;
}
int __IndexOf_EquipableSkillTypes()
{
    return 3;
}
int __IndexOf_SelectedCategoryIndex()
{
    return 4;
}
int __IndexOf_SelectedEquipableSkill()
{
    return 5;
}
int __IndexOf_AvatarShowcase()
{
    return 6;
}
int __IndexOf_bShouldClosePage()
{
    return 7;
}
int __IndexOf_bPendingSelectEditingDivineSkill()
{
    return 8;
}
int __IndexOf_bCanChangeToSelectedEquipableSkill()
{
    return 9;
}
}
namespace __GeneratedProperties_FVM_DivineSkillSettings
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

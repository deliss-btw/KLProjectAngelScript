
enum ETalentInfoShowPageType
{
    AvatarInfoPage,
    TalentInfoPage,
    SkillChangePage,
}

const FConsoleVariable CVar_Talent_UseConfirmDialog = FConsoleVariable();
namespace FVM_TalentSkillInfoItem
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature ToggleDoubleStateTalent = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature ConsumeRedDot = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnAvatarSkillDetialSelect = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature UnlockOrUpgradeTalent = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SwitchActiveChoiceTalent = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SwitchActiveSlot = FEUIModelCallbackSignature();

}
struct FVM_TalentSkillInfoItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FAvatarMappingConfig> m_AvatarConfig;
    UPROPERTY()
    TEUIModelRef<FM_TalentNode> m_TalentNode;
    UPROPERTY()
    int m_ChoiceIndex;
    UPROPERTY()
    TDataObjectPtr<FSkillInitConfig> m_SkillInitConfig;
    UPROPERTY()
    ESkillSlot m_EquipSlot;
    UPROPERTY()
    ETalentInfoShowPageType m_ShowPageType;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_TalentUpgradeDesc>> m_AchievedCondIdList;
    UPROPERTY()
    bool m_bAllCondAchieved;
    UPROPERTY()
    TEUIModelRef<FVM_RedDot> m_RedDotVM;
    UPROPERTY()
    ESkillSlot m_EnterButtonSlot;
    UPROPERTY()
    int m_DoubleStateTalentIndex;
    UPROPERTY()
    bool m_bNeedAutoPlay;
    UPROPERTY()
    bool m_bPlayHideAnim;
    UPROPERTY()
    bool m_bVisible;
    UPROPERTY()
    uint m_CurLevelForWidget;
    UPROPERTY()
    bool m_bIsShownChoiceEquipped;
    UPROPERTY()
    TEUIModelRef<FVM_TalentSkillTypeBG> m_SkillTypeBGVM;

    FVM_TalentSkillInfoItem()
    {
        this.m_EquipSlot = ESkillSlot(0);
        this.m_ShowPageType = ETalentInfoShowPageType(0);
        this.m_ChoiceIndex = 0;
        this.m_bAllCondAchieved = false;
        this.m_EnterButtonSlot = ESkillSlot(1);
        this.m_DoubleStateTalentIndex = 0;
        this.m_bNeedAutoPlay = false;
        this.m_bPlayHideAnim = false;
        this.m_bVisible = true;
        this.m_CurLevelForWidget = 0;
        this.m_bIsShownChoiceEquipped = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TalentSkillInfoItem' by default constructor.");
        return;
    }
    FVM_TalentSkillInfoItem(const FVM_TalentSkillInfoItem &inout Other)
    {
        this.m_EquipSlot = ESkillSlot(0);
        this.m_ShowPageType = ETalentInfoShowPageType(0);
        this.m_ChoiceIndex = 0;
        this.m_bAllCondAchieved = false;
        this.m_EnterButtonSlot = ESkillSlot(1);
        this.m_DoubleStateTalentIndex = 0;
        this.m_bNeedAutoPlay = false;
        this.m_bPlayHideAnim = false;
        this.m_bVisible = true;
        this.m_CurLevelForWidget = 0;
        this.m_bIsShownChoiceEquipped = false;
        this.m_AvatarConfig = Other.m_AvatarConfig;
        this.m_TalentNode = Other.m_TalentNode;
        this.m_ChoiceIndex = int(Other.m_ChoiceIndex);
        this.m_SkillInitConfig = Other.m_SkillInitConfig;
        this.m_EquipSlot = Other.m_EquipSlot;
        this.m_ShowPageType = Other.m_ShowPageType;
        this.m_AchievedCondIdList = Other.m_AchievedCondIdList;
        this.m_bAllCondAchieved = Other.m_bAllCondAchieved;
        this.m_RedDotVM = Other.m_RedDotVM;
        this.m_EnterButtonSlot = Other.m_EnterButtonSlot;
        this.m_DoubleStateTalentIndex = int(Other.m_DoubleStateTalentIndex);
        this.m_bNeedAutoPlay = Other.m_bNeedAutoPlay;
        this.m_bPlayHideAnim = Other.m_bPlayHideAnim;
        this.m_bVisible = Other.m_bVisible;
        this.m_CurLevelForWidget = int(Other.m_CurLevelForWidget);
        this.m_bIsShownChoiceEquipped = Other.m_bIsShownChoiceEquipped;
        this.m_SkillTypeBGVM = Other.m_SkillTypeBGVM;
        return;
    }
    FVM_TalentSkillInfoItem(const TDataObjectPtr<FAvatarMappingConfig> &inout InAvatarConfig, const TEUIModelRef<FM_TalentNode> &inout InTalentNode, const ESkillSlot InEquipSlot, const ETalentInfoShowPageType InShowPageType)
    {
        this.m_EquipSlot = ESkillSlot(0);
        this.m_ShowPageType = ETalentInfoShowPageType(0);
        this.m_ChoiceIndex = 0;
        this.m_bAllCondAchieved = false;
        this.m_EnterButtonSlot = ESkillSlot(1);
        this.m_DoubleStateTalentIndex = 0;
        this.m_bNeedAutoPlay = false;
        this.m_bPlayHideAnim = false;
        this.m_bVisible = true;
        this.m_CurLevelForWidget = 0;
        this.m_bIsShownChoiceEquipped = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetAvatarConfig(InAvatarConfig);
        this.SetTalentNode(InTalentNode);
        this.SetEquipSlot(ESkillSlot(InEquipSlot));
        this.SetShowPageType(ETalentInfoShowPageType(InShowPageType));
        return;
    }
    FVM_TalentSkillInfoItem& opAssign(const FVM_TalentSkillInfoItem &inout Other)
    {
        this.m_AvatarConfig = Other.m_AvatarConfig;
        this.m_TalentNode = Other.m_TalentNode;
        this.m_ChoiceIndex = int(Other.m_ChoiceIndex);
        this.m_SkillInitConfig = Other.m_SkillInitConfig;
        this.m_EquipSlot = Other.m_EquipSlot;
        this.m_ShowPageType = Other.m_ShowPageType;
        this.m_AchievedCondIdList = Other.m_AchievedCondIdList;
        this.m_bAllCondAchieved = Other.m_bAllCondAchieved;
        this.m_RedDotVM = Other.m_RedDotVM;
        this.m_EnterButtonSlot = Other.m_EnterButtonSlot;
        this.m_DoubleStateTalentIndex = int(Other.m_DoubleStateTalentIndex);
        this.m_bNeedAutoPlay = Other.m_bNeedAutoPlay;
        this.m_bPlayHideAnim = Other.m_bPlayHideAnim;
        this.m_bVisible = Other.m_bVisible;
        this.m_CurLevelForWidget = int(Other.m_CurLevelForWidget);
        this.m_bIsShownChoiceEquipped = Other.m_bIsShownChoiceEquipped;
        return Other.m_SkillTypeBGVM;
    }
    TDataObjectPtr<FTalentConfig> GetEffectiveTalentConfig() const
    {
        int local_54 = 0;
        int local_55;
        TDataObjectPtr<FTalentConfig> local_28;
        if (!(this.GetTalentNode()))
        {
            return local_28;
        }
        TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
        local_55 = local_54.GetActiveLevel();
        local_28 = local_54.FindTalentByChoiceAndLevel(this.GetChoiceIndex(), local_55);
        if (!(local_28))
        {
            local_28 = local_54.GetConfig().NodeConfig;
        }
        if (!(local_28))
        {
            return TDataObjectPtr<FTalentConfig>();
        }
        if (!(this.GetDoubleStateTalentIndex() != 1) && GetDoubleFormTalent())
        {
            return GetDoubleFormTalent();
        }
        return local_28;
    }
    TDataObjectPtr<FSkillInitConfig> GetSkillInitConfigFromTalent() const
    {
        if (this.GetSkillInitConfig())
        {
            return this.GetSkillInitConfig();
        }
        if (!(!(this.GetEffectiveTalentConfig())) && GetSkillConfig())
        {
            return GetSkillConfig();
        }
        return TDataObjectPtr<FSkillInitConfig>(nullptr);
    }
    ESkillType ResolveDisplaySkillType() const
    {
        int local_51 = 0;
        if (!(this.GetSkillInitConfig()))
        {
            if (this.GetEffectiveTalentConfig() && (local_51 != 0))
            {
                return ESkillType(local_51);
            }
        }
        if (this.GetSkillInitConfig())
        {
            return ESkillType(local_51);
        }
        if (!(!(this.GetEffectiveTalentConfig())) && GetSkillConfig())
        {
            return ESkillType(local_51);
        }
        return ESkillType(0);
    }
    bool TryGetDisplaySkillCDSeconds(float32 &inout OutSeconds) const
    {
        int local_52 = 0;
        if (!(this.GetSkillInitConfig()))
        {
            if (this.GetEffectiveTalentConfig() && (0.0f >= 0.0f))
            {
                OutSeconds = local_52;
                return true;
            }
        }
        TDataObjectPtr<FSkillInitConfig> local_78 = this.GetSkillInitConfigFromTalent();
        if (local_78 && ((local_78.opArrow().SkillConfig != nullptr)))
        {
            OutSeconds = int(local_78.opArrow().SkillConfig.DefaultSkillStateConfig.CDConfig.CDDuration.DefaultValue);
            return true;
        }
        return false;
    }
    bool GetHasDoubleForm() const
    {
        if (!(this.GetTalentNode()))
        {
            return false;
        }
        TDataObjectPtr<FTalentConfig> local_28 = this.GetTalentNode().opArrow().GetConfig().NodeConfig;
        return local_28 && !(!(GetDoubleFormTalent()));
    }
    int GetShowPageTypeIndex() const
    {
        switch (int(this.GetShowPageType()))
        {
            case 0:
                return 0;
            case 2:
                return 1;
            default:
                return 0;
        }
    }
    bool GetIsShowPageTypeIsTalentInfoPage() const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        bool __r; return __r;
    }
    bool GetIsShowPageTypeIsSkillChangePage() const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        bool __r; return __r;
    }
    void ToggleDoubleStateTalent()
    {
        if (this.GetHasDoubleForm())
        {
            int local_4 = this.GetDoubleStateTalentIndex() == 0 ? 1 : 0;
            this.SetDoubleStateTalentIndex(local_4);
        }
        return;
    }
    void PostConstruct()
    {
        bool local_50 = false;
        bool local_51 = this.GetEffectiveTalentConfig() && local_50;
        TDataObjectPtr<FSkillInitConfig> local_76 = this.GetSkillInitConfigFromTalent();
        local_50 = !(local_51);
        if (!(local_50))
        {
            local_50 = false;
        }
        else
        {
            local_50 = local_76;
        }
        if (local_50)
        {
            if (!(local_76.opArrow().Icon.IsSet()))
            {
                XWarning(ELog(68), FString().Append("Skill Icon use old preasentation config '").Append(local_76.opArrow().Name).Append("'!"));
            }
        }
        this.CreateAchievedCondIdList();
        this.RefreshShownChoiceEquipped();
        if (this.GetTalentNode().IsValid())
        {
            TEUIModelRef<FM_TalentNode> local_108 = this.GetTalentNode();
            this.SetRedDotVM(TEUIModelRef<FVM_RedDot>(::FVM_RedDot::Create(this.GetContext().Manager, FRedDotNodeData(GameplayTags::RedDotSystem_Avatar_NewTalent, GetDataId()))));
        }
        if ((int(this.ResolveDisplaySkillType())) != 0)
        {
            this.SetSkillTypeBGVM(TEUIModelRef<FVM_TalentSkillTypeBG>(::FVM_TalentSkillTypeBG::Create(this.GetContext().Manager)));
        }
        return;
    }
    void SetSkillInitConfigOverride(const TDataObjectPtr<FSkillInitConfig> &inout InConfig)
    {
        this.SetSkillInitConfig(InConfig);
        if ((int(this.ResolveDisplaySkillType())) != 0)
        {
            this.SetSkillTypeBGVM(TEUIModelRef<FVM_TalentSkillTypeBG>(::FVM_TalentSkillTypeBG::Create(this.GetContext().Manager)));
        }
        return;
    }
    void OnTalentNodeChanged()
    {
        this.CreateAchievedCondIdList();
        TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
        this.SetCurLevelForWidget(GetActiveLevel());
        this.RefreshShownChoiceEquipped();
        return;
    }
    void OnTalentNodeLevelChanged()
    {
        this.CreateAchievedCondIdList();
        TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
        this.SetCurLevelForWidget(GetActiveLevel());
        this.RefreshShownChoiceEquipped();
        return;
    }
    void RefreshShownChoiceEquipped()
    {
        bool local_3 = this.GetTalentNode().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
            local_3 = this.GetChoiceIndex().IsEquippedChoice();
        }
        this.SetbIsShownChoiceEquipped(local_3);
        return;
    }
    void OnTalentDataUpdatedForEquip(const FMsg_TalentTreeDataUpdate &inout Msg)
    {
        this.RefreshShownChoiceEquipped();
        return;
    }
    int GetConditionDataId(const TDataObjectPtr<FServerConditionConfigBase> &inout Cond) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    void CreateAchievedCondIdList()
    {
        bool local_1;
        int local_8 = 0;
        this.SetbAllCondAchieved(true);
        if (!(this.GetTalentNode().IsValid()))
        {
            this.SetbAllCondAchieved(false);
            return;
        }
        this.GetModify_AchievedCondIdList().Empty(0);
        this.SetbAllCondAchieved(true);
        TEUIModelRef<FM_TalentNode> local_4 = this.GetTalentNode();
        int local_10 = local_8.GetCurrentLevel() + 1;
        TDataObjectPtr<FTalentConfig> local_60 = local_8.FindTalentByChoiceAndLevel(this.GetChoiceIndex(), local_10);
        if (!(local_60))
        {
            local_60 = local_8.FindTalentByChoiceAndLevel(local_8.GetActiveChoiceIndex(), local_10);
        }
        if (!(local_60))
        {
            return;
        }
        TEUIModelRef<FMS_Talent> local_86 = TEUIModelRef<FMS_Talent>(::FMS_Talent::Get(this.GetContext().Manager));
        TArray<TEUIModelWeakRef<FM_TalentNode>> local_98;
        local_98.GetTalentParentConfigListByNode(TEUIModelWeakRef<FM_TalentNode>(local_8));
        if (local_98.Num() > 0)
        {
            bool local_100;
            local_100 = true;
            for (auto& local_114 : local_98)
            {
                if (local_114.IsValid() && (int(GetStateType()) != 3))
                {
                    local_100 = false;
                    break;
                }
            }
            TEUIModelRef<FVM_TalentUpgradeDesc> local_118 = TEUIModelRef<FVM_TalentUpgradeDesc>(::FVM_TalentUpgradeDesc::Create(this.GetContext().Manager));
            NSLOCTEXT("Talent", "TalentPrereqNodeUnlock", "е‰ЌзЅ®иЉ‚з‚№йњЂи§Јй”Ѓ").SetContextDesc();
            local_100.SetbHighLight();
            this.GetModify_AchievedCondIdList().Add(local_118);
            if (!(local_100))
            {
                this.SetbAllCondAchieved(false);
            }
        }
        if (0 > 0)
        {
            int local_125;
            local_125 = ::FM_LocalPlayerLevel::Get(this.GetContext().Manager).GetLevel();
            TEUIModelRef<FVM_TalentUpgradeDesc> local_118_2 = TEUIModelRef<FVM_TalentUpgradeDesc>(::FVM_TalentUpgradeDesc::Create(this.GetContext().Manager));
            NSLOCTEXT("Talent", "UpgradeUnlockLevel", "зЋ©е®¶з­‰зє§иѕѕе€°{0}");
            FText local_130;
            local_130.SetContextDesc();
            local_1 = (local_125 >= 0);
            local_1.SetbHighLight();
            this.GetModify_AchievedCondIdList().Add(local_118_2);
            if (!(local_1))
            {
                this.SetbAllCondAchieved(false);
            }
        }
        for (auto& local_144 : GetUnlockCondition())
        {
            if (!(local_144))
            {
                continue;
            }
            TEUIModelRef<FVM_TalentUpgradeDesc> local_118_3 = TEUIModelRef<FVM_TalentUpgradeDesc>(::FVM_TalentUpgradeDesc::Create(this.GetContext().Manager));
            bool local_116 = local_8.GetAchievedCondIdList().Contains(this.GetConditionDataId(local_144)) || local_8.GetUnlockableTalentIds().Contains(local_60.opArrow().DataId);
            local_116.SetbHighLight();
            this.GetModify_AchievedCondIdList().Add(local_118_3);
            if (!(local_116))
            {
                this.SetbAllCondAchieved(false);
            }
        }
        return;
    }
    bool GetShowAchievedCondList() const
    {
        if (!(this.GetbAllCondAchieved()) && (int(this.GetShowPageType()) == 1))
        {
            return true;
        }
        return false;
    }
    bool GetShowUpgradeSpendCondList() const
    {
        if (this.GetIsMaxLevel())
        {
            return false;
        }
        if (this.GetbAllCondAchieved() && (int(this.GetShowPageType()) == 1))
        {
            return true;
        }
        return false;
    }
    bool GetShowNextlevelUpgradeDesc() const
    {
        TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
        if ((int(GetStateType())) == 3)
        {
            if (this.GetIsNotMaxLevel())
            {
                return true;
            }
        }
        return false;
    }
    bool GetIsChoiceTalent() const
    {
        bool local_3 = this.GetTalentNode().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
            local_3 = HasChoice();
        }
        return local_3;
    }
    bool GetIsActiveChoice() const
    {
        bool local_3 = !(this.GetTalentNode().IsValid());
        if (local_3)
        {
            local_3 = true;
        }
        else
        {
            TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
            local_3 = !(HasChoice());
        }
        if (local_3)
        {
            return false;
        }
        TEUIModelRef<FM_TalentNode> local_2_2 = this.GetTalentNode();
        return (int(GetStateType()) == 3);
    }
    bool GetIsNotActiveChoice() const
    {
        bool local_3 = !(this.GetTalentNode().IsValid());
        if (local_3)
        {
            local_3 = true;
        }
        else
        {
            TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
            local_3 = !(HasChoice());
        }
        if (local_3)
        {
            return false;
        }
        TEUIModelRef<FM_TalentNode> local_2_2 = this.GetTalentNode();
        return (int(GetStateType()) != 3);
    }
    bool GetIsEquippedChoice() const
    {
        bool local_3 = this.GetTalentNode().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
            local_3 = this.GetChoiceIndex().IsEquippedChoice();
        }
        return local_3;
    }
    bool GetIsUnequippedChoice() const
    {
        bool local_3 = this.GetTalentNode().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
            local_3 = this.GetChoiceIndex().IsUnequippedChoice();
        }
        return local_3;
    }
    bool GetIsFoundationNode() const
    {
        if (!(this.GetTalentNode().IsValid()))
        {
            return false;
        }
        int local_29 = this.GetChoiceIndex();
        TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
        TDataObjectPtr<FTalentConfig> local_54;
        local_54.GetConfig(local_29);
        return (local_54 && (0 == 1));
    }
    bool GetIsNotFoundationNode() const
    {
        return !(this.GetIsFoundationNode());
    }
    bool GetIsUnlocked() const
    {
        bool local_3 = this.GetTalentNode().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
            local_3 = (int(GetStateType()) == 3);
        }
        return local_3;
    }
    bool GetIsUnlockedAndChoice() const
    {
        return this.GetIsUnlocked() && this.GetIsChoiceTalent();
    }
    bool GetIsMaxLevel() const
    {
        int local_6 = 0;
        if (!(this.GetTalentNode().IsValid()))
        {
            return false;
        }
        TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
        int local_8 = local_6.GetMaxLevel();
        return local_8 > 0 && (local_6.GetCurrentLevel() >= local_8);
    }
    bool GetIsNotMaxLevel() const
    {
        return !(this.GetIsMaxLevel());
    }
    bool GetShowUpgradeBtn() const
    {
        int local_6 = 0;
        if (!(this.GetTalentNode().IsValid()))
        {
            return false;
        }
        TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
        if (local_6.GetCurrentLevel() >= local_6.GetMaxLevel())
        {
            return false;
        }
        bool local_3 = false;
        TEUIModelRef<FM_TalentNode> local_2_2 = this.GetTalentNode();
        if (local_3.CanUpgrade())
        {
            return true;
        }
        return false;
    }
    bool GetUpgradeBtnCostEnough() const
    {
        int local_6 = 0;
        if (!(this.GetTalentNode().IsValid()))
        {
            return false;
        }
        TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
        if (local_6.GetCurrentLevel() >= local_6.GetMaxLevel())
        {
            return false;
        }
        bool local_3 = true;
        TEUIModelRef<FM_TalentNode> local_2_2 = this.GetTalentNode();
        return local_3.CanUpgrade();
    }
    bool GetIsEquippedFoundation() const
    {
        FAvatarEquippedTalentInfo local_86;
        int local_87 = 0;
        if (!(this.GetTalentNode().IsValid()) || !(this.GetAvatarConfig()))
        {
            return false;
        }
        int local_29 = this.GetChoiceIndex();
        TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
        TDataObjectPtr<FTalentConfig> local_54;
        local_54.GetConfig(local_29);
        if (!(local_54) || (0 != 1))
        {
            return false;
        }
        if (::FMS_Talent::Get(this.GetContext().Manager).GetAvatarEquippedTalentInfo(local_87, local_86))
        {
            TEUIModelRef<FM_TalentNode> local_2_2 = this.GetTalentNode();
            if (GetDataId() == int(local_86.FoundationId))
            {
                return true;
            }
        }
        return false;
    }
    void ConsumeRedDot()
    {
        if ((int(this.GetShowPageType())) == 2)
        {
            if (this.GetTalentNode().IsValid())
            {
                TEUIModelRef<FM_TalentNode> local_6 = this.GetTalentNode();
                ::FMS_Talent::Get(this.GetContext().Manager).ConsumeNewSkillRedDot(GetDataId());
            }
        }
        return;
    }
    bool GetIsEquippedSkill() const
    {
        int local_55 = 0;
        FAvatarEquippedTalentInfo local_86;
        int local_87 = 0;
        if (!(this.GetTalentNode().IsValid()) || !(this.GetAvatarConfig()))
        {
            return false;
        }
        int local_29 = this.GetChoiceIndex();
        TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
        TDataObjectPtr<FTalentConfig> local_54;
        local_54.GetConfig(local_29);
        if (!(local_54))
        {
            return false;
        }
        if (local_55 != 4)
        {
            if ((local_55) == 6)
            {
                return true;
            }
            return false;
        }
        FMS_Talent& local_58 = ::FMS_Talent::Get(this.GetContext().Manager);
        if (local_58.GetAvatarEquippedTalentInfo(local_87, local_86))
        {
            for (auto& local_106 : local_86.SlotToTalentId)
            {
                local_87 = local_106.GetKey();
                if (local_87 == int(this.GetEquipSlot()))
                {
                    TEUIModelWeakRef<FM_TalentNode> local_112 = local_58.GetNodeByTalentId(local_87);
                    if (local_112.IsValid())
                    {
                        local_87 = GetDataId();
                        TEUIModelRef<FM_TalentNode> local_2_2 = this.GetTalentNode();
                        if (local_87 == GetDataId())
                        {
                            return true;
                        }
                        return false;
                    }
                }
            }
        }
        bool local_4_2 = false;
        return local_4_2;
    }
    bool GetIsNotEquippedFoundation() const
    {
        return !(this.GetIsEquippedFoundation());
    }
    bool GetIsNotEquippedSkill() const
    {
        return !(this.GetIsEquippedSkill());
    }
    bool CanEquip() const
    {
        if (this.GetIsFoundationNode())
        {
            return this.GetIsNotEquippedFoundation();
        }
        else
        {
            return this.GetNotSameWithButtonSkill();
        }
    }
    bool UnequippedTalentFoundation() const
    {
        int local_83 = 0;
        FAvatarEquippedTalentInfo local_114;
        if (!(this.GetTalentNode().IsValid()) || !(this.GetAvatarConfig()))
        {
            return false;
        }
        int local_29 = this.GetChoiceIndex();
        TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
        TDataObjectPtr<FTalentConfig> local_54;
        local_54.GetConfig(local_29);
        if (!(local_54))
        {
            return false;
        }
        ETalentType local_56;
        ETalentType local_55 = local_56;
        TDataObjectPtr<FTalentConfig> local_80;
        if (int(local_55) == 2)
        {
            local_80 = GetFoundationTalent();
        }
        else
        {
            if ((int(local_55)) == 1)
            {
                local_80 = local_54;
            }
            else
            {
                return false;
            }
        }
        if (!(local_80))
        {
            return false;
        }
        int local_82 = local_83;
        if (::FMS_Talent::Get(this.GetContext().Manager).GetAvatarEquippedTalentInfo(local_83, local_114))
        {
            local_83 = int(local_114.FoundationId);
            return (local_83 != local_82);
        }
        return true;
    }
    bool GetIsFoundationPassiveUnlocked() const
    {
        int local_61 = 0;
        if (!(this.GetTalentNode().IsValid()))
        {
            return false;
        }
        int local_29 = this.GetChoiceIndex();
        TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
        TDataObjectPtr<FTalentConfig> local_54;
        local_54.GetConfig(local_29);
        if (!(local_54) || !(GetFoundationTalentUnlockTalent()))
        {
            return false;
        }
        TEUIModelWeakRef<FM_TalentNode> local_64 = ::FMS_Talent::Get(this.GetContext().Manager).GetNodeByTalentId(local_61);
        return local_64.IsValid() && (int(GetStateType()) == 3);
    }
    bool GetbEquipment() const
    {
        return (int(this.GetEquipSlot()) != 0);
    }
    bool GetNotSameWithButtonSkill() const
    {
        TEUIModelRef<FVM_TalentEditSkillBtn> local_4 = ::FVM_TalentEditPage::GetCurrentSelectSkillModel(this.GetContext().UELocalPlayer);
        if (local_4.IsValid())
        {
            int local_8 = int(this.GetEquipSlot());
            int local_9 = int(GetSkillButtonSlot());
            return (local_8 != local_9);
        }
        return false;
    }
    FEUIInputAction GetEquipmentAction() const
    {
        if (this.GetContext().GetLocalPlayerPawn().IsValid())
        {
            int local_6 = int(this.GetEquipSlot());
            return FEUIInputAction(FSkillUtils::GetSkillInputAction(this.GetContext().GetLocalPlayerPawn()));
        }
        return FEUIInputAction();
    }
    bool NeedShowActionSlot() const
    {
        switch (int(this.ResolveDisplaySkillType()))
        {
        case 3:
        {
            return true;
        }
        case 4:
        {
            return true;
        }
        case 5:
        {
            return true;
        }
        case 6:
        {
            return true;
        }
        default:
        {
        }
        }
        return false;
    }
    bool IsNormalAttack() const
    {
        return (int(this.ResolveDisplaySkillType()) == 3);
    }
    FText GetSkillTypeDisplayName() const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        FText __r; return __r;
    }
    FText GetSkillUpgradeBtnText() const
    {
        if (this.GetIsUnlocked())
        {
            return FText(NSLOCTEXT("Talent", "Passive", "еЌ‡зє§жЉЂиѓЅ"));
        }
        else
        {
            return FText(NSLOCTEXT("Talent", "Passive", "и§Јй”ЃжЉЂиѓЅ"));
        }
    }
    FSoftBrush GetIconImage() const
    {
        USkillConfig local_102;
        bool local_1 = !(this.GetSkillInitConfig());
        if (local_1)
        {
            if (this.GetEffectiveTalentConfig() && local_1)
            {
            }
            else
            {
            }
        }
        TDataObjectPtr<FSkillInitConfig> local_76 = this.GetSkillInitConfigFromTalent();
        if (local_76)
        {
            if (local_76.opArrow().Icon.IsSet())
            {
                return local_76.opArrow().Icon;
            }
            local_102 = local_76.opArrow().SkillConfig;
            if (local_102 != nullptr)
            {
                return FSkillUtils::GetSkillPresentationData(this.GetContext().GetLocalPlayerPawn(), local_76.opArrow().SkillConfig).DefaultIcon;
            }
        }
        return FSoftBrush();
    }
    FText GetSkillDesc() const
    {
        bool local_51;
        bool local_1 = !(this.GetSkillInitConfig());
        if (local_1)
        {
            if (!(this.GetEffectiveTalentConfig()))
            {
                local_51 = false;
            }
            else
            {
                local_1 = !local_1;
                local_51 = local_1;
            }
            if (local_51)
            {
            }
            else
            {
            }
        }
        TDataObjectPtr<FSkillInitConfig> local_76 = this.GetSkillInitConfigFromTalent();
        if (local_76)
        {
            return local_76.opArrow().Description;
        }
        return FText();
    }
    FText GetSkillName() const
    {
        bool local_51;
        bool local_1 = !(this.GetSkillInitConfig());
        if (local_1)
        {
            if (!(this.GetEffectiveTalentConfig()))
            {
                local_51 = false;
            }
            else
            {
                local_1 = !local_1;
                local_51 = local_1;
            }
            if (local_51)
            {
            }
            else
            {
            }
        }
        TDataObjectPtr<FSkillInitConfig> local_76 = this.GetSkillInitConfigFromTalent();
        if (local_76)
        {
            return local_76.opArrow().Name;
        }
        return FText();
    }
    FText GetSkillTypeShotDesc() const
    {
        bool local_51;
        bool local_1 = !(this.GetSkillInitConfig());
        if (local_1)
        {
            if (!(this.GetEffectiveTalentConfig()))
            {
                local_51 = false;
            }
            else
            {
                local_1 = !local_1;
                local_51 = local_1;
            }
            if (local_51)
            {
            }
            else
            {
            }
        }
        TDataObjectPtr<FSkillInitConfig> local_76 = this.GetSkillInitConfigFromTalent();
        if (local_76)
        {
            return local_76.opArrow().TypeDesc;
        }
        return FText();
    }
    UMediaSource GetSkillPreviewMovie() const
    {
        UMediaSource local_52;
        if (!(this.GetSkillInitConfig()))
        {
            if (this.GetEffectiveTalentConfig() && (local_52 != nullptr))
            {
                return local_52;
            }
        }
        TDataObjectPtr<FSkillInitConfig> local_78 = this.GetSkillInitConfigFromTalent();
        if (local_78)
        {
            return local_78.opArrow().PreviewMovie;
        }
        return nullptr;
    }
    bool GetShowPreviewMovie() const
    {
        UMediaSource local_2 = this.GetSkillPreviewMovie();
        return (local_2 != nullptr);
    }
    bool GetShowPreviewPicture() const
    {
        return !(this.GetShowPreviewMovie());
    }
    FSoftBrush GetSkillPreviewPicture() const
    {
        const UTalentSettings local_102;
        bool local_1 = !(this.GetSkillInitConfig());
        if (local_1)
        {
            if (this.GetEffectiveTalentConfig() && local_1)
            {
            }
            else
            {
            }
        }
        TDataObjectPtr<FSkillInitConfig> local_76 = this.GetSkillInitConfigFromTalent();
        if (local_76 && local_76.opArrow().PreviewPicture.IsSet())
        {
            return local_76.opArrow().PreviewPicture;
        }
        GetGameplaySettings<UTalentSettings> local_104;
        local_102 = local_104;
        return local_102.DefaultPreviewPicture;
    }
    FFPTime GetSkillCDDurationSeconds() const
    {
        float32 local_1 = 0.0f;
        if (this.TryGetDisplaySkillCDSeconds(local_1))
        {
            return FFPTime(local_1);
        }
        return FFPTime();
    }
    FText GetSkillCDDurationSecondsText() const
    {
        float32 local_1 = 0.0f;
        if (!(this.TryGetDisplaySkillCDSeconds(local_1)))
        {
            return FText();
        }
        return FText::Format(NSLOCTEXT("Talent", "ReplaceSkillCDUnit", "{0}з§’"), uint(local_1));
    }
    bool GetSkillHasCDDuration() const
    {
        float32 local_1 = 0.0f;
        if (!(this.TryGetDisplaySkillCDSeconds(local_1)))
        {
            return false;
        }
        int local_4 = uint(local_1);
        return (local_4 > 0);
    }
    FSoftBrush GetSkillTypeIcon() const
    {
        const UTalentSettings local_8;
        ESkillType local_2 = this.ResolveDisplaySkillType();
        if (int(local_2) != 0)
        {
            GetGameplaySettings<UTalentSettings> local_10;
            local_8 = local_10;
            if (local_8.TalentSkillTypeIcon.Contains(local_2))
            {
                return local_8.TalentSkillTypeIcon[local_2];
            }
        }
        if (this.GetEffectiveTalentConfig())
        {
            GetGameplaySettings<UTalentSettings> local_10;
            ETalentType local_61;
            ETalentType local_62;
            local_61 = local_62;
            if ((int(local_61) == 1 || (int(local_61) == 2) || (int(local_61) == 3)))
            {
                local_8 = local_10;
                if (local_8.TalentSkillTypeIcon.Contains(ESkillType(1)))
                {
                    return local_8.TalentSkillTypeIcon[ESkillType(1)];
                }
            }
        }
        return FSoftBrush();
    }
    FText GetNextLevelUpgradeDesc() const
    {
        int local_10 = 0;
        bool local_69;
        bool local_3 = !(this.GetTalentNode());
        if (local_3)
        {
            return FText();
        }
        TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
        int local_12 = local_10.GetCurrentLevel();
        if (local_12 >= local_10.GetMaxLevel())
        {
            return FText();
        }
        FString local_18 = "";
        if (!(local_10.FindTalentByChoiceAndLevel(local_10.GetActiveChoiceIndex(), local_12 + 1)))
        {
            local_69 = false;
        }
        else
        {
            local_3 = !local_3;
            local_69 = local_3;
        }
        if (local_69)
        {
            FString local_74;
            local_18 += local_74;
        }
        return FText::FromString(local_18);
    }
    TArray<TDataObjectPtr<FTalentConfig>> GetPassiveLinkedTalentArray() const
    {
        if (!(this.GetTalentNode()))
        {
            return TArray<TDataObjectPtr<FTalentConfig>>();
        }
        int local_33 = this.GetChoiceIndex();
        TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
        TDataObjectPtr<FTalentConfig> local_58;
        local_58.GetConfig(local_33);
        if (local_58 && (GetPassiveLinkedTalentArray().Num() > 0))
        {
            return GetPassiveLinkedTalentArray();
        }
        return TArray<TDataObjectPtr<FTalentConfig>>();
    }
    bool GetHasLinkedPassiveTalent() const
    {
        if (!(this.GetSkillInitConfig()))
        {
            if (this.GetPassiveLinkedTalentArray().Num() > 0)
            {
                if (!(this.GetLinkedPassiveTalentDesc().IsEmpty()))
                {
                    return true;
                }
            }
        }
        return false;
    }
    bool HasTalentSystemUnlock() const
    {
        return ::FMS_SystemControl::Get(this.GetContext().Manager).IsSystemUnlock(ESystemModule(4), false);
    }
    FText GetLinkedPassiveTalentDesc() const
    {
        int local_41;
        int local_42 = 0;
        TArray<TDataObjectPtr<FTalentConfig>> local_8 = this.GetPassiveLinkedTalentArray();
        if (local_8.Num() == 0)
        {
            return FText();
        }
        FMS_Talent& local_18 = ::FMS_Talent::Get(this.GetContext().Manager);
        FString local_22;
        for (auto& local_36 : local_8)
        {
            if (!(local_36))
            {
                continue;
            }
            FText local_40;
            local_41 = 0;
            TDataObjectPtr<FTalentConfig> local_66 = TDataObjectPtr<FTalentConfig>(nullptr);
            if (local_18.GetNodeByTalentId(local_42).IsValid())
            {
                if (int(GetStateType()) != 3)
                {
                    continue;
                }
                if (HasChoice())
                {
                    if (local_42.FindChoiceIndexByTalentId() != GetActiveChoiceIndex())
                    {
                        continue;
                    }
                }
                local_41 = GetCurrentLevel();
                if (local_41 > 0)
                {
                    TDataObjectPtr<FTalentConfig> local_114;
                    local_114.FindTalentByChoiceAndLevel(GetActiveChoiceIndex(), local_41);
                    local_66 = local_114;
                    if (local_66)
                    {
                    }
                }
            }
            if (local_40.IsEmpty())
            {
            }
            if (!(local_40.IsEmpty()))
            {
                FString local_128;
                if (!(local_22.IsEmpty()))
                {
                    local_22 += "\n";
                }
                if (!(!(local_128.IsEmpty())) && local_66)
                {
                    local_128 = FString();
                }
                if (!(local_128.IsEmpty()))
                {
                    if (local_41 > 0)
                    {
                        local_22 += FString().Append("<Yellow18F>[").Append(local_128).Append("Lv.").Append(local_41).Append("] </>");
                    }
                    else
                    {
                        local_22 += FString().Append("<Yellow18F>[").Append(local_128).Append("] </>");
                    }
                }
                local_22 += local_40.ToString();
            }
        }
        return FText::FromString(local_22);
    }
    FText GetFoundationPassiveEffectDesc() const
    {
        bool local_59 = false;
        int local_89 = 0;
        FText __r;
        if (!(this.GetTalentNode()))
        {
            return FText();
        }
        int local_33 = this.GetChoiceIndex();
        TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
        TDataObjectPtr<FTalentConfig> local_58;
        local_58.GetConfig(local_33);
        bool local_3 = !(local_58) || !(GetFoundationTalentUnlockTalent());
        if (local_3)
        {
            return FText();
        }
        TDataObjectPtr<FTalentConfig> local_84 = GetFoundationTalentUnlockTalent();
        if (::FMS_Talent::Get(this.GetContext().Manager).GetNodeByTalentId(local_89).IsValid())
        {
            local_89 = GetCurrentLevel();
            if (local_89 > 0)
            {
                TDataObjectPtr<FTalentConfig> local_32;
                local_32.FindTalentByChoiceAndLevel(0, local_89);
                if (!(local_32))
                {
                    local_3 = false;
                }
                else
                {
                    local_59 = !local_59;
                    local_3 = local_59;
                }
                if (local_3)
                {
                }
                else
                {
                }
            }
        }
        return __r;
    }
    void OnAvatarSkillDetialSelect()
    {
        if (!(this.GetAvatarConfig().IsSet()) || (GetAvatar().Num() == 0))
        {
            return;
        }
        if (!(::FVM_TalentEditPage::CanViewAvatarTalent(this.GetContext().Manager, GetAvatar()[0])))
        {
            return;
        }
        ::FVM_TalentEditPage::GotoPage(this.GetContext().UELocalPlayer, GetAvatar()[0]);
        if ((int(this.ResolveDisplaySkillType())) != 0)
        {
            int local_7 = int(this.GetEnterButtonSlot());
            ::FVM_TalentEditPage::UpdateSkillSellectType(this.GetContext().UELocalPlayer);
        }
        return;
    }
    void UnlockOrUpgradeTalent()
    {
        TEUIModelWeakRef<FM_TalentNode> local_14;
        if (!(this.GetTalentNode()))
        {
            return;
        }
        if (CVar_Talent_UseConfirmDialog.GetBool())
        {
            FMsg_TalentUnlockOrUpgradeOpenConfirm local_6;
            FEUIModelRef local_12 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus);
            TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
            local_6.TalentNode = local_14;
            local_6.ChoiceIndex = this.GetChoiceIndex();
            return;
        }
        FEUIModelRef local_12_2 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        TEUIModelRef<FM_TalentNode> local_2_2 = this.GetTalentNode();
        FMsg_TalentUnlockOrUpgradeRequest local_18;
        local_18.TalentNode = local_14;
        local_18.ChoiceIndex = this.GetChoiceIndex();
        return;
    }
    void SwitchActiveChoiceTalent()
    {
        if (!(this.GetTalentNode()))
        {
            return;
        }
        FEUIModelRef local_12 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
        FMsg_TalentSetEquipChoiceTalent local_6;
        TEUIModelWeakRef<FM_TalentNode> local_14;
        local_6.TalentNode = local_14;
        local_6.NewChoice = this.GetChoiceIndex();
        return;
    }
    void SwitchActiveSlot()
    {
        int local_6 = 0;
        TEUIModelWeakRef<FM_TalentNode> local_14;
        if (!(this.GetTalentNode()))
        {
            return;
        }
        if (this.GetTalentNode().opArrow().IsFoundationNode())
        {
            FEUIModelRef local_12 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus);
            TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
            local_6.FoundationNode = local_14;
            return;
        }
        FEUIModelRef local_12_2 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        TEUIModelRef<FM_TalentNode> local_2_2 = this.GetTalentNode();
        FMsg_TalentSetEquipSkillSlot local_16;
        local_16.TalentNode = local_14;
        local_16.ChoiceIndex = this.GetChoiceIndex();
        return;
    }
    TDataObjectPtr<FAvatarMappingConfig> GetAvatarConfig() const property
    {
        TDataObjectPtr<FAvatarMappingConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FAvatarMappingConfig> GetModify_AvatarConfig() property
    {
        TDataObjectPtr<FAvatarMappingConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetAvatarConfig(const TDataObjectPtr<FAvatarMappingConfig> &inout __Value) property
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
    TEUIModelRef<FM_TalentNode> GetTalentNode() const property
    {
        this.TrackPropertyRead(1);
        return this.m_TalentNode;
    }
    void SetTalentNode(const TEUIModelRef<FM_TalentNode> &inout __Value) property
    {
        TEUIModelRef<FM_TalentNode> local_2;
        local_2 = this.m_TalentNode;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TalentNode = __Value;
        return;
    }
    int GetChoiceIndex() const property
    {
        this.TrackPropertyRead(2);
        return this.m_ChoiceIndex;
    }
    void SetChoiceIndex(const int __Value) property
    {
        if (this.m_ChoiceIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ChoiceIndex = __Value;
        return;
    }
    TDataObjectPtr<FSkillInitConfig> GetSkillInitConfig() const property
    {
        TDataObjectPtr<FSkillInitConfig> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TDataObjectPtr<FSkillInitConfig> GetModify_SkillInitConfig() property
    {
        TDataObjectPtr<FSkillInitConfig> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetSkillInitConfig(const TDataObjectPtr<FSkillInitConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_SkillInitConfig = __Value;
        return;
    }
    ESkillSlot GetEquipSlot() const property
    {
        this.TrackPropertyRead(4);
        return this.m_EquipSlot;
    }
    void SetEquipSlot(const ESkillSlot __Value) property
    {
        if (int(this.m_EquipSlot) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_EquipSlot = __Value;
        return;
    }
    ETalentInfoShowPageType GetShowPageType() const property
    {
        this.TrackPropertyRead(5);
        return this.m_ShowPageType;
    }
    void SetShowPageType(const ETalentInfoShowPageType __Value) property
    {
        if (int(this.m_ShowPageType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_ShowPageType = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_TalentUpgradeDesc>> GetAchievedCondIdList() const property
    {
        const TArray<TEUIModelRef<FVM_TalentUpgradeDesc>> __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    TArray<TEUIModelRef<FVM_TalentUpgradeDesc>> GetModify_AchievedCondIdList() property
    {
        TArray<TEUIModelRef<FVM_TalentUpgradeDesc>> __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetAchievedCondIdList(const TArray<TEUIModelRef<FVM_TalentUpgradeDesc>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_AchievedCondIdList = __Value;
        return;
    }
    bool GetbAllCondAchieved() const property
    {
        this.TrackPropertyRead(7);
        return this.m_bAllCondAchieved;
    }
    void SetbAllCondAchieved(const bool __Value) property
    {
        if (!(this.m_bAllCondAchieved) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_bAllCondAchieved = __Value;
        return;
    }
    TEUIModelRef<FVM_RedDot> GetRedDotVM() const property
    {
        this.TrackPropertyRead(8);
        return this.m_RedDotVM;
    }
    void SetRedDotVM(const TEUIModelRef<FVM_RedDot> &inout __Value) property
    {
        TEUIModelRef<FVM_RedDot> local_2;
        local_2 = this.m_RedDotVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_RedDotVM = __Value;
        return;
    }
    ESkillSlot GetEnterButtonSlot() const property
    {
        this.TrackPropertyRead(9);
        return this.m_EnterButtonSlot;
    }
    void SetEnterButtonSlot(const ESkillSlot __Value) property
    {
        if (int(this.m_EnterButtonSlot) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_EnterButtonSlot = __Value;
        return;
    }
    int GetDoubleStateTalentIndex() const property
    {
        this.TrackPropertyRead(10);
        return this.m_DoubleStateTalentIndex;
    }
    void SetDoubleStateTalentIndex(const int __Value) property
    {
        if (this.m_DoubleStateTalentIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_DoubleStateTalentIndex = __Value;
        return;
    }
    bool GetbNeedAutoPlay() const property
    {
        this.TrackPropertyRead(11);
        return this.m_bNeedAutoPlay;
    }
    void SetbNeedAutoPlay(const bool __Value) property
    {
        if (!(this.m_bNeedAutoPlay) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_bNeedAutoPlay = __Value;
        return;
    }
    bool GetbPlayHideAnim() const property
    {
        this.TrackPropertyRead(12);
        return this.m_bPlayHideAnim;
    }
    void SetbPlayHideAnim(const bool __Value) property
    {
        if (!(this.m_bPlayHideAnim) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_bPlayHideAnim = __Value;
        return;
    }
    bool GetbVisible() const property
    {
        this.TrackPropertyRead(13);
        return this.m_bVisible;
    }
    void SetbVisible(const bool __Value) property
    {
        if (!(this.m_bVisible) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_bVisible = __Value;
        return;
    }
    uint GetCurLevelForWidget() const property
    {
        this.TrackPropertyRead(14);
        return this.m_CurLevelForWidget;
    }
    void SetCurLevelForWidget(const uint __Value) property
    {
        if (this.m_CurLevelForWidget == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_CurLevelForWidget = __Value;
        return;
    }
    bool GetbIsShownChoiceEquipped() const property
    {
        this.TrackPropertyRead(15);
        return this.m_bIsShownChoiceEquipped;
    }
    void SetbIsShownChoiceEquipped(const bool __Value) property
    {
        if (!(this.m_bIsShownChoiceEquipped) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_bIsShownChoiceEquipped = __Value;
        return;
    }
    TEUIModelRef<FVM_TalentSkillTypeBG> GetSkillTypeBGVM() const property
    {
        this.TrackPropertyRead(16);
        return this.m_SkillTypeBGVM;
    }
    void SetSkillTypeBGVM(const TEUIModelRef<FVM_TalentSkillTypeBG> &inout __Value) property
    {
        TEUIModelRef<FVM_TalentSkillTypeBG> local_2;
        local_2 = this.m_SkillTypeBGVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_SkillTypeBGVM = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TalentSkillInfoItem
{
    UPROPERTY()
    bool HasDoubleForm;
    UPROPERTY()
    int ShowPageTypeIndex;
    UPROPERTY()
    bool IsShowPageTypeIsTalentInfoPage;
    UPROPERTY()
    bool IsShowPageTypeIsSkillChangePage;
    UPROPERTY()
    bool ShowAchievedCondList;
    UPROPERTY()
    bool ShowUpgradeSpendCondList;
    UPROPERTY()
    bool ShowNextlevelUpgradeDesc;
    UPROPERTY()
    bool IsChoiceTalent;
    UPROPERTY()
    bool IsActiveChoice;
    UPROPERTY()
    bool IsNotActiveChoice;
    UPROPERTY()
    bool IsEquippedChoice;
    UPROPERTY()
    bool IsUnequippedChoice;
    UPROPERTY()
    bool IsFoundationNode;
    UPROPERTY()
    bool IsNotFoundationNode;
    UPROPERTY()
    bool IsUnlocked;
    UPROPERTY()
    bool IsUnlockedAndChoice;
    UPROPERTY()
    bool IsMaxLevel;
    UPROPERTY()
    bool IsNotMaxLevel;
    UPROPERTY()
    bool ShowUpgradeBtn;
    UPROPERTY()
    bool UpgradeBtnCostEnough;
    UPROPERTY()
    bool IsEquippedFoundation;
    UPROPERTY()
    bool IsEquippedSkill;
    UPROPERTY()
    bool IsNotEquippedFoundation;
    UPROPERTY()
    bool IsNotEquippedSkill;
    UPROPERTY()
    bool CanEquip;
    UPROPERTY()
    bool UnequippedTalentFoundation;
    UPROPERTY()
    bool IsFoundationPassiveUnlocked;
    UPROPERTY()
    bool bEquipment;
    UPROPERTY()
    bool NotSameWithButtonSkill;
    UPROPERTY()
    FEUIInputAction EquipmentAction;
    UPROPERTY()
    bool NeedShowActionSlot;
    UPROPERTY()
    bool IsNormalAttack;
    UPROPERTY()
    FText SkillTypeDisplayName;
    UPROPERTY()
    FText SkillUpgradeBtnText;
    UPROPERTY()
    FSoftBrush IconImage;
    UPROPERTY()
    FText SkillDesc;
    UPROPERTY()
    FText SkillName;
    UPROPERTY()
    FText SkillTypeShotDesc;
    UPROPERTY()
    UMediaSource SkillPreviewMovie = nullptr;
    UPROPERTY()
    bool ShowPreviewMovie;
    UPROPERTY()
    bool ShowPreviewPicture;
    UPROPERTY()
    FSoftBrush SkillPreviewPicture;
    UPROPERTY()
    FFPTime SkillCDDurationSeconds;
    UPROPERTY()
    FText SkillCDDurationSecondsText;
    UPROPERTY()
    bool SkillHasCDDuration;
    UPROPERTY()
    FSoftBrush SkillTypeIcon;
    UPROPERTY()
    FText NextLevelUpgradeDesc;
    UPROPERTY()
    bool HasLinkedPassiveTalent;
    UPROPERTY()
    bool HasTalentSystemUnlock;
    UPROPERTY()
    FText LinkedPassiveTalentDesc;
    UPROPERTY()
    FText FoundationPassiveEffectDesc;
    UPROPERTY()
    TEUIModelRef<FVM_TalentSkillInfoItem> Self;


}

namespace FVM_TalentSkillInfoItem
{
FVM_TalentSkillInfoItem& Create(const UObject ContextObject, const TDataObjectPtr<FAvatarMappingConfig> &inout AvatarConfig, const TEUIModelRef<FM_TalentNode> &inout TalentNode, const ESkillSlot EquipSlot, const ETalentInfoShowPageType ShowPageType)
{
    return FVM_TalentSkillInfoItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), AvatarConfig, TalentNode);
}
FVM_TalentSkillInfoItem CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FAvatarMappingConfig> &inout AvatarConfig, const TEUIModelRef<FM_TalentNode> &inout TalentNode, const ESkillSlot EquipSlot, const ETalentInfoShowPageType ShowPageType)
{
    FVM_TalentSkillInfoItem __r;
    TEUIModelRef<FVM_TalentSkillInfoItem> local_6 = TEUIModelRef<FVM_TalentSkillInfoItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TalentSkillInfoItem::ModelId, 0, AvatarConfig, TalentNode, EquipSlot, ShowPageType));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_TalentSkillInfoItem;
}
void __OnTalentNodeChanged(FVM_TalentSkillInfoItem &inout Model)
{
    Model.OnTalentNodeChanged();
    return;
}
void __OnTalentNodeLevelChanged(FVM_TalentSkillInfoItem &inout Model)
{
    Model.OnTalentNodeLevelChanged();
    return;
}
void __OnTalentDataUpdatedForEquip(FVM_TalentSkillInfoItem &inout Model, const FMsg_TalentTreeDataUpdate &inout Message)
{
    Model.OnTalentDataUpdatedForEquip(Message);
    return;
}
ESkillSlot __UIGetter_EquipSlot(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetEquipSlot();
}
ETalentInfoShowPageType __UIGetter_ShowPageType(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetShowPageType();
}
TArray<TEUIModelRef<FVM_TalentUpgradeDesc>> __UIGetter_AchievedCondIdList(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetAchievedCondIdList();
}
TEUIModelRef<FVM_RedDot> __UIGetter_RedDotVM(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetRedDotVM();
}
int __UIGetter_DoubleStateTalentIndex(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetDoubleStateTalentIndex();
}
bool __UIGetter_bVisible(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetbVisible();
}
uint __UIGetter_CurLevelForWidget(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetCurLevelForWidget();
}
bool __UIGetter_bIsShownChoiceEquipped(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetbIsShownChoiceEquipped();
}
TEUIModelRef<FVM_TalentSkillTypeBG> __UIGetter_SkillTypeBGVM(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetSkillTypeBGVM();
}
bool __UIGetter_HasDoubleForm(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetHasDoubleForm();
}
int __UIGetter_ShowPageTypeIndex(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetShowPageTypeIndex();
}
bool __UIGetter_IsShowPageTypeIsTalentInfoPage(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetIsShowPageTypeIsTalentInfoPage();
}
bool __UIGetter_IsShowPageTypeIsSkillChangePage(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetIsShowPageTypeIsSkillChangePage();
}
bool __UIGetter_ShowAchievedCondList(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetShowAchievedCondList();
}
bool __UIGetter_ShowUpgradeSpendCondList(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetShowUpgradeSpendCondList();
}
bool __UIGetter_ShowNextlevelUpgradeDesc(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetShowNextlevelUpgradeDesc();
}
bool __UIGetter_IsChoiceTalent(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetIsChoiceTalent();
}
bool __UIGetter_IsActiveChoice(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetIsActiveChoice();
}
bool __UIGetter_IsNotActiveChoice(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetIsNotActiveChoice();
}
bool __UIGetter_IsEquippedChoice(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetIsEquippedChoice();
}
bool __UIGetter_IsUnequippedChoice(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetIsUnequippedChoice();
}
bool __UIGetter_IsFoundationNode(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetIsFoundationNode();
}
bool __UIGetter_IsNotFoundationNode(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetIsNotFoundationNode();
}
bool __UIGetter_IsUnlocked(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetIsUnlocked();
}
bool __UIGetter_IsUnlockedAndChoice(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetIsUnlockedAndChoice();
}
bool __UIGetter_IsMaxLevel(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetIsMaxLevel();
}
bool __UIGetter_IsNotMaxLevel(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetIsNotMaxLevel();
}
bool __UIGetter_ShowUpgradeBtn(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetShowUpgradeBtn();
}
bool __UIGetter_UpgradeBtnCostEnough(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetUpgradeBtnCostEnough();
}
bool __UIGetter_IsEquippedFoundation(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetIsEquippedFoundation();
}
bool __UIGetter_IsEquippedSkill(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetIsEquippedSkill();
}
bool __UIGetter_IsNotEquippedFoundation(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetIsNotEquippedFoundation();
}
bool __UIGetter_IsNotEquippedSkill(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetIsNotEquippedSkill();
}
bool __UIGetter_CanEquip(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.CanEquip();
}
bool __UIGetter_UnequippedTalentFoundation(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.UnequippedTalentFoundation();
}
bool __UIGetter_IsFoundationPassiveUnlocked(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetIsFoundationPassiveUnlocked();
}
bool __UIGetter_bEquipment(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetbEquipment();
}
bool __UIGetter_NotSameWithButtonSkill(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetNotSameWithButtonSkill();
}
FEUIInputAction __UIGetter_EquipmentAction(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetEquipmentAction();
}
bool __UIGetter_NeedShowActionSlot(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.NeedShowActionSlot();
}
bool __UIGetter_IsNormalAttack(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.IsNormalAttack();
}
FText __UIGetter_SkillTypeDisplayName(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetSkillTypeDisplayName();
}
FText __UIGetter_SkillUpgradeBtnText(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetSkillUpgradeBtnText();
}
FSoftBrush __UIGetter_IconImage(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetIconImage();
}
FText __UIGetter_SkillDesc(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetSkillDesc();
}
FText __UIGetter_SkillName(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetSkillName();
}
FText __UIGetter_SkillTypeShotDesc(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetSkillTypeShotDesc();
}
UMediaSource __UIGetter_SkillPreviewMovie(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetSkillPreviewMovie();
}
bool __UIGetter_ShowPreviewMovie(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetShowPreviewMovie();
}
bool __UIGetter_ShowPreviewPicture(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetShowPreviewPicture();
}
FSoftBrush __UIGetter_SkillPreviewPicture(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetSkillPreviewPicture();
}
FFPTime __UIGetter_SkillCDDurationSeconds(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetSkillCDDurationSeconds();
}
FText __UIGetter_SkillCDDurationSecondsText(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetSkillCDDurationSecondsText();
}
bool __UIGetter_SkillHasCDDuration(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetSkillHasCDDuration();
}
FSoftBrush __UIGetter_SkillTypeIcon(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetSkillTypeIcon();
}
FText __UIGetter_NextLevelUpgradeDesc(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetNextLevelUpgradeDesc();
}
bool __UIGetter_HasLinkedPassiveTalent(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetHasLinkedPassiveTalent();
}
bool __UIGetter_HasTalentSystemUnlock(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.HasTalentSystemUnlock();
}
FText __UIGetter_LinkedPassiveTalentDesc(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetLinkedPassiveTalentDesc();
}
FText __UIGetter_FoundationPassiveEffectDesc(const FVM_TalentSkillInfoItem &inout Model)
{
    return Model.GetFoundationPassiveEffectDesc();
}
TEUIModelRef<FVM_TalentSkillInfoItem> __UIGetter_Self(const FVM_TalentSkillInfoItem &inout Model)
{
    return TEUIModelRef<FVM_TalentSkillInfoItem>(Model);
}
int __IndexOf_AvatarConfig()
{
    return 0;
}
int __IndexOf_TalentNode()
{
    return 1;
}
int __IndexOf_ChoiceIndex()
{
    return 2;
}
int __IndexOf_SkillInitConfig()
{
    return 3;
}
int __IndexOf_EquipSlot()
{
    return 4;
}
int __IndexOf_ShowPageType()
{
    return 5;
}
int __IndexOf_AchievedCondIdList()
{
    return 6;
}
int __IndexOf_bAllCondAchieved()
{
    return 7;
}
int __IndexOf_RedDotVM()
{
    return 8;
}
int __IndexOf_EnterButtonSlot()
{
    return 9;
}
int __IndexOf_DoubleStateTalentIndex()
{
    return 10;
}
int __IndexOf_bNeedAutoPlay()
{
    return 11;
}
int __IndexOf_bPlayHideAnim()
{
    return 12;
}
int __IndexOf_bVisible()
{
    return 13;
}
int __IndexOf_CurLevelForWidget()
{
    return 14;
}
int __IndexOf_bIsShownChoiceEquipped()
{
    return 15;
}
int __IndexOf_SkillTypeBGVM()
{
    return 16;
}
}
namespace __GeneratedProperties_FVM_TalentSkillInfoItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

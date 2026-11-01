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
        if (!(this.GetDoubleStateTalentIndex() != 1) && local_28.Get().GetDoubleFormTalent())
        {
            return local_28.Get().GetDoubleFormTalent();
        }
        return local_28;
    }
    TDataObjectPtr<FSkillInitConfig> GetSkillInitConfigFromTalent() const
    {
        if (this.GetSkillInitConfig())
        {
            return this.GetSkillInitConfig();
        }
        TDataObjectPtr<FTalentConfig> local_74 = this.GetEffectiveTalentConfig();
        if (!(!(local_74)) && local_74.Get().GetSkillConfig())
        {
            return local_74.Get().GetSkillConfig();
        }
        return TDataObjectPtr<FSkillInitConfig>(nullptr);
    }
    ESkillType ResolveDisplaySkillType() const
    {
        if (!(this.GetSkillInitConfig()))
        {
            TDataObjectPtr<FTalentConfig> local_50 = this.GetEffectiveTalentConfig();
            if (local_50 && (int(local_50.Get().TalentSkillType) != 0))
            {
                return ESkillType(local_50.Get().TalentSkillType);
            }
        }
        if (this.GetSkillInitConfig())
        {
            return ESkillType(this.GetSkillInitConfig().Get().SkillType);
        }
        TDataObjectPtr<FTalentConfig> local_26 = this.GetEffectiveTalentConfig();
        if (!(!(local_26)) && local_26.Get().GetSkillConfig())
        {
            return ESkillType(local_26.Get().GetSkillConfig().Get().SkillType);
        }
        return ESkillType(0);
    }
    bool TryGetDisplaySkillCDSeconds(float32 &inout OutSeconds) const
    {
        if (!(this.GetSkillInitConfig()))
        {
            TDataObjectPtr<FTalentConfig> local_50 = this.GetEffectiveTalentConfig();
            if (local_50 && (local_50.Get().TalentSkillCDSeconds >= 0.0f))
            {
                OutSeconds = local_50.Get().TalentSkillCDSeconds;
                return true;
            }
        }
        TDataObjectPtr<FSkillInitConfig> local_78 = this.GetSkillInitConfigFromTalent();
        if (local_78 && ((local_78.opArrow().SkillConfig != nullptr)))
        {
            OutSeconds = local_78.opArrow().SkillConfig.DefaultSkillStateConfig.CDConfig.CDDuration.DefaultValue;
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
        return local_28 && !(!(local_28.Get().GetDoubleFormTalent()));
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
        switch (this.GetShowPageType())
        {
        case ETalentInfoShowPageType::AvatarInfoPage:
        {
            return false;
        }
        case ETalentInfoShowPageType::TalentInfoPage:
        {
            return true;
        }
        case ETalentInfoShowPageType::SkillChangePage:
        {
            return false;
        }
        }
    }
    bool GetIsShowPageTypeIsSkillChangePage() const
    {
        switch (this.GetShowPageType())
        {
        case ETalentInfoShowPageType::AvatarInfoPage:
        {
            return false;
        }
        case ETalentInfoShowPageType::TalentInfoPage:
        {
            return false;
        }
        case ETalentInfoShowPageType::SkillChangePage:
        {
            return true;
        }
        }
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
        TDataObjectPtr<FTalentConfig> local_48 = this.GetEffectiveTalentConfig();
        bool local_51 = local_48 && local_48.Get().Icon.IsSet();
        TDataObjectPtr<FSkillInitConfig> local_76 = this.GetSkillInitConfigFromTalent();
        bool local_50 = !(local_51);
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
            this.SetRedDotVM(TEUIModelRef<FVM_RedDot>(::FVM_RedDot::Create(this.GetContext().Manager, FRedDotNodeData(GameplayTags::RedDotSystem_Avatar_NewTalent, this.GetTalentNode().Get().GetDataId()))));
        }
        int local_120 = int(this.ResolveDisplaySkillType());
        if (local_120 != 0)
        {
            this.SetSkillTypeBGVM(TEUIModelRef<FVM_TalentSkillTypeBG>(::FVM_TalentSkillTypeBG::Create(this.GetContext().Manager, ESkillType(local_120))));
        }
        return;
    }
    void SetSkillInitConfigOverride(const TDataObjectPtr<FSkillInitConfig> &inout InConfig)
    {
        this.SetSkillInitConfig(InConfig);
        int local_2 = int(this.ResolveDisplaySkillType());
        if (local_2 != 0)
        {
            this.SetSkillTypeBGVM(TEUIModelRef<FVM_TalentSkillTypeBG>(::FVM_TalentSkillTypeBG::Create(this.GetContext().Manager, ESkillType(local_2))));
        }
        return;
    }
    void OnTalentNodeChanged()
    {
        this.CreateAchievedCondIdList();
        this.SetCurLevelForWidget(this.GetTalentNode().Get().GetActiveLevel());
        this.RefreshShownChoiceEquipped();
        return;
    }
    void OnTalentNodeLevelChanged()
    {
        this.CreateAchievedCondIdList();
        this.SetCurLevelForWidget(this.GetTalentNode().Get().GetActiveLevel());
        this.RefreshShownChoiceEquipped();
        return;
    }
    void RefreshShownChoiceEquipped()
    {
        this.SetbIsShownChoiceEquipped(this.GetTalentNode().IsValid() && this.GetTalentNode().Get().IsEquippedChoice(this.GetChoiceIndex()));
        return;
    }
    void OnTalentDataUpdatedForEquip(const FMsg_TalentTreeDataUpdate &inout Msg)
    {
        this.RefreshShownChoiceEquipped();
        return;
    }
    int GetConditionDataId(const TDataObjectPtr<FServerConditionConfigBase> &inout Cond) const
    {
        CastTo local_28;
        TDataObjectPtr<FConditionConfig> local_52 = local_28.opCall();
        if (local_52)
        {
            return ::NumericUtils::AsInt32(local_52.opArrow().DataId);
        }
        CastTo local_84;
        TDataObjectPtr<FGsConditionGroupConfig> local_108 = local_84.opCall();
        if (local_108)
        {
            return ::NumericUtils::AsInt32(local_108.opArrow().DataId);
        }
        return INDEX_NONE;
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
        TArray<TEUIModelWeakRef<FM_TalentNode>> local_98 = TEUIModelRef<FMS_Talent>(::FMS_Talent::Get(this.GetContext().Manager)).Get().GetTalentParentConfigListByNode((TEUIModelWeakRef<FM_TalentNode>(local_8)));
        if (local_98.Num() > 0)
        {
            bool local_100;
            local_100 = true;
            for (auto& local_114 : local_98)
            {
                if (local_114.IsValid() && (int(local_114.Get().GetStateType()) != 3))
                {
                    local_100 = false;
                    break;
                }
            }
            TEUIModelRef<FVM_TalentUpgradeDesc> local_118 = TEUIModelRef<FVM_TalentUpgradeDesc>(::FVM_TalentUpgradeDesc::Create(this.GetContext().Manager));
            local_118.Get().SetContextDesc(NSLOCTEXT("Talent", "TalentPrereqNodeUnlock", "前置节点需解锁"));
            local_118.Get().SetbHighLight(local_100);
            this.GetModify_AchievedCondIdList().Add(local_118);
            if (!(local_100))
            {
                this.SetbAllCondAchieved(false);
            }
        }
        if ((local_60.Get().UnlockLevel) > 0)
        {
            int local_125;
            local_125 = ::FM_LocalPlayerLevel::Get(this.GetContext().Manager).GetLevel();
            TEUIModelRef<FVM_TalentUpgradeDesc> local_118_2 = TEUIModelRef<FVM_TalentUpgradeDesc>(::FVM_TalentUpgradeDesc::Create(this.GetContext().Manager));
            local_118_2.Get().SetContextDesc(FText::Format(NSLOCTEXT("Talent", "UpgradeUnlockLevel", "玩家等级达到{0}"), local_60.Get().UnlockLevel));
            local_1 = (local_125 >= local_60.Get().UnlockLevel);
            local_118_2.Get().SetbHighLight(local_1);
            this.GetModify_AchievedCondIdList().Add(local_118_2);
            if (!(local_1))
            {
                this.SetbAllCondAchieved(false);
            }
        }
        for (auto& local_144 : local_60.Get().GetUnlockCondition())
        {
            if (!(local_144))
            {
                continue;
            }
            TEUIModelRef<FVM_TalentUpgradeDesc> local_118_3 = TEUIModelRef<FVM_TalentUpgradeDesc>(::FVM_TalentUpgradeDesc::Create(this.GetContext().Manager));
            local_118_3.Get().SetContextDesc(local_144.Get().ConditionTips);
            bool local_116 = local_8.GetAchievedCondIdList().Contains(this.GetConditionDataId(local_144)) || local_8.GetUnlockableTalentIds().Contains(local_60.opArrow().DataId);
            local_118_3.Get().SetbHighLight(local_116);
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
        if ((int(this.GetTalentNode().Get().GetStateType())) == 3)
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
        return this.GetTalentNode().IsValid() && this.GetTalentNode().Get().HasChoice();
    }
    bool GetIsActiveChoice() const
    {
        if (!(this.GetTalentNode().IsValid()) || !(this.GetTalentNode().Get().HasChoice()))
        {
            return false;
        }
        return (int(this.GetTalentNode().Get().GetStateType()) == 3);
    }
    bool GetIsNotActiveChoice() const
    {
        if (!(this.GetTalentNode().IsValid()) || !(this.GetTalentNode().Get().HasChoice()))
        {
            return false;
        }
        return (int(this.GetTalentNode().Get().GetStateType()) != 3);
    }
    bool GetIsEquippedChoice() const
    {
        return this.GetTalentNode().IsValid() && this.GetTalentNode().Get().IsEquippedChoice(this.GetChoiceIndex());
    }
    bool GetIsUnequippedChoice() const
    {
        return this.GetTalentNode().IsValid() && this.GetTalentNode().Get().IsUnequippedChoice(this.GetChoiceIndex());
    }
    bool GetIsFoundationNode() const
    {
        if (!(this.GetTalentNode().IsValid()))
        {
            return false;
        }
        TDataObjectPtr<FTalentConfig> local_54 = this.GetTalentNode().Get().GetConfig(this.GetChoiceIndex());
        return local_54 && (int(local_54.Get().TalentType) == 1);
    }
    bool GetIsNotFoundationNode() const
    {
        return !(this.GetIsFoundationNode());
    }
    bool GetIsUnlocked() const
    {
        return this.GetTalentNode().IsValid() && (int(this.GetTalentNode().Get().GetStateType()) == 3);
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
        if (this.GetTalentNode().Get().CanUpgrade(false))
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
        return this.GetTalentNode().Get().CanUpgrade(true);
    }
    bool GetIsEquippedFoundation() const
    {
        FAvatarEquippedTalentInfo local_86;
        if (!(this.GetTalentNode().IsValid()) || !(this.GetAvatarConfig()))
        {
            return false;
        }
        TDataObjectPtr<FTalentConfig> local_54 = this.GetTalentNode().Get().GetConfig(this.GetChoiceIndex());
        if (!(local_54) || (int(local_54.Get().TalentType) != 1))
        {
            return false;
        }
        if (::FMS_Talent::Get(this.GetContext().Manager).GetAvatarEquippedTalentInfo(this.GetAvatarConfig().Get().DataId, local_86))
        {
            if (this.GetTalentNode().Get().GetDataId() == int(local_86.FoundationId))
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
                ::FMS_Talent::Get(this.GetContext().Manager).ConsumeNewSkillRedDot(this.GetTalentNode().Get().GetDataId());
            }
        }
        return;
    }
    bool GetIsEquippedSkill() const
    {
        FAvatarEquippedTalentInfo local_86;
        if (!(this.GetTalentNode().IsValid()) || !(this.GetAvatarConfig()))
        {
            return false;
        }
        TDataObjectPtr<FTalentConfig> local_54 = this.GetTalentNode().Get().GetConfig(this.GetChoiceIndex());
        if (!(local_54))
        {
            return false;
        }
        if (int(local_54.Get().TalentType) != 4)
        {
            if ((int(local_54.Get().TalentType)) == 6)
            {
                return true;
            }
            return false;
        }
        FMS_Talent& local_58 = ::FMS_Talent::Get(this.GetContext().Manager);
        if (local_58.GetAvatarEquippedTalentInfo(this.GetAvatarConfig().Get().DataId, local_86))
        {
            for (auto& local_106 : local_86.SlotToTalentId)
            {
                if (local_106.GetKey() == int(this.GetEquipSlot()))
                {
                    TEUIModelWeakRef<FM_TalentNode> local_112 = local_58.GetNodeByTalentId(local_106.GetValue());
                    if (local_112.IsValid())
                    {
                        if (local_112.Get().GetDataId() == this.GetTalentNode().Get().GetDataId())
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
        FAvatarEquippedTalentInfo local_114;
        if (!(this.GetTalentNode().IsValid()) || !(this.GetAvatarConfig()))
        {
            return false;
        }
        TDataObjectPtr<FTalentConfig> local_54 = this.GetTalentNode().Get().GetConfig(this.GetChoiceIndex());
        if (!(local_54))
        {
            return false;
        }
        ETalentType local_55 = local_54.Get().TalentType;
        TDataObjectPtr<FTalentConfig> local_80;
        if (int(local_55) == 2)
        {
            local_80 = local_54.Get().GetFoundationTalent();
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
        int local_83 = local_80.Get().DataId;
        int local_82 = local_83;
        if (::FMS_Talent::Get(this.GetContext().Manager).GetAvatarEquippedTalentInfo(this.GetAvatarConfig().Get().DataId, local_114))
        {
            return (int(local_114.FoundationId) != local_82);
        }
        return true;
    }
    bool GetIsFoundationPassiveUnlocked() const
    {
        if (!(this.GetTalentNode().IsValid()))
        {
            return false;
        }
        TDataObjectPtr<FTalentConfig> local_54 = this.GetTalentNode().Get().GetConfig(this.GetChoiceIndex());
        if (!(local_54) || !(local_54.Get().GetFoundationTalentUnlockTalent()))
        {
            return false;
        }
        TEUIModelWeakRef<FM_TalentNode> local_64 = ::FMS_Talent::Get(this.GetContext().Manager).GetNodeByTalentId(local_54.Get().GetFoundationTalentUnlockTalent().Get().DataId);
        return local_64.IsValid() && (int(local_64.Get().GetStateType()) == 3);
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
            int local_9 = int(local_4.Get().GetSkillButtonSlot());
            return (local_8 != local_9);
        }
        return false;
    }
    FEUIInputAction GetEquipmentAction() const
    {
        if (this.GetContext().GetLocalPlayerPawn().IsValid())
        {
            return FEUIInputAction(FSkillUtils::GetSkillInputAction(this.GetContext().GetLocalPlayerPawn(), this.GetEquipSlot()));
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
        // body not fully recovered — stub [opcode-uncovered]
        FText __r; return __r;
    }
    FText GetSkillUpgradeBtnText() const
    {
        if (this.GetIsUnlocked())
        {
            return FText(NSLOCTEXT("Talent", "Passive", "升级技能"));
        }
        else
        {
            return FText(NSLOCTEXT("Talent", "Passive", "解锁技能"));
        }
    }
    FSoftBrush GetIconImage() const
    {
        USkillConfig local_102;
        if (!(this.GetSkillInitConfig()))
        {
            TDataObjectPtr<FTalentConfig> local_50 = this.GetEffectiveTalentConfig();
            if (local_50 && local_50.Get().Icon.IsSet())
            {
                return local_50.Get().Icon;
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
        if (!(this.GetSkillInitConfig()))
        {
            TDataObjectPtr<FTalentConfig> local_50 = this.GetEffectiveTalentConfig();
            if (local_50 && !(local_50.Get().TalentDesc.IsEmpty()))
            {
                return local_50.Get().TalentDesc;
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
        if (!(this.GetSkillInitConfig()))
        {
            TDataObjectPtr<FTalentConfig> local_50 = this.GetEffectiveTalentConfig();
            if (local_50 && !(local_50.Get().TalentName.IsEmpty()))
            {
                return local_50.Get().TalentName;
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
        if (!(this.GetSkillInitConfig()))
        {
            TDataObjectPtr<FTalentConfig> local_50 = this.GetEffectiveTalentConfig();
            if (local_50 && !(local_50.Get().ShotDesc.IsEmpty()))
            {
                return local_50.Get().ShotDesc;
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
        if (!(this.GetSkillInitConfig()))
        {
            TDataObjectPtr<FTalentConfig> local_50 = this.GetEffectiveTalentConfig();
            if (local_50 && ((local_50.Get().PreviewMovie != nullptr)))
            {
                return local_50.Get().PreviewMovie;
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
        if (!(this.GetSkillInitConfig()))
        {
            TDataObjectPtr<FTalentConfig> local_50 = this.GetEffectiveTalentConfig();
            if (local_50 && local_50.Get().PreviewImage.IsSet())
            {
                return local_50.Get().PreviewImage;
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
        return FText::Format(NSLOCTEXT("Talent", "ReplaceSkillCDUnit", "{0}秒"), uint(local_1));
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
        TDataObjectPtr<FTalentConfig> local_60 = this.GetEffectiveTalentConfig();
        if (local_60)
        {
            GetGameplaySettings<UTalentSettings> local_10;
            ETalentType local_61;
            local_61 = local_60.Get().TalentType;
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
        if (!(this.GetTalentNode()))
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
        TDataObjectPtr<FTalentConfig> local_68 = local_10.FindTalentByChoiceAndLevel(local_10.GetActiveChoiceIndex(), local_12 + 1);
        if (local_68 && !(local_68.Get().TalentUpgradeDesc.IsEmpty()))
        {
            local_18 += local_68.Get().TalentUpgradeDesc.ToString();
        }
        return FText::FromString(local_18);
    }
    TArray<TDataObjectPtr<FTalentConfig>> GetPassiveLinkedTalentArray() const
    {
        if (!(this.GetTalentNode()))
        {
            return TArray<TDataObjectPtr<FTalentConfig>>();
        }
        TDataObjectPtr<FTalentConfig> local_58 = this.GetTalentNode().Get().GetConfig(this.GetChoiceIndex());
        if (local_58 && (local_58.Get().GetPassiveLinkedTalentArray().Num() > 0))
        {
            return local_58.Get().GetPassiveLinkedTalentArray();
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
            TEUIModelWeakRef<FM_TalentNode> local_118 = local_18.GetNodeByTalentId(local_36.Get().DataId);
            if (local_118.IsValid())
            {
                if (int(local_118.Get().GetStateType()) != 3)
                {
                    continue;
                }
                if (local_118.Get().HasChoice())
                {
                    if (local_118.Get().FindChoiceIndexByTalentId(local_36.Get().DataId) != local_118.Get().GetActiveChoiceIndex())
                    {
                        continue;
                    }
                }
                local_41 = local_118.Get().GetCurrentLevel();
                if (local_41 > 0)
                {
                    local_66 = local_118.Get().FindTalentByChoiceAndLevel(local_118.Get().GetActiveChoiceIndex(), local_41);
                    if (local_66)
                    {
                        local_40 = local_66.Get().TalentDesc;
                    }
                }
            }
            if (local_40.IsEmpty())
            {
                local_40 = local_36.Get().TalentDesc;
            }
            if (!(local_40.IsEmpty()))
            {
                if (!(local_22.IsEmpty()))
                {
                    local_22 += "\n";
                }
                FString local_128 = local_36.Get().TalentName.ToString();
                if (!(!(local_128.IsEmpty())) && local_66)
                {
                    local_128 = local_66.Get().TalentName.ToString();
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
        if (!(this.GetTalentNode()))
        {
            return FText();
        }
        TDataObjectPtr<FTalentConfig> local_58 = this.GetTalentNode().Get().GetConfig(this.GetChoiceIndex());
        if (!(local_58) || !(local_58.Get().GetFoundationTalentUnlockTalent()))
        {
            return FText();
        }
        TDataObjectPtr<FTalentConfig> local_84 = local_58.Get().GetFoundationTalentUnlockTalent();
        TEUIModelWeakRef<FM_TalentNode> local_92 = ::FMS_Talent::Get(this.GetContext().Manager).GetNodeByTalentId(local_84.Get().DataId);
        if (local_92.IsValid())
        {
            int local_89_2 = local_92.Get().GetCurrentLevel();
            if (local_89_2 > 0)
            {
                TDataObjectPtr<FTalentConfig> local_32 = local_92.Get().FindTalentByChoiceAndLevel(0, local_89_2);
                if (local_32 && !(local_32.Get().TalentUpgradeDesc.IsEmpty()))
                {
                    return local_32.Get().TalentUpgradeDesc;
                }
            }
        }
        return local_84.Get().TalentUpgradeDesc;
    }
    void OnAvatarSkillDetialSelect()
    {
        if (!(this.GetAvatarConfig().IsSet()) || (this.GetAvatarConfig().Get().GetAvatar().Num() == 0))
        {
            return;
        }
        if (!(::FVM_TalentEditPage::CanViewAvatarTalent(this.GetContext().Manager, this.GetAvatarConfig().Get().GetAvatar()[0])))
        {
            return;
        }
        ::FVM_TalentEditPage::GotoPage(this.GetContext().UELocalPlayer, this.GetAvatarConfig().Get().GetAvatar()[0]);
        int local_6 = int(this.ResolveDisplaySkillType());
        if (local_6 != 0)
        {
            ::FVM_TalentEditPage::UpdateSkillSellectType(this.GetContext().UELocalPlayer, this.GetEnterButtonSlot(), ESkillType(local_6));
        }
        return;
    }
    void UnlockOrUpgradeTalent()
    {
        if (!(this.GetTalentNode()))
        {
            return;
        }
        if (CVar_Talent_UseConfirmDialog.GetBool())
        {
            FMsg_TalentUnlockOrUpgradeOpenConfirm local_6;
            FEUIModelRef local_12 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus);
            local_6.TalentNode = TEUIModelWeakRef<FM_TalentNode>(this.GetTalentNode().Get());
            local_6.ChoiceIndex = this.GetChoiceIndex();
            return;
        }
        FEUIModelRef local_12_2 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        FMsg_TalentUnlockOrUpgradeRequest local_18;
        local_18.TalentNode = TEUIModelWeakRef<FM_TalentNode>(this.GetTalentNode().Get());
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
        FMsg_TalentSetEquipChoiceTalent local_6;
        local_6.TalentNode = TEUIModelWeakRef<FM_TalentNode>(this.GetTalentNode().Get());
        local_6.NewChoice = this.GetChoiceIndex();
        return;
    }
    void SwitchActiveSlot()
    {
        int local_6 = 0;
        if (!(this.GetTalentNode()))
        {
            return;
        }
        if (this.GetTalentNode().opArrow().IsFoundationNode())
        {
            FEUIModelRef local_12 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus);
            local_6.FoundationNode = TEUIModelWeakRef<FM_TalentNode>(this.GetTalentNode().Get());
            return;
        }
        FEUIModelRef local_12_2 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        FMsg_TalentSetEquipSkillSlot local_16;
        local_16.TalentNode = TEUIModelWeakRef<FM_TalentNode>(this.GetTalentNode().Get());
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
    return FVM_TalentSkillInfoItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), AvatarConfig, TalentNode, ESkillSlot(EquipSlot), ETalentInfoShowPageType(ShowPageType));
}
FVM_TalentSkillInfoItem& CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FAvatarMappingConfig> &inout AvatarConfig, const TEUIModelRef<FM_TalentNode> &inout TalentNode, const ESkillSlot EquipSlot, const ETalentInfoShowPageType ShowPageType)
{
    return TEUIModelRef<FVM_TalentSkillInfoItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TalentSkillInfoItem::ModelId, 0, AvatarConfig, TalentNode, EquipSlot, ShowPageType)).Get();
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "EquipSlot";
    local_14.TypeName = "ESkillSlot";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowPageType";
    local_14.TypeName = "ETalentInfoShowPageType";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AchievedCondIdList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_TalentUpgradeDesc>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RedDotVM";
    local_14.TypeName = "TEUIModelRef<FVM_RedDot>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DoubleStateTalentIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bVisible";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurLevelForWidget";
    local_14.TypeName = "uint32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsShownChoiceEquipped";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillTypeBGVM";
    local_14.TypeName = "TEUIModelRef<FVM_TalentSkillTypeBG>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasDoubleForm";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowPageTypeIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsShowPageTypeIsTalentInfoPage";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsShowPageTypeIsSkillChangePage";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowAchievedCondList";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowUpgradeSpendCondList";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowNextlevelUpgradeDesc";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsChoiceTalent";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsActiveChoice";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsNotActiveChoice";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsEquippedChoice";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsUnequippedChoice";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsFoundationNode";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsNotFoundationNode";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsUnlocked";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsUnlockedAndChoice";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsMaxLevel";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsNotMaxLevel";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowUpgradeBtn";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "UpgradeBtnCostEnough";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsEquippedFoundation";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsEquippedSkill";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsNotEquippedFoundation";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsNotEquippedSkill";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CanEquip";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "UnequippedTalentFoundation";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsFoundationPassiveUnlocked";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bEquipment";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "NotSameWithButtonSkill";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipmentAction";
    local_14.TypeName = "FEUIInputAction";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "NeedShowActionSlot";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsNormalAttack";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillTypeDisplayName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillUpgradeBtnText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IconImage";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillTypeShotDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillPreviewMovie";
    local_14.TypeName = "UMediaSource";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowPreviewMovie";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowPreviewPicture";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillPreviewPicture";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillCDDurationSeconds";
    local_14.TypeName = "FFPTime";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillCDDurationSecondsText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillHasCDDuration";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillTypeIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "NextLevelUpgradeDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasLinkedPassiveTalent";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasTalentSystemUnlock";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LinkedPassiveTalentDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FoundationPassiveEffectDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TalentSkillInfoItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TalentSkillInfoItem;
    FEUIModelRefPropertyDirtyIndexer local_22 = FEUIModelRefPropertyDirtyIndexer(17);
    local_22.AddRefPropertyDirty(0, 0, FM_TalentNode::__IndexOf_ActiveLevel());
    local_22.ApplySort();
    FEUIModelRefPropertyDirty local_30;
    local_30.PropertyName = FName("TalentNode");
    local_30.PropertyModelId = FM_TalentNode::ModelId;
    local_30.MappingDirtyOffset = local_22.GetMappingDirtyOffset(0);
    local_30.RelatedDirtyMask.SetBit(FM_TalentNode::__IndexOf_ActiveLevel(), true);
    Result.ListeningModelRefDirties.Add(local_30);
    FEUIModelDirtyDefine local_40;
    local_40.FunctionName = "__OnTalentNodeChanged";
    local_40.DirtyFlags.Set(FVM_TalentSkillInfoItem::__IndexOf_TalentNode());
    Result.DirtyFunctions.Add(local_40);
    local_40.FunctionName = "__OnTalentNodeLevelChanged";
    local_40.DirtyFlags.Set(FVM_TalentSkillInfoItem::__IndexOf_TalentNode());
    local_40.DirtyFlags.Set(local_22.GetMappingDirtyIndex(0));
    Result.DirtyFunctions.Add(local_40);
    FEUIModelMsgHandleDefine local_50;
    local_50.FunctionName = "__OnTalentDataUpdatedForEquip";
    local_50.MessageTypeName = "Msg_TalentTreeDataUpdate";
    local_50.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_50);
    return;
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
    return __GeneratedProperties_FVM_TalentSkillInfoItem.Get();
}
}

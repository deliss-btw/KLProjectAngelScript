namespace FVM_TalentNodeHover
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OpenDetails = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SwitchChoice = FEUIModelCallbackSignature();

}
struct FVM_TalentNodeHover : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_TalentNode> m_TalentNode;
    UPROPERTY()
    int m_ChoiceIndex;
    UPROPERTY()
    bool m_bVisible;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>> m_AchievedCondIdList;
    UPROPERTY()
    bool m_bAllCondAchieved;

    FVM_TalentNodeHover()
    {
        this.m_ChoiceIndex = 0;
        this.m_bVisible = true;
        this.m_bAllCondAchieved = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TalentNodeHover' by default constructor.");
        return;
    }
    FVM_TalentNodeHover(const FVM_TalentNodeHover &inout Other)
    {
        this.m_ChoiceIndex = 0;
        this.m_bVisible = true;
        this.m_bAllCondAchieved = false;
        this.m_TalentNode = Other.m_TalentNode;
        this.m_ChoiceIndex = int(Other.m_ChoiceIndex);
        this.m_bVisible = Other.m_bVisible;
        this.m_AchievedCondIdList = Other.m_AchievedCondIdList;
        this.m_bAllCondAchieved = Other.m_bAllCondAchieved;
        return;
    }
    FVM_TalentNodeHover(const TEUIModelRef<FM_TalentNode> &inout InTalentNode, const int InChoiceIndex)
    {
        this.m_ChoiceIndex = 0;
        this.m_bVisible = true;
        this.m_bAllCondAchieved = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTalentNode(InTalentNode);
        this.SetChoiceIndex(InChoiceIndex);
        return;
    }
    FVM_TalentNodeHover opAssign(const FVM_TalentNodeHover &inout Other)
    {
        FVM_TalentNodeHover __r;
        this.m_TalentNode = Other.m_TalentNode;
        this.m_ChoiceIndex = int(Other.m_ChoiceIndex);
        this.m_bVisible = Other.m_bVisible;
        this.m_AchievedCondIdList = Other.m_AchievedCondIdList;
        this.m_bAllCondAchieved = Other.m_bAllCondAchieved;
        return __r;
    }
    TArray<TEUIModelRef<FVM_TalentUpgradeDesc>> GetAchievedCondUpgradeDescList() const
    {
        TArray<TEUIModelRef<FVM_TalentUpgradeDesc>> local_4;
        for (auto& local_20 : this.GetAchievedCondIdList())
        {
            if (!(local_20.IsValid()))
            {
                continue;
            }
            TEUIModelRef<FVM_TalentUpgradeDesc> local_22 = TEUIModelRef<FVM_TalentUpgradeDesc>(::FVM_TalentUpgradeDesc::Create(this.GetContext().Manager));
            local_22.Get().SetContextDesc(local_20.Get().GetTitle());
            local_22.Get().SetbHighLight(local_20.Get().GetbDone());
            local_4.Add(local_22);
        }
        return local_4;
    }
    void PostConstruct()
    {
        this.CreateAchievedCondIdList();
        return;
    }
    void OnTalentNodeChanged()
    {
        this.CreateAchievedCondIdList();
        return;
    }
    void OnTalentNodeLevelChanged()
    {
        this.CreateAchievedCondIdList();
        return;
    }
    TDataObjectPtr<FTalentConfig> GetEffectiveTalentConfig() const
    {
        int local_54 = 0;
        int local_58;
        TDataObjectPtr<FTalentConfig> local_28;
        if (!(this.GetTalentNode().IsValid()))
        {
            return local_28;
        }
        TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
        if (local_54.GetActiveLevel() > 0)
        {
            local_58 = local_54.GetActiveLevel();
        }
        else
        {
            local_58 = 1;
        }
        local_28 = local_54.FindTalentByChoiceAndLevel(this.GetChoiceIndex(), local_58);
        TDataObjectPtr<FTalentConfig> local_52;
        if (local_28)
        {
            local_52 = local_28;
        }
        else
        {
            local_52 = local_54.GetConfig().NodeConfig;
        }
        return local_52;
    }
    TDataObjectPtr<FSkillInitConfig> GetSkillInitConfig() const
    {
        TDataObjectPtr<FTalentConfig> local_48 = this.GetEffectiveTalentConfig();
        if (!(!(local_48)) && local_48.Get().GetSkillConfig())
        {
            return local_48.Get().GetSkillConfig();
        }
        return TDataObjectPtr<FSkillInitConfig>();
    }
    FText GetTalentName() const
    {
        TDataObjectPtr<FTalentConfig> local_48 = this.GetEffectiveTalentConfig();
        if (local_48 && !(local_48.Get().TalentName.IsEmpty()))
        {
            return local_48.Get().TalentName;
        }
        TDataObjectPtr<FSkillInitConfig> local_74 = this.GetSkillInitConfig();
        if (local_74 && !(local_74.opArrow().Name.IsEmpty()))
        {
            return local_74.opArrow().Name;
        }
        return FText();
    }
    FText GetTalentLevel() const
    {
        if (this.GetTalentNode().Get().GetMaxLevel() <= 1)
        {
            return FText();
        }
        int local_1 = this.GetTalentNode().Get().GetCurrentLevel();
        if (local_1 < 1)
        {
            return FText();
        }
        return FText::FromString(FString::Format("Lv{0} ", local_1));
    }
    FText GetTalentDesc() const
    {
        TDataObjectPtr<FTalentConfig> local_48 = this.GetEffectiveTalentConfig();
        if (local_48 && !(local_48.Get().TalentDesc.IsEmpty()))
        {
            return local_48.Get().TalentDesc;
        }
        TDataObjectPtr<FSkillInitConfig> local_74 = this.GetSkillInitConfig();
        if (local_74 && !(local_74.opArrow().Description.IsEmpty()))
        {
            return local_74.opArrow().Description;
        }
        return FText();
    }
    bool GetIsChoiceTalent() const
    {
        return this.GetTalentNode().IsValid() && this.GetTalentNode().Get().HasChoice();
    }
    bool GetCanSwitchChoice() const
    {
        return this.GetTalentNode().IsValid() && this.GetTalentNode().Get().IsUnequippedChoice(this.GetChoiceIndex());
    }
    TDataObjectPtr<FAvatarMappingConfig> GetAvatarConfig() const
    {
        if (!(this.GetTalentNode().IsValid()))
        {
            return TDataObjectPtr<FAvatarMappingConfig>();
        }
        return this.GetTalentNode().Get().GetAvatarMappingConfig();
    }
    FText GetSkillName() const
    {
        TDataObjectPtr<FTalentConfig> local_48 = this.GetEffectiveTalentConfig();
        if (local_48 && !(local_48.Get().TalentName.IsEmpty()))
        {
            return local_48.Get().TalentName;
        }
        TDataObjectPtr<FSkillInitConfig> local_74 = this.GetSkillInitConfig();
        if (local_74 && !(local_74.opArrow().Name.IsEmpty()))
        {
            return local_74.opArrow().Name;
        }
        return FText();
    }
    bool GetIsUnequippedChoice() const
    {
        return this.GetTalentNode().IsValid() && this.GetTalentNode().Get().IsUnequippedChoice(this.GetChoiceIndex());
    }
    bool GetIsUnlocked() const
    {
        return this.GetTalentNode().IsValid() && (int(this.GetTalentNode().Get().GetStateType()) == 3);
    }
    bool GetIsCostInsufficient() const
    {
        int local_6 = 0;
        if (!(this.GetTalentNode().IsValid()))
        {
            return false;
        }
        TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
        return !(local_6.CanUpgrade(true));
    }
    bool GetIsCostInsufficientAndNotMaxLevel() const
    {
        int local_6 = 0;
        if (!(this.GetTalentNode().IsValid()))
        {
            return false;
        }
        TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
        return !(local_6.CanUpgrade(true)) && (local_6.GetCurrentLevel() < local_6.GetMaxLevel());
    }
    bool GetIsFoundation() const
    {
        if (!(this.GetTalentNode().IsValid()))
        {
            return false;
        }
        TDataObjectPtr<FTalentConfig> local_54 = this.GetTalentNode().Get().GetConfig(this.GetChoiceIndex());
        return local_54 && (int(local_54.Get().TalentType) == 1);
    }
    bool GetIsFoundationCostInsufficient() const
    {
        return this.GetIsFoundation() && this.GetIsCostInsufficient();
    }
    FText GetUpgradeUnavailableReason() const
    {
        bool local_1;
        bool local_9;
        if (!(this.GetbAllCondAchieved()))
        {
            return NSLOCTEXT("Talent", "TalentUpgradeCondNotMet", "未满足条件");
        }
        if (!(this.GetTalentNode().IsValid()))
        {
            local_9 = false;
        }
        else
        {
            local_9 = false;
            local_9 = this.GetTalentNode().Get().CanUpgrade(local_9);
        }
        if (!(local_9))
        {
            local_1 = false;
        }
        else
        {
            local_1 = true;
            local_1 = !(this.GetTalentNode().Get().CanUpgrade(local_1));
        }
        if (local_1)
        {
            return NSLOCTEXT("Talent", "TalentUpgradeCostNotEnough", "材料不足");
        }
        return FText();
    }
    FText GetSkillUpgradeBtnText() const
    {
        if (this.GetIsUnlocked())
        {
            return FText(NSLOCTEXT("Talent", "Passive", "升级技能"));
        }
        return FText(NSLOCTEXT("Talent", "Passive", "解锁技能"));
    }
    bool GetIsEquippedSkill() const
    {
        FAvatarEquippedTalentInfo local_136;
        TDataObjectPtr<FAvatarMappingConfig> local_48 = this.GetAvatarConfig();
        if (!(this.GetTalentNode().IsValid()) || !(local_48))
        {
            return false;
        }
        TDataObjectPtr<FTalentConfig> local_102 = this.GetTalentNode().Get().GetConfig(this.GetChoiceIndex());
        if (!(local_102))
        {
            return false;
        }
        if (int(local_102.Get().TalentType) != 4)
        {
            return (int(local_102.Get().TalentType) == 6);
        }
        int local_106 = 0;
        int local_105 = local_106;
        FMS_Talent& local_108 = ::FMS_Talent::Get(this.GetContext().Manager);
        if (local_108.GetAvatarEquippedTalentInfo(local_48.Get().DataId, local_136))
        {
            for (auto& local_156 : local_136.SlotToTalentId)
            {
                int local_137_2 = local_156.GetKey();
                if (local_137_2 == 0)
                {
                    TEUIModelWeakRef<FM_TalentNode> local_162 = local_108.GetNodeByTalentId(local_156.GetValue());
                    if (local_162.IsValid())
                    {
                        return (local_162.Get().GetDataId() == this.GetTalentNode().Get().GetDataId());
                    }
                }
            }
        }
        return false;
    }
    bool GetIsEquippedFoundation() const
    {
        FAvatarEquippedTalentInfo local_134;
        TDataObjectPtr<FAvatarMappingConfig> local_48 = this.GetAvatarConfig();
        if (!(this.GetTalentNode().IsValid()) || !(local_48))
        {
            return false;
        }
        TDataObjectPtr<FTalentConfig> local_102 = this.GetTalentNode().Get().GetConfig(this.GetChoiceIndex());
        if (!(local_102) || (int(local_102.Get().TalentType) != 1))
        {
            return false;
        }
        if (::FMS_Talent::Get(this.GetContext().Manager).GetAvatarEquippedTalentInfo(local_48.Get().DataId, local_134))
        {
            return (this.GetTalentNode().Get().GetDataId() == int(local_134.FoundationId));
        }
        return false;
    }
    bool GetIsUnEquippedFoundation() const
    {
        return this.GetIsFoundation() && !(this.GetIsEquippedFoundation());
    }
    TArray<TDataObjectPtr<FTalentConfig>> GetPassiveLinkedTalentArray() const
    {
        if (!(this.GetTalentNode().IsValid()))
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
        if (this.GetPassiveLinkedTalentArray().Num() > 0)
        {
            if (!(this.GetLinkedPassiveTalentDesc().IsEmpty()))
            {
                return true;
            }
        }
        return false;
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
        bool local_100;
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
            local_100 = true;
            for (auto& local_114 : local_98)
            {
                if (local_114.IsValid() && (int(local_114.Get().GetStateType()) != 3))
                {
                    local_100 = false;
                    break;
                }
            }
            FText local_122;
            TEUIModelRef<FVM_TitleAndDescAndStatus> local_118 = TEUIModelRef<FVM_TitleAndDescAndStatus>(::FVM_TitleAndDescAndStatus::Create(this.GetContext().Manager, NSLOCTEXT("Talent", "TalentPrereqNodeUnlock", "前置节点需解锁"), local_122));
            local_118.Get().SetbDone(local_100);
            this.GetModify_AchievedCondIdList().Add(local_118);
            if (!(local_100))
            {
                this.SetbAllCondAchieved(false);
            }
        }
        FText local_126;
        if ((local_60.Get().UnlockLevel) > 0)
        {
            int local_129;
            local_129 = ::FM_LocalPlayerLevel::Get(this.GetContext().Manager).GetLevel();
            local_1 = (local_129 >= local_60.Get().UnlockLevel);
            FText local_122;
            local_126 = NSLOCTEXT("Talent", "UpgradeUnlockLevel", "玩家等级达到{0}");
            TEUIModelRef<FVM_TitleAndDescAndStatus> local_118_2 = TEUIModelRef<FVM_TitleAndDescAndStatus>(::FVM_TitleAndDescAndStatus::Create(this.GetContext().Manager, FText::Format(local_126, local_60.Get().UnlockLevel), local_122));
            local_118_2.Get().SetbDone(local_1);
            this.GetModify_AchievedCondIdList().Add(local_118_2);
            local_100 = !(local_1);
            if (local_100)
            {
                this.SetbAllCondAchieved(false);
            }
        }
        for (auto& local_148 : local_60.Get().GetUnlockCondition())
        {
            if (!(local_148))
            {
                continue;
            }
            local_100 = local_8.GetAchievedCondIdList().Contains(this.GetConditionDataId(local_148)) || local_8.GetUnlockableTalentIds().Contains(local_60.opArrow().DataId);
            TEUIModelRef<FVM_TitleAndDescAndStatus> local_118_3 = TEUIModelRef<FVM_TitleAndDescAndStatus>(::FVM_TitleAndDescAndStatus::Create(this.GetContext().Manager, local_148.Get().ConditionTips, local_126));
            local_118_3.Get().SetbDone(local_100);
            this.GetModify_AchievedCondIdList().Add(local_118_3);
            if (!(local_100))
            {
                this.SetbAllCondAchieved(false);
            }
        }
        return;
    }
    void OpenDetails()
    {
        if (!(this.GetTalentNode().IsValid()))
        {
            return;
        }
        FEUIModelRef local_12 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        FMsg_TalentNodeHoverOpenDetails local_6;
        local_6.TalentNode = TEUIModelWeakRef<FM_TalentNode>(this.GetTalentNode().Get());
        local_6.ChoiceIndex = this.GetChoiceIndex();
        return;
    }
    void SwitchChoice()
    {
        if (!(this.GetTalentNode().IsValid()) || !(this.GetCanSwitchChoice()))
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
    TEUIModelRef<FM_TalentNode> GetTalentNode() const property
    {
        this.TrackPropertyRead(0);
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
        this.MarkPropertyDirty(0);
        this.m_TalentNode = __Value;
        return;
    }
    int GetChoiceIndex() const property
    {
        this.TrackPropertyRead(1);
        return this.m_ChoiceIndex;
    }
    void SetChoiceIndex(const int __Value) property
    {
        if (this.m_ChoiceIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ChoiceIndex = __Value;
        return;
    }
    bool GetbVisible() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bVisible;
    }
    void SetbVisible(const bool __Value) property
    {
        if (!(this.m_bVisible) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bVisible = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>> GetAchievedCondIdList() const property
    {
        const TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>> GetModify_AchievedCondIdList() property
    {
        TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetAchievedCondIdList(const TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_AchievedCondIdList = __Value;
        return;
    }
    bool GetbAllCondAchieved() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bAllCondAchieved;
    }
    void SetbAllCondAchieved(const bool __Value) property
    {
        if (!(this.m_bAllCondAchieved) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bAllCondAchieved = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TalentNodeHover
{
    UPROPERTY()
    TArray<TEUIModelRef<FVM_TalentUpgradeDesc>> AchievedCondUpgradeDescList;
    UPROPERTY()
    FText TalentName;
    UPROPERTY()
    FText TalentLevel;
    UPROPERTY()
    FText TalentDesc;
    UPROPERTY()
    bool IsChoiceTalent;
    UPROPERTY()
    bool CanSwitchChoice;
    UPROPERTY()
    FText SkillName;
    UPROPERTY()
    bool IsUnequippedChoice;
    UPROPERTY()
    bool IsUnlocked;
    UPROPERTY()
    bool IsCostInsufficient;
    UPROPERTY()
    bool IsCostInsufficientAndNotMaxLevel;
    UPROPERTY()
    bool IsFoundation;
    UPROPERTY()
    bool IsFoundationCostInsufficient;
    UPROPERTY()
    FText UpgradeUnavailableReason;
    UPROPERTY()
    FText SkillUpgradeBtnText;
    UPROPERTY()
    bool IsEquippedSkill;
    UPROPERTY()
    bool IsEquippedFoundation;
    UPROPERTY()
    bool IsUnEquippedFoundation;
    UPROPERTY()
    bool HasLinkedPassiveTalent;
    UPROPERTY()
    FText LinkedPassiveTalentDesc;
    UPROPERTY()
    TEUIModelRef<FVM_TalentNodeHover> Self;

}

namespace FVM_TalentNodeHover
{
FVM_TalentNodeHover& Create(const UObject ContextObject, const TEUIModelRef<FM_TalentNode> &inout TalentNode, const int ChoiceIndex)
{
    return FVM_TalentNodeHover::CreateByManager(EUIInternal::GetContextManager(ContextObject), TalentNode, ChoiceIndex);
}
FVM_TalentNodeHover& CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_TalentNode> &inout TalentNode, const int ChoiceIndex)
{
    return TEUIModelRef<FVM_TalentNodeHover>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TalentNodeHover::ModelId, 0, TalentNode, ChoiceIndex)).Get();
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "bVisible";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AchievedCondIdList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AchievedCondUpgradeDescList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_TalentUpgradeDesc>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TalentName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TalentLevel";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TalentDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsChoiceTalent";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CanSwitchChoice";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsUnequippedChoice";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsUnlocked";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsCostInsufficient";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsCostInsufficientAndNotMaxLevel";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsFoundation";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsFoundationCostInsufficient";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "UpgradeUnavailableReason";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillUpgradeBtnText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsEquippedSkill";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsEquippedFoundation";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsUnEquippedFoundation";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasLinkedPassiveTalent";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LinkedPassiveTalentDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TalentNodeHover>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TalentNodeHover;
    FEUIModelRefPropertyDirtyIndexer local_22 = FEUIModelRefPropertyDirtyIndexer(5);
    local_22.AddRefPropertyDirty(0, 0, FM_TalentNode::__IndexOf_ActiveLevel());
    local_22.ApplySort();
    FEUIModelRefPropertyDirty local_30;
    local_30.PropertyName = FName("TalentNode");
    int local_2_2 = FM_TalentNode::ModelId;
    int local_2_3 = local_22.GetMappingDirtyOffset(0);
    local_30.RelatedDirtyMask.SetBit(FM_TalentNode::__IndexOf_ActiveLevel(), true);
    Result.ListeningModelRefDirties.Add(local_30);
    FEUIModelDirtyDefine local_40;
    local_40.FunctionName = "__OnTalentNodeChanged";
    local_40.DirtyFlags.Set(FVM_TalentNodeHover::__IndexOf_TalentNode());
    Result.DirtyFunctions.Add(local_40);
    local_40.FunctionName = "__OnTalentNodeLevelChanged";
    local_40.DirtyFlags.Set(FVM_TalentNodeHover::__IndexOf_TalentNode());
    local_40.DirtyFlags.Set(local_22.GetMappingDirtyIndex(0));
    Result.DirtyFunctions.Add(local_40);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TalentNodeHover;
}
void __OnTalentNodeChanged(FVM_TalentNodeHover &inout Model)
{
    Model.OnTalentNodeChanged();
    return;
}
void __OnTalentNodeLevelChanged(FVM_TalentNodeHover &inout Model)
{
    Model.OnTalentNodeLevelChanged();
    return;
}
bool __UIGetter_bVisible(const FVM_TalentNodeHover &inout Model)
{
    return Model.GetbVisible();
}
TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>> __UIGetter_AchievedCondIdList(const FVM_TalentNodeHover &inout Model)
{
    return Model.GetAchievedCondIdList();
}
TArray<TEUIModelRef<FVM_TalentUpgradeDesc>> __UIGetter_AchievedCondUpgradeDescList(const FVM_TalentNodeHover &inout Model)
{
    return Model.GetAchievedCondUpgradeDescList();
}
FText __UIGetter_TalentName(const FVM_TalentNodeHover &inout Model)
{
    return Model.GetTalentName();
}
FText __UIGetter_TalentLevel(const FVM_TalentNodeHover &inout Model)
{
    return Model.GetTalentLevel();
}
FText __UIGetter_TalentDesc(const FVM_TalentNodeHover &inout Model)
{
    return Model.GetTalentDesc();
}
bool __UIGetter_IsChoiceTalent(const FVM_TalentNodeHover &inout Model)
{
    return Model.GetIsChoiceTalent();
}
bool __UIGetter_CanSwitchChoice(const FVM_TalentNodeHover &inout Model)
{
    return Model.GetCanSwitchChoice();
}
FText __UIGetter_SkillName(const FVM_TalentNodeHover &inout Model)
{
    return Model.GetSkillName();
}
bool __UIGetter_IsUnequippedChoice(const FVM_TalentNodeHover &inout Model)
{
    return Model.GetIsUnequippedChoice();
}
bool __UIGetter_IsUnlocked(const FVM_TalentNodeHover &inout Model)
{
    return Model.GetIsUnlocked();
}
bool __UIGetter_IsCostInsufficient(const FVM_TalentNodeHover &inout Model)
{
    return Model.GetIsCostInsufficient();
}
bool __UIGetter_IsCostInsufficientAndNotMaxLevel(const FVM_TalentNodeHover &inout Model)
{
    return Model.GetIsCostInsufficientAndNotMaxLevel();
}
bool __UIGetter_IsFoundation(const FVM_TalentNodeHover &inout Model)
{
    return Model.GetIsFoundation();
}
bool __UIGetter_IsFoundationCostInsufficient(const FVM_TalentNodeHover &inout Model)
{
    return Model.GetIsFoundationCostInsufficient();
}
FText __UIGetter_UpgradeUnavailableReason(const FVM_TalentNodeHover &inout Model)
{
    return Model.GetUpgradeUnavailableReason();
}
FText __UIGetter_SkillUpgradeBtnText(const FVM_TalentNodeHover &inout Model)
{
    return Model.GetSkillUpgradeBtnText();
}
bool __UIGetter_IsEquippedSkill(const FVM_TalentNodeHover &inout Model)
{
    return Model.GetIsEquippedSkill();
}
bool __UIGetter_IsEquippedFoundation(const FVM_TalentNodeHover &inout Model)
{
    return Model.GetIsEquippedFoundation();
}
bool __UIGetter_IsUnEquippedFoundation(const FVM_TalentNodeHover &inout Model)
{
    return Model.GetIsUnEquippedFoundation();
}
bool __UIGetter_HasLinkedPassiveTalent(const FVM_TalentNodeHover &inout Model)
{
    return Model.GetHasLinkedPassiveTalent();
}
FText __UIGetter_LinkedPassiveTalentDesc(const FVM_TalentNodeHover &inout Model)
{
    return Model.GetLinkedPassiveTalentDesc();
}
TEUIModelRef<FVM_TalentNodeHover> __UIGetter_Self(const FVM_TalentNodeHover &inout Model)
{
    return TEUIModelRef<FVM_TalentNodeHover>(Model);
}
int __IndexOf_TalentNode()
{
    return 0;
}
int __IndexOf_ChoiceIndex()
{
    return 1;
}
int __IndexOf_bVisible()
{
    return 2;
}
int __IndexOf_AchievedCondIdList()
{
    return 3;
}
int __IndexOf_bAllCondAchieved()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_TalentNodeHover
{
UScriptStruct StaticStruct()
{
    return __GeneratedProperties_FVM_TalentNodeHover.Get();
}
}

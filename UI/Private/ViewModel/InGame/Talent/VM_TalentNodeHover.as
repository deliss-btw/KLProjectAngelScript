
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
            GetTitle().SetContextDesc();
            bool local_17 = GetbDone();
            local_17.SetbHighLight();
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
        if (!(!(this.GetEffectiveTalentConfig())) && GetSkillConfig())
        {
            return GetSkillConfig();
        }
        return TDataObjectPtr<FSkillInitConfig>();
    }
    FText GetTalentName() const
    {
        bool local_49 = false;
        bool local_50;
        FText __return;
        if (!(this.GetEffectiveTalentConfig()))
        {
            local_50 = false;
        }
        else
        {
            local_49 = !local_49;
            local_50 = local_49;
        }
        if (local_50)
        {
        }
        else
        {
            TDataObjectPtr<FSkillInitConfig> local_74 = this.GetSkillInitConfig();
            if (local_74 && !(local_74.opArrow().Name.IsEmpty()))
            {
                return local_74.opArrow().Name;
            }
            __return = FText();
        }
        return __return;
    }
    FText GetTalentLevel() const
    {
        TEUIModelRef<FM_TalentNode> local_4 = this.GetTalentNode();
        if (GetMaxLevel() <= 1)
        {
            return FText();
        }
        TEUIModelRef<FM_TalentNode> local_4_2 = this.GetTalentNode();
        int local_1 = GetCurrentLevel();
        if (local_1 < 1)
        {
            return FText();
        }
        return FText::FromString(FString::Format("Lv{0} ", local_1));
    }
    FText GetTalentDesc() const
    {
        bool local_49 = false;
        bool local_50;
        FText __return;
        if (!(this.GetEffectiveTalentConfig()))
        {
            local_50 = false;
        }
        else
        {
            local_49 = !local_49;
            local_50 = local_49;
        }
        if (local_50)
        {
        }
        else
        {
            TDataObjectPtr<FSkillInitConfig> local_74 = this.GetSkillInitConfig();
            if (local_74 && !(local_74.opArrow().Description.IsEmpty()))
            {
                return local_74.opArrow().Description;
            }
            __return = FText();
        }
        return __return;
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
    bool GetCanSwitchChoice() const
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
    TDataObjectPtr<FAvatarMappingConfig> GetAvatarConfig() const
    {
        TDataObjectPtr<FAvatarMappingConfig> local_28;
        if (!(this.GetTalentNode().IsValid()))
        {
            return local_28;
        }
        TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
        local_28.GetAvatarMappingConfig();
        return local_28;
    }
    FText GetSkillName() const
    {
        bool local_49 = false;
        bool local_50;
        FText __return;
        if (!(this.GetEffectiveTalentConfig()))
        {
            local_50 = false;
        }
        else
        {
            local_49 = !local_49;
            local_50 = local_49;
        }
        if (local_50)
        {
        }
        else
        {
            TDataObjectPtr<FSkillInitConfig> local_74 = this.GetSkillInitConfig();
            if (local_74 && !(local_74.opArrow().Name.IsEmpty()))
            {
                return local_74.opArrow().Name;
            }
            __return = FText();
        }
        return __return;
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
        int local_29 = this.GetChoiceIndex();
        TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
        TDataObjectPtr<FTalentConfig> local_54;
        local_54.GetConfig(local_29);
        return (local_54 && (0 == 1));
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
            return NSLOCTEXT("Talent", "TalentUpgradeCondNotMet", "жњЄж»Ўи¶іжќЎд»¶");
        }
        if (!(this.GetTalentNode().IsValid()))
        {
            local_9 = false;
        }
        else
        {
            local_9 = false;
            TEUIModelRef<FM_TalentNode> local_8 = this.GetTalentNode();
            local_9 = local_9.CanUpgrade();
        }
        if (!(local_9))
        {
            local_1 = false;
        }
        else
        {
            local_1 = true;
            TEUIModelRef<FM_TalentNode> local_8_2 = this.GetTalentNode();
            local_1 = !(local_1.CanUpgrade());
        }
        if (local_1)
        {
            return NSLOCTEXT("Talent", "TalentUpgradeCostNotEnough", "жќђж–™дёЌи¶і");
        }
        return FText();
    }
    FText GetSkillUpgradeBtnText() const
    {
        if (this.GetIsUnlocked())
        {
            return FText(NSLOCTEXT("Talent", "Passive", "еЌ‡зє§жЉЂиѓЅ"));
        }
        return FText(NSLOCTEXT("Talent", "Passive", "и§Јй”ЃжЉЂиѓЅ"));
    }
    bool GetIsEquippedSkill() const
    {
        int local_103 = 0;
        FAvatarEquippedTalentInfo local_136;
        int local_137 = 0;
        int local_157 = 0;
        if (!(this.GetTalentNode().IsValid()) || !(this.GetAvatarConfig()))
        {
            return false;
        }
        int local_77 = this.GetChoiceIndex();
        TEUIModelRef<FM_TalentNode> local_50 = this.GetTalentNode();
        TDataObjectPtr<FTalentConfig> local_102;
        local_102.GetConfig(local_77);
        if (!(local_102))
        {
            return false;
        }
        if (local_103 != 4)
        {
            return (local_103 == 6);
        }
        int local_106 = 0;
        int local_105 = local_106;
        FMS_Talent& local_108 = ::FMS_Talent::Get(this.GetContext().Manager);
        if (local_108.GetAvatarEquippedTalentInfo(local_137, local_136))
        {
            for (auto& local_156 : local_136.SlotToTalentId)
            {
                local_137 = local_156.GetKey();
                if (local_137 == 0)
                {
                    TEUIModelWeakRef<FM_TalentNode> local_162 = local_108.GetNodeByTalentId(local_157);
                    if (local_162.IsValid())
                    {
                        local_137 = GetDataId();
                        TEUIModelRef<FM_TalentNode> local_50_2 = this.GetTalentNode();
                        return (local_137 == GetDataId());
                    }
                }
            }
        }
        return false;
    }
    bool GetIsEquippedFoundation() const
    {
        FAvatarEquippedTalentInfo local_134;
        int local_135 = 0;
        if (!(this.GetTalentNode().IsValid()) || !(this.GetAvatarConfig()))
        {
            return false;
        }
        int local_77 = this.GetChoiceIndex();
        TEUIModelRef<FM_TalentNode> local_50 = this.GetTalentNode();
        TDataObjectPtr<FTalentConfig> local_102;
        local_102.GetConfig(local_77);
        if (!(local_102) || (0 != 1))
        {
            return false;
        }
        if (::FMS_Talent::Get(this.GetContext().Manager).GetAvatarEquippedTalentInfo(local_135, local_134))
        {
            TEUIModelRef<FM_TalentNode> local_50_2 = this.GetTalentNode();
            return (GetDataId() == int(local_134.FoundationId));
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
    int GetConditionDataId(const TDataObjectPtr<FServerConditionConfigBase> &inout Cond) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    void CreateAchievedCondIdList()
    {
        bool local_1;
        int local_8 = 0;
        bool local_100;
        TEUIModelRef<FVM_TitleAndDescAndStatus> local_128;
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
            local_100 = true;
            for (auto& local_114 : local_98)
            {
                if (local_114.IsValid() && (int(GetStateType()) != 3))
                {
                    local_100 = false;
                    break;
                }
            }
            FText local_122;
            TEUIModelRef<FVM_TitleAndDescAndStatus> local_118 = TEUIModelRef<FVM_TitleAndDescAndStatus>(::FVM_TitleAndDescAndStatus::Create(this.GetContext().Manager, NSLOCTEXT("Talent", "TalentPrereqNodeUnlock", "е‰ЌзЅ®иЉ‚з‚№йњЂи§Јй”Ѓ"), local_122));
            local_100.SetbDone();
            this.GetModify_AchievedCondIdList().Add(local_118);
            if (!(local_100))
            {
                this.SetbAllCondAchieved(false);
            }
        }
        if (0 > 0)
        {
            int local_129;
            local_129 = ::FM_LocalPlayerLevel::Get(this.GetContext().Manager).GetLevel();
            local_1 = (local_129 >= 0);
            FText local_122;
            NSLOCTEXT("Talent", "UpgradeUnlockLevel", "зЋ©е®¶з­‰зє§иѕѕе€°{0}");
            FText local_134;
            local_128 = TEUIModelRef<FVM_TitleAndDescAndStatus>(::FVM_TitleAndDescAndStatus::Create(this.GetContext().Manager, local_134, local_122));
            TEUIModelRef<FVM_TitleAndDescAndStatus> local_118_2 = local_128;
            local_1.SetbDone();
            this.GetModify_AchievedCondIdList().Add(local_118_2);
            local_100 = !(local_1);
            if (local_100)
            {
                this.SetbAllCondAchieved(false);
            }
        }
        for (auto& local_148 : GetUnlockCondition())
        {
            if (!(local_148))
            {
                continue;
            }
            local_100 = local_8.GetAchievedCondIdList().Contains(this.GetConditionDataId(local_148)) || local_8.GetUnlockableTalentIds().Contains(local_60.opArrow().DataId);
            TEUIModelRef<FVM_TitleAndDescAndStatus> local_118_3 = local_128;
            local_100.SetbDone();
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
        TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
        FMsg_TalentNodeHoverOpenDetails local_6;
        TEUIModelWeakRef<FM_TalentNode> local_14;
        local_6.TalentNode = local_14;
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
        TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
        FMsg_TalentSetEquipChoiceTalent local_6;
        TEUIModelWeakRef<FM_TalentNode> local_14;
        local_6.TalentNode = local_14;
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
FVM_TalentNodeHover CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_TalentNode> &inout TalentNode, const int ChoiceIndex)
{
    FVM_TalentNodeHover __r;
    TEUIModelRef<FVM_TalentNodeHover> local_6 = TEUIModelRef<FVM_TalentNodeHover>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TalentNodeHover::ModelId, 0, TalentNode, ChoiceIndex));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
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
    UScriptStruct local_2;
    return local_2;
}
}

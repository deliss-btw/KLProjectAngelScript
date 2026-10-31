enum ETalentNodeStateType
{
    Hide,
    Lock,
    Unlock,
    Normal,
}

enum ETalentTreeBranchType
{
    Main = 1,
    Right,
    Left,
}

namespace FM_TalentNode
{
    const int ModelId = 0;
}
namespace FM_TalentTree
{
    const int ModelId = 0;
}
namespace FMS_Talent
{
    const int ModelId = 0;

}
struct FM_TalentNode : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    uint m_DataId;
    UPROPERTY()
    uint m_TreeId;
    UPROPERTY()
    FTalentTreeNode m_Config;
    UPROPERTY()
    ETalentNodeStateType m_StateType;
    UPROPERTY()
    TArray<uint> m_AllTalentIds;
    UPROPERTY()
    TArray<uint> m_ChoiceBaseIds;
    UPROPERTY()
    uint m_ActiveLevel;
    UPROPERTY()
    uint m_EquipRevision;
    UPROPERTY()
    bool m_bHasMainChild;
    UPROPERTY()
    TArray<uint> m_AchievedCondIdList;
    UPROPERTY()
    TArray<uint> m_UnlockableTalentIds;

    FM_TalentNode()
    {
        this.m_DataId = 0;
        this.m_TreeId = 0;
        this.m_StateType = ETalentNodeStateType(1);
        this.m_ActiveLevel = 0;
        this.m_EquipRevision = 0;
        this.m_bHasMainChild = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FM_TalentNode' by default constructor.");
        return;
    }
    FM_TalentNode(const FM_TalentNode &inout Other)
    {
        this.m_DataId = 0;
        this.m_TreeId = 0;
        this.m_StateType = ETalentNodeStateType(1);
        this.m_ActiveLevel = 0;
        this.m_EquipRevision = 0;
        this.m_bHasMainChild = false;
        this.m_DataId = int(Other.m_DataId);
        this.m_TreeId = int(Other.m_TreeId);
        this.m_StateType = Other.m_StateType;
        this.m_AllTalentIds = Other.m_AllTalentIds;
        this.m_ChoiceBaseIds = Other.m_ChoiceBaseIds;
        this.m_ActiveLevel = int(Other.m_ActiveLevel);
        this.m_EquipRevision = int(Other.m_EquipRevision);
        this.m_bHasMainChild = Other.m_bHasMainChild;
        this.m_AchievedCondIdList = Other.m_AchievedCondIdList;
        this.m_UnlockableTalentIds = Other.m_UnlockableTalentIds;
        return;
    }
    FM_TalentNode(const uint InTreeId, const FTalentTreeNode &inout InConfig, const ETalentNodeStateType InStateType)
    {
        this.m_DataId = 0;
        this.m_TreeId = 0;
        this.m_StateType = ETalentNodeStateType(1);
        this.m_ActiveLevel = 0;
        this.m_EquipRevision = 0;
        this.m_bHasMainChild = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTreeId(InTreeId);
        this.SetConfig(InConfig);
        this.SetStateType(ETalentNodeStateType(InStateType));
        return;
    }
    FM_TalentNode& opAssign(const FM_TalentNode &inout Other)
    {
        this.m_DataId = int(Other.m_DataId);
        this.m_TreeId = int(Other.m_TreeId);
        this.m_StateType = Other.m_StateType;
        this.m_AllTalentIds = Other.m_AllTalentIds;
        this.m_ChoiceBaseIds = Other.m_ChoiceBaseIds;
        this.m_ActiveLevel = int(Other.m_ActiveLevel);
        this.m_EquipRevision = int(Other.m_EquipRevision);
        this.m_bHasMainChild = Other.m_bHasMainChild;
        this.m_AchievedCondIdList = Other.m_AchievedCondIdList;
        return Other.m_UnlockableTalentIds;
    }
    bool HasChoice() const
    {
        return (this.GetChoiceBaseIds().Num() > 1);
    }
    void PostConstruct()
    {
        int local_2;
        if (this.GetConfig().NodeConfig)
        {
            local_2 = this.GetConfig().NodeConfig.opArrow().DataId;
        }
        else
        {
            local_2 = 0;
        }
        this.SetDataId(local_2);
        return;
    }
    TDataObjectPtr<FTalentConfig> GetNodeConfig(const int ChoiceIndex) const
    {
        if (this.GetChoiceBaseIds().IsValidIndex(ChoiceIndex))
        {
            int local_27 = this.GetChoiceBaseIds()[ChoiceIndex];
            GetDataObjectByGSDataId<FTalentConfig> local_26;
            return local_26.opImplConv();
        }
        return this.GetConfig().NodeConfig;
    }
    bool CheckValid()
    {
        bool local_4;
        if (!(this.GetConfig().NodeConfig))
        {
            local_4 = false;
        }
        else
        {
            int local_1 = this.GetConfig().NodeConfig.opArrow().DataId;
            local_4 = (local_1 != 0);
        }
        return local_4;
    }
    bool IsFoundationNode() const
    {
        return (int(this.GetTalentType()) == 1);
    }
    bool IsEquippedChoice(const int ChoiceIndex) const
    {
        FAvatarEquippedTalentInfo local_84;
        int local_87;
        if (!(this.HasChoice()) || (int(this.GetStateType()) != 3))
        {
            return false;
        }
        TDataObjectPtr<FAvatarMappingConfig> local_54 = this.GetAvatarMappingConfig();
        if (!(local_54))
        {
            return false;
        }
        if (!(::FMS_Talent::Get(this.GetContext().Manager).GetAvatarEquippedTalentInfo(local_54.Get().DataId, local_84)))
        {
            return false;
        }
        if (this.GetChoiceBaseIds().IsValidIndex(ChoiceIndex))
        {
            local_87 = this.GetChoiceBaseIds()[ChoiceIndex];
        }
        else
        {
            local_87 = this.GetDataId();
        }
        if (local_84.ChooseIds.Contains(local_87))
        {
            return true;
        }
        return false;
    }
    int GetActiveChoiceIndex() const
    {
        FAvatarEquippedTalentInfo local_84;
        if (!(this.HasChoice()) || (int(this.GetStateType()) != 3))
        {
            return 0;
        }
        TDataObjectPtr<FAvatarMappingConfig> local_54 = this.GetAvatarMappingConfig();
        if (!(local_54))
        {
            return 0;
        }
        if (!(::FMS_Talent::Get(this.GetContext().Manager).GetAvatarEquippedTalentInfo(local_54.Get().DataId, local_84)))
        {
            return 0;
        }
        if (this.GetChoiceBaseIds().Num() == 1)
        {
            return 0;
        }
        if (this.GetChoiceBaseIds().Num() > 0)
        {
            int local_86 = 0;
            for (; local_86 < this.GetChoiceBaseIds().Num(); ++local_86)
            {
                if (local_84.ChooseIds.Contains(this.GetChoiceBaseIds()[local_86]))
                {
                    return local_86;
                }
            }
        }
        return 0;
    }
    bool IsUnequippedChoice(const int ChoiceIndex) const
    {
        return this.HasChoice() && (int(this.GetStateType()) == 3) && !(this.IsEquippedChoice(ChoiceIndex));
    }
    TDataObjectPtr<FTalentConfig> GetConfig(const int InChoiceIndex) const
    {
        if (this.GetChoiceBaseIds().IsValidIndex(InChoiceIndex))
        {
            int local_27 = this.GetChoiceBaseIds()[InChoiceIndex];
            GetDataObjectByGSDataId<FTalentConfig> local_26;
            return local_26.opImplConv();
        }
        return this.GetConfig().NodeConfig;
    }
    TDataObjectPtr<FAvatarMappingConfig> GetAvatarMappingConfig() const
    {
        TDataObjectPtr<FAvatarMappingConfig> local_50;
        if (this.GetConfig().NodeConfig)
        {
            local_50 = this.GetConfig().NodeConfig.opArrow().GetAvatar();
        }
        else
        {
            local_50 = TDataObjectPtr<FAvatarMappingConfig>();
        }
        return local_50;
    }
    ETalentType GetTalentType() const
    {
        ETalentType local_2;
        if (this.GetConfig().NodeConfig)
        {
            local_2 = this.GetConfig().NodeConfig.opArrow().TalentType;
        }
        else
        {
            local_2 = ETalentType::None;
        }
        return local_2;
    }
    FText GetNodeName(const int InChoiceIndex = 0) const
    {
        TDataObjectPtr<FTalentConfig> local_48 = this.GetConfig(InChoiceIndex);
        FText local_58;
        if (local_48)
        {
            local_58 = local_48.Get().TalentName;
        }
        else
        {
            local_58 = FText();
        }
        return local_58;
    }
    FText GetNodeDesc(const int InChoiceIndex = 0) const
    {
        TDataObjectPtr<FTalentConfig> local_48 = this.GetConfig(InChoiceIndex);
        FText local_58;
        if (local_48)
        {
            local_58 = local_48.Get().TalentDesc;
        }
        else
        {
            local_58 = FText();
        }
        return local_58;
    }
    FSoftBrush GetNodeIcon(const int InChoiceIndex = 0) const
    {
        TDataObjectPtr<FTalentConfig> local_48 = this.GetConfig(InChoiceIndex);
        FSoftBrush local_140;
        if (local_48)
        {
            local_140 = local_48.Get().Icon;
        }
        else
        {
            local_140 = FSoftBrush();
        }
        return local_140;
    }
    uint GetActiveChoiceBaseId() const
    {
        int local_4;
        if (this.GetChoiceBaseIds().IsValidIndex(this.GetActiveChoiceIndex()))
        {
            local_4 = this.GetChoiceBaseIds()[this.GetActiveChoiceIndex()];
        }
        else
        {
            local_4 = this.GetDataId();
        }
        return local_4;
    }
    TDataObjectPtr<FSkillInitConfig> GetSkillInitConfig() const
    {
        TDataObjectPtr<FTalentConfig> local_50 = this.FindTalentByChoiceAndLevel(this.GetActiveChoiceIndex(), this.GetActiveLevel());
        if (!(!(local_50)) && local_50.Get().GetSkillConfig())
        {
            return local_50.Get().GetSkillConfig();
        }
        TDataObjectPtr<FSkillInitConfig> local_100;
        if (this.GetConfig().NodeConfig)
        {
            local_100 = this.GetConfig().NodeConfig.opArrow().GetSkillConfig();
        }
        else
        {
            local_100 = TDataObjectPtr<FSkillInitConfig>();
        }
        return local_100;
    }
    ESkillType GetEffectiveSkillType() const
    {
        TDataObjectPtr<FTalentConfig> local_50 = this.FindTalentByChoiceAndLevel(this.GetActiveChoiceIndex(), this.GetActiveLevel());
        if (local_50)
        {
            if (int(local_50.Get().TalentSkillType) != 0)
            {
                return ESkillType(local_50.Get().TalentSkillType);
            }
            if (local_50.Get().GetSkillConfig())
            {
                return ESkillType(local_50.Get().GetSkillConfig().Get().SkillType);
            }
        }
        if (this.GetConfig().NodeConfig)
        {
            if (int(this.GetConfig().NodeConfig.opArrow().TalentSkillType) != 0)
            {
                return ESkillType(this.GetConfig().NodeConfig.opArrow().TalentSkillType);
            }
            if (this.GetConfig().NodeConfig.opArrow().GetSkillConfig())
            {
                return ESkillType(this.GetConfig().NodeConfig.opArrow().GetSkillConfig().Get().SkillType);
            }
        }
        return ESkillType(0);
    }
    bool CanUnlock() const
    {
        return (this.GetCurrentLevel()) == 0 && (int(this.GetStateType()) == 2);
    }
    bool CanUpgrade(const bool bCheckCost) const
    {
        int local_2 = this.GetCurrentLevel();
        if (local_2 >= this.GetMaxLevel())
        {
            return false;
        }
        TDataObjectPtr<FTalentConfig> local_54 = this.FindTalentByChoiceAndLevel(this.GetActiveChoiceIndex(), local_2 + 1);
        if (!(local_54) || !(this.GetUnlockableTalentIds().Contains(local_54.Get().DataId)))
        {
            return false;
        }
        if (bCheckCost)
        {
            for (auto& local_70 : local_54.Get().UnlockCost)
            {
                if (!(local_70.Item))
                {
                    continue;
                }
                if (::FMS_PlayerInventory::Get(this.GetContext().Manager).GetTotalItemNum(local_70.Item) < int(local_70.Count))
                {
                    return false;
                }
            }
        }
        return true;
    }
    uint GetCurrentLevel() const
    {
        if ((int(this.GetStateType())) != 3)
        {
            return 0;
        }
        return this.GetActiveLevel();
    }
    uint GetMaxLevel() const
    {
        int local_1 = 0;
        auto local_8 = this.GetAllTalentIds().Iterator();
        for (; local_8.CanProceed;)
        {
            int local_2 = local_8.Proceed();
            GetDataObjectByGSDataId<FTalentConfig> local_64;
            TDataObjectPtr<FTalentConfig> local_40 = local_64.opImplConv();
            if (local_40 && ((local_40.Get().TalentLevel > local_1)))
            {
                local_1 = local_40.Get().TalentLevel;
            }
        }
        return local_1;
    }
    int FindChoiceIndexByTalentId(const uint TalentId) const
    {
        int local_100;
        GetDataObjectByGSDataId<FTalentConfig> local_48;
        TDataObjectPtr<FTalentConfig> local_24 = local_48.opImplConv();
        if (!(local_24))
        {
            return 0;
        }
        if (local_24.Get().GetBaseTalent())
        {
            int local_101 = local_24.Get().GetBaseTalent().Get().DataId;
            local_100 = local_101;
        }
        else
        {
            local_100 = TalentId;
        }
        int local_102 = 0;
        for (; local_102 < this.GetChoiceBaseIds().Num(); ++local_102)
        {
            if (this.GetChoiceBaseIds()[local_102] == local_100 || (this.GetChoiceBaseIds()[local_102] == TalentId))
            {
                return local_102;
            }
        }
        return 0;
    }
    TDataObjectPtr<FTalentConfig> FindTalentByChoiceAndLevel(const int InChoiceIndex, const uint InLevel) const
    {
        int local_3;
        int local_4;
        if (this.GetChoiceBaseIds().IsValidIndex(InChoiceIndex))
        {
            local_4 = this.GetChoiceBaseIds()[InChoiceIndex];
        }
        else
        {
            local_4 = this.GetDataId();
        }
        for (auto local_19 : this.GetAllTalentIds())
        {
            GetDataObjectByGSDataId<FTalentConfig> local_68;
            TDataObjectPtr<FTalentConfig> local_44 = local_68.opImplConv();
            if (!(local_44))
            {
                continue;
            }
            if (local_44.Get().GetBaseTalent())
            {
                local_3 = local_44.Get().GetBaseTalent().Get().DataId;
            }
            else
            {
                local_3 = local_19;
            }
            if (local_3 == local_4)
            {
                if (InLevel == 0)
                {
                    return local_44;
                }
                if (local_44.Get().TalentLevel == InLevel)
                {
                    return local_44;
                }
            }
        }
        return TDataObjectPtr<FTalentConfig>();
    }
    TDataObjectPtr<FTalentConfig> GetActiveDoubleFormConfig() const
    {
        TDataObjectPtr<FTalentConfig> local_50 = this.FindTalentByChoiceAndLevel(this.GetActiveChoiceIndex(), this.GetActiveLevel());
        if (!(!(local_50)) && local_50.Get().GetDoubleFormTalent())
        {
            return local_50.Get().GetDoubleFormTalent();
        }
        return TDataObjectPtr<FTalentConfig>();
    }
    uint GetDataId() const property
    {
        this.TrackPropertyRead(0);
        return this.m_DataId;
    }
    void SetDataId(const uint __Value) property
    {
        if (this.m_DataId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_DataId = __Value;
        return;
    }
    uint GetTreeId() const property
    {
        this.TrackPropertyRead(1);
        return this.m_TreeId;
    }
    void SetTreeId(const uint __Value) property
    {
        if (this.m_TreeId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TreeId = __Value;
        return;
    }
    FTalentTreeNode GetConfig() const property
    {
        FTalentTreeNode __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FTalentTreeNode GetModify_Config() property
    {
        FTalentTreeNode __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetConfig(const FTalentTreeNode &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        return;
    }
    ETalentNodeStateType GetStateType() const property
    {
        this.TrackPropertyRead(3);
        return this.m_StateType;
    }
    void SetStateType(const ETalentNodeStateType __Value) property
    {
        if (int(this.m_StateType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_StateType = __Value;
        return;
    }
    const TArray<uint> GetAllTalentIds() const property
    {
        const TArray<uint> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<uint> GetModify_AllTalentIds() property
    {
        TArray<uint> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetAllTalentIds(const TArray<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_AllTalentIds = __Value;
        return;
    }
    const TArray<uint> GetChoiceBaseIds() const property
    {
        const TArray<uint> __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    TArray<uint> GetModify_ChoiceBaseIds() property
    {
        TArray<uint> __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetChoiceBaseIds(const TArray<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_ChoiceBaseIds = __Value;
        return;
    }
    uint GetActiveLevel() const property
    {
        this.TrackPropertyRead(6);
        return this.m_ActiveLevel;
    }
    void SetActiveLevel(const uint __Value) property
    {
        if (this.m_ActiveLevel == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_ActiveLevel = __Value;
        return;
    }
    uint GetEquipRevision() const property
    {
        this.TrackPropertyRead(7);
        return this.m_EquipRevision;
    }
    void SetEquipRevision(const uint __Value) property
    {
        if (this.m_EquipRevision == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_EquipRevision = __Value;
        return;
    }
    bool GetbHasMainChild() const property
    {
        this.TrackPropertyRead(8);
        return this.m_bHasMainChild;
    }
    void SetbHasMainChild(const bool __Value) property
    {
        if (!(this.m_bHasMainChild) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_bHasMainChild = __Value;
        return;
    }
    const TArray<uint> GetAchievedCondIdList() const property
    {
        const TArray<uint> __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    TArray<uint> GetModify_AchievedCondIdList() property
    {
        TArray<uint> __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetAchievedCondIdList(const TArray<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_AchievedCondIdList = __Value;
        return;
    }
    const TArray<uint> GetUnlockableTalentIds() const property
    {
        const TArray<uint> __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    TArray<uint> GetModify_UnlockableTalentIds() property
    {
        TArray<uint> __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetUnlockableTalentIds(const TArray<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_UnlockableTalentIds = __Value;
        return;
    }
}

struct FM_TalentTree : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    uint m_TreeId;
    UPROPERTY()
    bool m_bValid;
    UPROPERTY()
    TDataObjectPtr<FTalentLayoutTreeConfig> m_LayoutConfig;
    UPROPERTY()
    TArray<TEUIModelWeakRef<FM_TalentNode>> m_NodeList;
    UPROPERTY()
    ETalentTreeBranchType m_BranchType;

    FM_TalentTree()
    {
        this.m_TreeId = 0;
        this.m_BranchType = ETalentTreeBranchType(0);
        this.m_bValid = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FM_TalentTree' by default constructor.");
        return;
    }
    FM_TalentTree(const FM_TalentTree &inout Other)
    {
        this.m_TreeId = 0;
        this.m_BranchType = ETalentTreeBranchType(0);
        this.m_bValid = false;
        this.m_TreeId = int(Other.m_TreeId);
        this.m_bValid = Other.m_bValid;
        this.m_LayoutConfig = Other.m_LayoutConfig;
        this.m_NodeList = Other.m_NodeList;
        this.m_BranchType = Other.m_BranchType;
        return;
    }
    FM_TalentTree(const uint InTreeId)
    {
        this.m_TreeId = 0;
        this.m_BranchType = ETalentTreeBranchType(0);
        this.m_bValid = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTreeId(InTreeId);
        return;
    }
    FM_TalentTree opAssign(const FM_TalentTree &inout Other)
    {
        FM_TalentTree __r;
        this.m_TreeId = int(Other.m_TreeId);
        this.m_bValid = Other.m_bValid;
        this.m_LayoutConfig = Other.m_LayoutConfig;
        this.m_NodeList = Other.m_NodeList;
        this.m_BranchType = Other.m_BranchType;
        return __r;
    }
    void PostConstruct()
    {
        return;
    }
    bool IsFoundationTreeAnyTalentNormal() const
    {
        for (auto& local_16 : this.GetNodeList())
        {
            if ((int(local_16.Get().GetStateType())) == 3)
            {
                return true;
            }
        }
        return false;
    }
    bool IsFoundationTreeAnyTalentUnlocked() const
    {
        for (auto& local_16 : this.GetNodeList())
        {
            if ((int(local_16.Get().GetStateType())) == 2)
            {
                return true;
            }
        }
        return false;
    }
    bool CheckValid() const
    {
        return this.GetbValid();
    }
    void UpdateValid(const bool bTreeValid)
    {
        this.SetbValid(bTreeValid);
        return;
    }
    uint GetTreeId() const property
    {
        this.TrackPropertyRead(0);
        return this.m_TreeId;
    }
    void SetTreeId(const uint __Value) property
    {
        if (this.m_TreeId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TreeId = __Value;
        return;
    }
    bool GetbValid() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bValid;
    }
    void SetbValid(const bool __Value) property
    {
        if (!(this.m_bValid) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bValid = __Value;
        return;
    }
    const TDataObjectPtr<FTalentLayoutTreeConfig> GetLayoutConfig() const property
    {
        const TDataObjectPtr<FTalentLayoutTreeConfig> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TDataObjectPtr<FTalentLayoutTreeConfig> GetModify_LayoutConfig() property
    {
        TDataObjectPtr<FTalentLayoutTreeConfig> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetLayoutConfig(const TDataObjectPtr<FTalentLayoutTreeConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_LayoutConfig = __Value;
        return;
    }
    const TArray<TEUIModelWeakRef<FM_TalentNode>> GetNodeList() const property
    {
        const TArray<TEUIModelWeakRef<FM_TalentNode>> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<TEUIModelWeakRef<FM_TalentNode>> GetModify_NodeList() property
    {
        TArray<TEUIModelWeakRef<FM_TalentNode>> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetNodeList(const TArray<TEUIModelWeakRef<FM_TalentNode>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_NodeList = __Value;
        return;
    }
    ETalentTreeBranchType GetBranchType() const property
    {
        this.TrackPropertyRead(4);
        return this.m_BranchType;
    }
    void SetBranchType(const ETalentTreeBranchType __Value) property
    {
        if (int(this.m_BranchType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_BranchType = __Value;
        return;
    }
}

struct FAvatarEquippedTalentInfo
{
    UPROPERTY()
    uint AvatarMappingId = 0;
    UPROPERTY()
    TMap<uint, uint> SlotToTalentId;
    UPROPERTY()
    uint FoundationId = 0;
    UPROPERTY()
    TArray<uint> ChooseIds;

}

struct FAvatarUnlockTalentInfo
{
    UPROPERTY()
    TArray<uint> UnlockTalentIds;

    FAvatarUnlockTalentInfo()
    {
        return;
    }
}

struct FMS_Talent : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TMap<uint, TEUIModelRef<FM_TalentNode>> m_TalentNodeMap;
    UPROPERTY()
    TMap<uint, TEUIModelRef<FM_TalentTree>> m_TalentTreeMap;
    UPROPERTY()
    TMap<uint, uint> m_TalentIdToNodeMap;
    UPROPERTY()
    TMap<uint, FAvatarEquippedTalentInfo> m_AvatarMappingEquippedTalentMap;
    UPROPERTY()
    TMap<uint, FAvatarUnlockTalentInfo> m_AvatarNewUnlockTalent;
    UPROPERTY()
    uint m_CachedSpecialtyID;

    FMS_Talent()
    {
        this.m_CachedSpecialtyID = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_Talent(const FMS_Talent &inout Other)
    {
        this.m_CachedSpecialtyID = 0;
        this.m_TalentNodeMap = Other.m_TalentNodeMap;
        this.m_TalentTreeMap = Other.m_TalentTreeMap;
        this.m_TalentIdToNodeMap = Other.m_TalentIdToNodeMap;
        this.m_AvatarMappingEquippedTalentMap = Other.m_AvatarMappingEquippedTalentMap;
        this.m_AvatarNewUnlockTalent = Other.m_AvatarNewUnlockTalent;
        this.m_CachedSpecialtyID = int(Other.m_CachedSpecialtyID);
        return;
    }
    FMS_Talent opAssign(const FMS_Talent &inout Other)
    {
        FMS_Talent __r;
        this.m_TalentNodeMap = Other.m_TalentNodeMap;
        this.m_TalentTreeMap = Other.m_TalentTreeMap;
        this.m_TalentIdToNodeMap = Other.m_TalentIdToNodeMap;
        this.m_AvatarMappingEquippedTalentMap = Other.m_AvatarMappingEquippedTalentMap;
        this.m_AvatarNewUnlockTalent = Other.m_AvatarNewUnlockTalent;
        this.m_CachedSpecialtyID = int(Other.m_CachedSpecialtyID);
        return __r;
    }
    void PostConstruct()
    {
        this.DebugFillTestData();
        return;
    }
    uint GetAvatarMappingIdByAvatarId(const uint AvatarId) const
    {
        TDataObjectPtr<FAvatarMappingConfig> local_26 = ::UAvatarMappingSettings::Get().GetMappingConfigOfAvatar(AvatarId);
        if (local_26)
        {
            return local_26.Get().DataId;
        }
        return 0;
    }
    TEUIModelRef<FM_TalentNode> GetFoundationNodeByAvatarID(const uint AvatarID)
    {
        int local_2 = this.GetAvatarMappingIdByAvatarId(AvatarID);
        if (this.GetAvatarMappingEquippedTalentMap().Contains(local_2))
        {
            return TEUIModelRef<FM_TalentNode>(this.GetNode(this.GetAvatarMappingEquippedTalentMap()[local_2].FoundationId).Get());
        }
        return TEUIModelRef<FM_TalentNode>();
    }
    void DebugFillTestData()
    {
        // body not fully recovered — stub [opcode-uncovered]
    }
    void RegisterTalentToNode(const uint TalentId, const uint NodePrimaryId)
    {
        if (this.GetTalentIdToNodeMap().Contains(TalentId))
        {
            return;
        }
        this.GetModify_TalentIdToNodeMap().Add(TalentId, NodePrimaryId);
        if (this.GetTalentNodeMap().Contains(NodePrimaryId))
        {
            this.GetModify_TalentNodeMap()[NodePrimaryId].Get().GetModify_AllTalentIds().Add(TalentId);
        }
        return;
    }
    void CreateAndAddNode(FM_TalentTree &inout TreeM, const TArray<FTalentTreeNode> &inout NodeArray, const ETalentNodeStateType StateType)
    {
        int local_1 = 0;
        for (; local_1 < NodeArray.Num(); ++local_1)
        {
            TDataObjectPtr<FTalentConfig> local_28 = NodeArray[local_1].NodeConfig;
            if (local_28)
            {
                int local_53;
                int local_54 = local_28.Get().DataId;
                local_53 = local_54;
                if (this.GetTalentIdToNodeMap().Contains(local_53))
                {
                    XLog(ELog(68), FString().Append("[M_Talent] CreateAndAddNode: Skip duplicate TalentId=").Append(local_53).Append(", already registered (possibly as ChooseTalent of another node)"));
                    continue;
                }
                FM_TalentNode& local_62 = ::FM_TalentNode::Create(this.GetContext().Manager, TreeM.GetTreeId(), NodeArray[local_1], ETalentNodeStateType(StateType));
                this.GetModify_TalentNodeMap().Add(local_53, TEUIModelRef<FM_TalentNode>(local_62));
                this.RegisterTalentToNode(local_53, local_53);
                local_62.GetModify_ChoiceBaseIds().Add(local_53);
                if (local_28.Get().GetDoubleFormTalent())
                {
                    local_54 = local_28.Get().GetDoubleFormTalent().Get().DataId;
                    this.RegisterTalentToNode(local_54, local_53);
                }
                if (local_28.Get().GetChooseTalent())
                {
                    int local_65;
                    local_54 = local_28.Get().GetChooseTalent().Get().DataId;
                    local_65 = local_54;
                    this.RegisterTalentToNode(local_65, local_53);
                    local_62.GetModify_ChoiceBaseIds().Add(local_65);
                    if (local_28.Get().GetChooseTalent().Get().GetDoubleFormTalent())
                    {
                        local_54 = local_28.Get().GetChooseTalent().Get().GetDoubleFormTalent().Get().DataId;
                        this.RegisterTalentToNode(local_54, local_53);
                    }
                }
                TreeM.GetModify_NodeList().Add(TEUIModelWeakRef<FM_TalentNode>(local_62));
            }
        }
        return;
    }
    void RefreshNodeByTalentId(const uint TalentId, const ETalentNodeStateType NewState, const bool bAllowGenerateNewTalentRedDot = false)
    {
        int local_3;
        if (this.GetTalentIdToNodeMap().Contains(TalentId))
        {
            int local_2;
            local_2 = this.GetTalentIdToNodeMap()[TalentId];
            if (this.GetTalentNodeMap().Contains(local_2))
            {
                FM_TalentNode& local_6 = this.GetModify_TalentNodeMap()[local_2].Get();
                GetDataObjectByGSDataId<FTalentConfig> local_54;
                TDataObjectPtr<FTalentConfig> local_30 = local_54.opImplConv();
                if (local_30)
                {
                    local_3 = local_30.Get().TalentLevel;
                }
                else
                {
                    local_3 = 0;
                }
                if (local_3 == 1 || (local_3 == 0))
                {
                    local_6.SetStateType(ETalentNodeStateType(NewState));
                }
                if (int(NewState) == 2)
                {
                    bool local_108;
                    bool local_1;
                    local_1 = !(local_6.GetUnlockableTalentIds().Contains(TalentId));
                    local_108 = local_6.GetModify_UnlockableTalentIds().Add(TalentId);
                    local_108 = local_3 == 1 || (local_3 == 0);
                    if (this.HasTalentSystemUnlock())
                    {
                        bool local_105 = this.IsMappingReachable(local_6.GetAvatarMappingConfig(), this.GetCurrentPlayerSpecialtyID());
                        if ((((local_105 && bAllowGenerateNewTalentRedDot) && local_1) && local_108))
                        {
                            TArray<uint64> local_138;
                            local_138.Add(local_6.GetDataId());
                            ::FMS_RedDotSystem::Get(this.GetContext().Manager).GenerateRedDot(ERedPointEvent(17), local_138);
                        }
                        this.RefreshNodeActionableRedDot(local_6.GetDataId());
                    }
                    return;
                }
                if (int(NewState) == 3)
                {
                    local_6.GetModify_UnlockableTalentIds().Remove(TalentId);
                    if (local_3 > local_6.GetActiveLevel())
                    {
                        local_6.SetActiveLevel(local_3);
                    }
                }
            }
        }
        return;
    }
    void GenerateNewTalentSourceRedDotByTalentId(const uint TalentId)
    {
        if (!(this.HasTalentSystemUnlock()))
        {
            return;
        }
        if (!(this.GetTalentIdToNodeMap().Contains(TalentId)))
        {
            return;
        }
        GetDataObjectByGSDataId<FTalentConfig> local_50;
        TDataObjectPtr<FTalentConfig> local_26 = local_50.opImplConv();
        if (local_26 && (int(local_26.Get().UnlockType) == 3))
        {
            return;
        }
        int local_103 = this.GetTalentIdToNodeMap()[TalentId];
        if (!(this.GetTalentNodeMap().Contains(local_103)))
        {
            return;
        }
        FM_TalentNode& local_106 = this.GetModify_TalentNodeMap()[local_103].Get();
        if (int(local_106.GetTalentType()) != 4 && (int(local_106.GetTalentType()) != 1))
        {
            return;
        }
        if (!(this.IsMappingReachable(local_106.GetAvatarMappingConfig(), this.GetCurrentPlayerSpecialtyID())))
        {
            return;
        }
        TArray<uint64> local_136;
        local_136.Add(local_106.GetDataId());
        ::FMS_RedDotSystem::Get(this.GetContext().Manager).GenerateRedDot(ERedPointEvent(7), local_136);
        return;
    }
    bool HasTalentSystemUnlock() const
    {
        return ::FMS_SystemControl::Get(this.GetContext().Manager).IsSystemUnlock(ESystemModule(4), false);
    }
    uint GetCurrentPlayerSpecialtyID() const
    {
        TEUIModelRef<FM_Player> local_6 = ::FMS_PlayerData::Get(this.GetManager()).GetLocalPlayerData();
        if (local_6.IsValid())
        {
            return local_6.Get().GetPlayerSpecialtyID();
        }
        return 0;
    }
    bool IsMappingReachable(const TDataObjectPtr<FAvatarMappingConfig> &inout MappingCfg, const uint PlayerSpecialtyID) const
    {
        if (!(MappingCfg))
        {
            return false;
        }
        TEUIModelRef<FMS_PlayerAvatarData> local_4 = TEUIModelRef<FMS_PlayerAvatarData>(::FMS_PlayerAvatarData::Get(this.GetManager()));
        for (auto& local_22 : MappingCfg.Get().GetAvatar())
        {
            if (!(local_22))
            {
                continue;
            }
            bool local_1 = !(local_4.Get().IsAvatarUnlocked(local_22));
            if (local_1)
            {
                continue;
            }
            if (PlayerSpecialtyID == 0)
            {
                local_1 = false;
            }
            else
            {
                local_1 = local_22.Get().bIsMainPlayer;
            }
            local_1 = local_1 && (local_22.Get().DataId != PlayerSpecialtyID);
            if (local_1)
            {
                continue;
            }
            return true;
        }
        return false;
    }
    void RefreshNodeActionableRedDot(const uint NodeDataId)
    {
        FMS_RedDotSystem& local_2 = ::FMS_RedDotSystem::Get(this.GetContext().Manager);
        bool local_7 = local_2.HasRedDot(GameplayTags::RedDotSystem_Talent_NewTalent, NodeDataId) || local_2.HasRedDot(GameplayTags::RedDotSystem_Talent_CanUpgrade, NodeDataId);
        int64 local_6 = NodeDataId;
        bool local_3 = local_2.HasRedDot(GameplayTags::RedDotSystem_Talent_NodeRedDot, local_6);
        if ((local_7 && !(local_3)))
        {
            int64 local_6_2 = NodeDataId;
            local_2.GenerateSpecificRedDot(GameplayTags::RedDotSystem_Talent_NodeRedDot, local_6_2, 1, false);
            return;
        }
        if (!(local_7) && local_3)
        {
            int64 local_6_3 = NodeDataId;
            local_2.ConsumeRedDot(GameplayTags::RedDotSystem_Talent_NodeRedDot, local_6_3);
        }
        return;
    }
    void RefreshAllNodeActionableRedDots()
    {
        for (auto& local_20 : this.GetTalentNodeMap())
        {
            if (!(local_20.GetValue().IsValid()))
            {
                continue;
            }
            TEUIModelRef<FM_TalentNode> local_22 = TEUIModelRef<FM_TalentNode>(local_20.GetValue().Get());
            if (local_22.IsValid())
            {
                this.RefreshNodeActionableRedDot(local_22.opArrow().GetDataId());
            }
        }
        this.RefreshTalentAvatarEntryRedDots();
        return;
    }
    void RefreshTalentAvatarEntryRedDots()
    {
        bool local_23;
        int local_119;
        FMS_RedDotSystem& local_2 = ::FMS_RedDotSystem::Get(this.GetContext().Manager);
        TArray<uint> local_6;
        for (auto& local_26 : this.GetTalentNodeMap())
        {
            if (!(local_26.GetValue().IsValid()))
            {
                continue;
            }
            TEUIModelRef<FM_TalentNode> local_28 = TEUIModelRef<FM_TalentNode>(local_26.GetValue().Get());
            if (!(local_28.IsValid()))
            {
                continue;
            }
            int local_32 = local_28.opArrow().GetDataId();
            local_23 = local_2.HasRedDot(GameplayTags::RedDotSystem_Talent_NewTalent, local_32) || local_2.HasRedDot(GameplayTags::RedDotSystem_Talent_CanUpgrade, local_28.opArrow().GetDataId()) || (local_2.HasRedDot(GameplayTags::RedDotSystem_Avatar_NewTalent, local_28.opArrow().GetDataId()));
            if (local_23)
            {
                TDataObjectPtr<FAvatarMappingConfig> local_60 = local_28.opArrow().GetAvatarMappingConfig();
                if (local_60)
                {
                    local_6.AddUnique(local_60.Get().DataId);
                }
            }
        }
        int local_32_2 = this.GetCurrentPlayerSpecialtyID();
        TDataObjectIterator<FAvatarMappingConfig> local_102;
        for (; local_102; )
        {
            const FAvatarMappingConfig& local_104 = local_102.GetData();
            bool local_31 = local_6.Contains(local_104.DataId);
            for (auto& local_118 : local_104.GetAvatar())
            {
                local_23 = !(local_118);
                if (local_23)
                {
                    continue;
                }
                if (local_32_2 == 0)
                {
                    local_23 = false;
                }
                else
                {
                    local_23 = local_118.Get().bIsMainPlayer;
                }
                local_23 = local_23 && ((local_118.Get().DataId != local_32_2));
                if (local_23)
                {
                    continue;
                }
                local_119 = local_118.Get().DataId;
                int64 local_34 = local_119;
                local_23 = local_2.HasRedDot(GameplayTags::RedDotSystem_Talent_Entrance, local_34);
                if ((local_31 && !(local_23)))
                {
                    local_34 = local_119;
                    local_2.GenerateSpecificRedDot(GameplayTags::RedDotSystem_Talent_Entrance, local_34, 1, false);
                    continue;
                }
                if (!(local_31) && local_23)
                {
                    local_34 = local_119;
                    local_2.ConsumeRedDot(GameplayTags::RedDotSystem_Talent_Entrance, local_34);
                }
            }
            local_102.Next();
        }
        ::FMS_PlayerAvatarData::Get(this.GetContext().Manager).RefreshAvatarListEntryRedDot();
        return;
    }
    void ConsumePerNodeRedDot(const uint NodeDataId)
    {
        int64 local_2 = NodeDataId;
        this.FullyConsumeRedDot(GameplayTags::RedDotSystem_Talent_NewTalent, local_2);
        int64 local_2_2 = NodeDataId;
        this.FullyConsumeRedDot(GameplayTags::RedDotSystem_Talent_CanUpgrade, local_2_2);
        this.RefreshNodeActionableRedDot(NodeDataId);
        this.RefreshTalentAvatarEntryRedDots();
        return;
    }
    void ConsumeAllPerNodeRedDots(const uint AvatarMappingId)
    {
        GetDataObjectByGSDataId<FAvatarMappingConfig> local_48;
        TDataObjectPtr<FAvatarMappingConfig> local_24 = local_48.opImplConv();
        if (!(local_24))
        {
            return;
        }
        FMS_RedDotSystem& local_100 = ::FMS_RedDotSystem::Get(this.GetContext().Manager);
        for (auto& local_118 : this.GetTalentNodeMap())
        {
            if (!(local_118.GetValue().IsValid()))
            {
                continue;
            }
            TEUIModelRef<FM_TalentNode> local_120 = TEUIModelRef<FM_TalentNode>(local_118.GetValue().Get());
            if (local_120.IsValid() && (local_120.opArrow().GetAvatarMappingConfig() == local_24.opImplConv()))
            {
                this.ConsumePerNodeRedDot(local_120.opArrow().GetDataId());
            }
        }
        return;
    }
    void RefreshCanUpgradeRedDot()
    {
        int local_29;
        if (!(this.HasTalentSystemUnlock()))
        {
            return;
        }
        FMS_RedDotSystem& local_4 = ::FMS_RedDotSystem::Get(this.GetContext().Manager);
        int local_6 = this.GetCurrentPlayerSpecialtyID();
        for (auto& local_24 : this.GetTalentNodeMap())
        {
            if (!(local_24.GetValue().IsValid()))
            {
                continue;
            }
            TEUIModelRef<FM_TalentNode> local_26 = TEUIModelRef<FM_TalentNode>(local_24.GetValue().Get());
            if (!(local_26.IsValid()))
            {
                continue;
            }
            local_29 = local_26.opArrow().GetDataId();
            bool local_1 = true;
            if (local_26.opArrow().CanUpgrade(local_1) && !(local_4.HasRedDot(GameplayTags::RedDotSystem_Talent_CanUpgrade, local_29)))
            {
                if (!(this.IsMappingReachable(local_26.opArrow().GetAvatarMappingConfig(), local_6)))
                {
                    continue;
                }
                TArray<uint64> local_60;
                int64 local_32 = local_29;
                local_60.Add(local_32);
                local_4.GenerateRedDot(ERedPointEvent(22), local_60);
            }
            this.RefreshNodeActionableRedDot(local_29);
        }
        this.RefreshTalentAvatarEntryRedDots();
        return;
    }
    uint64 MakeSlotRedDotKey(const uint AvatarConfigId, const ESkillType SkillType) const
    {
        int64 local_2 = (AvatarConfigId << 16) | int(SkillType);
        return local_2;
    }
    void RefreshNewSkillDerivedRedDots()
    {
        bool local_133;
        int local_203;
        bool local_204;
        if (!(this.HasTalentSystemUnlock()))
        {
            return;
        }
        FMS_RedDotSystem& local_4 = ::FMS_RedDotSystem::Get(this.GetContext().Manager);
        TEUIModelRef<FMS_PlayerAvatarData> local_6 = TEUIModelRef<FMS_PlayerAvatarData>(::FMS_PlayerAvatarData::Get(this.GetManager()));
        int local_12 = this.GetCurrentPlayerSpecialtyID();
        TArray<ESkillType> local_16;
        local_16.Add(ESkillType(2));
        local_16.Add(ESkillType(1));
        local_16.Add(ESkillType(3));
        local_16.Add(ESkillType(4));
        local_16.Add(ESkillType(5));
        local_16.Add(ESkillType(6));
        TDataObjectIterator<FAvatarMappingConfig> local_34;
        for (; local_34; )
        {
            const FAvatarMappingConfig& local_36 = local_34.GetData();
            int local_11 = int(local_36.DataId);
            GetDataObjectByGSDataId<FAvatarMappingConfig> local_84;
            TDataObjectPtr<FAvatarMappingConfig> local_60 = local_84.opImplConv();
            local_133 = false;
            TArray<ESkillType> local_138;
            for (auto& local_156 : this.GetTalentNodeMap())
            {
                if (!(local_156.GetValue().IsValid()))
                {
                    continue;
                }
                TEUIModelRef<FM_TalentNode> local_158 = TEUIModelRef<FM_TalentNode>(local_156.GetValue().Get());
                if (!(local_158.IsValid()) || !((local_158.opArrow().GetAvatarMappingConfig() == local_60.opImplConv())))
                {
                    continue;
                }
                if (!(local_4.HasRedDot(GameplayTags::RedDotSystem_Avatar_NewTalent, local_158.opArrow().GetDataId())))
                {
                    continue;
                }
                local_133 = true;
                local_138.AddUnique(local_158.opArrow().GetEffectiveSkillType());
            }
            for (auto& local_202 : local_36.GetAvatar())
            {
                if (!(local_202))
                {
                    continue;
                }
                if (!(local_6.Get().IsAvatarUnlocked(local_202)))
                {
                    continue;
                }
                if (local_202.Get().bIsMainPlayer && ((local_202.Get().DataId != local_12)))
                {
                    continue;
                }
                local_11 = local_202.Get().DataId;
                local_203 = local_11;
                int64 local_188 = local_203;
                bool local_185 = local_4.HasRedDot(GameplayTags::RedDotSystem_Avatar_NewSkillEntry, local_188);
                if (local_133 && !(local_185))
                {
                    local_188 = local_203;
                    local_4.GenerateSpecificRedDot(GameplayTags::RedDotSystem_Avatar_NewSkillEntry, local_188, 1, false);
                }
                else
                {
                    local_204 = !(local_133);
                    if (local_204 && local_185)
                    {
                        local_188 = local_203;
                        local_4.ConsumeRedDot(GameplayTags::RedDotSystem_Avatar_NewSkillEntry, local_188);
                    }
                }
                for (auto local_217 : local_16)
                {
                    local_188 = this.MakeSlotRedDotKey(local_203, ESkillType(local_217));
                    bool local_1 = local_138.Contains(ESkillType(local_217));
                    local_204 = local_4.HasRedDot(GameplayTags::RedDotSystem_Avatar_ReplaceSkillSlot, local_188);
                    if ((local_1 && !(local_204)))
                    {
                        local_4.GenerateSpecificRedDot(GameplayTags::RedDotSystem_Avatar_ReplaceSkillSlot, local_188, 1, false);
                        continue;
                    }
                    if (!(local_1) && local_204)
                    {
                        local_4.ConsumeRedDot(GameplayTags::RedDotSystem_Avatar_ReplaceSkillSlot, local_188);
                    }
                }
            }
            local_34.Next();
        }
        this.RefreshTalentAvatarEntryRedDots();
        return;
    }
    void ConsumeNewSkillRedDot(const uint NodeDataId)
    {
        int64 local_2 = NodeDataId;
        ::FMS_RedDotSystem::Get(this.GetContext().Manager).ConsumeRedDot(GameplayTags::RedDotSystem_Avatar_NewTalent, local_2);
        this.RefreshNewSkillDerivedRedDots();
        return;
    }
    void FullyConsumeRedDot(const FGameplayTag &inout Tag, const uint64 Key)
    {
        FMS_RedDotSystem& local_2 = ::FMS_RedDotSystem::Get(this.GetContext().Manager);
        int local_3 = 0;
        while (local_2.HasRedDot(Tag, Key) && (local_3 < 64))
        {
            local_2.ConsumeRedDot(Tag, Key);
            ++local_3;
        }
        return;
    }
    void CleanupUnreachableMainPlayerRedDots()
    {
        int local_55;
        int local_2 = this.GetCurrentPlayerSpecialtyID();
        if (local_2 == 0)
        {
            return;
        }
        FMS_RedDotSystem& local_6 = ::FMS_RedDotSystem::Get(this.GetContext().Manager);
        int local_7 = 0;
        for (auto& local_26 : this.GetTalentNodeMap())
        {
            bool local_3 = !(local_26.GetValue().IsValid());
            if (local_3)
            {
                continue;
            }
            TEUIModelRef<FM_TalentNode> local_28 = TEUIModelRef<FM_TalentNode>(local_26.GetValue().Get());
            local_3 = !(local_28.IsValid());
            if (local_3)
            {
                continue;
            }
            local_3 = this.IsMappingReachable(local_28.opArrow().GetAvatarMappingConfig(), local_2);
            if (local_3)
            {
                continue;
            }
            local_55 = local_28.opArrow().GetDataId();
            local_3 = local_6.HasRedDot(GameplayTags::RedDotSystem_Talent_NewTalent, local_55) || local_6.HasRedDot(GameplayTags::RedDotSystem_Talent_CanUpgrade, local_55) || local_6.HasRedDot(GameplayTags::RedDotSystem_Avatar_NewTalent, local_55) || local_6.HasRedDot(GameplayTags::RedDotSystem_Talent_NodeRedDot, local_55);
            if (local_3)
            {
                int64 local_58 = local_55;
                this.FullyConsumeRedDot(GameplayTags::RedDotSystem_Talent_NewTalent, local_58);
                local_58 = local_55;
                this.FullyConsumeRedDot(GameplayTags::RedDotSystem_Talent_CanUpgrade, local_58);
                local_58 = local_55;
                this.FullyConsumeRedDot(GameplayTags::RedDotSystem_Avatar_NewTalent, local_58);
                local_58 = local_55;
                this.FullyConsumeRedDot(GameplayTags::RedDotSystem_Talent_NodeRedDot, local_58);
                ++local_7;
            }
        }
        if (local_7 > 0)
        {
            XLog(ELog(68), FString().Append("[M_Talent]CleanupUnreachableMainPlayerRedDots: SpecialtyID=[").Append(local_2).Append("], cleaned [").Append(local_7).Append("] unreachable node(s)."));
        }
        return;
    }
    void OnPlayerEntityChanged(const FMsg_PlayerEntityChanged &inout Msg)
    {
        if (!(this.HasTalentSystemUnlock()))
        {
            return;
        }
        if (this.GetTalentNodeMap().Num() == 0)
        {
            return;
        }
        int local_5 = this.GetCurrentPlayerSpecialtyID();
        if (local_5 == 0 || (local_5 == this.GetCachedSpecialtyID()))
        {
            return;
        }
        int local_4 = this.GetCachedSpecialtyID();
        XLog(ELog(68), FString().Append("[M_Talent]OnPlayerEntityChanged: specialty changed [").Append(local_4).Append("] -> [").Append(local_5).Append("], cleanup unreachable & refresh entry red dots."));
        this.SetCachedSpecialtyID(local_5);
        this.CleanupUnreachableMainPlayerRedDots();
        this.RefreshTalentAvatarEntryRedDots();
        return;
    }
    void ReconcileTalentRedDotsByLock()
    {
        int local_25;
        if (this.HasTalentSystemUnlock())
        {
            this.CleanupUnreachableMainPlayerRedDots();
            this.RefreshCanUpgradeRedDot();
            this.RefreshNewSkillDerivedRedDots();
            this.RefreshAllNodeActionableRedDots();
            return;
        }
        for (auto& local_20 : this.GetTalentNodeMap())
        {
            if (!(local_20.GetValue().IsValid()))
            {
                continue;
            }
            TEUIModelRef<FM_TalentNode> local_22 = TEUIModelRef<FM_TalentNode>(local_20.GetValue().Get());
            if (!(local_22.IsValid()))
            {
                continue;
            }
            local_25 = local_22.opArrow().GetDataId();
            this.FullyConsumeRedDot(GameplayTags::RedDotSystem_Talent_NewTalent, local_25);
            this.FullyConsumeRedDot(GameplayTags::RedDotSystem_Avatar_NewTalent, local_25);
            this.FullyConsumeRedDot(GameplayTags::RedDotSystem_Talent_CanUpgrade, local_25);
            this.FullyConsumeRedDot(GameplayTags::RedDotSystem_Talent_NodeRedDot, local_25);
        }
        TArray<ESkillType> local_32;
        local_32.Add(ESkillType(2));
        local_32.Add(ESkillType(1));
        local_32.Add(ESkillType(3));
        local_32.Add(ESkillType(4));
        local_32.Add(ESkillType(5));
        local_32.Add(ESkillType(6));
        TDataObjectIterator<FAvatarMappingConfig> local_50;
        for (; local_50; )
        {
            const FAvatarMappingConfig& local_52 = local_50.GetData();
            for (auto& local_66 : local_52.GetAvatar())
            {
                if (!(local_66))
                {
                    continue;
                }
                int local_26 = local_66.Get().DataId;
                local_25 = local_26;
                int64 local_28_2 = local_25;
                this.FullyConsumeRedDot(GameplayTags::RedDotSystem_Avatar_NewSkillEntry, local_28_2);
                for (auto local_79 : local_32)
                {
                    this.FullyConsumeRedDot(GameplayTags::RedDotSystem_Avatar_ReplaceSkillSlot, this.MakeSlotRedDotKey(local_25, ESkillType(local_79)));
                }
            }
            local_50.Next();
        }
        this.RefreshTalentAvatarEntryRedDots();
        ::FMS_PlayerAvatarData::Get(this.GetContext().Manager).RefreshAvatarListEntryRedDot();
        return;
    }
    void OnSystemControlAllNotify(const FMsg_SystemControlAllNotify &inout Msg)
    {
        if (this.GetTalentNodeMap().Num() == 0)
        {
            return;
        }
        if (!(this.HasTalentSystemUnlock()))
        {
            this.ReconcileTalentRedDotsByLock();
        }
        return;
    }
    void OnSystemUnlockFromGS(const FMsg_SystemUnlockFromGS &inout Msg)
    {
        if (int(Msg.SystemModule) == 4)
        {
            this.ReconcileTalentRedDotsByLock();
        }
        return;
    }
    void OnRedPointDataRestored(const FMsg_RedPointDataRestored &inout Msg)
    {
        if (this.GetTalentNodeMap().Num() == 0)
        {
            XLog(ELog(68), FString().Append("[M_Talent]OnRedPointDataRestored skipped: talent tree not built yet (TalentNodeMap.Num=0)."));
            return;
        }
        XLog(ELog(68), FString().Append("[M_Talent]OnRedPointDataRestored: reconcile after red point restore. TalentNodeMap.Num=[").Append(this.GetTalentNodeMap().Num()).Append("]"));
        this.ReconcileTalentRedDotsByLock();
        return;
    }
    TEUIModelWeakRef<FM_TalentTree> GetTree(const uint TreeId)
    {
        if (this.GetTalentTreeMap().Contains(TreeId))
        {
            return TEUIModelWeakRef<FM_TalentTree>(this.GetTalentTreeMap()[TreeId].Get());
        }
        return TEUIModelWeakRef<FM_TalentTree>();
    }
    TEUIModelWeakRef<FM_TalentNode> GetNode(const uint NodeId)
    {
        if (this.GetTalentNodeMap().Contains(NodeId))
        {
            return TEUIModelWeakRef<FM_TalentNode>(this.GetTalentNodeMap()[NodeId].Get());
        }
        return TEUIModelWeakRef<FM_TalentNode>();
    }
    TEUIModelWeakRef<FM_TalentNode> GetNodeByTalentId(const uint TalentId)
    {
        if (this.GetTalentIdToNodeMap().Contains(TalentId))
        {
            return this.GetNode(this.GetTalentIdToNodeMap()[TalentId]);
        }
        return TEUIModelWeakRef<FM_TalentNode>();
    }
    bool GetAvatarEquippedTalentInfo(const uint AvatarMappingId, FAvatarEquippedTalentInfo &inout OutInfo) const
    {
        if (this.GetAvatarMappingEquippedTalentMap().Contains(AvatarMappingId))
        {
            return true;
        }
        return false;
    }
    TEUIModelWeakRef<FM_TalentNode> GetNodeBySkillInitConfig(const TDataObjectPtr<FSkillInitConfig> &inout InSkillInitConfig)
    {
        TEUIModelWeakRef<FM_TalentNode> local_4;
        if (!(InSkillInitConfig))
        {
            return local_4;
        }
        TDataObjectIterator<FTalentConfig> local_20;
        for (; local_20; )
        {
            const FTalentConfig& local_22 = local_20.GetData();
            TDataObjectPtr<FSkillInitConfig> local_46;
            local_46 = local_22.GetSkillConfig();
            if ((local_46 == InSkillInitConfig.opImplConv()))
            {
                local_4 = this.GetNodeByTalentId(int(local_22.DataId));
                if (local_4.IsValid())
                {
                    return local_4;
                }
            }
            local_20.Next();
        }
        return local_4;
    }
    uint GetEquippedTalentIdBySlot(const uint AvatarMappingId, const uint Slot) const
    {
        if (this.GetAvatarMappingEquippedTalentMap().Contains(AvatarMappingId))
        {
            const FAvatarEquippedTalentInfo& local_4 = this.GetAvatarMappingEquippedTalentMap()[AvatarMappingId];
            if (local_4.SlotToTalentId.Contains(Slot))
            {
                return local_4.SlotToTalentId[Slot];
            }
        }
        return 0;
    }
    uint GetSlotByTalentNodeId(const uint AvatarMappingId, const uint TalentId)
    {
        ESkillType local_106;
        ESkillType local_108;
        if (!(this.GetAvatarMappingEquippedTalentMap().Contains(AvatarMappingId)))
        {
            return 0;
        }
        const FAvatarEquippedTalentInfo& local_4 = this.GetAvatarMappingEquippedTalentMap()[AvatarMappingId];
        for (auto& local_22 : local_4.SlotToTalentId)
        {
            TEUIModelWeakRef<FM_TalentNode> local_24 = this.GetNodeByTalentId(local_22.GetValue());
            if (local_24.IsValid() && (local_24.Get().GetDataId() == TalentId))
            {
                return local_22.GetKey();
            }
            if (local_22.GetValue() == TalentId)
            {
                return local_22.GetKey();
            }
        }
        int local_28 = int(local_4.FoundationId);
        if (local_28 != 0)
        {
            int local_30;
            int local_29;
            local_29 = 0;
            local_30 = 0;
            for (auto& local_48 : this.GetTalentNodeMap())
            {
                if (!(local_48.GetValue().IsValid()))
                {
                    continue;
                }
                TEUIModelRef<FM_TalentNode> local_50 = TEUIModelRef<FM_TalentNode>(local_48.GetValue().Get());
                if (!(local_50.IsValid()))
                {
                    continue;
                }
                TDataObjectPtr<FTalentConfig> local_102 = local_50.opArrow().GetConfig(0);
                if (!(local_102) || (int(local_102.Get().TalentType) != 6))
                {
                    continue;
                }
                if (!(local_102.Get().GetFoundationTalent()) || ((local_102.Get().GetFoundationTalent().Get().DataId != local_28)))
                {
                    continue;
                }
                local_106 = local_102.Get().TalentSkillType;
                if (int(local_106) != 0)
                {
                    local_108 = local_102.Get().TalentSkillType;
                }
                else
                {
                    if (local_102.Get().GetSkillConfig())
                    {
                        local_106 = local_102.Get().GetSkillConfig().Get().SkillType;
                    }
                    else
                    {
                        local_106 = ESkillType(0);
                    }
                    local_108 = local_106;
                }
                if (int(local_108) == 3)
                {
                    local_29 = local_50.opArrow().GetDataId();
                }
                else
                {
                    if (int(local_108) == 4)
                    {
                        local_30 = local_50.opArrow().GetDataId();
                    }
                }
            }
            if (TalentId != 0 && (TalentId == local_29))
            {
                return 1;
            }
            if (TalentId != 0 && (TalentId == local_30))
            {
                return 2;
            }
        }
        return 0;
    }
    void GS_OnPlayerAvatarDataNotify(const FPbPlayerAvatarDataNotify &inout Notify)
    {
        int local_31;
        int local_187;
        int local_209;
        this.GetModify_TalentNodeMap().Reset();
        this.GetModify_TalentTreeMap().Reset();
        this.GetModify_TalentIdToNodeMap().Reset();
        this.GetModify_AvatarMappingEquippedTalentMap().Reset();
        XLog(ELog(68), FString().Append("[M_Talent]GS_OnPlayerAvatarDataNotify: UnlockedNum:[").Append(Notify.GetAvatarUnlockedTalentList_Num()).Append("], UnlockableNum:[").Append(Notify.GetAvatarUnlockableTalentList_Num()).Append("], CondNum:[").Append(Notify.GetAvatarTalentCondList_Num()).Append("], EquippedNum:[").Append(Notify.GetAvatarEquippedTalentList_Num()).Append("]"));
        TDataObjectIterator<FTalentLayoutTreeConfig> local_26;
        for (; local_26; )
        {
            const FTalentLayoutTreeConfig& local_30 = local_26.GetData();
            local_31 = int(local_30.DataId);
            FM_TalentTree& local_34 = ::FM_TalentTree::Create(this.GetContext().Manager, local_31);
            local_34.SetLayoutConfig(TDataObjectPtr<FTalentLayoutTreeConfig>(local_30));
            local_34.UpdateValid(true);
            this.CreateAndAddNode(local_34, local_30.TalentTreeArray, ETalentNodeStateType(1));
            this.GetModify_TalentTreeMap().Add(local_31, TEUIModelRef<FM_TalentTree>(local_34));
            local_26.Next();
        }
        TDataObjectIterator<FTalentConfig> local_78;
        for (; local_78; )
        {
            const FTalentConfig& local_80 = local_78.GetData();
            if (this.GetTalentIdToNodeMap().Contains(local_80.DataId))
            {
            }
            else
            {
                if (int(local_80.UnlockType) == 3)
                {
                }
                else
                {
                    local_31 = int(local_80.DataId);
                    FTalentTreeNode local_110;
                    GetDataObjectByGSDataId<FTalentConfig> local_134;
                    local_110.NodeConfig = local_134.opImplConv();
                    FM_TalentNode& local_184 = ::FM_TalentNode::Create(this.GetContext().Manager, 0, local_110, ETalentNodeStateType(1));
                    this.GetModify_TalentNodeMap().Add(local_31, TEUIModelRef<FM_TalentNode>(local_184));
                    this.RegisterTalentToNode(local_31, local_31);
                    local_184.GetModify_ChoiceBaseIds().Add(local_31);
                    if (local_80.GetDoubleFormTalent())
                    {
                        int local_8 = local_80.GetDoubleFormTalent().Get().DataId;
                        this.RegisterTalentToNode(local_8, local_31);
                    }
                    if (local_80.GetChooseTalent())
                    {
                        local_187 = local_80.GetChooseTalent().Get().DataId;
                        this.RegisterTalentToNode(local_187, local_31);
                        local_184.GetModify_ChoiceBaseIds().Add(local_187);
                        if (local_80.GetChooseTalent().Get().GetDoubleFormTalent())
                        {
                            int local_5 = local_80.GetChooseTalent().Get().GetDoubleFormTalent().Get().DataId;
                            this.RegisterTalentToNode(local_5, local_31);
                        }
                    }
                }
            }
            local_78.Next();
        }
        for (; local_78; )
        {
            const FTalentConfig& local_80_2 = local_78.GetData();
            if (this.GetTalentIdToNodeMap().Contains(local_80_2.DataId))
            {
            }
            else
            {
                if (int(local_80_2.UnlockType) != 3)
                {
                }
                else
                {
                    if (!(local_80_2.GetBaseTalent()))
                    {
                    }
                    else
                    {
                        local_31 = local_80_2.GetBaseTalent().Get().DataId;
                        if (!(this.GetTalentIdToNodeMap().Contains(local_31)))
                        {
                        }
                        else
                        {
                            local_187 = this.GetTalentIdToNodeMap()[local_31];
                            this.RegisterTalentToNode(int(local_80_2.DataId), local_187);
                            if (local_80_2.GetDoubleFormTalent())
                            {
                                int local_8_2 = local_80_2.GetDoubleFormTalent().Get().DataId;
                                this.RegisterTalentToNode(local_8_2, local_187);
                            }
                        }
                    }
                }
            }
            local_78.Next();
        }
        local_187 = 0;
        for (; local_187 < Notify.GetAvatarUnlockableTalentList_Num(); )
        {
            this.RefreshNodeByTalentId(Notify.GetAvatarUnlockableTalentList_Index(local_187), ETalentNodeStateType(2), false);
            ++local_187;
        }
        local_31 = 0;
        for (; local_31 < Notify.GetAvatarUnlockedTalentList_Num(); )
        {
            this.RefreshNodeByTalentId(Notify.GetAvatarUnlockedTalentList_Index(local_31), ETalentNodeStateType(3), false);
            ++local_31;
        }
        local_187 = 0;
        for (; local_187 < Notify.GetAvatarTalentCondList_Num(); ++local_187)
        {
            FPbTalentCondBin local_198 = Notify.GetAvatarTalentCondList_Index(local_187);
            int local_5_2 = local_198.GetTalentId();
            if (this.GetTalentIdToNodeMap().Contains(local_5_2))
            {
                local_209 = this.GetTalentIdToNodeMap()[local_5_2];
                if (this.GetTalentNodeMap().Contains(local_209))
                {
                    FM_TalentNode& local_184_2 = this.GetTalentNodeMap()[local_209].Get();
                    int local_210 = 0;
                    for (; local_210 < local_198.GetCondIdList_Num(); )
                    {
                        local_184_2.GetModify_AchievedCondIdList().Add(local_198.GetCondIdList_Index(local_210));
                        ++local_210;
                    }
                }
            }
        }
        int local_210_2 = 0;
        for (; local_210_2 < Notify.GetAvatarEquippedTalentList_Num(); )
        {
            FPbAvatarEquippedTalentBin local_220 = Notify.GetAvatarEquippedTalentList_Index(local_210_2);
            int local_6 = local_220.GetAvatarMappingId();
            FAvatarEquippedTalentInfo local_258;
            local_258.AvatarMappingId = local_6;
            local_258.FoundationId = local_220.GetFoundationId();
            local_258.ChooseIds.Empty(0);
            local_209 = 0;
            local_258.ChooseIds.Add(local_220.GetChooseIdList_Index(local_209));
            ++local_209;
            local_187 = local_220.GetChooseIdList_Num();
            local_187 = 0;
            FPbAvatarReplaceSkillBin local_268 = local_220.GetReplaceSkillList_Index(local_187);
            local_258.SlotToTalentId.Add(local_268.GetSlot(), local_268.GetTalentId());
            ++local_187;
            local_31 = local_220.GetReplaceSkillList_Num();
            this.GetModify_AvatarMappingEquippedTalentMap().Add(local_6, local_258);
            XLog(ELog(68), FString().Append("[M_Talent] Equipped Avatar=").Append(local_6).Append(", FoundationId=").Append(local_258.FoundationId).Append(", ReplaceSkillNum=").Append(local_258.SlotToTalentId.Num()));
            ++local_210_2;
        }
        FEUIModelRef local_284 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus).opCall(local_284);
        return;
    }
    void GS_OnTalentStatusNotify(const FPbTalentStatusNotify &inout Notify)
    {
        XLog(ELog(68), FString().Append("[M_Talent]GS_OnTalentStatusNotify(Incremental): UnlockedNum:[").Append(Notify.GetUnlockedTalentList_Num()).Append("], UnlockableNum:[").Append(Notify.GetUnlockableTalentList_Num()).Append("], CondNum:[").Append(Notify.GetTalentCondList_Num()).Append("]"));
        int local_9 = 0;
        for (; local_9 < Notify.GetUnlockableTalentList_Num(); )
        {
            this.RefreshNodeByTalentId(Notify.GetUnlockableTalentList_Index(local_9), ETalentNodeStateType(2), true);
            ++local_9;
        }
        int local_9_2 = 0;
        for (; local_9_2 < Notify.GetUnlockedTalentList_Num(); )
        {
            this.RefreshNodeByTalentId(Notify.GetUnlockedTalentList_Index(local_9_2), ETalentNodeStateType(3), false);
            ++local_9_2;
        }
        int local_9_3 = 0;
        for (; local_9_3 < Notify.GetTalentCondList_Num(); ++local_9_3)
        {
            FPbTalentCondBin local_22 = Notify.GetTalentCondList_Index(local_9_3);
            int local_6 = local_22.GetTalentId();
            if (this.GetTalentIdToNodeMap().Contains(local_6))
            {
                int local_34;
                local_34 = this.GetTalentIdToNodeMap()[local_6];
                if (this.GetTalentNodeMap().Contains(local_34))
                {
                    FM_TalentNode& local_36 = this.GetTalentNodeMap()[local_34].Get();
                    int local_37 = 0;
                    for (; local_37 < local_22.GetCondIdList_Num(); )
                    {
                        local_36.GetModify_AchievedCondIdList().Add(local_22.GetCondIdList_Index(local_37));
                        ++local_37;
                    }
                }
            }
        }
        this.RefreshAllNodeActionableRedDots();
        this.RefreshNewSkillDerivedRedDots();
        FEUIModelRef local_46 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        FMsg_TalentTreeDataUpdate local_40;
        local_40.bStructural = false;
        return;
    }
    void GS_OnManageTalentRsp(const FPbManageTalentRsp &inout Rsp)
    {
        if (Rsp.GetRetcode() != 0)
        {
            XWarning(ELog(68), FString::Format("[M_Talent] ManageTalentRsp failed, retcode={0}", Rsp.GetRetcode()));
            return;
        }
        int local_21 = Rsp.GetAvatarEquippedTalent().GetAvatarMappingId();
        FAvatarEquippedTalentInfo& local_24 = this.GetModify_AvatarMappingEquippedTalentMap().FindOrAdd(local_21);
        int local_25 = int(local_24.FoundationId);
        FPbAvatarEquippedTalentBin local_36 = FPbAvatarEquippedTalentBin(Rsp.GetAvatarEquippedTalent());
        local_24.AvatarMappingId = local_36.GetAvatarMappingId();
        local_24.FoundationId = local_36.GetFoundationId();
        local_24.ChooseIds.Empty(0);
        int local_37 = 0;
        for (; local_37 < local_36.GetChooseIdList_Num(); )
        {
            local_24.ChooseIds.Add(local_36.GetChooseIdList_Index(local_37));
            ++local_37;
        }
        int local_38 = 0;
        for (; local_38 < local_36.GetReplaceSkillList_Num(); )
        {
            FPbAvatarReplaceSkillBin local_50 = local_36.GetReplaceSkillList_Index(local_38);
            local_24.SlotToTalentId.Add(local_50.GetSlot(), local_50.GetTalentId());
            ++local_38;
        }
        XLog(ELog(68), FString().Append("[M_Talent] ManageTalentRsp: Avatar=").Append(local_21).Append(", FoundationId=").Append(local_24.FoundationId).Append(", ReplaceSkillNum=").Append(local_24.SlotToTalentId.Num()));
        this.RefreshNewSkillDerivedRedDots();
        this.RefreshEquipDependentNodes(local_24);
        bool local_3 = (local_25 != int(local_24.FoundationId));
        FEUIModelRef local_70 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        FMsg_TalentTreeDataUpdate local_64;
        local_64.bStructural = local_3;
        return;
    }
    void RefreshEquipDependentNodes(const FAvatarEquippedTalentInfo &inout EquipInfo)
    {
        for (auto local_14 : EquipInfo.ChooseIds)
        {
            this.BumpNodeEquipRevisionByTalentId(local_14);
        }
        this.BumpNodeEquipRevisionByTalentId(int(EquipInfo.FoundationId));
        return;
    }
    void BumpNodeEquipRevisionByTalentId(const uint TalentId)
    {
        if (TalentId == 0 || !(this.GetTalentIdToNodeMap().Contains(TalentId)))
        {
            return;
        }
        int local_4 = this.GetTalentIdToNodeMap()[TalentId];
        if (this.GetTalentNodeMap().Contains(local_4))
        {
            FM_TalentNode& local_6 = this.GetModify_TalentNodeMap()[local_4].Get();
            local_6.SetEquipRevision((local_6.GetEquipRevision() + 1));
        }
        return;
    }
    void OnPlayerAvatarDataInitialized(const FMsg_PlayerAvatarDataInitialized &inout Msg)
    {
        if (this.GetTalentNodeMap().Num() == 0)
        {
            return;
        }
        this.SetCachedSpecialtyID(this.GetCurrentPlayerSpecialtyID());
        this.ReconcileTalentRedDotsByLock();
        return;
    }
    void OnTalentUnlockOrUpgradeRequest(const FMsg_TalentUnlockOrUpgradeRequest &inout Msg)
    {
        if (!(Msg.TalentNode.IsValid()))
        {
            return;
        }
        FM_TalentNode& local_4 = Msg.TalentNode.Get();
        int local_6 = local_4.GetCurrentLevel() + 1;
        TDataObjectPtr<FTalentConfig> local_58 = local_4.FindTalentByChoiceAndLevel(int(Msg.ChoiceIndex), local_6);
        if (!(local_58))
        {
            XLog(ELog(68), FString().Append("[M_Talent] OnTalentUnlockOrUpgradeRequest: No next level config found. NodeDataId=").Append(local_4.GetDataId()).Append(", NextLevel=").Append(local_6));
            return;
        }
        XLog(ELog(68), FString().Append("[M_Talent] OnTalentUnlockOrUpgradeRequest: NodeDataId=").Append(local_4.GetDataId()).Append(", UnlockTalentId=").Append(local_58.Get().DataId).Append(", Level=").Append(local_6));
        FPbUnlockTalentReq local_68;
        int local_7 = local_58.Get().DataId;
        local_68.SetTalentId(local_7);
        this.SendProto(local_68.ToWrapper());
        return;
    }
    void GS_OnTalentUnlockOrUpgradeRsp(const FPbUnlockTalentRsp &inout Rsp)
    {
        int local_10;
        int local_18;
        int local_162 = 0;
        if (Rsp.GetRetcode() != 0)
        {
            XWarning(ELog(68), FString::Format("[M_Talent] GS_OnTalentUnlockOrUpgradeRsp failed, retcode={0}", Rsp.GetRetcode()));
            return;
        }
        local_10 = Rsp.GetTalentId();
        this.RefreshNodeByTalentId(local_10, ETalentNodeStateType(3), false);
        this.GenerateNewTalentSourceRedDotByTalentId(local_10);
        TArray<uint> local_16;
        Rsp.GetRelatedTalentList(local_16);
        int local_17 = 0;
        for (; local_17 < local_16.Num(); ++local_17)
        {
            local_18 = local_16[local_17];
            if (this.GetTalentIdToNodeMap().Contains(local_18))
            {
                this.RefreshNodeByTalentId(local_18, ETalentNodeStateType(3), false);
                this.GenerateNewTalentSourceRedDotByTalentId(local_18);
            }
        }
        TEUIModelWeakRef<FM_TalentNode> local_22 = this.GetNodeByTalentId(local_10);
        if (local_22)
        {
            if (local_22.IsValid() && local_22.Get().HasChoice())
            {
                TDataObjectPtr<FAvatarMappingConfig> local_72 = local_22.Get().GetAvatarMappingConfig();
                if (local_72)
                {
                    TDataObjectPtr<FTalentConfig> local_122 = local_22.Get().FindTalentByChoiceAndLevel(local_22.Get().FindChoiceIndexByTalentId(local_10), FMath::Max(local_22.Get().GetCurrentLevel(), 1));
                    if (local_122)
                    {
                        TEUIModelRef<FMS_PlayerAvatarData> local_124 = TEUIModelRef<FMS_PlayerAvatarData>(::FMS_PlayerAvatarData::Get(this.GetManager()));
                        for (auto& local_142 : local_72.Get().GetAvatar())
                        {
                            if (local_124.Get().IsAvatarUnlocked(local_142))
                            {
                                FPbManageTalentReq local_146;
                                int local_97 = local_142.Get().DataId;
                                local_146.SetAvatarId(local_97);
                                int local_11 = local_122.Get().DataId;
                                local_146.SetChooseId(local_11);
                                this.SendProto(local_146.ToWrapper());
                                local_97 = local_146.GetChooseId();
                                local_11 = local_146.GetAvatarId();
                                XLog(ELog(68), FString().Append("[M_Talent] GS_OnTalentUnlockOrUpgradeRsp: Auto-equip choice, AvatarId=").Append(local_11).Append(", ChooseId=").Append(local_97));
                            }
                        }
                    }
                }
            }
        }
        this.RefreshAllNodeActionableRedDots();
        this.RefreshNewSkillDerivedRedDots();
        FEUIModelRef local_160 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        FMsg_TalentTreeDataUpdate local_154;
        local_154.bStructural = false;
        FEUIModelRef local_160_2 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        local_162.UnlockOrUpgradeTalentNode.AddUnique(this.GetNodeByTalentId(local_10));
        int local_1 = 0;
        for (; local_1 < local_16.Num(); )
        {
            local_162.UnlockOrUpgradeTalentNode.AddUnique(this.GetNodeByTalentId(local_16[local_1]));
            ++local_1;
        }
        return;
    }
    TArray<TEUIModelWeakRef<FM_TalentTree>> GetTalentTreeListByAvatar(const TDataObjectPtr<FAvatarPrefabConfig> &inout Avatar)
    {
        TArray<TEUIModelWeakRef<FM_TalentTree>> local_4;
        for (auto& local_24 : this.GetTalentTreeMap())
        {
            if (local_24.GetValue().IsValid())
            {
                FM_TalentTree& local_26 = local_24.GetValue().Get();
                if (::UAvatarMappingSettings::Get() != nullptr)
                {
                    if (::UAvatarMappingSettings::Get().IsInMappingGroup(local_26.GetLayoutConfig().Get().GetAvatar(), Avatar))
                    {
                        local_4.Add(TEUIModelWeakRef<FM_TalentTree>(local_26));
                    }
                }
            }
        }
        return local_4;
    }
    TArray<TEUIModelWeakRef<FM_TalentNode>> GetTalentParentConfigListByNode(const TEUIModelWeakRef<FM_TalentNode> &inout Node)
    {
        TArray<TEUIModelWeakRef<FM_TalentNode>> local_4;
        if (!(Node.IsValid()))
        {
            return local_4;
        }
        TDataObjectPtr<FTalentConfig> local_30 = Node.Get().GetConfig().NodeConfig;
        if (!(local_30))
        {
            return local_4;
        }
        for (auto& local_68 : local_30.opArrow().GetUnlockFrontTalent())
        {
            if (!(local_68))
            {
                continue;
            }
            TEUIModelWeakRef<FM_TalentNode> local_74 = this.GetNodeByTalentId(local_68.Get().DataId);
            if (local_74)
            {
                local_4.Add(local_74);
            }
        }
        return local_4;
    }
    TArray<TEUIModelRef<FM_TalentNode>> GetActiveTalentNodeListByType(const ESkillType SkillType)
    {
        TArray<TEUIModelRef<FM_TalentNode>> local_4;
        for (auto& local_24 : this.GetTalentNodeMap())
        {
            if (local_24.GetValue().IsValid())
            {
                if (int(local_24.GetValue().Get().GetStateType()) != 3)
                {
                    continue;
                }
                TEUIModelRef<FM_TalentNode> local_30 = TEUIModelRef<FM_TalentNode>(local_24.GetValue().Get());
                if (local_30.IsValid() && (int(local_30.opArrow().GetEffectiveSkillType()) != 0))
                {
                    if (int(local_30.opArrow().GetEffectiveSkillType()) == int(SkillType))
                    {
                        local_4.Add(local_24.GetValue());
                    }
                }
            }
        }
        return local_4;
    }
    TArray<TEUIModelRef<FM_TalentNode>> GetActiveTalentNodeListByType(const TDataObjectPtr<FAvatarMappingConfig> &inout AvatarMappingConfig, const ESkillType SkillType)
    {
        TArray<TEUIModelRef<FM_TalentNode>> local_4;
        for (auto& local_24 : this.GetTalentNodeMap())
        {
            if (local_24.GetValue().IsValid())
            {
                if (int(local_24.GetValue().Get().GetStateType()) != 3)
                {
                    continue;
                }
                TEUIModelRef<FM_TalentNode> local_30 = TEUIModelRef<FM_TalentNode>(local_24.GetValue().Get());
                if (local_30.IsValid() && (int(local_30.opArrow().GetEffectiveSkillType()) != 0))
                {
                    if (int(local_30.opArrow().GetEffectiveSkillType()) == int(SkillType) && (local_30.opArrow().GetAvatarMappingConfig() == AvatarMappingConfig.opImplConv()))
                    {
                        if (int(local_30.opArrow().GetConfig(0).Get().TalentType) == 6)
                        {
                            FAvatarEquippedTalentInfo local_136;
                            bool local_21;
                            this.GetAvatarEquippedTalentInfo(AvatarMappingConfig.Get().DataId, local_136);
                            local_21 = local_30.opArrow().GetConfig(0).Get().GetFoundationTalent().IsSet();
                            if (local_21)
                            {
                                TDataObjectPtr<FTalentConfig> local_162 = local_30.opArrow().GetConfig(0).Get().GetFoundationTalent();
                                if (local_162)
                                {
                                    if (local_162.Get().DataId == (int(local_136.FoundationId)))
                                    {
                                        local_4.Add(local_24.GetValue());
                                    }
                                }
                                else
                                {
                                    XError(ELog(68), FString().Append("[M_Talent] GetActiveTalentNodeListByType: FoundationTalent is not set. NodeDataId=").Append(local_30.opArrow().GetConfig(0).Get().DataId));
                                }
                            }
                        }
                        else
                        {
                            local_4.Add(local_24.GetValue());
                        }
                    }
                }
            }
        }
        return local_4;
    }
    TEUIModelWeakRef<FM_TalentNode> GetPreviewTalentNodeBySlot(const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig, const ESkillSlot SkillSlot)
    {
        bool local_1;
        if (!(AvatarConfig))
        {
            local_1 = false;
        }
        else
        {
            local_1 = AvatarConfig.Get().GetSkillConfig();
        }
        local_1 = local_1 && (int(SkillSlot) != 0);
        if (local_1)
        {
            for (auto& local_18 : AvatarConfig.Get().GetSkillConfig().Get().SkillInitConfigs)
            {
                if (int(local_18.SkillSlot) != int(SkillSlot) || !(local_18.DefaultTalent))
                {
                    continue;
                }
                return this.GetNodeByTalentId(local_18.DefaultTalent.Get().DataId);
            }
        }
        return TEUIModelWeakRef<FM_TalentNode>();
    }
    TArray<TEUIModelRef<FM_TalentNode>> GetActiveFoundationTalentNodeList(const TDataObjectPtr<FAvatarMappingConfig> &inout AvatarMappingConfig)
    {
        TArray<TEUIModelRef<FM_TalentNode>> local_4;
        for (auto& local_24 : this.GetTalentNodeMap())
        {
            if (local_24.GetValue().IsValid())
            {
                if ((int(local_24.GetValue().Get().GetStateType())) != 3)
                {
                    continue;
                }
                FM_TalentNode& local_30 = local_24.GetValue().Get();
                if ((int(local_30.GetConfig().NodeConfig.Get().TalentType)) == 1 && (local_30.GetAvatarMappingConfig() == AvatarMappingConfig.opImplConv()))
                {
                    local_4.Add(local_24.GetValue());
                }
            }
        }
        __Lambda_UI_Private_Model_Talent_M_Talent_1859 local_82;
        local_4.Sort(local_82);
        return local_4;
    }
    const TMap<uint, TEUIModelRef<FM_TalentNode>> GetTalentNodeMap() const property
    {
        const TMap<uint, TEUIModelRef<FM_TalentNode>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TMap<uint, TEUIModelRef<FM_TalentNode>> GetModify_TalentNodeMap() property
    {
        TMap<uint, TEUIModelRef<FM_TalentNode>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTalentNodeMap(const TMap<uint, TEUIModelRef<FM_TalentNode>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TalentNodeMap = __Value;
        return;
    }
    const TMap<uint, TEUIModelRef<FM_TalentTree>> GetTalentTreeMap() const property
    {
        const TMap<uint, TEUIModelRef<FM_TalentTree>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TMap<uint, TEUIModelRef<FM_TalentTree>> GetModify_TalentTreeMap() property
    {
        TMap<uint, TEUIModelRef<FM_TalentTree>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetTalentTreeMap(const TMap<uint, TEUIModelRef<FM_TalentTree>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TalentTreeMap = __Value;
        return;
    }
    const TMap<uint, uint> GetTalentIdToNodeMap() const property
    {
        const TMap<uint, uint> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TMap<uint, uint> GetModify_TalentIdToNodeMap() property
    {
        TMap<uint, uint> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetTalentIdToNodeMap(const TMap<uint, uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_TalentIdToNodeMap = __Value;
        return;
    }
    const TMap<uint, FAvatarEquippedTalentInfo> GetAvatarMappingEquippedTalentMap() const property
    {
        const TMap<uint, FAvatarEquippedTalentInfo> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TMap<uint, FAvatarEquippedTalentInfo> GetModify_AvatarMappingEquippedTalentMap() property
    {
        TMap<uint, FAvatarEquippedTalentInfo> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetAvatarMappingEquippedTalentMap(const TMap<uint, FAvatarEquippedTalentInfo> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_AvatarMappingEquippedTalentMap = __Value;
        return;
    }
    const TMap<uint, FAvatarUnlockTalentInfo> GetAvatarNewUnlockTalent() const property
    {
        const TMap<uint, FAvatarUnlockTalentInfo> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TMap<uint, FAvatarUnlockTalentInfo> GetModify_AvatarNewUnlockTalent() property
    {
        TMap<uint, FAvatarUnlockTalentInfo> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetAvatarNewUnlockTalent(const TMap<uint, FAvatarUnlockTalentInfo> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_AvatarNewUnlockTalent = __Value;
        return;
    }
    uint GetCachedSpecialtyID() const property
    {
        this.TrackPropertyRead(5);
        return this.m_CachedSpecialtyID;
    }
    void SetCachedSpecialtyID(const uint __Value) property
    {
        if (this.m_CachedSpecialtyID == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_CachedSpecialtyID = __Value;
        return;
    }
}

struct FMsg_TalentNodeItemClick : FEUIMessage
{
    UPROPERTY()
    TEUIModelWeakRef<FM_TalentNode> ItemNodeM;

    FMsg_TalentNodeItemClick()
    {
        return;
    }
}

struct FMsg_TalentTreeDataUpdate : FEUIMessage
{
    UPROPERTY()
    bool bStructural = true;

}

struct FMsg_TalentTreeUpdateFinish : FEUIMessage
{
    UPROPERTY()
    int TreeIndex;
    UPROPERTY()
    TEUIModelWeakRef<FVM_TalentUpgradeItem> FirstItemNodeM;
    UPROPERTY()
    TEUIModelWeakRef<FVM_TalentUpgradeFormulaTree> FormulaTreeVM;

}

struct FMsg_TalentItemHoverStateChagne : FEUIMessage
{
    UPROPERTY()
    bool bShow;
    UPROPERTY()
    TEUIModelWeakRef<FM_TalentNode> TalentNode;
    UPROPERTY()
    int ChoiceIndex = 0;
    UPROPERTY()
    UWidget SourceWidget = nullptr;

}

struct FMsg_TalentUnlockOrUpgradeOpenConfirm : FEUIMessage
{
    UPROPERTY()
    TEUIModelWeakRef<FM_TalentNode> TalentNode;
    UPROPERTY()
    int ChoiceIndex;

}

struct FMsg_TalentUnlockOrUpgradeRequest : FEUIMessage
{
    UPROPERTY()
    TEUIModelWeakRef<FM_TalentNode> TalentNode;
    UPROPERTY()
    int ChoiceIndex;

}

struct FMsg_TalentUnlockOrUpgradeReply : FEUIMessage
{
    UPROPERTY()
    TArray<TEUIModelWeakRef<FM_TalentNode>> UnlockOrUpgradeTalentNode;

    FMsg_TalentUnlockOrUpgradeReply()
    {
        return;
    }
}

struct FMsg_TalentUnlockOrUpgradeAnim : FEUIMessage
{
    UPROPERTY()
    TArray<TEUIModelWeakRef<FM_TalentNode>> UnlockOrUpgradeTalentNode;

    FMsg_TalentUnlockOrUpgradeAnim()
    {
        return;
    }
}

struct FMsg_TalentSetEquipChoiceTalent : FEUIMessage
{
    UPROPERTY()
    TEUIModelWeakRef<FM_TalentNode> TalentNode;
    UPROPERTY()
    int NewChoice;

}

struct FMsg_TalentSetEquipSkillSlot : FEUIMessage
{
    UPROPERTY()
    TEUIModelWeakRef<FM_TalentNode> TalentNode;
    UPROPERTY()
    int ChoiceIndex;

}

struct FMsg_TalentSetEquipFoundation : FEUIMessage
{
    UPROPERTY()
    TEUIModelWeakRef<FM_TalentNode> FoundationNode;

    FMsg_TalentSetEquipFoundation()
    {
        return;
    }
}

struct FMsg_TalentNodeHoverOpenDetails : FEUIMessage
{
    UPROPERTY()
    TEUIModelWeakRef<FM_TalentNode> TalentNode;
    UPROPERTY()
    int ChoiceIndex = 0;

}

struct FMsg_TalentNodeHoverCloseDetails : FEUIMessage
{
    FMsg_TalentNodeHoverCloseDetails()
    {
        return;
    }
}

struct __Lambda_UI_Private_Model_Talent_M_Talent_1859
{
    __Lambda_UI_Private_Model_Talent_M_Talent_1859()
    {
        return;
    }
    bool opCall(const TEUIModelRef<FM_TalentNode> &inout A, const TEUIModelRef<FM_TalentNode> &inout B)
    {
        int local_123;
        int local_125;
        int local_49 = A.Get().GetTreeId();
        GetDataObjectByGSDataId<FTalentLayoutTreeConfig> local_48;
        TDataObjectPtr<FTalentLayoutTreeConfig> local_24 = local_48.opImplConv();
        int local_49_2 = B.Get().GetTreeId();
        TDataObjectPtr<FTalentLayoutTreeConfig> local_122 = local_48.opImplConv();
        if (local_24)
        {
            local_125 = local_24.Get().Priority;
        }
        else
        {
            local_125 = 0;
        }
        if (local_122)
        {
            local_123 = local_122.Get().Priority;
        }
        else
        {
            local_123 = 0;
        }
        return (local_125 < local_123);
    }
}

namespace FM_TalentNode
{
FM_TalentNode& Create(const UObject ContextObject, const uint TreeId, const FTalentTreeNode &inout Config, const ETalentNodeStateType StateType)
{
    return FM_TalentNode::CreateByManager(EUIInternal::GetContextManager(ContextObject), TreeId, Config, ETalentNodeStateType(StateType));
}
FM_TalentNode& CreateByManager(const UEUIManagerSubsystem Manager, const uint TreeId, const FTalentTreeNode &inout Config, const ETalentNodeStateType StateType)
{
    return TEUIModelRef<FM_TalentNode>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_TalentNode::ModelId, 0, TreeId, Config, StateType)).Get();
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_TalentNode;
}
int __IndexOf_DataId()
{
    return 0;
}
int __IndexOf_TreeId()
{
    return 1;
}
int __IndexOf_Config()
{
    return 2;
}
int __IndexOf_StateType()
{
    return 3;
}
int __IndexOf_AllTalentIds()
{
    return 4;
}
int __IndexOf_ChoiceBaseIds()
{
    return 5;
}
int __IndexOf_ActiveLevel()
{
    return 6;
}
int __IndexOf_EquipRevision()
{
    return 7;
}
int __IndexOf_bHasMainChild()
{
    return 8;
}
int __IndexOf_AchievedCondIdList()
{
    return 9;
}
int __IndexOf_UnlockableTalentIds()
{
    return 10;
}
}
namespace FM_TalentTree
{
FM_TalentTree& Create(const UObject ContextObject, const uint TreeId)
{
    return FM_TalentTree::CreateByManager(EUIInternal::GetContextManager(ContextObject), TreeId);
}
FM_TalentTree& CreateByManager(const UEUIManagerSubsystem Manager, const uint TreeId)
{
    return TEUIModelRef<FM_TalentTree>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_TalentTree::ModelId, 0, TreeId)).Get();
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_TalentTree;
}
int __IndexOf_TreeId()
{
    return 0;
}
int __IndexOf_bValid()
{
    return 1;
}
int __IndexOf_LayoutConfig()
{
    return 2;
}
int __IndexOf_NodeList()
{
    return 3;
}
int __IndexOf_BranchType()
{
    return 4;
}
}
namespace FMS_Talent
{
FMS_Talent& Get(const UObject ContextObject)
{
    return FMS_Talent::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_Talent& GetByManager(const UEUIManagerSubsystem Manager)
{
    return TEUIModelRef<FMS_Talent>(EUIInternal::MakeModelWithManager(Manager, FMS_Talent::ModelId)).Get();
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMsgHandleDefine local_14;
    local_14.FunctionName = "__OnPlayerEntityChanged";
    local_14.MessageTypeName = "Msg_PlayerEntityChanged";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    local_14.FunctionName = "__OnSystemControlAllNotify";
    local_14.MessageTypeName = "Msg_SystemControlAllNotify";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    local_14.FunctionName = "__OnSystemUnlockFromGS";
    local_14.MessageTypeName = "Msg_SystemUnlockFromGS";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    local_14.FunctionName = "__OnRedPointDataRestored";
    local_14.MessageTypeName = "Msg_RedPointDataRestored";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    FEUIModelProtoRspDefine local_24;
    local_24.FunctionName = "__GS_OnPlayerAvatarDataNotify";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnTalentStatusNotify";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnManageTalentRsp";
    Result.ProtoRspDefines.Add(local_24);
    local_14.FunctionName = "__OnPlayerAvatarDataInitialized";
    local_14.MessageTypeName = "Msg_PlayerAvatarDataInitialized";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    local_14.FunctionName = "__OnTalentUnlockOrUpgradeRequest";
    local_14.MessageTypeName = "Msg_TalentUnlockOrUpgradeRequest";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    local_24.FunctionName = "__GS_OnTalentUnlockOrUpgradeRsp";
    Result.ProtoRspDefines.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_Talent;
}
void __OnPlayerEntityChanged(FMS_Talent &inout Model, const FMsg_PlayerEntityChanged &inout Message)
{
    Model.OnPlayerEntityChanged(Message);
    return;
}
void __OnSystemControlAllNotify(FMS_Talent &inout Model, const FMsg_SystemControlAllNotify &inout Message)
{
    Model.OnSystemControlAllNotify(Message);
    return;
}
void __OnSystemUnlockFromGS(FMS_Talent &inout Model, const FMsg_SystemUnlockFromGS &inout Message)
{
    Model.OnSystemUnlockFromGS(Message);
    return;
}
void __OnRedPointDataRestored(FMS_Talent &inout Model, const FMsg_RedPointDataRestored &inout Message)
{
    Model.OnRedPointDataRestored(Message);
    return;
}
void __GS_OnPlayerAvatarDataNotify(FMS_Talent &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnPlayerAvatarDataNotify(FPbPlayerAvatarDataNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnTalentStatusNotify(FMS_Talent &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnTalentStatusNotify(FPbTalentStatusNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnManageTalentRsp(FMS_Talent &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnManageTalentRsp(FPbManageTalentRsp::FromWrapper(ProtoWrapper));
    return;
}
void __OnPlayerAvatarDataInitialized(FMS_Talent &inout Model, const FMsg_PlayerAvatarDataInitialized &inout Message)
{
    Model.OnPlayerAvatarDataInitialized(Message);
    return;
}
void __OnTalentUnlockOrUpgradeRequest(FMS_Talent &inout Model, const FMsg_TalentUnlockOrUpgradeRequest &inout Message)
{
    Model.OnTalentUnlockOrUpgradeRequest(Message);
    return;
}
void __GS_OnTalentUnlockOrUpgradeRsp(FMS_Talent &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnTalentUnlockOrUpgradeRsp(FPbUnlockTalentRsp::FromWrapper(ProtoWrapper));
    return;
}
int __IndexOf_TalentNodeMap()
{
    return 0;
}
int __IndexOf_TalentTreeMap()
{
    return 1;
}
int __IndexOf_TalentIdToNodeMap()
{
    return 2;
}
int __IndexOf_AvatarMappingEquippedTalentMap()
{
    return 3;
}
int __IndexOf_AvatarNewUnlockTalent()
{
    return 4;
}
int __IndexOf_CachedSpecialtyID()
{
    return 5;
}
}

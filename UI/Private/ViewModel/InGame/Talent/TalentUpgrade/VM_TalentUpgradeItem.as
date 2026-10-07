
namespace FVM_TalentUpgradeItem
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature UnlockOrUpgradeTalent = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature ShowHover = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OpenDetails = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature HideHover = FEUIModelCallbackSignature();

}
struct FVM_TalentUpgradeItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelWeakRef<FM_TalentNode> m_Node;
    UPROPERTY()
    int m_ChoiceIndex;
    UPROPERTY()
    bool m_bHover;
    UPROPERTY()
    bool m_bSelect;
    UPROPERTY()
    int m_UpgradeAnimIndex;
    UPROPERTY()
    TArray<FEUIModelContainer> m_SegmentProgressModels;
    UPROPERTY()
    TEUIModelRef<FVM_TalentSkillTypeBG> m_SkillTypeBGVM;
    UPROPERTY()
    TEUIModelRef<FVM_RedDot> m_RedDotVM;
    UPROPERTY()
    UWidget_TalentUpgradeTree m_OwnerFormulaTreeWidget;

    FVM_TalentUpgradeItem()
    {
        this.m_OwnerFormulaTreeWidget = nullptr;
        this.m_ChoiceIndex = 0;
        this.m_bHover = false;
        this.m_bSelect = false;
        this.m_UpgradeAnimIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TalentUpgradeItem' by default constructor.");
        return;
    }
    FVM_TalentUpgradeItem(const FVM_TalentUpgradeItem &inout Other)
    {
        this.m_OwnerFormulaTreeWidget = nullptr;
        this.m_ChoiceIndex = 0;
        this.m_bHover = false;
        this.m_bSelect = false;
        this.m_UpgradeAnimIndex = 0;
        this.m_Node = Other.m_Node;
        this.m_ChoiceIndex = int(Other.m_ChoiceIndex);
        this.m_bHover = Other.m_bHover;
        this.m_bSelect = Other.m_bSelect;
        this.m_UpgradeAnimIndex = int(Other.m_UpgradeAnimIndex);
        this.m_SegmentProgressModels = Other.m_SegmentProgressModels;
        this.m_SkillTypeBGVM = Other.m_SkillTypeBGVM;
        this.m_RedDotVM = Other.m_RedDotVM;
        this.m_OwnerFormulaTreeWidget = Other.m_OwnerFormulaTreeWidget;
        return;
    }
    FVM_TalentUpgradeItem(const TEUIModelWeakRef<FM_TalentNode> &inout InNode, const int InChoiceIndex)
    {
        this.m_OwnerFormulaTreeWidget = nullptr;
        this.m_ChoiceIndex = 0;
        this.m_bHover = false;
        this.m_bSelect = false;
        this.m_UpgradeAnimIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetNode(InNode);
        this.SetChoiceIndex(InChoiceIndex);
        return;
    }
    FVM_TalentUpgradeItem opAssign(const FVM_TalentUpgradeItem &inout Other)
    {
        FVM_TalentUpgradeItem __r;
        this.m_Node = Other.m_Node;
        this.m_ChoiceIndex = int(Other.m_ChoiceIndex);
        this.m_bHover = Other.m_bHover;
        this.m_bSelect = Other.m_bSelect;
        this.m_UpgradeAnimIndex = int(Other.m_UpgradeAnimIndex);
        this.m_SegmentProgressModels = Other.m_SegmentProgressModels;
        this.m_SkillTypeBGVM = Other.m_SkillTypeBGVM;
        this.m_RedDotVM = Other.m_RedDotVM;
        this.m_OwnerFormulaTreeWidget = Other.m_OwnerFormulaTreeWidget;
        return __r;
    }
    bool IsUnlock() const
    {
        return false;
    }
    uint GetUnlockLevel() const
    {
        int local_51 = 0;
        int local_50 = this.GetTalentConfig() ? local_51 : 0;
        return local_50;
    }
    uint GetTalentLevel() const
    {
        int local_51 = 0;
        int local_50 = this.GetTalentConfig() ? local_51 : 0;
        return local_50;
    }
    uint GetCurrentLevel() const
    {
        int local_5;
        if (this.GetNode().IsValid())
        {
            TEUIModelWeakRef<FM_TalentNode> local_2 = this.GetNode();
            local_5 = GetCurrentLevel();
        }
        else
        {
            local_5 = 0;
        }
        return local_5;
    }
    uint GetMaxLevel() const
    {
        int local_5;
        if (this.GetNode().IsValid())
        {
            TEUIModelWeakRef<FM_TalentNode> local_2 = this.GetNode();
            local_5 = GetMaxLevel();
        }
        else
        {
            local_5 = 0;
        }
        return local_5;
    }
    TDataObjectPtr<FTalentConfig> GetTalentConfig() const
    {
        int local_54 = 0;
        if (!(this.GetNode().IsValid()))
        {
            return TDataObjectPtr<FTalentConfig>();
        }
        TEUIModelWeakRef<FM_TalentNode> local_2 = this.GetNode();
        if (local_54.GetChoiceBaseIds().IsValidIndex(this.GetChoiceIndex()))
        {
            int local_81 = local_54.GetChoiceBaseIds()[this.GetChoiceIndex()];
            GetDataObjectByGSDataId<FTalentConfig> local_80;
            return local_80.opImplConv();
        }
        return local_54.GetConfig().NodeConfig;
    }
    TDataObjectPtr<FSkillInitConfig> GetSkillInitConfig() const
    {
        if (!(!(this.GetTalentConfig())) && GetSkillConfig())
        {
            return GetSkillConfig();
        }
        return TDataObjectPtr<FSkillInitConfig>();
    }
    ESkillType GetDisplaySkillType() const
    {
        int local_49 = 0;
        if (this.GetTalentConfig() && (local_49 != 0))
        {
            return ESkillType(local_49);
        }
        if (this.GetSkillInitConfig())
        {
            return ESkillType(local_49);
        }
        return ESkillType(0);
    }
    FText GetTalentName() const
    {
        bool local_49 = false;
        bool local_50;
        FText __return;
        if (!(this.GetTalentConfig()))
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
            if (this.GetSkillInitConfig())
            {
            }
            else
            {
                __return = FText();
            }
        }
        return __return;
    }
    FText GetTalentDesc() const
    {
        bool local_49 = false;
        bool local_50;
        FText __return;
        if (!(this.GetTalentConfig()))
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
            if (this.GetSkillInitConfig())
            {
            }
            else
            {
                __return = FText();
            }
        }
        return __return;
    }
    FText GetDescription() const
    {
        bool local_49 = false;
        bool local_50;
        FText __return;
        if (!(this.GetTalentConfig()))
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
            FText local_106;
            if (local_74)
            {
            }
            else
            {
                local_106 = FText();
            }
            __return = local_106;
        }
        return __return;
    }
    FSoftBrush GetIcon() const
    {
        bool local_49 = false;
        USkillConfig local_100;
        FSoftBrush __return;
        if (this.GetTalentConfig() && local_49)
        {
        }
        else
        {
            if (this.GetSkillInitConfig())
            {
                if (unresolved.Icon.IsSet())
                {
                }
                else
                {
                    if (local_100 != nullptr)
                    {
                        FECSEntity local_104 = this.GetContext().GetLocalPlayerPawn();
                        FSkillConfigPresentationData local_216;
                        return local_216.DefaultIcon;
                    }
                }
            }
            __return = FSoftBrush();
        }
        return __return;
    }
    FSoftBrush GetPreviewImage() const
    {
        bool local_49 = false;
        FSoftBrush __return;
        if (this.GetTalentConfig() && local_49)
        {
        }
        else
        {
            if (this.GetSkillInitConfig())
            {
            }
            else
            {
                __return = FSoftBrush();
            }
        }
        return __return;
    }
    UMediaSource GetPreviewMovie() const
    {
        UMediaSource local_50;
        if (this.GetTalentConfig() && (local_50 != nullptr))
        {
            return local_50;
        }
        if (this.GetSkillInitConfig())
        {
            return local_50;
        }
        return nullptr;
    }
    ETalentType GetTalentType() const
    {
        ETalentType local_50;
        if (this.GetTalentConfig())
        {
            ETalentType local_51;
            local_50 = local_51;
        }
        else
        {
            local_50 = ETalentType(0);
        }
        return local_50;
    }
    ETalentDivision GetTalentDivision() const
    {
        ETalentDivision local_50;
        if (this.GetTalentConfig())
        {
            ETalentDivision local_51;
            local_50 = local_51;
        }
        else
        {
            local_50 = ETalentDivision(0);
        }
        return local_50;
    }
    EUnlockType GetUnlockType() const
    {
        EUnlockType local_50;
        if (this.GetTalentConfig())
        {
            EUnlockType local_51;
            local_50 = local_51;
        }
        else
        {
            local_50 = EUnlockType(0);
        }
        return local_50;
    }
    int GetIconStateIndex() const
    {
        switch (int(this.GetStateType()))
        {
        case 1:
        {
            return 0;
        }
        case 2:
        {
            return 1;
        }
        case 3:
        {
            bool local_7 = this.GetNode().IsValid();
            if (!(local_7))
            {
                local_7 = false;
            }
            else
            {
                TEUIModelWeakRef<FM_TalentNode> local_6 = this.GetNode();
                local_7 = HasChoice();
            }
            if (local_7)
            {
                if (this.GetIsEquippedChoice())
                {
                }
                else
                {
                }
                return 3;
            }
            return 2;
        }
        default:
        {
        }
        }
        return 0;
    }
    bool CanUpgrade() const
    {
        bool local_4;
        if (!(this.GetNode().IsValid()))
        {
            local_4 = false;
        }
        else
        {
            local_4 = true;
            TEUIModelWeakRef<FM_TalentNode> local_2 = this.GetNode();
            local_4 = local_4.CanUpgrade();
        }
        return local_4;
    }
    TArray<FItemParamConfig> GetUnlockCost() const
    {
        TDataObjectPtr<FTalentConfig> local_48 = this.GetTalentConfig();
        TArray<FItemParamConfig> local_58;
        if (local_48)
        {
        }
        else
        {
            local_58 = TArray<FItemParamConfig>();
        }
        return local_58;
    }
    bool ShouldShowSelectedBackground() const
    {
        return this.GetbSelect() || this.GetbHover();
    }
    bool GetVisible() const
    {
        bool local_50 = false;
        int local_51;
        if (this.GetTalentConfig())
        {
            local_50 = !local_50;
            local_51 = local_50;
        }
        else
        {
            local_51 = 0;
        }
        return (local_51 != 0);
    }
    bool GetHasChooseTalent() const
    {
        bool local_51;
        if (this.GetTalentConfig())
        {
            local_51 = !(!(GetChooseTalent()));
        }
        else
        {
            local_51 = false;
        }
        return local_51;
    }
    bool GetHasDoubleFormTalent() const
    {
        bool local_51;
        if (this.GetTalentConfig())
        {
            local_51 = !(!(GetDoubleFormTalent()));
        }
        else
        {
            local_51 = false;
        }
        return local_51;
    }
    FText GetLevelText() const
    {
        int local_2 = this.GetMaxLevel();
        if (local_2 > 1)
        {
            int local_1 = this.GetCurrentLevel();
            return FText::FromString(FString().Append(local_1).Append("/").Append(local_2));
        }
        return FText();
    }
    ETalentNodeStateType GetStateType() const
    {
        int local_5;
        if (this.GetNode().IsValid())
        {
            TEUIModelWeakRef<FM_TalentNode> local_2 = this.GetNode();
            local_5 = int(GetStateType());
        }
        else
        {
            local_5 = 1;
        }
        return ETalentNodeStateType(local_5);
    }
    bool GetIsEquippedChoice() const
    {
        bool local_3 = this.GetNode().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelWeakRef<FM_TalentNode> local_2 = this.GetNode();
            local_3 = this.GetChoiceIndex().IsEquippedChoice();
        }
        return local_3;
    }
    bool GetIsUnequippedChoice() const
    {
        bool local_3 = this.GetNode().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelWeakRef<FM_TalentNode> local_2 = this.GetNode();
            local_3 = this.GetChoiceIndex().IsUnequippedChoice();
        }
        return local_3;
    }
    void RebuildSegmentProgress()
    {
        int local_2 = this.GetCurrentLevel();
        int local_1 = this.GetMaxLevel();
        this.GetModify_SegmentProgressModels().Empty(0);
        if (local_1 > 1)
        {
            int local_6 = 0;
            for (; local_6 < local_1; )
            {
                FSegmentBarItemData local_14;
                local_14.IsFinish = (local_2 > local_6);
                FEUIModelContainer::MakeCached local_28;
                this.GetModify_SegmentProgressModels().Add(local_28.opImplConv());
                ++local_6;
            }
        }
        return;
    }
    void OnNodeRuntimeStateChanged()
    {
        this.RebuildSegmentProgress();
        if (this.GetNode().IsValid() && (this.GetOwnerFormulaTreeWidget() != nullptr))
        {
            this.GetOwnerFormulaTreeWidget().UpdateNodeLineStyle(this.GetNode());
        }
        return;
    }
    void PostConstruct()
    {
        this.RebuildSegmentProgress();
        if (this.GetNode().IsValid())
        {
            if ((int(this.GetDisplaySkillType())) != 0)
            {
                this.SetSkillTypeBGVM(TEUIModelRef<FVM_TalentSkillTypeBG>(::FVM_TalentSkillTypeBG::Create(this.GetContext().Manager)));
            }
            TEUIModelWeakRef<FM_TalentNode> local_2 = this.GetNode();
            this.SetRedDotVM(TEUIModelRef<FVM_RedDot>(::FVM_RedDot::Create(this.GetContext().Manager, FRedDotNodeData(GameplayTags::RedDotSystem_Talent_NodeRedDot, GetDataId()))));
        }
        return;
    }
    void UnlockOrUpgradeTalent()
    {
        if (!(this.GetNode()))
        {
            return;
        }
        bool local_3 = false;
        TEUIModelWeakRef<FM_TalentNode> local_2 = this.GetNode();
        if (local_3.CanUpgrade())
        {
            FMsg_TalentUnlockOrUpgradeOpenConfirm local_6;
            FEUIModelRef local_12 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus);
            TEUIModelWeakRef<FM_TalentNode> local_2_2 = this.GetNode();
            TEUIModelWeakRef<FM_TalentNode> local_14;
            local_6.TalentNode = local_14;
            local_6.ChoiceIndex = this.GetChoiceIndex();
        }
        return;
    }
    void ShowHover(const UWidget Widget)
    {
        if (!(this.GetNode().IsValid()))
        {
            return;
        }
        FEUIModelRef local_12 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        FMsg_TalentItemHoverStateChagne local_6;
        local_6.bShow = true;
        local_6.TalentNode = this.GetNode();
        local_6.ChoiceIndex = this.GetChoiceIndex();
        this.SetbHover(true);
        return;
    }
    void OpenDetails()
    {
        if (!(this.GetNode().IsValid()))
        {
            return;
        }
        FEUIModelRef local_12 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        TEUIModelWeakRef<FM_TalentNode> local_2 = this.GetNode();
        FMsg_TalentNodeHoverOpenDetails local_6;
        TEUIModelWeakRef<FM_TalentNode> local_14;
        local_6.TalentNode = local_14;
        local_6.ChoiceIndex = this.GetChoiceIndex();
        return;
    }
    void HideHover()
    {
        FEUIModelRef local_8 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        FMsg_TalentItemHoverStateChagne local_2;
        local_2.bShow = false;
        this.SetbHover(false);
        return;
    }
    void OnTalentNodeHoverOpenDetails(const FMsg_TalentNodeHoverOpenDetails &inout Msg)
    {
        bool local_1 = Msg.TalentNode.IsValid() && this.GetNode().IsValid();
        if (!(local_1))
        {
            local_1 = false;
        }
        else
        {
            TEUIModelWeakRef<FM_TalentNode> local_4 = this.GetNode();
            local_1 = (GetDataId() == GetDataId());
        }
        local_1 = local_1 && (int(Msg.ChoiceIndex) == this.GetChoiceIndex());
        this.SetbSelect(local_1);
        return;
    }
    void OnTalentUpgradeSuccess(const FMsg_TalentUnlockOrUpgradeAnim &inout Msg)
    {
        if (!(this.GetNode().IsValid()))
        {
            return;
        }
        if (Msg.UnlockOrUpgradeTalentNode.Contains(this.GetNode()))
        {
            this.SetUpgradeAnimIndex((this.GetUpgradeAnimIndex() + 1));
        }
        return;
    }
    TEUIModelWeakRef<FM_TalentNode> GetNode() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Node;
    }
    void SetNode(const TEUIModelWeakRef<FM_TalentNode> &inout __Value) property
    {
        TEUIModelWeakRef<FM_TalentNode> local_2;
        local_2 = this.m_Node;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Node = __Value;
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
    bool GetbSelect() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bSelect;
    }
    void SetbSelect(const bool __Value) property
    {
        if (!(this.m_bSelect) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bSelect = __Value;
        return;
    }
    int GetUpgradeAnimIndex() const property
    {
        this.TrackPropertyRead(4);
        return this.m_UpgradeAnimIndex;
    }
    void SetUpgradeAnimIndex(const int __Value) property
    {
        if (this.m_UpgradeAnimIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_UpgradeAnimIndex = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetSegmentProgressModels() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_SegmentProgressModels() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetSegmentProgressModels(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_SegmentProgressModels = __Value;
        return;
    }
    TEUIModelRef<FVM_TalentSkillTypeBG> GetSkillTypeBGVM() const property
    {
        this.TrackPropertyRead(6);
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
        this.MarkPropertyDirty(6);
        this.m_SkillTypeBGVM = __Value;
        return;
    }
    TEUIModelRef<FVM_RedDot> GetRedDotVM() const property
    {
        this.TrackPropertyRead(7);
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
        this.MarkPropertyDirty(7);
        this.m_RedDotVM = __Value;
        return;
    }
    UWidget_TalentUpgradeTree GetOwnerFormulaTreeWidget() const property
    {
        this.TrackPropertyRead(8);
        return this.m_OwnerFormulaTreeWidget;
    }
    void SetOwnerFormulaTreeWidget(const UWidget_TalentUpgradeTree __Value) property
    {
        if (this.m_OwnerFormulaTreeWidget == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        return;
    }
}

struct __GeneratedProperties_FVM_TalentUpgradeItem
{
    UPROPERTY()
    bool IsUnlock;
    UPROPERTY()
    uint UnlockLevel;
    UPROPERTY()
    uint TalentLevel;
    UPROPERTY()
    uint CurrentLevel;
    UPROPERTY()
    uint MaxLevel;
    UPROPERTY()
    TDataObjectPtr<FTalentConfig> TalentConfig;
    UPROPERTY()
    FText TalentName;
    UPROPERTY()
    FText TalentDesc;
    UPROPERTY()
    FText Description;
    UPROPERTY()
    FSoftBrush Icon;
    UPROPERTY()
    FSoftBrush PreviewImage;
    UPROPERTY()
    UMediaSource PreviewMovie = nullptr;
    UPROPERTY()
    ETalentType TalentType;
    UPROPERTY()
    ETalentDivision TalentDivision;
    UPROPERTY()
    EUnlockType UnlockType;
    UPROPERTY()
    int IconStateIndex;
    UPROPERTY()
    bool CanUpgrade;
    UPROPERTY()
    TArray<FItemParamConfig> UnlockCost;
    UPROPERTY()
    bool ShouldShowSelectedBackground;
    UPROPERTY()
    bool Visible;
    UPROPERTY()
    bool HasChooseTalent;
    UPROPERTY()
    bool HasDoubleFormTalent;
    UPROPERTY()
    FText LevelText;
    UPROPERTY()
    ETalentNodeStateType StateType;
    UPROPERTY()
    bool IsEquippedChoice;
    UPROPERTY()
    bool IsUnequippedChoice;
    UPROPERTY()
    TEUIModelRef<FVM_TalentUpgradeItem> Self;


}

namespace FVM_TalentUpgradeItem
{
FVM_TalentUpgradeItem& Create(const UObject ContextObject, const TEUIModelWeakRef<FM_TalentNode> &inout Node, const int ChoiceIndex)
{
    return FVM_TalentUpgradeItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), Node, ChoiceIndex);
}
FVM_TalentUpgradeItem CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelWeakRef<FM_TalentNode> &inout Node, const int ChoiceIndex)
{
    FVM_TalentUpgradeItem __r;
    TEUIModelRef<FVM_TalentUpgradeItem> local_6 = TEUIModelRef<FVM_TalentUpgradeItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TalentUpgradeItem::ModelId, 0, Node, ChoiceIndex));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_TalentUpgradeItem;
}
void __OnNodeRuntimeStateChanged(FVM_TalentUpgradeItem &inout Model)
{
    Model.OnNodeRuntimeStateChanged();
    return;
}
void __OnTalentNodeHoverOpenDetails(FVM_TalentUpgradeItem &inout Model, const FMsg_TalentNodeHoverOpenDetails &inout Message)
{
    Model.OnTalentNodeHoverOpenDetails(Message);
    return;
}
void __OnTalentUpgradeSuccess(FVM_TalentUpgradeItem &inout Model, const FMsg_TalentUnlockOrUpgradeAnim &inout Message)
{
    Model.OnTalentUpgradeSuccess(Message);
    return;
}
TEUIModelWeakRef<FM_TalentNode> __UIGetter_Node(const FVM_TalentUpgradeItem &inout Model)
{
    return Model.GetNode();
}
int __UIGetter_ChoiceIndex(const FVM_TalentUpgradeItem &inout Model)
{
    return Model.GetChoiceIndex();
}
bool __UIGetter_bHover(const FVM_TalentUpgradeItem &inout Model)
{
    return Model.GetbHover();
}
bool __UIGetter_bSelect(const FVM_TalentUpgradeItem &inout Model)
{
    return Model.GetbSelect();
}
TArray<FEUIModelContainer> __UIGetter_SegmentProgressModels(const FVM_TalentUpgradeItem &inout Model)
{
    return Model.GetSegmentProgressModels();
}
TEUIModelRef<FVM_TalentSkillTypeBG> __UIGetter_SkillTypeBGVM(const FVM_TalentUpgradeItem &inout Model)
{
    return Model.GetSkillTypeBGVM();
}
TEUIModelRef<FVM_RedDot> __UIGetter_RedDotVM(const FVM_TalentUpgradeItem &inout Model)
{
    return Model.GetRedDotVM();
}
bool __UIGetter_IsUnlock(const FVM_TalentUpgradeItem &inout Model)
{
    return Model.IsUnlock();
}
uint __UIGetter_UnlockLevel(const FVM_TalentUpgradeItem &inout Model)
{
    return Model.GetUnlockLevel();
}
uint __UIGetter_TalentLevel(const FVM_TalentUpgradeItem &inout Model)
{
    return Model.GetTalentLevel();
}
uint __UIGetter_CurrentLevel(const FVM_TalentUpgradeItem &inout Model)
{
    return Model.GetCurrentLevel();
}
uint __UIGetter_MaxLevel(const FVM_TalentUpgradeItem &inout Model)
{
    return Model.GetMaxLevel();
}
TDataObjectPtr<FTalentConfig> __UIGetter_TalentConfig(const FVM_TalentUpgradeItem &inout Model)
{
    return Model.GetTalentConfig();
}
FText __UIGetter_TalentName(const FVM_TalentUpgradeItem &inout Model)
{
    return Model.GetTalentName();
}
FText __UIGetter_TalentDesc(const FVM_TalentUpgradeItem &inout Model)
{
    return Model.GetTalentDesc();
}
FText __UIGetter_Description(const FVM_TalentUpgradeItem &inout Model)
{
    return Model.GetDescription();
}
FSoftBrush __UIGetter_Icon(const FVM_TalentUpgradeItem &inout Model)
{
    return Model.GetIcon();
}
FSoftBrush __UIGetter_PreviewImage(const FVM_TalentUpgradeItem &inout Model)
{
    return Model.GetPreviewImage();
}
UMediaSource __UIGetter_PreviewMovie(const FVM_TalentUpgradeItem &inout Model)
{
    return Model.GetPreviewMovie();
}
ETalentType __UIGetter_TalentType(const FVM_TalentUpgradeItem &inout Model)
{
    return Model.GetTalentType();
}
ETalentDivision __UIGetter_TalentDivision(const FVM_TalentUpgradeItem &inout Model)
{
    return Model.GetTalentDivision();
}
EUnlockType __UIGetter_UnlockType(const FVM_TalentUpgradeItem &inout Model)
{
    return Model.GetUnlockType();
}
int __UIGetter_IconStateIndex(const FVM_TalentUpgradeItem &inout Model)
{
    return Model.GetIconStateIndex();
}
bool __UIGetter_CanUpgrade(const FVM_TalentUpgradeItem &inout Model)
{
    return Model.CanUpgrade();
}
TArray<FItemParamConfig> __UIGetter_UnlockCost(const FVM_TalentUpgradeItem &inout Model)
{
    return Model.GetUnlockCost();
}
bool __UIGetter_ShouldShowSelectedBackground(const FVM_TalentUpgradeItem &inout Model)
{
    return Model.ShouldShowSelectedBackground();
}
bool __UIGetter_Visible(const FVM_TalentUpgradeItem &inout Model)
{
    return Model.GetVisible();
}
bool __UIGetter_HasChooseTalent(const FVM_TalentUpgradeItem &inout Model)
{
    return Model.GetHasChooseTalent();
}
bool __UIGetter_HasDoubleFormTalent(const FVM_TalentUpgradeItem &inout Model)
{
    return Model.GetHasDoubleFormTalent();
}
FText __UIGetter_LevelText(const FVM_TalentUpgradeItem &inout Model)
{
    return Model.GetLevelText();
}
ETalentNodeStateType __UIGetter_StateType(const FVM_TalentUpgradeItem &inout Model)
{
    return Model.GetStateType();
}
bool __UIGetter_IsEquippedChoice(const FVM_TalentUpgradeItem &inout Model)
{
    return Model.GetIsEquippedChoice();
}
bool __UIGetter_IsUnequippedChoice(const FVM_TalentUpgradeItem &inout Model)
{
    return Model.GetIsUnequippedChoice();
}
TEUIModelRef<FVM_TalentUpgradeItem> __UIGetter_Self(const FVM_TalentUpgradeItem &inout Model)
{
    return TEUIModelRef<FVM_TalentUpgradeItem>(Model);
}
int __IndexOf_Node()
{
    return 0;
}
int __IndexOf_ChoiceIndex()
{
    return 1;
}
int __IndexOf_bHover()
{
    return 2;
}
int __IndexOf_bSelect()
{
    return 3;
}
int __IndexOf_UpgradeAnimIndex()
{
    return 4;
}
int __IndexOf_SegmentProgressModels()
{
    return 5;
}
int __IndexOf_SkillTypeBGVM()
{
    return 6;
}
int __IndexOf_RedDotVM()
{
    return 7;
}
int __IndexOf_OwnerFormulaTreeWidget()
{
    return 8;
}
}
namespace __GeneratedProperties_FVM_TalentUpgradeItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

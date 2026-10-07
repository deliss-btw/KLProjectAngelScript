
namespace FVM_TalentUpgradeConfirm
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature Confirm = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature Cancel = FEUIModelCallbackSignature();

}
struct FVM_TalentUpgradeConfirm : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_TalentNode> m_TalentNode;
    UPROPERTY()
    int m_ChoiceIndex;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_TalentUpgradeDesc>> m_UpgradeDesc;
    UPROPERTY()
    TEUIModelRef<FVM_Common_Center_Spend> m_UpgradeCostVM;
    UPROPERTY()
    bool m_bPendingClose;
    UPROPERTY()
    bool m_bCanUpgrade;
    UPROPERTY()
    bool m_bNeedSpendCoin;
    UPROPERTY()
    FText m_TempContextText;
    UPROPERTY()
    TArray<TEUIModelWeakRef<FM_TalentNode>> m_TalentUpgradeSuccessedTalent;

    FVM_TalentUpgradeConfirm()
    {
        this.m_ChoiceIndex = 0;
        this.m_bPendingClose = false;
        this.m_bCanUpgrade = false;
        this.m_bNeedSpendCoin = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TalentUpgradeConfirm' by default constructor.");
        return;
    }
    FVM_TalentUpgradeConfirm(const FVM_TalentUpgradeConfirm &inout Other)
    {
        this.m_ChoiceIndex = 0;
        this.m_bPendingClose = false;
        this.m_bCanUpgrade = false;
        this.m_bNeedSpendCoin = false;
        this.m_TalentNode = Other.m_TalentNode;
        this.m_ChoiceIndex = int(Other.m_ChoiceIndex);
        this.m_UpgradeDesc = Other.m_UpgradeDesc;
        this.m_UpgradeCostVM = Other.m_UpgradeCostVM;
        this.m_bPendingClose = Other.m_bPendingClose;
        this.m_bCanUpgrade = Other.m_bCanUpgrade;
        this.m_bNeedSpendCoin = Other.m_bNeedSpendCoin;
        this.m_TempContextText = Other.m_TempContextText;
        this.m_TalentUpgradeSuccessedTalent = Other.m_TalentUpgradeSuccessedTalent;
        return;
    }
    FVM_TalentUpgradeConfirm(const TEUIModelRef<FM_TalentNode> &inout InTalentNode)
    {
        this.m_ChoiceIndex = 0;
        this.m_bPendingClose = false;
        this.m_bCanUpgrade = false;
        this.m_bNeedSpendCoin = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTalentNode(InTalentNode);
        return;
    }
    FVM_TalentUpgradeConfirm& opAssign(const FVM_TalentUpgradeConfirm &inout Other)
    {
        this.m_TalentNode = Other.m_TalentNode;
        this.m_ChoiceIndex = int(Other.m_ChoiceIndex);
        this.m_UpgradeDesc = Other.m_UpgradeDesc;
        this.m_UpgradeCostVM = Other.m_UpgradeCostVM;
        this.m_bPendingClose = Other.m_bPendingClose;
        this.m_bCanUpgrade = Other.m_bCanUpgrade;
        this.m_bNeedSpendCoin = Other.m_bNeedSpendCoin;
        this.m_TempContextText = Other.m_TempContextText;
        return Other.m_TalentUpgradeSuccessedTalent;
    }
    void PostConstruct()
    {
        if (!(this.GetTalentNode().IsValid()))
        {
            return;
        }
        TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
        TDataObjectPtr<FTalentConfig> local_52;
        if (!(local_52))
        {
            return;
        }
        this.CreateUpgradeDesc();
        this.CreateUpgradeCostVM();
        bool local_3 = true;
        TEUIModelRef<FM_TalentNode> local_2_2 = this.GetTalentNode();
        this.SetbCanUpgrade(local_3.CanUpgrade());
        return;
    }
    void CreateUpgradeDesc()
    {
        TDataObjectPtr<FTalentConfig> local_58;
        FString local_68;
        if (!(this.GetTalentNode().IsValid()))
        {
            return;
        }
        TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
        int local_5 = GetMaxLevel();
        TEUIModelRef<FM_TalentNode> local_2_2 = this.GetTalentNode();
        int local_4 = GetCurrentLevel();
        if (local_4 >= local_5)
        {
            return;
        }
        this.GetModify_UpgradeDesc().Empty(0);
        int local_9 = local_4 + 1;
        for (; local_9 < local_5; ++local_9)
        {
            int local_7 = this.GetChoiceIndex();
            TEUIModelRef<FM_TalentNode> local_2_3 = this.GetTalentNode();
            local_58.FindTalentByChoiceAndLevel(local_7, local_9);
            if (local_58)
            {
                bool local_3 = (local_9 == (local_4 + 1));
                TEUIModelRef<FVM_TalentUpgradeDesc> local_62 = TEUIModelRef<FVM_TalentUpgradeDesc>(::FVM_TalentUpgradeDesc::Create(this.GetContext().Manager));
                FString local_72 = FString::Format("Lv{0} ", local_9);
                FText local_76;
                if (!(!(local_3)) && GetSkillConfig())
                {
                    local_76 = GetSkillConfig().IsSet() ? FText::FromString((local_72 + local_68)) : FText::FromString((local_72 + local_68));
                }
                else
                {
                    local_76 = FText::FromString((local_72 + local_68));
                }
                local_62.opArrow().SetContextDesc(local_76);
                local_62.opArrow().SetbHighLight(local_3);
                this.GetModify_UpgradeDesc().Add(local_62);
                if (!(this.GetTempContextText().IsEmpty()))
                {
                    this.SetTempContextText(FText::FromString((this.GetTempContextText().ToString() + FString("\n"))));
                }
                if (local_3)
                {
                    this.SetTempContextText(FText::FromString((this.GetTempContextText().ToString() + FString::Format("<Yellow24F>{0}</>", local_76.ToString()))));
                }
                else
                {
                    this.SetTempContextText(FText::FromString((this.GetTempContextText().ToString() + local_76.ToString())));
                }
            }
        }
        return;
    }
    void CreateUpgradeCostVM()
    {
        TArrayConstIterator<FItemParamConfig> local_124;
        int local_361;
        this.SetUpgradeCostVM(TEUIModelRef<FVM_Common_Center_Spend>(::FVM_Common_Center_Spend::Create(this.GetContext().Manager)));
        TEUIModelRef<FM_TalentNode> local_4 = this.GetTalentNode();
        FText local_10;
        local_10.GetNodeName(0);
        TEUIModelRef<FVM_Common_Center_Spend> local_2 = this.GetUpgradeCostVM();
        local_10.SetTitle();
        TEUIModelRef<FVM_Common_Center_Spend> local_2_2 = this.GetUpgradeCostVM();
        local_10.SetContent();
        bool local_11 = true;
        TEUIModelRef<FVM_Common_Center_Spend> local_2_3 = this.GetUpgradeCostVM();
        local_11.SetbNeedCostCoinTitle();
        TEUIModelRef<FM_TalentNode> local_4_2 = this.GetTalentNode();
        int local_12 = GetCurrentLevel() + 1;
        int local_5 = this.GetChoiceIndex();
        TEUIModelRef<FM_TalentNode> local_4_3 = this.GetTalentNode();
        TDataObjectPtr<FTalentConfig> local_62;
        local_62.FindTalentByChoiceAndLevel(local_5, local_12);
        if (!(local_62))
        {
            return;
        }
        int local_63 = 0;
        UGlobalItemSettings local_66 = ::UGlobalItemSettings::Get();
        TDataObjectPtr<FItemConfig> local_90 = local_66.SoulsConfig;
        TArray<TEUIModelRef<FVM_CommonRewardItem>> local_118;
        for (; local_124.CanProceed;)
        {
            const FItemParamConfig& local_132 = local_124.Proceed();
            if (!(local_132.Item))
            {
                continue;
            }
            FItemConfig local_312;
            if ((local_312 == local_90.opImplConv()))
            {
                local_63 = local_63 + int(local_132.Count);
                continue;
            }
            FM_ItemData& local_338 = ::FM_ItemData::Create(this.GetContext().Manager);
            local_338.SetConfig(local_132.Item);
            local_338.SetNum(int(local_132.Count));
            FEUIModelContainer local_352;
            TEUIModelRef<FM_ItemData> local_354 = TEUIModelRef<FM_ItemData>(local_338);
            local_352.AddModel(FEUIModelRef(), false);
            TEUIModelRef<FVM_CommonRewardItem> local_358 = TEUIModelRef<FVM_CommonRewardItem>(::FVM_CommonRewardItem::Create(this.GetContext().Manager, local_352, true));
            local_118.Add(local_358);
        }
        TEUIModelRef<FVM_Common_Center_Spend> local_2_4 = this.GetUpgradeCostVM();
        local_118.SetCostItems();
        local_361 = ::FMS_PlayerInventory::Get(this.GetContext().Manager).GetTotalItemNum(::UGlobalItemSettings::Get().SoulsConfig);
        if (local_63 > local_361)
        {
            local_10 = FText::FromString(FString::Format("<Red18B>{0}</>/{1}", local_361, local_63));
            TEUIModelRef<FVM_Common_Center_Spend> local_2_5 = this.GetUpgradeCostVM();
            local_10.SetCostText();
        }
        else
        {
            local_10 = FText::FromString(FString::Format("{0}/{1}", local_361, local_63));
            TEUIModelRef<FVM_Common_Center_Spend> local_2_6 = this.GetUpgradeCostVM();
            local_10.SetCostText();
        }
        this.SetbNeedSpendCoin((local_63 > 0));
        return;
    }
    FText GetCostTitle() const
    {
        FText local_12;
        if (this.GetUpgradeCostVM().IsValid())
        {
            TEUIModelRef<FVM_Common_Center_Spend> local_2 = this.GetUpgradeCostVM();
            local_12 = GetTitle();
        }
        else
        {
            local_12 = FText();
        }
        return local_12;
    }
    FText GetCostContent() const
    {
        FText local_12;
        if (this.GetUpgradeCostVM().IsValid())
        {
            TEUIModelRef<FVM_Common_Center_Spend> local_2 = this.GetUpgradeCostVM();
            local_12 = GetContent();
        }
        else
        {
            local_12 = FText();
        }
        return local_12;
    }
    FText GetCostText() const
    {
        FText local_12;
        if (this.GetUpgradeCostVM().IsValid())
        {
            TEUIModelRef<FVM_Common_Center_Spend> local_2 = this.GetUpgradeCostVM();
            local_12 = GetCostText();
        }
        else
        {
            local_12 = FText();
        }
        return local_12;
    }
    bool GetNeedCostCoinTitle() const
    {
        bool local_3 = this.GetUpgradeCostVM().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelRef<FVM_Common_Center_Spend> local_2 = this.GetUpgradeCostVM();
            local_3 = GetbNeedCostCoinTitle();
        }
        return local_3;
    }
    TArray<TEUIModelRef<FVM_CommonRewardItem>> GetCostItems() const
    {
        TArray<TEUIModelRef<FVM_CommonRewardItem>> local_12;
        if (this.GetUpgradeCostVM().IsValid())
        {
            TEUIModelRef<FVM_Common_Center_Spend> local_2 = this.GetUpgradeCostVM();
            local_12 = GetCostItems();
        }
        else
        {
            local_12 = TArray<TEUIModelRef<FVM_CommonRewardItem>>();
        }
        return local_12;
    }
    bool GetCanUpgrade() const
    {
        if (!(this.GetTalentNode().IsValid()))
        {
            return false;
        }
        bool local_3 = true;
        TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
        return local_3.CanUpgrade();
    }
    void Confirm()
    {
        if (!(this.GetTalentNode().IsValid()))
        {
            FCommonTipsParam local_12;
            ::CommonPopup::WeakTips(NSLOCTEXT("Talent", "TalentNotUnlocked", "иЇ·е…€и§Јй”ЃеЅ“е‰Ќе¤©иµ‹"), local_12);
            return;
        }
        bool local_3 = true;
        TEUIModelRef<FM_TalentNode> local_2 = this.GetTalentNode();
        if (!(local_3.CanUpgrade()))
        {
            FCommonTipsParam local_12;
            ::CommonPopup::WeakTips(NSLOCTEXT("Talent", "TalentCostNotEnough", "е¤©иµ‹еЌ‡зє§ж‰ЂйњЂиµ„жєђдёЌи¶і"), local_12);
            return;
        }
        if (::FASCommonUtils::IsInCombat(this.GetContext().GetLocalPlayerPawn()))
        {
            FCommonTipsParam local_12;
            ::CommonPopup::WeakTips(NSLOCTEXT("Talent", "TalentCannotUpgradeInCombat", "ж€ж–—дё­ж— жі•еЌ‡зє§е¤©иµ‹"), local_12);
            return;
        }
        FEUIModelRef local_26 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        TEUIModelRef<FM_TalentNode> local_2_2 = this.GetTalentNode();
        FMsg_TalentUnlockOrUpgradeRequest local_20;
        TEUIModelWeakRef<FM_TalentNode> local_28;
        local_20.TalentNode = local_28;
        local_20.ChoiceIndex = this.GetChoiceIndex();
        return;
    }
    void Cancel()
    {
        this.SetbPendingClose(true);
        return;
    }
    void OnTalentUpgradeSuccess(const FMsg_TalentUnlockOrUpgradeReply &inout Msg)
    {
        FCommonTipsParam local_8;
        int local_14 = 0;
        ::CommonPopup::Tips(NSLOCTEXT("Talent", "TalentCannotUpgradeSuccess", "еЌ‡зє§ж€ђеЉџпјЃ"), local_8);
        this.CreateUpgradeDesc();
        this.CreateUpgradeCostVM();
        TEUIModelRef<FM_TalentNode> local_10 = this.GetTalentNode();
        this.SetbCanUpgrade(1.CanUpgrade());
        this.GetModify_TalentUpgradeSuccessedTalent().Append(Msg.UnlockOrUpgradeTalentNode);
        int local_11_2 = 1;
        TEUIModelRef<FM_TalentNode> local_10_2 = this.GetTalentNode();
        if (!(local_11_2.CanUpgrade()))
        {
            FEUIModelRef local_20 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus);
            local_14.UnlockOrUpgradeTalentNode = Msg.UnlockOrUpgradeTalentNode;
            this.SetbPendingClose(true);
        }
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
    const TArray<TEUIModelRef<FVM_TalentUpgradeDesc>> GetUpgradeDesc() const property
    {
        const TArray<TEUIModelRef<FVM_TalentUpgradeDesc>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<TEUIModelRef<FVM_TalentUpgradeDesc>> GetModify_UpgradeDesc() property
    {
        TArray<TEUIModelRef<FVM_TalentUpgradeDesc>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetUpgradeDesc(const TArray<TEUIModelRef<FVM_TalentUpgradeDesc>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_UpgradeDesc = __Value;
        return;
    }
    TEUIModelRef<FVM_Common_Center_Spend> GetUpgradeCostVM() const property
    {
        this.TrackPropertyRead(3);
        return this.m_UpgradeCostVM;
    }
    void SetUpgradeCostVM(const TEUIModelRef<FVM_Common_Center_Spend> &inout __Value) property
    {
        TEUIModelRef<FVM_Common_Center_Spend> local_2;
        local_2 = this.m_UpgradeCostVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_UpgradeCostVM = __Value;
        return;
    }
    bool GetbPendingClose() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bPendingClose;
    }
    void SetbPendingClose(const bool __Value) property
    {
        if (!(this.m_bPendingClose) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bPendingClose = __Value;
        return;
    }
    bool GetbCanUpgrade() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bCanUpgrade;
    }
    void SetbCanUpgrade(const bool __Value) property
    {
        if (!(this.m_bCanUpgrade) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bCanUpgrade = __Value;
        return;
    }
    bool GetbNeedSpendCoin() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bNeedSpendCoin;
    }
    void SetbNeedSpendCoin(const bool __Value) property
    {
        if (!(this.m_bNeedSpendCoin) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bNeedSpendCoin = __Value;
        return;
    }
    const FText GetTempContextText() const property
    {
        const FText __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FText GetModify_TempContextText() property
    {
        FText __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetTempContextText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_TempContextText = __Value;
        return;
    }
    const TArray<TEUIModelWeakRef<FM_TalentNode>> GetTalentUpgradeSuccessedTalent() const property
    {
        const TArray<TEUIModelWeakRef<FM_TalentNode>> __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    TArray<TEUIModelWeakRef<FM_TalentNode>> GetModify_TalentUpgradeSuccessedTalent() property
    {
        TArray<TEUIModelWeakRef<FM_TalentNode>> __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetTalentUpgradeSuccessedTalent(const TArray<TEUIModelWeakRef<FM_TalentNode>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_TalentUpgradeSuccessedTalent = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TalentUpgradeConfirm
{
    UPROPERTY()
    FText CostTitle;
    UPROPERTY()
    FText CostContent;
    UPROPERTY()
    FText CostText;
    UPROPERTY()
    bool NeedCostCoinTitle;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CommonRewardItem>> CostItems;
    UPROPERTY()
    bool CanUpgrade;
    UPROPERTY()
    TEUIModelRef<FVM_TalentUpgradeConfirm> Self;


}

namespace FVM_TalentUpgradeConfirm
{
FVM_TalentUpgradeConfirm& Create(const UObject ContextObject, const TEUIModelRef<FM_TalentNode> &inout TalentNode)
{
    return FVM_TalentUpgradeConfirm::CreateByManager(EUIInternal::GetContextManager(ContextObject), TalentNode);
}
FVM_TalentUpgradeConfirm CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_TalentNode> &inout TalentNode)
{
    FVM_TalentUpgradeConfirm __r;
    TEUIModelRef<FVM_TalentUpgradeConfirm> local_6 = TEUIModelRef<FVM_TalentUpgradeConfirm>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TalentUpgradeConfirm::ModelId, 0, TalentNode));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TalentNode";
    local_14.TypeName = "TEUIModelRef<FM_TalentNode>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ChoiceIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "UpgradeDesc";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_TalentUpgradeDesc>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "UpgradeCostVM";
    local_14.TypeName = "TEUIModelRef<FVM_Common_Center_Spend>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bPendingClose";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bCanUpgrade";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bNeedSpendCoin";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TempContextText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CostTitle";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CostContent";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CostText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "NeedCostCoinTitle";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CostItems";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_CommonRewardItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CanUpgrade";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TalentUpgradeConfirm>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TalentUpgradeConfirm;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__OnTalentUpgradeSuccess";
    local_26.MessageTypeName = "Msg_TalentUnlockOrUpgradeReply";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TalentUpgradeConfirm;
}
void __OnTalentUpgradeSuccess(FVM_TalentUpgradeConfirm &inout Model, const FMsg_TalentUnlockOrUpgradeReply &inout Message)
{
    Model.OnTalentUpgradeSuccess(Message);
    return;
}
TEUIModelRef<FM_TalentNode> __UIGetter_TalentNode(const FVM_TalentUpgradeConfirm &inout Model)
{
    return Model.GetTalentNode();
}
int __UIGetter_ChoiceIndex(const FVM_TalentUpgradeConfirm &inout Model)
{
    return Model.GetChoiceIndex();
}
TArray<TEUIModelRef<FVM_TalentUpgradeDesc>> __UIGetter_UpgradeDesc(const FVM_TalentUpgradeConfirm &inout Model)
{
    return Model.GetUpgradeDesc();
}
TEUIModelRef<FVM_Common_Center_Spend> __UIGetter_UpgradeCostVM(const FVM_TalentUpgradeConfirm &inout Model)
{
    return Model.GetUpgradeCostVM();
}
bool __UIGetter_bPendingClose(const FVM_TalentUpgradeConfirm &inout Model)
{
    return Model.GetbPendingClose();
}
bool __UIGetter_bCanUpgrade(const FVM_TalentUpgradeConfirm &inout Model)
{
    return Model.GetbCanUpgrade();
}
bool __UIGetter_bNeedSpendCoin(const FVM_TalentUpgradeConfirm &inout Model)
{
    return Model.GetbNeedSpendCoin();
}
FText __UIGetter_TempContextText(const FVM_TalentUpgradeConfirm &inout Model)
{
    return Model.GetTempContextText();
}
FText __UIGetter_CostTitle(const FVM_TalentUpgradeConfirm &inout Model)
{
    return Model.GetCostTitle();
}
FText __UIGetter_CostContent(const FVM_TalentUpgradeConfirm &inout Model)
{
    return Model.GetCostContent();
}
FText __UIGetter_CostText(const FVM_TalentUpgradeConfirm &inout Model)
{
    return Model.GetCostText();
}
bool __UIGetter_NeedCostCoinTitle(const FVM_TalentUpgradeConfirm &inout Model)
{
    return Model.GetNeedCostCoinTitle();
}
TArray<TEUIModelRef<FVM_CommonRewardItem>> __UIGetter_CostItems(const FVM_TalentUpgradeConfirm &inout Model)
{
    return Model.GetCostItems();
}
bool __UIGetter_CanUpgrade(const FVM_TalentUpgradeConfirm &inout Model)
{
    return Model.GetCanUpgrade();
}
TEUIModelRef<FVM_TalentUpgradeConfirm> __UIGetter_Self(const FVM_TalentUpgradeConfirm &inout Model)
{
    return TEUIModelRef<FVM_TalentUpgradeConfirm>(Model);
}
int __IndexOf_TalentNode()
{
    return 0;
}
int __IndexOf_ChoiceIndex()
{
    return 1;
}
int __IndexOf_UpgradeDesc()
{
    return 2;
}
int __IndexOf_UpgradeCostVM()
{
    return 3;
}
int __IndexOf_bPendingClose()
{
    return 4;
}
int __IndexOf_bCanUpgrade()
{
    return 5;
}
int __IndexOf_bNeedSpendCoin()
{
    return 6;
}
int __IndexOf_TempContextText()
{
    return 7;
}
int __IndexOf_TalentUpgradeSuccessedTalent()
{
    return 8;
}
}
namespace __GeneratedProperties_FVM_TalentUpgradeConfirm
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}


namespace FVM_WeaponForge
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnWeaponCategorySelected = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnDoForgeButtonClick = FEUIModelCallbackSignature();

}
struct FForgeTreeSorter
{
    FForgeTreeSorter()
    {
        return;
    }
    bool opCall(const TEUIModelWeakRef<FM_ForgeTree> &inout A, const TEUIModelWeakRef<FM_ForgeTree> &inout B)
    {
        if (!(A.IsValid()))
        {
        }
        else
        {
            B.IsValid();
        }
        return (GetConfig().Priority > GetConfig().Priority);
    }
}

struct FForgeItemCostSorter
{
    FForgeItemCostSorter()
    {
        return;
    }
    bool opCall(const FItemParamConfig &inout A, const FItemParamConfig &inout B)
    {
        int local_3 = int(A.Item.opArrow().Rarity);
        int local_4 = int(B.Item.opArrow().Rarity);
        return (local_3 > local_4);
    }
}

struct FVM_WeaponForge : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FMS_Forge> m_ForgeModel;
    UPROPERTY()
    TEUIModelRef<FMS_Craft> m_CraftModel;
    UPROPERTY()
    TEUIModelWeakRef<FM_ForgeNode> m_LastSelectNode;
    UPROPERTY()
    TEUIModelWeakRef<FM_ForgeNode> m_CurrentSelectNode;
    UPROPERTY()
    bool m_bResetSelectItem;
    UPROPERTY()
    int m_SelectedCategoryIndex;
    UPROPERTY()
    TArray<TDataObjectPtr<FVirtualItemConfig>> m_ShowCostTypes;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> m_PopupClass;
    UPROPERTY()
    FText m_WeaponCannotEquipTips;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_Text>> m_MenuBarEntries;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CommonItemBar>> m_DisplayingCostItems;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_ForgeWeaponTitle>> m_CurrentWeaponTitleList;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_ForgeWeaponFormulaTree>> m_CurrentWeaponFormulaTreeList;
    UPROPERTY()
    TEUIModelRef<FVM_ForgeWeaponInfo> m_CurrentWeaponInfo;
    UPROPERTY()
    bool m_IsCurrentSelectItemLock;
    UPROPERTY()
    bool m_bIsCurrentCostInsufficient;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle> m_CurrentWeaponInfoTitle;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> m_CurrentWeaponInfoDetail;
    UPROPERTY()
    TEUIModelRef<FVM_CommonConsume> m_CurrentCommonConsume;
    UPROPERTY()
    bool m_bForgeOrCraft;
    UPROPERTY()
    TArray<EWeaponType> m_WeaponTypes;
    UPROPERTY()
    TMap<uint, TEUIModelWeakRef<FVM_ForgeWeaponFormulaTree>> m_CurrentTreeMap;

    FVM_WeaponForge()
    {
        this.m_SelectedCategoryIndex = 0;
        this.m_bForgeOrCraft = false;
        this.m_bResetSelectItem = false;
        this.m_IsCurrentSelectItemLock = false;
        this.m_bIsCurrentCostInsufficient = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_WeaponForge(const FVM_WeaponForge &inout Other)
    {
        this.m_SelectedCategoryIndex = 0;
        this.m_bForgeOrCraft = false;
        this.m_bResetSelectItem = false;
        this.m_IsCurrentSelectItemLock = false;
        this.m_bIsCurrentCostInsufficient = false;
        this.m_ForgeModel = Other.m_ForgeModel;
        this.m_CraftModel = Other.m_CraftModel;
        this.m_LastSelectNode = Other.m_LastSelectNode;
        this.m_CurrentSelectNode = Other.m_CurrentSelectNode;
        this.m_bResetSelectItem = Other.m_bResetSelectItem;
        this.m_SelectedCategoryIndex = int(Other.m_SelectedCategoryIndex);
        this.m_ShowCostTypes = Other.m_ShowCostTypes;
        this.m_PopupClass = Other.m_PopupClass;
        this.m_WeaponCannotEquipTips = Other.m_WeaponCannotEquipTips;
        this.m_MenuBarEntries = Other.m_MenuBarEntries;
        this.m_DisplayingCostItems = Other.m_DisplayingCostItems;
        this.m_CurrentWeaponTitleList = Other.m_CurrentWeaponTitleList;
        this.m_CurrentWeaponFormulaTreeList = Other.m_CurrentWeaponFormulaTreeList;
        this.m_CurrentWeaponInfo = Other.m_CurrentWeaponInfo;
        this.m_IsCurrentSelectItemLock = Other.m_IsCurrentSelectItemLock;
        this.m_bIsCurrentCostInsufficient = Other.m_bIsCurrentCostInsufficient;
        this.m_CurrentWeaponInfoTitle = Other.m_CurrentWeaponInfoTitle;
        this.m_CurrentWeaponInfoDetail = Other.m_CurrentWeaponInfoDetail;
        this.m_CurrentCommonConsume = Other.m_CurrentCommonConsume;
        this.m_bForgeOrCraft = Other.m_bForgeOrCraft;
        this.m_WeaponTypes = Other.m_WeaponTypes;
        this.m_CurrentTreeMap = Other.m_CurrentTreeMap;
        return;
    }
    FVM_WeaponForge& opAssign(const FVM_WeaponForge &inout Other)
    {
        this.m_ForgeModel = Other.m_ForgeModel;
        this.m_CraftModel = Other.m_CraftModel;
        this.m_LastSelectNode = Other.m_LastSelectNode;
        this.m_CurrentSelectNode = Other.m_CurrentSelectNode;
        this.m_bResetSelectItem = Other.m_bResetSelectItem;
        this.m_SelectedCategoryIndex = int(Other.m_SelectedCategoryIndex);
        this.m_ShowCostTypes = Other.m_ShowCostTypes;
        this.m_PopupClass = Other.m_PopupClass;
        this.m_WeaponCannotEquipTips = Other.m_WeaponCannotEquipTips;
        this.m_MenuBarEntries = Other.m_MenuBarEntries;
        this.m_DisplayingCostItems = Other.m_DisplayingCostItems;
        this.m_CurrentWeaponTitleList = Other.m_CurrentWeaponTitleList;
        this.m_CurrentWeaponFormulaTreeList = Other.m_CurrentWeaponFormulaTreeList;
        this.m_CurrentWeaponInfo = Other.m_CurrentWeaponInfo;
        this.m_IsCurrentSelectItemLock = Other.m_IsCurrentSelectItemLock;
        this.m_bIsCurrentCostInsufficient = Other.m_bIsCurrentCostInsufficient;
        this.m_CurrentWeaponInfoTitle = Other.m_CurrentWeaponInfoTitle;
        this.m_CurrentWeaponInfoDetail = Other.m_CurrentWeaponInfoDetail;
        this.m_CurrentCommonConsume = Other.m_CurrentCommonConsume;
        this.m_bForgeOrCraft = Other.m_bForgeOrCraft;
        this.m_WeaponTypes = Other.m_WeaponTypes;
        return Other.m_CurrentTreeMap;
    }
    void LoadConfig(const FConfigVM_WeaponForge &inout InConfig)
    {
        this.SetPopupClass(InConfig.PopupClass);
        this.SetWeaponCannotEquipTips(InConfig.WeaponCannotEquipTips);
        this.SetShowCostTypes(InConfig.ShowCostTypes);
        return;
    }
    void PostConstruct()
    {
        this.SetForgeModel(TEUIModelRef<FMS_Forge>(::FMS_Forge::Get(this.GetContext().Manager)));
        this.SetCraftModel(TEUIModelRef<FMS_Craft>(::FMS_Craft::Get(this.GetContext().Manager)));
        this.SetWeaponTypes(this.ResolveVisibleWeaponTypes());
        this.GetModify_MenuBarEntries().SetNum(this.GetWeaponTypes().Num());
        int local_10 = 0;
        for (; local_10 < this.GetWeaponTypes().Num(); )
        {
            this.GetModify_MenuBarEntries()[local_10] = TEUIModelRef<FVM_Text>(::FVM_Text::Create(this.GetContext().Manager, ::FASCommonUtils::GetWeaponTypeDisplayName(EWeaponType(this.GetWeaponTypes()[local_10]))));
            ++local_10;
        }
        this.SetSelectedCategoryIndex(this.ResolveDefaultCategoryIndex());
        this.UpdateListDisplay();
        this.UpdateInfoDisplay();
        return;
    }
    void PostLoad()
    {
        for (auto& local_16 : this.GetShowCostTypes())
        {
            local_16;
            FVM_CommonItemBar& local_18 = ::FVM_CommonItemBar::Create(this.GetContext().Manager);
            CastTo local_22;
            local_18.SetItemData(::FMS_PlayerInventory::Get(this.GetContext().Manager).GetSumItem(local_22.opCall()));
            this.GetModify_DisplayingCostItems().Add(TEUIModelRef<FVM_CommonItemBar>(local_18));
        }
        return;
    }
    EWeaponType GetCurSelectedWeaponType()
    {
        EWeaponType local_3;
        if (this.GetWeaponTypes().IsValidIndex(this.GetSelectedCategoryIndex()))
        {
            local_3 = this.GetWeaponTypes()[this.GetSelectedCategoryIndex()];
        }
        else
        {
            local_3 = EWeaponType(0);
        }
        return local_3;
    }
    TArray<EWeaponType> ResolveVisibleWeaponTypes()
    {
        bool local_83 = false;
        TArray<EWeaponType> local_8 = ::ForgeCommonUtil::GetWeaponTypeForgePriorityList();
        TArray<EWeaponType> local_12;
        FMS_PlayerAvatarData& local_14 = ::FMS_PlayerAvatarData::Get(this.GetContext().Manager);
        for (auto& local_34 : local_14.GetOwnedAvatars())
        {
            local_34;
            if (!(IsValid()))
            {
                continue;
            }
            TDataObjectPtr<FAvatarPrefabConfig> local_58 = GetAvatarConfig();
            if (!(local_58) || local_83 || !(local_14.IsAvatarUnlocked(local_58)))
            {
                continue;
            }
        }
        TArray<EWeaponType> local_88;
        for (auto local_101 : local_8)
        {
            if (local_12.Contains(local_101))
            {
                local_88.Add(local_101);
            }
        }
        if ((local_88.Num()) == 0)
        {
            XLog(ELog(67), "[VM_WeaponForge]ResolveVisibleWeaponTypes: no unlocked weapon type, fallback to full priority list.");
            return local_8;
        }
        return local_88;
    }
    int ResolveDefaultCategoryIndex()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    void UpdateListDisplay()
    {
        this.GetModify_CurrentWeaponTitleList().Reset(0);
        this.GetModify_CurrentWeaponFormulaTreeList().Reset(0);
        this.GetModify_CurrentTreeMap().Reset();
        int local_9 = int(this.GetCurSelectedWeaponType());
        TEUIModelRef<FMS_Forge> local_8 = this.GetForgeModel();
        TArray<TEUIModelWeakRef<FM_ForgeTree>> local_14;
        local_14.GetForgeTreeListByWeaponType();
        int local_17 = 0;
        for (; local_17 < local_14.Num(); ++local_17)
        {
            if (local_14[local_17].IsValid())
            {
                const FForgeTreeConfig& local_22 = GetConfig();
                FText local_34;
                if (CheckValid())
                {
                    local_34 = local_22.ForgeTreeName;
                }
                else
                {
                    local_34 = NSLOCTEXT("WeaponForge", "ForgeTreeInvalidTitleText", "???");
                }
                FSoftBrush local_124;
                if (CheckValid())
                {
                    local_124 = local_22.ForgeTreeImage;
                }
                else
                {
                    local_124 = local_22.ForgeTreeHiddenImage;
                }
                float32 local_127 = ::ForgeCommonUtil::GetForgeTreeBranchWidth(EForgeTreeBranchType(GetBranchType()));
                this.GetModify_CurrentWeaponTitleList().Add(TEUIModelRef<FVM_ForgeWeaponTitle>(::FVM_ForgeWeaponTitle::Create(this.GetContext().Manager, (int(GetBranchType()) - 1), local_124, local_34, local_127)));
                TEUIModelWeakRef<FM_ForgeTree> local_132;
                TEUIModelRef<FVM_ForgeWeaponFormulaTree> local_136 = TEUIModelRef<FVM_ForgeWeaponFormulaTree>(::FVM_ForgeWeaponFormulaTree::Create(this.GetContext().Manager, (TEUIModelWeakRef<FVM_WeaponForge>(this)), local_132, local_17, local_127));
                this.GetModify_CurrentWeaponFormulaTreeList().Add(local_136);
            }
        }
        return;
    }
    void UpdateInfoDisplay()
    {
        if (this.GetCurrentSelectNode().IsValid())
        {
            FM_ForgeNode& local_6;
            TEUIModelWeakRef<FM_ForgeNode> local_2 = this.GetCurrentSelectNode();
            if (local_6)
            {
                if (local_6.CheckValid())
                {
                    this.SetCurrentWeaponInfo(TEUIModelRef<FVM_ForgeWeaponInfo>(::FVM_ForgeWeaponInfo::Create(this.GetContext().Manager, (TEUIModelWeakRef<FM_ForgeNode>(local_6)))));
                    this.SetIsCurrentSelectItemLock(int(local_6.GetStateType()) == 2 || (int(local_6.GetStateType()) == 3));
                    this.SetCurrentWeaponInfoTitle(TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle>(::FVM_AvatarEquipmentItemInfoTitle::Create(this.GetContext().Manager, local_6.GetCurEquipmentInfo())));
                    TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> local_20 = TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail>(::FVM_AvatarEquipmentItemInfoDetail::Create(this.GetContext().Manager, local_6.GetCurEquipmentInfo()));
                    this.SetCurrentWeaponInfoDetail(local_20);
                    TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> local_20_2 = this.GetCurrentWeaponInfoDetail();
                    EnableShowRandomTraitText();
                    TArray<FRewardItemEntry> local_24;
                    TArray<FItemParamConfig> local_28;
                    if (int(local_6.GetStateType()) == 1)
                    {
                        local_28 = local_6.GetConfig().Cost;
                    }
                    else
                    {
                        if (int(local_6.GetStateType()) == 0)
                        {
                            if (local_6.GetConfig().GetCraft())
                            {
                            }
                        }
                    }
                    for (auto& local_44 : local_28)
                    {
                        local_24.Add(FRewardItemEntry(local_44.Item.opArrow().DataId, int(local_44.Count)));
                    }
                    this.SetCurrentCommonConsume(TEUIModelRef<FVM_CommonConsume>(::FVM_CommonConsume::Create(this.GetContext().Manager, local_24)));
                    if (int(local_6.GetStateType()) == 1)
                    {
                        this.SetbForgeOrCraft(true);
                    }
                    else
                    {
                        if (int(local_6.GetStateType()) == 0)
                        {
                            this.SetbForgeOrCraft(false);
                        }
                    }
                    this.RefreshForgeAffordability();
                }
            }
        }
        return;
    }
    bool IsCurrentCostInsufficient()
    {
        int local_6 = 0;
        int local_13;
        if (!(this.GetCurrentSelectNode().IsValid()))
        {
            return false;
        }
        TEUIModelWeakRef<FM_ForgeNode> local_2 = this.GetCurrentSelectNode();
        if (!(local_6.CheckValid()))
        {
            return false;
        }
        TArray<FItemParamConfig> local_10;
        if (int(local_6.GetStateType()) == 1)
        {
            local_10 = local_6.GetConfig().Cost;
        }
        else
        {
            if (int(local_6.GetStateType()) == 0)
            {
                if (!(local_6.GetConfig().GetCraft()))
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
        FMS_PlayerInventory& local_16 = ::FMS_PlayerInventory::Get(this.GetContext().Manager);
        for (auto& local_30 : local_10)
        {
            if (!(local_30.Item))
            {
                continue;
            }
            TEUIModelRef<FM_ItemData> local_34 = local_16.GetSumItem(local_30.Item);
            if (local_34.IsValid())
            {
                local_13 = GetNum();
            }
            else
            {
                local_13 = 0;
            }
            if (local_13 < (int(local_30.Count)))
            {
                return true;
            }
        }
        return false;
    }
    void RefreshForgeAffordability()
    {
        this.SetbIsCurrentCostInsufficient(this.IsCurrentCostInsufficient());
        return;
    }
    FSoftBrush GetCurrentWeaponPreivewImage() const
    {
        FSoftBrush local_48;
        if (this.GetCurrentWeaponInfo().IsValid())
        {
            TEUIModelRef<FVM_ForgeWeaponInfo> local_2 = this.GetCurrentWeaponInfo();
            local_48.GetWeaponPreivewImage();
            return local_48;
        }
        return local_48;
    }
    bool GetCurrentWeaponIsUnlock() const
    {
        bool local_3 = this.GetCurrentWeaponInfo().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelRef<FVM_ForgeWeaponInfo> local_2 = this.GetCurrentWeaponInfo();
            local_3 = GetIsUnlock();
        }
        return local_3;
    }
    ESlateVisibility GetCurrentWeaponDetailMaskBgVisibility() const
    {
        int local_2;
        if (this.GetCurrentWeaponIsUnlock())
        {
            local_2 = 1;
        }
        else
        {
            local_2 = 4;
        }
        return ESlateVisibility(local_2);
    }
    void OnWeaponCategorySelected(const int Index)
    {
        this.SetSelectedCategoryIndex(Index);
        return;
    }
    void OnSelectedCategoryIndexChanged()
    {
        TEUIModelRef<FMS_Forge> local_2 = this.GetForgeModel();
        this.GetSelectedCategoryIndex().SetLastSelectedCategoryIndex();
        this.SetbResetSelectItem(true);
        this.UpdateListDisplay();
        return;
    }
    void SetNodeItemSelected(const TEUIModelWeakRef<FM_ForgeNode> &inout Node, const bool bSel)
    {
        if (!(Node.IsValid()))
        {
            return;
        }
        TEUIModelWeakRef<FVM_ForgeWeaponFormulaTree> local_4;
        if (this.GetCurrentTreeMap().Find(GetTreeId(), local_4) && local_4.IsValid())
        {
            TEUIModelWeakRef<FVM_ForgeWeaponItem> local_8;
            if (GetItemNodeMap().Find(Node, local_8) && local_8.IsValid())
            {
                bSel.SetbSelected();
            }
        }
        return;
    }
    void ApplyCurrentSelectNode(const TEUIModelWeakRef<FM_ForgeNode> &inout NewNode)
    {
        if ((this.GetCurrentSelectNode() == NewNode.opImplConv()))
        {
            return;
        }
        this.SetNodeItemSelected(this.GetCurrentSelectNode(), false);
        this.SetLastSelectNode(this.GetCurrentSelectNode());
        this.SetCurrentSelectNode(NewNode);
        this.SetNodeItemSelected(this.GetCurrentSelectNode(), true);
        return;
    }
    void OnForgeNodeItemClick(const FMsg_ForgeNodeItemClick &inout Msg)
    {
        if (Msg.ItemNodeM.IsValid())
        {
            this.ApplyCurrentSelectNode(Msg.ItemNodeM);
        }
        return;
    }
    void OnForgeTreeUpdateFinish(const FMsg_ForgeTreeUpdateFinish &inout Msg)
    {
        bool local_1;
        if (!(Msg.FormulaTreeVM.IsValid()))
        {
            local_1 = false;
        }
        else
        {
            TEUIModelWeakRef<FM_ForgeTree> local_4;
            local_4.GetTreeM();
            local_1 = local_4.IsValid();
        }
        if (local_1)
        {
            TEUIModelWeakRef<FM_ForgeTree> local_4;
            local_4.GetTreeM();
            this.GetModify_CurrentTreeMap().Add(GetTreeId(), Msg.FormulaTreeVM);
        }
        if (int(Msg.TreeIndex) == 0 && (!(this.GetCurrentSelectNode().IsValid()) || this.GetbResetSelectItem()))
        {
            if (Msg.FirstItemNodeM.IsValid())
            {
                this.SetbResetSelectItem(false);
                this.ApplyCurrentSelectNode(Msg.FirstItemNodeM);
            }
        }
        return;
    }
    void OnCurrentSelectNodeChanged()
    {
        this.UpdateInfoDisplay();
        return;
    }
    void OnFMsg_ForgeNodeDataUpdate(const FMsg_ForgeNodeDataUpdate &inout Msg)
    {
        bool local_5 = false;
        bool local_1 = Msg.NodeM.IsValid() && this.GetCurrentSelectNode().IsValid();
        if (local_1)
        {
            local_1 = !local_1;
            TEUIModelWeakRef<FM_ForgeNode> local_4 = this.GetCurrentSelectNode();
            local_5 = !local_5;
            if (local_1 == local_5)
            {
                this.UpdateInfoDisplay();
            }
        }
        return;
    }
    void OnFMsg_ForgeTreeDataUpdate(const FMsg_ForgeTreeDataUpdate &inout Msg)
    {
        this.SetbResetSelectItem(false);
        this.UpdateListDisplay();
        return;
    }
    void OnPlayerInventoryChanged(const FMsg_PlayerInventoryChanged &inout Msg)
    {
        this.RefreshForgeAffordability();
        return;
    }
    void OnDoForgeButtonClick()
    {
        if (this.GetCurrentSelectNode().IsValid())
        {
            FM_ForgeNode& local_6;
            TEUIModelWeakRef<FM_ForgeNode> local_2 = this.GetCurrentSelectNode();
            if (local_6)
            {
                if (local_6.CheckValid())
                {
                    if ((int(local_6.GetStateType())) == 1)
                    {
                        TEUIModelRef<FMS_Forge> local_12 = this.GetForgeModel();
                        local_6.GetTreeId().GS_RequestForge(local_6.GetDataId());
                    }
                    else
                    {
                        if ((int(local_6.GetStateType())) == 0)
                        {
                            if (local_6.GetConfig().GetCraft())
                            {
                                FCraftConfig local_16;
                                TEUIModelRef<FMS_Craft> local_18 = this.GetCraftModel();
                                int(local_16.DataId).GS_RequestCraft(1);
                            }
                        }
                        else
                        {
                        }
                    }
                }
            }
        }
        return;
    }
    void ShowCraftResult(const FMsg_CraftResult &inout Result)
    {
        UWidget_EquipmentCraftPopup local_30;
        if (Result.Items.Num() > 0)
        {
            TEUIModelRef<FM_Equipment> local_8 = ::FMS_EquipmentDataCache::Get(this.GetContext().Manager).GetEquipment(Result.Items[0].ItemGuid);
            if (local_8.opArrow().GetEquipmentConfig())
            {
                FVM_EquipmentInfo& local_12 = ::FVM_EquipmentInfo::Create(this.GetContext().Manager, local_8);
                for (auto& local_26 : local_12.GetEquipmentTraits())
                {
                    local_26;
                    TEUIModelRef<FM_Trait> local_28;
                    local_28.GetTrait();
                    GetbIsRandomTrait().SetbHighlight();
                }
                local_30 = (Cast<UWidget_EquipmentCraftPopup>(FEUIWidget::AddWidgetByClass(this.GetContext().UELocalPlayer, this.GetPopupClass(), FEUIModelRef(local_12)).RequireWidget()));
                if (local_30 != nullptr)
                {
                    local_30.CannotEquipTips = this.GetWeaponCannotEquipTips();
                }
            }
        }
        return;
    }
    TEUIModelRef<FMS_Forge> GetForgeModel() const property
    {
        this.TrackPropertyRead(0);
        return this.m_ForgeModel;
    }
    void SetForgeModel(const TEUIModelRef<FMS_Forge> &inout __Value) property
    {
        TEUIModelRef<FMS_Forge> local_2;
        local_2 = this.m_ForgeModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ForgeModel = __Value;
        return;
    }
    TEUIModelRef<FMS_Craft> GetCraftModel() const property
    {
        this.TrackPropertyRead(1);
        return this.m_CraftModel;
    }
    void SetCraftModel(const TEUIModelRef<FMS_Craft> &inout __Value) property
    {
        TEUIModelRef<FMS_Craft> local_2;
        local_2 = this.m_CraftModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CraftModel = __Value;
        return;
    }
    TEUIModelWeakRef<FM_ForgeNode> GetLastSelectNode() const property
    {
        this.TrackPropertyRead(2);
        return this.m_LastSelectNode;
    }
    void SetLastSelectNode(const TEUIModelWeakRef<FM_ForgeNode> &inout __Value) property
    {
        TEUIModelWeakRef<FM_ForgeNode> local_2;
        local_2 = this.m_LastSelectNode;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_LastSelectNode = __Value;
        return;
    }
    TEUIModelWeakRef<FM_ForgeNode> GetCurrentSelectNode() const property
    {
        this.TrackPropertyRead(3);
        return this.m_CurrentSelectNode;
    }
    void SetCurrentSelectNode(const TEUIModelWeakRef<FM_ForgeNode> &inout __Value) property
    {
        TEUIModelWeakRef<FM_ForgeNode> local_2;
        local_2 = this.m_CurrentSelectNode;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CurrentSelectNode = __Value;
        return;
    }
    bool GetbResetSelectItem() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bResetSelectItem;
    }
    void SetbResetSelectItem(const bool __Value) property
    {
        if (!(this.m_bResetSelectItem) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bResetSelectItem = __Value;
        return;
    }
    int GetSelectedCategoryIndex() const property
    {
        this.TrackPropertyRead(5);
        return this.m_SelectedCategoryIndex;
    }
    void SetSelectedCategoryIndex(const int __Value) property
    {
        if (this.m_SelectedCategoryIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_SelectedCategoryIndex = __Value;
        return;
    }
    const TArray<TDataObjectPtr<FVirtualItemConfig>> GetShowCostTypes() const property
    {
        const TArray<TDataObjectPtr<FVirtualItemConfig>> __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    TArray<TDataObjectPtr<FVirtualItemConfig>> GetModify_ShowCostTypes() property
    {
        TArray<TDataObjectPtr<FVirtualItemConfig>> __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetShowCostTypes(const TArray<TDataObjectPtr<FVirtualItemConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_ShowCostTypes = __Value;
        return;
    }
    TSoftClassPtr<UEUIUserWidget> GetPopupClass() const property
    {
        this.TrackPropertyRead(7);
        return this.m_PopupClass;
    }
    void SetPopupClass(const TSoftClassPtr<UEUIUserWidget> &inout __Value) property
    {
        if ((this.m_PopupClass == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_PopupClass = __Value;
        return;
    }
    const FText GetWeaponCannotEquipTips() const property
    {
        const FText __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    FText GetModify_WeaponCannotEquipTips() property
    {
        FText __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetWeaponCannotEquipTips(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_WeaponCannotEquipTips = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_Text>> GetMenuBarEntries() const property
    {
        const TArray<TEUIModelRef<FVM_Text>> __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    TArray<TEUIModelRef<FVM_Text>> GetModify_MenuBarEntries() property
    {
        TArray<TEUIModelRef<FVM_Text>> __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetMenuBarEntries(const TArray<TEUIModelRef<FVM_Text>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_MenuBarEntries = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_CommonItemBar>> GetDisplayingCostItems() const property
    {
        const TArray<TEUIModelRef<FVM_CommonItemBar>> __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    TArray<TEUIModelRef<FVM_CommonItemBar>> GetModify_DisplayingCostItems() property
    {
        TArray<TEUIModelRef<FVM_CommonItemBar>> __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetDisplayingCostItems(const TArray<TEUIModelRef<FVM_CommonItemBar>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_DisplayingCostItems = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_ForgeWeaponTitle>> GetCurrentWeaponTitleList() const property
    {
        const TArray<TEUIModelRef<FVM_ForgeWeaponTitle>> __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    TArray<TEUIModelRef<FVM_ForgeWeaponTitle>> GetModify_CurrentWeaponTitleList() property
    {
        TArray<TEUIModelRef<FVM_ForgeWeaponTitle>> __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetCurrentWeaponTitleList(const TArray<TEUIModelRef<FVM_ForgeWeaponTitle>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_CurrentWeaponTitleList = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_ForgeWeaponFormulaTree>> GetCurrentWeaponFormulaTreeList() const property
    {
        const TArray<TEUIModelRef<FVM_ForgeWeaponFormulaTree>> __r;
        this.TrackPropertyRead(12);
        return __r;
    }
    TArray<TEUIModelRef<FVM_ForgeWeaponFormulaTree>> GetModify_CurrentWeaponFormulaTreeList() property
    {
        TArray<TEUIModelRef<FVM_ForgeWeaponFormulaTree>> __r;
        this.MarkPropertyDirty(12);
        return __r;
    }
    void SetCurrentWeaponFormulaTreeList(const TArray<TEUIModelRef<FVM_ForgeWeaponFormulaTree>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_CurrentWeaponFormulaTreeList = __Value;
        return;
    }
    TEUIModelRef<FVM_ForgeWeaponInfo> GetCurrentWeaponInfo() const property
    {
        this.TrackPropertyRead(13);
        return this.m_CurrentWeaponInfo;
    }
    void SetCurrentWeaponInfo(const TEUIModelRef<FVM_ForgeWeaponInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_ForgeWeaponInfo> local_2;
        local_2 = this.m_CurrentWeaponInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_CurrentWeaponInfo = __Value;
        return;
    }
    bool GetIsCurrentSelectItemLock() const property
    {
        this.TrackPropertyRead(14);
        return this.m_IsCurrentSelectItemLock;
    }
    void SetIsCurrentSelectItemLock(const bool __Value) property
    {
        if (!(this.m_IsCurrentSelectItemLock) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_IsCurrentSelectItemLock = __Value;
        return;
    }
    bool GetbIsCurrentCostInsufficient() const property
    {
        this.TrackPropertyRead(15);
        return this.m_bIsCurrentCostInsufficient;
    }
    void SetbIsCurrentCostInsufficient(const bool __Value) property
    {
        if (!(this.m_bIsCurrentCostInsufficient) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_bIsCurrentCostInsufficient = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle> GetCurrentWeaponInfoTitle() const property
    {
        this.TrackPropertyRead(16);
        return this.m_CurrentWeaponInfoTitle;
    }
    void SetCurrentWeaponInfoTitle(const TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle> local_2;
        local_2 = this.m_CurrentWeaponInfoTitle;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_CurrentWeaponInfoTitle = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> GetCurrentWeaponInfoDetail() const property
    {
        this.TrackPropertyRead(17);
        return this.m_CurrentWeaponInfoDetail;
    }
    void SetCurrentWeaponInfoDetail(const TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> local_2;
        local_2 = this.m_CurrentWeaponInfoDetail;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_CurrentWeaponInfoDetail = __Value;
        return;
    }
    TEUIModelRef<FVM_CommonConsume> GetCurrentCommonConsume() const property
    {
        this.TrackPropertyRead(18);
        return this.m_CurrentCommonConsume;
    }
    void SetCurrentCommonConsume(const TEUIModelRef<FVM_CommonConsume> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonConsume> local_2;
        local_2 = this.m_CurrentCommonConsume;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(18);
        this.m_CurrentCommonConsume = __Value;
        return;
    }
    bool GetbForgeOrCraft() const property
    {
        this.TrackPropertyRead(19);
        return this.m_bForgeOrCraft;
    }
    void SetbForgeOrCraft(const bool __Value) property
    {
        if (!(this.m_bForgeOrCraft) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(19);
        this.m_bForgeOrCraft = __Value;
        return;
    }
    const TArray<EWeaponType> GetWeaponTypes() const property
    {
        const TArray<EWeaponType> __r;
        this.TrackPropertyRead(20);
        return __r;
    }
    TArray<EWeaponType> GetModify_WeaponTypes() property
    {
        TArray<EWeaponType> __r;
        this.MarkPropertyDirty(20);
        return __r;
    }
    void SetWeaponTypes(const TArray<EWeaponType> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(20);
        this.m_WeaponTypes = __Value;
        return;
    }
    const TMap<uint, TEUIModelWeakRef<FVM_ForgeWeaponFormulaTree>> GetCurrentTreeMap() const property
    {
        const TMap<uint, TEUIModelWeakRef<FVM_ForgeWeaponFormulaTree>> __r;
        this.TrackPropertyRead(21);
        return __r;
    }
    TMap<uint, TEUIModelWeakRef<FVM_ForgeWeaponFormulaTree>> GetModify_CurrentTreeMap() property
    {
        TMap<uint, TEUIModelWeakRef<FVM_ForgeWeaponFormulaTree>> __r;
        this.MarkPropertyDirty(21);
        return __r;
    }
    void SetCurrentTreeMap(const TMap<uint, TEUIModelWeakRef<FVM_ForgeWeaponFormulaTree>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(21);
        this.m_CurrentTreeMap = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_WeaponForge
{
    UPROPERTY()
    FSoftBrush CurrentWeaponPreivewImage;
    UPROPERTY()
    bool CurrentWeaponIsUnlock;
    UPROPERTY()
    ESlateVisibility CurrentWeaponDetailMaskBgVisibility;
    UPROPERTY()
    TEUIModelRef<FVM_WeaponForge> Self;


}

namespace FVM_WeaponForge
{
FVM_WeaponForge& Create(const UObject ContextObject)
{
    return FVM_WeaponForge::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_WeaponForge CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_WeaponForge __r;
    TEUIModelRef<FVM_WeaponForge> local_6 = TEUIModelRef<FVM_WeaponForge>(EUIInternal::MakeModelWithManager(Manager, FVM_WeaponForge::ModelId));
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
    local_14.PropertyName = "MenuBarEntries";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_Text>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayingCostItems";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_CommonItemBar>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentWeaponTitleList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_ForgeWeaponTitle>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentWeaponFormulaTreeList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_ForgeWeaponFormulaTree>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentWeaponInfo";
    local_14.TypeName = "TEUIModelRef<FVM_ForgeWeaponInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsCurrentSelectItemLock";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsCurrentCostInsufficient";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentWeaponInfoTitle";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentWeaponInfoDetail";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentCommonConsume";
    local_14.TypeName = "TEUIModelRef<FVM_CommonConsume>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bForgeOrCraft";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentWeaponPreivewImage";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentWeaponIsUnlock";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentWeaponDetailMaskBgVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_WeaponForge>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_WeaponForge;
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__OnSelectedCategoryIndexChanged";
    local_24.DirtyFlags.Set(FVM_WeaponForge::__IndexOf_SelectedCategoryIndex());
    Result.DirtyFunctions.Add(local_24);
    FEUIModelMsgHandleDefine local_34;
    local_34.FunctionName = "__OnForgeNodeItemClick";
    local_34.MessageTypeName = "Msg_ForgeNodeItemClick";
    local_34.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_34);
    local_34.FunctionName = "__OnForgeTreeUpdateFinish";
    local_34.MessageTypeName = "Msg_ForgeTreeUpdateFinish";
    local_34.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_34);
    local_24.FunctionName = "__OnCurrentSelectNodeChanged";
    local_24.DirtyFlags.Set(FVM_WeaponForge::__IndexOf_CurrentSelectNode());
    Result.DirtyFunctions.Add(local_24);
    local_34.FunctionName = "__OnFMsg_ForgeNodeDataUpdate";
    local_34.MessageTypeName = "Msg_ForgeNodeDataUpdate";
    local_34.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_34);
    local_34.FunctionName = "__OnFMsg_ForgeTreeDataUpdate";
    local_34.MessageTypeName = "Msg_ForgeTreeDataUpdate";
    local_34.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_34);
    local_34.FunctionName = "__OnPlayerInventoryChanged";
    local_34.MessageTypeName = "Msg_PlayerInventoryChanged";
    local_34.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_34);
    local_34.FunctionName = "__ShowCraftResult";
    local_34.MessageTypeName = "Msg_CraftResult";
    local_34.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_34);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_WeaponForge;
}
void __OnSelectedCategoryIndexChanged(FVM_WeaponForge &inout Model)
{
    Model.OnSelectedCategoryIndexChanged();
    return;
}
void __OnForgeNodeItemClick(FVM_WeaponForge &inout Model, const FMsg_ForgeNodeItemClick &inout Message)
{
    Model.OnForgeNodeItemClick(Message);
    return;
}
void __OnForgeTreeUpdateFinish(FVM_WeaponForge &inout Model, const FMsg_ForgeTreeUpdateFinish &inout Message)
{
    Model.OnForgeTreeUpdateFinish(Message);
    return;
}
void __OnCurrentSelectNodeChanged(FVM_WeaponForge &inout Model)
{
    Model.OnCurrentSelectNodeChanged();
    return;
}
void __OnFMsg_ForgeNodeDataUpdate(FVM_WeaponForge &inout Model, const FMsg_ForgeNodeDataUpdate &inout Message)
{
    Model.OnFMsg_ForgeNodeDataUpdate(Message);
    return;
}
void __OnFMsg_ForgeTreeDataUpdate(FVM_WeaponForge &inout Model, const FMsg_ForgeTreeDataUpdate &inout Message)
{
    Model.OnFMsg_ForgeTreeDataUpdate(Message);
    return;
}
void __OnPlayerInventoryChanged(FVM_WeaponForge &inout Model, const FMsg_PlayerInventoryChanged &inout Message)
{
    Model.OnPlayerInventoryChanged(Message);
    return;
}
void __ShowCraftResult(FVM_WeaponForge &inout Model, const FMsg_CraftResult &inout Message)
{
    Model.ShowCraftResult(Message);
    return;
}
TArray<TEUIModelRef<FVM_Text>> __UIGetter_MenuBarEntries(const FVM_WeaponForge &inout Model)
{
    return Model.GetMenuBarEntries();
}
TArray<TEUIModelRef<FVM_CommonItemBar>> __UIGetter_DisplayingCostItems(const FVM_WeaponForge &inout Model)
{
    return Model.GetDisplayingCostItems();
}
TArray<TEUIModelRef<FVM_ForgeWeaponTitle>> __UIGetter_CurrentWeaponTitleList(const FVM_WeaponForge &inout Model)
{
    return Model.GetCurrentWeaponTitleList();
}
TArray<TEUIModelRef<FVM_ForgeWeaponFormulaTree>> __UIGetter_CurrentWeaponFormulaTreeList(const FVM_WeaponForge &inout Model)
{
    return Model.GetCurrentWeaponFormulaTreeList();
}
TEUIModelRef<FVM_ForgeWeaponInfo> __UIGetter_CurrentWeaponInfo(const FVM_WeaponForge &inout Model)
{
    return Model.GetCurrentWeaponInfo();
}
bool __UIGetter_IsCurrentSelectItemLock(const FVM_WeaponForge &inout Model)
{
    return Model.GetIsCurrentSelectItemLock();
}
bool __UIGetter_bIsCurrentCostInsufficient(const FVM_WeaponForge &inout Model)
{
    return Model.GetbIsCurrentCostInsufficient();
}
TEUIModelRef<FVM_AvatarEquipmentItemInfoTitle> __UIGetter_CurrentWeaponInfoTitle(const FVM_WeaponForge &inout Model)
{
    return Model.GetCurrentWeaponInfoTitle();
}
TEUIModelRef<FVM_AvatarEquipmentItemInfoDetail> __UIGetter_CurrentWeaponInfoDetail(const FVM_WeaponForge &inout Model)
{
    return Model.GetCurrentWeaponInfoDetail();
}
TEUIModelRef<FVM_CommonConsume> __UIGetter_CurrentCommonConsume(const FVM_WeaponForge &inout Model)
{
    return Model.GetCurrentCommonConsume();
}
bool __UIGetter_bForgeOrCraft(const FVM_WeaponForge &inout Model)
{
    return Model.GetbForgeOrCraft();
}
FSoftBrush __UIGetter_CurrentWeaponPreivewImage(const FVM_WeaponForge &inout Model)
{
    return Model.GetCurrentWeaponPreivewImage();
}
bool __UIGetter_CurrentWeaponIsUnlock(const FVM_WeaponForge &inout Model)
{
    return Model.GetCurrentWeaponIsUnlock();
}
ESlateVisibility __UIGetter_CurrentWeaponDetailMaskBgVisibility(const FVM_WeaponForge &inout Model)
{
    return Model.GetCurrentWeaponDetailMaskBgVisibility();
}
TEUIModelRef<FVM_WeaponForge> __UIGetter_Self(const FVM_WeaponForge &inout Model)
{
    return TEUIModelRef<FVM_WeaponForge>(Model);
}
int __IndexOf_ForgeModel()
{
    return 0;
}
int __IndexOf_CraftModel()
{
    return 1;
}
int __IndexOf_LastSelectNode()
{
    return 2;
}
int __IndexOf_CurrentSelectNode()
{
    return 3;
}
int __IndexOf_bResetSelectItem()
{
    return 4;
}
int __IndexOf_SelectedCategoryIndex()
{
    return 5;
}
int __IndexOf_ShowCostTypes()
{
    return 6;
}
int __IndexOf_PopupClass()
{
    return 7;
}
int __IndexOf_WeaponCannotEquipTips()
{
    return 8;
}
int __IndexOf_MenuBarEntries()
{
    return 9;
}
int __IndexOf_DisplayingCostItems()
{
    return 10;
}
int __IndexOf_CurrentWeaponTitleList()
{
    return 11;
}
int __IndexOf_CurrentWeaponFormulaTreeList()
{
    return 12;
}
int __IndexOf_CurrentWeaponInfo()
{
    return 13;
}
int __IndexOf_IsCurrentSelectItemLock()
{
    return 14;
}
int __IndexOf_bIsCurrentCostInsufficient()
{
    return 15;
}
int __IndexOf_CurrentWeaponInfoTitle()
{
    return 16;
}
int __IndexOf_CurrentWeaponInfoDetail()
{
    return 17;
}
int __IndexOf_CurrentCommonConsume()
{
    return 18;
}
int __IndexOf_bForgeOrCraft()
{
    return 19;
}
int __IndexOf_WeaponTypes()
{
    return 20;
}
int __IndexOf_CurrentTreeMap()
{
    return 21;
}
}
namespace __GeneratedProperties_FVM_WeaponForge
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

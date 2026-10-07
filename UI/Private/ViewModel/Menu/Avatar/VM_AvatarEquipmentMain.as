
namespace FVM_AvatarEquipmentMain
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnSelectIllustrateFilter = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnSelectItem = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnRarityFilterSelected = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnTraitFilterSelected = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnItemEquip = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnItemUnEquip = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SwitchItemCompare = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SwitchBatchDecomposeItemSelect = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SwitchBatchDecomposeState = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnComfirmDecompose = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnItemDecompose = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnComfirmBatchDecompose = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature ConfirmBatchDecompose = FEUIModelCallbackSignature();

}
struct FEquipmentFilterItemSorter
{
    FEquipmentFilterItemSorter()
    {
        return;
    }
    bool opCall(const TEUIModelRef<FVM_AvatarEquipmentItem> &inout A, const TEUIModelRef<FVM_AvatarEquipmentItem> &inout B)
    {
        TEUIModelRef<FM_Equipment> local_2;
        local_2.GetEquipment();
        TDataObjectPtr<FEquipmentConfig> local_26 = GetEquipmentConfig();
        local_2.GetEquipment();
        TDataObjectPtr<FEquipmentConfig> local_74 = GetEquipmentConfig();
        if (!(local_26) || !(local_74))
        {
            return !(!(local_26));
        }
        TEUIModelRef<FVM_ComposableItem> local_80;
        local_80.GetComposableItemVM();
        bool local_75 = ::ComposableItemUtility::HasItemRedDot();
        local_80.GetComposableItemVM();
        if (!(local_75) != !(::ComposableItemUtility::HasItemRedDot()))
        {
            return local_75;
        }
        if (local_26.opArrow().Level != local_74.opArrow().Level)
        {
            return (local_26.opArrow().Level > local_74.opArrow().Level);
        }
        return (int(local_26.opArrow().Rarity) > int(local_74.opArrow().Rarity));
    }
}

struct FRarityFilterSorter
{
    FRarityFilterSorter()
    {
        return;
    }
    bool opCall(const EItemRarity &inout A, const EItemRarity &inout B)
    {
        int local_2 = int(A);
        int local_3 = int(B);
        return (local_2 < local_3);
    }
}

struct FVM_AvatarEquipmentMain : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_AvatarEquipmentTitleText;
    UPROPERTY()
    FText m_AvatarDecomposeTitleText;
    UPROPERTY()
    FText m_EquipmentDecomposePopupTitleText;
    UPROPERTY()
    FText m_EquipmentDecomposePopupDescText;
    UPROPERTY()
    FText m_EquipmentDecomposePopupRewardHintText;
    UPROPERTY()
    FText m_CurTitleText;
    UPROPERTY()
    TEUIModelRef<FMS_EditingAvatar> m_EditingAvatar;
    UPROPERTY()
    TWeakObjectPtr<UEUICommonListViewBase> m_IllustrateListWidget;
    UPROPERTY()
    int m_SelectedIllustrateFilterItemIndex;
    UPROPERTY()
    TArray<FEUIModelContainer> m_IllustrateTypes;
    UPROPERTY()
    EEquipSlotType m_FilterByIllustrate;
    UPROPERTY()
    int m_SelectedItemIndex;
    UPROPERTY()
    TArray<TEUIModelRef<FM_Equipment>> m_AllFilterItemsM;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_AvatarEquipmentItem>> m_FilterItems;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarEquipmentItem> m_SelectedItems;
    UPROPERTY()
    uint64 m_CurSlotEquipedItemUId;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarShowcase> m_Showcase;
    UPROPERTY()
    TArray<EItemRarity> m_RarityFilterList;
    UPROPERTY()
    TArray<uint> m_TraitFilterList;
    UPROPERTY()
    int m_CurRarityFilterIndex;
    UPROPERTY()
    int m_CurTraitFilterIndex;
    UPROPERTY()
    TEUIModelRef<FVM_CommonDropdown> m_RarityFilter;
    UPROPERTY()
    TEUIModelRef<FVM_CommonDropdown> m_TraitFilter;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare> m_InfoCompare;
    UPROPERTY()
    bool m_bItemCompared;
    UPROPERTY()
    bool m_bBatchDecompose;
    UPROPERTY()
    TSet<TEUIModelRef<FM_Equipment>> m_BatchDecomposeEquipmentSet;
    UPROPERTY()
    TSet<EItemType> m_ItemTypeSeenRecordSet;
    UPROPERTY()
    TArray<FAvatarShowcaseEntry> m_ShowCaseAvatarEntries;

    FVM_AvatarEquipmentMain()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_AvatarEquipmentMain(const FVM_AvatarEquipmentMain &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_AvatarEquipmentMain& opAssign(const FVM_AvatarEquipmentMain &inout Other)
    {
        this.m_AvatarEquipmentTitleText = Other.m_AvatarEquipmentTitleText;
        this.m_AvatarDecomposeTitleText = Other.m_AvatarDecomposeTitleText;
        this.m_EquipmentDecomposePopupTitleText = Other.m_EquipmentDecomposePopupTitleText;
        this.m_EquipmentDecomposePopupDescText = Other.m_EquipmentDecomposePopupDescText;
        this.m_EquipmentDecomposePopupRewardHintText = Other.m_EquipmentDecomposePopupRewardHintText;
        this.m_CurTitleText = Other.m_CurTitleText;
        this.m_EditingAvatar = Other.m_EditingAvatar;
        this.m_IllustrateListWidget = Other.m_IllustrateListWidget;
        this.m_SelectedIllustrateFilterItemIndex = int(Other.m_SelectedIllustrateFilterItemIndex);
        this.m_IllustrateTypes = Other.m_IllustrateTypes;
        this.m_FilterByIllustrate = Other.m_FilterByIllustrate;
        this.m_SelectedItemIndex = int(Other.m_SelectedItemIndex);
        this.m_AllFilterItemsM = Other.m_AllFilterItemsM;
        this.m_FilterItems = Other.m_FilterItems;
        this.m_SelectedItems = Other.m_SelectedItems;
        this.m_CurSlotEquipedItemUId = Other.m_CurSlotEquipedItemUId;
        this.m_Showcase = Other.m_Showcase;
        this.m_RarityFilterList = Other.m_RarityFilterList;
        this.m_TraitFilterList = Other.m_TraitFilterList;
        this.m_CurRarityFilterIndex = int(Other.m_CurRarityFilterIndex);
        this.m_CurTraitFilterIndex = int(Other.m_CurTraitFilterIndex);
        this.m_RarityFilter = Other.m_RarityFilter;
        this.m_TraitFilter = Other.m_TraitFilter;
        this.m_InfoCompare = Other.m_InfoCompare;
        this.m_bItemCompared = Other.m_bItemCompared;
        this.m_bBatchDecompose = Other.m_bBatchDecompose;
        this.m_BatchDecomposeEquipmentSet = Other.m_BatchDecomposeEquipmentSet;
        this.m_ItemTypeSeenRecordSet = Other.m_ItemTypeSeenRecordSet;
        return Other.m_ShowCaseAvatarEntries;
    }
    void LoadConfig(const FConfigVM_AvatarEquipmentMain &inout InConfig)
    {
        this.SetAvatarDecomposeTitleText(InConfig.AvatarDecomposeTitleText);
        this.SetEquipmentDecomposePopupTitleText(InConfig.EquipmentDecomposePopupTitleText);
        this.SetEquipmentDecomposePopupDescText(InConfig.EquipmentDecomposePopupDescText);
        this.SetEquipmentDecomposePopupRewardHintText(InConfig.EquipmentDecomposePopupRewardHintText);
        this.SetAvatarEquipmentTitleText(InConfig.AvatarEquipmentTitleText);
        return;
    }
    void PostConstruct()
    {
        this.SetEditingAvatar(TEUIModelRef<FMS_EditingAvatar>(::FMS_EditingAvatar::Get(this.GetContext().Manager)));
        return;
    }
    void PostLoad()
    {
        this.SetCurTitleText(this.GetAvatarEquipmentTitleText());
        return;
    }
    void BeginDestroy()
    {
        int local_132 = 0;
        if (this.GetEditingAvatar())
        {
            TEUIModelRef<FMS_EditingAvatar> local_2 = this.GetEditingAvatar();
            TDataObjectPtr<FAvatarPrefabConfig> local_28 = GetAvatarConfig();
            TArray<TEUIModelRef<FM_ItemData>> local_56 = ::FMS_PlayerInventory::Get(this.GetContext().Manager).GetAllItems();
            for (auto& local_74 : local_56)
            {
                CastTo local_102;
                TDataObjectPtr<FEquipmentConfig> local_126 = local_102.opCall();
                if (local_126)
                {
                    int64 local_128 = -1;
                    if (::FMS_ItemDataCache::Get(this.GetContext().Manager).TryGetItemUid(local_74, local_128) && local_28.IsSet() && ::FEquipmentUtils::AvatarCanEquip(local_28, local_126))
                    {
                        if (this.GetItemTypeSeenRecordSet().Contains(unresolved.ItemType))
                        {
                            if (local_132 == 2)
                            {
                                ::FMS_RedDotSystem::Get(this.GetContext().Manager).ConsumeRedDot(FRedDotNodeData(GameplayTags::RedDotSystem_Weapon_NewWeapon, local_128));
                                continue;
                            }
                            if (local_132 == 7)
                            {
                                ::FMS_RedDotSystem::Get(this.GetContext().Manager).ConsumeRedDot(FRedDotNodeData(GameplayTags::RedDotSystem_Talisman_NewTalisman, local_128));
                            }
                        }
                    }
                }
            }
        }
        return;
    }
    void Setup(const EEquipSlotType InEditingEquipSlot)
    {
        int local_14 = 0;
        this.SetFilterByIllustrate(EEquipSlotType(InEditingEquipSlot));
        this.SetEditingAvatar(TEUIModelRef<FMS_EditingAvatar>(::FMS_EditingAvatar::Get(this.GetContext().Manager)));
        TEUIModelRef<FMS_EditingAvatar> local_2 = this.GetEditingAvatar();
        GetAvatarConfig().IsSet();
        FECSEntity local_8 = this.GetContext().GetLocalPlayer();
        this.UpdateCurIllustrateTypes(local_14);
        return;
    }
    void RefreshFilterInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    bool CheckItemRarityFilter(const TDataObjectPtr<FEquipmentConfig> &inout Cfg)
    {
        if (this.GetCurRarityFilterIndex() == 0 || !(this.GetRarityFilterList().IsValidIndex(this.GetCurRarityFilterIndex())))
        {
            return true;
        }
        if (!(Cfg.IsSet()))
        {
            return false;
        }
        return (0 == int(this.GetRarityFilterList()[this.GetCurRarityFilterIndex()]));
    }
    bool CheckItemTraitFilter(const TArray<TEUIModelRef<FM_Trait>> &inout EquipmentTraits)
    {
        if (this.GetCurTraitFilterIndex() == 0 || !(this.GetTraitFilterList().IsValidIndex(this.GetCurTraitFilterIndex())))
        {
            return true;
        }
        if (EquipmentTraits.IsEmpty())
        {
            return false;
        }
        bool local_5 = false;
        for (auto& local_20 : EquipmentTraits)
        {
            if (local_20.IsValid())
            {
                if (GetTraitConfig().IsSet() && (0 == this.GetTraitFilterList()[this.GetCurTraitFilterIndex()]))
                {
                    local_5 = true;
                    break;
                }
            }
        }
        return local_5;
    }
    void UpdateEquipmentFilterList()
    {
        this.GetModify_AllFilterItemsM().Empty(0);
        this.GetModify_FilterItems().Empty(0);
        if ((int(this.GetFilterByIllustrate())) >= 2 && (int(this.GetFilterByIllustrate()) <= 5))
        {
            int local_10;
            int local_5 = int(this.GetFilterByIllustrate());
            int local_9 = local_5 - 2;
            local_10 = ::FMS_Talisman::Get(this.GetContext().Manager).GetUnlockSlotCount();
            int local_8 = local_9 + 1;
            if (local_8 > local_10)
            {
                XLog(ELog(60), FString().Append("[VM_AvatarEquipmentMain]UpdateEquipmentFilterList. Slot:[").Append(local_9).Append("] is unlock."));
                return;
            }
        }
        TArray<TEUIModelRef<FM_ItemData>> local_20 = ::FMS_PlayerInventory::Get(this.GetContext().Manager).GetAllItemsByType();
        TEUIModelRef<FMS_EditingAvatar> local_26 = this.GetEditingAvatar();
        TDataObjectPtr<FAvatarPrefabConfig> local_50 = GetAvatarConfig();
        FMS_EquipmentDataCache& local_76 = ::FMS_EquipmentDataCache::Get(this.GetContext().Manager);
        TArray<TEUIModelRef<FM_Equipment>> local_80;
        for (auto& local_94 : local_20)
        {
            CastTo local_98;
            TDataObjectPtr<FEquipmentConfig> local_122 = local_98.opCall();
            if (local_122)
            {
                int64 local_148 = -1;
                if (::FMS_ItemDataCache::Get(this.GetContext().Manager).TryGetItemUid(local_94, local_148) && local_50.IsSet() && ::FEquipmentUtils::AvatarCanEquip(local_50, local_122))
                {
                    TEUIModelRef<FM_Equipment> local_156;
                    if (local_76.HasEquipment(local_148))
                    {
                        local_156 = local_76.GetEquipment(local_148);
                    }
                    else
                    {
                        local_156 = local_76.CreateAndCacheFromConfig(local_122, local_148);
                    }
                    this.GetModify_AllFilterItemsM().Add(local_156);
                    if (this.CheckItemRarityFilter(local_122) && this.CheckItemTraitFilter(GetEquipmentTraits()))
                    {
                        local_80.Add(local_156);
                    }
                }
            }
        }
        for (auto& local_172 : local_80)
        {
            this.GetModify_FilterItems().Add(TEUIModelRef<FVM_AvatarEquipmentItem>(::FVM_AvatarEquipmentItem::Create(this.GetContext().Manager, local_76.GetItemUid(local_172))));
        }
        return;
    }
    void UpdateCurIllustrateTypes(const FC_DSPlayerAvatarInfo &inout InPlayerAvatarInfo)
    {
        FDSAvatarEquipmentInfo local_202;
        FDSAvatarInfo local_50;
        TEUIModelRef<FMS_EditingAvatar> local_52 = this.GetEditingAvatar();
        bool local_102 = InPlayerAvatarInfo && GetAvatarConfig().IsSet();
        if (local_102)
        {
            for (auto& local_116 : InPlayerAvatarInfo.GetAvatarList())
            {
                if (local_116.GetAvatarId() == 0)
                {
                    local_50 = local_116;
                    break;
                }
            }
        }
        UAvatarEquipmentSettings local_122 = ::AvatarEquipmentSettings::Get();
        int local_123 = ::FMS_Talisman::Get(this.GetContext().Manager).GetUnlockSlotCount();
        int local_124 = 1;
        for (; local_124 < 6; ++local_124)
        {
            bool local_101 = (local_124 >= 2) && (local_124 <= 5);
            if (!(local_101))
            {
                local_102 = false;
            }
            else
            {
                local_102 = false;
                local_102 = !(::FMS_SystemControl::Get(this.GetContext().Manager).IsSystemUnlock(ESystemModule(9), local_102));
            }
            if (local_102)
            {
                continue;
            }
            FSoftBrush local_172 = local_122.LockSlotImage;
            if (local_101 && (local_123 > 0))
            {
                local_172 = local_122.UnEquipSlotImage;
                --local_123;
            }
            if (local_50.GetEquipmentInfos().Find(EEquipSlotType(local_124), local_202))
            {
                if (local_202.GetEquipmentData().GetEquipmentConfig().IsSet())
                {
                    if (local_101)
                    {
                    }
                    else
                    {
                    }
                }
            }
            int local_126 = local_124 - 1;
            if (this.GetIllustrateTypes().IsValidIndex(local_126))
            {
                FVM_Image& local_210 = FEUIModelContainer::GetModel(this.GetIllustrateTypes()[local_126]).opCall();
                if (local_210)
                {
                    local_210.SetImage(local_172);
                }
            }
            else
            {
                FEUIModelContainer local_224;
                local_224.AddModel(FEUIModelRef(), false);
                FVM_CommonTabItem& local_228 = ::FVM_CommonTabItem::Create(this.GetContext().Manager);
                FText local_246;
                if (local_101)
                {
                    local_246 = FText::Format(NSLOCTEXT("EquipSlotTalisman", "зЃµйҐ°{0}"), FText::AsNumber(((local_124 - 2) + 1), FNumberFormattingOptions::DefaultNoGrouping()));
                }
                else
                {
                    local_246 = NSLOCTEXT("EquipSlotWeapon", "ж­¦е™Ё");
                }
                local_228.SetTitleText(local_246);
                local_224.AddModel(FEUIModelRef(local_228), false);
                this.GetModify_IllustrateTypes().Add(local_224);
            }
        }
        return;
    }
    void UpdateAllEquipmentItemState(const FC_DSPlayerAvatarInfo &inout InPlayerAvatarInfo)
    {
        FDSAvatarEquipmentInfo local_150;
        TEUIModelRef<FVM_ComposableItem> local_168;
        this.SetCurSlotEquipedItemUId(0);
        FDSAvatarInfo local_52;
        TEUIModelRef<FMS_EditingAvatar> local_54 = this.GetEditingAvatar();
        bool local_104 = InPlayerAvatarInfo && GetAvatarConfig().IsSet();
        if (local_104)
        {
            for (auto& local_118 : InPlayerAvatarInfo.GetAvatarList())
            {
                if (local_118.GetAvatarId() == 0)
                {
                    local_52 = local_118;
                    break;
                }
            }
        }
        if (local_52.GetEquipmentInfos().Find(EEquipSlotType(this.GetFilterByIllustrate()), local_150))
        {
            this.SetCurSlotEquipedItemUId(local_150.GetGuid());
        }
        for (auto& local_166 : this.GetFilterItems())
        {
            if (!(local_166.IsValid()))
            {
                local_104 = false;
            }
            else
            {
                local_168.GetComposableItemVM();
                local_104 = local_168.IsValid();
            }
            if (local_104)
            {
                local_168.GetComposableItemVM();
                int local_170 = ::ComposableItemUtility::GetItemEquipMarkState();
                TEUIModelRef<FM_Equipment> local_174 = ::FMS_EquipmentDataCache::Get(this.GetContext().Manager).GetEquipment(GetEquipmentUid());
                local_104 = local_174.IsValid() && ::FEquipmentUtils::CanDecompose(GetEquipmentConfig());
                if (local_174.IsValid())
                {
                    TDataObjectPtr<FAvatarPrefabConfig> local_102;
                    local_102 = GetEquiptingAvatar();
                    if (!((local_102 == nullptr)))
                    {
                        local_170 = GetEquipmentUid() == this.GetCurSlotEquipedItemUId() ? 1 : 2;
                    }
                    else
                    {
                        local_170 = (this.GetbBatchDecompose() && local_104) ? 3 : 4;
                    }
                }
                local_168.GetComposableItemVM();
                if (this.GetbBatchDecompose())
                {
                    if ((local_170 == 4 || (local_170 == 3)) && local_104)
                    {
                        if (local_174.IsValid() && this.GetBatchDecomposeEquipmentSet().Contains(local_174))
                        {
                            local_168.GetComposableItemVM();
                            ::ComposableItemUtility::SetItemEquipMarkIsCheckableSelected(true);
                        }
                    }
                    else
                    {
                        local_168.GetComposableItemVM();
                        ::ComposableItemUtility::SetItemMaskEnable(true);
                    }
                }
            }
        }
        return;
    }
    void OnAvatarEquipmentChanged(const FC_DSPlayerAvatarInfo &inout C_PlayerAvatarInfo)
    {
        this.UpdateCurIllustrateTypes(C_PlayerAvatarInfo);
        this.UpdateAllEquipmentItemState(C_PlayerAvatarInfo);
        this.RefreshItemCompareInfo();
        return;
    }
    void OnFMsg_TalismanSlotUnlockCountChange(const FMsg_TalismanSlotUnlockCountChange &inout Msg)
    {
        FECSEntity local_4 = this.GetContext().GetLocalPlayer();
        this.UpdateCurIllustrateTypes(0);
        this.UpdateEquipmentFilterList();
        this.RefreshFilterInfo();
        return;
    }
    FSoftBrush GetEquipmentDisplayIcon() const
    {
        bool local_3 = this.GetSelectedItems().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelRef<FM_Equipment> local_6;
            TEUIModelRef<FVM_AvatarEquipmentItem> local_2 = this.GetSelectedItems();
            local_6.GetEquipment();
            local_3 = local_6.IsValid();
        }
        if (local_3)
        {
            TEUIModelRef<FM_Equipment> local_6;
            TEUIModelRef<FVM_AvatarEquipmentItem> local_2_2 = this.GetSelectedItems();
            local_6.GetEquipment();
            if (GetEquipmentConfig().IsSet())
            {
            }
            else
            {
            }
        }
        return FSoftBrush();
    }
    ESlateVisibility GetEquipmentDisplayIconVisibility() const
    {
        int local_8;
        if (this.GetSelectedItems().IsValid() && (int(this.GetFilterByIllustrate()) != 1))
        {
            local_8 = 4;
        }
        else
        {
            local_8 = 1;
        }
        return ESlateVisibility(local_8);
    }
    ESlateVisibility GetItemInfoCompareVisibility() const
    {
        int local_4;
        if (this.GetInfoCompare().IsValid())
        {
            local_4 = 4;
        }
        else
        {
            local_4 = 1;
        }
        return ESlateVisibility(local_4);
    }
    FSoftBrush GetItemSpecialBgImage() const
    {
        bool local_3 = this.GetSelectedItems().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelRef<FVM_EquipmentInfo> local_6;
            TEUIModelRef<FVM_AvatarEquipmentItem> local_2 = this.GetSelectedItems();
            local_6.GetEquipmentInfo();
            local_3 = local_6.IsValid();
        }
        FSoftBrush local_52;
        if (local_3)
        {
            TEUIModelRef<FVM_EquipmentInfo> local_6;
            TEUIModelRef<FVM_AvatarEquipmentItem> local_2_2 = this.GetSelectedItems();
            local_6.GetEquipmentInfo();
            local_52.GetItemSpecialBgImage();
            return local_52;
        }
        return local_52;
    }
    void SetIllustrateFilterListWidget(const TWeakObjectPtr<UEUICommonListViewBase> &inout InIllustrateListWidget)
    {
        if (InIllustrateListWidget.IsValid())
        {
            this.SetIllustrateListWidget(InIllustrateListWidget);
        }
        return;
    }
    void SetCurrentShowcase(const TEUIModelRef<FVM_AvatarShowcase> &inout InShowcase)
    {
        XLog(ELog(60), FString().Append("[VM_AvatarEquipmentMain]SetCurrentShowcase."));
        this.SetShowcase(InShowcase);
        this.RefreshShowcaseAvatars();
        return;
    }
    void RefreshCurSelectedItems()
    {
        if (this.GetFilterItems().IsValidIndex(this.GetSelectedItemIndex()))
        {
            this.SetSelectedItems(this.GetFilterItems()[this.GetSelectedItemIndex()]);
            this.RefreshShowcaseAvatars();
            return;
        }
        this.SetSelectedItems(TEUIModelRef<FVM_AvatarEquipmentItem>(nullptr));
        return;
    }
    void OnSelectedItemIndexChanged()
    {
        XLog(ELog(60), FString().Append("[VM_AvatarEquipmentMain]OnSelectedItemIndexChanged."));
        this.RefreshCurSelectedItems();
        this.RefreshItemCompareInfo();
        return;
    }
    void OnFilterItemsChanged()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void OnSelectIllustrateFilter(const int IllustrateFilterItemIndex)
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void OnSelectItem(const int ItemIndex)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void RefreshFilteredAvatarEquipmentList()
    {
        this.UpdateEquipmentFilterList();
        this.RefreshFilterInfo();
        if (int(this.GetFilterByIllustrate()) == 1)
        {
            this.GetModify_ItemTypeSeenRecordSet().Add(EItemType(2));
            return;
        }
        if (int(this.GetFilterByIllustrate()) >= 2 && (int(this.GetFilterByIllustrate()) <= 5))
        {
            this.GetModify_ItemTypeSeenRecordSet().Add(EItemType(7));
        }
        return;
    }
    void RefreshShowcaseAvatars()
    {
        TEUIModelRef<FM_Equipment> local_122;
        XLog(ELog(60), FString().Append("[VM_AvatarEquipmentMain]RefreshShowcaseAvatars."));
        if (this.GetShowcase())
        {
            TEUIModelRef<FVM_AvatarShowcase> local_8 = this.GetShowcase();
            this.GetShowcaseConfigIndex().ChangeShowcaseConfigIndex();
            TArray<FAvatarShowcaseEntry> local_14;
            TEUIModelRef<FVM_AvatarInfo> local_18 = this.GetEditingAvatarInfo();
            if (local_18)
            {
                FAvatarShowcaseEntry local_114 = ::FAvatarShowcaseEntryUtils::FromAvatarInfo(local_18);
                bool local_9 = int(this.GetFilterByIllustrate()) == 1 && this.GetSelectedItems().IsValid();
                if (!(local_9))
                {
                    local_9 = false;
                }
                else
                {
                    TEUIModelRef<FVM_AvatarEquipmentItem> local_118 = this.GetSelectedItems();
                    local_122.GetEquipment();
                    local_9 = local_122.IsValid();
                }
                if (local_9)
                {
                    TEUIModelRef<FVM_AvatarEquipmentItem> local_118_2 = this.GetSelectedItems();
                    local_122.GetEquipment();
                    if (GetEquipmentConfig().IsSet())
                    {
                        CastTo local_174;
                        TDataObjectPtr<FWeaponConfig> local_198 = local_174.opCall();
                        if (local_198)
                        {
                            local_114.WeaponConfig = local_198;
                        }
                    }
                }
                local_14.Add(local_114);
            }
            TArray<FAvatarShowcaseEntry> local_226;
            local_226 = this.GetShowCaseAvatarEntries();
            if (!((local_226 == local_14)))
            {
                this.GetModify_ShowCaseAvatarEntries().Empty(0);
                this.GetModify_ShowCaseAvatarEntries().Append(local_14);
                if (!(local_14.IsEmpty()))
                {
                    XLog(ELog(60), FString().Append("[VM_AvatarEquipmentMain]RefreshShowcaseAvatars. SetAvatarEntries."));
                    TEUIModelRef<FVM_AvatarShowcase> local_8_2 = this.GetShowcase();
                    this.GetShowCaseAvatarEntries().SetNextAvatarEntries();
                }
            }
        }
        return;
    }
    int GetShowcaseConfigIndex() const
    {
        if (int(this.GetFilterByIllustrate()) >= 2 && (int(this.GetFilterByIllustrate()) <= 5))
        {
            return 1;
        }
        return 0;
    }
    TEUIModelRef<FVM_AvatarInfo> GetEditingAvatarInfo()
    {
        TEUIModelRef<FMS_EditingAvatar> local_2 = this.GetEditingAvatar();
        TDataObjectPtr<FAvatarPrefabConfig> local_26 = GetAvatarConfig();
        if (!(local_26.IsSet()))
        {
            return TEUIModelRef<FVM_AvatarInfo>();
        }
        TEUIModelRef<FM_Avatar> local_58 = ::FMS_PlayerAvatarData::Get(this.GetContext().Manager).FindAvatar(local_26);
        if (!(local_58))
        {
            return TEUIModelRef<FVM_AvatarInfo>();
        }
        return TEUIModelRef<FVM_AvatarInfo>(::FVM_AvatarInfo::Create(this.GetContext().Manager, local_58));
    }
    void RefreshItemCompareInfo()
    {
        TEUIModelRef<FVM_EquipmentInfo> local_8;
        bool local_13;
        if (this.GetSelectedItems().IsValid())
        {
            TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare> local_6 = this.GetInfoCompare();
            if (local_6.IsValid())
            {
                TEUIModelRef<FVM_AvatarEquipmentItem> local_2 = this.GetSelectedItems();
                local_8.GetEquipmentInfo();
                TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare> local_6_2 = this.GetInfoCompare();
                local_8.RefreshCurItemInfoDisplay();
                if (!(this.GetbItemCompared()))
                {
                    local_13 = false;
                }
                else
                {
                    int64 local_10 = this.GetCurSlotEquipedItemUId();
                    local_13 = (local_10 != 0);
                }
                if (local_13)
                {
                    TEUIModelRef<FVM_EquipmentInfo> local_20 = TEUIModelRef<FVM_EquipmentInfo>(::FVM_EquipmentInfo::Create(this.GetContext().Manager, ::FMS_EquipmentDataCache::Get(this.GetContext().Manager).GetEquipment(this.GetCurSlotEquipedItemUId())));
                    TEUIModelRef<FMS_EditingAvatar> local_22 = this.GetEditingAvatar();
                    TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare> local_6_3 = this.GetInfoCompare();
                }
                else
                {
                    TDataObjectPtr<FAvatarPrefabConfig> local_46 = TDataObjectPtr<FAvatarPrefabConfig>(nullptr);
                    local_8 = TEUIModelRef<FVM_EquipmentInfo>(nullptr);
                    TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare> local_6_4 = this.GetInfoCompare();
                }
            }
            else
            {
                TEUIModelRef<FVM_AvatarEquipmentItem> local_2_2 = this.GetSelectedItems();
                local_8.GetEquipmentInfo();
                TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare> local_6_5 = TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare>(::FVM_AvatarEquipmentItemInfoCompare::Create(this.GetContext().Manager, local_8));
                this.SetInfoCompare(local_6_5);
                this.SetbItemCompared(false);
            }
            return;
        }
        TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare> local_6_6 = TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare>(nullptr);
        this.SetInfoCompare(local_6_6);
        this.SetbItemCompared(false);
        return;
    }
    void OnRarityFilterSelected(const int Index)
    {
        if (this.GetCurRarityFilterIndex() != Index)
        {
            this.SetCurRarityFilterIndex(Index);
            this.UpdateEquipmentFilterList();
        }
        return;
    }
    void OnTraitFilterSelected(const int Index)
    {
        if (this.GetCurTraitFilterIndex() != Index)
        {
            this.SetCurTraitFilterIndex(Index);
            this.UpdateEquipmentFilterList();
        }
        return;
    }
    void OnItemEquip()
    {
        int local_14 = 0;
        int local_16;
        XLog(ELog(60), FString().Append("[VM_AvatarEquipmentMain]OnItemEquip."));
        TEUIModelRef<FMS_EditingAvatar> local_8 = this.GetEditingAvatar();
        if (!(GetAvatarConfig().IsSet()))
        {
            return;
        }
        if (!(this.GetSelectedItems().IsValid()))
        {
            return;
        }
        TEUIModelRef<FMS_EditingAvatar> local_8_2 = this.GetEditingAvatar();
        int local_13 = local_14;
        TEUIModelRef<FVM_AvatarEquipmentItem> local_12 = this.GetSelectedItems();
        local_16 = GetEquipmentUid();
        if ((int(this.GetFilterByIllustrate())) == 1)
        {
            TEUIModelRef<FMS_EditingAvatar> local_8_3 = this.GetEditingAvatar();
            ::FEquipmentUtils::GS_RequestChangeEquipment(this.GetContext().GetLocalPlayer(), GetAvatarConfig(), local_16);
            return;
        }
        if (int(this.GetFilterByIllustrate()) >= 2 && (int(this.GetFilterByIllustrate()) <= 5))
        {
            int local_21 = int(this.GetFilterByIllustrate());
            local_14 = local_21 - 2;
            ::FMS_Talisman::Get(this.GetContext().Manager).GS_RequestManageTalisman(local_13, local_16, local_14);
        }
        return;
    }
    void OnItemUnEquip()
    {
        int local_12 = 0;
        int local_14;
        XLog(ELog(60), FString().Append("[VM_AvatarEquipmentMain]OnItemUnEquip."));
        if (!(this.CanShowUnEquipAction()))
        {
            return;
        }
        TEUIModelRef<FMS_EditingAvatar> local_8 = this.GetEditingAvatar();
        if (!(GetAvatarConfig().IsSet()))
        {
            return;
        }
        if (!(this.GetSelectedItems().IsValid()))
        {
            return;
        }
        TEUIModelRef<FMS_EditingAvatar> local_8_2 = this.GetEditingAvatar();
        int local_11 = local_12;
        TEUIModelRef<FVM_AvatarEquipmentItem> local_10 = this.GetSelectedItems();
        local_14 = GetEquipmentUid();
        if ((int(this.GetFilterByIllustrate())) == 1)
        {
            return;
        }
        if (int(this.GetFilterByIllustrate()) >= 2 && (int(this.GetFilterByIllustrate()) <= 5))
        {
            int local_19 = int(this.GetFilterByIllustrate());
            local_12 = local_19 - 2;
            ::FMS_Talisman::Get(this.GetContext().Manager).GS_RequestManageTalisman(local_11, 0, local_12);
        }
        return;
    }
    void SwitchItemCompare()
    {
        bool local_15;
        XLog(ELog(60), FString().Append("[VM_AvatarEquipmentMain]SwitchItemCompare."));
        if (this.GetInfoCompare().IsValid())
        {
            this.SetbItemCompared(!(this.GetbItemCompared()));
            if (!(this.GetbItemCompared()))
            {
                local_15 = false;
            }
            else
            {
                int64 local_12 = this.GetCurSlotEquipedItemUId();
                local_15 = (local_12 != 0);
            }
            if (local_15)
            {
                TEUIModelRef<FVM_EquipmentInfo> local_22 = TEUIModelRef<FVM_EquipmentInfo>(::FVM_EquipmentInfo::Create(this.GetContext().Manager, ::FMS_EquipmentDataCache::Get(this.GetContext().Manager).GetEquipment(this.GetCurSlotEquipedItemUId())));
                TEUIModelRef<FMS_EditingAvatar> local_26 = this.GetEditingAvatar();
                TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare> local_8 = this.GetInfoCompare();
                return;
            }
            TDataObjectPtr<FAvatarPrefabConfig> local_50 = TDataObjectPtr<FAvatarPrefabConfig>(nullptr);
            TEUIModelRef<FVM_EquipmentInfo> local_24 = TEUIModelRef<FVM_EquipmentInfo>(nullptr);
            TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare> local_8_2 = this.GetInfoCompare();
        }
        return;
    }
    void SwitchBatchDecomposeItemSelect()
    {
        XLog(ELog(60), FString().Append("[VM_AvatarEquipmentMain]SwitchBatchDecomposeItemSelect."));
        bool local_10 = this.GetbBatchDecompose() && this.GetSelectedItems().IsValid();
        if (!(local_10))
        {
            local_10 = false;
        }
        else
        {
            TEUIModelRef<FVM_ComposableItem> local_12;
            TEUIModelRef<FVM_AvatarEquipmentItem> local_8 = this.GetSelectedItems();
            local_12.GetComposableItemVM();
            local_10 = local_12.IsValid();
        }
        if (local_10)
        {
            TEUIModelRef<FVM_ComposableItem> local_12;
            TEUIModelRef<FVM_AvatarEquipmentItem> local_8_2 = this.GetSelectedItems();
            local_12.GetComposableItemVM();
            ::ComposableItemUtility::TriggerItemEquipMarkCheckableItemSelectedChange();
        }
        return;
    }
    void SwitchBatchDecomposeState()
    {
        this.SetbBatchDecompose(!(this.GetbBatchDecompose()));
        XLog(ELog(60), FString().Append("[VM_AvatarEquipmentMain]SwitchBatchDecomposeState. bBatchDecompose:[").Append(this.GetbBatchDecompose()).Append("]"));
        return;
    }
    void OnBatchDecomposeStateChanged()
    {
        if (this.GetbBatchDecompose())
        {
        }
        else
        {
        }
        this.SetCurTitleText();
        this.GetModify_BatchDecomposeEquipmentSet().Empty(0);
        FEUIModelRef local_10 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        FMsg_AvatarEquipBatchDecomposeStateChange local_4;
        local_4.bBatchDecompose = this.GetbBatchDecompose();
        return;
    }
    void OnFMsg_AvatarEquipItemDecomposeSelectedUpdate(const FMsg_ItemFeature_EquipMark_CheckableSelectedUpdate &inout Msg)
    {
        if (Msg.bCheckableSelected)
        {
            this.GetModify_BatchDecomposeEquipmentSet().Add(Msg.Equipment);
            return;
        }
        return;
    }
    bool OnComfirmDecompose(const FCommonDialogAnswer &inout Answer)
    {
        if (int(Answer.AnswerType) == 1)
        {
            TEUIModelRef<FVM_AvatarEquipmentItem> local_6 = this.GetSelectedItems();
            if (::FMS_ItemDataCache::Get(this.GetContext().Manager).HasItemData(GetEquipmentUid()))
            {
                TEUIModelRef<FVM_AvatarEquipmentItem> local_6_2 = this.GetSelectedItems();
                TEUIModelRef<FM_ItemData> local_12 = ::FMS_ItemDataCache::Get(this.GetContext().Manager).RequireItemData(GetEquipmentUid());
                FMS_PlayerInventory& local_14 = ::FMS_PlayerInventory::Get(this.GetContext().Manager);
                local_14.GS_RequestDecomposeItem(local_12, 1);
            }
        }
        return true;
    }
    void OnItemDecompose()
    {
        XLog(ELog(60), FString().Append("[VM_AvatarEquipmentMain]OnItemDecompose."));
        if (this.GetSelectedItems().IsValid())
        {
            TEUIModelRef<FVM_AvatarEquipmentItem> local_8 = this.GetSelectedItems();
            TEUIModelRef<FM_Equipment> local_14;
            local_14.GetEquipment();
            TEUIModelRef<FM_Equipment> local_12;
            if (local_12.IsValid() && GetEquipmentConfig().IsSet())
            {
                FDialogModelCallback local_42;
                local_42.Bind(this, FVM_AvatarEquipmentMain::OnComfirmDecompose);
                FCommonRewardListBuilder local_46;
                FText local_50 = FText();
                local_46.FromDropConfig(GetDecomposeConfig(), FName(), local_50, 1, false);
                TArray<FRewardItemEntry> local_58 = local_46.Build();
                ::CommonPopup::RewardDialog_Decision(this.GetEquipmentDecomposePopupTitleText(), local_58, FDialogCallback(local_42), this.GetEquipmentDecomposePopupDescText(), this.GetEquipmentDecomposePopupRewardHintText(), FText(), local_50);
            }
        }
        return;
    }
    bool OnComfirmBatchDecompose(const FCommonDialogAnswer &inout Answer)
    {
        if (int(Answer.AnswerType) == 1)
        {
            if (!(this.GetBatchDecomposeEquipmentSet().IsEmpty()))
            {
                TArray<uint64> local_8;
                FMS_EquipmentDataCache& local_10 = ::FMS_EquipmentDataCache::Get(this.GetContext().Manager);
                for (auto& local_28 : this.GetBatchDecomposeEquipmentSet())
                {
                    if (local_28.IsValid())
                    {
                        local_8.Add(local_10.GetItemUid(local_28));
                    }
                }
                FMS_PlayerInventory& local_32 = ::FMS_PlayerInventory::Get(this.GetContext().Manager);
                local_32.GS_RequestBatchDecomposeItems(local_8);
            }
        }
        return true;
    }
    void ConfirmBatchDecompose()
    {
        XLog(ELog(60), FString().Append("[VM_AvatarEquipmentMain]ConfirmBatchDecompose."));
        if (!(this.GetBatchDecomposeEquipmentSet().IsEmpty()))
        {
            FCommonRewardListBuilder local_10;
            for (auto& local_28 : this.GetBatchDecomposeEquipmentSet())
            {
                if (local_28.IsValid() && GetEquipmentConfig().IsSet())
                {
                    TDataObjectPtr<FDropItemConfigBase> local_54 = GetDecomposeConfig();
                    if (local_54.IsSet())
                    {
                        local_10.FromDropConfig(local_54, FName(), FText(), 1, false);
                    }
                }
            }
            TArray<FRewardItemEntry> local_90 = local_10.Build();
            FDialogModelCallback local_120;
            local_120.Bind(this, FVM_AvatarEquipmentMain::OnComfirmBatchDecompose);
            ::CommonPopup::RewardDialog_Decision(this.GetEquipmentDecomposePopupTitleText(), local_90, FDialogCallback(local_120), this.GetEquipmentDecomposePopupDescText(), this.GetEquipmentDecomposePopupRewardHintText(), FText(), FText());
        }
        return;
    }
    void OnItemDecomposeSuccessNotify(const FMsg_ItemDecomposeSuccessNotify &inout Msg)
    {
        this.GetModify_BatchDecomposeEquipmentSet().Empty(0);
        return;
    }
    void OnInventoryChanged(const FMsg_PlayerInventoryChanged &inout Msg)
    {
        this.UpdateEquipmentFilterList();
        this.RefreshFilterInfo();
        return;
    }
    bool CanShowUnEquipAction()
    {
        return (int(this.GetFilterByIllustrate()) != 1);
    }
    const FText GetAvatarEquipmentTitleText() const property
    {
        const FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_AvatarEquipmentTitleText() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetAvatarEquipmentTitleText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_AvatarEquipmentTitleText = __Value;
        return;
    }
    const FText GetAvatarDecomposeTitleText() const property
    {
        const FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_AvatarDecomposeTitleText() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetAvatarDecomposeTitleText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_AvatarDecomposeTitleText = __Value;
        return;
    }
    const FText GetEquipmentDecomposePopupTitleText() const property
    {
        const FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_EquipmentDecomposePopupTitleText() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetEquipmentDecomposePopupTitleText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_EquipmentDecomposePopupTitleText = __Value;
        return;
    }
    const FText GetEquipmentDecomposePopupDescText() const property
    {
        const FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_EquipmentDecomposePopupDescText() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetEquipmentDecomposePopupDescText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_EquipmentDecomposePopupDescText = __Value;
        return;
    }
    const FText GetEquipmentDecomposePopupRewardHintText() const property
    {
        const FText __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FText GetModify_EquipmentDecomposePopupRewardHintText() property
    {
        FText __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetEquipmentDecomposePopupRewardHintText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_EquipmentDecomposePopupRewardHintText = __Value;
        return;
    }
    const FText GetCurTitleText() const property
    {
        const FText __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FText GetModify_CurTitleText() property
    {
        FText __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetCurTitleText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_CurTitleText = __Value;
        return;
    }
    TEUIModelRef<FMS_EditingAvatar> GetEditingAvatar() const property
    {
        this.TrackPropertyRead(6);
        return this.m_EditingAvatar;
    }
    void SetEditingAvatar(const TEUIModelRef<FMS_EditingAvatar> &inout __Value) property
    {
        TEUIModelRef<FMS_EditingAvatar> local_2;
        local_2 = this.m_EditingAvatar;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_EditingAvatar = __Value;
        return;
    }
    TWeakObjectPtr<UEUICommonListViewBase> GetIllustrateListWidget() const property
    {
        this.TrackPropertyRead(7);
        return this.m_IllustrateListWidget;
    }
    void SetIllustrateListWidget(const TWeakObjectPtr<UEUICommonListViewBase> &inout __Value) property
    {
        if ((this.m_IllustrateListWidget == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_IllustrateListWidget = __Value;
        return;
    }
    int GetSelectedIllustrateFilterItemIndex() const property
    {
        this.TrackPropertyRead(8);
        return this.m_SelectedIllustrateFilterItemIndex;
    }
    void SetSelectedIllustrateFilterItemIndex(const int __Value) property
    {
        if (this.m_SelectedIllustrateFilterItemIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_SelectedIllustrateFilterItemIndex = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetIllustrateTypes() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_IllustrateTypes() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetIllustrateTypes(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_IllustrateTypes = __Value;
        return;
    }
    EEquipSlotType GetFilterByIllustrate() const property
    {
        this.TrackPropertyRead(10);
        return this.m_FilterByIllustrate;
    }
    void SetFilterByIllustrate(const EEquipSlotType __Value) property
    {
        if (int(this.m_FilterByIllustrate) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_FilterByIllustrate = __Value;
        return;
    }
    int GetSelectedItemIndex() const property
    {
        this.TrackPropertyRead(11);
        return this.m_SelectedItemIndex;
    }
    void SetSelectedItemIndex(const int __Value) property
    {
        if (this.m_SelectedItemIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_SelectedItemIndex = __Value;
        return;
    }
    const TArray<TEUIModelRef<FM_Equipment>> GetAllFilterItemsM() const property
    {
        const TArray<TEUIModelRef<FM_Equipment>> __r;
        this.TrackPropertyRead(12);
        return __r;
    }
    TArray<TEUIModelRef<FM_Equipment>> GetModify_AllFilterItemsM() property
    {
        TArray<TEUIModelRef<FM_Equipment>> __r;
        this.MarkPropertyDirty(12);
        return __r;
    }
    void SetAllFilterItemsM(const TArray<TEUIModelRef<FM_Equipment>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_AllFilterItemsM = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_AvatarEquipmentItem>> GetFilterItems() const property
    {
        const TArray<TEUIModelRef<FVM_AvatarEquipmentItem>> __r;
        this.TrackPropertyRead(13);
        return __r;
    }
    TArray<TEUIModelRef<FVM_AvatarEquipmentItem>> GetModify_FilterItems() property
    {
        TArray<TEUIModelRef<FVM_AvatarEquipmentItem>> __r;
        this.MarkPropertyDirty(13);
        return __r;
    }
    void SetFilterItems(const TArray<TEUIModelRef<FVM_AvatarEquipmentItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_FilterItems = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarEquipmentItem> GetSelectedItems() const property
    {
        this.TrackPropertyRead(14);
        return this.m_SelectedItems;
    }
    void SetSelectedItems(const TEUIModelRef<FVM_AvatarEquipmentItem> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarEquipmentItem> local_2;
        local_2 = this.m_SelectedItems;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_SelectedItems = __Value;
        return;
    }
    uint64 GetCurSlotEquipedItemUId() const property
    {
        this.TrackPropertyRead(15);
        return this.m_CurSlotEquipedItemUId;
    }
    void SetCurSlotEquipedItemUId(const uint64 __Value) property
    {
        if (this.m_CurSlotEquipedItemUId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_CurSlotEquipedItemUId = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarShowcase> GetShowcase() const property
    {
        this.TrackPropertyRead(16);
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
        this.MarkPropertyDirty(16);
        this.m_Showcase = __Value;
        return;
    }
    const TArray<EItemRarity> GetRarityFilterList() const property
    {
        const TArray<EItemRarity> __r;
        this.TrackPropertyRead(17);
        return __r;
    }
    TArray<EItemRarity> GetModify_RarityFilterList() property
    {
        TArray<EItemRarity> __r;
        this.MarkPropertyDirty(17);
        return __r;
    }
    void SetRarityFilterList(const TArray<EItemRarity> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_RarityFilterList = __Value;
        return;
    }
    const TArray<uint> GetTraitFilterList() const property
    {
        const TArray<uint> __r;
        this.TrackPropertyRead(18);
        return __r;
    }
    TArray<uint> GetModify_TraitFilterList() property
    {
        TArray<uint> __r;
        this.MarkPropertyDirty(18);
        return __r;
    }
    void SetTraitFilterList(const TArray<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(18);
        this.m_TraitFilterList = __Value;
        return;
    }
    int GetCurRarityFilterIndex() const property
    {
        this.TrackPropertyRead(19);
        return this.m_CurRarityFilterIndex;
    }
    void SetCurRarityFilterIndex(const int __Value) property
    {
        if (this.m_CurRarityFilterIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(19);
        this.m_CurRarityFilterIndex = __Value;
        return;
    }
    int GetCurTraitFilterIndex() const property
    {
        this.TrackPropertyRead(20);
        return this.m_CurTraitFilterIndex;
    }
    void SetCurTraitFilterIndex(const int __Value) property
    {
        if (this.m_CurTraitFilterIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(20);
        this.m_CurTraitFilterIndex = __Value;
        return;
    }
    TEUIModelRef<FVM_CommonDropdown> GetRarityFilter() const property
    {
        this.TrackPropertyRead(21);
        return this.m_RarityFilter;
    }
    void SetRarityFilter(const TEUIModelRef<FVM_CommonDropdown> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonDropdown> local_2;
        local_2 = this.m_RarityFilter;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(21);
        this.m_RarityFilter = __Value;
        return;
    }
    TEUIModelRef<FVM_CommonDropdown> GetTraitFilter() const property
    {
        this.TrackPropertyRead(22);
        return this.m_TraitFilter;
    }
    void SetTraitFilter(const TEUIModelRef<FVM_CommonDropdown> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonDropdown> local_2;
        local_2 = this.m_TraitFilter;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(22);
        this.m_TraitFilter = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare> GetInfoCompare() const property
    {
        this.TrackPropertyRead(23);
        return this.m_InfoCompare;
    }
    void SetInfoCompare(const TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare> local_2;
        local_2 = this.m_InfoCompare;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(23);
        this.m_InfoCompare = __Value;
        return;
    }
    bool GetbItemCompared() const property
    {
        this.TrackPropertyRead(24);
        return this.m_bItemCompared;
    }
    void SetbItemCompared(const bool __Value) property
    {
        if (!(this.m_bItemCompared) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(24);
        this.m_bItemCompared = __Value;
        return;
    }
    bool GetbBatchDecompose() const property
    {
        this.TrackPropertyRead(25);
        return this.m_bBatchDecompose;
    }
    void SetbBatchDecompose(const bool __Value) property
    {
        if (!(this.m_bBatchDecompose) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(25);
        this.m_bBatchDecompose = __Value;
        return;
    }
    const TSet<TEUIModelRef<FM_Equipment>> GetBatchDecomposeEquipmentSet() const property
    {
        const TSet<TEUIModelRef<FM_Equipment>> __r;
        this.TrackPropertyRead(26);
        return __r;
    }
    TSet<TEUIModelRef<FM_Equipment>> GetModify_BatchDecomposeEquipmentSet() property
    {
        TSet<TEUIModelRef<FM_Equipment>> __r;
        this.MarkPropertyDirty(26);
        return __r;
    }
    void SetBatchDecomposeEquipmentSet(const TSet<TEUIModelRef<FM_Equipment>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(26);
        this.m_BatchDecomposeEquipmentSet = __Value;
        return;
    }
    const TSet<EItemType> GetItemTypeSeenRecordSet() const property
    {
        const TSet<EItemType> __r;
        this.TrackPropertyRead(27);
        return __r;
    }
    TSet<EItemType> GetModify_ItemTypeSeenRecordSet() property
    {
        TSet<EItemType> __r;
        this.MarkPropertyDirty(27);
        return __r;
    }
    void SetItemTypeSeenRecordSet(const TSet<EItemType> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(27);
        this.m_ItemTypeSeenRecordSet = __Value;
        return;
    }
    const TArray<FAvatarShowcaseEntry> GetShowCaseAvatarEntries() const property
    {
        const TArray<FAvatarShowcaseEntry> __r;
        this.TrackPropertyRead(28);
        return __r;
    }
    TArray<FAvatarShowcaseEntry> GetModify_ShowCaseAvatarEntries() property
    {
        TArray<FAvatarShowcaseEntry> __r;
        this.MarkPropertyDirty(28);
        return __r;
    }
    void SetShowCaseAvatarEntries(const TArray<FAvatarShowcaseEntry> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(28);
        this.m_ShowCaseAvatarEntries = __Value;
        return;
    }
}

struct FMsg_AvatarEquipBatchDecomposeStateChange : FEUIMessage
{
    UPROPERTY()
    bool bBatchDecompose = false;


}

struct __GeneratedProperties_FVM_AvatarEquipmentMain
{
    UPROPERTY()
    FSoftBrush EquipmentDisplayIcon;
    UPROPERTY()
    ESlateVisibility EquipmentDisplayIconVisibility;
    UPROPERTY()
    ESlateVisibility ItemInfoCompareVisibility;
    UPROPERTY()
    FSoftBrush ItemSpecialBgImage;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarEquipmentMain> Self;


}

namespace AvatarEquipmentMainUtil
{
void GotoPage(const ULocalPlayer InLocalPlayer, const EEquipSlotType InEditingEquipSlot, const TDataObjectPtr<FAvatarPrefabConfig> &inout InAvatarConfig)
{
    FMS_EditingAvatar::Get(InLocalPlayer.GetWorld()).SetAvatarConfig(InAvatarConfig);
    FGameplayTag local_4 = FGameplayTag(GameplayTags::UI_Type_Avatar_EquipmentMain);
    FEUIWidgetRef local_6 = FEUIWidget::FindWidget(InLocalPlayer, local_4);
    if (!(local_6))
    {
        local_6 = FEUIWidget::AddWidget(InLocalPlayer, local_4);
    }
    if (!(!(local_6)))
    {
        FEUIWidgetRef::GetViewModel local_14;
        local_14.opCall(NAME_None).Setup();
    }
    return;
}
}
namespace FVM_AvatarEquipmentMain
{
FVM_AvatarEquipmentMain& Create(const UObject ContextObject)
{
    return FVM_AvatarEquipmentMain::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_AvatarEquipmentMain CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_AvatarEquipmentMain __r;
    TEUIModelRef<FVM_AvatarEquipmentMain> local_6 = TEUIModelRef<FVM_AvatarEquipmentMain>(EUIInternal::MakeModelWithManager(Manager, FVM_AvatarEquipmentMain::ModelId));
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
    local_14.PropertyName = "CurTitleText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IllustrateTypes";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FilterItems";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_AvatarEquipmentItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedItems";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarEquipmentItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RarityFilter";
    local_14.TypeName = "TEUIModelRef<FVM_CommonDropdown>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TraitFilter";
    local_14.TypeName = "TEUIModelRef<FVM_CommonDropdown>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "InfoCompare";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipmentDisplayIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EquipmentDisplayIconVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemInfoCompareVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemSpecialBgImage";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarEquipmentMain>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarEquipmentMain;
    FEUIModelMonitorDefine local_26;
    local_26.FunctionName = "__OnAvatarEquipmentChanged";
    local_26.ComponentType = FC_DSPlayerAvatarInfo;
    Result.MonitorFunctions.Add(local_26);
    FEUIModelMsgHandleDefine local_38;
    local_38.FunctionName = "__OnFMsg_TalismanSlotUnlockCountChange";
    local_38.MessageTypeName = "Msg_TalismanSlotUnlockCountChange";
    local_38.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_38);
    FEUIModelDirtyDefine local_50;
    local_50.FunctionName = "__OnSelectedItemIndexChanged";
    local_50.DirtyFlags.Set(FVM_AvatarEquipmentMain::__IndexOf_SelectedItemIndex());
    Result.DirtyFunctions.Add(local_50);
    local_50.FunctionName = "__OnFilterItemsChanged";
    local_50.DirtyFlags.Set(FVM_AvatarEquipmentMain::__IndexOf_FilterItems());
    Result.DirtyFunctions.Add(local_50);
    local_50.FunctionName = "__RefreshFilteredAvatarEquipmentList";
    local_50.DirtyFlags.Set(FVM_AvatarEquipmentMain::__IndexOf_FilterByIllustrate());
    Result.DirtyFunctions.Add(local_50);
    local_50.FunctionName = "__OnBatchDecomposeStateChanged";
    local_50.DirtyFlags.Set(FVM_AvatarEquipmentMain::__IndexOf_bBatchDecompose());
    Result.DirtyFunctions.Add(local_50);
    local_38.FunctionName = "__OnFMsg_AvatarEquipItemDecomposeSelectedUpdate";
    local_38.MessageTypeName = "Msg_ItemFeature_EquipMark_CheckableSelectedUpdate";
    local_38.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_38);
    local_38.FunctionName = "__OnItemDecomposeSuccessNotify";
    local_38.MessageTypeName = "Msg_ItemDecomposeSuccessNotify";
    local_38.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_38);
    local_38.FunctionName = "__OnInventoryChanged";
    local_38.MessageTypeName = "Msg_PlayerInventoryChanged";
    local_38.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_38);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarEquipmentMain;
}
void __OnAvatarEquipmentChanged(FVM_AvatarEquipmentMain &inout Model, const FECSEntity &inout Entity, const FC_DSPlayerAvatarInfo &inout Component)
{
    Model.OnAvatarEquipmentChanged(Component);
    return;
}
void __OnFMsg_TalismanSlotUnlockCountChange(FVM_AvatarEquipmentMain &inout Model, const FMsg_TalismanSlotUnlockCountChange &inout Message)
{
    Model.OnFMsg_TalismanSlotUnlockCountChange(Message);
    return;
}
void __OnSelectedItemIndexChanged(FVM_AvatarEquipmentMain &inout Model)
{
    Model.OnSelectedItemIndexChanged();
    return;
}
void __OnFilterItemsChanged(FVM_AvatarEquipmentMain &inout Model)
{
    Model.OnFilterItemsChanged();
    return;
}
void __RefreshFilteredAvatarEquipmentList(FVM_AvatarEquipmentMain &inout Model)
{
    Model.RefreshFilteredAvatarEquipmentList();
    return;
}
void __OnBatchDecomposeStateChanged(FVM_AvatarEquipmentMain &inout Model)
{
    Model.OnBatchDecomposeStateChanged();
    return;
}
void __OnFMsg_AvatarEquipItemDecomposeSelectedUpdate(FVM_AvatarEquipmentMain &inout Model, const FMsg_ItemFeature_EquipMark_CheckableSelectedUpdate &inout Message)
{
    Model.OnFMsg_AvatarEquipItemDecomposeSelectedUpdate(Message);
    return;
}
void __OnItemDecomposeSuccessNotify(FVM_AvatarEquipmentMain &inout Model, const FMsg_ItemDecomposeSuccessNotify &inout Message)
{
    Model.OnItemDecomposeSuccessNotify(Message);
    return;
}
void __OnInventoryChanged(FVM_AvatarEquipmentMain &inout Model, const FMsg_PlayerInventoryChanged &inout Message)
{
    Model.OnInventoryChanged(Message);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
FText __UIGetter_CurTitleText(const FVM_AvatarEquipmentMain &inout Model)
{
    return Model.GetCurTitleText();
}
TArray<FEUIModelContainer> __UIGetter_IllustrateTypes(const FVM_AvatarEquipmentMain &inout Model)
{
    return Model.GetIllustrateTypes();
}
TArray<TEUIModelRef<FVM_AvatarEquipmentItem>> __UIGetter_FilterItems(const FVM_AvatarEquipmentMain &inout Model)
{
    return Model.GetFilterItems();
}
TEUIModelRef<FVM_AvatarEquipmentItem> __UIGetter_SelectedItems(const FVM_AvatarEquipmentMain &inout Model)
{
    return Model.GetSelectedItems();
}
TEUIModelRef<FVM_CommonDropdown> __UIGetter_RarityFilter(const FVM_AvatarEquipmentMain &inout Model)
{
    return Model.GetRarityFilter();
}
TEUIModelRef<FVM_CommonDropdown> __UIGetter_TraitFilter(const FVM_AvatarEquipmentMain &inout Model)
{
    return Model.GetTraitFilter();
}
TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare> __UIGetter_InfoCompare(const FVM_AvatarEquipmentMain &inout Model)
{
    return Model.GetInfoCompare();
}
FSoftBrush __UIGetter_EquipmentDisplayIcon(const FVM_AvatarEquipmentMain &inout Model)
{
    return Model.GetEquipmentDisplayIcon();
}
ESlateVisibility __UIGetter_EquipmentDisplayIconVisibility(const FVM_AvatarEquipmentMain &inout Model)
{
    return Model.GetEquipmentDisplayIconVisibility();
}
ESlateVisibility __UIGetter_ItemInfoCompareVisibility(const FVM_AvatarEquipmentMain &inout Model)
{
    return Model.GetItemInfoCompareVisibility();
}
FSoftBrush __UIGetter_ItemSpecialBgImage(const FVM_AvatarEquipmentMain &inout Model)
{
    return Model.GetItemSpecialBgImage();
}
TEUIModelRef<FVM_AvatarEquipmentMain> __UIGetter_Self(const FVM_AvatarEquipmentMain &inout Model)
{
    return TEUIModelRef<FVM_AvatarEquipmentMain>(Model);
}
int __IndexOf_AvatarEquipmentTitleText()
{
    return 0;
}
int __IndexOf_AvatarDecomposeTitleText()
{
    return 1;
}
int __IndexOf_EquipmentDecomposePopupTitleText()
{
    return 2;
}
int __IndexOf_EquipmentDecomposePopupDescText()
{
    return 3;
}
int __IndexOf_EquipmentDecomposePopupRewardHintText()
{
    return 4;
}
int __IndexOf_CurTitleText()
{
    return 5;
}
int __IndexOf_EditingAvatar()
{
    return 6;
}
int __IndexOf_IllustrateListWidget()
{
    return 7;
}
int __IndexOf_SelectedIllustrateFilterItemIndex()
{
    return 8;
}
int __IndexOf_IllustrateTypes()
{
    return 9;
}
int __IndexOf_FilterByIllustrate()
{
    return 10;
}
int __IndexOf_SelectedItemIndex()
{
    return 11;
}
int __IndexOf_AllFilterItemsM()
{
    return 12;
}
int __IndexOf_FilterItems()
{
    return 13;
}
int __IndexOf_SelectedItems()
{
    return 14;
}
int __IndexOf_CurSlotEquipedItemUId()
{
    return 15;
}
int __IndexOf_Showcase()
{
    return 16;
}
int __IndexOf_RarityFilterList()
{
    return 17;
}
int __IndexOf_TraitFilterList()
{
    return 18;
}
int __IndexOf_CurRarityFilterIndex()
{
    return 19;
}
int __IndexOf_CurTraitFilterIndex()
{
    return 20;
}
int __IndexOf_RarityFilter()
{
    return 21;
}
int __IndexOf_TraitFilter()
{
    return 22;
}
int __IndexOf_InfoCompare()
{
    return 23;
}
int __IndexOf_bItemCompared()
{
    return 24;
}
int __IndexOf_bBatchDecompose()
{
    return 25;
}
int __IndexOf_BatchDecomposeEquipmentSet()
{
    return 26;
}
int __IndexOf_ItemTypeSeenRecordSet()
{
    return 27;
}
int __IndexOf_ShowCaseAvatarEntries()
{
    return 28;
}
}
namespace __GeneratedProperties_FVM_AvatarEquipmentMain
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}


namespace FVM_CraftableItem
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnSelected = FEUIModelCallbackSignature();
}
namespace FVM_ItemCraft
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnCraftableItemSelected = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature DoCraft = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SetCurrentCraftTypeIndex = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SwitchFocus = FEUIModelCallbackSignature();

}
struct FVM_CraftableItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    bool m_bLocked;
    UPROPERTY()
    bool m_bIsSelected;
    UPROPERTY()
    bool m_bDisableCraft;
    UPROPERTY()
    TDataObjectPtr<FCraftConfig> m_Config;
    UPROPERTY()
    TEUIModelRef<FVM_Item> m_Item;
    UPROPERTY()
    TEUIModelRef<FVM_ComposableItem> m_ComposableItem;
    UPROPERTY()
    TEUIModelRef<FVM_SelectableItem> m_SelectableItem;
    UPROPERTY()
    TEUIModelRef<FVM_EquipmentInfo> m_Equipment;
    UPROPERTY()
    FCraftableItemSelected m_CallbackOnItemSelected;

    FVM_CraftableItem()
    {
        this.m_bLocked = false;
        this.m_bIsSelected = false;
        this.m_bDisableCraft = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CraftableItem' by default constructor.");
        return;
    }
    FVM_CraftableItem(const FVM_CraftableItem &inout Other)
    {
        this.m_bLocked = false;
        this.m_bIsSelected = false;
        this.m_bDisableCraft = false;
        this.m_bLocked = Other.m_bLocked;
        this.m_bIsSelected = Other.m_bIsSelected;
        this.m_bDisableCraft = Other.m_bDisableCraft;
        this.m_Config = Other.m_Config;
        this.m_Item = Other.m_Item;
        this.m_ComposableItem = Other.m_ComposableItem;
        this.m_SelectableItem = Other.m_SelectableItem;
        this.m_Equipment = Other.m_Equipment;
        return;
    }
    FVM_CraftableItem(const TDataObjectPtr<FCraftConfig> &inout InConfig)
    {
        this.m_bLocked = false;
        this.m_bIsSelected = false;
        this.m_bDisableCraft = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetConfig(InConfig);
        return;
    }
    FVM_CraftableItem& opAssign(const FVM_CraftableItem &inout Other)
    {
        this.m_bLocked = Other.m_bLocked;
        this.m_bIsSelected = Other.m_bIsSelected;
        this.m_bDisableCraft = Other.m_bDisableCraft;
        this.m_Config = Other.m_Config;
        this.m_Item = Other.m_Item;
        this.m_ComposableItem = Other.m_ComposableItem;
        this.m_SelectableItem = Other.m_SelectableItem;
        return Other.m_Equipment;
    }
    void PostConstruct()
    {
        FItemParamConfig local_2;
        int local_26 = 0;
        int local_88 = 0;
        FVM_Item& local_6 = ::FVM_Item::CreateFromConfig(this.GetContext().Manager, local_2.Item, int(local_2.Count));
        local_6.SetNumStyle(EItemViewModelNumStyle(1));
        this.SetItem(TEUIModelRef<FVM_Item>(local_6));
        TEUIModelRef<FVM_ComposableItem> local_16 = TEUIModelRef<FVM_ComposableItem>(::FVM_ComposableItem::Create(this.GetContext().Manager, local_6.GetItemDataModel(), EItemDisplayScenario(4)));
        this.SetComposableItem(local_16);
        int64 local_22 = this.GetConfig().opArrow().DataId;
        FRedDotNodeData local_20 = FRedDotNodeData(GameplayTags::RedDotSystem_Craft_NewCraft, local_22);
        UEUIManagerSubsystem local_24 = this.GetManager();
        TEUIModelRef<FVM_RedDot> local_28 = TEUIModelRef<FVM_RedDot>(local_26);
        TEUIModelRef<FVM_ComposableItem> local_16_2 = this.GetComposableItem();
        this.SetSelectableItem(TEUIModelRef<FVM_SelectableItem>(::FVM_SelectableItem::Create(this.GetContext().Manager)));
        CastTo local_58;
        TDataObjectPtr<FEquipmentConfig> local_82 = local_58.opCall();
        if (local_82)
        {
            ::FMS_EquipmentDataCache::Get(this.GetContext().Manager).CreateFromConfig(local_82);
            local_88.SetPreviewMaxRandomTraitNum(local_82.opArrow().GetMaxRandomTrait());
            this.SetEquipment(TEUIModelRef<FVM_EquipmentInfo>(local_88));
        }
        return;
    }
    void OnSelected() const
    {
        if (this.GetCallbackOnItemSelected().IsBound())
        {
            this.GetCallbackOnItemSelected().Execute(FEUIModelRef(this));
        }
        return;
    }
    void OnSelectableItemSelectedChanged() const
    {
        if (this.GetSelectableItem().opArrow().GetbIsSelected())
        {
            this.OnSelected();
        }
        return;
    }
    void RefreshItemMask()
    {
        TEUIModelRef<FVM_ComposableItem> local_4 = this.GetComposableItem();
        ::ComposableItemUtility::SetItemMaskEnable((this.GetbLocked() || this.GetbDisableCraft()));
        if (this.GetbLocked())
        {
            TEUIModelRef<FVM_ComposableItem> local_4_2 = this.GetComposableItem();
            return;
        }
        if (this.GetbDisableCraft())
        {
            TEUIModelRef<FVM_ComposableItem> local_4_3 = this.GetComposableItem();
        }
        return;
    }
    bool GetbLocked() const property
    {
        this.TrackPropertyRead(0);
        return this.m_bLocked;
    }
    void SetbLocked(const bool __Value) property
    {
        if (!(this.m_bLocked) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_bLocked = __Value;
        return;
    }
    bool GetbIsSelected() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bIsSelected;
    }
    void SetbIsSelected(const bool __Value) property
    {
        if (!(this.m_bIsSelected) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bIsSelected = __Value;
        return;
    }
    bool GetbDisableCraft() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bDisableCraft;
    }
    void SetbDisableCraft(const bool __Value) property
    {
        if (!(this.m_bDisableCraft) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bDisableCraft = __Value;
        return;
    }
    TDataObjectPtr<FCraftConfig> GetConfig() const property
    {
        TDataObjectPtr<FCraftConfig> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TDataObjectPtr<FCraftConfig> GetModify_Config() property
    {
        TDataObjectPtr<FCraftConfig> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetConfig(const TDataObjectPtr<FCraftConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_Config = __Value;
        return;
    }
    TEUIModelRef<FVM_Item> GetItem() const property
    {
        this.TrackPropertyRead(4);
        return this.m_Item;
    }
    void SetItem(const TEUIModelRef<FVM_Item> &inout __Value) property
    {
        TEUIModelRef<FVM_Item> local_2;
        local_2 = this.m_Item;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_Item = __Value;
        return;
    }
    TEUIModelRef<FVM_ComposableItem> GetComposableItem() const property
    {
        this.TrackPropertyRead(5);
        return this.m_ComposableItem;
    }
    void SetComposableItem(const TEUIModelRef<FVM_ComposableItem> &inout __Value) property
    {
        TEUIModelRef<FVM_ComposableItem> local_2;
        local_2 = this.m_ComposableItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_ComposableItem = __Value;
        return;
    }
    TEUIModelRef<FVM_SelectableItem> GetSelectableItem() const property
    {
        this.TrackPropertyRead(6);
        return this.m_SelectableItem;
    }
    void SetSelectableItem(const TEUIModelRef<FVM_SelectableItem> &inout __Value) property
    {
        TEUIModelRef<FVM_SelectableItem> local_2;
        local_2 = this.m_SelectableItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_SelectableItem = __Value;
        return;
    }
    TEUIModelRef<FVM_EquipmentInfo> GetEquipment() const property
    {
        this.TrackPropertyRead(7);
        return this.m_Equipment;
    }
    void SetEquipment(const TEUIModelRef<FVM_EquipmentInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_EquipmentInfo> local_2;
        local_2 = this.m_Equipment;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_Equipment = __Value;
        return;
    }
    const FCraftableItemSelected GetCallbackOnItemSelected() const property
    {
        const FCraftableItemSelected __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    FCraftableItemSelected GetModify_CallbackOnItemSelected() property
    {
        FCraftableItemSelected __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetCallbackOnItemSelected(const FCraftableItemSelected &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        return;
    }
}

struct FCraftableItemVMSorter
{
    FCraftableItemVMSorter()
    {
        return;
    }
    bool opCall(const TEUIModelRef<FVM_CraftableItem> &inout A, const TEUIModelRef<FVM_CraftableItem> &inout B) const
    {
        FVM_CraftableItem& local_2;
        FVM_CraftableItem& local_4;
        if (!(local_2.GetbLocked()) != !(local_4.GetbLocked()))
        {
            return local_4.GetbLocked();
        }
        int local_7 = 0;
        if (local_2.GetEquipment())
        {
            TEUIModelRef<FM_Equipment> local_12 = local_2.GetEquipment().opArrow().GetEquipment();
            local_7 = local_12.opArrow().GetEquipmentConfig().opArrow().Level;
        }
        int local_13 = 0;
        if (local_4.GetEquipment())
        {
            TEUIModelRef<FM_Equipment> local_12_2 = local_4.GetEquipment().opArrow().GetEquipment();
            local_13 = local_12_2.opArrow().GetEquipmentConfig().opArrow().Level;
        }
        if (local_7 != local_13)
        {
            return (local_7 > local_13);
        }
        TEUIModelRef<FVM_Item> local_16 = local_2.GetItem();
        int local_8 = int(local_16.opArrow().GetItemConfig().opArrow().Rarity);
        TEUIModelRef<FVM_Item> local_16_2 = local_4.GetItem();
        int local_14 = int(local_16_2.opArrow().GetItemConfig().opArrow().Rarity);
        if (local_8 != local_14)
        {
            return (local_8 > local_14);
        }
        return (local_2.GetConfig().opArrow().DataId > local_4.GetConfig().opArrow().DataId);
    }
}

struct FCraftableCostSorter
{
    UPROPERTY()
    FItemVMRaritySorter SorterImpl;

    FCraftableCostSorter()
    {
        return;
    }
    bool opCall(const FItemParamConfig &inout ConfigA, const FItemParamConfig &inout ConfigB)
    {
        int local_3 = int(ConfigA.Item.opArrow().Rarity);
        int local_4 = int(ConfigB.Item.opArrow().Rarity);
        return (local_3 > local_4);
    }
}

struct FVM_ItemCraft : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<ECraftType> m_CraftTypes;
    UPROPERTY()
    int m_SelectedCraftTypeIndex;
    UPROPERTY()
    TEUIModelRef<FMS_Craft> m_CraftModel;
    UPROPERTY()
    TEUIModelRef<FVM_QualitySelector> m_CraftQuality;
    UPROPERTY()
    TEUIModelRef<FVM_CraftableItem> m_CurrentCraft;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> m_CurrentCraftItemConfig;
    UPROPERTY()
    bool m_bCanDoCurrentCraft;
    UPROPERTY()
    bool m_bCurrentCraftUnlocked;
    UPROPERTY()
    TArray<FEUIModelContainer> m_CurrentCraftableItemsComposable;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CraftableItem>> m_AllCraftableItems;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CommonRewardItem>> m_CraftConsumeRewards;
    UPROPERTY()
    TArray<FEUIModelContainer> m_CurrentUnlockConditions;
    UPROPERTY()
    TEUIModelRef<FMS_PlayerInventory> m_PlayerInventory;
    UPROPERTY()
    TEUIModelRef<FVM_CommonItem> m_CurrentCommonItem;
    UPROPERTY()
    TEUIModelRef<FVM_CommonConsume> m_CurrentCommonConsume;
    UPROPERTY()
    TArray<FItemParamConfig> m_SortedCraftConsumeConfig;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_RedDot>> m_ViewedRedDots;
    UPROPERTY()
    int m_RestoreSelectedCraftIndex;
    UPROPERTY()
    int m_SwitchFocusTrigger;

    FVM_ItemCraft()
    {
        this.m_SelectedCraftTypeIndex = -1;
        this.m_bCanDoCurrentCraft = false;
        this.m_bCurrentCraftUnlocked = false;
        this.m_RestoreSelectedCraftIndex = 0;
        this.m_SwitchFocusTrigger = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_ItemCraft(const FVM_ItemCraft &inout Other)
    {
        this.m_SelectedCraftTypeIndex = -1;
        this.m_bCanDoCurrentCraft = false;
        this.m_bCurrentCraftUnlocked = false;
        this.m_RestoreSelectedCraftIndex = 0;
        this.m_SwitchFocusTrigger = 0;
        this.m_CraftTypes = Other.m_CraftTypes;
        this.m_SelectedCraftTypeIndex = int(Other.m_SelectedCraftTypeIndex);
        this.m_CraftModel = Other.m_CraftModel;
        this.m_CraftQuality = Other.m_CraftQuality;
        this.m_CurrentCraft = Other.m_CurrentCraft;
        this.m_CurrentCraftItemConfig = Other.m_CurrentCraftItemConfig;
        this.m_bCanDoCurrentCraft = Other.m_bCanDoCurrentCraft;
        this.m_bCurrentCraftUnlocked = Other.m_bCurrentCraftUnlocked;
        this.m_CurrentCraftableItemsComposable = Other.m_CurrentCraftableItemsComposable;
        this.m_AllCraftableItems = Other.m_AllCraftableItems;
        this.m_CraftConsumeRewards = Other.m_CraftConsumeRewards;
        this.m_CurrentUnlockConditions = Other.m_CurrentUnlockConditions;
        this.m_PlayerInventory = Other.m_PlayerInventory;
        this.m_CurrentCommonItem = Other.m_CurrentCommonItem;
        this.m_CurrentCommonConsume = Other.m_CurrentCommonConsume;
        this.m_SortedCraftConsumeConfig = Other.m_SortedCraftConsumeConfig;
        this.m_ViewedRedDots = Other.m_ViewedRedDots;
        this.m_RestoreSelectedCraftIndex = int(Other.m_RestoreSelectedCraftIndex);
        this.m_SwitchFocusTrigger = int(Other.m_SwitchFocusTrigger);
        return;
    }
    FVM_ItemCraft opAssign(const FVM_ItemCraft &inout Other)
    {
        FVM_ItemCraft __r;
        this.m_CraftTypes = Other.m_CraftTypes;
        this.m_SelectedCraftTypeIndex = int(Other.m_SelectedCraftTypeIndex);
        this.m_CraftModel = Other.m_CraftModel;
        this.m_CraftQuality = Other.m_CraftQuality;
        this.m_CurrentCraft = Other.m_CurrentCraft;
        this.m_CurrentCraftItemConfig = Other.m_CurrentCraftItemConfig;
        this.m_bCanDoCurrentCraft = Other.m_bCanDoCurrentCraft;
        this.m_bCurrentCraftUnlocked = Other.m_bCurrentCraftUnlocked;
        this.m_CurrentCraftableItemsComposable = Other.m_CurrentCraftableItemsComposable;
        this.m_AllCraftableItems = Other.m_AllCraftableItems;
        this.m_CraftConsumeRewards = Other.m_CraftConsumeRewards;
        this.m_CurrentUnlockConditions = Other.m_CurrentUnlockConditions;
        this.m_PlayerInventory = Other.m_PlayerInventory;
        this.m_CurrentCommonItem = Other.m_CurrentCommonItem;
        this.m_CurrentCommonConsume = Other.m_CurrentCommonConsume;
        this.m_SortedCraftConsumeConfig = Other.m_SortedCraftConsumeConfig;
        this.m_ViewedRedDots = Other.m_ViewedRedDots;
        this.m_RestoreSelectedCraftIndex = int(Other.m_RestoreSelectedCraftIndex);
        this.m_SwitchFocusTrigger = int(Other.m_SwitchFocusTrigger);
        return __r;
    }
    void LoadConfig(const FConfigVM_ItemCraft &inout InConfig)
    {
        this.SetCraftTypes(InConfig.CraftTypes);
        return;
    }
    void BeginDestroy()
    {
        this.FlushViewedRedDot();
        return;
    }
    void FlushViewedRedDot()
    {
        FVM_RedDot& local_22;
        if (this.GetViewedRedDots().Num() > 0)
        {
            FMS_RedDotSystem& local_6 = ::FMS_RedDotSystem::Get(this.GetContext().Manager);
            if (local_6)
            {
                for (auto& local_20 : this.GetViewedRedDots())
                {
                    local_20;
                    if (local_22)
                    {
                        local_6.ConsumeRedDot(local_22.GetNodeData().NodeTag, local_22.GetNodeData().ExtraDataId);
                    }
                }
            }
            this.GetModify_ViewedRedDots().Reset(0);
        }
        return;
    }
    bool ShowCraftItemIcon() const
    {
        TDataObjectPtr<FItemConfig> local_24;
        local_24 = this.GetCurrentCraftItemConfig();
        return (!((local_24 == nullptr)));
    }
    FSlateBrush CurrentCraftItemIcon() const
    {
        if (this.GetCurrentCraftItemConfig())
        {
            return this.GetCurrentCraftItemConfig().opArrow().ItemIcon.LoadBrush();
        }
        return FSlateBrush();
    }
    bool GetCurrentCraftIsLocked() const
    {
        return !(this.GetbCurrentCraftUnlocked());
    }
    int GetCurrentCraftSwitcherIndex() const
    {
        return this.GetbCurrentCraftUnlocked() ? 0 : 1;
    }
    bool OnCraftableItemSelected(const TEUIModelRef<FVM_CraftableItem> &inout Item)
    {
        if (this.GetCurrentCraft())
        {
            this.GetCurrentCraft().opArrow().SetbIsSelected(false);
        }
        this.SetCurrentCraft(Item);
        this.GetCurrentCraft().opArrow().SetbIsSelected(true);
        this.GetCraftModel().opArrow().SetLastSelectedCraftId(this.GetCurrentCraft().opArrow().GetConfig().opArrow().DataId);
        FMS_RedDotSystem& local_10 = ::FMS_RedDotSystem::Get(this.GetContext().Manager);
        if (local_10)
        {
            int64 local_12 = this.GetCurrentCraft().opArrow().GetConfig().opArrow().DataId;
            local_10.ConsumeRedDot(GameplayTags::RedDotSystem_Craft_NewCraft, local_12);
        }
        return true;
    }
    void DoCraft()
    {
        if (this.GetCurrentCraft() && (this.GetCraftQuality().opArrow().GetCurrentNum() > 0) && !(this.GetCurrentCraft().opArrow().GetbLocked()))
        {
            TEUIModelRef<FVM_CraftableItem> local_8 = this.GetCurrentCraft();
            FCraftConfig local_12;
            ::FMS_Craft::Get(this.GetContext().Manager).GS_RequestCraft(int(local_12.DataId), this.GetCraftQuality().opArrow().GetCurrentNum());
        }
        return;
    }
    void PostLoad()
    {
        int local_50 = 0;
        this.SetCraftModel(TEUIModelRef<FMS_Craft>(::FMS_Craft::Get(this.GetContext().Manager)));
        this.SetCraftQuality(TEUIModelRef<FVM_QualitySelector>(::FVM_QualitySelector::Create(this.GetContext().Manager)));
        TDataObjectIterator<FCraftConfig> local_20;
        for (; local_20; )
        {
            if (this.GetCraftTypes().Contains(local_20.GetData().CraftType))
            {
                local_50.GetCallbackOnItemSelected().Bind(this, FVM_ItemCraft::OnCraftableItemSelected);
                this.GetModify_AllCraftableItems().Add(TEUIModelRef<FVM_CraftableItem>(local_50));
            }
            local_20.Next();
        }
        this.RefreshCraftableItemsUnlockState();
        this.SetPlayerInventory(TEUIModelRef<FMS_PlayerInventory>(::FMS_PlayerInventory::Get(this.GetContext().Manager)));
        this.SetSelectedCraftTypeIndex(0);
        return;
    }
    void RefreshCraftableItemsUnlockState()
    {
        int local_4 = 0;
        TEUIModelRef<FMS_Craft> local_2 = this.GetCraftModel();
        for (auto& local_20 : this.GetAllCraftableItems())
        {
            local_20.opArrow().SetbLocked(!(local_4.GetUnlockedCraftConfigs().Contains(local_20.opArrow().GetConfig().opArrow().DataId)));
        }
        return;
    }
    void OnPlayerInventoryChanged(const FMsg_PlayerInventoryChanged &inout Msg)
    {
        this.RefreshCraftableItemsEnableState();
        this.RefreshMaxCraftNum();
        return;
    }
    void RefreshCraftableItemsEnableState()
    {
        int local_22 = 0;
        for (auto& local_16 : this.GetAllCraftableItems())
        {
            bool local_13 = false;
            if (local_16.opArrow().GetbLocked())
            {
                local_13 = true;
            }
            else
            {
                TArray<FItemParamConfig> local_24;
                TEUIModelRef<FMS_PlayerInventory> local_20 = this.GetPlayerInventory();
                for (auto& local_38 : local_24)
                {
                    if (local_22.GetTotalItemNum(local_38.Item) < int(local_38.Count))
                    {
                        local_13 = true;
                        break;
                    }
                }
            }
            local_16.opArrow().SetbDisableCraft();
        }
        return;
    }
    void OnSelectedCraftTypeChanged()
    {
        int local_36 = 0;
        if (this.GetCraftTypes().IsValidIndex(this.GetSelectedCraftTypeIndex()))
        {
            ECraftType local_3;
            this.FlushViewedRedDot();
            local_3 = this.GetCraftTypes()[this.GetSelectedCraftTypeIndex()];
            TArray<FEUIModelContainer>& local_6 = this.GetModify_CurrentCraftableItemsComposable();
            int local_7 = 0;
            local_6.Reset(0);
            int local_8 = 0;
            for (auto& local_22 : this.GetAllCraftableItems())
            {
                ECraftType local_4 = local_22.opArrow().GetConfig().opArrow().CraftType;
                if (int(local_4) == (int(local_3)))
                {
                    int64 local_32 = local_22.opArrow().GetConfig().opArrow().DataId;
                    FRedDotNodeData local_28 = FRedDotNodeData(GameplayTags::RedDotSystem_Craft_NewCraft, local_32);
                    UEUIManagerSubsystem local_34 = this.GetManager();
                    if (local_36.HasRedDot())
                    {
                        this.GetModify_ViewedRedDots().AddUnique(TEUIModelRef<FVM_RedDot>(local_36));
                    }
                    FEUIModelContainer local_52;
                    local_52.AddModel(local_22.opArrow().GetComposableItem().opImplConv(), false);
                    local_52.AddModel(local_22.opArrow().GetSelectableItem().opImplConv(), false);
                    local_6.Add(local_52);
                    if (local_22.opArrow().GetConfig().opArrow().DataId == this.GetCraftModel().opArrow().GetLastSelectedCraftId())
                    {
                        local_7 = local_8;
                    }
                    local_8 = local_8 + 1;
                }
            }
            if (local_8 == 0)
            {
                this.SetCurrentCraft(TEUIModelRef<FVM_CraftableItem>(nullptr));
            }
            this.SetRestoreSelectedCraftIndex(local_7);
        }
        return;
    }
    void SetCurrentCraftTypeIndex(const int Index)
    {
        this.SetSelectedCraftTypeIndex(Index);
        return;
    }
    void RefreshCurrentCraft()
    {
        FVM_CraftableItem& local_10;
        this.SetbCurrentCraftUnlocked(false);
        this.GetCraftQuality().opArrow().SetCurrentNumValue(1);
        TEUIModelRef<FVM_CraftableItem> local_8 = this.GetCurrentCraft();
        if (local_10)
        {
            const FCraftConfig& local_18;
            this.SetbCurrentCraftUnlocked(!(local_10.GetbLocked()));
            this.SetCurrentCommonItem(TEUIModelRef<FVM_CommonItem>(::FVM_CommonItem::Create(this.GetContext().Manager, local_10.GetItem().opArrow().GetItemDataModel())));
            this.SetCurrentCraftItemConfig(local_18.Product.Item);
            TArray<FRewardItemEntry> local_22;
            this.GetModify_SortedCraftConsumeConfig().Reset(0);
            auto local_28 = local_18.Cost.Iterator();
            for (; local_28.CanProceed;)
            {
                this.GetModify_SortedCraftConsumeConfig().Add(local_28.Proceed());
            }
            int local_5 = this.GetSortedCraftConsumeConfig().Num();
            if (this.GetCraftConsumeRewards().Num() != local_5)
            {
                this.GetModify_CraftConsumeRewards().SetNum(local_5);
            }
            int local_40 = 0;
            for (; local_40 < this.GetSortedCraftConsumeConfig().Num(); )
            {
                const FItemParamConfig& local_36 = this.GetSortedCraftConsumeConfig()[local_40];
                bool local_1 = !(this.GetCraftConsumeRewards()[local_40]) || !(this.GetCraftConsumeRewards()[local_40].opArrow().GetItem());
                if (local_1)
                {
                    local_1 = true;
                }
                else
                {
                    FDataObjectPtr local_114;
                    TDataObjectPtr<FItemConfig> local_66;
                    local_66 = this.GetCraftConsumeRewards()[local_40].opArrow().GetItem().opArrow().GetItemConfig();
                    local_114;
                    local_1 = !((local_66 == local_114));
                }
                if (local_1)
                {
                    FEUIModelContainer local_128;
                    int local_129 = int(local_36.Count);
                    local_128.AddModel(FEUIModelRef(), false);
                    this.GetModify_CraftConsumeRewards()[local_40] = TEUIModelRef<FVM_CommonRewardItem>(::FVM_CommonRewardItem::Create(this.GetContext().Manager, local_128, true));
                }
                local_22.Add(FRewardItemEntry(local_36.Item.opArrow().DataId, int(local_36.Count)));
                ++local_40;
            }
            this.SetCurrentCommonConsume(TEUIModelRef<FVM_CommonConsume>(::FVM_CommonConsume::Create(this.GetContext().Manager, local_22)));
            this.GetModify_CurrentUnlockConditions().Reset(0);
            if (local_18.GetUnlockCond())
            {
                this.GetModify_CurrentUnlockConditions().Add(FEUIModelContainer(::FVM_CommonActionEntry::Create(this.GetContext().Manager)));
            }
        }
        else
        {
            this.SetCurrentCraftItemConfig(TDataObjectPtr<FItemConfig>(nullptr));
            this.SetCurrentCommonItem(TEUIModelRef<FVM_CommonItem>(nullptr));
            this.SetCurrentCommonConsume(TEUIModelRef<FVM_CommonConsume>(nullptr));
            this.GetModify_CurrentUnlockConditions().Reset(0);
        }
        return;
    }
    void MonitorGameplayItemBankChange(const FC_GameplayItemBank &inout GameplayItemBank)
    {
        this.RefreshMaxCraftNum();
        return;
    }
    void RefreshMaxCraftNum()
    {
        int local_6 = 0;
        int local_12 = 0;
        int local_18 = 0;
        this.SetbCanDoCurrentCraft(this.GetbCurrentCraftUnlocked());
        TEUIModelRef<FVM_QualitySelector> local_4 = this.GetCraftQuality();
        local_6.SetCurrentNumValue(1);
        TEUIModelRef<FMS_PlayerInventory> local_10 = this.GetPlayerInventory();
        int local_13 = 2147483647;
        if (this.GetCurrentCraft())
        {
            TDataObjectPtr<FItemConfig> local_30;
            TEUIModelRef<FVM_CraftableItem> local_16 = this.GetCurrentCraft();
            int local_19 = 0;
            for (; local_19 < local_18.Cost.Num(); )
            {
                const FItemParamConfig& local_22 = local_18.Cost[local_19];
                local_13 = FMath::Min(local_13, FMath::FloorToInt((local_12.GetTotalItemNum(local_22.Item) / int(local_22.Count))));
                ++local_19;
            }
            if (::ItemConfigUtils::LimitOwnMax(local_30) || ::ItemConfigUtils::LimitInventoryMax(local_30) || ::ItemConfigUtils::LimitTrunkMax(local_30))
            {
                int local_7 = local_12.GetItemNumToReachInventoryAndBankLimit(local_30);
                local_13 = FMath::Min(FMath::Max(local_7, 1), local_13);
            }
        }
        if (local_13 == 2147483647 || (local_13 == 0))
        {
            this.SetbCanDoCurrentCraft(false);
            local_13 = 1;
        }
        this.GetCraftQuality().opArrow().SetMaxNum(local_13);
        if (this.GetCraftQuality().opArrow().GetCurrentNum() > local_13)
        {
            this.GetCraftQuality().opArrow().SetCurrentNumValue(local_13);
        }
        return;
    }
    void RefreshCraftConsumeNum()
    {
        int local_4 = 0;
        bool local_9;
        int local_90 = 0;
        TEUIModelRef<FVM_QualitySelector> local_2 = this.GetCraftQuality();
        int local_5 = 0;
        int local_7 = 0;
        for (; local_7 < this.GetSortedCraftConsumeConfig().Num(); ++local_7)
        {
            const FItemParamConfig& local_12 = this.GetSortedCraftConsumeConfig()[local_7];
            if (!(this.GetCraftConsumeRewards().IsValidIndex(local_5)))
            {
                local_9 = false;
            }
            else
            {
                local_9 = this.GetCraftConsumeRewards()[local_5].opArrow().GetItem();
            }
            if (!(local_9))
            {
                local_9 = false;
            }
            else
            {
                FDataObjectPtr local_88;
                TDataObjectPtr<FItemConfig> local_40;
                local_40 = this.GetCraftConsumeRewards()[local_5].opArrow().GetItem().opArrow().GetItemConfig();
                local_88;
                local_9 = (local_40 == local_88);
            }
            if (local_9)
            {
                TEUIModelRef<FVM_Item> local_14 = this.GetCraftConsumeRewards()[local_5].opArrow().GetItem();
                local_90.SetNum((int(local_12.Count) * local_4.GetCurrentNum()));
                ++local_5;
            }
        }
        if (this.GetCurrentCommonConsume().IsValid())
        {
            this.GetCurrentCommonConsume().opArrow().SetItemMultiplier(local_4.GetCurrentNum());
        }
        return;
    }
    void SwitchFocus()
    {
        this.SetSwitchFocusTrigger((this.GetSwitchFocusTrigger() + 1));
        return;
    }
    const TArray<ECraftType> GetCraftTypes() const property
    {
        const TArray<ECraftType> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<ECraftType> GetModify_CraftTypes() property
    {
        TArray<ECraftType> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetCraftTypes(const TArray<ECraftType> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CraftTypes = __Value;
        return;
    }
    int GetSelectedCraftTypeIndex() const property
    {
        this.TrackPropertyRead(1);
        return this.m_SelectedCraftTypeIndex;
    }
    void SetSelectedCraftTypeIndex(const int __Value) property
    {
        if (this.m_SelectedCraftTypeIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SelectedCraftTypeIndex = __Value;
        return;
    }
    TEUIModelRef<FMS_Craft> GetCraftModel() const property
    {
        this.TrackPropertyRead(2);
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
        this.MarkPropertyDirty(2);
        this.m_CraftModel = __Value;
        return;
    }
    TEUIModelRef<FVM_QualitySelector> GetCraftQuality() const property
    {
        this.TrackPropertyRead(3);
        return this.m_CraftQuality;
    }
    void SetCraftQuality(const TEUIModelRef<FVM_QualitySelector> &inout __Value) property
    {
        TEUIModelRef<FVM_QualitySelector> local_2;
        local_2 = this.m_CraftQuality;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CraftQuality = __Value;
        return;
    }
    TEUIModelRef<FVM_CraftableItem> GetCurrentCraft() const property
    {
        this.TrackPropertyRead(4);
        return this.m_CurrentCraft;
    }
    void SetCurrentCraft(const TEUIModelRef<FVM_CraftableItem> &inout __Value) property
    {
        TEUIModelRef<FVM_CraftableItem> local_2;
        local_2 = this.m_CurrentCraft;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_CurrentCraft = __Value;
        return;
    }
    const TDataObjectPtr<FItemConfig> GetCurrentCraftItemConfig() const property
    {
        const TDataObjectPtr<FItemConfig> __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    TDataObjectPtr<FItemConfig> GetModify_CurrentCraftItemConfig() property
    {
        TDataObjectPtr<FItemConfig> __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetCurrentCraftItemConfig(const TDataObjectPtr<FItemConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_CurrentCraftItemConfig = __Value;
        return;
    }
    bool GetbCanDoCurrentCraft() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bCanDoCurrentCraft;
    }
    void SetbCanDoCurrentCraft(const bool __Value) property
    {
        if (!(this.m_bCanDoCurrentCraft) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bCanDoCurrentCraft = __Value;
        return;
    }
    bool GetbCurrentCraftUnlocked() const property
    {
        this.TrackPropertyRead(7);
        return this.m_bCurrentCraftUnlocked;
    }
    void SetbCurrentCraftUnlocked(const bool __Value) property
    {
        if (!(this.m_bCurrentCraftUnlocked) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_bCurrentCraftUnlocked = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetCurrentCraftableItemsComposable() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_CurrentCraftableItemsComposable() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetCurrentCraftableItemsComposable(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_CurrentCraftableItemsComposable = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_CraftableItem>> GetAllCraftableItems() const property
    {
        const TArray<TEUIModelRef<FVM_CraftableItem>> __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    TArray<TEUIModelRef<FVM_CraftableItem>> GetModify_AllCraftableItems() property
    {
        TArray<TEUIModelRef<FVM_CraftableItem>> __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetAllCraftableItems(const TArray<TEUIModelRef<FVM_CraftableItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_AllCraftableItems = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_CommonRewardItem>> GetCraftConsumeRewards() const property
    {
        const TArray<TEUIModelRef<FVM_CommonRewardItem>> __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    TArray<TEUIModelRef<FVM_CommonRewardItem>> GetModify_CraftConsumeRewards() property
    {
        TArray<TEUIModelRef<FVM_CommonRewardItem>> __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetCraftConsumeRewards(const TArray<TEUIModelRef<FVM_CommonRewardItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_CraftConsumeRewards = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetCurrentUnlockConditions() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_CurrentUnlockConditions() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetCurrentUnlockConditions(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_CurrentUnlockConditions = __Value;
        return;
    }
    TEUIModelRef<FMS_PlayerInventory> GetPlayerInventory() const property
    {
        this.TrackPropertyRead(12);
        return this.m_PlayerInventory;
    }
    void SetPlayerInventory(const TEUIModelRef<FMS_PlayerInventory> &inout __Value) property
    {
        TEUIModelRef<FMS_PlayerInventory> local_2;
        local_2 = this.m_PlayerInventory;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_PlayerInventory = __Value;
        return;
    }
    TEUIModelRef<FVM_CommonItem> GetCurrentCommonItem() const property
    {
        this.TrackPropertyRead(13);
        return this.m_CurrentCommonItem;
    }
    void SetCurrentCommonItem(const TEUIModelRef<FVM_CommonItem> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonItem> local_2;
        local_2 = this.m_CurrentCommonItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_CurrentCommonItem = __Value;
        return;
    }
    TEUIModelRef<FVM_CommonConsume> GetCurrentCommonConsume() const property
    {
        this.TrackPropertyRead(14);
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
        this.MarkPropertyDirty(14);
        this.m_CurrentCommonConsume = __Value;
        return;
    }
    const TArray<FItemParamConfig> GetSortedCraftConsumeConfig() const property
    {
        const TArray<FItemParamConfig> __r;
        this.TrackPropertyRead(15);
        return __r;
    }
    TArray<FItemParamConfig> GetModify_SortedCraftConsumeConfig() property
    {
        TArray<FItemParamConfig> __r;
        this.MarkPropertyDirty(15);
        return __r;
    }
    void SetSortedCraftConsumeConfig(const TArray<FItemParamConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_SortedCraftConsumeConfig = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_RedDot>> GetViewedRedDots() const property
    {
        const TArray<TEUIModelRef<FVM_RedDot>> __r;
        this.TrackPropertyRead(16);
        return __r;
    }
    TArray<TEUIModelRef<FVM_RedDot>> GetModify_ViewedRedDots() property
    {
        TArray<TEUIModelRef<FVM_RedDot>> __r;
        this.MarkPropertyDirty(16);
        return __r;
    }
    void SetViewedRedDots(const TArray<TEUIModelRef<FVM_RedDot>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_ViewedRedDots = __Value;
        return;
    }
    int GetRestoreSelectedCraftIndex() const property
    {
        this.TrackPropertyRead(17);
        return this.m_RestoreSelectedCraftIndex;
    }
    void SetRestoreSelectedCraftIndex(const int __Value) property
    {
        if (this.m_RestoreSelectedCraftIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_RestoreSelectedCraftIndex = __Value;
        return;
    }
    int GetSwitchFocusTrigger() const property
    {
        this.TrackPropertyRead(18);
        return this.m_SwitchFocusTrigger;
    }
    void SetSwitchFocusTrigger(const int __Value) property
    {
        if (this.m_SwitchFocusTrigger == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(18);
        this.m_SwitchFocusTrigger = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CraftableItem
{
    UPROPERTY()
    TEUIModelRef<FVM_CraftableItem> Self;

    __GeneratedProperties_FVM_CraftableItem()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_ItemCraft
{
    UPROPERTY()
    bool ShowCraftItemIcon;
    UPROPERTY()
    FSlateBrush CurrentCraftItemIcon;
    UPROPERTY()
    bool CurrentCraftIsLocked;
    UPROPERTY()
    int CurrentCraftSwitcherIndex;
    UPROPERTY()
    TEUIModelRef<FVM_ItemCraft> Self;


}

namespace FVM_CraftableItem
{
FVM_CraftableItem& Create(const UObject ContextObject, const TDataObjectPtr<FCraftConfig> &inout Config)
{
    return FVM_CraftableItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), Config);
}
FVM_CraftableItem CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FCraftConfig> &inout Config)
{
    FVM_CraftableItem __r;
    TEUIModelRef<FVM_CraftableItem> local_6 = TEUIModelRef<FVM_CraftableItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CraftableItem::ModelId, 0, Config));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_CraftableItem;
}
void __OnSelectableItemSelectedChanged(FVM_CraftableItem &inout Model)
{
    Model.OnSelectableItemSelectedChanged();
    return;
}
bool __UIGetter_bLocked(const FVM_CraftableItem &inout Model)
{
    return Model.GetbLocked();
}
bool __UIGetter_bIsSelected(const FVM_CraftableItem &inout Model)
{
    return Model.GetbIsSelected();
}
bool __UIGetter_bDisableCraft(const FVM_CraftableItem &inout Model)
{
    return Model.GetbDisableCraft();
}
TEUIModelRef<FVM_Item> __UIGetter_Item(const FVM_CraftableItem &inout Model)
{
    return Model.GetItem();
}
TEUIModelRef<FVM_ComposableItem> __UIGetter_ComposableItem(const FVM_CraftableItem &inout Model)
{
    return Model.GetComposableItem();
}
TEUIModelRef<FVM_SelectableItem> __UIGetter_SelectableItem(const FVM_CraftableItem &inout Model)
{
    return Model.GetSelectableItem();
}
TEUIModelRef<FVM_EquipmentInfo> __UIGetter_Equipment(const FVM_CraftableItem &inout Model)
{
    return Model.GetEquipment();
}
TEUIModelRef<FVM_CraftableItem> __UIGetter_Self(const FVM_CraftableItem &inout Model)
{
    return TEUIModelRef<FVM_CraftableItem>(Model);
}
int __IndexOf_bLocked()
{
    return 0;
}
int __IndexOf_bIsSelected()
{
    return 1;
}
int __IndexOf_bDisableCraft()
{
    return 2;
}
int __IndexOf_Config()
{
    return 3;
}
int __IndexOf_Item()
{
    return 4;
}
int __IndexOf_ComposableItem()
{
    return 5;
}
int __IndexOf_SelectableItem()
{
    return 6;
}
int __IndexOf_Equipment()
{
    return 7;
}
int __IndexOf_CallbackOnItemSelected()
{
    return 8;
}
}
namespace __GeneratedProperties_FVM_CraftableItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_ItemCraft
{
FVM_ItemCraft& Create(const UObject ContextObject)
{
    return FVM_ItemCraft::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_ItemCraft CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_ItemCraft __r;
    TEUIModelRef<FVM_ItemCraft> local_6 = TEUIModelRef<FVM_ItemCraft>(EUIInternal::MakeModelWithManager(Manager, FVM_ItemCraft::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_ItemCraft;
}
void __RefreshCraftableItemsUnlockState(FVM_ItemCraft &inout Model)
{
    Model.RefreshCraftableItemsUnlockState();
    return;
}
void __OnPlayerInventoryChanged(FVM_ItemCraft &inout Model, const FMsg_PlayerInventoryChanged &inout Message)
{
    Model.OnPlayerInventoryChanged(Message);
    return;
}
void __RefreshCraftableItemsEnableState(FVM_ItemCraft &inout Model)
{
    Model.RefreshCraftableItemsEnableState();
    return;
}
void __OnSelectedCraftTypeChanged(FVM_ItemCraft &inout Model)
{
    Model.OnSelectedCraftTypeChanged();
    return;
}
void __RefreshCurrentCraft(FVM_ItemCraft &inout Model)
{
    Model.RefreshCurrentCraft();
    return;
}
void __MonitorGameplayItemBankChange(FVM_ItemCraft &inout Model, const FECSEntity &inout Entity, const FC_GameplayItemBank &inout Component)
{
    Model.MonitorGameplayItemBankChange(Component);
    return;
}
void __RefreshMaxCraftNum(FVM_ItemCraft &inout Model)
{
    Model.RefreshMaxCraftNum();
    return;
}
void __RefreshCraftConsumeNum(FVM_ItemCraft &inout Model)
{
    Model.RefreshCraftConsumeNum();
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
TEUIModelRef<FVM_QualitySelector> __UIGetter_CraftQuality(const FVM_ItemCraft &inout Model)
{
    return Model.GetCraftQuality();
}
TEUIModelRef<FVM_CraftableItem> __UIGetter_CurrentCraft(const FVM_ItemCraft &inout Model)
{
    return Model.GetCurrentCraft();
}
TDataObjectPtr<FItemConfig> __UIGetter_CurrentCraftItemConfig(const FVM_ItemCraft &inout Model)
{
    return Model.GetCurrentCraftItemConfig();
}
bool __UIGetter_bCanDoCurrentCraft(const FVM_ItemCraft &inout Model)
{
    return Model.GetbCanDoCurrentCraft();
}
bool __UIGetter_bCurrentCraftUnlocked(const FVM_ItemCraft &inout Model)
{
    return Model.GetbCurrentCraftUnlocked();
}
TArray<FEUIModelContainer> __UIGetter_CurrentCraftableItemsComposable(const FVM_ItemCraft &inout Model)
{
    return Model.GetCurrentCraftableItemsComposable();
}
TArray<TEUIModelRef<FVM_CraftableItem>> __UIGetter_AllCraftableItems(const FVM_ItemCraft &inout Model)
{
    return Model.GetAllCraftableItems();
}
TArray<TEUIModelRef<FVM_CommonRewardItem>> __UIGetter_CraftConsumeRewards(const FVM_ItemCraft &inout Model)
{
    return Model.GetCraftConsumeRewards();
}
TArray<FEUIModelContainer> __UIGetter_CurrentUnlockConditions(const FVM_ItemCraft &inout Model)
{
    return Model.GetCurrentUnlockConditions();
}
TEUIModelRef<FVM_CommonItem> __UIGetter_CurrentCommonItem(const FVM_ItemCraft &inout Model)
{
    return Model.GetCurrentCommonItem();
}
TEUIModelRef<FVM_CommonConsume> __UIGetter_CurrentCommonConsume(const FVM_ItemCraft &inout Model)
{
    return Model.GetCurrentCommonConsume();
}
bool __UIGetter_ShowCraftItemIcon(const FVM_ItemCraft &inout Model)
{
    return Model.ShowCraftItemIcon();
}
FSlateBrush __UIGetter_CurrentCraftItemIcon(const FVM_ItemCraft &inout Model)
{
    return Model.CurrentCraftItemIcon();
}
bool __UIGetter_CurrentCraftIsLocked(const FVM_ItemCraft &inout Model)
{
    return Model.GetCurrentCraftIsLocked();
}
int __UIGetter_CurrentCraftSwitcherIndex(const FVM_ItemCraft &inout Model)
{
    return Model.GetCurrentCraftSwitcherIndex();
}
TEUIModelRef<FVM_ItemCraft> __UIGetter_Self(const FVM_ItemCraft &inout Model)
{
    return TEUIModelRef<FVM_ItemCraft>(Model);
}
int __IndexOf_CraftTypes()
{
    return 0;
}
int __IndexOf_SelectedCraftTypeIndex()
{
    return 1;
}
int __IndexOf_CraftModel()
{
    return 2;
}
int __IndexOf_CraftQuality()
{
    return 3;
}
int __IndexOf_CurrentCraft()
{
    return 4;
}
int __IndexOf_CurrentCraftItemConfig()
{
    return 5;
}
int __IndexOf_bCanDoCurrentCraft()
{
    return 6;
}
int __IndexOf_bCurrentCraftUnlocked()
{
    return 7;
}
int __IndexOf_CurrentCraftableItemsComposable()
{
    return 8;
}
int __IndexOf_AllCraftableItems()
{
    return 9;
}
int __IndexOf_CraftConsumeRewards()
{
    return 10;
}
int __IndexOf_CurrentUnlockConditions()
{
    return 11;
}
int __IndexOf_PlayerInventory()
{
    return 12;
}
int __IndexOf_CurrentCommonItem()
{
    return 13;
}
int __IndexOf_CurrentCommonConsume()
{
    return 14;
}
int __IndexOf_SortedCraftConsumeConfig()
{
    return 15;
}
int __IndexOf_ViewedRedDots()
{
    return 16;
}
int __IndexOf_RestoreSelectedCraftIndex()
{
    return 17;
}
int __IndexOf_SwitchFocusTrigger()
{
    return 18;
}
}
namespace __GeneratedProperties_FVM_ItemCraft
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

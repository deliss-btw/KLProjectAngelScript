
namespace FVM_Inventory
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature PrevRootCategory = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature NextRootCategory = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature PrevCategory = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature NextCategory = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature ConfirmSort = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnFilterDropdownSelected = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnSorterDropdownSelected = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnSelectedIndexChanged = FEUIModelCallbackSignature();
}
namespace FVM_CloseVisibilityState
{
    const int ModelId = 0;

}
struct FVM_Inventory : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_InventoryRootCategory>> m_RootCategories;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_InventoryCategory>> m_Categories;
    UPROPERTY()
    TArray<TEUIModelRef<FM_ItemData>> m_CurrentCategoryItems;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_InventoryItem>> m_CurrentDisplayItems;
    UPROPERTY()
    int m_SelectedItemIndex;
    UPROPERTY()
    TEUIModelRef<FVM_InventoryItem> m_FixedItem;
    UPROPERTY()
    TEUIModelRef<FVM_InventoryItem> m_ExternalDisplayItem;
    UPROPERTY()
    TEUIModelRef<FVM_CommonDropdown> m_FilterDropdown;
    UPROPERTY()
    TEUIModelRef<FVM_CommonDropdown> m_SorterDropdown;
    UPROPERTY()
    int m_RootCategoryIndex;
    UPROPERTY()
    int m_CurrentCategoryIndex;
    UPROPERTY()
    UItemFilterBase m_ApplyingFilter;
    UPROPERTY()
    UItemSorterBase m_SelectedSorter;
    UPROPERTY()
    UItemSorterBase m_ApplyingSorter;
    UPROPERTY()
    TEUIModelRef<FMS_PlayerInventory> m_PlayerInventory;
    UPROPERTY()
    int64 m_CurrentCategoryLastSortTimestamp;
    UPROPERTY()
    TMap<FGameplayTag, int> m_LastGamepadHoveredIndexByCategory;

    FVM_Inventory()
    {
        this.m_SelectedItemIndex = 0;
        this.m_RootCategoryIndex = 0;
        this.m_CurrentCategoryIndex = 0;
        this.m_ApplyingFilter = nullptr;
        this.m_SelectedSorter = nullptr;
        this.m_ApplyingSorter = nullptr;
        this.m_CurrentCategoryLastSortTimestamp = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_Inventory(const FVM_Inventory &inout Other)
    {
        this.m_SelectedItemIndex = 0;
        this.m_RootCategoryIndex = 0;
        this.m_CurrentCategoryIndex = 0;
        this.m_ApplyingFilter = nullptr;
        this.m_SelectedSorter = nullptr;
        this.m_ApplyingSorter = nullptr;
        this.m_CurrentCategoryLastSortTimestamp = 0;
        this.m_RootCategories = Other.m_RootCategories;
        this.m_Categories = Other.m_Categories;
        this.m_CurrentCategoryItems = Other.m_CurrentCategoryItems;
        this.m_CurrentDisplayItems = Other.m_CurrentDisplayItems;
        this.m_SelectedItemIndex = int(Other.m_SelectedItemIndex);
        this.m_FixedItem = Other.m_FixedItem;
        this.m_ExternalDisplayItem = Other.m_ExternalDisplayItem;
        this.m_FilterDropdown = Other.m_FilterDropdown;
        this.m_SorterDropdown = Other.m_SorterDropdown;
        this.m_RootCategoryIndex = int(Other.m_RootCategoryIndex);
        this.m_CurrentCategoryIndex = int(Other.m_CurrentCategoryIndex);
        this.m_ApplyingFilter = Other.m_ApplyingFilter;
        this.m_SelectedSorter = Other.m_SelectedSorter;
        this.m_ApplyingSorter = Other.m_ApplyingSorter;
        this.m_PlayerInventory = Other.m_PlayerInventory;
        this.m_CurrentCategoryLastSortTimestamp = Other.m_CurrentCategoryLastSortTimestamp;
        this.m_LastGamepadHoveredIndexByCategory = Other.m_LastGamepadHoveredIndexByCategory;
        return;
    }
    FVM_Inventory& opAssign(const FVM_Inventory &inout Other)
    {
        this.m_RootCategories = Other.m_RootCategories;
        this.m_Categories = Other.m_Categories;
        this.m_CurrentCategoryItems = Other.m_CurrentCategoryItems;
        this.m_CurrentDisplayItems = Other.m_CurrentDisplayItems;
        this.m_SelectedItemIndex = int(Other.m_SelectedItemIndex);
        this.m_FixedItem = Other.m_FixedItem;
        this.m_ExternalDisplayItem = Other.m_ExternalDisplayItem;
        this.m_FilterDropdown = Other.m_FilterDropdown;
        this.m_SorterDropdown = Other.m_SorterDropdown;
        this.m_RootCategoryIndex = int(Other.m_RootCategoryIndex);
        this.m_CurrentCategoryIndex = int(Other.m_CurrentCategoryIndex);
        this.m_ApplyingFilter = Other.m_ApplyingFilter;
        this.m_SelectedSorter = Other.m_SelectedSorter;
        this.m_ApplyingSorter = Other.m_ApplyingSorter;
        this.m_PlayerInventory = Other.m_PlayerInventory;
        this.m_CurrentCategoryLastSortTimestamp = Other.m_CurrentCategoryLastSortTimestamp;
        return Other.m_LastGamepadHoveredIndexByCategory;
    }
    void PostConstruct()
    {
        this.ResetSelectedItemIndex();
        this.SetPlayerInventory(TEUIModelRef<FMS_PlayerInventory>(::FMS_PlayerInventory::Get(this.GetContext().Manager)));
        int local_3 = 0;
        for (; local_3 < this.GetInventorySettings().Categories.Num(); )
        {
            this.GetModify_RootCategories().Add(TEUIModelRef<FVM_InventoryRootCategory>(this.MakeRootCategory(local_3)));
            ++local_3;
        }
        this.SetRootCategoryIndex(0);
        this.SetCurrentCategoryIndex(0);
        this.RefreshCategories();
        this.InitFilterAndSorter();
        return;
    }
    void OnPlayerInventoryChanged(const FMsg_PlayerInventoryChanged &inout Msg)
    {
        this.RefreshCategoryItems();
        return;
    }
    void OnRootCategoryIndexChanged()
    {
        this.RefreshCategories();
        this.InitFilterAndSorter();
        this.ClearItemSelection();
        this.InitLastSelectedItemIndex();
        return;
    }
    void OnCurrentCategoryChanged()
    {
        this.InitCategorySaveData();
        this.RefreshCategoryItems();
        this.InitFilterAndSorter();
        this.ClearItemSelection();
        this.InitLastSelectedItemIndex();
        return;
    }
    void OnApplyingFilterChanged()
    {
        this.RefreshDisplayingItems();
        this.ClearItemSelection();
        this.SaveCategoryFilterData(this.GetApplyingFilter());
        return;
    }
    int GetCurrentCategoryItemNum() const
    {
        return this.GetCurrentCategoryItems().Num();
    }
    bool GetHasMultipleCategories() const
    {
        return (this.GetCategories().Num() > 1);
    }
    int GetCurrentDisplayItemNum() const
    {
        return this.GetCurrentDisplayItems().Num();
    }
    FText GetCurrentTrunkSlotNumText() const
    {
        int local_4 = int(::FItemCategoryTrunkBinding::FindTrunk(this.GetCurrentCategory()));
        if (::ItemConfigUtils::LimitTrunkMax(EItemTrunk(local_4)))
        {
            return FText::Format(FText::AsCultureInvariant("{0}/{1}"), this.GetPlayerInventory().opArrow().GetCurrentTrunkSlotNum(EItemTrunk(::ItemConfigUtils::GetTrunkMax(EItemTrunk(local_4)))));
        }
        else
        {
            return FText::Format(FText::AsCultureInvariant("{0}/в€ћ"), this.GetPlayerInventory().opArrow().GetCurrentTrunkSlotNum());
        }
    }
    bool ShouldShowTrunkSlotNum() const
    {
        return (int(::FItemCategoryTrunkBinding::FindTrunk(this.GetCurrentCategory())) != 0);
    }
    TEUIModelRef<FVM_InventoryItem> GetSelectedItem() const
    {
        if (this.GetCurrentDisplayItems().IsValidIndex(this.GetSelectedItemIndex()))
        {
            return this.GetCurrentDisplayItems()[this.GetSelectedItemIndex()];
        }
        return TEUIModelRef<FVM_InventoryItem>();
    }
    TEUIModelRef<FVM_InventoryItem> GetDisplayItem() const
    {
        if (this.GetFixedItem().IsValid())
        {
            return this.GetFixedItem();
        }
        TEUIModelRef<FVM_InventoryItem> local_2 = this.GetExternalDisplayItem();
        if (local_2.IsValid() && this.GetExternalDisplayItem().opArrow().IsValid())
        {
            return this.GetExternalDisplayItem();
        }
        if (this.GetCurrentDisplayItems().IsValidIndex(this.GetSelectedItemIndex()))
        {
            const TEUIModelRef<FVM_InventoryItem>& local_8 = this.GetCurrentDisplayItems()[this.GetSelectedItemIndex()];
            if (local_8)
            {
                return local_8;
            }
        }
        return local_2;
    }
    bool HasDisplayItem() const
    {
        if (this.GetFixedItem() && this.GetFixedItem().opArrow().IsValid())
        {
            return true;
        }
        if (this.GetExternalDisplayItem().IsValid() && this.GetExternalDisplayItem().opArrow().IsValid())
        {
            return true;
        }
        if (this.GetCurrentDisplayItems().IsValidIndex(this.GetSelectedItemIndex()))
        {
            if (this.GetCurrentDisplayItems()[this.GetSelectedItemIndex()].opArrow().IsValid())
            {
                return true;
            }
        }
        return false;
    }
    bool ShouldShowFilterAndSorter() const
    {
        return !(this.IsPureDisplayCategory());
    }
    void PrevRootCategory()
    {
        this.SetRootCategoryIndex(FMath::WrapIndex((this.GetRootCategoryIndex() - 1), 0, this.GetRootCategories().Num()));
        return;
    }
    void NextRootCategory()
    {
        this.SetRootCategoryIndex(FMath::WrapIndex((this.GetRootCategoryIndex() + 1), 0, this.GetRootCategories().Num()));
        return;
    }
    void PrevCategory()
    {
        this.SetCurrentCategoryIndex(FMath::WrapIndex((this.GetCurrentCategoryIndex() - 1), 0, this.GetCategories().Num()));
        return;
    }
    void NextCategory()
    {
        this.SetCurrentCategoryIndex(FMath::WrapIndex((this.GetCurrentCategoryIndex() + 1), 0, this.GetCategories().Num()));
        return;
    }
    void ConfirmSort()
    {
        this.SaveCategorySortData(this.GetSelectedSorter());
        this.SetApplyingSorter(this.GetSelectedSorter());
        this.RefreshDisplayingItems();
        this.ClearItemSelection();
        return;
    }
    void OnFilterDropdownSelected(const int Index)
    {
        if (this.GetInventorySettings().GetFilterConfigAt(this.GetCurrentCategory(), Index).IsSet())
        {
        }
        else
        {
            this.SetApplyingFilter(nullptr);
        }
        return;
    }
    void OnSorterDropdownSelected(const int Index)
    {
        if (this.GetInventorySettings().GetSorterConfigAt(this.GetCurrentCategory(), Index).IsSet())
        {
            this.ConfirmSort();
        }
        else
        {
            this.SetSelectedSorter(nullptr);
        }
        return;
    }
    void OnSelectedIndexChanged(const int Index)
    {
        this.SetSelectedItemIndex(Index);
        if ((int(UEUIInputSubsystem::Get(this.GetContext().UELocalPlayer).GetCurrentInputType())) == 1)
        {
            this.GetModify_LastGamepadHoveredIndexByCategory().Add(this.GetCurrentCategory(), Index);
            this.SetFixedItem(TEUIModelRef<FVM_InventoryItem>());
        }
        return;
    }
    void InitFilterAndSorter()
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void InitCategorySaveData()
    {
        FInventoryCategorySortData local_18;
        TRawPtr<FInventoryPureDisplayCategoryConfig> local_6 = this.GetInventorySettings().PureDisplayCategories.Find(this.GetCurrentCategory());
        if (local_6)
        {
            this.SetApplyingSorter(local_6.opArrow().CategorySorter);
            this.SetCurrentCategoryLastSortTimestamp(FDateTime::MaxValue().ToUnixTimestamp());
            return;
        }
        if (::InventorySaveGame::Get(this.GetPlayerId()).CategorySortData.Find(this.GetCurrentCategory(), local_18))
        {
            this.SetApplyingSorter(local_18.LastUsedSorter);
            this.SetCurrentCategoryLastSortTimestamp(local_18.LastSortTimestamp);
            return;
        }
        this.SetApplyingSorter(nullptr);
        this.SetCurrentCategoryLastSortTimestamp(0);
        return;
    }
    void InitLastSelectedItemIndex()
    {
        if ((int(UEUIInputSubsystem::Get(this.GetContext().UELocalPlayer).GetCurrentInputType())) == 1)
        {
            int local_7;
            if (this.GetLastGamepadHoveredIndexByCategory().Find(this.GetCurrentCategory(), local_7))
            {
                if (this.GetCurrentDisplayItems().IsValidIndex(local_7))
                {
                    this.SetSelectedItemIndex(local_7);
                    return;
                }
            }
            this.ResetSelectedItemIndex();
        }
        return;
    }
    void ClearItemSelection()
    {
        this.ResetSelectedItemIndex();
        TEUIModelRef<FVM_InventoryItem> local_4 = TEUIModelRef<FVM_InventoryItem>(FEUIModelRef());
        this.SetFixedItem(local_4);
        this.SetExternalDisplayItem(local_4);
        return;
    }
    void SetExternalDisplayItem(const TEUIModelRef<FM_ItemData> &inout InItemData)
    {
        int local_10 = 0;
        TEUIModelRef<FVM_InventoryItem> local_4 = TEUIModelRef<FVM_InventoryItem>(::FVM_InventoryItem::Create(this.GetContext().Manager, InItemData, (TEUIModelWeakRef<FVM_Inventory>(this))));
        this.SetExternalDisplayItem(local_4);
        TEUIModelRef<FVM_InventoryItem> local_4_2 = this.GetExternalDisplayItem();
        if (!(!(local_4_2.IsValid() && InItemData.IsValid())) && InItemData.opArrow().GetConfig())
        {
            TEUIModelRef<FVM_InventoryItem> local_4_3 = this.GetExternalDisplayItem();
            if (local_10.GetItemModels().IsEmpty())
            {
                FItemModelData local_12;
                local_12.ItemDataModel = InItemData;
                FEUIModelContainer::MakeCached local_26;
                local_10.SetItemModels(local_26.opImplConv());
            }
        }
        return;
    }
    void ClearExternalDisplayItem()
    {
        FEUIModelRef local_2;
        this.SetExternalDisplayItem(TEUIModelRef<FVM_InventoryItem>(local_2));
        return;
    }
    FGameplayTag GetCurrentCategory() const property
    {
        if (this.GetCategories().IsValidIndex(this.GetCurrentCategoryIndex()))
        {
            return this.GetCategories()[this.GetCurrentCategoryIndex()].opArrow().GetCategory();
        }
        return FGameplayTag();
    }
    void RefreshCategories()
    {
        int local_7 = 0;
        this.GetModify_Categories().Empty(0);
        int local_1 = this.GetRootCategoryIndex();
        if (this.GetInventorySettings().Categories.IsValidIndex())
        {
            int local_6 = 0;
            while (local_6 < local_7)
            {
                local_7 = this.GetRootCategoryIndex();
                FGameplayTag& local_10 = this.GetInventorySettings().Categories[local_6].Categories[];
                this.GetModify_Categories().Add(TEUIModelRef<FVM_InventoryCategory>(this.MakeCategory(local_10, local_6)));
                ++local_6;
                local_7 = this.GetRootCategoryIndex();
                local_7 = this.GetInventorySettings().Categories[].Categories.Num();
            }
            this.SetCurrentCategoryIndex(0);
        }
        this.InitCategorySaveData();
        this.RefreshCategoryItems();
        return;
    }
    void RefreshCategoryItems()
    {
        this.GetModify_CurrentCategoryItems().Empty(0);
        TRawPtr<FInventoryPureDisplayCategoryConfig> local_8 = this.GetInventorySettings().PureDisplayCategories.Find(this.GetCurrentCategory());
        if (local_8)
        {
            TArray<TEUIModelRef<FM_ItemData>> local_18;
            TEUIModelRef<FMS_PlayerInventory> local_14 = this.GetPlayerInventory();
            local_18.GetAllItemsByItemTags(local_8.opArrow().ItemTags);
            for (auto& local_32 : local_18)
            {
                this.GetModify_CurrentCategoryItems().Add(local_32);
            }
        }
        else
        {
            TArray<TEUIModelRef<FM_ItemData>> local_18;
            FGameplayTag local_34 = this.GetCurrentCategory();
            TEUIModelRef<FMS_PlayerInventory> local_14_2 = this.GetPlayerInventory();
            local_18.GetAllItemsByCategory(local_34);
            for (auto& local_32 : local_18)
            {
                this.GetModify_CurrentCategoryItems().Add(local_32);
            }
        }
        this.RefreshDisplayingItems();
        return;
    }
    void RefreshDisplayingItems()
    {
        TEUIModelRef<FM_ItemData> local_2;
        TEUIModelRef<FVM_InventoryItem> local_4 = this.GetFixedItem();
        bool local_5 = local_4.IsValid();
        if (local_5)
        {
            TEUIModelRef<FVM_InventoryItem> local_4_2 = this.GetFixedItem();
            TEUIModelRef<FM_ItemData> local_8;
            local_8.GetItem();
            local_2 = local_8;
        }
        this.GetModify_CurrentDisplayItems().Empty(0);
        TArray<TEUIModelRef<FM_ItemData>> local_14 = this.GetCurrentCategoryItems();
        ::ItemDataUtils::FilterItems(local_14, this.GetApplyingFilter());
        ::ItemDataUtils::SortItems(local_14, this.GetApplyingSorter(), this.GetCurrentCategoryLastSortTimestamp(), true);
        for (auto& local_34 : local_14)
        {
            TEUIModelRef<FVM_InventoryItem> local_4_3 = TEUIModelRef<FVM_InventoryItem>(::FVM_InventoryItem::Create(this.GetContext().Manager, local_34, (TEUIModelWeakRef<FVM_Inventory>(this))));
            this.GetModify_CurrentDisplayItems().Add(local_4_3);
        }
        int local_40 = int(::FItemCategoryTrunkBinding::FindTrunk(this.GetCurrentCategory()));
        if (::ItemConfigUtils::LimitTrunkMax(EItemTrunk(local_40)))
        {
            TEUIModelRef<FM_ItemData> local_8;
            while (this.GetCurrentDisplayItems().Num() < ::ItemConfigUtils::GetTrunkMax(EItemTrunk(local_40)))
            {
                local_8 = TEUIModelRef<FM_ItemData>(nullptr);
                TEUIModelRef<FVM_InventoryItem> local_4_4 = TEUIModelRef<FVM_InventoryItem>(::FVM_InventoryItem::Create(this.GetContext().Manager, local_8, (TEUIModelWeakRef<FVM_Inventory>(this))));
                this.GetModify_CurrentDisplayItems().Add(local_4_4);
            }
        }
        this.ResetSelectedItemIndex();
        if (local_2.IsValid())
        {
            TEUIModelRef<FM_ItemData> local_8;
            int local_42 = 0;
            for (; local_42 < this.GetCurrentDisplayItems().Num(); ++local_42)
            {
                if (!(this.GetCurrentDisplayItems()[local_42].IsValid()))
                {
                    local_5 = false;
                }
                else
                {
                    local_8.GetItem();
                    local_5 = (local_8 == local_2.opImplConv());
                }
                if (local_5)
                {
                    this.SetSelectedItemIndex(local_42);
                    break;
                }
            }
        }
        TEUIModelRef<FVM_InventoryItem> local_4_5 = this.GetFixedItem();
        if (!(this.GetCurrentDisplayItems().Contains(local_4_5)))
        {
            this.SetFixedItem(local_4_5);
        }
        return;
    }
    void SaveCategorySortData(const UItemSorterBase Sorter)
    {
        UInventorySaveGame local_6 = ::InventorySaveGame::Get(this.GetPlayerId());
        FGameplayTag local_8 = this.GetCurrentCategory();
        this.SetCurrentCategoryLastSortTimestamp(::FASCommonUtils::GetTimestamp());
        FInventoryCategorySortData local_10;
        local_10.LastSortTimestamp = this.GetCurrentCategoryLastSortTimestamp();
        ::InventorySaveGame::Save(this.GetPlayerId(), local_6, true);
        return;
    }
    void SaveCategoryFilterData(const UItemFilterBase Filter)
    {
        UInventorySaveGame local_6 = ::InventorySaveGame::Get(this.GetPlayerId());
        FGameplayTag local_8 = this.GetCurrentCategory();
        ::InventorySaveGame::Save(this.GetPlayerId(), local_6, true);
        return;
    }
    FVM_InventoryRootCategory MakeRootCategory(const int Index)
    {
        FVM_InventoryRootCategory __r;
        FInventoryCategoryConfig& local_4 = this.GetInventorySettings().Categories[];
        TEUIModelWeakRef<FVM_Inventory> local_6 = TEUIModelWeakRef<FVM_Inventory>(this);
        return __r;
    }
    FVM_InventoryCategory MakeCategory(const FGameplayTag &inout Category, const int Index)
    {
        FVM_InventoryCategory __r;
        TEUIModelWeakRef<FVM_Inventory> local_2 = TEUIModelWeakRef<FVM_Inventory>(this);
        return __r;
    }
    TArray<FEUIModelContainer> MakeFilterDropdownOptions(const UItemFilterBase DefaultSelectedFilter, int &inout OutDefaultSelectedIndex) const
    {
        UItemFilterBase local_30;
        TArray<FEUIModelContainer> local_4;
        bool local_5 = false;
        FGameplayTag local_10 = this.GetCurrentCategory();
        for (auto& local_28 : this.GetInventorySettings().GetFilterConfigs(local_10))
        {
            local_30 = local_28.Filter;
            if (local_30 == DefaultSelectedFilter)
            {
                OutDefaultSelectedIndex = local_4.Num();
                local_5 = true;
            }
            local_4.Add(FEUIModelContainer());
        }
        if (!(local_5))
        {
            OutDefaultSelectedIndex = 0;
        }
        return local_4;
    }
    TArray<FEUIModelContainer> MakeSorterDropdownOptions(const UItemSorterBase DefaultSelectedSorter, int &inout OutDefaultSelectedIndex) const
    {
        UItemSorterBase local_30;
        TArray<FEUIModelContainer> local_4;
        bool local_5 = false;
        FGameplayTag local_10 = this.GetCurrentCategory();
        for (auto& local_28 : this.GetInventorySettings().GetSorterConfigs(local_10))
        {
            local_30 = local_28.Sorter;
            if (local_30 == DefaultSelectedSorter)
            {
                OutDefaultSelectedIndex = local_4.Num();
                local_5 = true;
            }
            local_4.Add(FEUIModelContainer());
        }
        if (!(local_5))
        {
            OutDefaultSelectedIndex = 0;
        }
        return local_4;
    }
    UInventorySettings GetInventorySettings() const property
    {
        return GetGameplaySettings<UInventorySettings>();
    }
    uint GetPlayerId() const property
    {
        FECSEntity local_4 = this.GetContext().GetLocalPlayer();
        Get local_8;
        return local_8.opCall().GetPlayerId();
    }
    bool IsPureDisplayCategory() const
    {
        return this.GetInventorySettings().PureDisplayCategories.Contains(this.GetCurrentCategory());
    }
    void ResetSelectedItemIndex()
    {
        if ((int(UEUIInputSubsystem::Get(this.GetContext().UELocalPlayer).GetCurrentInputType())) == 1)
        {
            this.SetSelectedItemIndex(0);
            return;
        }
        this.SetSelectedItemIndex(INDEX_NONE);
        return;
    }
    const TArray<TEUIModelRef<FVM_InventoryRootCategory>> GetRootCategories() const property
    {
        const TArray<TEUIModelRef<FVM_InventoryRootCategory>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<TEUIModelRef<FVM_InventoryRootCategory>> GetModify_RootCategories() property
    {
        TArray<TEUIModelRef<FVM_InventoryRootCategory>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetRootCategories(const TArray<TEUIModelRef<FVM_InventoryRootCategory>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_RootCategories = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_InventoryCategory>> GetCategories() const property
    {
        const TArray<TEUIModelRef<FVM_InventoryCategory>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FVM_InventoryCategory>> GetModify_Categories() property
    {
        TArray<TEUIModelRef<FVM_InventoryCategory>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetCategories(const TArray<TEUIModelRef<FVM_InventoryCategory>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Categories = __Value;
        return;
    }
    const TArray<TEUIModelRef<FM_ItemData>> GetCurrentCategoryItems() const property
    {
        const TArray<TEUIModelRef<FM_ItemData>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<TEUIModelRef<FM_ItemData>> GetModify_CurrentCategoryItems() property
    {
        TArray<TEUIModelRef<FM_ItemData>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetCurrentCategoryItems(const TArray<TEUIModelRef<FM_ItemData>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CurrentCategoryItems = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_InventoryItem>> GetCurrentDisplayItems() const property
    {
        const TArray<TEUIModelRef<FVM_InventoryItem>> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<TEUIModelRef<FVM_InventoryItem>> GetModify_CurrentDisplayItems() property
    {
        TArray<TEUIModelRef<FVM_InventoryItem>> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetCurrentDisplayItems(const TArray<TEUIModelRef<FVM_InventoryItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CurrentDisplayItems = __Value;
        return;
    }
    int GetSelectedItemIndex() const property
    {
        this.TrackPropertyRead(4);
        return this.m_SelectedItemIndex;
    }
    void SetSelectedItemIndex(const int __Value) property
    {
        if (this.m_SelectedItemIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_SelectedItemIndex = __Value;
        return;
    }
    TEUIModelRef<FVM_InventoryItem> GetFixedItem() const property
    {
        this.TrackPropertyRead(5);
        return this.m_FixedItem;
    }
    void SetFixedItem(const TEUIModelRef<FVM_InventoryItem> &inout __Value) property
    {
        TEUIModelRef<FVM_InventoryItem> local_2;
        local_2 = this.m_FixedItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_FixedItem = __Value;
        return;
    }
    TEUIModelRef<FVM_InventoryItem> GetExternalDisplayItem() const property
    {
        this.TrackPropertyRead(6);
        return this.m_ExternalDisplayItem;
    }
    void SetExternalDisplayItem(const TEUIModelRef<FVM_InventoryItem> &inout __Value) property
    {
        TEUIModelRef<FVM_InventoryItem> local_2;
        local_2 = this.m_ExternalDisplayItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_ExternalDisplayItem = __Value;
        return;
    }
    TEUIModelRef<FVM_CommonDropdown> GetFilterDropdown() const property
    {
        this.TrackPropertyRead(7);
        return this.m_FilterDropdown;
    }
    void SetFilterDropdown(const TEUIModelRef<FVM_CommonDropdown> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonDropdown> local_2;
        local_2 = this.m_FilterDropdown;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_FilterDropdown = __Value;
        return;
    }
    TEUIModelRef<FVM_CommonDropdown> GetSorterDropdown() const property
    {
        this.TrackPropertyRead(8);
        return this.m_SorterDropdown;
    }
    void SetSorterDropdown(const TEUIModelRef<FVM_CommonDropdown> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonDropdown> local_2;
        local_2 = this.m_SorterDropdown;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_SorterDropdown = __Value;
        return;
    }
    int GetRootCategoryIndex() const property
    {
        this.TrackPropertyRead(9);
        return this.m_RootCategoryIndex;
    }
    void SetRootCategoryIndex(const int __Value) property
    {
        if (this.m_RootCategoryIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_RootCategoryIndex = __Value;
        return;
    }
    int GetCurrentCategoryIndex() const property
    {
        this.TrackPropertyRead(10);
        return this.m_CurrentCategoryIndex;
    }
    void SetCurrentCategoryIndex(const int __Value) property
    {
        if (this.m_CurrentCategoryIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_CurrentCategoryIndex = __Value;
        return;
    }
    UItemFilterBase GetApplyingFilter() const property
    {
        this.TrackPropertyRead(11);
        return this.m_ApplyingFilter;
    }
    void SetApplyingFilter(const UItemFilterBase __Value) property
    {
        if (this.m_ApplyingFilter == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        return;
    }
    UItemSorterBase GetSelectedSorter() const property
    {
        this.TrackPropertyRead(12);
        return this.m_SelectedSorter;
    }
    void SetSelectedSorter(const UItemSorterBase __Value) property
    {
        if (this.m_SelectedSorter == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        return;
    }
    UItemSorterBase GetApplyingSorter() const property
    {
        this.TrackPropertyRead(13);
        return this.m_ApplyingSorter;
    }
    void SetApplyingSorter(const UItemSorterBase __Value) property
    {
        if (this.m_ApplyingSorter == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        return;
    }
    TEUIModelRef<FMS_PlayerInventory> GetPlayerInventory() const property
    {
        this.TrackPropertyRead(14);
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
        this.MarkPropertyDirty(14);
        this.m_PlayerInventory = __Value;
        return;
    }
    int64 GetCurrentCategoryLastSortTimestamp() const property
    {
        this.TrackPropertyRead(15);
        return this.m_CurrentCategoryLastSortTimestamp;
    }
    void SetCurrentCategoryLastSortTimestamp(const int64 __Value) property
    {
        if (this.m_CurrentCategoryLastSortTimestamp == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_CurrentCategoryLastSortTimestamp = __Value;
        return;
    }
    const TMap<FGameplayTag, int> GetLastGamepadHoveredIndexByCategory() const property
    {
        const TMap<FGameplayTag, int> __r;
        this.TrackPropertyRead(16);
        return __r;
    }
    TMap<FGameplayTag, int> GetModify_LastGamepadHoveredIndexByCategory() property
    {
        TMap<FGameplayTag, int> __r;
        this.MarkPropertyDirty(16);
        return __r;
    }
    void SetLastGamepadHoveredIndexByCategory(const TMap<FGameplayTag, int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_LastGamepadHoveredIndexByCategory = __Value;
        return;
    }
}

struct FVM_CloseVisibilityState : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    bool m_bIsSelectListOpen;
    UPROPERTY()
    TEUIModelRef<FMS_CommonHoverManager> m_HoverManager;
    UPROPERTY()
    TEUIModelRef<FMS_ItemQuickSlotHoverCache> m_QuickSlotHoverCache;

    FVM_CloseVisibilityState()
    {
        this.m_bIsSelectListOpen = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_CloseVisibilityState(const FVM_CloseVisibilityState &inout Other)
    {
        this.m_bIsSelectListOpen = false;
        this.m_bIsSelectListOpen = Other.m_bIsSelectListOpen;
        this.m_HoverManager = Other.m_HoverManager;
        this.m_QuickSlotHoverCache = Other.m_QuickSlotHoverCache;
        return;
    }
    FVM_CloseVisibilityState& opAssign(const FVM_CloseVisibilityState &inout Other)
    {
        this.m_bIsSelectListOpen = Other.m_bIsSelectListOpen;
        this.m_HoverManager = Other.m_HoverManager;
        return Other.m_QuickSlotHoverCache;
    }
    void PostConstruct()
    {
        this.SetHoverManager(TEUIModelRef<FMS_CommonHoverManager>(::FMS_CommonHoverManager::Get(this.GetContext().Manager)));
        this.SetQuickSlotHoverCache(TEUIModelRef<FMS_ItemQuickSlotHoverCache>(::FMS_ItemQuickSlotHoverCache::Get(this.GetContext().Manager)));
        this.RefreshState();
        return;
    }
    void OnHoverListChanged()
    {
        this.RefreshState();
        return;
    }
    void RefreshState()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    bool GetbIsSelectListOpen() const property
    {
        this.TrackPropertyRead(0);
        return this.m_bIsSelectListOpen;
    }
    void SetbIsSelectListOpen(const bool __Value) property
    {
        if (!(this.m_bIsSelectListOpen) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_bIsSelectListOpen = __Value;
        return;
    }
    TEUIModelRef<FMS_CommonHoverManager> GetHoverManager() const property
    {
        this.TrackPropertyRead(1);
        return this.m_HoverManager;
    }
    void SetHoverManager(const TEUIModelRef<FMS_CommonHoverManager> &inout __Value) property
    {
        TEUIModelRef<FMS_CommonHoverManager> local_2;
        local_2 = this.m_HoverManager;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_HoverManager = __Value;
        return;
    }
    TEUIModelRef<FMS_ItemQuickSlotHoverCache> GetQuickSlotHoverCache() const property
    {
        this.TrackPropertyRead(2);
        return this.m_QuickSlotHoverCache;
    }
    void SetQuickSlotHoverCache(const TEUIModelRef<FMS_ItemQuickSlotHoverCache> &inout __Value) property
    {
        TEUIModelRef<FMS_ItemQuickSlotHoverCache> local_2;
        local_2 = this.m_QuickSlotHoverCache;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_QuickSlotHoverCache = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_Inventory
{
    UPROPERTY()
    int CurrentCategoryItemNum;
    UPROPERTY()
    bool HasMultipleCategories;
    UPROPERTY()
    int CurrentDisplayItemNum;
    UPROPERTY()
    FText CurrentTrunkSlotNumText;
    UPROPERTY()
    bool ShouldShowTrunkSlotNum;
    UPROPERTY()
    TEUIModelRef<FVM_InventoryItem> SelectedItem;
    UPROPERTY()
    TEUIModelRef<FVM_InventoryItem> DisplayItem;
    UPROPERTY()
    bool HasDisplayItem;
    UPROPERTY()
    bool ShouldShowFilterAndSorter;
    UPROPERTY()
    TEUIModelRef<FVM_Inventory> Self;


}

struct __GeneratedProperties_FVM_CloseVisibilityState
{
    UPROPERTY()
    TEUIModelRef<FVM_CloseVisibilityState> Self;

    __GeneratedProperties_FVM_CloseVisibilityState()
    {
        return;
    }
}

namespace FVM_Inventory
{
FVM_Inventory& Create(const UObject ContextObject)
{
    return FVM_Inventory::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_Inventory CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_Inventory __r;
    TEUIModelRef<FVM_Inventory> local_6 = TEUIModelRef<FVM_Inventory>(EUIInternal::MakeModelWithManager(Manager, FVM_Inventory::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "RootCategories";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_InventoryRootCategory>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Categories";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_InventoryCategory>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentDisplayItems";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_InventoryItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FilterDropdown";
    local_14.TypeName = "TEUIModelRef<FVM_CommonDropdown>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SorterDropdown";
    local_14.TypeName = "TEUIModelRef<FVM_CommonDropdown>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentCategoryItemNum";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasMultipleCategories";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentDisplayItemNum";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentTrunkSlotNumText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShouldShowTrunkSlotNum";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedItem";
    local_14.TypeName = "TEUIModelRef<FVM_InventoryItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayItem";
    local_14.TypeName = "TEUIModelRef<FVM_InventoryItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasDisplayItem";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShouldShowFilterAndSorter";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_Inventory>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_Inventory;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__OnPlayerInventoryChanged";
    local_26.MessageTypeName = "Msg_PlayerInventoryChanged";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    FEUIModelDirtyDefine local_38;
    local_38.FunctionName = "__OnRootCategoryIndexChanged";
    local_38.DirtyFlags.Set(FVM_Inventory::__IndexOf_RootCategoryIndex());
    Result.DirtyFunctions.Add(local_38);
    local_38.FunctionName = "__OnCurrentCategoryChanged";
    local_38.DirtyFlags.Set(FVM_Inventory::__IndexOf_CurrentCategoryIndex());
    Result.DirtyFunctions.Add(local_38);
    local_38.FunctionName = "__OnApplyingFilterChanged";
    local_38.DirtyFlags.Set(FVM_Inventory::__IndexOf_ApplyingFilter());
    Result.DirtyFunctions.Add(local_38);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_Inventory;
}
void __OnPlayerInventoryChanged(FVM_Inventory &inout Model, const FMsg_PlayerInventoryChanged &inout Message)
{
    Model.OnPlayerInventoryChanged(Message);
    return;
}
void __OnRootCategoryIndexChanged(FVM_Inventory &inout Model)
{
    Model.OnRootCategoryIndexChanged();
    return;
}
void __OnCurrentCategoryChanged(FVM_Inventory &inout Model)
{
    Model.OnCurrentCategoryChanged();
    return;
}
void __OnApplyingFilterChanged(FVM_Inventory &inout Model)
{
    Model.OnApplyingFilterChanged();
    return;
}
TArray<TEUIModelRef<FVM_InventoryRootCategory>> __UIGetter_RootCategories(const FVM_Inventory &inout Model)
{
    return Model.GetRootCategories();
}
TArray<TEUIModelRef<FVM_InventoryCategory>> __UIGetter_Categories(const FVM_Inventory &inout Model)
{
    return Model.GetCategories();
}
TArray<TEUIModelRef<FVM_InventoryItem>> __UIGetter_CurrentDisplayItems(const FVM_Inventory &inout Model)
{
    return Model.GetCurrentDisplayItems();
}
TEUIModelRef<FVM_CommonDropdown> __UIGetter_FilterDropdown(const FVM_Inventory &inout Model)
{
    return Model.GetFilterDropdown();
}
TEUIModelRef<FVM_CommonDropdown> __UIGetter_SorterDropdown(const FVM_Inventory &inout Model)
{
    return Model.GetSorterDropdown();
}
int __UIGetter_CurrentCategoryItemNum(const FVM_Inventory &inout Model)
{
    return Model.GetCurrentCategoryItemNum();
}
bool __UIGetter_HasMultipleCategories(const FVM_Inventory &inout Model)
{
    return Model.GetHasMultipleCategories();
}
int __UIGetter_CurrentDisplayItemNum(const FVM_Inventory &inout Model)
{
    return Model.GetCurrentDisplayItemNum();
}
FText __UIGetter_CurrentTrunkSlotNumText(const FVM_Inventory &inout Model)
{
    return Model.GetCurrentTrunkSlotNumText();
}
bool __UIGetter_ShouldShowTrunkSlotNum(const FVM_Inventory &inout Model)
{
    return Model.ShouldShowTrunkSlotNum();
}
TEUIModelRef<FVM_InventoryItem> __UIGetter_SelectedItem(const FVM_Inventory &inout Model)
{
    return Model.GetSelectedItem();
}
TEUIModelRef<FVM_InventoryItem> __UIGetter_DisplayItem(const FVM_Inventory &inout Model)
{
    return Model.GetDisplayItem();
}
bool __UIGetter_HasDisplayItem(const FVM_Inventory &inout Model)
{
    return Model.HasDisplayItem();
}
bool __UIGetter_ShouldShowFilterAndSorter(const FVM_Inventory &inout Model)
{
    return Model.ShouldShowFilterAndSorter();
}
TEUIModelRef<FVM_Inventory> __UIGetter_Self(const FVM_Inventory &inout Model)
{
    return TEUIModelRef<FVM_Inventory>(Model);
}
int __IndexOf_RootCategories()
{
    return 0;
}
int __IndexOf_Categories()
{
    return 1;
}
int __IndexOf_CurrentCategoryItems()
{
    return 2;
}
int __IndexOf_CurrentDisplayItems()
{
    return 3;
}
int __IndexOf_SelectedItemIndex()
{
    return 4;
}
int __IndexOf_FixedItem()
{
    return 5;
}
int __IndexOf_ExternalDisplayItem()
{
    return 6;
}
int __IndexOf_FilterDropdown()
{
    return 7;
}
int __IndexOf_SorterDropdown()
{
    return 8;
}
int __IndexOf_RootCategoryIndex()
{
    return 9;
}
int __IndexOf_CurrentCategoryIndex()
{
    return 10;
}
int __IndexOf_ApplyingFilter()
{
    return 11;
}
int __IndexOf_SelectedSorter()
{
    return 12;
}
int __IndexOf_ApplyingSorter()
{
    return 13;
}
int __IndexOf_PlayerInventory()
{
    return 14;
}
int __IndexOf_CurrentCategoryLastSortTimestamp()
{
    return 15;
}
int __IndexOf_LastGamepadHoveredIndexByCategory()
{
    return 16;
}
}
namespace __GeneratedProperties_FVM_Inventory
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_CloseVisibilityState
{
FVM_CloseVisibilityState& Create(const UObject ContextObject)
{
    return FVM_CloseVisibilityState::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_CloseVisibilityState CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_CloseVisibilityState __r;
    TEUIModelRef<FVM_CloseVisibilityState> local_6 = TEUIModelRef<FVM_CloseVisibilityState>(EUIInternal::MakeModelWithManager(Manager, FVM_CloseVisibilityState::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_CloseVisibilityState;
}
void __OnHoverListChanged(FVM_CloseVisibilityState &inout Model)
{
    Model.OnHoverListChanged();
    return;
}
TEUIModelRef<FVM_CloseVisibilityState> __UIGetter_Self(const FVM_CloseVisibilityState &inout Model)
{
    return TEUIModelRef<FVM_CloseVisibilityState>(Model);
}
int __IndexOf_bIsSelectListOpen()
{
    return 0;
}
int __IndexOf_HoverManager()
{
    return 1;
}
int __IndexOf_QuickSlotHoverCache()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_CloseVisibilityState
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

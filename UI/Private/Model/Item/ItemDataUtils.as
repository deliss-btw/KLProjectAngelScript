

struct FItemDataSortContext
{
    UPROPERTY()
    TArray<UItemSorterBase> Sorters;
    UPROPERTY()
    TEUIModelRef<FMS_PlayerInventory> PlayerInventory;
    UPROPERTY()
    TEUIModelRef<FMS_ItemDataCache> ItemDataCache;
    UPROPERTY()
    int64 CategoryLastSortTimestamp;
    UPROPERTY()
    bool bAscending;


}

struct __Lambda_UI_Private_Model_Item_ItemDataUtils_60
{
    UPROPERTY()
    FItemDataSortContext __SortContext;

    __Lambda_UI_Private_Model_Item_ItemDataUtils_60()
    {
        return;
    }
    __Lambda_UI_Private_Model_Item_ItemDataUtils_60(const FItemDataSortContext &inout _InSortContext)
    {
        return;
    }
    FItemDataSortContext GetSortContext() property
    {
        FItemDataSortContext __r;
        return __r;
    }
    bool opCall(const TEUIModelRef<FM_ItemData> &inout A, const TEUIModelRef<FM_ItemData> &inout B)
    {
        return ::ItemSorterUtils::CmpSequence(this.GetSortContext().Sorters, ::ItemDataUtils_Internal::CreateSortContext(A, this.GetSortContext()), ::ItemDataUtils_Internal::CreateSortContext(B, this.GetSortContext()), this.GetSortContext().bAscending);
    }
}

namespace ItemDataUtils
{
void FilterItems(TArray<TEUIModelRef<FM_ItemData>> &inout InOutItems, const UItemFilterBase Filter)
{
    int local_1 = 0;
    int local_3 = 0;
    while (local_3 < InOutItems.Num())
    {
        if (ItemDataUtils_Internal::MatchFilter(InOutItems[local_3], Filter))
        {
            InOutItems[local_1] = InOutItems[local_3];
            ++local_1;
        }
        ++local_3;
    }
    InOutItems.SetNum(local_1);
    return;
}
void SortItems(TArray<TEUIModelRef<FM_ItemData>> &inout InOutItems, const UItemSorterBase Sorter, const int64 CategoryLastSortTimestamp = 0, const bool bAscending = true)
{
    const UInventorySettings local_16;
    if (InOutItems.IsEmpty())
    {
        return;
    }
    FItemDataSortContext local_14;
    GetGameplaySettings<UInventorySettings> local_18;
    local_16 = local_18;
    local_14.Sorters.Add(local_16.PreprocessSorter);
    local_14.Sorters.Add(Sorter);
    local_14.Sorters.Add(local_16.PostprocessSorter);
    const FEUIModelContext& local_24 = InOutItems[0].opArrow().GetContext();
    local_14.PlayerInventory = TEUIModelRef<FMS_PlayerInventory>(FMS_PlayerInventory::Get(local_24.Manager));
    local_14.ItemDataCache = TEUIModelRef<FMS_ItemDataCache>(FMS_ItemDataCache::Get(local_24.Manager));
    local_14.CategoryLastSortTimestamp = CategoryLastSortTimestamp;
    local_14.bAscending = bAscending;
    return;
}
}
namespace ItemDataUtils_Internal
{
bool MatchFilter(const TEUIModelRef<FM_ItemData> &inout Item, const UItemFilterBase Filter)
{
    if (!(Item))
    {
        return false;
    }
    if ((!((Filter != nullptr))))
    {
        return true;
    }
    FItemFilterContext local_26;
    local_26.ItemConfig = Item.opArrow().GetConfig();
    return Filter.Match(local_26);
}
FItemSortContext CreateSortContext(const TEUIModelRef<FM_ItemData> &inout Item, const FItemDataSortContext &inout SortContext)
{
    FItemSortContext local_30;
    FItemSortContext __r;
    if (Item)
    {
        local_30.ItemConfig = Item.opArrow().GetConfig();
        local_30.ItemNum = Item.opArrow().GetNum();
        if (SortContext.ItemDataCache.opArrow().TryGetItemUid(Item, 0))
        {
            local_30.LastModifiedTimestamp = SortContext.PlayerInventory.opArrow().GetItemLastModifiedTimestamp();
        }
        else
        {
            local_30.LastModifiedTimestamp = 0;
        }
        local_30.bIsNewItem = (local_30.LastModifiedTimestamp > SortContext.CategoryLastSortTimestamp);
    }
    return __r;
}
}

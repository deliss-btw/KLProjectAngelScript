

struct FInventoryCategoryConfig
{
    UPROPERTY()
    FText DisplayName;
    UPROPERTY()
    FSoftBrush DisplayIcon;
    UPROPERTY()
    TArray<FGameplayTag> Categories;

    FInventoryCategoryConfig()
    {
        return;
    }
}

struct FInventoryItemFilterConfig
{
    UPROPERTY()
    FText DisplayName;
    UPROPERTY()
    UItemFilterBase Filter = nullptr;

    FInventoryItemFilterConfig()
    {
        return;
    }
}

struct FInventoryItemFilterConfigList
{
    UPROPERTY()
    TArray<FInventoryItemFilterConfig> Filters;

    FInventoryItemFilterConfigList()
    {
        return;
    }
}

struct FInventoryItemSorterConfig
{
    UPROPERTY()
    FText DisplayName;
    UPROPERTY()
    UItemSorterBase Sorter = nullptr;

    FInventoryItemSorterConfig()
    {
        return;
    }
}

struct FInventoryItemSorterConfigList
{
    UPROPERTY()
    TArray<FInventoryItemSorterConfig> Sorters;

    FInventoryItemSorterConfigList()
    {
        return;
    }
}

struct FInventoryPureDisplayCategoryConfig
{
    UPROPERTY()
    FGameplayTagContainer ItemTags;
    UPROPERTY()
    UItemSorterBase CategorySorter = nullptr;

    FInventoryPureDisplayCategoryConfig()
    {
        return;
    }
}

class UInventorySettings : UGameplaySettingsBase
{
    UPROPERTY()
    TMap<FGameplayTag, FText> CategoryDisplayNames;
    UPROPERTY()
    TArray<FInventoryCategoryConfig> Categories;
    UPROPERTY()
    TArray<TDataObjectPtr<FItemConfig>> ItemBarConfigs;
    UPROPERTY()
    TMap<FGameplayTag, FInventoryPureDisplayCategoryConfig> PureDisplayCategories;
    UPROPERTY()
    TArray<FInventoryItemFilterConfig> CommonFilters;
    UPROPERTY()
    TMap<FGameplayTag, FInventoryItemFilterConfigList> CategorySpecifiedFilters;
    UPROPERTY()
    TArray<FInventoryItemSorterConfig> CommonSorters;
    UPROPERTY()
    TMap<FGameplayTag, FInventoryItemSorterConfigList> CategorySpecifiedSorters;
    UPROPERTY()
    UItemSorterBase PreprocessSorter;
    UPROPERTY()
    UItemSorterBase PostprocessSorter;

    UInventorySettings()
    {
        return;
    }
    TArray<FInventoryItemFilterConfig> GetFilterConfigs(const FGameplayTag &inout CurrentCategory)
    {
        TArray<FInventoryItemFilterConfig> local_4 = this.CommonFilters;
        if (this.CategorySpecifiedFilters.Contains(CurrentCategory))
        {
            local_4.Append(this.CategorySpecifiedFilters[CurrentCategory].Filters);
        }
        return local_4;
    }
    TOptional<FInventoryItemFilterConfig> GetFilterConfigAt(const FGameplayTag &inout CurrentCategory, const int Index)
    {
        if (Index < 0)
        {
            return TOptional<FInventoryItemFilterConfig>();
        }
        if (Index < this.CommonFilters.Num())
        {
            return TOptional<FInventoryItemFilterConfig>(this.CommonFilters[Index]);
        }
        if (this.CategorySpecifiedFilters.Contains(CurrentCategory))
        {
            int local_1 = Index - this.CommonFilters.Num();
            if (this.CategorySpecifiedFilters[CurrentCategory].Filters.IsValidIndex())
            {
                return TOptional<FInventoryItemFilterConfig>(this.CategorySpecifiedFilters[CurrentCategory].Filters[]);
            }
        }
        return TOptional<FInventoryItemFilterConfig>();
    }
    TArray<FInventoryItemSorterConfig> GetSorterConfigs(const FGameplayTag &inout CurrentCategory)
    {
        TArray<FInventoryItemSorterConfig> local_4 = this.CommonSorters;
        if (this.CategorySpecifiedSorters.Contains(CurrentCategory))
        {
            local_4.Append(this.CategorySpecifiedSorters[CurrentCategory].Sorters);
        }
        return local_4;
    }
    TOptional<FInventoryItemSorterConfig> GetSorterConfigAt(const FGameplayTag &inout CurrentCategory, const int Index)
    {
        if (Index < 0)
        {
            return TOptional<FInventoryItemSorterConfig>();
        }
        if (Index < this.CommonSorters.Num())
        {
            return TOptional<FInventoryItemSorterConfig>(this.CommonSorters[Index]);
        }
        if (this.CategorySpecifiedSorters.Contains(CurrentCategory))
        {
            int local_1 = Index - this.CommonSorters.Num();
            if (this.CategorySpecifiedSorters[CurrentCategory].Sorters.IsValidIndex())
            {
                return TOptional<FInventoryItemSorterConfig>(this.CategorySpecifiedSorters[CurrentCategory].Sorters[]);
            }
        }
        return TOptional<FInventoryItemSorterConfig>();
    }
    FText GetCategoryDisplayName(const FGameplayTag &inout Category)
    {
        if (this.CategoryDisplayNames.Contains(Category))
        {
            return this.CategoryDisplayNames[Category];
        }
        return FText::FromString(Category.ToString());
    }
}


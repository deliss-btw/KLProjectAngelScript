
enum EItemQuickSlotMutuallyExclusiveCondition
{
    Never,
    ExactEqual,
    CategoryEqual,
    SubCategoryEqual,
}


struct FItemQuickSlotFilter
{
    UPROPERTY()
    EItemType AllowedItemType;
    UPROPERTY()
    FGameplayTagContainer AllowedItemCategories;


    int opCmp(const FItemQuickSlotFilter &inout Other) const
    {
        if (int(this.AllowedItemType) == int(Other.AllowedItemType) && this.AllowedItemCategories.HasAllExact(Other.AllowedItemCategories) && Other.AllowedItemCategories.HasAllExact(this.AllowedItemCategories))
        {
            return 0;
        }
        return 1;
    }
}

struct FItemQuickSlotConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FText DisplayName;
    UPROPERTY()
    FItemQuickSlotFilter ItemFilter;
    UPROPERTY()
    FItemSpecifier ItemSpecifier;
    UPROPERTY()
    FDataObjectPtr m_DefaultItem;
    UPROPERTY()
    EItemQuickSlotMutuallyExclusiveCondition MutuallyExclusiveCondition;
    UPROPERTY()
    bool bAllowEmpty;
    UPROPERTY()
    bool bAllowUnownedItem;
    UPROPERTY()
    EESMTriggerInputSlot InputSlot;


    const TDataObjectPtr<FItemConfig> GetDefaultItem() const property
    {
        const TDataObjectPtr<FItemConfig> __r;
        return __r;
    }
    void SetDefaultItem(const TDataObjectPtr<FItemConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FItemConfig>> local_2;
        this.m_DefaultItem = local_2;
        return;
    }
}


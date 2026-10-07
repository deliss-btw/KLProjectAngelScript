

struct FItemSpecifier
{
    UPROPERTY()
    TSet<TDataObjectPtr<FItemConfig>> ExplicitItems;
    UPROPERTY()
    FGameplayTagContainer ItemTags;

    FItemSpecifier()
    {
        return;
    }
    FItemSpecifier(const TDataObjectPtr<FItemConfig> &inout InItemConfig)
    {
        this.Add(InItemConfig);
        return;
    }
    FItemSpecifier(const TSet<TDataObjectPtr<FItemConfig>> &inout InExplicitItems)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FItemSpecifier(const TArray<TDataObjectPtr<FItemConfig>> &inout InExplicitItems)
    {
        this.Append(InExplicitItems);
        return;
    }
    FItemSpecifier(const FGameplayTag &inout InItemTag)
    {
        this.ItemTags.AddTag(InItemTag);
        return;
    }
    FItemSpecifier(const FGameplayTagContainer &inout InItemTags)
    {
        this.ItemTags = InItemTags;
        return;
    }
    bool IsEmpty() const
    {
        return this.Num() == 0 && (this.ItemTags.Num() == 0);
    }
    bool IsMatch(const TDataObjectPtr<FItemConfig> &inout ItemConfig) const
    {
        if (this.Contains(ItemConfig))
        {
            return true;
        }
        if (this.ItemTags.Num() > 0 && this.ItemTags.HasTag(ItemConfig.opArrow().ItemCategory.AsGameplayTag()))
        {
            return true;
        }
        return false;
    }
}


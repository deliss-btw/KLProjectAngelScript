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
        this.ExplicitItems.Add(InItemConfig);
        return;
    }
    FItemSpecifier(const TSet<TDataObjectPtr<FItemConfig>> &inout InExplicitItems)
    {
        this.ExplicitItems = InExplicitItems;
        return;
    }
    FItemSpecifier(const TArray<TDataObjectPtr<FItemConfig>> &inout InExplicitItems)
    {
        this.ExplicitItems.Append(InExplicitItems);
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
        return this.ExplicitItems.Num() == 0 && (this.ItemTags.Num() == 0);
    }
    bool IsMatch(const TDataObjectPtr<FItemConfig> &inout ItemConfig) const
    {
        if (this.ExplicitItems.Contains(ItemConfig))
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



const float32 REWARD_SORT_DEFAULT_ORDER = 1000000f;

struct FRewardItemEntry
{
    UPROPERTY()
    uint ItemId = 0;
    UPROPERTY()
    int Count = 0;
    UPROPERTY()
    FName TagKey;
    UPROPERTY()
    FText TagText;
    UPROPERTY()
    bool bClaimed = false;
    UPROPERTY()
    bool bHasSortOverride = false;
    UPROPERTY()
    float32 SortOrder = 0.0f;
    UPROPERTY()
    int SubOrder = 0;

    FRewardItemEntry(const uint InItemId, const int InCount)
    {
        this.ItemId = InItemId;
        this.Count = InCount;
        return;
    }
}

struct FCommonRewardDialogParam
{
    UPROPERTY()
    FText Title;
    UPROPERTY()
    FText Description;
    UPROPERTY()
    FText RewardHint;
    UPROPERTY()
    TArray<FRewardItemEntry> Items;
    UPROPERTY()
    TArray<FCommonDialogOption> Options;
    UPROPERTY()
    FDialogCallback Callback;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> WidgetClassOverride;

    FCommonRewardDialogParam()
    {
        return;
    }
}

struct FRewardSortItem
{
    UPROPERTY()
    FRewardItemEntry Entry;
    UPROPERTY()
    int FillIndex = 0;
    UPROPERTY()
    float32 AxisOrder = 1000000.0f;
    UPROPERTY()
    int AxisSub = 0;
    UPROPERTY()
    int Rarity = 0;


}

struct FRewardSortItemComparator
{
    FRewardSortItemComparator()
    {
        return;
    }
    bool opCall(const FRewardSortItem &inout A, const FRewardSortItem &inout B) const
    {
        if (A.AxisOrder != B.AxisOrder)
        {
            return (A.AxisOrder < B.AxisOrder);
        }
        bool local_3 = (int(A.AxisSub) != 0);
        bool local_4 = (int(B.AxisSub) != 0);
        bool local_7 = !(local_3);
        if (local_7 != !(local_4))
        {
            return local_3;
        }
        if ((local_3 && (int(A.AxisSub) != int(B.AxisSub))))
        {
            return (A.AxisSub < B.AxisSub);
        }
        if (int(A.Rarity) != int(B.Rarity))
        {
            return (A.Rarity > B.Rarity);
        }
        return (A.FillIndex < B.FillIndex);
    }
}

struct FCommonRewardListBuilder
{
    UPROPERTY()
    TArray<FRewardItemEntry> Entries;

    FCommonRewardListBuilder()
    {
        return;
    }
    void AddTaggedEntry(const uint ItemId, const int Count, const FName &inout TagKey, const FText &inout TagText, const bool bClaimed, const bool bHasSortOverride = false, const float32 SortOrder = 0.f, const int SubOrder = 0)
    {
        FRewardItemEntry local_12 = FRewardItemEntry(ItemId, Count);
        local_12.TagKey = TagKey;
        local_12.TagText = TagText;
        local_12.bClaimed = bClaimed;
        local_12.bHasSortOverride = bHasSortOverride;
        local_12.SortOrder = SortOrder;
        local_12.SubOrder = SubOrder;
        this.Add(local_12);
        return;
    }
    FCommonRewardListBuilder& FromDropConfig(const TDataObjectPtr<FDropItemConfigBase> &inout DropItemConfig, const FName &inout TagKey = FName(), const FText &inout TagText = FText(), const int CountMultiplier = 1, const bool bClaimed = false)
    {
        TArray<TDataObjectPtr<FDropItemConfigBase>> local_4;
        bool local_27 = false;
        const FDropItemConfig& local_32;
        local_4.Add(DropItemConfig);
        TArray<TDataObjectPtr<FDropItemConfig>> local_14 = ::DropItemsUtils::CollectDisplayDropItemConfigs(local_4);
        for (auto& local_30 : local_14)
        {
            local_30;
            for (auto& local_46 : local_32.Drops)
            {
                TArray<FDropItemPackage> local_50;
                ::DropItemsUtils::FillDropItemPackages(local_46, local_50);
                for (auto& local_64 : local_50)
                {
                    if (local_64.Item)
                    {
                        local_27 = false;
                        int local_5 = int(local_64.Num) * CountMultiplier;
                        this.AddTaggedEntry(0, 0, local_27, bClaimed, TagText, TagKey, local_64.Item.opArrow().DataId);
                    }
                }
            }
        }
        return local_27;
    }
    FCommonRewardListBuilder& FromRewardConfig(const TDataObjectPtr<FRewardConfig> &inout RewardConfig, const FName &inout TagKey = FName(), const FText &inout TagText = FText(), const int CountMultiplier = 1, const bool bClaimed = false)
    {
        const FRewardConfig& local_2;
        bool local_15 = false;
        for (auto& local_18 : local_2.RewardItems)
        {
            if (local_18.Item)
            {
                local_15 = false;
                int local_19 = int(local_18.Count) * CountMultiplier;
                this.AddTaggedEntry(0, 0, local_15, bClaimed, TagText, TagKey, local_18.Item.opArrow().DataId);
            }
        }
        return local_15;
    }
    FCommonRewardListBuilder FromRewardEntries(const TArray<FRewardItemEntry> &inout InEntries)
    {
        FCommonRewardListBuilder __r;
        this.Append(InEntries);
        return __r;
    }
    FCommonRewardListBuilder& FromPbItems(const TArray<FPbItem> &inout PbItems)
    {
        bool local_13 = false;
        int local_30;
        for (auto& local_16 : PbItems)
        {
            if (local_16.HasStackableItem())
            {
                local_30 = local_16.GetStackableItem().GetCount();
            }
            else
            {
                local_30 = 1;
            }
            this.Add(FRewardItemEntry(local_16.GetItemId(), local_30));
        }
        return local_13;
    }
    FCommonRewardListBuilder AddItem(const uint ItemId, const int Count, const FName &inout TagKey = FName(), const FText &inout TagText = FText(), const bool bClaimed = false)
    {
        FCommonRewardListBuilder __r;
        this.AddTaggedEntry(ItemId, Count, TagKey, TagText, bClaimed, false, 0.0f, 0);
        return __r;
    }
    FCommonRewardListBuilder AddItemWithSortOverride(const uint ItemId, const int Count, const float32 SortOrder, const int SubOrder = 0, const FName &inout TagKey = FName(), const FText &inout TagText = FText(), const bool bClaimed = false)
    {
        FCommonRewardListBuilder __r;
        this.AddTaggedEntry(ItemId, Count, TagKey, TagText, bClaimed, true, SortOrder, SubOrder);
        return __r;
    }
    TArray<FRewardItemEntry> Build() const
    {
        return ::RewardSortUtils::SortEntries(this);
    }
}

namespace FRewardItemEntry
{
void FromPbItems(const TArray<FPbItem> &inout PbItems, TArray<FRewardItemEntry> &inout OutEntries)
{
    int local_1;
    OutEntries.Reserve(PbItems.Num());
    for (auto& local_18 : PbItems)
    {
        if (local_18.HasStackableItem())
        {
            local_1 = local_18.GetStackableItem().GetCount();
        }
        else
        {
            local_1 = 1;
        }
        OutEntries.Add(FRewardItemEntry(local_18.GetItemId(), local_1));
    }
    return;
}
}
namespace RewardSortUtils
{
int GetEntryRarity(const uint ItemId)
{
    int local_50 = 0;
    int local_52;
    if (FItemConfig::GetByDataId(ItemId).IsSet())
    {
        local_52 = local_50;
    }
    else
    {
        local_52 = 0;
    }
    return local_52;
}
void ResolveSortAxis(const FRewardItemEntry &inout Entry, float32 &inout OutOrder, int &inout OutSub)
{
    float32 local_2 = 0.0f;
    int local_101 = 0;
    float32 local_103 = 0.0f;
    float32 local_1 = 1000000.0f;
    if (!(Entry.TagKey.IsNone()))
    {
        TDataObjectPtr<FRewardSortTagPriorityConfig> local_76 = TDataObjectPtr<FRewardSortTagPriorityConfig>(FRewardSortTagPriorityConfig::FindByKey(Entry.TagKey));
        if (local_76.IsSet())
        {
            local_1 = local_101;
        }
    }
    if (Entry.bHasSortOverride)
    {
        float32 local_102;
        local_2 = Entry.SortOrder;
        if (local_2 != 0.0f)
        {
            local_102 = Entry.SortOrder;
            local_103 = local_102;
        }
        else
        {
            local_103 = local_1;
        }
        OutOrder = local_103;
        local_101 = Entry.SubOrder;
        OutSub = local_101;
        return;
    }
    TDataObjectPtr<FItemConfig> local_154 = FItemConfig::GetByDataId(int(Entry.ItemId));
    if (local_154.IsSet())
    {
        float32 local_102;
        TDataObjectPtr<FRewardSortItemOverrideConfig> local_202 = TDataObjectPtr<FRewardSortItemOverrideConfig>(FRewardSortItemOverrideConfig::FindByKey(local_154));
        if (local_202.IsSet())
        {
            if (local_103 != 0.0f)
            {
                local_102 = local_2;
            }
            else
            {
                local_102 = local_1;
            }
            OutOrder = local_102;
            OutSub = local_101;
            return;
        }
    }
    OutOrder = local_1;
    OutSub = 0;
    return;
}
FText ResolveTagDisplayText(const FName &inout TagKey, const FText &inout OverrideText)
{
    if (!(OverrideText.IsEmpty()))
    {
        return OverrideText;
    }
    if (!(TagKey.IsNone()))
    {
        TDataObjectPtr<FRewardSortTagPriorityConfig> local_74 = TDataObjectPtr<FRewardSortTagPriorityConfig>(FRewardSortTagPriorityConfig::FindByKey(TagKey));
        if (local_74.IsSet())
        {
        }
        else
        {
        }
    }
    return FText();
}
TArray<FRewardItemEntry> SortEntries(const TArray<FRewardItemEntry> &inout InEntries)
{
    TArray<FRewardSortItem> local_4;
    local_4.Reserve(InEntries.Num());
    int local_6 = 0;
    for (; local_6 < InEntries.Num(); )
    {
        const FRewardItemEntry& local_10 = InEntries[local_6];
        FRewardSortItem local_26;
        local_26.FillIndex = local_6;
        local_26.Rarity = RewardSortUtils::GetEntryRarity(int(local_10.ItemId));
        RewardSortUtils::ResolveSortAxis(local_10, local_26.AxisOrder, local_26.AxisSub);
        local_4.Add(local_26);
        ++local_6;
    }
    TArray<FRewardItemEntry> local_32;
    local_32.Reserve(local_4.Num());
    for (auto& local_46 : local_4)
    {
        local_32.Add(local_46.Entry);
    }
    return local_32;
}
}
namespace FCommonRewardListBuilder
{
TArray<FRewardItemEntry> BuildFromDropConfig(const TDataObjectPtr<FDropItemConfigBase> &inout DropItemConfig)
{
    FCommonRewardListBuilder local_4;
    local_4.FromDropConfig(DropItemConfig, FName(), FText(), 1, false);
    return local_4.Build();
}
TArray<FRewardItemEntry> BuildFromRewardConfig(const TDataObjectPtr<FRewardConfig> &inout RewardConfig)
{
    FCommonRewardListBuilder local_4;
    local_4.FromRewardConfig(RewardConfig, FName(), FText(), 1, false);
    return local_4.Build();
}
TArray<FRewardItemEntry> BuildFromRewardEntries(const TArray<FRewardItemEntry> &inout InEntries)
{
    FCommonRewardListBuilder local_4;
    local_4.FromRewardEntries(InEntries);
    return local_4.Build();
}
}

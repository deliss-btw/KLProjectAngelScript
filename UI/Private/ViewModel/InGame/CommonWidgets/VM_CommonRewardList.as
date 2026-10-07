
namespace FVM_CommonRewardItem
{
    const int ModelId = 0;
}
namespace FVM_CommonRewardList
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature GotoCommissionRewardDetail = FEUIModelCallbackSignature();

}
struct FVM_CommonRewardItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FEUIModelContainer m_ItemModels;
    UPROPERTY()
    bool m_bRequest;
    UPROPERTY()
    TEUIModelRef<FVM_ComposableItem> m_ComposableItemVM;
    UPROPERTY()
    bool m_bClaimed;
    UPROPERTY()
    FEUIModelContainer m_TipHoverModels;

    FVM_CommonRewardItem()
    {
        this.m_bRequest = false;
        this.m_bClaimed = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommonRewardItem' by default constructor.");
        return;
    }
    FVM_CommonRewardItem(const FVM_CommonRewardItem &inout Other)
    {
        this.m_bRequest = false;
        this.m_bClaimed = false;
        this.m_ItemModels = Other.m_ItemModels;
        this.m_bRequest = Other.m_bRequest;
        this.m_ComposableItemVM = Other.m_ComposableItemVM;
        this.m_bClaimed = Other.m_bClaimed;
        this.m_TipHoverModels = Other.m_TipHoverModels;
        return;
    }
    FVM_CommonRewardItem(const FEUIModelContainer &inout InItemModels, const bool InbRequest)
    {
        this.m_bRequest = false;
        this.m_bClaimed = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetItemModels(InItemModels);
        this.SetbRequest(InbRequest);
        return;
    }
    FVM_CommonRewardItem& opAssign(const FVM_CommonRewardItem &inout Other)
    {
        this.m_ItemModels = Other.m_ItemModels;
        this.m_bRequest = Other.m_bRequest;
        this.m_ComposableItemVM = Other.m_ComposableItemVM;
        this.m_bClaimed = Other.m_bClaimed;
        return Other.m_TipHoverModels;
    }
    void PostConstruct()
    {
        bool local_9;
        if (!(TEUIModelRef<FVM_Item>(FEUIModelContainer::GetModel(this.GetItemModels()).opCall()).IsValid()))
        {
            local_9 = false;
        }
        else
        {
            TEUIModelRef<FM_ItemData> local_12;
            local_12.GetItemDataModel();
            local_9 = local_12.IsValid();
        }
        if (local_9)
        {
            TEUIModelRef<FM_ItemData> local_12;
            local_12.GetItemDataModel();
            TEUIModelRef<FM_ItemData> local_16;
            TEUIModelRef<FVM_ComposableItem> local_18 = TEUIModelRef<FVM_ComposableItem>(::FVM_ComposableItem::Create(this.GetContext().Manager, local_16, EItemDisplayScenario(3)));
            this.SetComposableItemVM(local_18);
            FText local_22 = this.GetItemNum();
            TEUIModelRef<FVM_ComposableItem> local_18_2 = this.GetComposableItemVM();
            TEUIModelRef<FVM_ComposableItem> local_18_3 = this.GetComposableItemVM();
            local_12.GetItemDataModel();
            this.SetTipHoverModels(::CommonItemTip::MakeModels(this.GetContext().Manager, ::CommonItemTip::MakeSimpleFromItemData(local_12)));
        }
        return;
    }
    void SetIsClaimed(const bool InIsClaimed)
    {
        this.SetbClaimed(InIsClaimed);
        if (this.GetComposableItemVM().IsValid())
        {
            TEUIModelRef<FVM_ComposableItem> local_2 = this.GetComposableItemVM();
            ::ComposableItemUtility::SetItemMaskEnable(this.GetbClaimed());
        }
        return;
    }
    void ApplyTagAndClaimed(const FName &inout InTagKey, const FText &inout InTagText, const bool bInClaimed)
    {
        if (this.GetComposableItemVM().IsValid())
        {
            if (!(::RewardSortUtils::ResolveTagDisplayText(InTagKey, InTagText).IsEmpty()))
            {
                TEUIModelRef<FVM_ComposableItem> local_2 = this.GetComposableItemVM();
                ::ComposableItemUtility::SetIsShowTag(true);
                TEUIModelRef<FVM_ComposableItem> local_2_2 = this.GetComposableItemVM();
            }
        }
        if (bInClaimed)
        {
            this.SetIsClaimed(true);
        }
        return;
    }
    FSoftBrush GetItemIcon() const
    {
        if (this.GetItem().IsNull())
        {
            return FSoftBrush();
        }
        return this.GetItem().opArrow().GetItemConfig().opArrow().ItemIcon;
    }
    FText GetItemNum() const
    {
        if (this.GetbRequest())
        {
            if (this.GetItem().IsNull())
            {
                return FText::FromString("0/0");
            }
            else
            {
                FString local_20;
                TEUIModelRef<FVM_Item> local_4 = this.GetItem();
                int local_10 = GetItemOwnNum();
                TEUIModelRef<FVM_Item> local_4_2 = this.GetItem();
                int local_11 = GetNum();
                String::Conv_IntToString(local_20);
                FString local_16 = String::Conv_IntToString(local_11);
                if (local_10 < local_11)
                {
                    return FText::FromString(FString::Format("<Red18B>{0}</>{1}{2}", local_20, "/", local_16));
                }
                else
                {
                    return FText::FromString(FString::Format("{0}/{1}", local_20, local_16));
                }
            }
        }
        else
        {
            if (this.GetItem().IsNull())
            {
                return FText::FromString("0");
            }
            else
            {
                return FText::FromString(FString::Format("{0}", this.GetItem().opArrow().GetNum()));
            }
        }
    }
    TEUIModelRef<FVM_Item> GetItem() const property
    {
        return TEUIModelRef<FVM_Item>(FEUIModelContainer::RequireModel(this.GetItemModels()).opCall());
    }
    FEUIModelContainer GetItemTooltip() const property
    {
        return this.GetItemModels();
    }
    FLinearColor GetItemImageBGColor() const
    {
        if (!(this.GetItem().IsNull()))
        {
            FLinearColor local_7;
            TEUIModelRef<FVM_Item> local_2 = this.GetItem();
            local_7.GetRarityColor();
            return local_7;
        }
        return FLinearColor::White;
    }
    FEUIModelContainer GetItemModels() const property
    {
        FEUIModelContainer __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FEUIModelContainer GetModify_ItemModels() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetItemModels(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ItemModels = __Value;
        return;
    }
    bool GetbRequest() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bRequest;
    }
    void SetbRequest(const bool __Value) property
    {
        if (!(this.m_bRequest) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bRequest = __Value;
        return;
    }
    TEUIModelRef<FVM_ComposableItem> GetComposableItemVM() const property
    {
        this.TrackPropertyRead(2);
        return this.m_ComposableItemVM;
    }
    void SetComposableItemVM(const TEUIModelRef<FVM_ComposableItem> &inout __Value) property
    {
        TEUIModelRef<FVM_ComposableItem> local_2;
        local_2 = this.m_ComposableItemVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ComposableItemVM = __Value;
        return;
    }
    bool GetbClaimed() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bClaimed;
    }
    void SetbClaimed(const bool __Value) property
    {
        if (!(this.m_bClaimed) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bClaimed = __Value;
        return;
    }
    const FEUIModelContainer GetTipHoverModels() const property
    {
        const FEUIModelContainer __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FEUIModelContainer GetModify_TipHoverModels() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetTipHoverModels(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_TipHoverModels = __Value;
        return;
    }
}

struct FVM_CommonRewardList : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CommonRewardItem>> m_Rewards;
    UPROPERTY()
    bool m_bDisplayRequestNum;
    UPROPERTY()
    int m_ItemMultiplier;
    UPROPERTY()
    FText m_RewardTitleText;
    UPROPERTY()
    FText m_RewardDescriptionText;
    UPROPERTY()
    FText m_RewardTitleTextOverride;
    UPROPERTY()
    FText m_RewardDescriptionTextOverride;
    UPROPERTY()
    TArray<TEUIModelRef<FM_ItemData>> m_OriginalItemDatas;
    UPROPERTY()
    TArray<TEUIModelRef<FM_ItemData>> m_MultipliedItemDatas;
    UPROPERTY()
    TArray<FName> m_EntryTagKeys;
    UPROPERTY()
    TArray<FText> m_EntryTagTexts;
    UPROPERTY()
    TArray<bool> m_EntryClaimed;

    FVM_CommonRewardList()
    {
        this.m_ItemMultiplier = 0;
        this.m_bDisplayRequestNum = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommonRewardList' by default constructor.");
        return;
    }
    FVM_CommonRewardList(const FVM_CommonRewardList &inout Other)
    {
        this.m_ItemMultiplier = 0;
        this.m_bDisplayRequestNum = false;
        this.m_Rewards = Other.m_Rewards;
        this.m_bDisplayRequestNum = Other.m_bDisplayRequestNum;
        this.m_ItemMultiplier = int(Other.m_ItemMultiplier);
        this.m_RewardTitleText = Other.m_RewardTitleText;
        this.m_RewardDescriptionText = Other.m_RewardDescriptionText;
        this.m_RewardTitleTextOverride = Other.m_RewardTitleTextOverride;
        this.m_RewardDescriptionTextOverride = Other.m_RewardDescriptionTextOverride;
        this.m_OriginalItemDatas = Other.m_OriginalItemDatas;
        this.m_MultipliedItemDatas = Other.m_MultipliedItemDatas;
        this.m_EntryTagKeys = Other.m_EntryTagKeys;
        this.m_EntryTagTexts = Other.m_EntryTagTexts;
        this.m_EntryClaimed = Other.m_EntryClaimed;
        return;
    }
    FVM_CommonRewardList(const TArray<FRewardItemEntry> &inout ItemEntries)
    {
        this.m_ItemMultiplier = 0;
        this.m_bDisplayRequestNum = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        TArray<FRewardItemEntry> local_12 = ::RewardSortUtils::SortEntries(ItemEntries);
        for (auto& local_26 : local_12)
        {
            TDataObjectPtr<FItemConfig> local_76 = ::FItemConfig::GetByDataId(int(local_26.ItemId));
            if (!(local_76))
            {
                continue;
            }
            FM_ItemData& local_78 = ::FM_ItemData::Create(this.GetContext().Manager);
            local_78.SetConfig(local_76);
            local_78.SetNum(int(local_26.Count));
            this.GetModify_OriginalItemDatas().Add(TEUIModelRef<FM_ItemData>(local_78));
            this.GetModify_EntryTagKeys().Add(local_26.TagKey);
            this.GetModify_EntryClaimed().Add(this.GetModify_EntryTagTexts().Add(local_26.TagText));
        }
        this.SetItemMultiplier(1);
        this.UpdateMultipliedItemDatas();
        this.OnMultipliedItemDatasChanged();
        return;
    }
    FVM_CommonRewardList& opAssign(const FVM_CommonRewardList &inout Other)
    {
        this.m_Rewards = Other.m_Rewards;
        this.m_bDisplayRequestNum = Other.m_bDisplayRequestNum;
        this.m_ItemMultiplier = int(Other.m_ItemMultiplier);
        this.m_RewardTitleText = Other.m_RewardTitleText;
        this.m_RewardDescriptionText = Other.m_RewardDescriptionText;
        this.m_RewardTitleTextOverride = Other.m_RewardTitleTextOverride;
        this.m_RewardDescriptionTextOverride = Other.m_RewardDescriptionTextOverride;
        this.m_OriginalItemDatas = Other.m_OriginalItemDatas;
        this.m_MultipliedItemDatas = Other.m_MultipliedItemDatas;
        this.m_EntryTagKeys = Other.m_EntryTagKeys;
        this.m_EntryTagTexts = Other.m_EntryTagTexts;
        return Other.m_EntryClaimed;
    }
    void LoadConfig(const FConfigVM_CommonRewardList &inout InConfig)
    {
        this.SetRewardDescriptionText(InConfig.RewardDescriptionText);
        this.SetRewardTitleText(InConfig.RewardTitleText);
        return;
    }
    FText GetActualRewardTitleText() const property
    {
        if (!(this.GetRewardTitleTextOverride().IsEmpty()))
        {
            return this.GetRewardTitleTextOverride();
        }
        return this.GetRewardTitleText();
    }
    FText GetActualRewardDescriptionText() const property
    {
        if (!(this.GetRewardDescriptionTextOverride().IsEmpty()))
        {
            return this.GetRewardDescriptionTextOverride();
        }
        return this.GetRewardDescriptionText();
    }
    void OverrideRewardTitleText(const FText &inout InTitle)
    {
        this.SetRewardTitleTextOverride(InTitle);
        return;
    }
    void OverrideRewardDescriptionText(const FText &inout InDescription)
    {
        this.SetRewardDescriptionTextOverride(InDescription);
        return;
    }
    bool IsEmpty() const
    {
        return this.GetRewards().IsEmpty();
    }
    bool HasRewards() const
    {
        return !(this.GetRewards().IsEmpty());
    }
    TEUIModelRef<FVM_CommonRewardItem> GetFirstReward() const
    {
        if (!(this.GetRewards().IsEmpty()))
        {
            return this.GetRewards()[0];
        }
        return TEUIModelRef<FVM_CommonRewardItem>();
    }
    void UpdateMultipliedItemDatas()
    {
        this.GetModify_MultipliedItemDatas().SetNum(this.GetOriginalItemDatas().Num());
        int local_2 = 0;
        for (; local_2 < this.GetOriginalItemDatas().Num(); )
        {
            if (!(this.GetMultipliedItemDatas()[local_2]))
            {
                this.GetModify_MultipliedItemDatas()[local_2] = TEUIModelRef<FM_ItemData>(::FM_ItemData::Create(this.GetContext().Manager));
            }
            this.GetModify_MultipliedItemDatas()[local_2].opArrow().SetConfig(this.GetOriginalItemDatas()[local_2].opArrow().GetConfig());
            this.GetModify_MultipliedItemDatas()[local_2].opArrow().SetNum((this.GetOriginalItemDatas()[local_2].opArrow().GetNum() * this.GetItemMultiplier()));
            ++local_2;
        }
        return;
    }
    void OnMultipliedItemDatasChanged()
    {
        this.GetModify_Rewards().Empty(0);
        int local_2 = 0;
        for (; local_2 < this.GetMultipliedItemDatas().Num(); )
        {
            FEUIModelContainer local_18;
            local_18.AddModel(FEUIModelRef(), false);
            FVM_CommonRewardItem& local_22 = ::FVM_CommonRewardItem::Create(this.GetContext().Manager, local_18, this.GetbDisplayRequestNum());
            if (local_2 < this.GetEntryTagTexts().Num())
            {
                local_22.ApplyTagAndClaimed(this.GetEntryTagKeys()[local_2], this.GetEntryTagTexts()[local_2], this.GetEntryClaimed()[local_2]);
            }
            this.GetModify_Rewards().Add(TEUIModelRef<FVM_CommonRewardItem>(local_22));
            ++local_2;
        }
        return;
    }
    void RefreshDisplayRequestNum()
    {
        int local_1 = 0;
        for (; local_1 < this.GetRewards().Num(); )
        {
            this.GetModify_Rewards()[local_1].opArrow().SetbRequest(this.GetbDisplayRequestNum());
            ++local_1;
        }
        return;
    }
    void GotoCommissionRewardDetail()
    {
        if (this.IsEmpty())
        {
            return;
        }
        FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_CommissionRewardDetail, FEUIModelRef(this));
        return;
    }
    TArray<TEUIModelRef<FVM_CommonRewardItem>> GetRewards() const property
    {
        TArray<TEUIModelRef<FVM_CommonRewardItem>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<TEUIModelRef<FVM_CommonRewardItem>> GetModify_Rewards() property
    {
        TArray<TEUIModelRef<FVM_CommonRewardItem>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetRewards(const TArray<TEUIModelRef<FVM_CommonRewardItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Rewards = __Value;
        return;
    }
    bool GetbDisplayRequestNum() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bDisplayRequestNum;
    }
    void SetbDisplayRequestNum(const bool __Value) property
    {
        if (!(this.m_bDisplayRequestNum) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bDisplayRequestNum = __Value;
        return;
    }
    int GetItemMultiplier() const property
    {
        this.TrackPropertyRead(2);
        return this.m_ItemMultiplier;
    }
    void SetItemMultiplier(const int __Value) property
    {
        if (this.m_ItemMultiplier == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ItemMultiplier = __Value;
        return;
    }
    const FText GetRewardTitleText() const property
    {
        const FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_RewardTitleText() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetRewardTitleText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_RewardTitleText = __Value;
        return;
    }
    const FText GetRewardDescriptionText() const property
    {
        const FText __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FText GetModify_RewardDescriptionText() property
    {
        FText __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetRewardDescriptionText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_RewardDescriptionText = __Value;
        return;
    }
    const FText GetRewardTitleTextOverride() const property
    {
        const FText __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FText GetModify_RewardTitleTextOverride() property
    {
        FText __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetRewardTitleTextOverride(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_RewardTitleTextOverride = __Value;
        return;
    }
    const FText GetRewardDescriptionTextOverride() const property
    {
        const FText __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FText GetModify_RewardDescriptionTextOverride() property
    {
        FText __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetRewardDescriptionTextOverride(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_RewardDescriptionTextOverride = __Value;
        return;
    }
    const TArray<TEUIModelRef<FM_ItemData>> GetOriginalItemDatas() const property
    {
        const TArray<TEUIModelRef<FM_ItemData>> __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    TArray<TEUIModelRef<FM_ItemData>> GetModify_OriginalItemDatas() property
    {
        TArray<TEUIModelRef<FM_ItemData>> __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetOriginalItemDatas(const TArray<TEUIModelRef<FM_ItemData>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_OriginalItemDatas = __Value;
        return;
    }
    const TArray<TEUIModelRef<FM_ItemData>> GetMultipliedItemDatas() const property
    {
        const TArray<TEUIModelRef<FM_ItemData>> __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    TArray<TEUIModelRef<FM_ItemData>> GetModify_MultipliedItemDatas() property
    {
        TArray<TEUIModelRef<FM_ItemData>> __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetMultipliedItemDatas(const TArray<TEUIModelRef<FM_ItemData>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_MultipliedItemDatas = __Value;
        return;
    }
    const TArray<FName> GetEntryTagKeys() const property
    {
        const TArray<FName> __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    TArray<FName> GetModify_EntryTagKeys() property
    {
        TArray<FName> __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetEntryTagKeys(const TArray<FName> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_EntryTagKeys = __Value;
        return;
    }
    const TArray<FText> GetEntryTagTexts() const property
    {
        const TArray<FText> __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    TArray<FText> GetModify_EntryTagTexts() property
    {
        TArray<FText> __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetEntryTagTexts(const TArray<FText> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_EntryTagTexts = __Value;
        return;
    }
    const TArray<bool> GetEntryClaimed() const property
    {
        const TArray<bool> __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    TArray<bool> GetModify_EntryClaimed() property
    {
        TArray<bool> __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetEntryClaimed(const TArray<bool> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_EntryClaimed = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommonRewardItem
{
    UPROPERTY()
    FSoftBrush ItemIcon;
    UPROPERTY()
    FText ItemNum;
    UPROPERTY()
    TEUIModelRef<FVM_Item> Item;
    UPROPERTY()
    FEUIModelContainer ItemTooltip;
    UPROPERTY()
    FLinearColor ItemImageBGColor;
    UPROPERTY()
    TEUIModelRef<FVM_CommonRewardItem> Self;

    __GeneratedProperties_FVM_CommonRewardItem()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_CommonRewardList
{
    UPROPERTY()
    FText ActualRewardTitleText;
    UPROPERTY()
    FText ActualRewardDescriptionText;
    UPROPERTY()
    bool IsEmpty;
    UPROPERTY()
    bool HasRewards;
    UPROPERTY()
    TEUIModelRef<FVM_CommonRewardItem> FirstReward;
    UPROPERTY()
    TEUIModelRef<FVM_CommonRewardList> Self;


}

namespace FVM_CommonRewardItem
{
FVM_CommonRewardItem& Create(const UObject ContextObject, const FEUIModelContainer &inout ItemModels, const bool bRequest)
{
    return FVM_CommonRewardItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), ItemModels, bRequest);
}
FVM_CommonRewardItem CreateByManager(const UEUIManagerSubsystem Manager, const FEUIModelContainer &inout ItemModels, const bool bRequest)
{
    FVM_CommonRewardItem __r;
    TEUIModelRef<FVM_CommonRewardItem> local_6 = TEUIModelRef<FVM_CommonRewardItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommonRewardItem::ModelId, 0, ItemModels, bRequest));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ComposableItemVM";
    local_14.TypeName = "TEUIModelRef<FVM_ComposableItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bClaimed";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TipHoverModels";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemNum";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Item";
    local_14.TypeName = "TEUIModelRef<FVM_Item>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemTooltip";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemImageBGColor";
    local_14.TypeName = "FLinearColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonRewardItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonRewardItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonRewardItem;
}
TEUIModelRef<FVM_ComposableItem> __UIGetter_ComposableItemVM(const FVM_CommonRewardItem &inout Model)
{
    return Model.GetComposableItemVM();
}
bool __UIGetter_bClaimed(const FVM_CommonRewardItem &inout Model)
{
    return Model.GetbClaimed();
}
FEUIModelContainer __UIGetter_TipHoverModels(const FVM_CommonRewardItem &inout Model)
{
    return Model.GetTipHoverModels();
}
FSoftBrush __UIGetter_ItemIcon(const FVM_CommonRewardItem &inout Model)
{
    return Model.GetItemIcon();
}
FText __UIGetter_ItemNum(const FVM_CommonRewardItem &inout Model)
{
    return Model.GetItemNum();
}
TEUIModelRef<FVM_Item> __UIGetter_Item(const FVM_CommonRewardItem &inout Model)
{
    return Model.GetItem();
}
FEUIModelContainer __UIGetter_ItemTooltip(const FVM_CommonRewardItem &inout Model)
{
    return Model.GetItemTooltip();
}
FLinearColor __UIGetter_ItemImageBGColor(const FVM_CommonRewardItem &inout Model)
{
    return Model.GetItemImageBGColor();
}
TEUIModelRef<FVM_CommonRewardItem> __UIGetter_Self(const FVM_CommonRewardItem &inout Model)
{
    return TEUIModelRef<FVM_CommonRewardItem>(Model);
}
int __IndexOf_ItemModels()
{
    return 0;
}
int __IndexOf_bRequest()
{
    return 1;
}
int __IndexOf_ComposableItemVM()
{
    return 2;
}
int __IndexOf_bClaimed()
{
    return 3;
}
int __IndexOf_TipHoverModels()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_CommonRewardItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_CommonRewardList
{
FVM_CommonRewardList& Create(const UObject ContextObject, const TArray<FRewardItemEntry> &inout ItemEntries)
{
    return FVM_CommonRewardList::CreateByManager(EUIInternal::GetContextManager(ContextObject), ItemEntries);
}
FVM_CommonRewardList CreateByManager(const UEUIManagerSubsystem Manager, const TArray<FRewardItemEntry> &inout ItemEntries)
{
    FVM_CommonRewardList __r;
    TEUIModelRef<FVM_CommonRewardList> local_6 = TEUIModelRef<FVM_CommonRewardList>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommonRewardList::ModelId, 0, ItemEntries));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Rewards";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_CommonRewardItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RewardTitleText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RewardDescriptionText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ActualRewardTitleText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ActualRewardDescriptionText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsEmpty";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasRewards";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FirstReward";
    local_14.TypeName = "TEUIModelRef<FVM_CommonRewardItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonRewardList>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonRewardList;
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__UpdateMultipliedItemDatas";
    local_24.DirtyFlags.Set(FVM_CommonRewardList::__IndexOf_OriginalItemDatas());
    local_24.DirtyFlags.Set(FVM_CommonRewardList::__IndexOf_ItemMultiplier());
    Result.DirtyFunctions.Add(local_24);
    local_24.FunctionName = "__OnMultipliedItemDatasChanged";
    local_24.DirtyFlags.Set(FVM_CommonRewardList::__IndexOf_MultipliedItemDatas());
    Result.DirtyFunctions.Add(local_24);
    local_24.FunctionName = "__RefreshDisplayRequestNum";
    local_24.DirtyFlags.Set(FVM_CommonRewardList::__IndexOf_bDisplayRequestNum());
    Result.DirtyFunctions.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonRewardList;
}
void __UpdateMultipliedItemDatas(FVM_CommonRewardList &inout Model)
{
    Model.UpdateMultipliedItemDatas();
    return;
}
void __OnMultipliedItemDatasChanged(FVM_CommonRewardList &inout Model)
{
    Model.OnMultipliedItemDatasChanged();
    return;
}
void __RefreshDisplayRequestNum(FVM_CommonRewardList &inout Model)
{
    Model.RefreshDisplayRequestNum();
    return;
}
TArray<TEUIModelRef<FVM_CommonRewardItem>> __UIGetter_Rewards(const FVM_CommonRewardList &inout Model)
{
    return Model.GetRewards();
}
FText __UIGetter_RewardTitleText(const FVM_CommonRewardList &inout Model)
{
    return Model.GetRewardTitleText();
}
FText __UIGetter_RewardDescriptionText(const FVM_CommonRewardList &inout Model)
{
    return Model.GetRewardDescriptionText();
}
FText __UIGetter_ActualRewardTitleText(const FVM_CommonRewardList &inout Model)
{
    return Model.GetActualRewardTitleText();
}
FText __UIGetter_ActualRewardDescriptionText(const FVM_CommonRewardList &inout Model)
{
    return Model.GetActualRewardDescriptionText();
}
bool __UIGetter_IsEmpty(const FVM_CommonRewardList &inout Model)
{
    return Model.IsEmpty();
}
bool __UIGetter_HasRewards(const FVM_CommonRewardList &inout Model)
{
    return Model.HasRewards();
}
TEUIModelRef<FVM_CommonRewardItem> __UIGetter_FirstReward(const FVM_CommonRewardList &inout Model)
{
    return Model.GetFirstReward();
}
TEUIModelRef<FVM_CommonRewardList> __UIGetter_Self(const FVM_CommonRewardList &inout Model)
{
    return TEUIModelRef<FVM_CommonRewardList>(Model);
}
int __IndexOf_Rewards()
{
    return 0;
}
int __IndexOf_bDisplayRequestNum()
{
    return 1;
}
int __IndexOf_ItemMultiplier()
{
    return 2;
}
int __IndexOf_RewardTitleText()
{
    return 3;
}
int __IndexOf_RewardDescriptionText()
{
    return 4;
}
int __IndexOf_RewardTitleTextOverride()
{
    return 5;
}
int __IndexOf_RewardDescriptionTextOverride()
{
    return 6;
}
int __IndexOf_OriginalItemDatas()
{
    return 7;
}
int __IndexOf_MultipliedItemDatas()
{
    return 8;
}
int __IndexOf_EntryTagKeys()
{
    return 9;
}
int __IndexOf_EntryTagTexts()
{
    return 10;
}
int __IndexOf_EntryClaimed()
{
    return 11;
}
}
namespace __GeneratedProperties_FVM_CommonRewardList
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

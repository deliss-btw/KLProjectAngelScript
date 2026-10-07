
namespace FVM_CommonConsume
{
    const int ModelId = 0;

}
struct FVM_CommonConsume : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_Item> m_OriginalCurrencyItem;
    UPROPERTY()
    TEUIModelRef<FVM_CommonRewardList> m_RewardList;
    UPROPERTY()
    int m_ItemMultiplier;

    FVM_CommonConsume()
    {
        this.m_ItemMultiplier = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommonConsume' by default constructor.");
        return;
    }
    FVM_CommonConsume(const FVM_CommonConsume &inout Other)
    {
        this.m_ItemMultiplier = 0;
        this.m_OriginalCurrencyItem = Other.m_OriginalCurrencyItem;
        this.m_RewardList = Other.m_RewardList;
        this.m_ItemMultiplier = int(Other.m_ItemMultiplier);
        return;
    }
    FVM_CommonConsume(const TArray<FRewardItemEntry> &inout InRewardEntries)
    {
        this.m_ItemMultiplier = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        TArray<FRewardItemEntry> local_8;
        for (auto& local_22 : InRewardEntries)
        {
            TDataObjectPtr<FItemConfig> local_72 = ::FItemConfig::GetByDataId(int(local_22.ItemId));
            if (!(local_72))
            {
                continue;
            }
            if (int(local_72.opArrow().ItemType) == 1 && !(this.GetOriginalCurrencyItem()))
            {
                this.SetOriginalCurrencyItem(TEUIModelRef<FVM_Item>(::FVM_Item::CreateInventoryTotal(this.GetContext().Manager, local_72)));
                this.GetOriginalCurrencyItem().opArrow().SetOptionalNum(int(local_22.Count));
                continue;
            }
            local_8.Add(local_22);
        }
        this.SetRewardList(TEUIModelRef<FVM_CommonRewardList>(::FVM_CommonRewardList::Create(this.GetContext().Manager, local_8)));
        this.GetRewardList().opArrow().SetbDisplayRequestNum(true);
        this.SetItemMultiplier(1);
        return;
    }
    FVM_CommonConsume opAssign(const FVM_CommonConsume &inout Other)
    {
        FVM_CommonConsume __r;
        this.m_OriginalCurrencyItem = Other.m_OriginalCurrencyItem;
        this.m_RewardList = Other.m_RewardList;
        this.m_ItemMultiplier = int(Other.m_ItemMultiplier);
        return __r;
    }
    void RefreshRewardListItemMultiplier()
    {
        if (this.GetRewardList().IsValid())
        {
            this.GetRewardList().opArrow().SetItemMultiplier(this.GetItemMultiplier());
        }
        return;
    }
    bool HasCurrencyItem() const
    {
        return this.GetOriginalCurrencyItem().IsValid();
    }
    FSlateBrush GetCurrencyItemIcon() const
    {
        if (this.GetOriginalCurrencyItem().IsValid())
        {
            return this.GetOriginalCurrencyItem().opArrow().GetItemIcon();
        }
        return FSlateBrush();
    }
    FText GetCurrencyDisplayNum() const
    {
        if (!(this.GetOriginalCurrencyItem().IsValid()))
        {
            return FText();
        }
        int local_9;
        local_9 = this.GetOriginalCurrencyItem().opArrow().GetNum();
        int local_10 = this.GetItemMultiplier() * this.GetOriginalCurrencyItem().opArrow().GetOptionalNum();
        if (local_10 > local_9)
        {
            return FText::FromString(FString::Format("<Red18B>{0}</>{1}{2}", local_9, "/", local_10));
        }
        return FText::FromString(FString::Format("{0}{1}{2}", local_9, "/", local_10));
    }
    bool HasRewards() const
    {
        bool local_5;
        if (this.GetRewardList().IsValid())
        {
            local_5 = this.GetRewardList().opArrow().HasRewards();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    TArray<TEUIModelRef<FVM_CommonRewardItem>> GetRewardItems() const
    {
        TArray<TEUIModelRef<FVM_CommonRewardItem>> local_12;
        if (this.GetRewardList().IsValid())
        {
            local_12 = this.GetRewardList().opArrow().GetRewards();
        }
        else
        {
            local_12 = TArray<TEUIModelRef<FVM_CommonRewardItem>>();
        }
        return local_12;
    }
    void OnPlayerInventoryChanged(const FMsg_PlayerInventoryChanged &inout Msg)
    {
        if (this.GetOriginalCurrencyItem().IsValid())
        {
            this.GetOriginalCurrencyItem().opArrow().SetNum(::FMS_PlayerInventory::Get(this.GetContext().Manager).GetTotalItemNum(this.GetOriginalCurrencyItem().opArrow().GetItemConfig()));
        }
        if (this.GetRewardList().IsValid())
        {
            this.GetRewardList().opArrow().UpdateMultipliedItemDatas();
        }
        return;
    }
    TEUIModelRef<FVM_Item> GetOriginalCurrencyItem() const property
    {
        this.TrackPropertyRead(0);
        return this.m_OriginalCurrencyItem;
    }
    void SetOriginalCurrencyItem(const TEUIModelRef<FVM_Item> &inout __Value) property
    {
        TEUIModelRef<FVM_Item> local_2;
        local_2 = this.m_OriginalCurrencyItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_OriginalCurrencyItem = __Value;
        return;
    }
    TEUIModelRef<FVM_CommonRewardList> GetRewardList() const property
    {
        this.TrackPropertyRead(1);
        return this.m_RewardList;
    }
    void SetRewardList(const TEUIModelRef<FVM_CommonRewardList> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonRewardList> local_2;
        local_2 = this.m_RewardList;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_RewardList = __Value;
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
}

struct __GeneratedProperties_FVM_CommonConsume
{
    UPROPERTY()
    bool HasCurrencyItem;
    UPROPERTY()
    FSlateBrush CurrencyItemIcon;
    UPROPERTY()
    FText CurrencyDisplayNum;
    UPROPERTY()
    bool HasRewards;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CommonRewardItem>> RewardItems;
    UPROPERTY()
    TEUIModelRef<FVM_CommonConsume> Self;


}

namespace FVM_CommonConsume
{
FVM_CommonConsume& Create(const UObject ContextObject, const TArray<FRewardItemEntry> &inout RewardEntries)
{
    return FVM_CommonConsume::CreateByManager(EUIInternal::GetContextManager(ContextObject), RewardEntries);
}
FVM_CommonConsume CreateByManager(const UEUIManagerSubsystem Manager, const TArray<FRewardItemEntry> &inout RewardEntries)
{
    FVM_CommonConsume __r;
    TEUIModelRef<FVM_CommonConsume> local_6 = TEUIModelRef<FVM_CommonConsume>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommonConsume::ModelId, 0, RewardEntries));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "HasCurrencyItem";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrencyItemIcon";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrencyDisplayNum";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasRewards";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RewardItems";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_CommonRewardItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonConsume>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonConsume;
    FEUIModelEffectDefine local_20;
    local_20.FunctionName = "RefreshRewardListItemMultiplier";
    Result.EffectFunctions.Add(local_20);
    FEUIModelMsgHandleDefine local_30;
    local_30.FunctionName = "__OnPlayerInventoryChanged";
    local_30.MessageTypeName = "Msg_PlayerInventoryChanged";
    local_30.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_30);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonConsume;
}
void __OnPlayerInventoryChanged(FVM_CommonConsume &inout Model, const FMsg_PlayerInventoryChanged &inout Message)
{
    Model.OnPlayerInventoryChanged(Message);
    return;
}
bool __UIGetter_HasCurrencyItem(const FVM_CommonConsume &inout Model)
{
    return Model.HasCurrencyItem();
}
FSlateBrush __UIGetter_CurrencyItemIcon(const FVM_CommonConsume &inout Model)
{
    return Model.GetCurrencyItemIcon();
}
FText __UIGetter_CurrencyDisplayNum(const FVM_CommonConsume &inout Model)
{
    return Model.GetCurrencyDisplayNum();
}
bool __UIGetter_HasRewards(const FVM_CommonConsume &inout Model)
{
    return Model.HasRewards();
}
TArray<TEUIModelRef<FVM_CommonRewardItem>> __UIGetter_RewardItems(const FVM_CommonConsume &inout Model)
{
    return Model.GetRewardItems();
}
TEUIModelRef<FVM_CommonConsume> __UIGetter_Self(const FVM_CommonConsume &inout Model)
{
    return TEUIModelRef<FVM_CommonConsume>(Model);
}
int __IndexOf_OriginalCurrencyItem()
{
    return 0;
}
int __IndexOf_RewardList()
{
    return 1;
}
int __IndexOf_ItemMultiplier()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_CommonConsume
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}


namespace FVM_ItemGainWayList
{
    const int ModelId = 0;

}
struct FVM_ItemGainWayList : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_ItemData> m_ItemData;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_ItemGainWayItem>> m_ItemGainWayItems;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CommonActionEntry>> m_GainWayOperationItems;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CommonItemTipOperationItem>> m_GainWayOperationPayloads;

    FVM_ItemGainWayList()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ItemGainWayList' by default constructor.");
        return;
    }
    FVM_ItemGainWayList(const FVM_ItemGainWayList &inout Other)
    {
        this.m_ItemData = Other.m_ItemData;
        this.m_ItemGainWayItems = Other.m_ItemGainWayItems;
        this.m_GainWayOperationItems = Other.m_GainWayOperationItems;
        this.m_GainWayOperationPayloads = Other.m_GainWayOperationPayloads;
        return;
    }
    FVM_ItemGainWayList(const TEUIModelRef<FM_ItemData> &inout InItemData)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetItemData(InItemData);
        return;
    }
    FVM_ItemGainWayList& opAssign(const FVM_ItemGainWayList &inout Other)
    {
        this.m_ItemData = Other.m_ItemData;
        this.m_ItemGainWayItems = Other.m_ItemGainWayItems;
        this.m_GainWayOperationItems = Other.m_GainWayOperationItems;
        return Other.m_GainWayOperationPayloads;
    }
    void PostConstruct()
    {
        int local_48 = 0;
        TEUIModelRef<FM_ItemData> local_2 = this.GetItemData();
        int local_5 = 0;
        for (; local_5 < 0.Num(); )
        {
            TEUIModelRef<FVM_ItemGainWayItem> local_10 = TEUIModelRef<FVM_ItemGainWayItem>(::FVM_ItemGainWayItem::Create(this.GetContext().Manager, local_5, this.GetItemData().opArrow().GetConfig()));
            this.GetModify_ItemGainWayItems().Add(local_10);
            local_48.SetupGainWayLeaf(this.GetItemData().opArrow().GetConfig(), local_5);
            this.GetModify_GainWayOperationPayloads().Add(TEUIModelRef<FVM_CommonItemTipOperationItem>(local_48));
            this.GetModify_GainWayOperationItems().Add(local_48.CreateActionEntry());
            ++local_5;
        }
        return;
    }
    bool IsEmpty() const
    {
        return this.GetItemGainWayItems().IsEmpty();
    }
    TArray<FEUIDynamicWidgetData> GetGainWayEntryDataList() const
    {
        TArray<FEUIDynamicWidgetData> local_4;
        for (auto& local_20 : this.GetGainWayOperationItems())
        {
            if (!(local_20.IsValid()))
            {
                continue;
            }
            FEUIDynamicWidgetData local_44;
            local_44.ModelContainer = FEUIModelContainer(local_20.opImplConv());
            local_4.Add(local_44);
        }
        return local_4;
    }
    TEUIModelRef<FM_ItemData> GetItemData() const property
    {
        this.TrackPropertyRead(0);
        return this.m_ItemData;
    }
    void SetItemData(const TEUIModelRef<FM_ItemData> &inout __Value) property
    {
        TEUIModelRef<FM_ItemData> local_2;
        local_2 = this.m_ItemData;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ItemData = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_ItemGainWayItem>> GetItemGainWayItems() const property
    {
        const TArray<TEUIModelRef<FVM_ItemGainWayItem>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FVM_ItemGainWayItem>> GetModify_ItemGainWayItems() property
    {
        TArray<TEUIModelRef<FVM_ItemGainWayItem>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetItemGainWayItems(const TArray<TEUIModelRef<FVM_ItemGainWayItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ItemGainWayItems = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_CommonActionEntry>> GetGainWayOperationItems() const property
    {
        const TArray<TEUIModelRef<FVM_CommonActionEntry>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<TEUIModelRef<FVM_CommonActionEntry>> GetModify_GainWayOperationItems() property
    {
        TArray<TEUIModelRef<FVM_CommonActionEntry>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetGainWayOperationItems(const TArray<TEUIModelRef<FVM_CommonActionEntry>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_GainWayOperationItems = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_CommonItemTipOperationItem>> GetGainWayOperationPayloads() const property
    {
        const TArray<TEUIModelRef<FVM_CommonItemTipOperationItem>> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<TEUIModelRef<FVM_CommonItemTipOperationItem>> GetModify_GainWayOperationPayloads() property
    {
        TArray<TEUIModelRef<FVM_CommonItemTipOperationItem>> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetGainWayOperationPayloads(const TArray<TEUIModelRef<FVM_CommonItemTipOperationItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_GainWayOperationPayloads = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ItemGainWayList
{
    UPROPERTY()
    bool IsEmpty;
    UPROPERTY()
    TArray<FEUIDynamicWidgetData> GainWayEntryDataList;
    UPROPERTY()
    TEUIModelRef<FVM_ItemGainWayList> Self;


}

namespace FVM_ItemGainWayList
{
FVM_ItemGainWayList& Create(const UObject ContextObject, const TEUIModelRef<FM_ItemData> &inout ItemData)
{
    return FVM_ItemGainWayList::CreateByManager(EUIInternal::GetContextManager(ContextObject), ItemData);
}
FVM_ItemGainWayList CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_ItemData> &inout ItemData)
{
    FVM_ItemGainWayList __r;
    TEUIModelRef<FVM_ItemGainWayList> local_6 = TEUIModelRef<FVM_ItemGainWayList>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ItemGainWayList::ModelId, 0, ItemData));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ItemGainWayItems";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_ItemGainWayItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "GainWayOperationItems";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_CommonActionEntry>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsEmpty";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "GainWayEntryDataList";
    local_14.TypeName = "TArray<FEUIDynamicWidgetData>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ItemGainWayList>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ItemGainWayList;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ItemGainWayList;
}
TArray<TEUIModelRef<FVM_ItemGainWayItem>> __UIGetter_ItemGainWayItems(const FVM_ItemGainWayList &inout Model)
{
    return Model.GetItemGainWayItems();
}
TArray<TEUIModelRef<FVM_CommonActionEntry>> __UIGetter_GainWayOperationItems(const FVM_ItemGainWayList &inout Model)
{
    return Model.GetGainWayOperationItems();
}
bool __UIGetter_IsEmpty(const FVM_ItemGainWayList &inout Model)
{
    return Model.IsEmpty();
}
TArray<FEUIDynamicWidgetData> __UIGetter_GainWayEntryDataList(const FVM_ItemGainWayList &inout Model)
{
    return Model.GetGainWayEntryDataList();
}
TEUIModelRef<FVM_ItemGainWayList> __UIGetter_Self(const FVM_ItemGainWayList &inout Model)
{
    return TEUIModelRef<FVM_ItemGainWayList>(Model);
}
int __IndexOf_ItemData()
{
    return 0;
}
int __IndexOf_ItemGainWayItems()
{
    return 1;
}
int __IndexOf_GainWayOperationItems()
{
    return 2;
}
int __IndexOf_GainWayOperationPayloads()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_ItemGainWayList
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

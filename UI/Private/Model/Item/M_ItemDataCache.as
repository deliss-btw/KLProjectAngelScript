
namespace FMS_ItemDataCache
{
    const int ModelId = 0;

}
struct FMS_ItemDataCache : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TMap<uint64, TEUIModelRef<FM_ItemData>> m_GlobalItemDataCache;
    UPROPERTY()
    TMap<TEUIModelWeakRef<FM_ItemData>, uint64> m_ItemDataToUidMap;

    FMS_ItemDataCache()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_ItemDataCache(const FMS_ItemDataCache &inout Other)
    {
        this.m_GlobalItemDataCache = Other.m_GlobalItemDataCache;
        this.m_ItemDataToUidMap = Other.m_ItemDataToUidMap;
        return;
    }
    FMS_ItemDataCache& opAssign(const FMS_ItemDataCache &inout Other)
    {
        this.m_GlobalItemDataCache = Other.m_GlobalItemDataCache;
        return Other.m_ItemDataToUidMap;
    }
    bool HasItemData(const uint64 ItemUid)
    {
        return this.GetGlobalItemDataCache().Contains(ItemUid);
    }
    TEUIModelRef<FM_ItemData> RequireItemData(const uint64 ItemUid)
    {
        TEUIModelRef<FM_ItemData> local_2;
        if (this.GetGlobalItemDataCache().Find(ItemUid, local_2))
        {
            return local_2;
        }
        local_2 = TEUIModelRef<FM_ItemData>(::FM_ItemData::Create(this.GetContext().Manager));
        this.AddItemData(ItemUid, local_2);
        return local_2;
    }
    bool TryGetItemUid(const TEUIModelRef<FM_ItemData> &inout ItemData, uint64 &inout ItemUid)
    {
        TEUIModelWeakRef<FM_ItemData> local_2;
        return this.GetItemDataToUidMap().Find(local_2, ItemUid);
    }
    void AddItemData(const uint64 ItemUid, const TEUIModelRef<FM_ItemData> &inout ItemData)
    {
        this.GetModify_GlobalItemDataCache().Add(ItemUid, ItemData);
        TEUIModelWeakRef<FM_ItemData> local_2;
        this.GetModify_ItemDataToUidMap().Add(local_2, ItemUid);
        return;
    }
    void RemoveItemData(const TEUIModelRef<FM_ItemData> &inout ItemData)
    {
        int local_2;
        TEUIModelWeakRef<FM_ItemData> local_4;
        if (this.GetModify_ItemDataToUidMap().RemoveAndCopyValue(local_4, local_2))
        {
        }
        return;
    }
    const TMap<uint64, TEUIModelRef<FM_ItemData>> GetGlobalItemDataCache() const property
    {
        const TMap<uint64, TEUIModelRef<FM_ItemData>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TMap<uint64, TEUIModelRef<FM_ItemData>> GetModify_GlobalItemDataCache() property
    {
        TMap<uint64, TEUIModelRef<FM_ItemData>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetGlobalItemDataCache(const TMap<uint64, TEUIModelRef<FM_ItemData>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_GlobalItemDataCache = __Value;
        return;
    }
    const TMap<TEUIModelWeakRef<FM_ItemData>, uint64> GetItemDataToUidMap() const property
    {
        const TMap<TEUIModelWeakRef<FM_ItemData>, uint64> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TMap<TEUIModelWeakRef<FM_ItemData>, uint64> GetModify_ItemDataToUidMap() property
    {
        TMap<TEUIModelWeakRef<FM_ItemData>, uint64> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetItemDataToUidMap(const TMap<TEUIModelWeakRef<FM_ItemData>, uint64> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ItemDataToUidMap = __Value;
        return;
    }
}

namespace FMS_ItemDataCache
{
FMS_ItemDataCache& Get(const UObject ContextObject)
{
    return FMS_ItemDataCache::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_ItemDataCache GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_ItemDataCache __r;
    TEUIModelRef<FMS_ItemDataCache> local_6 = TEUIModelRef<FMS_ItemDataCache>(EUIInternal::MakeModelWithManager(Manager, FMS_ItemDataCache::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_ItemDataCache;
}
int __IndexOf_GlobalItemDataCache()
{
    return 0;
}
int __IndexOf_ItemDataToUidMap()
{
    return 1;
}
}

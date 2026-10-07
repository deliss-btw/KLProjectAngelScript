

struct FRewardSortTagPriorityConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FName TagKey;
    UPROPERTY()
    int Priority = 0;
    UPROPERTY()
    FText DisplayText;


}

struct FRewardSortItemOverrideConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FDataObjectPtr m_ItemId;
    UPROPERTY()
    float32 SortOrder = 0.0f;
    UPROPERTY()
    int SubOrder = 0;


    TDataObjectPtr<FItemConfig> GetItemId() const property
    {
        TDataObjectPtr<FItemConfig> __r;
        return __r;
    }
    void SetItemId(const TDataObjectPtr<FItemConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FItemConfig>> local_2;
        this.m_ItemId = local_2;
        return;
    }
}

namespace FRewardSortTagPriorityConfig
{
FDataObjectPtr FindByKey(const FName &inout Value)
{
    FindByGlobalKeyValue<FName> local_28 = FindByGlobalKeyValue<FName>(__DataObjectStructName(n"FRewardSortTagPriorityConfig"), Value);
    return local_28.opImplConv();
}
}
namespace FRewardSortItemOverrideConfig
{
FDataObjectPtr FindByKey(const TDataObjectPtr<FItemConfig> &inout Value)
{
    FindByGlobalKeyValue<TDataObjectPtr<FItemConfig>> local_28 = FindByGlobalKeyValue<TDataObjectPtr<FItemConfig>>(__DataObjectStructName(n"FRewardSortItemOverrideConfig"), Value);
    return local_28.opImplConv();
}
}



struct FDefaultInventoryItemConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    TArray<FInventoryInitItem> InitItems;


}

namespace FDefaultInventoryItemConfig
{
TDataObjectPtr<FDefaultInventoryItemConfig> GetByDataId(const uint DataId)
{
    return TDataObjectPtr<FDefaultInventoryItemConfig>();
}
}

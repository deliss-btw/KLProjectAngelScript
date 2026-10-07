
namespace AutoTest::API::InventoryAPI
{
bool HasItemInInventoryByName(const FName &inout ItemName)
{
    if (ItemName.IsNone())
    {
        return false;
    }
    TDataObjectPtr<FItemConfig> local_26 = InventoryUtils::GetItemConfigByName(ItemName);
    if ((local_26 == nullptr))
    {
        return false;
    }
    FECSEntity local_58 = AutoTest::CommonUtils::GetLocalAvatarEntity();
    ThrowIf(!(local_58.IsValid()), "AvatarEntity is invalid.");
    if (int(local_26.opArrow().ItemType) == 1)
    {
        return (FMS_PlayerInventory::Get(ECS::GetUEWorld()).GetTotalItemNum(local_26) > 0);
    }
    return InventoryUtils::HasItemInInventory(local_58, local_26);
}
int GetInventoryItemAmountByName(const FName &inout ItemName)
{
    if (ItemName.IsNone())
    {
        return 0;
    }
    TDataObjectPtr<FItemConfig> local_26 = InventoryUtils::GetItemConfigByName(ItemName);
    if ((local_26 == nullptr))
    {
        return 0;
    }
    FECSEntity local_54 = AutoTest::CommonUtils::GetLocalAvatarEntity();
    ThrowIf(!(local_54.IsValid()), "AvatarEntity is invalid.");
    if (int(local_26.opArrow().ItemType) == 1)
    {
        return FMS_PlayerInventory::Get(ECS::GetUEWorld()).GetTotalItemNum(local_26);
    }
    return InventoryUtils::GetInventoryItemNumber(local_54, local_26);
}
void PerformSortItemsInInventory(const int SorterIndex)
{
    AutoTest::API::InventoryAPI::GetInventoryViewModel();
    OnSorterSelected();
    return;
}
TArray<uint> GetInventoryCurrentStorage()
{
    TEUIModelRef<FVM_InventoryMain> local_4 = AutoTest::API::InventoryAPI::GetInventoryViewModel();
    TArray<uint> local_8;
    TArray<TEUIModelRef<FVM_InventoryMainItem>> local_12 = local_4.opArrow().GetCurrentDisplayItems();
    for (auto& local_28 : local_12)
    {
        if (local_28.IsValid() && local_28.opArrow().GetItem().IsValid())
        {
            local_8.Add(local_28.opArrow().GetItem().opArrow().GetConfig().opArrow().DataId);
        }
    }
    return local_8;
}
void PerformChangeFilter(const int FilterIndex)
{
    AutoTest::API::InventoryAPI::GetInventoryViewModel();
    OnFilterSelected();
    return;
}
TEUIModelRef<FVM_InventoryMain> GetInventoryViewModel()
{
    // body not fully recovered вЂ” stub [unresolved-operand]
    TEUIModelRef<FVM_InventoryMain> __r; return __r;
}
}

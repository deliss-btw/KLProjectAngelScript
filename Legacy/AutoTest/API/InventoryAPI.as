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
    TEUIModelRef<FVM_InventoryMain> local_4 = AutoTest::API::InventoryAPI::GetInventoryViewModel();
    local_4.Get().OnSorterSelected();
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
    TEUIModelRef<FVM_InventoryMain> local_4 = AutoTest::API::InventoryAPI::GetInventoryViewModel();
    local_4.Get().OnFilterSelected();
    return;
}
TEUIModelRef<FVM_InventoryMain> GetInventoryViewModel()
{
    UWidget_InventoryMain local_28;
    TEUIModelRef<FVM_InventoryMain> local_2;
    TArray<UWidget> local_6;
    KLAutomation::GetAllWidgetsOfClass(local_6, UWidget_InventoryMain, false);
    ThrowIf(local_6.IsEmpty(), "Can't get InventoryViewModel, check if the inventory Widget is open.");
    for (auto local_24 : local_6)
    {
        local_28 = Cast<UWidget_InventoryMain>(local_24);
        ThrowIf(local_28, !((local_28 != nullptr)));
        if (local_28.InventoryMain.Get())
        {
            TEUIModelRef<FVM_InventoryMain> local_30;
            local_30;
            local_2 = local_30;
            break;
        }
    }
    return local_2;
}
}

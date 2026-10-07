
namespace FItemActionSource
{
FItemActionSource InvokeFromInventory(const FEUIModelContext &inout Context, const FM_ItemData &inout ItemData)
{
    int local_48;
    FECSEntity local_12 = FASCommonUtils::GetUniqueAvatarPawnEntity(Context.GetLocalPlayer());
    FItemActionSource local_46;
    local_46.SetItemOwner(local_12);
    local_46.SetItemConfig(ItemData.GetConfig());
    local_48 = local_46.GetItemUid();
    FMS_ItemDataCache::Get(Context.Manager).TryGetItemUid(TEUIModelRef<FM_ItemData>(ItemData), local_48);
    local_46.SetItemUid(local_48);
    local_46.SetbSpecifyInventoryID(true);
    return local_46;
}
FItemActionSource InvokeFromQuickSlot(const FECSEntity &inout LocalPlayer, const TDataObjectPtr<FItemConfig> &inout ItemConfig)
{
    FECSEntity local_8 = FASCommonUtils::GetUniqueAvatarPawnEntity(LocalPlayer);
    FItemActionSource local_42;
    local_42.SetItemOwner(local_8);
    local_42.SetItemConfig(ItemConfig);
    local_42.SetItemUid(0);
    local_42.SetbSpecifyInventoryID(false);
    return local_42;
}
}

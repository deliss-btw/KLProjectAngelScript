
namespace ItemConfigUtils_Internal
{
    const TArray<EItemType> DSItemTypes = TArray<EItemType>();
    const TArray<EItemType> NonStackableItemTypes = TArray<EItemType>();

}
namespace ItemConfigUtils
{
bool LimitPackMax(const TDataObjectPtr<FItemConfig> &inout ItemConfig)
{
    if (!(ItemConfig))
    {
        return false;
    }
    return ItemConfig.opArrow().PackMax > 0 && (ItemConfig.opArrow().PackMax < 2147483647);
}
int GetPackMax(const TDataObjectPtr<FItemConfig> &inout ItemConfig)
{
    if (ItemConfigUtils::LimitPackMax(ItemConfig))
    {
        return ItemConfig.opArrow().PackMax;
    }
    return 2147483647;
}
bool LimitOwnMax(const TDataObjectPtr<FItemConfig> &inout ItemConfig)
{
    if (!(ItemConfig))
    {
        return false;
    }
    return ItemConfig.opArrow().OwnMax > 0 && (ItemConfig.opArrow().OwnMax < 2147483647);
}
int GetOwnMax(const TDataObjectPtr<FItemConfig> &inout ItemConfig)
{
    if (ItemConfigUtils::LimitOwnMax(ItemConfig))
    {
        return ItemConfig.opArrow().OwnMax;
    }
    return 2147483647;
}
bool LimitInventoryMax(const TDataObjectPtr<FItemConfig> &inout ItemConfig)
{
    if (!(ItemConfig))
    {
        return false;
    }
    int local_3 = ItemConfig.opArrow().GetInventoryMax();
    return (local_3 > 0 && (local_3 < 2147483647));
}
int GetInventoryMax(const TDataObjectPtr<FItemConfig> &inout ItemConfig)
{
    if (ItemConfigUtils::LimitInventoryMax(ItemConfig))
    {
        return ItemConfig.opArrow().GetInventoryMax();
    }
    return 2147483647;
}
bool LimitBankMax(const TDataObjectPtr<FItemConfig> &inout ItemConfig)
{
    if (!(ItemConfig))
    {
        return false;
    }
    return (ItemConfig.opArrow().GetBankMax() > 0);
}
int GetBankMax(const TDataObjectPtr<FItemConfig> &inout ItemConfig)
{
    if (ItemConfigUtils::LimitBankMax(ItemConfig))
    {
        return ItemConfig.opArrow().GetBankMax();
    }
    return 2147483647;
}
bool LimitTrunkMax(const TDataObjectPtr<FItemConfig> &inout ItemConfig)
{
    if (!(ItemConfig))
    {
        return false;
    }
    return ItemConfigUtils::LimitTrunkMax(ItemConfig.opArrow().ItemTrunk);
}
bool LimitTrunkMax(const EItemTrunk Trunk)
{
    int local_1 = ItemConfigUtils_Internal::GetTrunkSlotNum(EItemTrunk(Trunk));
    return local_1 > 0 && (local_1 < 2147483647);
}
int GetTrunkMax(const TDataObjectPtr<FItemConfig> &inout ItemConfig)
{
    if (!(ItemConfig))
    {
        return 0;
    }
    return ItemConfigUtils::GetTrunkMax(ItemConfig.opArrow().ItemTrunk);
}
int GetTrunkMax(const EItemTrunk Trunk)
{
    if (ItemConfigUtils::LimitTrunkMax(EItemTrunk(Trunk)))
    {
        return ItemConfigUtils_Internal::GetTrunkSlotNum(EItemTrunk(Trunk));
    }
    return 2147483647;
}
bool IsEquipment(const TDataObjectPtr<FItemConfig> &inout ItemConfig)
{
    CastTo local_4;
    return ItemConfig && !((local_4.opCall() == nullptr));
}
bool IsGSItem(const TDataObjectPtr<FItemConfig> &inout ItemConfig)
{
    return ItemConfig && (int(ItemConfig.opArrow().ItemType) != 0) && !(ItemConfigUtils_Internal::DSItemTypes.Contains(ItemConfig.opArrow().ItemType));
}
bool IsDSItem(const TDataObjectPtr<FItemConfig> &inout ItemConfig)
{
    return ItemConfig && (int(ItemConfig.opArrow().ItemType) != 0) && ItemConfigUtils_Internal::DSItemTypes.Contains(ItemConfig.opArrow().ItemType);
}
bool IsStackable(const TDataObjectPtr<FItemConfig> &inout ItemConfig)
{
    if (!(ItemConfig))
    {
        return false;
    }
    return !(ItemConfigUtils_Internal::NonStackableItemTypes.Contains(ItemConfig.opArrow().ItemType));
}
bool IsPermissionItem(const TDataObjectPtr<FItemConfig> &inout ItemConfig)
{
    return ItemConfig && (int(ItemConfig.opArrow().ItemType) == 6);
}
}
namespace ItemConfigUtils_Internal
{
uint GetTrunkSlotNum(const EItemTrunk ItemTrunk)
{
    TDataObjectPtr<FItemTrunkConfig> local_26 = UGlobalItemSettings::Get().GetItemTrunkConfig();
    if (local_26)
    {
        return local_26.opArrow().MaxSlotNum;
    }
    return 0;
}
}

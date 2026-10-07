
namespace GameplayItemBankUtils
{
void AddItem(const FECSEntity &inout Player, const TDataObjectPtr<FItemConfig> &inout Config, const int Number)
{
    ModifyOrAdd local_4;
    FC_GameplayItemBank& local_6 = local_4.opCall();
    if (local_6)
    {
        if (local_6.GetItems().Contains(Config))
        {
            local_6.GetModify_Items()[Config] = (local_6.GetItems()[Config] + Number);
            return;
        }
        local_6.GetModify_Items().Add(Config, Number);
    }
    return;
}
void RestockItemToInventory(const FECSEntity &inout Player)
{
    Has local_4;
    int local_18 = 0;
    int local_24 = 0;
    Has local_10;
    if (!(local_4.opCall()) || !(local_10.opCall()))
    {
        return;
    }
    TArray<TDataObjectPtr<FItemConfig>> local_28;
    for (auto& local_46 : local_18.GetItems())
    {
        if (0 <= 0)
        {
            continue;
        }
        TDataObjectPtr<FItemConfig> local_50 = local_46.GetKey();
        if ((local_50 && (0 > 0)))
        {
            if (local_24.ConfigToUidList.Contains(local_50))
            {
                if (local_24.ConfigToUidList[local_50].GetUids().Num() < 0)
                {
                    local_28.Add(local_50);
                }
                continue;
            }
            local_28.Add(local_50);
        }
    }
    auto local_58 = local_28.Iterator();
    for (; local_58.CanProceed;)
    {
        TDataObjectPtr<FItemConfig> local_50_2 = local_58.Proceed();
        int local_65 = 0;
        if (local_18.GetItems().Find(local_50_2, local_65))
        {
            if (local_65 > 0)
            {
                int local_48 = FMath::Min(local_65, GameplayInventoryUtils::GetItemNumToReachInventoryOrTrunkLimit(Player, local_50_2));
                if (local_48 > 0)
                {
                    local_18.GetModify_Items()[local_50_2] = (local_65 - local_48);
                    InventoryUtils::LowLevelAddInventoryItem(true, false, local_48, Player);
                    GameplayItemBankUtils::ShowItemInventoryRestockFromBankMessage(Player, local_50_2, local_48);
                }
            }
        }
    }
    return;
}
void ShowItemInventoryRestockFromBankMessage(const FECSEntity &inout Entity, const TDataObjectPtr<FItemConfig> &inout Item, const int Number)
{
    TArray<FTextArgument> local_4;
    Make local_10;
    local_4.Add(local_10.opImplConv());
    MessageHintUtils::ShowMessageHint(FASCommonUtils::GetUniquePlayerEntity(Entity), InventoryUtils::GetGlobalItemSettings().ItemInventoryRestockFromBankHint, local_4);
    return;
}
}

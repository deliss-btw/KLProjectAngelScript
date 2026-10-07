

struct FInventoryCategorySortData
{
    UPROPERTY()
    int64 LastSortTimestamp;
    UPROPERTY()
    UItemSorterBase LastUsedSorter = nullptr;


}

class UInventorySaveGame : USaveGame
{
    UPROPERTY()
    TMap<FGameplayTag, FInventoryCategorySortData> CategorySortData;
    UPROPERTY()
    TMap<FGameplayTag, UItemFilterBase> CategoryFilters;

    UInventorySaveGame()
    {
        return;
    }
}

namespace InventorySaveGame
{
UInventorySaveGame Get(const uint PlayerId)
{
    UInventorySaveGame local_16;
    FString local_8 = InventorySaveGame::GetSaveGameName(PlayerId);
    if (Gameplay::DoesSaveGameExist(local_8, 0))
    {
        local_16 = (Cast<UInventorySaveGame>(Gameplay::LoadGameFromSlot(local_8, 0)));
        if (local_16 != nullptr)
        {
            return local_16;
        }
    }
    local_16 = Cast<UInventorySaveGame>(Gameplay::CreateSaveGameObject(UInventorySaveGame));
    Gameplay::SaveGameToSlot(local_16, local_8, 0);
    return local_16;
}
void Save(const uint PlayerId, const UInventorySaveGame SaveGame, const bool bFlush = false)
{
    FString local_8 = InventorySaveGame::GetSaveGameName(PlayerId);
    if (bFlush)
    {
        Gameplay::SaveGameToSlot(SaveGame, local_8, 0);
    }
    else
    {
        Gameplay::AsyncSaveGameToSlot(SaveGame, local_8, 0, FAsyncSaveGameToSlotDynamicDelegate());
    }
    return;
}
FString GetSaveGameName(const uint PlayerId)
{
    return FString().Append("Inventory_").Append(PlayerId);
}
}

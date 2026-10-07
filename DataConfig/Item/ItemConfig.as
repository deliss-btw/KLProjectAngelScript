
enum EItemRarity
{
    RarityD,
    RarityC,
    RarityB,
    RarityA,
    RarityS,
}

enum EItemType
{
    None,
    Virtual,
    Weapon,
    Material,
    GameplayItem,
    CommonItem,
    PermissionItem,
    Talisman,
    Mount = 101,
}

enum EDropItemAllocation
{
    None,
    Inventory,
    Ground,
    GroundBag,
}

enum EDSDropType
{
    EveryOne,
    ShareDrop,
    Personal,
}


struct FItemGainWayConfig
{
    UPROPERTY()
    FText DisplayName;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> OpenPage;

    FItemGainWayConfig()
    {
        return;
    }
}

struct FItemConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FText ItemName;
    UPROPERTY()
    FText ItemDescription;
    UPROPERTY()
    FText ItemBackgroundDescription;
    UPROPERTY()
    EItemType ItemType;
    UPROPERTY()
    EItemTrunk ItemTrunk;
    UPROPERTY()
    FFilteredGameplayTag ItemCategory;
    UPROPERTY()
    FGameplayTagContainer ItemTags;
    UPROPERTY()
    uint PackMax;
    UPROPERTY()
    uint OwnMax;
    UPROPERTY()
    uint BringMax;
    UPROPERTY()
    EItemRarity Rarity;
    UPROPERTY()
    FSoftBrush ItemIcon;
    UPROPERTY()
    TSoftClassPtr<ACollectionPrefab> DropPrefab;
    UPROPERTY()
    EDropItemAllocation DefaultDropAllocation = EDropItemAllocation(2);
    UPROPERTY()
    TMap<EItemActionType, TSubclassOf<UItemActionConfigBase>> ItemActions;
    UPROPERTY()
    FDataObjectPtr m_DecomposeConfig;
    UPROPERTY()
    bool bAllowDestroy;
    UPROPERTY()
    TArray<FItemGainWayConfig> GainWays;
    UPROPERTY()
    FDataObjectPtr m_ItemShortageTips;


    int GetBankMax() const
    {
        int local_5;
        if (this.BringMax > 0)
        {
            if (this.OwnMax > 0)
            {
                local_5 = this.OwnMax;
            }
            else
            {
                local_5 = 2147483647;
            }
            int local_2 = this.BringMax;
            if (local_5 > local_2)
            {
                local_2 = this.BringMax;
                return local_5 - local_2;
            }
            return 0;
        }
        return 0;
    }
    int GetInventoryMax() const
    {
        if (this.BringMax > 0)
        {
            return this.BringMax;
        }
        return this.OwnMax;
    }
    const TDataObjectPtr<FDropItemConfigBase> GetDecomposeConfig() const property
    {
        const TDataObjectPtr<FDropItemConfigBase> __r;
        return __r;
    }
    void SetDecomposeConfig(const TDataObjectPtr<FDropItemConfigBase> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FDropItemConfigBase>> local_2;
        this.m_DecomposeConfig = local_2;
        return;
    }
    const TDataObjectPtr<FMessageHintConfig> GetItemShortageTips() const property
    {
        const TDataObjectPtr<FMessageHintConfig> __r;
        return __r;
    }
    void SetItemShortageTips(const TDataObjectPtr<FMessageHintConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FMessageHintConfig>> local_2;
        this.m_ItemShortageTips = local_2;
        return;
    }
}

struct FItemParamConfig
{
    UPROPERTY()
    TDataObjectPtr<FItemConfig> Item;
    UPROPERTY()
    uint Count;


}

TDataObjectPtr<FItemConfig> GetData(const FItemTableRowRef &inout RowRef)
{
    return TDataObjectPtr<FItemConfig>();
}
namespace ItemConfigLibrary
{
UFUNCTION()
TDataObjectPtr<FItemConfig> ItemRowData(const FItemTableRowRef &inout Row)
{
    return GetData(Row);
}
}
namespace FItemConfig
{
TDataObjectPtr<FItemConfig> GetByDataId(const uint DataId)
{
    return TDataObjectPtr<FItemConfig>();
}
}

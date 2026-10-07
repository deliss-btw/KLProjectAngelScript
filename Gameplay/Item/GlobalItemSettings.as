
enum EItemTipActionId
{
    AutoItemMain = 1,
    More = 5,
    QuickSlotOpen,
    QuickSlotReplace,
    Recharge,
}


struct FDefaultItemActionConfig
{
    UPROPERTY()
    TMap<EItemActionType, TSubclassOf<UItemActionConfigBase>> ItemActions;

    FDefaultItemActionConfig()
    {
        return;
    }
}

struct FGlobalItemSettingsCache
{
    UPROPERTY()
    TMap<EItemTrunk, TDataObjectPtr<FItemTrunkConfig>> ItemTrunkConfigs;

    FGlobalItemSettingsCache()
    {
        return;
    }
}

class UGlobalItemSettings : UGameplaySettingsBase
{
    UPROPERTY()
    TMap<EItemRarity, TSoftClassPtr<ACollectionPrefab>> Drops;
    UPROPERTY()
    TMap<EItemRarity, TSoftClassPtr<ACollectionPrefab>> BoonRarityPrefabs;
    UPROPERTY()
    float32 DropItemDefaultAutoDestroySeconds = 600.0f;
    UPROPERTY()
    UDataTable ItemQuickSlotTable;
    UPROPERTY()
    TDataObjectPtr<FItemQuickSlotConfig> TemporaryAbilitySlot;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> ItemQuickSlotSelectListWidget;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> InventoryAddItemHintWidget;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> EquipableSkillAddHint;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> MotionUnlockHint;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> ItemLimitReachedHint;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> ItemInventoryReachLimitAddToBankHint;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> ItemInventoryRestockFromBankHint;
    UPROPERTY()
    TMap<EItemActionType, FEUIInputAction> ItemActionInputActions;
    UPROPERTY()
    TMap<EItemTipActionId, FEUIInputAction> ItemTipActionInputs;
    UPROPERTY()
    UDataTable RarityConfigTable;
    UPROPERTY()
    FSoftBrush EmptyItemIcon;
    UPROPERTY()
    TMap<EItemType, FSoftBrush> ItemHideStateImage;
    UPROPERTY()
    UDataTable ItemTrunkTable;
    UPROPERTY()
    UDataTable DefaultInventoryItemTable;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> CoinConfig;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> VoucherConfig;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> SoulsConfig;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> PointsConfig;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> BattleTokenConfig;
    UPROPERTY()
    TArray<UItemOperationConfigBase> ItemOperationConfigs;
    UPROPERTY()
    TArray<FEUIInputAction> ItemOperationSequencedInputActions;


    UFUNCTION()
    FInstancedStruct ComputeCacheData_Implementation() const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        FInstancedStruct __r; return __r;
    }
    UClass GetItemDropPrefab(const FItemConfig &inout ItemConfig)
    {
        if (!(ItemConfig.DropPrefab.IsNull()))
        {
            UClass local_4 = System::LoadClassAsset_Blocking(ItemConfig.DropPrefab);
            if (IsValid(local_4))
            {
                return local_4;
            }
        }
        TSoftClassPtr<ACollectionPrefab> local_16;
        if (this.Drops.Find(ItemConfig.Rarity, local_16))
        {
            return local_16.Get();
        }
        UClass local_6;
        return local_6;
    }
    TDataObjectPtr<FItemRarityConfig> GetRarityConfig(const EItemRarity Rarity)
    {
        if (this.RarityConfigTable != nullptr)
        {
            TArray<FName> local_12 = this.RarityConfigTable.GetRowNames();
            for (auto& local_26 : local_12)
            {
                UDataTable::FindDataObject local_54;
                TDataObjectPtr<FItemRarityConfig> local_78 = local_54.opCall(local_26);
                if (local_78 && (int(local_78.opArrow().Rarity) == int(Rarity)))
                {
                    return local_78;
                }
            }
        }
        return TDataObjectPtr<FItemRarityConfig>(nullptr);
    }
    TDataObjectPtr<FItemTrunkConfig> GetItemTrunkConfig(const EItemTrunk Trunk)
    {
        TConstRawPtr<FGlobalItemSettingsCache> local_6 = FInstancedStruct::GetPtr(this.GetCacheData()).opCall();
        if (local_6)
        {
            TDataObjectPtr<FItemTrunkConfig> local_34;
            if (local_6.opArrow().ItemTrunkConfigs.Find(Trunk, local_34))
            {
                return local_34;
            }
        }
        return TDataObjectPtr<FItemTrunkConfig>(nullptr);
    }
}


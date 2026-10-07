

struct FRarityDescConfig
{
    UPROPERTY()
    FText DescText;

    FRarityDescConfig()
    {
        return;
    }
}

class UAvatarEquipmentSettings : UGameplaySettingsBase
{
    UPROPERTY()
    FText SlotLockStateTips;
    UPROPERTY()
    FSoftBrush LockSlotImage;
    UPROPERTY()
    FSoftBrush UnEquipSlotImage;
    UPROPERTY()
    FSoftBrush WeaponSlotImage;
    UPROPERTY()
    FSoftBrush TalismanSlotImage;
    UPROPERTY()
    FText RarityFilterMaxCountText;
    UPROPERTY()
    FText TraitFilterMaxCountText;
    UPROPERTY()
    TMap<EItemRarity, FRarityDescConfig> RarityFilters;

    UAvatarEquipmentSettings()
    {
        return;
    }
}



enum EEquipmentType
{
    None,
    Weapon,
    NATIVE_MAX = 1,
    Talisman,
}

enum EEquipSlotType
{
    None,
    MainWeapon,
    NATIVE_MAX = 1,
    Talisman1,
    Talisman2,
    Talisman3,
    Talisman4,
    MaxCount,
}

enum EBoonTraitAdaptRule
{
    All,
    AvatarList,
    PVXBoss,
}


struct FTraitModifiers
{
    UPROPERTY()
    TArray<FGameplayModifierConfigRefWithArgs> Modifiers;
    UPROPERTY()
    FText Description;

    FTraitModifiers()
    {
        return;
    }
}

struct FCapabilityConfigWithLevel
{
    UPROPERTY()
    TDataObjectPtr<FCapabilityConfig> m_CapabilityConfig;
    UPROPERTY()
    int m_Level = 1;


    const TDataObjectPtr<FCapabilityConfig> GetCapabilityConfig() const property
    {
        const TDataObjectPtr<FCapabilityConfig> __r;
        return __r;
    }
    TDataObjectPtr<FCapabilityConfig> GetCapabilityConfig() property
    {
        TDataObjectPtr<FCapabilityConfig> __r;
        return __r;
    }
    void SetCapabilityConfig(const TDataObjectPtr<FCapabilityConfig> &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    int GetLevel() const property
    {
        return this.m_Level;
    }
    void SetLevel(const int __Value) property
    {
        this.m_Level = __Value;
        return;
    }
}

struct FTraitCapabilities
{
    UPROPERTY()
    TArray<FCapabilityConfigWithLevel> Capabilities;
    UPROPERTY()
    FText Description;

    FTraitCapabilities()
    {
        return;
    }
}

struct FTraitConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    uint LevelLimit;
    UPROPERTY()
    FText TraitName;
    UPROPERTY()
    FSoftBrush TraitIcon;
    UPROPERTY()
    FBuffConfigRef Buff;
    UPROPERTY()
    TMap<int, FTraitModifiers> ModifiersByLevel;
    UPROPERTY()
    TMap<int, FTraitCapabilities> CapabilitiesByLevel;
    UPROPERTY()
    EItemRarity Rarity;
    UPROPERTY()
    FDataObjectPtr m_AdaptAvatar;
    UPROPERTY()
    EBoonTraitAdaptRule BoonRule = EBoonTraitAdaptRule(0);
    UPROPERTY()
    TArray<FDataObjectPtr> m_BoonAvatarList;
    UPROPERTY()
    int BoonDropNumLimit = 0;


    const TDataObjectPtr<FAvatarMappingConfig> GetAdaptAvatar() const property
    {
        const TDataObjectPtr<FAvatarMappingConfig> __r;
        return __r;
    }
    void SetAdaptAvatar(const TDataObjectPtr<FAvatarMappingConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FAvatarMappingConfig>> local_2;
        this.m_AdaptAvatar = local_2;
        return;
    }
    const TArray<TDataObjectPtr<FAvatarMappingConfig>> GetBoonAvatarList() const property
    {
        const TArray<TDataObjectPtr<FAvatarMappingConfig>> __r;
        return __r;
    }
    void SetBoonAvatarList(const TArray<TDataObjectPtr<FAvatarMappingConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FAvatarMappingConfig>>> local_2;
        this.m_BoonAvatarList = local_2;
        return;
    }
}

struct FTraitParam
{
    UPROPERTY()
    TDataObjectPtr<FTraitConfig> m_Trait;
    UPROPERTY()
    uint m_Level;


    TDataObjectPtr<FTraitConfig> GetTrait() const property
    {
        TDataObjectPtr<FTraitConfig> __r;
        return __r;
    }
    TDataObjectPtr<FTraitConfig> GetTrait() property
    {
        TDataObjectPtr<FTraitConfig> __r;
        return __r;
    }
    void SetTrait(const TDataObjectPtr<FTraitConfig> &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    uint GetLevel() const property
    {
        return this.m_Level;
    }
    void SetLevel(const uint __Value) property
    {
        this.m_Level = __Value;
        return;
    }
}

struct FTraitDepotElemConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    uint DepotId;
    UPROPERTY()
    FTraitParam Param;
    UPROPERTY()
    uint Weight;


}

struct FTestThreeChooseOneTraitConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    TArray<FTraitParam> TraitParams;

    FTestThreeChooseOneTraitConfig()
    {
        return;
    }
}

struct FEquipmentAttributeData
{
    UPROPERTY()
    FGameAttributeRef AttributeClass;
    UPROPERTY()
    TDataObjectPtr<FAttributeConfig> AttributeConfig;
    UPROPERTY()
    EGameAttributeModifyType ModifyType;
    UPROPERTY()
    float32 Value;


}

struct FEquipmentConfig : FInventoryItemConfig
{
    FInventoryItemConfig _base_FInventoryItemConfig;
    UPROPERTY()
    EEquipmentType EquipmentType;
    UPROPERTY()
    int Level = 0;
    UPROPERTY()
    TArray<FEquipmentAttributeData> AttributeDatas;
    UPROPERTY()
    TArray<FTraitParam> DefaultTrait;
    UPROPERTY()
    TArray<uint> TrailDepot;
    UPROPERTY()
    FSoftBrush EquipmentDisplayImage;


    int GetMaxRandomTrait() const
    {
        int local_1 = 0;
        for (auto local_18 : this.TrailDepot)
        {
            local_1 = local_1 + int(local_18);
        }
        return local_1;
    }
}

struct FWeaponConfig : FEquipmentConfig
{
    FEquipmentConfig _base_FEquipmentConfig;
    UPROPERTY()
    EWeaponType WeaponType;
    UPROPERTY()
    FName WeaponShowCaseSocketName;
    UPROPERTY()
    TSoftClassPtr<AECSPrefab> WeaponPrefab;

    default ItemType = EItemType(2);
    default ItemTrunk = ItemCategoryTrunkBindings::Weapon.GetTrunk();
    default ItemCategory = FFilteredGameplayTag(ItemCategoryTrunkBindings::Weapon.GetCategory().ToString(), ItemCategoryTrunkBindings::Weapon.GetCategory());

    FWeaponConfig()
    {
        super();
        this.WeaponType = EWeaponType(0);
        this.__InitDefaults();
        return;
    }
}

struct FTalismanConfig : FEquipmentConfig
{
    FEquipmentConfig _base_FEquipmentConfig;
    UPROPERTY()
    ETalismanType TalismanType;

    default ItemType = EItemType(7);
    default ItemTrunk = ItemCategoryTrunkBindings::Talisman.GetTrunk();
    default ItemCategory = FFilteredGameplayTag(ItemCategoryTrunkBindings::Talisman.GetCategory().ToString(), ItemCategoryTrunkBindings::Talisman.GetCategory());

    FTalismanConfig()
    {
        super();
        this.TalismanType = ETalismanType(0);
        this.__InitDefaults();
        return;
    }
}

struct FEquipmentTraitData
{
    UPROPERTY()
    TDataObjectPtr<FTraitConfig> m_TraitConfig;
    UPROPERTY()
    int m_TraitLevel;


    TDataObjectPtr<FTraitConfig> GetTraitConfig() const property
    {
        TDataObjectPtr<FTraitConfig> __r;
        return __r;
    }
    TDataObjectPtr<FTraitConfig> GetTraitConfig() property
    {
        TDataObjectPtr<FTraitConfig> __r;
        return __r;
    }
    void SetTraitConfig(const TDataObjectPtr<FTraitConfig> &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    int GetTraitLevel() const property
    {
        return this.m_TraitLevel;
    }
    void SetTraitLevel(const int __Value) property
    {
        this.m_TraitLevel = __Value;
        return;
    }
}

struct FEquipmentData
{
    UPROPERTY()
    TDataObjectPtr<FEquipmentConfig> m_EquipmentConfig;
    UPROPERTY()
    TArray<FTraitParam> m_Traits;

    FEquipmentData()
    {
        return;
    }
    TDataObjectPtr<FEquipmentConfig> GetEquipmentConfig() const property
    {
        TDataObjectPtr<FEquipmentConfig> __r;
        return __r;
    }
    TDataObjectPtr<FEquipmentConfig> GetEquipmentConfig() property
    {
        TDataObjectPtr<FEquipmentConfig> __r;
        return __r;
    }
    void SetEquipmentConfig(const TDataObjectPtr<FEquipmentConfig> &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    const TArray<FTraitParam> GetTraits() const property
    {
        const TArray<FTraitParam> __r;
        return __r;
    }
    TArray<FTraitParam> GetTraits() property
    {
        TArray<FTraitParam> __r;
        return __r;
    }
    void SetTraits(const TArray<FTraitParam> &inout __Value) property
    {
        this.m_Traits = __Value;
        return;
    }
}


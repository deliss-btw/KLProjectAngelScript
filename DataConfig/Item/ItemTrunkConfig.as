
enum EItemTrunk
{
    None,
    CombatItem,
    CommonItem,
    ConsumableItem,
    CraftMaterial,
    CookMaterial,
    EquipmentMaterial,
    Weapon,
    Talisman,
    Suit,
    Accessories,
    Mount,
    Other,
}


struct FItemTrunkConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    EItemTrunk Trunk;
    UPROPERTY()
    uint MaxSlotNum;


}


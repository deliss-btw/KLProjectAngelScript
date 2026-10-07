

struct FT_Inventory : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_GameplayInventory_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_GameplayInventory, NAME_None);
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_InventoryInitConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_InventoryInitConfig, NAME_None);
    UPROPERTY()
    FC_InventoryInitConfig Config_FC_InventoryInitConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_ItemQuickSlot_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_ItemQuickSlot, NAME_None);
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_MotionUnlock_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_MotionUnlock, NAME_None);

    FT_Inventory()
    {
        return;
    }
}


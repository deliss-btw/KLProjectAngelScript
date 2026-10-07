

struct FT_Weapon : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_Weapon_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_Weapon, NAME_None);
    UPROPERTY()
    FC_Weapon Config_FC_Weapon;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_WeaponMaterialConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_WeaponMaterialConfig, NAME_None);
    UPROPERTY()
    FC_WeaponMaterialConfig Config_FC_WeaponMaterialConfig;

    FT_Weapon()
    {
        return;
    }
}

